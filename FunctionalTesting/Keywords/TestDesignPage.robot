*** Settings ***
Resource     ./Resources/customBase.robot
Resource     CommonPage.robot

*** Variables ***
${GROUP_NEW_BUTTON}                     //p[contains(@class,'context-menu-casesRoot') and contains(text(),'Group(')]
${NEW_BUTTON}                           //p[contains(@class,'MuiTypography-root jss') and text()='New']
${PRODUCT_BUTTON}                       //li[@role='menuitem' and text()='Product']
${PRODUCT_NAME_TEXTBOX}                 //input[@id='name']
${ENV_NAMESPACE_BUTTON}                 //div[@id='envnamespace']
${NEW_ENV_NAMESPACE_BUTTON}             (//li[@role='option'])[1]
${SAVE_BUTTON}                          //span[@class='MuiButton-label' and text()='Save']
${PRODUCT_NEW_BUTTON}                   //p[contains(@class,'context-menu-casesProduct') and contains(text(),'new (')]
${PRODUCT_AUTO_BUTTON}                  //p[contains(@class,'context-menu-casesProduct') and contains(text(),'productAuto (')]
${VERSION_BUTTON}                       //li[@role='menuitem' and text()='Version']
${VERSION_NAME_TEXTBOX}                 //input[@class='MuiInputBase-input MuiInput-input MuiInputBase-inputMarginDense MuiInput-inputMarginDense']
${VERSION_V1_BUTTON}                    //p[contains(@class,'context-menu-casesVersion') and text()='v1']
${FOLDER_BUTTON}                        //li[@role='menuitem' and text()='Folder']
${FOLDER_NAME_TEXTBOX}                  //input[@class='MuiInputBase-input MuiInput-input MuiInputBase-inputMarginDense MuiInput-inputMarginDense']
${FOLDER_TC_BUTTON}                     //p[contains(@class,'context-menu-casesFolder') and text()='FolderAuto']
${TESTCASE_BUTTON}                      //li[@role='menuitem' and text()='Case']
${TESTCASE_NAME_TEXTBOX}                //input[@class='MuiInputBase-input MuiInput-input MuiInputBase-inputMarginDense MuiInput-inputMarginDense']
${TESTSTEP_BUTTON}                      //li[@role='menuitem' and text()='Step']
${TD_EDIT_BUTTON}                       //button[@aria-label='edit']
${TD_RELEASE_BUTTON}                    //button[@aria-label='release']
${TD_VARIABLES_BUTTON}                  //button[@aria-label='variables']
${TD_EXECUTE_BUTTON}                    //button[@aria-label='execute']
${VARIABLE_UPDATE_BUTTON}               (//span[@class='MuiButton-label' and text()='Update'])[last()]
${VARIABLE_VALUE_TEXTBOX}               //input[@id='value']
${VARIABLE_VALUE_SAVE_BUTTON}           (//button[@class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorPrimary MuiIconButton-sizeSmall"])[1]
${TESTSTEP_NAME_TEXTBOX}                //input[@name='name']
${TESTSTEP_PLUGINTYPE_BUTTON}           //div[@id='plugin-type']
${TESTSTEP_CONCATEGORY_BUTTON}          //div[@id='connection-category']
${TESTSTEP_CONCATEGORY_NEW}             //span[contains(text(),'Auto')]
${TESTSTEP_SAVE_BUTTON}                 //span[@class='MuiButton-label' and text()='Save']
${TESTSTEP_CLOSE_BUTTON}                //div[@aria-label='step-tabs']//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeSmall']
${ARC_TESTCASE_BUTTON}                  //p[contains(@class,'context-menu-casesCase') and text()='ARC']
${ARC_TESTSTEP_PLUGINTYPE}              //li[@role='option' and text()='arc']
${ARC_METHOD_BUTTON}                    //div[@class='MuiGrid-root MuiGrid-container']//div[@aria-haspopup='listbox']
${ARC_POST_METHOD_BUTTON}               //li[@data-value='POST']
${ARC_ENDPOINT_TEXTBOX}                 //input[@placeholder='http://api.example.com']
${ARC_BODY_BUTTON}                      //span[@class='MuiTab-wrapper' and text()='Body']
${ARC_BODY_NONE_BUTTON}                 //div[@role='button' and text()='None']
${ARC_BODY_APPJSON_BUTTON}              //li[@data-value='application/json']
${ARC_BODY_CONTENT}                     //textarea[@class='ace_text-input']
${ARC_RIGHT_BUTTON}                     //div[@class='MuiButtonBase-root MuiTabScrollButton-root MuiTabs-scrollButtons MuiTabs-scrollButtonsDesktop']
${ARC_TEST_BUTTON}                      //span[@class='MuiTab-wrapper' and text()='Test']
${ARC_STATUS_CODE_BUTTON}               //span[text()='Status code is 200']
${REST_TESTCASE_BUTTON}                 //p[contains(@class,'context-menu-casesCase') and text()='REST']
${REST_TESTSTEP_PLUGINTYPE}             //li[@role='option' and text()='rest']
${REST_BODY_CONTENT}                    //textarea[@class='ace_text-input']
${REST_AFTER_SCRIPT}                    (//header[contains(@class,'MuiPaper-root MuiAppBar-root MuiAppBar')]/button[@type='button'])[2]
${SELENIUM_TESTCASE_BUTTON}             //p[contains(@class,'context-menu-casesCase') and text()='SELENIUM']
${SELENIUM_TESTSTEP_PLUGINTYPE}         //li[@role='option' and text()='selenium']
${SELENIUM_BODY_CONTENT}                //textarea[@class='ace_text-input']
${MYSQL_TESTCASE_BUTTON}                //p[contains(@class,'context-menu-casesCase') and text()='MYSQL']
${MYSQL_TESTSTEP_PLUGINTYPE}            //li[@role='option' and text()='mysql']
${MYSQL_BODY_CONTENT}                   //textarea[@class='ace_text-input']
${UI_TESTCASE_BUTTON}                   //p[contains(@class,'context-menu-casesCase') and text()='UI']
${UI_TESTSTEP_PLUGINTYPE}               //li[@role='option' and text()='ui_record']
${UI_TESTSTEP_URL_TEXTBOX}              //input[@type='url']
${UI_TESTSTEP_START_RECORD_BUTTON}      //button[@class='btn-action si-record']
${UI_TESTSTEP_STOP_RECORD_BUTTON}       //button[@class='btn-action active si-record']
${START_TESTSTEP}                       //div[text()='Start']
${NEW_TESTSTEP}                         //div[text()='New Step']
${END_TESTSTEP}                         //div[text()='End']


*** Keywords ***
Add Test Cases
    Open Context Menu                   ${groupNewButton}
    Mouse Over                          ${newButton}
    Click Element                       ${productButton}
    Input Text                          ${productNameTextbox}               new
    Click Element                       ${envNamespaceButton}
    Click Element                       ${newEnvNamespaceButton}
    Click Element                       ${saveButton}
    Wait Until Element Is Visible       ${productNewButton}
    Open Context Menu                   ${productNewButton}
    Mouse Over                          ${newButton}
    Click Element                       ${versionButton}
    Clear Element Text                  ${versionNameTextbox}
    Input Text                          ${versionNameTextbox}               v1
    Press Key                           ${versionNameTextbox}               \\\13
    Wait Until Element Is Visible       ${versionV1Button}
    Open Context Menu                   ${versionV1Button}
    Mouse Over                          ${newButton}
    Click Element                       ${folderButton}
    Clear Element Text                  ${folderNameTextBox}
    Input Text                          ${folderNameTextBox}                FolderAuto
    Press Key                           ${folderNameTextBox}                \\\13
    Wait Until Element Is Visible       ${folderTCButton}
    Open Context Menu                   ${folderTCButton}
    Mouse Over                          ${newButton}
    Click Element                       ${testcaseButton}
    Clear Element Text                  ${testcaseNameTextbox}
    Input Text                          ${testcaseNameTextbox}              ARC
    Press Key                           ${testcaseNameTextbox}              \\\13
    Wait Until Element Is Visible       ${folderTCButton}
    Open Context Menu                   ${folderTCButton}
    Mouse Over                          ${newButton}
    Click Element                       ${testcaseButton}
    Clear Element Text                  ${testcaseNameTextbox}
    Input Text                          ${testcaseNameTextbox}              REST
    Press Key                           ${testcaseNameTextbox}              \\\13
    Wait Until Element Is Visible       ${folderTCButton}
    Open Context Menu                   ${folderTCButton}
    Mouse Over                          ${newButton}
    Click Element                       ${testcaseButton}
    Clear Element Text                  ${testcaseNameTextbox}
    Input Text                          ${testcaseNameTextbox}              SELENIUM
    Press Key                           ${testcaseNameTextbox}              \\\13
    Wait Until Element Is Visible       ${folderTCButton}
    Open Context Menu                   ${folderTCButton}
    Mouse Over                          ${newButton}
    Click Element                       ${testcaseButton}
    Clear Element Text                  ${testcaseNameTextbox}
    Input Text                          ${testcaseNameTextbox}              MYSQL
    Press Key                           ${testcaseNameTextbox}              \\\13
    Wait Until Element Is Visible       ${folderTCButton}
    Open Context Menu                   ${folderTCButton}
    Mouse Over                          ${newButton}
    Click Element                       ${testcaseButton}
    Clear Element Text                  ${testcaseNameTextbox}
    Input Text                          ${testcaseNameTextbox}              UI
    Press Key                           ${testcaseNameTextbox}              \\\13

Add Arc Test Step
    Open Test Cases Folder              ${arcTestcaseButton}
    Click Element                       ${TDeditButton}
    Sleep                               0.5 seconds
    Open Context Menu                   ${arcTestcaseButton}
    Mouse Over                          ${newButton}
    Click Element                       ${teststepButton}
    Click Element                       ${teststepPlugintypeButton}
    Click Element                       ${arcTeststepPlugintype}
    Click Element                       ${teststepConcategoryButton}
    Click Element                       ${teststepConcategoryNew}
    Click Element                       ${arcMethodButton}
    Click Element                       ${arcPostMethodButton}
    Click Element                       ${teststepSaveButton}
    Input Text                          ${arcEndpointTextbox}               h
    Input Text                          ${arcEndpointTextbox}               t
    Input Text                          ${arcEndpointTextbox}               tp://dev.supremetest.net/serve/auth/login/
    Capture Page Screenshot
    Click Element                       ${teststepSaveButton}
    Click Element                       ${arcBodyButton}
    Click Element                       ${arcBodyNoneButton}
    Click Element                       ${arcBodyAppjsonButton}
    ${content}=                         Get Value From Json File            stepContents          arcContentForUI
    Input Text                          ${arcBodyContent}                   ${content}
    Click Element                       ${teststepSaveButton}
    Click Element If Exist              ${arcRightButton}
    Click Element                       ${arcTestButton}
    Click Element                       ${arcStatusCodeButton}
    Click Element                       ${testStepSaveButton}
    Click Element                       ${teststepCloseButton}
    Drag And Drop By Offset             ${startTeststep}                    100     -200
    Drag And Drop                       ${startTestStep}                    ${newTeststep}
    Drag And Drop                       ${newTeststep}                      ${endTeststep}
    Click Element                       ${TDReleaseButton}
    Element Should Be Visible           ${TDeditButton}
    Add Value to Local Variables        arc


Add Rest Test Step
    Open Test Cases Folder              ${restTestcaseButton}
    Click Element                       ${TDeditButton}
    Sleep                               0.5 seconds
    Open Context Menu                   ${restTestcaseButton}
    Mouse Over                          ${newButton}
    Click Element                       ${teststepButton}
    Click Element                       ${teststepPlugintypeButton}
    Click Element                       ${restTeststepPlugintype}
    Click Element                       ${teststepConcategoryButton}
    Click Element                       ${teststepConcategoryNew}
    ${content}=                         Get Value From Json File            stepContents          restContentForUI
    Input Text                          ${restBodyContent}                  ${content}
    Click Element                       ${restAfterScript}
    ${afterContent}=                    Get Value From Json File            stepAfterScripts      restAfterScript
    Input Text                          ${restBodyContent}                  ${afterContent}
    Click Element                       ${testStepSaveButton}
    Click Element                       ${teststepCloseButton}
    Drag And Drop By Offset             ${startTeststep}                    100     -200
    Drag And Drop                       ${startTestStep}                    ${newTeststep}
    Drag And Drop                       ${newTeststep}                      ${endTeststep}
    Click Element                       ${TDReleaseButton}
    Element Should Be Visible           ${TDeditButton}
    Add Value to Local Variables        rest


Add Selenium Test Step
    Open Test Cases Folder              ${seleniumTestcaseButton}
    Click Element                       ${TDeditButton}
    Sleep                               0.5 seconds
    Open Context Menu                   ${seleniumTestcaseButton}
    Mouse Over                          ${newButton}
    Click Element                       ${teststepButton}
    Click Element                       ${teststepPlugintypeButton}
    Click Element                       ${seleniumTeststepPlugintype}
    Click Element                       ${teststepConcategoryButton}
    Click Element                       ${teststepConcategoryNew}
    ${content}=                         Get Value From Json File            stepContents           seleniumContentForUI
    Input Text                          ${seleniumBodyContent}              ${content}
    Click Element                       ${testStepSaveButton}
    Click Element                       ${teststepCloseButton}
    Drag And Drop By Offset             ${startTeststep}                    100     -200
    Drag And Drop                       ${startTestStep}                    ${newTeststep}
    Drag And Drop                       ${newTeststep}                      ${endTeststep}
    Click Element                       ${TDReleaseButton}
    Element Should Be Visible           ${TDeditButton}
    Add Value to Local Variables        selenium


Add My Sql Test Step
    Open Test Cases Folder              ${mysqlTestcaseButton}
    Click Element                       ${TDeditButton}
    Sleep                               0.5 seconds
    Open Context Menu                   ${mysqlTestcaseButton}
    Mouse Over                          ${newButton}
    Click Element                       ${teststepButton}
    Click Element                       ${teststepPlugintypeButton}
    Click Element                       ${mysqlTeststepPlugintype}
    Click Element                       ${teststepConcategoryButton}
    Click Element                       ${teststepConcategoryNew}
    ${content}=                         Get Value From Json File            stepContents          mySqlContent
    Input Text                          ${mysqlBodyContent}                 ${content}
    Click Element                       ${testStepSaveButton}
    Click Element                       ${teststepCloseButton}
    Drag And Drop By Offset             ${startTeststep}                    100     -200
    Drag And Drop                       ${startTestStep}                    ${newTeststep}
    Drag And Drop                       ${newTeststep}                      ${endTeststep}
    Click Element                       ${TDReleaseButton}
    Element Should Be Visible           ${TDeditButton}
    Add Value to Local Variables        mySql


Add UI Record Test Step
    Open Test Cases Folder              ${uiTestcaseButton}
    Click Element                       ${TDeditButton}
    Sleep                               0.5 seconds
    Open Context Menu                   ${uiTestcaseButton}
    Mouse Over                          ${newButton}
    Click Element                       ${teststepButton}
    Click Element                       ${teststepPlugintypeButton}
    Click Element                       ${uiTeststepPlugintype}
    Click Element                       ${teststepConcategoryButton}
    Click Element                       ${teststepConcategoryNew}
    Select Frame                        xpath=//iframe
    Input Text                          ${uiTeststepUrlTextbox}             https://www.google.com.tr
    Click Element                       ${uiTeststepStartRecordButton}
    Sleep                               3 seconds
    Switch Window                       title:Google
    Input Text                          //input[@title='Ara' or @title='Search']                 Supreme Test
    Press Key                           //input[@title='Ara' or @title='Search']                 \\\13
    Switch Window                       title:Test Management
    Select Frame                        xpath=//iframe
    Click Element                       ${uiTeststepStopRecordButton}
    Click Element                       //span[text()='Supreme Test']
    Clear Element Text                  //textarea[@id='value']
    ${content}=                         Get Value From Json File            stepContents          uiRecordContentForUI
    Input Text                          //textarea[@id='value']             ${content}
    Unselect Frame
    Sleep                               1 seconds
    Click Element                       ${testStepSaveButton}
    Click Element                       ${teststepCloseButton}
    Drag And Drop By Offset             ${startTeststep}                    100     -200
    Drag And Drop                       ${startTestStep}                    ${newTeststep}
    Drag And Drop                       ${newTeststep}                      ${endTeststep}
    Click Element                       ${TDReleaseButton}
    Element Should Be Visible           ${TDeditButton}
    Add Value to Local Variables        uiRecord


Open Test Cases Folder
    [Arguments]                         ${testCaseButton}
    Click Element                       ${groupNewButton}
    Click Element                       ${productAutoButton}
    Click Element                       ${versionV1Button}
    ${output}=                          Get Element Count                   //p[contains(@class,'context-menu-casesCase')]
    IF                                  "${output}" == "0"
                                        Click Element                       ${folderTCButton}
    END
    Click Element If Exist              ${testCaseButton}


Add Value to Local Variables
    [Arguments]                         ${stepType}
    Click Element                       ${TDVariablesButton}
    Click Element                       ${variableUpdateButton}
    IF                                  "${stepType}" == "selenium"
                                        Input Text                  ${variableValueTextbox}         https://www.google.com
    ELSE IF                             "${stepType}" == "arc"
                                        Input Text                  ${variableValueTextbox}         1qaz!QAZ
    ELSE IF                             "${stepType}" == "rest"
                                        Input Text                  ${variableValueTextbox}         1qaz!QAZ
    ELSE IF                             "${stepType}" == "uiRecord"
                                        Input Text                  ${variableValueTextbox}         Supreme Test
    ELSE IF                             "${stepType}" == "mySql"
                                        Input Text                  ${variableValueTextbox}         1
    END
    Click Element                       ${variableValueSaveButton}
    Click Element                       ${closeButton}


Execute Arc Test Case
     Wait Until Element Is Visible       ${TDExecuteButton}
     Click Element                       ${TDExecuteButton}
     Wait Until Element Is Visible       //*[name()='image' and @width='24' and @height='24']
     Element Should Be Visible           //*[name()='rect' and @stroke='green' and @height='60']
     Click Element                       //*[name()='image' and @width='24' and @height='24']
     Sleep                               1 seconds
     Element Should Be Visible           ${requestApiTeststep}
     ${responseArcResultCode}=           Get Text                                                   ${responseApiTeststep}
     Should Be Equal As Strings          ${responseArcResultCode}                                   200


Execute Rest Test Case
     Wait Until Element Is Visible       ${TDExecuteButton}
     Click Element                       ${TDExecuteButton}
     Wait Until Element Is Visible       //*[name()='image' and @width='24' and @height='24']
     Element Should Be Visible           //*[name()='rect' and @stroke='green' and @height='60']
     Click Element                       //*[name()='image' and @width='24' and @height='24']
     Sleep                               1 seconds
     Element Should Be Visible           ${requestApiTeststep}
     ${responseArcResultCode}=           Get Text                                                   ${responseApiTeststep}
     Should Be Equal As Strings          ${responseArcResultCode}                                   200


Execute Selenium Test Case
     Wait Until Element Is Visible       ${TDExecuteButton}
     Click Element                       ${TDExecuteButton}
     Wait Until Element Is Visible       //*[name()='image' and @width='24' and @height='24']
     Element Should Be Visible           //*[name()='rect' and @stroke='green' and @height='60']
     Click Element                       //*[name()='image' and @width='24' and @height='24']
     Sleep                               1 seconds
     Element Should Be Visible           ${requestSeleniumTeststep}
     Element Should Be Visible           ${responseSeleniumTeststep}


Execute My Sql Test Case
     Wait Until Element Is Visible       ${TDExecuteButton}
     Click Element                       ${TDExecuteButton}
     Wait Until Element Is Visible       //*[name()='image' and @width='24' and @height='24']
     Element Should Be Visible           //*[name()='rect' and @stroke='green' and @height='60']
     Click Element                       //*[name()='image' and @width='24' and @height='24']
     Click Element                       //div[@id='response-type']
     Click Element                       //li[@data-value='json']
     Sleep                               1 seconds
     Element Should Be Visible           ${requestMysqlTeststep}
     Element Should Be Visible           ${responseMysqlTeststep}


Execute UI Record Test Case
     Wait Until Element Is Visible       ${TDExecuteButton}
     Click Element                       ${TDExecuteButton}
     Sleep                               20 seconds
     Wait Until Element Is Visible       //*[name()='image' and @width='24' and @height='24']
     Element Should Be Visible           //*[name()='rect' and @stroke='green' and @height='60']
     Click Element                       //*[name()='image' and @width='24' and @height='24']
     Sleep                               1 seconds
     Element Should Be Visible           ${requestUITeststep}
     Element Should Be Visible           ${responseUITeststep}