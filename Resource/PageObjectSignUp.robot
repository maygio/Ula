*** Settings ***
Library        Selenium2Library

*** Variables ***
${URL}                           https://www.amazon.com/ap/register?showRememberMe=true&openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2FSign-up%2Fs%2F%3F_encoding%3DUTF8%26k%3DSign%2520up%26ref_%3Dnav_custrec_newcust&prevRID=NBPPG1347F30XJTFJ1SD&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&prepopulatedLoginId=&failedSignInCount=0&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=usflex&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0
${NameField}                     //div[@class="a-row a-spacing-base"]/descendant::input[@id="ap_customer_name"]            
${EmailField}                    //div[@class="a-section a-spacing-none moa-single-claim-input-container"]/descendant::input[@id="ap_email"]
${PasswordField}                 //div[@class="a-row a-spacing-base"]/descendant::input[@id="ap_password"]
${ReEnterPasswordField}          //div[@class="a-row a-spacing-base"]/descendant::input[@id="ap_password_check"]
${ConditionsofUse1}              //div[@class="a-section a-spacing-extra-large"]/descendant::a[1]
${ConditionsofUse2}              //div[@class="a-section a-spacing-small a-text-center a-size-mini"]/descendant::a[1]
${PrivacyNotice1}                //div[@class="a-section a-spacing-extra-large"]/descendant::a[2]
${PrivacyNotice2}                //div[@class="a-section a-spacing-small a-text-center a-size-mini"]/descendant::a[2]
${HelpLink}                      //div[@class="a-section a-spacing-small a-text-center a-size-mini"]/descendant::a[3]
${SigninLink}                    //a[contains(text(), "            Sign-In
")]
${CreateBusinessAccountLink}     //div[@class="a-row"]/descendant::a[contains(@href,"https://www.amazon.com/business/register/org/landing?ref_=ap_altreg_ab")]
${ContinueButton}                //input[@id="continue"] 
${NameValue}                     Mayang             
${EnterNameAlert}                Enter your name
${EnterEmailAlert}               Enter your email or mobile phone number
${Minimum6Chara}                 Minimum 6 characters required
${InvalidEmailValue}             mayang_giovanny@yahoo
${PasswordValue}                 Password1!
${InvalidEmailAlert}             Wrong or Invalid email address or mobile phone number. Please correct and try again.
${ValidEmailValue}               mayang_giovanny@yahoo.co.id
${UnmatchPasswordValue}          Password1
${PasswordMustMatchAlert}        Passwords must match
${ConditionsOfUsePage}           Welcome to Amazon.com. Amazon.com Services LLC and/or its affiliates ("Amazon") provide website features and other products and services to you when you visit or shop at Amazon.com        
${PrivacyNoticePage}             We know that you care how information about you is used and shared, and we appreciate your trust that we will do so carefully and sensibly. 
${SigninPage}                    Sign-In
${AmazonBusinessPage}            Let’s create your free Amazon Business account
${5CharaPassword}                12345
${HelpPage}                      Hello. What can we help you with?
${UsedEmail}                     mayang.kata@gmail.com
${ConditionsOfUseTitle}          Conditions of Use - Amazon Customer Service


*** Keywords ***
Go to Amazon registration page
    Open Browser                      ${URL}        chrome
    Set Selenium Implicit Wait        5
    Maximize Browser Window           

Click Continue
    Click Element                     ${ContinueButton}

Verify alert "Enter your name" should appear
    Page Should Contain        ${EnterNameAlert}

Verify alert "Enter your email or mobile phone number" should appear
    Page Should Contain        ${EnterEmailAlert}

Close the Browser
    Close Browser

Type "Mayang" in "Your name" field
    Input Text        ${NameField}     ${NameValue}    

Type "mayang_giovanny@yahoo" in "Mobile number or email" field
    Input Text         ${EmailField}     ${InvalidEmailValue}

Type "Password1!" in "Password" field
    Input Text           ${PasswordField}        ${PasswordValue}

Type "Password1!" in "Re-enter Password" field
    Input Text           ${ReEnterPasswordField}        ${PasswordValue}

Verify alert "Wrong or Invalid email address or mobile phone number. Please correct and try again." should appear
    Page Should Contain        ${InvalidEmailAlert}

Type "mayang_giovanny@yahoo.co.id" in "Mobile number or email" field
    Input Text           ${EmailField}        ${ValidEmailValue}

Type "Password1" in "Re-enter Password" field
    Input Text             ${ReEnterPasswordField}        ${UnmatchPasswordValue} 

Verify alert "Passwords must match" should appear
    Page Should Contain    ${PasswordMustMatchAlert}    

Click link "Conditions of Use" beside words "By creating an account, you agree to Amazon's"
    Click Element          ${ConditionsofUse1}
    Sleep                  3
    Select Window          ${ConditionsOfUseTitle}

Verify page redirect to "Conditions of Use - Amazon Customer Service" page
    Page Should Contain    ${ConditionsOfUsePage}

Click link "Conditions of Use" in the bottom of page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Click Element          ${ConditionsofUse2}

Click link "Privacy Notice" beside words "By creating an account, you agree to Amazon's"
    Click Element          ${PrivacyNotice1}

Verify page redirect to "Privacy Notice - Amazon Customer Service" page
    Page Should Contain    ${PrivacyNoticePage}

Click link "Privacy Notice" in the bottom of page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Click Element          ${PrivacyNotice2}

Click link "Sign-In" beside text "Already have an account?"
    Click Element          ${SigninLink}
    
Verify page redirect to "Amazon Sign-In" page
    Page Should Contain        ${SigninPage}       

Click link "Create a free business account" beside text "Buying for work?"
    Click Element        ${CreateBusinessAccountLink}

Verify page redirect to "Amazon Business" page
    Page Should Contain    ${AmazonBusinessPage}

Type "12345" in "Password" field
    Input Text            ${PasswordField}     ${5CharaPassword}

Type "12345" in "Re-enter Password" field
    Input Text            ${ReEnterPasswordField}     ${5CharaPassword}

Verify alert "Minimum 6 characters required" should appear
    Page Should Contain    ${Minimum6Chara}

Click link "Help" in the bottom of the page
    Click Element          ${HelpLink}

Verify page redirect to "Help - Amazon Customer Service" page
    Page Should Contain    ${HelpPage}

Type "mayang.kata@gmail.com" in "Mobile number or email" field
    Input Text           ${EmailField}        ${UsedEmail}    
    
        
                  
       
          