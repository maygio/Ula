*** Settings ***
Resource       ../Resource/PageObjectSignIn.robot

*** Test Cases ***
signin-1
#EmptyEmail
    Go to Amazon sign in page
    Click "Continue" button
    Verify alert message "Enter your email or mobile phone number" should appear
    Close the Browser

signin-2
#InvalidEmailOrPhoneNumber
    Go to Amazon sign in page
    Type "a" in "Email or mobile phone number" field
    Click "Continue" button
    Verify alert message "We cannot find an account with that email address" should appear
    Close the Browser

signin-3
#ConditionsofUse1
    Go to Amazon sign in page
    Click link "Conditions of Use" beside words "By continuing, you agree to Amazon's"
    Verify page redirect to "Conditions of Use - Amazon Customer Service" page
    Close the Browser

signin-4
#ConditionsofUse2
    Go to Amazon sign in page
    Click link "Conditions of Use" in the bottom of sign in page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Verify page redirect to "Conditions of Use - Amazon Customer Service" page
    Close the Browser

signin-5
#PrivacyNotice1
    Go to Amazon sign in page
    Click link "Privacy Notice" in the bottom of sign in page, beside words "By continuing, you agree to Amazon's"
    Verify page redirect to "Privacy Notice - Amazon Customer Service" page
    Close the Browser

signin-6
#PrivacyNotice2
    Go to Amazon sign in page
    Click link "Privacy Notice" in the bottom of sign in page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Verify page redirect to "Privacy Notice - Amazon Customer Service" page
    Close the Browser

signin-7
#NeedHelpLinkForgotPassword
    Go to Amazon sign in page
    Click link "Need help?"
    Click "Forgot your password?"
    Verify page redirected to "Amazon Password Assistance" page
    Close the Browser

signin-8
#NeedHelpLinkOtherIssues
    Go to Amazon sign in page
    Click link "Need help?"
    Click "Other issues with Sign-In"
    Verify page redirected to "Amazon.com Account & Login Issues" page
    Close the Browser

signin-9
#CreateAccountbutton
    Go to Amazon sign in page
    Click "Create your Amazon account" button
    Verify page redirected to "Amazon Registration" page
    Close the Browser
