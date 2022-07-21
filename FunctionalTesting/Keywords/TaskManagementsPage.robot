*** Settings ***
Resource     ./Resources/customBase.robot
Resource     CommonPage.robot

*** Variables ***
${CREATE_TASK_BUTTON}                   //span[@class='MuiButton-label' and text()='Create Task']
${FIRST_TASK_EXPORT_BUTTON}             (//span[@class='MuiButton-label' and text()='Export'])[1]
${SELECT_MODE_DROPDOWN}                 //div[@class='MuiDialogContent-root']//select[@id='mode']
${SELECT_RECCURENCE}                    //div[@class='MuiDialogContent-root']//select[@id='recurrence']
${SELECT_MASSIVE_FILE}                  //div[@class='MuiDialogContent-root']//select[@id='massiveUploadFromServer']
${INPUT_MASSIVE_FILE}                   //input[@type='file']
${GROUP_NEW_BUTTON}                     //p[contains(text(),'Group(')]
${TASK_NAME_TEXTBOX}                    //input[@id='name']
${PRODUCT_NEW_BUTTON}                   //p[text()='productAuto']
${VERSION_V1_BUTTON}                    //p[text()='v1']
${FOLDER_TESTCASES_BUTTON}              //p[text()='FolderAuto']
${ALL_TESTCASE_CHECKBOX}                //p[text()='FolderAuto']/parent::*/parent::*/parent::*//input[@name='checkedBox']
${ARC_TESTCASE_CHECKBOX}                //p[text()='arcAuto']/parent::*/parent::*/parent::*//input[@name='checkedBox']
${REST_TESTCASE_CHECKBOX}               //p[text()='restAuto']/parent::*/parent::*/parent::*//input[@name='checkedBox']
${SELENIUM_TESTCASE_CHECKBOX}           //p[text()='seleniumAuto']/parent::*/parent::*/parent::*//input[@name='checkedBox']
${MYSQL_TESTCASE_CHECKBOX}              //p[text()='mySqlAuto']/parent::*/parent::*/parent::*//input[@name='checkedBox']
${UI_TESTCASE_CHECKBOX}                 //p[text()='uiRecordAuto']/parent::*/parent::*/parent::*//input[@name='checkedBox']
${SELECT_ENVGROUP_DROPDOWN}             //div[@class='MuiDialogContent-root']//select[@id='env_group']
${TASK_SCHEDULE_TIME}                   //input[@id='scheduled_at']
${REPORT_ARC_PLUS_BUTTON}               //div[text()='arc']/parent::*/parent::*//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text']
${REPORT_REST_PLUS_BUTTON}              //div[text()='rest']/parent::*/parent::*//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text']
${REPORT_SELENIUM_PLUS_BUTTON}          //div[text()='selenium']/parent::*/parent::*//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text']
${REPORT_MYSQL_PLUS_BUTTON}             //div[text()='mySql']/parent::*/parent::*//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text']
${REPORT_UI_PLUS_BUTTON}                //div[text()='uiRecord']/parent::*/parent::*//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text']
${REPORT_TESTCASE_DETAILS_BUTTON}       //span[@class='MuiButton-label' and text()='Details']
${REPORT_TASK_STATUS}                   (//h6[@class='MuiTypography-root MuiTypography-h6'])[2]
${TESTSTEP_RESULT_STATUS}               (//*[text()='TEST STEP LIST']/parent::*/parent::*//p[contains(@class,'jss')])



*** Keywords ***
Go to Task Managements Page
    Mouse Over                      ${hamburgerManagementButton}
    Click Element                   ${tasksButton}
    ${currentPageTittle}=           Get Text                        ${pageTittle}
    Should Be Equal                 ${currentPageTittle}            Task Management


Create Scheduled or Recurrent Mode Task
    [Arguments]                     ${taskType}
    Click Element                   ${createTaskButton}
    IF                              "${taskType}" == "SCHEDULED"
                                    Select From List By Label       ${selectModeDropdown}           Scheduled
    ELSE IF                         "${taskType}" == "RECURRENT"
                                    Select From List By Label       ${selectModeDropdown}           Recurrent
                                    Select From List By Label       ${selectReccurence}             Month
    END
    Click Element                   ${groupNewButton}
    Click Element                   ${productNewButton}
    Click Element                   ${versionV1Button}
    Click Element                   ${allTestcaseCheckbox}
    Click Element                   ${groupNewButton}
    Select From List By Index       ${selectEnvgroupDropdown}        1
    ${taskName}=                    Generate Random String           5
    Input Text                      ${taskNameTextbox}               ${taskName}
    ${date1}=                       Get Current Date                 UTC                            +3 hours
    ${date2}=                       Add Time to Date                 ${date1}                       00:01:10
    Input Text                      ${taskScheduleTime}              ${date2}
    Click Element                   ${addButton}
    Element Should Be Visible       //div[text()='${taskName}']
    [Return]                        ${taskName}


Check the Scheduled or Recurrent Task Results
    [Arguments]                     ${taskType}                     ${taskName}
    IF                              "${taskType}" == "SCHEDULED"
                                    Click Element                   //div[text()='${taskName}']/parent::*/parent::*/parent::*//span[text()='Report']
    ELSE IF                         "${taskType}" == "RECURRENT"
                                    Click Element                   //div[text()='${taskName}']/parent::*/parent::*/parent::*//span[text()='Cancel']
                                    Click Element                   //div[text()='${taskName}']/parent::*/parent::*/parent::*//button[@class='MuiButtonBase-root MuiButton-root MuiButton-text']
                                    Click Element                   //tr[@class='MuiTableRow-root']//span[text()='Report']
    END
    ${taskStatus}=                  Get Text                        ${reportTaskStatus}
    Should Be Equal As Strings      ${taskStatus}                   Success
    Click Element                   ${reportSeleniumPlusButton}
    Check Success Test Step Results
    Click Element                   ${reportTestCaseDetailsButton}
    Sleep                           1 seconds
    Element Should Be Visible       ${requestSeleniumTeststep}
    Element Should Be Visible       ${responseSeleniumTeststep}
    Click Element                   ${closeButton}
    Click Element                   ${reportSeleniumPlusButton}
    Click Element                   ${reportUIPlusButton}
    Check Success Test Step Results
    Click Element                   ${reportTestCaseDetailsButton}
    Sleep                           1 seconds
    Element Should Be Visible       ${requestUITeststep}
    Element Should Be Visible       ${responseUITeststep}
    Click Element                   ${closeButton}
    Click Element                   ${reportUIPlusButton}
    Click Element                   ${reportMysqlPlusButton}
    Check Success Test Step Results
    Click Element                   ${reportTestCaseDetailsButton}
    Sleep                           1 seconds
    Element Should Be Visible       ${requestMysqlTeststep}
    Element Should Be Visible       ${responseMysqlTeststep}
    Click Element                   ${closeButton}
    Click Element                   ${reportMysqlPlusButton}
    Click Element                   ${reportRestPlusButton}
    Check Success Test Step Results
    Click Element                   ${reportTestCaseDetailsButton}
    Sleep                           1 seconds
    Element Should Be Visible       ${requestApiTeststep}
    ${responseRestResultCode}=      Get Text                            ${responseApiTeststep}
    Should Be Equal As Strings      ${responseRestResultCode}           200
    Click Element                   ${closeButton}
    Click Element                   ${reportRestPlusButton}
    Click Element                   ${reportArcPlusButton}
    Check Success Test Step Results
    Click Element                   ${reportTestCaseDetailsButton}
    Sleep                           1 seconds
    Element Should Be Visible       ${requestApiTeststep}
    ${responseArcResultCode}=       Get Text                           ${responseApiTeststep}
    Should Be Equal As Strings      ${responseArcResultCode}           200
    Click Element                   ${closeButton}
    Click Element                   ${reportArcPlusButton}


Check Success Test Step Results
    FOR                             ${i}                            IN RANGE                        1    4
                                    ${testStepsResults}=            Get Text                        ${teststepResultStatus}\[${i}]
                                    Should Be Equal As Strings      ${testStepsResults}             Success
    END


Create Massive Mode Task
    [Arguments]                     ${caseType}
    Click Element                   ${createTaskButton}
    Select From List By Label       ${selectModeDropdown}                                                                          Massive
    Choose File                     ${inputMassiveFile}                                                                            ./Json&Files/Csv/${caseType}.csv
    ${fileName}=                    Get Text                                                                                       //strong
    @{fileNo}=                      Split String                                                                                   ${fileName}                                             .
    Click Element                   ${groupNewButton}
    Click Element                   ${productNewButton}
    Click Element                   ${versionV1Button}
    Click Element                   ${folderTestcasesButton}
    Click Element                   //p[text()='${caseType}']/parent::*/parent::*/parent::*//input[@name='checkedBox']
    Click Element                   ${groupNewButton}
    Select From List By Index       ${selectEnvgroupDropdown}                                                                      1
    ${taskName}=                    Generate Random String                                                                         5
    Input Text                      ${taskNameTextbox}                                                                             ${taskName}
    ${date1}=                       Get Current Date                                                                               UTC                            +3 hours
    ${date2}=                       Add Time to Date                                                                               ${date1}                       00:01:10
    Input Text                      ${taskScheduleTime}                                                                            ${date2}
    Click Element                   ${addButton}
    Element Should Be Visible       //div[text()='${taskName}']
    [Return]                        ${taskName}                                                                                    ${fileNo}[0]


Check the Massive Task Results
    [Arguments]                     ${caseType}                                                                             ${taskName}                                             ${fileName}
    Sleep                           1 seconds
    ${taskId}=                      Get Text                                                                                //div[text()='${taskName}']/following-sibling::div
    Click Element                   //div[text()='${taskName}']/parent::*/parent::*/parent::*//span[text()='Export']
    Sleep                           1 seconds
    Teardown Browser
    Open Browser                    C:\\Users\\e84199542\\Downloads\\${fileName}_export_${taskId}.html                     ${BROWSER}
    Maximize Browser Window

    IF                              "${caseType}" == "arc"
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: arc')])[1]
                                    Click Element                                                                           (//a[text()='Request'])[1]
                                    ${request1}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${request1}                                                                              {"username":"eray.yagiz@huawei.com","password":"Invalid Password"}
                                    Click Element                                                                           (//a[text()='Response'])[1]
                                    ${response1}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${response1}                                                                             "status_code": 400
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: arc')])[2]
                                    Click Element                                                                           (//a[text()='Request'])[2]
                                    ${request2}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${request2}                                                                              {"username":"eray.yagiz@huawei.com","password":"1qaz!QAZ"}
                                    Click Element                                                                           (//a[text()='Response'])[2]
                                    ${response2}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${response2}                                                                             "status_code": 200
    ELSE IF                         "${caseType}" == "rest"
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: rest')])[1]
                                    Click Element                                                                           (//a[text()='Request'])[1]
                                    ${request1}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${request1}                                                                              {"username":"eray.yagiz@huawei.com","password":"Invalid Password"}
                                    Click Element                                                                           (//a[text()='Response'])[1]
                                    ${response1}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${response1}                                                                             "status_code": 400
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: rest')])[2]
                                    Click Element                                                                           (//a[text()='Request'])[2]
                                    ${request2}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${request2}                                                                              {"username":"eray.yagiz@huawei.com","password":"1qaz!QAZ"}
                                    Click Element                                                                           (//a[text()='Response'])[2]
                                    ${response2}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${response2}                                                                             "status_code": 200
    ELSE IF                         "${caseType}" == "selenium"
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: selenium')])[1]
                                    Click Element                                                                           (//a[text()='Request'])[1]
                                    ${request1}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${request1}                                                                              self.driver.get("Invalid URL")
                                    Click Element                                                                           (//a[text()='Response'])[1]
                                    ${response1}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${response1}                                                                             Traceback (most recent call last)
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: selenium')])[2]
                                    Click Element                                                                           (//a[text()='Request'])[2]
                                    ${request2}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${request2}                                                                              self.driver.set_window_size(1920, 1080)
                                    Click Element                                                                           (//a[text()='Response'])[2]
                                    ${response2}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${response2}                                                                             {"output": [], "screenshots": []}
    ELSE IF                         "${caseType}" == "mySql"
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: mysql')])[1]
                                    Click Element                                                                           (//a[text()='Request'])[1]
                                    ${request1}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${request1}                                                                              Select * From accounts_user Where id=Invalid ID;
                                    Click Element                                                                           (//a[text()='Response'])[1]
                                    ${response1}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${response1}                                                                             You have an error in your SQL syntax
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: mysql')])[2]
                                    Click Element                                                                           (//a[text()='Request'])[2]
                                    ${request2}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${request2}                                                                              Select * From accounts_user Where id=2;
                                    Click Element                                                                           (//a[text()='Response'])[2]
                                    ${response2}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${response2}                                                                             "id": "2"
    ELSE IF                         "${caseType}" == "uiRecord"
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: ui_record')])[1]
                                    Click Element                                                                           (//a[text()='Request'])[1]
                                    ${request1}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${request1}                                                                              "name":"Default","url":"https://www.google.com.tr"
                                    Click Element                                                                           (//a[text()='Response'])[1]
                                    ${response1}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[1]
                                    Should Contain                                                                          ${response1}                                                                             expect(received).toHaveText(expected)
                                    Click Element                                                                           (//div[@class='mui--text-title' and contains(text(),'Plugin: ui_record')])[2]
                                    Click Element                                                                           (//a[text()='Request'])[2]
                                    ${request2}=                                                                            Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${request2}                                                                              "name":"Default","url":"https://www.google.com.tr"
                                    Click Element                                                                           (//a[text()='Response'])[2]
                                    ${response2}=                                                                           Get Text                                                                                 (//div[@class='mui-tabs__pane mui--is-active']/pre)[2]
                                    Should Contain                                                                          ${response2}                                                                             PASS ./Default.test.js
    END

