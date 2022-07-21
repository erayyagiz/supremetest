*** Settings ***
Resource            ../Keywords/ConnectionsPage.robot
Resource            ../Keywords/LoginPage.robot
Resource            ./ApiTesting/Keywords/ConnectionsPage.robot
Resource            ./ApiTesting/Keywords/LoginPage.robot
Test Setup          Setup Browser
Test Teardown       Teardown Browser
Suite Teardown      Clean Everything
Force Tags          connections

*** Keywords ***
Clean Everything
    Get Authorization Token
    Delete All Namespaces

*** Test Cases ***
Should Be Add Node Groups
    [Tags]                      sanity
    Login to Supreme Test       eray.yagiz@huawei.com      1qaz!QAZ
    Set Selenium Speed          0.2 seconds
    Go to Connections Page
    Add Namespaces
    Add Environments
    Add Arc Node Groups
    Add Arc Nodes
    Go Back
    Add Rest Node Groups
    Add Rest Nodes
    Go Back
    Add Selenium Node Groups
    Add Selenium Nodes
    Go Back
    Add Mysql Node Groups
    Add Mysql Nodes
    Go Back
    Add UI Record Node Groups
    Add UI Record Nodes
