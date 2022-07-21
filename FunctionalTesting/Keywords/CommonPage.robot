*** Settings ***
Resource        ./Resources/customBase.robot


*** Variables ***
${HAMBURGER_MENU_BUTTON}            //button[@aria-label='menu']
${HAMBURGER_MANAGEMENT_BUTTON}      //button[@id='_Management-button']
${HAMBURGER_ASSIGNMENT_BUTTON}      //button[@id='_Assignment-button']
${HAMBURGER_SETTINGS_BUTTON}        //button[@id='_Settings-button']
${TEST_DESIGN_BUTTON}               //span[@class='MuiButton-label' and text()='Test Design']
${TASKS_BUTTON}                     //span[@class='MuiButton-label' and text()='Tasks']
${CONNECTIONS_BUTTON}               //span[@class='MuiButton-label' and text()='Connections']
${VARIABLES_BUTTON}                 //span[@class='MuiButton-label' and text()='Variables']
${DASHBOARD_BUTTON}                 //span[@class='MuiButton-label' and text()='Dashboard']
${MANAGEMENT_BUTTON}                //a/span[@class='MuiButton-label' and text()='Management']
${REPORT_BUTTON}                    //span[@class='MuiButton-label' and text()='Report']
${USERS_BUTTON}                     //span[@class='MuiButton-label' and text()='Users']
${GROUPS_BUTTON}                    //span[@class='MuiButton-label' and text()='Groups']
${ACCOUNT_SETTINGS_BUTTON}          //span[@class='MuiButton-label' and text()='Account Settings']
${PROFILE_NAME}                     //h3[@class='MuiTypography-root MuiTypography-body1 MuiTypography-colorInherit']
${PROFILE_BUTTON}                   //li[@role='menuitem' and text()='Profile']
${LOGOUT_BUTTON}                    //li[@role='menuitem' and text()='Logout']
${PAGE_TITTLE}                      //h1[@class='MuiTypography-root MuiTypography-h3']
${NAME_TEXTBOX}                     //input[@id='name']
${ADD_BUTTON}                       //span[@class='MuiButton-label' and text()='Add']
${CLOSE_BUTTON}                     //span[@class='MuiButton-label' and text()='Close']
${CANCEL_BUTTON}                    //span[@class='MuiButton-label' and text()='Cancel']
${UPDATE_BUTTON}                    //div[contains(@class,'jss') and text()='new']/parent::*/parent::*//span[@class='MuiButton-label' and text()='Update']
${DELETE_BUTTON}                    //div[contains(@class,'jss') and text()='new']/parent::*/parent::*//input[@type='checkbox']
${FIRST_CONTAINER_NAME}             (//tr[@class='MuiTableRow-root MuiTableRow-hover'][1]//div[contains(@class,'jss')])[2]
${REQUEST_API_TESTSTEP}             //span[@class='ace_variable' and text()='"method"']
${RESPONSE_API_TESTSTEP}            //span[text()='"status_code"']/parent::*/span[@class='ace_constant ace_numeric']
${REQUEST_UI_TESTSTEP}              //span[@class='ace_variable' and text()='"url"']
${RESPONSE_UI_TESTSTEP}             //div[@class='ace_line' and contains(text(),'Return code:')]
${REQUEST_MYSQL_TESTSTEP}           //span[@class='ace_identifier' and contains(text(),'accounts_user')]
${RESPONSE_MYSQL_TESTSTEP}          //span[@class='ace_variable' and text()='"data"']
${REQUEST_SELENIUM_TESTSTEP}        //*[contains(text(),'set_window_size')]
${RESPONSE_SELENIUM_TESTSTEP}       //span[@class='ace_variable' and text()='"output"']


*** Keywords ***
Check the Profile Name
    [Arguments]                     ${currentUserName}
    ${profileNameText}=             Get Text                 ${profileName}
    ${loggedInUser}=                Convert To Lower Case    ${profileNameText}
    Should Be Equal As Strings      ${currentUserName}       ${loggedInUser}


