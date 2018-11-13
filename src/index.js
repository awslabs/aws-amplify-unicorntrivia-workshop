import React, { Component } from 'react';
import App from './screens';
import Amplify from 'aws-amplify';
import aws_exports from './aws-exports';

Amplify.configure(aws_exports);

export default App;
