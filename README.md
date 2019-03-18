# Unicorn Trivia Workshop - React Native Version

# Configuring your computer

Before we dive into building the React Native Android Client, please download a copy of this branch [here](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/archive/unicorn-trivia-react-native-workshop.zip)

Once you successfully download a copy and unzip its contents, open up a terminal and change directory into that folder to follow along with the instructions below.

## Running React Native Android on Mac

* Install Node and Watchman using [Homebrew](http://brew.sh/)
* Install Intel x86 Atom_64 System Image from the Android Studio SDK menu

Install Node and Watchman using Homebrew using the below commands:

* `brew install node`
* `brew install watchman`

Install the react-native-cli with the node package manager(npm) using the following command:
* `npm install -g react-native-cli`

**Configure the ANDROID_HOME environment variable**
The React Native tools require some environment variables to be set up in order to build apps with native code.

Add the following lines to your $HOME/.bash_profile config file:
```
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```
The last step is to source the file. Run `source $HOME/.bash_profile`

You can make sure it worked by running `echo $PATH`!

## Running React Native Android on Windows

You will need Node, the React Native command line interface, Python2, a JDKm and Android Studio. While you can use any ditor of your choice to develop your app, you will need to install Android Studio in order to set up the necessary tooling to build your React Native app for Android.

**Node, Python2, JDK**

We recomment installing Node and Python2 via Chocolatey, a popular package manager for Windwos.

React Native also requires a recent version of the Java SE Development Kit (JDK), as well as Python 2. Both can be installed using [Chocolatey](https://chocolatey.org/).

Open an Administrator Command Prompt (right click command prompt and select "Run as Administrator"), then run the following command: `choco install  -y nodejs.install python2 jdk8`

**The React Native CLI**

Install the CLI using `npm install -g react-native-cli`

**Configure the ANDROID_HOME environment variable**
The React Native tools require some environment variables to be set up in order to build apps with native code.

Open the System pane under System and Security in the Windows Control Panel, then click on Change settings.... Open the Advanced tab and click on Environment Variables.... Click on New... to create a new ANDROID_HOME user variable that points to the path to your Android SDK:

![otherpic](assets/windows_env_var.png)

The SDK is installed, by default, at the following location:`c:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk`

You can find the actual location of the SDK in the Android Studio "Preferences" dialog, under Appearance & Behavior → System Settings → Android SDK.

Open a new Command Prompt window to ensure the new environment variable is loaded before proceeding to the next step.

# React Native on Android Walkthrough

## Step 1: Preparing the project
1. Run `export JAVA_HOME='/usr/libexec/java_home -v 1.8'` from your terminal to set the Java version needed to run the Android application.
	1. If you are on windows, make sure your Java version is "1.8.0_192". Refer to [this blog](https://blogs.oracle.com/pranav/switch-between-different-jdk-versions-in-windows) post on how to change Java version.
1. Navigate to the root directory of the client branch folder you downloaded earlier.
1. Run`npm install` from the terminal to install dependencies detailed in `package.json`
1. Run `react-native link` from the terminal to link the React Native modules libraries to the project.

## Step 2: Building the Video Component

Now that our environment is all set up we are ready to begin implementing our application! React applications are made up of “Components". Let's begin by creating the Video Player component that will display our video stream on the Android simulator.

Navigate to `./src/components/App/Video/component.js`. The `component.js` file houses the code which defines how we display our livestream on the client device. Our goal for the Video Component is to define the `render` function that will show our component on the screen. In this case, the render function will place our video player over the entire area of the screen. We will connect the video player to our live streaming backend using the Medistore egress URL generated in the previous step. 
1. Paste the following code into the `render` function of the Video Component class.
	```javascript         
	return(
		<ReactNativeVideoPlayer
		    source={{uri: "INSERT_MEDIASTORE_URL"}}
		    ref={(ref) => {
			this.player = ref
		    }}
		    resizeMode={"stretch"}
		    muted={true}
		    style={{
			minWidth: Dimensions.get('window').width + 200,
			minHeight: Dimensions.get('window').height,
			left: -100
		    }}
		/>
	);	    
	```

If you experience performance issues or dropped frames in OBS (Remember there are 100+ other streamers in the room!), you can use paste this URL instead of your own as a failback stream: https://jyxvhwgs4v47q5.data.mediastore.us-west-2.amazonaws.com/p/index.m3u8 

## Step 3: Subscribing to the GraphQL API backend
In this section we will be subscribing our client to the back end GraphQL API hosted in AWS AppSync.

1. Now you need to initialize your client as an Amplify project. Run `amplify init` in your client folder’s root directory and follow the prompts. Remember to choose the correct response for the prompt “Choose the type of app that you're building” based on the client that you are implementing.

1. Next you will need to run `amplify add codegen --apiId <insert app id>`.  This will generate code for your app unique to the project. Follow the prompts below.
    ![Amplify Configure Codegen](.images/AmplifyCodegenConfig.png)

    1. If you forgot to save your apiID from the previous steps, you can always find it in the AWS AppSync console. To do so, navigate to the AppSync dashboard from within your AWS account and click on the name of the API you previously created.
        ![AppSyncConsole](.images/AppsyncConsole.png)

    1. In the "Integrate with your app" section, you should see a command for how to add CodeGen to your existing project, copy and paste this command into the terminal.
        ![getAPIid](.images/getAPIID.png)

 1. When Codegen finishes you should have a `API.swift` file and a `awsconfiguration.json` file in your directory.

1. Navigate to this file `./src/components/App/Game/component.js`
1. Now we are ready to implement our graphql subscriptions. We will be creating two listeners, one listening for new questions and one listening for updated questions.
1. Find the function named `listenForQuestions` and paste in the following code.
	```javascript
	let self = this;
	API.graphql(
		graphqlOperation(onCreateQuestion)
	).subscribe({
		next: (data) => {
			self.setState({
				question: data.value.data,
				answerAvailable: false,
				questionAvailable: true,
				modalVisible: true,
				buttonsDisabled: false
			});
		}
	})
	```
This function creates a GraphQL subscription to the AppSync backend to listen for questions. Once the app recieves a question, it will store the question in the app and it will prompt the user to answer the question in the application.

1. Find the function named `listenForAnswers` and paste in the following code.
	```javascript
	let self = this;
	API.graphql(
		graphqlOperation(onUpdateQuestion)
	).subscribe({
		next: (data) => {
			setTimeout(() => {
				self.setState({
					answer: data.value.data,
					answerAvailable: true,
					questionAvailable: false,
					modalVisible: true
				});
			}, 1000);
		}
	})
	 ```
This function also creates a GraphQL subscription to the AppSync backend to listen for answers. Once the app recieves the answer to the question, it will store the answer in the app and it will prompt the user with the correct answer.

We are now successfully subscribed to our GraphQL backend and our application is listening for new questions and questions being answered!

## Step 4: Populating the question/answer modal

Now that our stream is playing and our subscriptions are set up. The last thing to do is to create the modal which displays the question and choices when a messaged, housing a new question or answer, is received by our listeners. Paste the following function code snippets into the the Game Component's `component.js` file.

1. The first step is to create the view for when a new question is pushed. Paste the following code into the `question` function.

	```javascript
	if(this.state.questionAvailable){
		setTimeout((() => {
			if(this.state.answerChosen == null){
				this.answerChosen(-1);
			}
			this.setState({
				modalVisible: false,
				questionAvailable: false,
				buttonsDisabled: true,
				selectedAnswerButton: null
			});
		}).bind(this), 10000);
		return(
			<View style={styles.questionContainer}>
				<View style={styles.question}>
					<View style={styles.questionTitleContainer}>
						<Text style={styles.questionTitle}>{ this.state.question.onCreateQuestion.question }</Text>
					</View>
					<View style={styles.answerButtonContainer}>
						{ this.answerButtons() }
					</View>
				</View>
			</View>
		);
	}
	```

1. We will then create a similar view. This time for when an answered question is returned to the user displaying the correct and incorrect answer choices. Implement this view by pasting in the following code into the `answer` function.

	```javascript
	let self = this;
	if(this.state.answerAvailable){
	    setTimeout((()=> {
		let gameOver = this.state.questionCount == this.state.maxQuestions ? true : false;
		let wrongQuestions = this.state.answerChosen.answer !== this.state.answer.onUpdateQuestion.answers[this.state.answer.onUpdateQuestion.answerId] ? [...this.state.wrongQuestions, {question: this.state.answer, answer: this.state.answerChosen.answer}] : [...this.state.wrongQuestions];
		if(gameOver){
		    setTimeout(() => {
			self.setState({
			    modalVisible: true,
			    modalBackground: "#FFFFFF"
			}, () => {
			    console.log("final state: ", self.state);
			})
		    }, 2000);
		}
		this.setState({
		    modalVisible: false,
		    answerAvailable: false,
		    buttonsDisabled: false,
		    wrongQuestions: wrongQuestions,
		    answerChosen: {},
		    selectedAnswerButton: null,
		    gameOver: gameOver,
		    winner: gameOver == true && wrongQuestions.length == 0 ? true : false,
		    loser: gameOver == true && wrongQuestions.length > 0 ? true : false
		});
	    }).bind(this), 10000);
	    return(
		<View style={styles.questionContainer}>
		    <View style={styles.question}>
			<View style={styles.questionTitleContainer}>
			    <Text style={styles.questionTitle}>{ this.state.answer.onUpdateQuestion.question }</Text>
			</View>
			<View style={styles.answerButtonContainer}>
			    { this.answerButtons() }
			</View>
		    </View>
		</View>
	    );
	}
	```

1. The last function we need to include is the function that changes our data model when an answer is chosen. Lets call this function answerChosen. This function will also push answers to your AppSync backend. Paste this code into the `answerChosen` function.

	```javascript
	let answer = this.state.question.onCreateQuestion.answers[index];
	API.graphql(
		graphqlOperation(
			updateAnswer,
			{ input: {
				id: this.state.id,
				answer: [index]
			}}
		)
	).then((res) => {
		console.log("successfully submitted answer");
	}).catch((err) => {
		console.log("err: ", err);
	});
	this.setState({
		questionsAnswered: true,
		selectedAnswerButton: index,
		buttonsDisabled: true,
		answerChosen: {
		    index: index,
		    answer: answer
		},
		questionCount: this.state.questionCount + 1
	});
	```
**Well Done!** Now we have configured our application code to push and pull data from our GraphQL API. Let's move on to updating our AWS AppSync resolvers and mutations!

### Step Five: Recording answers

1. In the `./src/components/App/Game/component.js` file we need to now perfom a mutation to add an user to our database.
1. Add this code to the `setupClient` function.
	```javascript
	API.graphql(
		graphqlOperation(createAnswer, {input: {username: username}})
	).then(((res) => {
		this.setState({
			username: res.data.createAnswer.username,
			id: res.data.createAnswer.id
		});
	}).bind(this)).catch((err) => {
		console.log("err: ", err);
	});		
	```
1. Add this code to the `askForName` function.
	```javascript	
	let self = this;
	prompt(
		'Provide a username',
		'Please provide a username for this game',
		[{
			text: 'OK',
			onPress: (input) => { self.setupClient(input)}
		}],{
			type: 'plain-text',
			cancelable: false,
			defaultValue: 'test',
			placeholder: 'placeholder'
	});	
	```
This code is very similiar to what we did in our AdminPanel code. We just created a new User for our AnswersTable.

Now that we are pushing to the cloud we should be able to check our backend table to observe our answers being saved. We can do this by navigating to the [AWS DynamoDB](https://us-west-2.console.aws.amazon.com/dynamodb/home?region=us-west-2) table which was created by amplify. There should be 2 new tables, one named questions and one named answers. Let’s take a peek into the answer table! (Hint! The table names will have a random string appended to the end, it will look something like answers-aejngwek234ngenk)

![Dynamo_db](assets/Dynamodb2.png)

You should now be able to observe our answers being saved, but only one answer is being saved in the array. This seems to be an error. We can fix this though through the AppSync console using a resolver.


1. Open the [AppSync Console](https://console.aws.amazon.com/appsync/home) and navigate to your AppSync endpoint.
1. Once you select your AppSync endpoint on the left side select Schema.
    ![Appsync Schema](assets/Appsync_Schema.png)
1. You now should see your schema that was auto generated for you from Amplify. On the right side you should see a section called Resolvers. Search for `Mutation` in the text box and then select the clickable link next to `updateAnswer(...):Answer`
    ![Appsync Resolver](assets/Appsync_Resolvers.png)
1. You are now presented with a Request Mapping Template and a Response Mapping Template.
    1. We are going to change the Request Mapping Templateto do the appending of the array.
    1. Navigate to `#set( $expression = "SET" )` and look for this line:
        ```vtl
        #set( $expression = "$expression $entry.key = $entry.value" )
        ```
    1. Replace this line with:
        ```vtl
        #if ($util.matches($entry.key, "#answer"))
            #set( $expression = "$expression $entry.key = list_append(if_not_exists($entry.key, :empty_list), $entry.value)" )
            $util.qr($expValues.put(":empty_list", $util.dynamodb.toDynamoDB([])))
        #else
            #set( $expression = "$expression $entry.key = $entry.value" )
        #end
        ```
        This checks to see if the field being set is the answer array. If it is the array then it will append the value. We also do a check to see if the field exists and if it doesn't we create an empty array to append our first value to.
    1. Save the resolver in the top right corner.
1. Run the app again and now you should observe the answers are being correctly appended to the array.


## Step 5: Running the application!

Now that we have every section of the application implemented, it's time to run the app in our emulator.

1. First we want to open up the root path of our project in Android Studio.
1. The next step is to create and launch an Android emulator. We will start by clicking the purple phone icon in the menu bar.
![AndroidLaunchEmu](assets/android_studio_launch_emu.png)
1. Next we will chose the create virtual device button
![AndroidLaunchEmu](assets/android_studio_create_device.png)
1. We need to choose a device compatible with older versions of the API. Lets choose a Nexus 5X device! Then select Next.
![AndroidLaunchEmu](assets/android_studio_choose_device.png)
1. Finally we need the android API Level 27 system image. This should be Android Oreo. If you don't already have it installed go ahead and begin the download (remember to check your drive for available space as these downloads can be fairly large)
1. Now select next and finish to return back to the previous screen. You should see your newely created virtual device. From here choose the green 'Play' button to launch the emulator!
![AndroidLaunchEmu](assets/android_studio_play_device.png)
1. Wait for android to launch and the home screen to appear. Then return to the terminal and navigate back to the root directory of our application.
1. From here run the command `react-native run-android` to launch the application in the emulator

**Congratulations!** You have now successfully implemented a UnicornTrivia application on one of three suported platforms! 
Now Try sending some questions and answers using the admin panel we configured previously.

If you closed the terminal window running the admin panel no problem! Just open a new terminal window and navigate to the admin panel root directory and run `npm start`. Your default browser should now open up the admin panel on localhost:3000!

Now that you have finished implementing the basic app, if have extra time feel free to implement some extra features such as determining winners and customizing questions and answers. [Click here](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/blob/master/documentation/determine_the_winners.md) to move onward or else continue to the clean up section [here](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/blob/master/documentation/wrap_up_doc.md)!

## Troubleshooting Notes

1) if android sdk isnt installing. click file → invalidate cache and restart
