import React, { Component } from 'react';
import { API, graphqlOperation } from 'aws-amplify';
import { print as gqlToString } from 'graphql/language';
import { onCreateQuestion, onUpdateQuestion } from '../../graphql/subscriptions';
import { createAnswer, updateAnswer } from '../../graphql/mutations';
import winner from '../../images/winner.png';
import loser from '../../images/loser.png';
import Video from '../Video';
import Modal from '../Modal';
import styles from './styles';

class Game extends Component {
	constructor(props){
		super(props);
		this.state = {
			modalVisible: false,
			modalBackground: "#FFFFFF",
			question: {},
			answer: {},
			questionAvailable: false,
			answerAvailable: false,
			answerChosen: null,
			selectedAnswerButton: null,
			buttonsDisabled: false,
			questionCount: 0,
			wrongQuestions: [],
			gameOver: false,
			winner: false,
			loser: false,
			username: "",
			id: null,
			maxQuestions: 12
		};
	}

	componentDidMount(){
		this.listenForQuestions();
		this.listenForAnswers();
	}

	setupClient = (username) => {
		API.graphql(
			graphqlOperation(createAnswer, {input: {username: username}})
		).then(((res) => {
			this.setState({
				username: res.data.createAnswer.username,
				id: res.data.createAnswer.id
			});
		}).bind(this)).catch((err) => {
			console.log("err: ", err);
		});
	}

	askForName = () => {
		return(
			<div className="username-prompt-container">
				<div className="username-prompt">
					<div className="username-prompt-header-container">
						<div className="username-prompt-header">Please provide a username</div>
					</div>
					<div className="username-prompt-input-container">
						<input
							className="username-prompt-input"
							placeholder="Provide a username... then press enter"
							onKeyPress={((e) => {
								if(e.key === "Enter" && e.target.value != ""){
									this.setupClient(e.target.value);
								}
							}).bind(this)}
						/>
					</div>
				</div>
			</div>
		);
	}

	listenForQuestions = () => {
		API.graphql(
			graphqlOperation(onCreateQuestion)
		).subscribe({
			next: (((data) => {
				this.setState({
					question: data.value.data,
					answerAvailable: false,
					questionAvailable: true,
					modalVisible: true
				});
			}).bind(this))
		})
	}

	listenForAnswers = () => {
		API.graphql(
			graphqlOperation(onUpdateQuestion)
		).subscribe({
			next: (((data) => {
				this.setState({
					answer: data.value.data,
					answerAvailable: true,
					questionAvailable: false,
					modalVisible: true
				});
			}).bind(this))
		})
	}

	answerChosen = (index) => {
		let answer = this.state.question.onCreateQuestion.answers[index];
		API.graphql(
			graphqlOperation(
				updateAnswer,
				{ input: {
					id: this.state.id,
					answer: [index]
				}}
			)
		).then((res) => {
			console.log("successfully submitted answer");
		}).catch((err) => {
			console.log("err: ", err);
		});
		this.setState({
			questionsAnswered: true,
			selectedAnswerButton: index,
			buttonsDisabled: true,
			answerChosen: {
	 			index: index,
	  			answer: answer
			},
			questionCount: this.state.questionCount + 1
		});
	}

	button = (index, answer) => {
		let self = this;
		let buttonBackgroundColor,
			buttonBorderColor,
			buttonTextColor;
		if(this.state.questionAvailable){
			buttonBackgroundColor = this.state.selectedAnswerButton == index ? "#666666" : "#FFFFFF";
			buttonBorderColor = this.state.selectedAnswerButton == index ? "#666666" : "#CCCCCC";
			buttonTextColor = this.state.selectedAnswerButton == index ? "#FFFFFF" : "#000";

		} else if(this.state.answerAvailable){
			if(answer == this.state.answer.onUpdateQuestion.answers[this.state.answer.onUpdateQuestion.answerId]){
				buttonBackgroundColor = "#02DC2A";
				buttonBorderColor = "#02DC2A";
				buttonTextColor = "#FFFFFF";
			} else {
				buttonBackgroundColor = this.state.answerChosen.index == index ? "#FE0000" : "#FFFFFF";
				buttonBorderColor = this.state.answerChosen.index == index ? "#FE0000" : "#CCCCCC";
				buttonTextColor = this.state.answerChosen.index == index ? "#FFFFFF" : "#000";
			}
		}
		return(
			<li>
				<button
					key={index}	
					disabled={this.state.buttonsDisabled}
					onClick={this.state.questionAvailable ? ((e) => self.answerChosen(index)) : null}
					style={{
						...styles.buttonStyle,
						backgroundColor: buttonBackgroundColor,
						borderColor: buttonBorderColor,
						color: buttonTextColor
					}}
				>{ answer }</button>
			</li>
		);
	}

