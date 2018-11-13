import React, { Component } from 'react';
import { Dimensions } from 'react-native';
import ReactNativeVideoPlayer from 'react-native-video';

class Video extends Component {
	constructor(props){
		super(props);
		this.state = {
			dimensions: Dimensions.get('window'),
			styles: {
				height: null,
				width: null
			}
		};
	}

	setVideoDimensions = () => {
		this.setState({
			styles: {
				...this.state.styles,
				height: this.state.dimensions.scale * this.state.dimensions.width,
				width: this.state.dimensions.scale * this.state.dimensions.height
			}
		});
	}

	componentDidMount(){
		this.setVideoDimensions();
	}

	render(){
		/* Code goes here */	
	}
}

export default Video;
