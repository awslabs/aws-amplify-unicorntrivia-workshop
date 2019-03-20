# Unicorn Trivia Workshop - iOS Version

### Configuring your computer.
Before doing this workshop please install these required programs

1. Download and install Xcode from the [AppStore](http://appstore.com/mac/apple/xcode)
1. Install Pods using this command `sudo gem install cocoapods`, if you have pods installed then run `pods update`
1. Download this zip file [here](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/archive/unicorn-trivia-ios-workshop.zip)

## iOS Walkthrough

### Step One: Configuring your Xcode Enviroment
1. Unzip the file you downloaded and then open a terminal and navigate into `UnicornTrivia` 
1. Run `pod install` to install required SDKs for the application.
1. Open the UnicornTrivia.xcworkspace that was generated
1. Click `UnicornTrivia` and change the bundle identifier to `yourname.unicorntriva` and make sure that the Team section is set to None. Should look something like this:
    ![Xcode Project Configure](.images/XcodeConfigureProject.png)
1. Change your simulator from iPhone XR to iPhone 8 - **This is important for older computers**

1. Now you need to initialize our client as an Amplify project. Run `amplify init` in your client folder’s root directory and follow the prompts as shown below.
    ![Amplify init](.images/Amplify_init_ios.png)

1. Next you will need to run `amplify add codegen --apiId <insert app id>`.  This will generate code for your app unique to the project. Follow the prompts below.
    ![Amplify Configure Codegen](.images/AmplifyCodegenConfig.png)

    1. If you forgot to save your apiID from the previous steps, you can always find it in the AWS AppSync console. To do so, navigate to the AppSync dashboard from within your AWS account and click on the name of the API you previously created.
        ![AppSyncConsole](.images/AppsyncConsole.png)

    1. In the "Integrate with your app" section, you should see a command for how to add CodeGen to your existing project, copy and paste this command into the terminal.
        ![getAPIid](.images/getAPIID.png)

 1. When Codegen finishes you should have a `API.swift` file and a `awsconfiguration.json` file in your directory.
    
1. Back in Xcode, Navigate to `File->Add files to "Unicorn Trivia"`. Then select the `API.swift` and `awsconfiguration.json` files to add to your project and make sure the radio `Copy items if needed` is selected. It should looks something like this:
    ![CopyFilesIn](.images/CopyFilesIn.png)
1. Now your project has been configured.
1. **Note:** When compiling the app you will see warnings. This is normal for this project.

### Step Two: Displaying your HLS Stream
1. If you lost your egress url from the `amplify video` setup then you can run `amplify video get-info` again to get the MediaStore url. It should look something like this: `url`
1. Navigate to UnicornTrivia/ViewController.swift in Xcode. Then, insert this code below in the `func playVideoEmbedded()` area and replace the `INSERT_URL_HERE` with your egress url:
    ```swift
    guard let url = URL(string: "INSERT_URL_HERE") else {
        return
    }
    self.addVideoPlayer(videoUrl: url, to: self.playerView)
    ```
    This code block setups up the URL that will be iOS native player called AVPlayer. AVPlayer plays HLS streams natively. To see how the AVPlayer is configured checkout out the function `addVideoPlayer` as it setups up the frame of the video player, sets the aspect ratio, and removes the controls from video.
1. Go head and run your project and observe you now have a running mobile app with your live-stream all setup.

If you experience performance issues or dropped frames in OBS (Remember there are 100+ other streamers in the room!), you can use paste this URL instead of your own as a failback stream: https://jyxvhwgs4v47q5.data.mediastore.us-west-2.amazonaws.com/p/index.m3u8 

### Step Three: Show Questions to the player
1. First we will need to setup our client to point to the correct GraphQL endpoint. So navigate to UnicornTrivia/AppDelegate.swift in Xcode.
1. At the top of the file we first need to import AppSync's SDK so copy and paste this line right under `import UIKit`
    ```swift
    import AWSAppSync
    ```
1. Next we need to create a AppSync client variable so that way we can use it throughout the application. Under `var window: UIWindow?` put `var appSyncClient:AWSAppSyncClient?`.
1. Now we get to configure the client variable. Find `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool` and paste in this code (you can replace everything in the function with this code):
    ```swift
    do {
        let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncClientInfo: AWSAppSyncClientInfo())
        // initialize the AppSync client configuration configuration
        // initialize app sync client
        appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
        
    } catch {
        print("Error initializing AppSync client. \(error)")
    }

    return true;
    ```
    This code configures our AppSync client from the `awsconfiguration.json` file we copied into the project earlier.
1. Now that we have a configured AppSync client we need to now subscribe to our onQuestionsCreate that our AdminPanel is pushing out.
1. Navigate to UnicornTrivia/ViewController.swift in Xcode
1. Like before we need to copy `import AWSAppSync` to the top of the file.
1. Next we need to create some variables to store our AppSync subscription watchers and our AppSync Client for easy access. Copy these two lines right under `var player: AVPlayer!`
    ```swift
    var appSyncClient: AWSAppSyncClient?
    var newQuestionSubWatcher: AWSAppSyncSubscriptionWatcher<OnCreateQuestionSubscription>?
    ```
1. Now in `override func viewDidLoad()` in the file UnicornTrivia/ViewController.swift copy in:
    ```swift
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appSyncClient = appDelegate.appSyncClient
    ```
    This will make accessing the AppSync client we created earlier a lot easier.
1. Now navigate to `func startSubForQuestions()` and copy this in:
    ```swift
    let subscriptionRequest = OnCreateQuestionSubscription()
    do {
        newQuestionSubWatcher = try appSyncClient?.subscribe(subscription: subscriptionRequest, resultHandler: { (result, transaction, error) in
            let question = result?.data?.onCreateQuestion?.question
            let answers = result?.data?.onCreateQuestion?.answers as! [String]?
            if ((question != nil) && answers?.count == 3){
                self.questionView.updateView(question: question, answers:answers)
            } else {
                print("%@", error)
            }
            self.view.layoutIfNeeded()
            self.animateAfterQuestionReturn()
        })

    } catch {
        print("Subscribe error")
    }
    ```
    Breaking this down there are a few components that are good to know.
    1. `let subscriptionRequest = OnCreateQuestionSubscription()` creates a new request variable to our AppSync endpoint that includes what data should be returned. This function is defined in our generated code from `API.swift`
    1. `newQuestionSubWatcher = try appSyncClient?.subscribe` this line creates a new object called `Cancelable` this allows you to cancel your subscription anytime. This is an async call to our AppSync API endpoint to it will need a callback function to return the data to.
    1. The other lines in the callback function read through the data returned and cause an animation to be kicked off to show the question to the user.
1. Congrats. You now should be able to send trivia questions to your users. Please do note that you can only send one question before needing to restart the app. This is because we start the subscribe for anwers and cancel the sub

### Step Four: Show correct answers to the player
1. This is very similiar to what we did in the show Questions section of our app. Except instead of subscribing to `OnCreateQuestion` we instead subscribe to `OnUpdateQuestion`
1. Copy `var updateQuestionSubWatcher: AWSAppSyncSubscriptionWatcher<OnUpdateQuestionSubscription>?` right under our other subscription variable `var newQuestionSubWatcher` so it should look like:
    ```swift
    var appSyncClient: AWSAppSyncClient?
    var newQuestionSubWatcher: AWSAppSyncSubscriptionWatcher<OnCreateQuestionSubscription>?
    var updateQuestionSubWatcher: AWSAppSyncSubscriptionWatcher<OnUpdateQuestionSubscription>?
    ```
1. Next add this code to `func startSubForAnswers()`. This code should look very familiar to what we did in Step Three with the questions.
    ```swift
    let subscriptionRequest2 = OnUpdateQuestionSubscription()
    do {
        
        updateQuestionSubWatcher = try appSyncClient?.subscribe(subscription: subscriptionRequest2, resultHandler: { (result, transaction, error) in
            self.questionView.showAnswer(correctAnswer: (result?.data?.onUpdateQuestion?.answerId)!)
            self.animateAfterAnswerReturn()
        })

    } catch {
        print("Subscribe error")
    }
    ```
    If you run your app again you will now observe that you can send questions and answers to users and actually can win the game. Though no answers were sent to the cloud so we wouldn't be able to verify that the user won the game.

### Step Five: Recording answers
1. Still in the `ViewController.swift` file we need to now perfom a mutation to add a user to our database.
1. Add this code to `func setupUser(username: String)` to start creating users.
    ```swift
    appSyncClient?.perform(mutation: CreateAnswerMutation(input: CreateAnswerInput(username: username)), queue: DispatchQueue.main, optimisticUpdate: nil, conflictResolutionBlock: nil, resultHandler: { (result, error) in
        
        self.questionView.setupClient(appSyncClient: self.appSyncClient!, userID: (result?.data?.createAnswer?.id)!)

    })
    ```
    This code is very similiar to what we did in our AdminPanel code. We just created a new User for our AnswersTable.
1. Now navigate to `UnicornTrivia/QuestionView.swift` in Xcode.
1. Once again add `import AWSAppSync` to the top of the file.
1. We need to configure our client and variables again so under `private var showTimer: Bool!` paste in:
    ```swift
    private var graphqlClient : AWSAppSyncClient!
    private var yourID : GraphQLID!

    func setupClient(appSyncClient: AWSAppSyncClient, userID: GraphQLID){
        graphqlClient = appSyncClient
        yourID = userID
    }
    ```
    This will enable passing of the AppSync configuration and also the user id to the view.
1. Finally we now need to send the answer up to the cloud. To do this we need to add this code to `func sendAnswer()`
    ```swift
    graphqlClient?.perform(mutation: UpdateAnswerMutation(input: UpdateAnswerInput(id: yourID, answer: [yourAnswer])))
    ```
1. Now that we are pushing to the cloud we should be able to check our backend table to observe our answers being saved. We can do this by navigating to the [AWS DynamoDB](https://us-west-2.console.aws.amazon.com/dynamodb/home?region=us-west-2) table which was created by amplify. There should be 2 new tables, one named questions and one named answers. Let’s take a peek into the answer table! (Hint! The table names will have a random string appended to the end, it will look something like answers-aejngwek234ngenk)

![Dynamo_db](.images/Dynamodb2.png)

You should now be able to observe our answers being saved, but only one answer is being saved in the array. This seems to be an error. We can fix this though through the AppSync console using a resolver.

1. Open the [AppSync Console](https://console.aws.amazon.com/appsync/home) and navigate to your AppSync endpoint.
1. Once you select your AppSync endpoint on the left side select Schema.
    ![Appsync Schema](.images/Appsync_Schema.png)
1. You now should see your schema that was auto generated for you from Amplify. On the right side you should see a section called Resolvers. Search for `Mutation` in the text box and then select the clickable link next to `updateAnswer(...):Answer`
    ![Appsync Resolver](.images/Appsync_Resolvers.png)
1. You are now presented with a Request Mapping Template and a Response Mapping Template.
    1. We are going to change the Request Mapping Template to do the appending of the array.
    1. Navigate/search for `#set( $expression = "SET" )` and look for this line (should be near line 42):
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


# Wrap up

Congratulations! You've successfully implemented a prototype of UnicornTrivia and secured one. billion. dollars. in seed funding. Continue to the clean up section [here](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/blob/master/documentation/wrap_up_doc.md)!

# Extra Credit

Now that you have finished implementing the basic app, if have extra time feel free to try these extra features
* [Determine Winners](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/blob/master/documentation/determine_the_winners.md) 
* [Add customized questions](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/blob/master/documentation/customizing_questions_doc.md) 