	answerButtons = () => {
		let self = this;
		if(this.state.questionAvailable){
			return(
				<ul>
					{ this.state.question.onCreateQuestion.answers.map((answer, index) => {
						return self.button(index, answer);
					})}
				</ul>
			);
		} else if(this.state.answerAvailable){
			return(
				<ul>
					{ this.state.answer.onUpdateQuestion.answers.map((answer, index) => {
						return self.button(index, answer);
					})}
				</ul>
			);
		}
	}

	question = () => {
		if(this.state.questionAvailable){
			setTimeout((() => {
				if(this.state.answerChosen == null){
					this.answerChosen(-1);
				}
				this.setState({
					modalVisible: false,
					questionAvailable: false,
					buttonsDisabled: true,
					selectedAnswerButton: null
				});
			}).bind(this), 10000);
			return(
				<div className="question-container">
					<div className="question">
						<div className="question-title-container">
							<div className="question-title">{ this.state.question.onCreateQuestion.question }</div>
						</div>
						<div className="answers-container">
							<div className="answers">
								{ this.answerButtons() }
							</div>	
						</div>
					</div>
				</div>
			);
		}
	}

	answer = () => {
		let self = this;
		if(this.state.answerAvailable){
			setTimeout((()=> {
				let gameOver = this.state.questionCount == this.state.maxQuestions ? true : false;
				let wrongQuestions = this.state.answerChosen.answer !== this.state.answer.onUpdateQuestion.answers[this.state.answer.onUpdateQuestion.answerId] ? [...this.state.wrongQuestions, {question: this.state.answer, answer: this.state.answerChosen.answer}] : [...this.state.wrongQuestions];
				if(gameOver){
					setTimeout(() => {
						self.setState({
							modalVisible: true,
							modalBackground: "transparent"
						})
					}, 2000);
				}
				this.setState({
					modalVisible: false,
					answerAvailable: false,
					buttonsDisabled: false,
					wrongQuestions: wrongQuestions,
					answerChosen: {},
					selectedAnswerButton: null,
					gameOver: gameOver,
					winner: gameOver == true && wrongQuestions.length == 0 ? true : false,
					loser: gameOver == true && wrongQuestions.length > 0 ? true : false
				});
			}).bind(this), 10000);
			return(
				<div className="question-container">
					<div className="question">
						<div className="question-title-container">
							<div className="question-title">{ self.state.answer.onUpdateQuestion.question }</div>
						</div>
						<div className="answers-container">
							<div className="answers">
								{ self.answerButtons() }
							</div>	
						</div>
					</div>
				</div>
			);
		}
	}

	winner = () => {
		return(
			<div className="winner-container">
				<img src={winner} alt="winner"/>	
			</div>
		);
	}

	loser = () => {
		return(
			<div className="loser-container">
				<img src={loser} alt="loser"/>	
			</div>
		);
	}

	game = () => {
		if(this.state.questionAvailable && !this.state.answerAvailable)
			return this.question();
		else if(this.state.answerAvailable && !this.state.questionAvailable)
			return this.answer();
		else if(this.state.gameOver)
			if(this.state.winner)
				return this.winner()
			else if(this.state.loser)
				return this.loser();
	}

	render(){
		if(this.state.username == ""){
			return this.askForName();	
		} else {
			return(
				<div className="game-container">
					<Video />
					<Modal visible={this.state.modalVisible} backgroundColor={this.state.modalBackground}>
						{ this.game() }
					</Modal>
				</div>
			);
		}
	}
}

export default Game;
