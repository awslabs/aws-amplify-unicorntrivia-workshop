import React, { Component } from 'react';
import {
	View,
	StatusBar,
	StyleSheet
} from 'react-native';

export default class StatusBarContainer extends Component {
	render(){
		return(
			<View style={{...styles.statusBar, ...this.props}}>
				<StatusBar barStyle={this.props.barStyle}/>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	statusBar: {
		height: 20,
		backgroundColor: 'transparent'
	}
});
