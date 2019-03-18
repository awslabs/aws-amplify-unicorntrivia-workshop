import React, { Component } from 'react';
//import './AnimatedTransition.css';

class Modal extends Component {
	constructor(props){
		super(props);
	}

	render(){
		return(
			<div className={"modal-container " + this.props.class} style={{ backgroundColor: this.props.backgroundColor}}>
				<div data-prevent-distortion>
					{ this.props.children }
				</div>
			</div>
		);
	}

}

export default Modal;