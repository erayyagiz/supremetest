*** Settings ***
Resource            ../Keywords/TaskManagementsPage.robot
Resource            ../Keywords/LoginPage.robot
Resource            ./ApiTesting/Keywords/ConnectionsPage.robot
Resource            ./ApiTesting/Keywords/TestDesignPage.robot
Resource            ./ApiTesting/Keywords/LoginPage.robot
Suite Setup         Preparation For Test Cases
Test Setup          Setup Browser
Test Teardown       Teardown Browser
Suite Teardown      Clean Everything
Force Tags          taskmanagements

*** Variables ***
${SCHEDULED_TASK_NAME}            null
${RECURRENT_TASK_NAME}            null
${ARC_MASSIVE_TASK_NAME}          null
${REST_MASSIVE_TASK_NAME}         null
${SELENIUM_MASSIVE_TASK_NAME}     null
${MYSQL_MASSIVE_TASK_NAME}        null
${UI_MASSIVE_TASK_NAME}           null
${ARC_FILE_NAME}                  null
${REST_FILE_NAME}                 null
${SELENIUM_FILE_NAME}             null
${MYSQL_FILE_NAME}                null
${UI_FILE_NAME}                   null

*** Keywords ***
Preparation For Test Cases
    Get Authorization Token
    Add All Node Group with Nodes
    Add All Test Cases With Test Steps

Clean Everything
    Delete All Groups
    Delete All Namespaces

*** Test Cases ***
Should Be Create Scheduled Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com                           1qaz!QAZ
    Go to Task Managements Page
    ${taskName}=                                    Create Scheduled or Recurrent Mode Task         SCHEDULED
    Set Suite Variable                              ${SCHEDULED_TASK_NAME}                          ${taskName}


Should Be Create Recurrent Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com                           1qaz!QAZ
    Go to Task Managements Page
    ${taskName}=                                    Create Scheduled or Recurrent Mode Task         RECURRENT
    Set Suite Variable                              ${RECURRENT_TASK_NAME}                          ${taskName}


Should Be Create UI Record Massive Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com            1qaz!QAZ
    Go to Task Managements Page
    ${massiveTaskName}                              ${fileName}=                     Create Massive Mode Task         uiRecord
    Set Suite Variable                              ${UI_MASSIVE_TASK_NAME}          ${massiveTaskName}
    Set Suite Variable                              ${UI_FILE_NAME}                  ${fileName}


Should Be Create Arc Massive Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com             1qaz!QAZ
    Go to Task Managements Page
    ${massiveTaskName}                              ${fileName}=                      Create Massive Mode Task          arc
    Set Suite Variable                              ${ARC_MASSIVE_TASK_NAME}          ${massiveTaskName}
    Set Suite Variable                              ${ARC_FILE_NAME}                  ${fileName}


Should Be Create Rest Massive Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com             1qaz!QAZ
    Go to Task Managements Page
    ${massiveTaskName}                              ${fileName}=                      Create Massive Mode Task          rest
    Set Suite Variable                              ${REST_MASSIVE_TASK_NAME}         ${massiveTaskName}
    Set Suite Variable                              ${REST_FILE_NAME}                 ${fileName}


Should Be Create Selenium Massive Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com            1qaz!QAZ
    Go to Task Managements Page
    ${massiveTaskName}                              ${fileName}=                     Create Massive Mode Task         selenium
    Set Suite Variable                              ${SELENIUM_MASSIVE_TASK_NAME}    ${massiveTaskName}
    Set Suite Variable                              ${SELENIUM_FILE_NAME}            ${fileName}


Should Be Create My Sql Massive Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com            1qaz!QAZ
    Go to Task Managements Page
    ${massiveTaskName}                              ${fileName}=                     Create Massive Mode Task         mySql
    Set Suite Variable                              ${MYSQL_MASSIVE_TASK_NAME}       ${massiveTaskName}
    Set Suite Variable                              ${MYSQL_FILE_NAME}               ${fileName}


Should Be Wait For Getting Task Results
    [Tags]                                          sanity
    Sleep                                           400 seconds


Should Be Check Scheduled Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com      1qaz!QAZ
    Go to Task Managements Page
    Check the Scheduled or Recurrent Task Results   SCHEDULED                  ${scheduledTaskName}


Should Be Check Recurrent Mode Task
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com      1qaz!QAZ
    Go to Task Managements Page
    Check the Scheduled or Recurrent Task Results   RECURRENT                  ${recurrentTaskName}


Should Be Check Arc Massive Task Result
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com      1qaz!QAZ
    Go to Task Managements Page
    Check the Massive Task Results                  arc                        ${arcMassiveTaskName}            ${arcFileName}


Should Be Check Rest Massive Task Result
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com      1qaz!QAZ
    Go to Task Managements Page
    Check the Massive Task Results                  rest                       ${restMassiveTaskName}           ${restFileName}


Should Be Check Selenium Massive Task Result
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com      1qaz!QAZ
    Go to Task Managements Page
    Check the Massive Task Results                  selenium                   ${seleniumMassiveTaskName}       ${seleniumFileName}


Should Be Check My Sql Massive Task Result
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com      1qaz!QAZ
    Go to Task Managements Page
    Check the Massive Task Results                  mySql                      ${mysqlMassiveTaskName}          ${mysqlFileName}


Should Be Check UI Record Massive Task Result
    [Tags]                                          sanity
    Login to Supreme Test                           eray.yagiz@huawei.com      1qaz!QAZ
    Go to Task Managements Page
    Check the Massive Task Results                  uiRecord                   ${uiMassiveTaskName}             ${uiFileName}