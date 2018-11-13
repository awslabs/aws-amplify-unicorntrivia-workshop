import React, { Component } from 'react';
import { View, StyleSheet } from 'react-native';

export default class ViewContainer extends Component {
	render(){
		return(
			<View style={{
				...styles.viewContainer,
				...this.props
			}}>
				{ this.props.children }
			</View>
		);
	}
}

const styles = StyleSheet.create({
	viewContainer: {
		flex: 1,
		justifyContent: "flex-start",
		flexDirection: "column",
		alignItems: "stretch",
		backgroundColor: "white"
	}
});
