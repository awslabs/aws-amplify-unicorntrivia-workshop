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
			answerChosen: "",
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
		/* CODE GOES HERE */
	}

	askForName = () => {
		/* CODE GOES HERE */
	}

	listenForQuestions = () => {
		/* CODE GOES HERE */
	}

	listenForAnswers = () => {
		/* CODE GOES HERE */
	}

	answerChosen = (index) => {
		/* CODE GOES HERE */
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
		/* CODE GOES HERE */		
	}

	answer = () => {
		/* CODE GOES HERE */		
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