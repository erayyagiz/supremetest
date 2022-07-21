*** Settings ***
Resource        ../Keywords/UsersPage.robot
Resource        ../Keywords/LoginPage.robot
Force Tags      users
Suite Setup     Get Authorization Token
Suite Teardown  Close All Sessions

*** Test Cases ***
Should Invite Teammate
    [Tags]      invite              apitesting
                Invite Teammate
