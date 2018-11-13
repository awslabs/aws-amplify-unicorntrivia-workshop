import React, { Component } from 'react';
import { Dimensions, View } from 'react-native';
import { AnimatedSVGPath } from 'react-native-svg-animations';


// Credit to https://stackoverflow.com/a/16360660 for the implementation of Color Interpolation
class Color {
	constructor(color){
		this.r = color.r;
		this.g = color.g;
		this.b = color.b;
	}

	formatToRgb = () => {
		return `rgb(${this.r},${this.g},${this.b})`;
	}
}

class ColorInterpolator {
	constructor(){
		this.colors = [];
	}

	registerColor = (color) => {
		this.colors.push(color);		
	}

	generateColor = (left, right, percentage) => {
		let color = {};
		let values = ["r", "g", "b"];
		for (let i in values) {
			v = values[i];
			color[v] = Math.round(left[v] + (right[v] - left[v]) * percentage / 100);
		}
		return (new Color(color)).formatToRgb();
	}

	interpolate = (callback) => {
		let self = this;
		let i = 0;
		let interval = 100;
		let interpolation = setInterval(() => {
			if(i > 100){
				clearInterval(interpolation);
			}
			let left, right, percentage;
			if(i < 50){
				left = self.colors[0];
				right = self.colors[1];
				percentage = i * 2;
			} else {
				left = self.colors[1];
				right = self.colors[2];
				percentage = (i - 50) * 2;
			}
			callback(this.generateColor(left, right, percentage));
			++i;
		}, interval);
	}
}

class Timer extends Component {
	constructor(){
		super();
		this.state = {
			width: Dimensions.get('window').width - 60,
			height: 315,
			duration: 10000,
			strokeWidth: 15,
			questionAvailable: false,
			modalVisible: true,
			points: {},
			colorInterpolator: new ColorInterpolator(),
			colors: [{
				r: 57, g: 234, b: 0
			},{
				r: 252, g: 176, b: 19
			},{
				r: 254, g: 0, b: 0
			}],
			color: null
		};
		this.state.points = {
			topRightCornerArch: "15,15 0 0 1 15,15",
			bottomRightCornerArch: "15,15 0 0 1 -15,15",
			bottomLeftCornerArch: "15,15 0 0 1 -15,-15",
			topLeftCornerArch: "15,15 0 0 1 15,-15",
			startX: (this.state.width/2),
			startY: 7.5,
			topRightHalf: (this.state.width/2-22.5),
			rightSide: (this.state.height-40),
			bottomSide: (-(this.state.width-45)),
			leftSide: (-(this.state.height-40))
		};
	}

	registerColors = () => {
		for(let i in this.state.colors){
			this.state.colorInterpolator.registerColor(new Color(this.state.colors[i]));
		}
	}

	componentDidMount(){
		this.registerColors();
		this.state.colorInterpolator.interpolate(((color) => {
			this.setState({color: color});
		}).bind(this));
	}

	render(){
		return(
			<View style={{width: "100%", height: "100%", zIndex: 2}}>
				<AnimatedSVGPath
					strokeColor={this.state.color}
					duration={this.state.duration}
					strokeWidth={this.state.strokeWidth}
					height={this.state.height}
					width={this.state.width}
					scale={1}
					delay={150}
					fill={'rgba(0,0,0,0)'}
					d={`
						M${this.state.points.startX} ${this.state.points.startY}
						h${this.state.points.topRightHalf}
						a${this.state.points.topRightCornerArch}
						v${this.state.points.rightSide}
						a${this.state.points.bottomRightCornerArch}
						h${this.state.points.bottomSide}
						a${this.state.points.bottomLeftCornerArch}
						v${this.state.points.leftSide}
						a${this.state.points.topLeftCornerArch}
						z
					`}
					loop={false}
				/>
			</View>
		);
	}
}

export default Timer;