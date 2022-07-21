*** Settings ***
Resource    ../../Resources/customBase.robot

*** Variables ***
${AUTH_TOKEN}   null
${USER_ID}      null

*** Keywords ***
Add Group
    Create Session                  addGroup                                        ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${groupName}=                   Generate Random String                          8
    ${bodyData}=                    Create Dictionary                               name=${groupName}
    ${responsePOST}=                Post On Session                                 addGroup                        /serve/groups/                       data=${bodyData}                    headers=${header}
    ${groupId1}=                    Get Value From Dictionary Response Content      ${responsePOST}                 id
    Set Global Variable             ${GROUP_ID}                                     ${groupId1}
    Log                             ${responsePOST.content}
    Should Be Equal As Strings      ${responsePOST.status_code}                     201
    ${responseGET}=                 Get On Session                                  addGroup                        /serve/groups/                       params=owner=group_${groupId1}      headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    ${addedGroupName}               Get Value From Json Response Content            ${responseGET}                  $.results[?(@.id==${groupId1})]..name
    Should Contain                  ${addedGroupName}                               ${groupName}
    @{groupList}                    Create List                                     ${groupId1}
    ${bodyData}=                    Create Dictionary                               groups=@{groupList}
    ${responsePATCH}=               Patch On Session                                addGroup                        /serve/users/${USER_ID}/             data=${bodyData}                  headers=${header}
    Should Be Equal As Strings      ${responsePATCH.status_code}                    200
    [Return]                        ${groupId}


Delete Group
    [Arguments]                     ${groupId}
    Create Session                  deleteGroup                               ${BASE_URL}                    disable_warnings=1
    ${header}=                      Create Dictionary                         Authorization=${AUTH_TOKEN}
    @{groupList}                    Create List
    ${bodyData}=                    Create Dictionary                         groups=${groupList}
    ${responsePATCH}=               Patch On Session                          deleteGroup                     /serve/users/${USER_ID}/              json=${bodyData}       headers=${header}
    Should Be Equal As Strings      ${responsePATCH.status_code}              200
    ${responseDEL}=                 Delete On Session                         deleteGroup                     /serve/groups/${groupId}/    headers=${header}
    Should Be Equal As Strings      ${responseDEL.status_code}                204
    ${responseGET}=                 Get On Session                            deleteGroup                     /serve/groups/               headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                200
    @{groups}=                      Get Value From Json Response Content      ${responseGET}                  $.results..id
    FOR                             ${i}                                      IN                              @{groups}
                                    Should Not Be Equal As Strings            ${i}                            ${groupId}
    END


Delete All Groups
    Create Session                  deleteGroup                               ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                         Authorization=${AUTH_TOKEN}
    @{groupList}                    Create List
    ${bodyData}=                    Create Dictionary                         groups=${groupList}
    ${responsePATCH}=               Patch On Session                          deleteGroup                     /serve/users/${USER_ID}/              json=${bodyData}       headers=${header}
    Should Be Equal As Strings      ${responsePATCH.status_code}              200
    ${responseGET}=                 Get On Session                            deleteGroup                     /serve/groups/               headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                200
    @{groups}=                      Get Value From Json Response Content      ${responseGET}                  $.results..id
    FOR                             ${groupId}                                IN                              @{groups}
                                    ${responseDEL}=                           Delete On Session               deleteGroup                     /serve/groups/${groupId}/    headers=${header}
                                    Should Be Equal As Strings                ${responseDEL.status_code}      204
    END


Update Group
    [Arguments]                     ${groupId}
    Create Session                  updateGroup                                     ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${newGroupName}=                Generate Random String                          6
    ${bodyData}=                    Create Dictionary                               name=${newGroupName}
    ${responsePATCH}=               Patch On Session                                updateGroup                     /serve/groups/${groupId}/             data=${bodyData}                    headers=${header}
    Log                             ${responsePATCH.content}
    Should Be Equal As Strings      ${responsePATCH.status_code}                    200
    ${responseGET}=                 Get On Session                                  updateGroup                     /serve/groups/                       params=owner=group_${groupId}      headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    ${updatedGroupName}             Get Value From Json Response Content            ${responseGET}                  $.results[?(@.id==${groupId})]..name
    Should Contain                  ${updatedGroupName}                             ${newGroupName}
    [Return]                        ${groupId}