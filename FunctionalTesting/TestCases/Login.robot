*** Settings ***
Resource        ../Keywords/LoginPage.robot
Resource        ../Keywords/CommonPage.robot
Test Setup      Setup Browser
Test Teardown   Teardown Browser
Force Tags      login

*** Test Cases ***
1SI_LoginWithRegisteredUsernamePassword
    [Tags]                  regression
    ${currentUserName}=     Login to Supreme Test       eray.yagiz@huawei.com       1qaz!QAZ
                            Check the Profile Name      ${currentUserName}

2SI_LoginWithUnregisteredUsernamePassword
    [Tags]                  regression
    Login to Supreme Test   unregistered@test.com       1234
    Check the Login Fail

3SI_LoginWithoutUsername
    [Tags]                  regression
    Login to Supremetest    userPassword=1qaz!QAZ
    Check the Login Fail

4SI_LoginWithoutPassword
    [Tags]                  regression
    Login to Supremetest    userEmailAddress=eray.yagiz@huawei.com
    Check the Login Fail

5SI_LoginWithInvalidUsername
    [Tags]                  regression
    Login to Supremetest    invalidlogin@huawei.com     1qaz!QAZ
    Check the Login Fail

6SI_LoginWithInvalidPassword
    [Tags]                  regression
    Login to Supremetest    eray.yagiz@huawei.com       1234
    Check the Login Fail