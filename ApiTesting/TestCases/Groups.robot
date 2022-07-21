*** Settings ***
Resource        ../Keywords/GroupsPage.robot
Resource        ../Keywords/LoginPage.robot
Force Tags      groups
Suite Setup     Get Authorization Token
Suite Teardown  Close All Sessions

*** Test Cases ***
Should Add Group
    [Tags]       add                apitesting
    ${groupId}=  Add Group


Should Update Group
    [Tags]       update             apitesting
    ${groupId}=  Add Group
                 Update Group       ${groupId}


Should Delete Group
    [Tags]       delete             apitesting
    ${groupId}=  Add Group
                 Delete Group       ${groupId}


Should All Delete Group
    [Tags]       all                delete
                 Delete All Groups