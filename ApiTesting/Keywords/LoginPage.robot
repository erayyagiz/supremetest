*** Settings ***
Resource    ../../Resources/customBase.robot


*** Keywords ***
Get Authorization Token
#    ${options}=                         Evaluate                                    sys.modules['selenium.webdriver'].ChromeOptions()   sys
#    Call Method                         ${options}                                  add_argument                                        start-maximized
#    Call Method                         ${options}                                  add_argument                                        test-type
#    Call Method                         ${options}                                  add_argument                                        --allow-running-insecure-content
#    Call Method                         ${options}                                  add_argument                                        --disable-web-security
#    Call Method                         ${options}                                  add_argument                                        --enable-features\="AllowAllCookies"
#    Open Browser                        ${BASE_URL}                                 ${BROWSER}
#    Set Selenium Timeout                25 seconds
#    Maximize Browser Window
#    Wait Until Element is Visible       name:username
#    Input Text                          name:username                               ${USERNAME}
#    Input Text                          name:password                               ${PASSWORD}
#    Click Element                       name:login
#    Wait Until Element is Visible       css:header.MuiAppBar-root
#    Go To                               ${BASE_URL}/user
#
#    ${Session}                          Get Cookie                                  SESSION
#    Set Global Variable                 ${AUTH_TOKEN}                               ${Session.value}
#    Close Browser
    Create Session                      getUserInfo                                 ${BASE_URL}                                         disable_warnings=1
    ${bodyData}=                        Get Body From Json File                     login
    ${responsePOST}=                    Post On Session                             getUserInfo                                         serve/auth/login/                    data=${bodyData}
    Status Should Be                    200                                         ${responsePOST}
    ${access}=                          Get Value From Dictionary Response Content  ${responsePOST}                                     access
    Should Not Be Empty                 ${access}
    ${authToken}=                       Convert To String                           Bearer ${access}
    Set Global Variable                 ${AUTH_TOKEN}                               ${authToken}

    ${header}=                          Create Dictionary                           Authorization=${AUTH_TOKEN}
    ${responseGET1}=                    Get On Session                              getUserInfo                                         /serve/users/get_current_user/       headers=${header}
    Should Be Equal As Strings          ${responseGET1.status_code}                 200
    ${userId}                           Get Value From Json Response Content        ${responseGET1}                                     $.id
    Set Global Variable                 ${USER_ID}                                  ${userId}[0]

    ${responseGET2}=                    Get On Session                              getUserInfo                                         /serve/plugins/                      headers=${header}
    Should Be Equal As Strings          ${responseGET2.status_code}                 200
    ${seleniumPlugNo}                   Get Value From Json Response Content        ${responseGET2}                                     $..results[?(@.name=='selenium')].id
    ${arcPlugNo}                        Get Value From Json Response Content        ${responseGET2}                                     $..results[?(@.name=='arc')].id
    ${restPlugNo}                       Get Value From Json Response Content        ${responseGET2}                                     $..results[?(@.name=='rest')].id
    ${uiRecordPlugNo}                   Get Value From Json Response Content        ${responseGET2}                                     $..results[?(@.name=='ui_record')].id
    ${mysqlPlugNo}                      Get Value From Json Response Content        ${responseGET2}                                     $..results[?(@.name=='mysql')].id
    Set Global Variable                 ${SELENIUM_PLUG_NO}                         ${seleniumPlugNo}[0]
    Set Global Variable                 ${ARC_PLUG_NO}                              ${arcPlugNo}[0]
    Set Global Variable                 ${REST_PLUG_NO}                             ${restPlugNo}[0]
    Set Global Variable                 ${UIRECORD_PLUG_NO}                         ${uiRecordPlugNo}[0]
    Set Global Variable                 ${MYSQL_PLUG_NO}                            ${mysqlPlugNo}[0]

Close All Sessions
    Delete All Sessions


