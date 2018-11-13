import React from 'react';
import { StyleSheet } from 'react-native';

const styles = StyleSheet.create({
	questionContainer: {
		position: "absolute",
		top: 0,
		left: 0,
		right: 0,
		bottom: 0,
		width: "100%",
		height: "100%",
		zIndex: 3
	},
	question: {
		position: "relative",
		flex: 1,
		paddingLeft: 25,
		paddingRight: 25,
		paddingTop: 15,
		paddingBottom: 15,
		width: "100%",
		height: "100%",
		flexDirection: 'column',
    	alignItems: 'center',
	},
	questionTitleContainer: {
		position: "relative",
		flexDirection: 'row',
		flexWrap: 'wrap',
		marginTop: 30,
	},
	questionTitle: {
		flex: 1,
		position: "relative",
		fontSize: 24,
		fontWeight: "700",
		textAlign: "center"
	},
	answerButtonContainer: {
		width: "100%",
		marginTop: 20,
		paddingLeft: 10,
		paddingRight: 10
	},
	answerButton: {
		borderRadius: 25,
		borderColor: "#ccc",
		borderWidth: 2,
		width: "100%",
		height: 35,
		paddingTop: 5,
		paddingBottom: 5,
		marginBottom: 10
	},
	answerButtonText: {
		textAlign: "center",
		fontWeight: "400",
		fontSize: 18
	}
});

export default styles;