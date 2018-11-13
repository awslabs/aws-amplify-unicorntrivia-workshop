import React, { Component } from 'react';
import { Modal, View } from 'react-native';
import ViewContainer from '../../Common/ViewContainer';
import styles from './styles';

class ModalContainer extends Component {
	render(){
		return(
			<ViewContainer>
				<Modal
					animationType="slide"
					transparent={this.props.transparent}
					visible={this.props.visible}
					onRequestClose={() => { this.visibleModal(false); } }
				>
					<View style={{...styles.modal, ...this.props.style}}>
						{ this.props.children }
					</View>
				</Modal>
			</ViewContainer>
		);
	}
}

export default ModalContainer;