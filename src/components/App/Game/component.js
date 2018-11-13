import React, { Component } from 'react';
import { Alert, Image, Platform, View, TouchableOpacity, Text } from 'react-native';
// Amplify and GraphQL
import { API, graphqlOperation } from "aws-amplify";
import { print as gqlToString } from 'graphql/language';
import { onCreateQuestion, onUpdateQuestion } from '../../../graphql/subscriptions';
import { createAnswer, updateAnswer } from '../../../graphql/mutations';
// UI Components
import ViewContainer from '../../Common/ViewContainer';
import Video from '../Video';
import Modal from '../Modal';
import Timer from '../Timer';
import styles from './styles';

import prompt from 'react-native-prompt-android';

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
			id: "",
			maxQuestions: 12
		};
	}

	componentDidMount(){
		this.askForName();
		this.listenForQuestions();
		this.listenForAnswers();
	}

	setupClient = (username) => {
		/* Code goes here */		
	}

	askForName = () => {
		/* Code goes here */		
	}

	listenForQuestions = () => {
		/* Code goes here */		
	}

	listenForAnswers = () => {
		/* Code goes here */		
	}
	
	answerChosen = (index) => {
		/* Code goes here */		
	}
	
	button = (index, value) => {
		let self = this;
		let touchableOpacityBackgroundColor,
			touchableOpacityBorderColor,
			textColor;
		if(this.state.questionAvailable){
			touchableOpacityBackgroundColor = this.state.selectedAnswerButton == index ? "#666666" : "#FFFFFF";
			touchableOpacityBorderColor = this.state.selectedAnswerButton == index ? "#666666" : "#CCCCCC";
			textColor = this.state.selectedAnswerButton == index ? "#FFFFFF" : "#000";

		} else if(this.state.answerAvailable){
			if(value == this.state.answer.onUpdateQuestion.answers[this.state.answer.onUpdateQuestion.answerId]){
				touchableOpacityBackgroundColor = "#02DC2A";
				touchableOpacityBorderColor = "#02DC2A";
				textColor = "#FFFFFF";
			} else {
				touchableOpacityBackgroundColor = this.state.answerChosen.index == index ? "#FE0000" : "#FFFFFF";
				touchableOpacityBorderColor = this.state.answerChosen.index == index ? "#FE0000" : "#CCCCCC";
				textColor = this.state.answerChosen.index == index ? "#FFFFFF" : "#000";
			}
		}
		return(
			<TouchableOpacity
				key={index}
				disabled={this.state.buttonsDisabled}
				onPress={this.state.questionAvailable ? ((e) => self.answerChosen(index)) : null}
				style={{
					...styles.answerButton,
					backgroundColor: touchableOpacityBackgroundColor,
					borderColor: touchableOpacityBorderColor
				}}
			>
				<Text
					key={index}
					style={{
						...styles.answerButtonText,
						color: textColor
					}}
				>{ value }</Text>
			</TouchableOpacity>
		);
	}

	answerButtons = () => {
		let self = this;
		if(this.state.questionAvailable){
			return this.state.question.onCreateQuestion.answers.map((value, index) => {
				return self.button(index, value);
			})
		} else if(this.state.answerAvailable){
			return this.state.answer.onUpdateQuestion.answers.map((value, index) => {
				return self.button(index, value);
			})
		}
	}

	question = () => {
		/* Code goes here */		
	}

	answer = () => {
		/* Code goes here */		
	}

	winner = () => {
		return(
			<Image source={require('../../../../assets/winner.png')} style={{width: "100%", height: "100%"}} />
		);	
	}

	loser = () => {
		return(
			<Image source={require('../../../../assets/loser.png')} style={{width: "100%", height: "100%"}} />
		);
	}

	game = () => {
		if(this.state.questionAvailable && !this.state.answerAvailable)
			return(
				<View style={{width: "100%", height: "100%", zIndex: 2}}>
					{ Platform.OS === 'ios' ? <Timer /> : null }
					{this.question()}
				</View>
			);
		else if(this.state.answerAvailable && !this.state.questionAvailable)
			return(
				<View style={{width: "100%", height: "100%", zIndex: 2}}>
					{this.answer()}
				</View>
			);
		else if(this.state.gameOver)
			if(this.state.winner)
				return(
					<View style={{width: "100%", height: "100%", zIndex: 2}}>
						{this.winner()}
					</View>
				);
			else if(this.state.loser)
				return(
					<View style={{width: "100%", height: "100%", zIndex: 2}}>
						{this.loser()}
					</View>
				);
	}

	render(){
		return(
			<ViewContainer>
				<Video />
				<Modal visible={this.state.modalVisible} transparent={true} style={{backgroundColor: this.state.modalBackground}}>
					<View style={{overflow: 'visible', width:"100%", height: "100%", zIndex: 1}}>
						{this.game()}
					</View>
				</Modal>
			</ViewContainer>
		);
	}
}

export default Game;
