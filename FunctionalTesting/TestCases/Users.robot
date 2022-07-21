*** Settings ***
Resource            ../Keywords/UsersPage.robot
Resource            ../Keywords/LoginPage.robot
Resource            ../Keywords/GroupsPage.robot
Resource            ./ApiTesting/Keywords/GroupsPage.robot
Resource            ./ApiTesting/Keywords/LoginPage.robot
Test Setup          Setup Browser
Test Teardown       Teardown Browser
Suite Teardown      Clean Everything
Force Tags          users

*** Keywords ***
Clean Everything
    Get Authorization Token
    Delete All Groups

*** Test Cases ***
Should Be Connect the Group to the User
    [Tags]                              sanity
    Login to Supreme Test               eray.yagiz@huawei.com       1qaz!QAZ
    Go to Groups Page
    Add Groups
    Go to Users Page
    Connect the Group to the User