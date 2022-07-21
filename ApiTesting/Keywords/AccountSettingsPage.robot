*** Settings ***
Resource    ../../Resources/customBase.robot

*** Variables ***
${AUTH_TOKEN}   null
${USER_ID}      null

*** Keywords ***
Update Full Name With Valid
    Create Session                updateFullName                          ${BASE_URL}                     disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${name}=                      Generate Random String                  8
    ${bodyData}=                  Create Dictionary                       full_name=${name}
    ${responsePATCH}=             Patch On Session                        updateFullName                  /serve/users/${USER_ID}/                     data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            200
    Log                           ${responsePATCH.content}
    ${responseGET}=               Get On Session                          updateFullName                  /serve/users/get_current_user/       headers=${header}
    Should Be Equal As Strings    ${responseGET.status_code}              200
    ${updatedFullName}            Get Value From Json Response Content    ${responseGET}                  $.full_name
    Should Contain                ${updatedFullName}                      ${name}


Update Full Name With Empty
    Create Session                updateFullName                          ${BASE_URL}                    disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${bodyData}=                  Create Dictionary                       full_name=
    ${responsePATCH}=             Patch On Session                        updateFullName                  /serve/users/${USER_ID}/        expected_status=400     data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            400
    Log                           ${responsePATCH.content}
    ${content}                    Get Value From Json Response Content    ${responsePATCH}                $.full_name
    Should Be Equal As Strings    ${content}                              [['This field may not be blank.']]

Update Email Adress With Valid
    Create Session                updateEmailAdress                       ${BASE_URL}                     disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${email}=                     Generate Random String                  8
    ${bodyData}=                  Create Dictionary                       email=${email}@${email}.com
    ${responsePATCH}=             Patch On Session                        updateEmailAdress               /serve/users/${USER_ID}/                     data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            200
    Log                           ${responsePATCH.content}
    ${responseGET}=               Get On Session                          updateEmailAdress               /serve/users/get_current_user/      headers=${header}
    Should Be Equal As Strings    ${responseGET.status_code}              200
    ${updatedEmail}               Get Value From Json Response Content    ${responseGET}                  $.email
    Should Contain                ${updatedEmail}                         ${email}@${email}.com


Update Email Adress With Invalid
    Create Session                updateEmailAdress                       ${BASE_URL}                           disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${email}=                     Generate Random String                  8
    ${bodyData}=                  Create Dictionary                       email=${email}
    ${responsePATCH}=             Patch On Session                        updateEmailAdress                     /serve/users/${USER_ID}/      expected_status=400   data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            400
    Log                           ${responsePATCH.content}
    ${content}                    Get Value From Json Response Content    ${responsePATCH}                      $.email
    Should Be Equal As Strings    ${content}                              [['Enter a valid email address.']]


Update Email Adress With Empty
    Create Session                updateEmailAdress                       ${BASE_URL}                           disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${bodyData}=                  Create Dictionary                       email=
    ${responsePATCH}=             Patch On Session                        updateEmailAdress                     /serve/users/${USER_ID}/        expected_status=400    data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            400
    Log                           ${responsePATCH.content}
    ${content}                    Get Value From Json Response Content    ${responsePATCH}                      $.email
    Should Be Equal As Strings    ${content}                              [['This field may not be blank.']]


Update Phone Number With Valid
    Create Session                updatePhoneNumber                       ${BASE_URL}                     disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${phone}=                     Generate Random String                  8                               [NUMBERS]
    ${bodyData}=                  Create Dictionary                       mobile=05${phone}
    ${responsePATCH}=             Patch On Session                        updatePhoneNumber               /serve/users/${USER_ID}/                     data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            200
    Log                           ${responsePATCH.content}
    ${responseGET}=               Get On Session                          updatePhoneNumber               /serve/users/get_current_user/      headers=${header}
    Should Be Equal As Strings    ${responseGET.status_code}              200
    ${updatedPhone}               Get Value From Json Response Content    ${responseGET}                  $.mobile
    Should Be Equal As Strings    ${updatedPhone}                         ['05${phone}']


Update Phone Number With Empty
    Create Session                updatePhoneNumber                       ${BASE_URL}                     disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${bodyData}=                  Create Dictionary                       mobile=
    ${responsePATCH}=             Patch On Session                        updatePhoneNumber               /serve/users/${USER_ID}/                     data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            200
    Log                           ${responsePATCH.content}
    ${responseGET}=               Get On Session                          updatePhoneNumber               /serve/users/get_current_user/      headers=${header}
    Should Be Equal As Strings    ${responseGET.status_code}              200
    ${updatedPhone}               Get Value From Json Response Content    ${responseGET}                  $.mobile
    Should Be Equal As Strings    ${updatedPhone}                         ['']


Update Visible Guide
    [Arguments]                   ${param}
    Create Session                updateVisibleGuide                      ${BASE_URL}                     disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${bodyData}=                  Create Dictionary                       is_visible_introduction=${param}
    ${responsePATCH}=             Patch On Session                        updateVisibleGuide              /serve/users/${USER_ID}/                     data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            200
    Log                           ${responsePATCH.content}
    ${responseGET}=               Get On Session                          updateVisibleGuide              /serve/users/get_current_user/      headers=${header}
    Should Be Equal As Strings    ${responseGET.status_code}              200
    ${updatedVisibleGuide}        Get Value From Json Response Content    ${responseGET}                  $.is_visible_introduction
    Should Be Equal As Strings    ${updatedVisibleGuide}                  [${param}]


Update Theme
    [Arguments]                   ${param}
    Create Session                updateTheme                             ${BASE_URL}                     disable_warnings=1
    ${header}=                    Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${bodyData}=                  Create Dictionary                       theme=${param}
    ${responsePATCH}=             Patch On Session                        updateTheme                     /serve/users/${USER_ID}/                     data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${responsePATCH.status_code}            200
    Log                           ${responsePATCH.content}
    ${responseGET}=               Get On Session                          updateTheme                     /serve/users/get_current_user/      headers=${header}
    Should Be Equal As Strings    ${responseGET.status_code}              200
    ${updatedTheme}               Get Value From Json Response Content    ${responseGET}                  $.theme
    Should Be Equal As Strings    ${updatedTheme}                         [${param}]