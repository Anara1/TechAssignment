
Background: Given user navigates to google search page
Given user navigates to google search page
Then search box is displayed
When User clicks on search box

Scenario: Verify Google home page elements are present and clickable
Then Verify the searchbar is clickable
And Verify Google Logo is displayed
And Verify About link is present and clickable
And Verify Store link is present and clickable
And Verify Gmail link is present and clickable
And Verify Images link is present and clickable
And Verify Google Apps bar is present
And Verify Sign In Button is present
And Verify Advertising Link is present and clickable
And Verify Images link is present and clickable 
And Verify Business Link is present and clickable
And Verify How Search Works link is present and clickable
And Verify Carbon Neutral link is present and clickable
And Verify Privacy link is present and clickable
And Verify Terms link is present and clickable
And Verify Settings link is present and clickable






Scenario: User searches for Ducks in google happy path
When inputs a <searchWord>
And clicks on search button
Then first result should contain <searchWord>
And first result contains a link header and description
When User clicks on first result link
Then User is redirected to a webpage
Examples:
|searchWord|
|Ducks|

Scenario: User searches for Ducks in google happy path by pressing Enter button
When inputs a <searchWord>
When User initiates search by pressing Enter button
Then first result should contain <searchWord>
Then User is redirected to a webpage
Examples:
|searchWord|
|Ducks|

Scenario: User searches for Ducks Images in google happy path 
When inputs a <searchWord>
And clicks on Images link
And clicks on search button
Then User is redirected to a webpage
Then result is displayed by images
Examples:
|searchWord|
|Ducks|


Scenario: User searches for Ducks Images result amount verification
When inputs a <searchWord>
And clicks on search button
Then User is redirected to a webpage
Then result amount is more than 1 
And result search time is displayed
Examples:
|searchWord|
|Ducks|
Scenario: User searches for an irrelevant word results nonrelated 
When inputs a <searchWord>
And clicks on search button
Then first result should not contain <searchWord>
|searchWord|
|Dukes|

Scenario: User 
Given user navigates to google search page
Then search box is displayed
When User clicks on search box
And inputs a <searchWordwrong>
And clicks on search button
Then first result should not contain <searchWord>
|searchWordwrong|
|Dukes|









