*** Settings ***
Resource       ../Resource/PageObjectSignUp.robot

*** Test Cases ***

signup-1
#EmptyField
    Go to Amazon registration page
    Click Continue
    Verify alert "Enter your name" should appear
    Verify alert "Enter your email or mobile phone number" should appear
    Verify alert "Minimum 6 characters required" should appear
    Close the Browser

signup-2
#InvalidEmail
    Go to Amazon registration page
    Type "Mayang" in "Your name" field
    Type "mayang_giovanny@yahoo" in "Mobile number or email" field
    Type "Password1!" in "Password" field
    Type "Password1!" in "Re-enter Password" field
    Click Continue
    Verify alert "Wrong or Invalid email address or mobile phone number. Please correct and try again." should appear
    Close the Browser

signup-3
#UnmatchConfirmPassword
    Go to Amazon registration page
    Type "Mayang" in "Your name" field
    Type "mayang_giovanny@yahoo.co.id" in "Mobile number or email" field
    Type "Password1!" in "Password" field
    Type "Password1" in "Re-enter Password" field
    Click Continue
    Verify alert "Passwords must match" should appear
    Close the Browser  

signup-4
#ConditionsofUse1
    Go to Amazon registration page
    Click link "Conditions of Use" beside words "By creating an account, you agree to Amazon's"
    Verify page redirect to "Conditions of Use - Amazon Customer Service" page
    Close the Browser

signup-5
#ConditionsofUse2
    Go to Amazon registration page
    Click link "Conditions of Use" in the bottom of page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Verify page redirect to "Conditions of Use - Amazon Customer Service" page
    Close the Browser

signup-6
#PrivacyNotice1
    Go to Amazon registration page
    Click link "Privacy Notice" beside words "By creating an account, you agree to Amazon's"
    Verify page redirect to "Privacy Notice - Amazon Customer Service" page
    Close the Browser

signup-7
#PrivacyNotice2
    Go to Amazon registration page
    Click link "Privacy Notice" in the bottom of page, above "© 1996-2022, Amazon.com, Inc. or its affiliates"
    Verify page redirect to "Privacy Notice - Amazon Customer Service" page
    Close the Browser

signup-8
#SigninLink
    Go to Amazon registration page
    Click link "Sign-In" beside text "Already have an account?"
    Verify page redirect to "Amazon Sign-In" page
    Close the Browser

signup-9
#SigninLink
    Go to Amazon registration page
    Click link "Create a free business account" beside text "Buying for work?"
    Verify page redirect to "Amazon Business" page
    Close the Browser

signup-10
#MinimumPasswordRequired
    Go to Amazon registration page
    Type "Mayang" in "Your name" field
    Type "mayang_giovanny@yahoo.co.id" in "Mobile number or email" field
    Type "12345" in "Password" field
    Type "12345" in "Re-enter Password" field
    Click Continue
    Verify alert "Minimum 6 characters required" should appear
    Close the Browser

signup-11
#HelpLink
    Go to Amazon registration page
    Click link "Help" in the bottom of the page
    Verify page redirect to "Help - Amazon Customer Service" page
    Close the Browser

signup-12
#EmailHasBeenUsed
    Go to Amazon registration page
    Type "Mayang" in "Your name" field
    Type "mayang.kata@gmail.com" in "Mobile number or email" field
    Type "Password1!" in "Password" field
    Type "Password1!" in "Re-enter Password" field
    Click Continue
    Verify alert "Email address already in use" should appear
    Close the Browser