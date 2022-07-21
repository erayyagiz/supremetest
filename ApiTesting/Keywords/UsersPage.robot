*** Settings ***
Resource    ../../Resources/customBase.robot

*** Variables ***
${AUTH_TOKEN}   null
${USER_ID}      null

*** Keywords ***
Invite Teammate
    Create Session                  inviteTeammate                                  ${BASE_URL}                        disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${email}=                       Generate Random String                          5
    ${emails}=                      Create List                                     ${email}@${email}.com
    ${bodyData}=                    Create Dictionary                               emails=${emails}
    ${responsePOST1}=               Post On Session                                 inviteTeammate                     /serve/users/invite_teammate/       json=${bodyData}             headers=${header}
    Status Should Be                201                                             ${responsePOST1}
    ${responsePOST2}=               Post On Session                                 inviteTeammate                     /serve/users/cancel_invitation/     params=email=${emails}[0]    headers=${header}
    Status Should Be                200                                             ${responsePOST2}