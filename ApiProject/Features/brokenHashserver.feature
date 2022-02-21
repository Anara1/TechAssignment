Feature: Test Broken Hashserver Endpoints 
The app has to be ran on port 8088


Scenario: POST should accept a password returns 200
Given a unique <passwordValue>
When POST api endpoint is called
Then hashCount number  is returned 
And response code is 200
When GET encoded password enpoint is called with the corresponding hashCount 
Then encoded password value is returned
Examples:
|key | passwordValue| 
|password| angrymonkey| 


Scenario: Same password value returns the same encoded password
Given a unique <passwordValue>
When POST api endpoint is called
Then hashCount number is returned 
And response code is 200
When POST api endpoint is called
Then hashCount number is returned 
When GET encoded password enpoint is called with the corresponding hashCount 
Then encoded passwords from both posts are identical
Examples:
    | passwordValue| 
    | angrymonkey| 

Scenario: POST api endpoint is called without data returns  400
Given no data
When POST api endpoint is called
Then response code is 400
And Malformed input message is visible

Scenario: POST api endpoint is called with wrong datatype
Given a unique password as plain text
When POST api endpoint is called
Then response code is 400
And Malformed input message is visible

Scenario: Validate JSON key values
Given a unique <password> and <passwordValue>
When POST api endpoint is called
Then response code is 400
#the JSON input values should be validated
Examples:
    |password| passwordValue| 
    |p| angrymonkey| 


Scenario: POST api endpoint is called with wrong datatype
Given a unique password as plain text
When POST api endpoint is called
Then response code is 400
And Malformed input message is visible

Scenario: GET hash job identifier endpoint without hash number returns 400
Given no job identified
When GET hash job identifier endpoint is called 
Then response code is 400

Scenario: GET hash identified endpoint with invalid identifier
Given an invalid <identifier>
When GET hash job identifier endpoint is called 
Then response code is 400
And Invalid syntax message is displayed
Examples:
|identifier|
|k|

Scenario: GET hash identified endpoint with invalid number
Given an invalid <identifier>
When GET hash job identifier endpoint is called 
Then response code is 400
And Hash not found message is displayed
Examples:
|identifier|
|112|


Scenario: GET stats endpoint returns 200 with existing hashes
Given a unique <passwordValue>
When POST api endpoint is called
Then hashCount number is returned 
And response code is 200
When GET stats endpoint is called
Then Response code is 200
Examples:
|key | passwordValue| 
|password| angrymonkey|


Scenario: GET stats endpoint returns 200 without existing hashes
When GET stats endpoint is called
Then Response code is 200
Then number of requests 0  and timing 0 is returned

Scenario: Post shutdown while other request is running
Given a unique <passwordValue>
When POST api endpoint is called
And POST shutdown is initiated
Then response code is 200
But hashCount number is returned 
When GET stats endpoint is called
Then connection could not be established









