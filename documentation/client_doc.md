## Client

The next step in getting your prototype working is to create the clients. The clients will subscribe to the questions and answers being sent from the Admin Panel and submit answers back. Since you don't want to write any extra code we'll leverage Amplify's built in codegen functionality. Codegen can easily update the clients without having to write extra code. On top of codegen you will also use the Amplify SDK.

This SDK does the heavy lifting for the apps including: authentication, graphql transformations and subscriptions, offline capabilities and much more. When it came to write the code we choose three different clients to develop for - React, iOS and React-Native. React and React-native can reach the most amount of users devices by default and iOS native development will enable us to  engage the user base surrounding the iOS App Store. Select which client your interested in building from the three options below:

[Web](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/tree/unicorn-trivia-web-workshop) - Based on React

[iOS](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/tree/unicorn-trivia-ios-workshop) - Based on Swift, requires XCode and Cocoapods

[Android](https://github.com/awslabs/aws-amplify-unicorntrivia-workshop/tree/unicorn-trivia-react-native-workshop) - Based on React Native, requires Android Studio **Alpha: You may encounter bugs. Proceed if you are a skilled react native developer**
