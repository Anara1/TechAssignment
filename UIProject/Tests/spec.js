

var GooglePage =require('../Pages/GooglePage.page.js');
var GooglePageResult = require('../Pages/GooglePageResult.page.js');
var BasePage = require('../Utilities/Base.page.js');

describe("Redirect to google", ()=>{  
beforeAll(function(){
browser.waitForAngularEnabled(false);
browser.navigate(BasePage.homeUrl());
   })

   it('sign in', ()=>{
    expect(GooglePage.googleSearchBar).exists().ok();
    GooglePage.googleSearchBar().sendKeys("Ducks");
    GooglePage.searchButton().click();
   
    searchResult = GooglePage.firstResult().getText();
    expect(searchResult).contains("Ducks");
    

   
   })
})
