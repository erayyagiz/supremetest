*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String
Library    Process
Library    SeleniumLibrary
Library    DateTime
Library    OperatingSystem

*** Variables ***
${BASE_URL}         https://app.supremetest.net
${BROWSER}          Chrome
${REMOTE_URL}


*** Keywords ***
Setup Browser
    ${options}=                     Evaluate                                    sys.modules['selenium.webdriver'].ChromeOptions()   sys
    Call Method                     ${options}                                  add_argument                                        --start-maximized
    Call Method                     ${options}                                  add_argument                                        --test-type
    #Call Method                     ${options}                                  add_argument                                        --headless
    Call Method                     ${options}                                  add_extension                                        seleniumIdeExtension.crx
    Open Browser                    ${BASE_URL}                                 ${BROWSER}                                           options=${options}                             remote_url=${REMOTE_URL}
    Set Selenium Timeout            15 seconds
    Set Selenium Implicit Wait      10 seconds
    Set Selenium Speed              0.05 seconds
    Maximize Browser Window

Teardown Browser
    Close All Browsers
    Delete All Sessions

Click Element If Exist
    [Arguments]        ${element}
    ${output}=         Get Element Count        ${element}
    IF                 "${output}" == "1"
                       Click Element            ${element}
    END

Get Body From Json File
    [Arguments]     ${jsonFileName}
    ${jsonBody}=    Load Json From File         ./Json&Files/Json/${jsonFileName}.json
    Log             ${jsonBody}
    [Return]        ${jsonBody}


Get Value From Json File
    [Arguments]     ${jsonFileName}             ${content}
    ${jsonFile}=    Get Body From Json File     ${jsonFileName}
    ${val}=         Get From Dictionary         ${jsonFile}             ${content}
    Log             ${val}
    [Return]        ${val}


Get Value From Dictionary Response Content
    [Arguments]     ${response}                 ${content}
    ${val}=         Convert String To Json      ${response.content}
    ${val}=         Get From Dictionary         ${val}                  ${content}
    Log             ${val}
    [Return]        ${val}


Get Value From Json Response Content
    [Arguments]     ${response}                 ${content}
    ${val}=         Convert String To Json      ${response.content}
    ${val}=         Get Value From Json         ${val}                  ${content}
    Log             ${val}
    [Return]        ${val}



