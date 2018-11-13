import React, { Component } from 'react';

class Modal extends Component {
	constructor(props){
		super(props);
		this.state = {
			modalBottom: -320,
			modalClosed: true,
			modalAnimationInProgress: false,
			id: null
		};
	}

	animateTo = (position) => {
		if((this.state.modalBottom <= position && !this.state.modalClosed) ||
			(this.state.modalBottom >= position && this.state.modalClosed)){
			this.setState({
				modalClosed: !this.state.modalClosed,
				modalAnimationInProgress: false
			});
			clearInterval(this.state.aTo);
		} else {
			this.setState({
				modalBottom: this.state.modalClosed ? (this.state.modalBottom + 20) : (this.state.modalBottom - 20)
			});
		}
	}

	toggleModal = (state) => {
		let self = this;
		if(this.state.modalAnimationInProgress){
			return
		}
		this.setState({
			aTo: setInterval((() => {
				this.animateTo(state == "open" ? 0 : -320);
			}).bind(this), 5),
			modalAnimationInProgress: true
		});

	}

	openModal = () => {
		this.toggleModal("open");	
	}

	closeModal = () => {
		this.toggleModal("close");
	}
	
	componentDidUpdate(prevProps, prevState) {
		if(this.props.visible && !prevProps.visible) {
			this.openModal();
		} else if(!this.props.visible && prevProps.visible) {
			this.closeModal();
		}
	}

	render(){
		return(
			<div className="modal-container" style={{bottom: this.state.modalBottom, backgroundColor: this.props.backgroundColor}}>
				{ this.props.children }
			</div>
		);
	}

}

export default Modal;