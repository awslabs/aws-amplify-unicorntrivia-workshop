![logo](.images/unicorntrivialogo.png)

Welcome to UnicornTrivia, a self-paced workshop that uses AWS AppSync, AWS Amplify, and AWS Elemental Media Services to implement a live trivia app as a native mobile app and for web. This workshop is designed for intermediate developers who are familiar with Amazon Web Services, mobile application development, and comfortable command-line tools.

UnicornTrivia is a Silicon Valley-based, stealth startup building the next big thing in entertainment - a live gameshow app where anyone can tune-in and compete for prize money by answering trivia questions. You've been hired as a lead developer and you need to ship a prototype of the app that they can use to pitch to investors. You've been given complete freedom to build the stack as long as you ship quickly and you've heard of a few new tools, like AWS Appsync, AWS Amplify, and AWS Elemental, that can remove a lot of the heavy lifting in building a mobile apps and video streaming services. This is your adventure in building UnicornTrivia's app.

This workshop is split into three sections outlined below. You will need to build the Live Streaming Service and Administrator Panel, but can choose which client(s) to implement.

**Live Streaming Service** - This service will encode and host a live video stream from a studio environment to the end users playing UnicornTrivia.

**Administrator Panel** - This allows a host to submit questions and collect answers from participants.

**Client** - This allows users to connect to the live stream and answer questions during the show using iOS, Android, and/or a web browser.

## Development Environment

You just started at UnicornTrivia and they hooked you up with a brand new laptop - _sweeeet!_ Now let's configure your development environment. 

1. Download the UnicornTrivia workshop zip [here](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/archive/master.zip) and unzip it
1. Download and install Node and Node Package Manager (NPM) if you don't already have it from [nodejs.org](https://nodejs.org/en/download/)
1. Install AWS Amplify CLI using this command `npm install -g @aws-amplify/cli`
1. Install a custom AWS Amplify CLI livestream plugin by running `npm install amplify-category-video -g`
1. Download and install Open Broadcaster Software (OBS) from [obsproject.com](https://obsproject.com/download)

## Let's Begin Implementing!

To start we will be configuring our live streaming back end. [Click here](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/blob/master/documentation/Live_stream_doc.md) to begin!



## License

This library is licensed under the Apache 2.0 License.
