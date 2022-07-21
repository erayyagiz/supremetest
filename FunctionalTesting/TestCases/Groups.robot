*** Settings ***
Resource            ../Keywords/GroupsPage.robot
Resource            ../Keywords/LoginPage.robot
Resource            ./ApiTesting/Keywords/GroupsPage.robot
Resource            ./ApiTesting/Keywords/LoginPage.robot
Test Setup          Setup Browser
Test Teardown       Teardown Browser
Suite Teardown      Clean Everything
Force Tags          groups

*** Keywords ***
Clean Everything
    Get Authorization Token
    Delete All Groups

*** Test Cases ***
Should Be Add Group
    [Tags]                      sanity
    Login to Supreme Test       eray.yagiz@huawei.com      1qaz!QAZ
    Go to Groups Page
    Add Groups