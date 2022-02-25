*** Settings ***
Library        Selenium2Library

*** Variables ***
${URL}                       https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2FSign-up%2Fs%2F%3F_encoding%3DUTF8%26k%3DSign%2520up%26ref_%3Dnav_custrec_newcust&prevRID=K9FTSWHVVCY0GBFQJ5H5&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=usflex&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0
${ContinueButton}            //div[@class="a-section"]/descendant::span[@id="continue"]
${ConditionsofUse1}          //div[@id="legalTextRow"]/descendant::a[1]
${PrivacyNotice1}            //div[@id="legalTextRow"]/descendant::a[2]
${ConditionsofUse2}          //div[@class="a-section a-spacing-small a-text-center a-size-mini"]/descendant::a[1]
${PrivacyNotice2}            //div[@class="a-section a-spacing-small a-text-center a-size-mini"]/descendant::a[2]
${HelpLink}                  //div[@class="a-section a-spacing-small a-text-center a-size-mini"]/descendant::a[3]
${NeedHelpLink}              //div[@class="a-row a-expander-container a-expander-inline-container"]/descendant::a[1]
${ForgotYourPasswordLink}    //div[@class="a-row a-expander-container a-expander-inline-container"]/descendant::a[2]
${OtherIssuesLink}           //div[@class="a-row a-expander-container a-expander-inline-container"]/descendant::a[3]
${CreateAccountbutton}       //span[@id="auth-create-account-link"]/descendant::a[1]
${EmailField}                //div[@class="a-row a-spacing-base"]/descendant::input[1]
${EnterNameAlert}            Enter your email or mobile phone number
${a}                         a
${EmailNotFound}             We cannot find an account with that email address
${ConditionPage}             Welcome to Amazon.com. Amazon.com Services LLC and/or its affiliates ("Amazon") provide website features and other products and services to you when you visit or shop at Amazon.com
${PrivacyNoticePage}         We know that you care how information about you is used and shared, and we appreciate your trust that we will do so carefully and sensibly. 
${PasswordAssistance}        Password assistance
${AccountLoginIssue}         Account & Login Issues
${RegistrationPage}          Create account



*** Keywords ***
Go to Amazon sign in page
    Open Browser                      ${URL}        chrome

Click "Continue" button
    Click Element        ${ContinueButton}

Verify alert message "Enter your email or mobile phone number" should appear
    Page Should Contain        ${EnterNameAlert}

Type "a" in "Email or mobile phone number" field
    Input text        ${EmailField}   ${a} 

Click "Continue" button
    Click Element    ${ContinueButton}

Verify alert message "We cannot find an account with that email address" should appear
    Page Should Contain        ${EmailNotFound}

Click link "Conditions of Use" beside words "By continuing, you agree to Amazon's"
    Click Element          ${ConditionsofUse1}

Verify page redirect to "Conditions of Use - Amazon Customer Service" page
    Page Should Contain    ${ConditionPage}
    
Click link "Conditions of Use" in the bottom of sign in page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Click Element          ${ConditionsofUse2}

Click link "Privacy Notice" in the bottom of sign in page, beside words "By continuing, you agree to Amazon's"
    Click Element          ${PrivacyNotice1}

Verify page redirect to "Privacy Notice - Amazon Customer Service" page
    Page Should Contain    ${PrivacyNoticePage}

Click link "Privacy Notice" in the bottom of sign in page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Click Element          ${PrivacyNotice2}

Click link "Need help?"
    Click Element          ${NeedHelpLink}

Click "Forgot your password?"
    Click Element          ${ForgotYourPasswordLink}

Verify page redirected to "Amazon Password Assistance" page
    Page Should Contain    ${PasswordAssistance}

Click "Other issues with Sign-In"
    Click Element          ${OtherIssuesLink}

Verify page redirected to "Amazon.com Account & Login Issues" page
    Page Should Contain    ${AccountLoginIssue}

Click "Create your Amazon account" button
    Click Element          ${CreateAccountbutton}

Verify page redirected to "Amazon Registration" page
    Page Should Contain    ${RegistrationPage}
