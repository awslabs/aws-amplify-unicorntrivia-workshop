import React from 'react';
import { Dimensions, StyleSheet } from 'react-native';

const styles = StyleSheet.create({
	modal: {
		position: "absolute",
		borderRadius: 22.5,
		bottom: 30,
		left: 30,
		right: 30,
		minHeight: 315,
		width: Dimensions.get('window').width - 60,
		backgroundColor: "white"
	}
});

export default styles;
