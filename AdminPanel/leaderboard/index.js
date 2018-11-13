var AWS = require('aws-sdk');
const aws_mobile  = require ('../amplify/backend/amplify-meta');
const questions = require ('../src/questions')
AWS.config.update({region:aws_mobile.providers.awscloudformation.Region});

var dynamodb = new AWS.DynamoDB();

var params = {
    TableName: "INSERT_TABLE_NAME"
   };
   
var answer = questions.Questions.reduce(
function(accumulator, currentValue, currentIndex) {
        return accumulator.concat(currentValue.Answer);
    },
    []
);

dynamodb.scan(params, function(err, data) {
    if (err){
        console.log(err, err.stack);
    } else {
        var leaderboard = []
        data.Items.find(function(element){
            if (element.answer == undefined){
                //console.log(element.username.S,' - Did Not Participate');

            } else {
                var flattened = element.answer.L.reduce(
                    function(accumulator, currentValue, currentIndex) {
                        if (answer[currentIndex] == currentValue.N){
                            return accumulator + 1;
                        } else {
                            return accumulator;
                        }
                    },
                    0
                );

                var person = {
                    'name': element.username.S,
                    'correct' : flattened
                }
                leaderboard.push(person)
                
            }
        });
        leaderboard.sort( function(a, b){
            return b.correct - a.correct;   
        });
        console.log(leaderboard);
    }
});