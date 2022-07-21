*** Settings ***
Resource        ./Resources/customBase.robot


*** Variables ***
${EMAIL_ADDRESS_TEXTBOX}            //input[@name='username']
${PASSWORD_TEXTBOX}                 //input[@name='password']
${SIGN_IN_BUTTON}                   //span[text()='Sign in']
${FORGOT_PASSWORD_BUTTON}           //a[text()='Forgot Password?']
${SIGN_UP_BUTTON}                   //a[text()='Sign up']
${LOGIN_ERROR_MESSAGE}              //div[@class='MuiTypography-root MuiAlertTitle-root MuiTypography-body1 MuiTypography-gutterBottom']


*** Keywords ***
Login to Supreme Test
    [Arguments]                 ${userEmailAddress}=       ${userPassword}=
    Input Text                  ${emailAddressTextbox}     ${userEmailAddress}
    Input Text                  ${passwordTextbox}         ${userPassword}
    Click Element               ${signInButton}
    [Return]                    ${userEmailAddress}

Check the Login Fail
    Element Should Be Visible   ${loginErrorMessage}