import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import './styles/app.sass';

import Amplify from 'aws-amplify';
import aws_exports from './aws-exports';
Amplify.configure(aws_exports);

ReactDOM.render(
	<App />,
	document.getElementById('app')
);

module.hot.accept();
