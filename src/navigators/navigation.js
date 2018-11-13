import React from 'react';
import { createStackNavigator } from 'react-navigation';
import { Easing, Animated } from 'react-native';

// Screens
import GameScreen from '../screens/App/Game';

export default createStackNavigator({
	Game: {
		screen: GameScreen,
		navigationOptions: {
			header: null
		}
	}
},{
	headerMode: 'none',
	initialRouteName: 'Game',
	navigationOptions: {
		gesturesEnabled: false	
	},
	transitionConfig: () => ({
		transitionSpec: {
			duration: 500,
			easing: Easing.out(Easing.poly(4)),
			timing: Animated.timing,
		},
		screenInterpolator: (sceneProps) => {
			const { layout, position, scene } = sceneProps;
			const { index } = scene;

			const height = layout.initHeight;
			const translateY = position.interpolate({
				inputRange: [index - 1, index, index + 1],
				outputRange: [height, 0, 0]
			});
			const opacity = position.interpolate({
				inputRange: [index - 1, index - 0.99, index],
				outputRange: [0, 1, 1]
			});
			return { opacity, transform: [{ translateY }] };
		}
	})
});