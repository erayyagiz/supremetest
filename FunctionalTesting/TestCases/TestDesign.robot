*** Settings ***
Resource            ../Keywords/TestDesignPage.robot
Resource            ../Keywords/LoginPage.robot
Resource            ./ApiTesting/Keywords/ConnectionsPage.robot
Resource            ./ApiTesting/Keywords/TestDesignPage.robot
Resource            ./ApiTesting/Keywords/LoginPage.robot
Suite Setup         Preparation For Suite
Test Setup          Setup Browser
Test Teardown       Teardown Browser
Suite Teardown      Clean Everything
Force Tags          testdesign

*** Keywords ***
Preparation For Suite
    Get Authorization Token
    Add All Node Group with Nodes
    Add All Test Cases Without Test Steps

Clean Everything
    Delete All Groups
    Delete All Namespaces

*** Test Cases ***
Should Be Add Test Cases
    [Tags]                          sanity
    Login to Supreme Test           eray.yagiz@huawei.com       1qaz!QAZ
    Add Test Cases

Should Be Execute Arc Test Case
    [Tags]                          sanity
    Login to Supreme Test           eray.yagiz@huawei.com       1qaz!QAZ
    Add Arc Test Step
    Execute Arc Test Case

Should Be Execute Rest Test Case
    [Tags]                          sanity
    Login to Supreme Test           eray.yagiz@huawei.com       1qaz!QAZ
    Add Rest Test Step
    Execute Rest Test Case

Should Be Execute Selenium Test Case
    [Tags]                          sanity
    Login to Supreme Test           eray.yagiz@huawei.com       1qaz!QAZ
    Add Selenium Test Step
    Execute Selenium Test Case

Should Be Execute My Sql Test Case
    [Tags]                          sanity
    Login to Supreme Test           eray.yagiz@huawei.com       1qaz!QAZ
    Add My Sql Test Step
    Execute My Sql Test Case

Should Be Execute UI Record Test Case
    [Tags]                          sanity
    Login to Supreme Test           eray.yagiz@huawei.com       1qaz!QAZ
    Add UI Record Test Step
    Execute UI Record Test Case