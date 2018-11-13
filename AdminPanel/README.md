# Walkthrough

1. Clone this repo
1. Install amplify? (if we don't get to adding the livestream)
1. `amplify init` -> follow the steps to configure your project
1. `amplify add api`
	1. GraphQL
	1. Name of your api: Make it unique to your project
	1. API Key
	1. N
	1. Y
	1. Single object with fields
	1. Y - This should open your default text editor you configured in the init
	1. Copy this model:
    ```
    type Question @model {
        id: ID!
        question: String!
        answers: [String]!
        answerId: Int
    }

    type Answer @model {
        id: ID!
        username: String!
        answer: [Int]
    }
    ```
	1. Remember to save the file you just edited from the editor it was opened with.
1. `amplify push`
	1. Y
	1. Y - Codegen time!
	1. javascript
	1. leave as default
	1. Y
	1. Wait for the resources to be provisioned. Describe what is being created: DynamoDB and Appsync end point. Go into more detail!
1. `npm install` -> installs your node modules
1. Open App.js in your text editor
1. We will be adding the ability to push questions from the default template now.
1. `npm start` will start the application for you. This should just give you a nice layout of questions that you can push to users but it will not function.
1. Time to add the ablity to push questions
1. Add this code this code to the top of the file:
```
 import {createQuestion, updateQuestion} from './graphql/mutations.js';
 import {onCreateQuestion} from './graphql/subscriptions.js';
 import aws_exports from './aws-exports';
```
1. Add this under all the imports:
`Amplify.configure(aws_exports);`
Explain how this gets the info from the aws-exports.js file and this will be updated

1. Add this code to LOCATION1:
    ```
    const question = {
        input: {
          question: rowData["Question"],
          answers: rowData["Answers"]
        }
      }
    API.graphql(graphqlOperation(createQuestion, question)).then(response => {
          rowData["id"] = response.data.createQuestion.id;
          console.log(response.data.createQuestion);
        });
    ```
    Code deep dive on what this does. It creates a question from the table data in the format of input.
1. Add this code to LOCATION2:
    ```
    const question = {
          input: {
            id: rowData["id"],
            answerId: rowData["Answer"]
          }
        }
    API.graphql(graphqlOperation(updateQuestion, question)).then(response => {
          console.log(response.data.updateQuestion)
        });
    ```
    Talk about how this is different then the createQuestion above. Mainly it requires the ID from the question so that we know which response we need to give.

1. `npm start` and observe we are now pushing questions in the console. We observe the object changing.
# Extra
1. To view subscriptions you can add this at the top of your file:
```
const subscription = API.graphql(
    graphqlOperation(onCreateQuestion)
).subscribe({
    next: (eventData) => console.log('Subscribe:', eventData)
});
```

