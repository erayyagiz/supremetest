*** Settings ***
Resource    ../../Resources/customBase.robot
Resource    GroupsPage.robot

*** Variables ***
${AUTH_TOKEN}               null
${USER_ID}                  null
${SELENIUM_PLUG_NO}         null
${ARC_PLUG_NO}              null
${REST_PLUG_NO}             null
${UIRECORD_PLUG_NO}         null
${MYSQL_PLUG_NO}            null
${GROUP_ID}                 null
${NAMESPACE_ID}             null
${SELENIUM_NODE_GROUP_ID}   null
${ARC_NODE_GROUP_ID}        null
${REST_NODE_GROUP_ID}       null
${MYSQL_NODE_GROUP_ID}      null
${UI_RECORD_NODE_GROUP_ID}  null


*** Keywords ***
Add Product
    [Arguments]                     ${groupId}                                      ${namespaceId}
    Create Session                  addProduct                                      ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${bodyData}=                    Create Dictionary                               parent=group_${groupId}         type=casesProduct                               text=productAuto            env_namespace=${namespaceId}
    ${responsePOST}=                Post On Session                                 addProduct                      /serve/directories/                             data=${bodyData}            headers=${header}
    ${productId}=                   Get Value From Dictionary Response Content      ${responsePOST}                 id
    Log                             ${productId}
    Log                             ${responsePOST.content}
    Should Be Equal As Strings      ${responsePOST.status_code}                     201
    ${responseGET}=                 Get On Session                                  addProduct                      /serve/tree/cases/                              params=owner=group_${groupId}      headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    ${addedProductName}             Get Value From Json Response Content            ${responseGET}                  $..directories[?(@.id=='${productId}')].text
    Log                             ${addedProductName}
    Should Contain                  ${addedProductName}                             productAuto
    [Return]                        ${productId}


Delete Product
    [Arguments]                     ${productId}                                    ${groupId}
    Create Session                  deleteProduct                                   ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${responseDEL}=                 Delete On Session                               deleteProduct                   /serve/directories/${productId}/       headers=${header}
    Should Be Equal As Strings      ${responseDEL.status_code}                      204
    ${responseGET}=                 Get On Session                                  deleteProduct                   /serve/tree/cases/                     params=owner=group_${groupId}      headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    @{products}=                    Get Value From Json Response Content            ${responseGET}                  $..directories
    Log                             ${products}
    Should Be Empty                 @{products}


Add Version
    [Arguments]                     ${productId}                                    ${groupId}
    Create Session                  addVersion                                      ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${bodyData}=                    Create Dictionary                               parent=${productId}             text=v1                                         type=casesVersion
    ${responsePOST}=                Post On Session                                 addVersion                      /serve/directories/                             data=${bodyData}    headers=${header}
    ${versionId}=                   Get Value From Dictionary Response Content      ${responsePOST}                 id
    Should Be Equal As Strings      ${responsePOST.status_code}                     201
    Log                             ${responsePOST.content}
    Log                             ${versionId}
    ${responseGET}=                 Get On Session                                  addProduct                      /serve/tree/cases/                              params=owner=group_${groupId}      headers=${header}
    ${addedVersionName}             Get Value From Json Response Content            ${responseGET}                  $..directories[?(@.id=='${versionId}')].text
    Log                             ${addedVersionName}
    Should Contain                  ${addedVersionName}                             v1
    [Return]                        ${versionId}


Delete Version
    [Arguments]                     ${versionId}                                    ${groupId}
    Create Session                  deleteVersion                                   ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${responseDEL}=                 Delete On Session                               deleteVersion                   /serve/directories/${versionId}/         headers=${header}
    Should Be Equal As Strings      ${responseDEL.status_code}                      204
    ${responseGET}=                 Get On Session                                  deleteVersion                   /serve/tree/cases/                       params=owner=group_${groupId}    headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    @{versions}=                    Get Value From Json Response Content            ${responseGET}                  $.directories..id
    Log                             ${versions}
    FOR                             ${i}                                            IN                              @{versions}
                                    Should Not Be Equal As Strings                  ${i}                            ${versionId}
    END


Add Folder
    [Arguments]                     ${versionId}                                    ${groupId}
    Create Session                  addFolder                                       ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${bodyData}=                    Create Dictionary                               parent=${versionId}             text=FolderAuto                                 type=casesFolder
    ${response}=                    Post On Session                                 addFolder                       /serve/directories/                             data=${bodyData}    headers=${header}
    ${folderId}=                    Get Value From Dictionary Response Content      ${response}                     id
    Should Be Equal As Strings      ${response.status_code}                         201
    Log                             ${response.content}
    Log                             ${folderId}
    ${responseGET}=                 Get On Session                                  addFolder                       /serve/tree/cases/                              params=owner=group_${groupId}      headers=${header}
    ${addedFolderName}              Get Value From Json Response Content            ${responseGET}                  $..directories[?(@.id=='${folderId}')].text
    Log                             ${addedFolderName}
    Should Contain                  ${addedFolderName}                              FolderAuto
    [Return]                        ${folderId}


Delete Folder
    [Arguments]                     ${folderId}                                     ${groupId}
    Create Session                  deleteFolder                                    ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${responseDEL}=                 Delete On Session                               deleteFolder                    /serve/directories/${folderId}/          headers=${header}
    Should Be Equal As Strings      ${responseDEL.status_code}                      204
    ${responseGET}=                 Get On Session                                  deleteFolder                    /serve/tree/cases/                       params=owner=group_${groupId}      headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    @{folders}=                     Get Value From Json Response Content            ${responseGET}                  $.directories..id
    Log                             ${folders}
    FOR                             ${i}                                            IN                              @{folders}
                                    Should Not Be Equal As Strings                  ${i}                            ${folderId}
    END


Add Test Case
    [Arguments]                     ${folderId}                                     ${groupId}                      ${caseType}
    Create Session                  addTestCase                                     ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${bodyData}=                    Create Dictionary                               parent=${folderId}              name=${caseType}                        type=casesCase
    ${response}=                    Post On Session                                 addTestCase                     /serve/cases/                           data=${bodyData}        headers=${header}
    ${caseId}=                      Get Value From Dictionary Response Content      ${response}                     id
    Should Be Equal As Strings      ${response.status_code}                         201
    Log                             ${response.content}
    Log                             ${caseId}
    ${responseGET}=                 Get On Session                                  addTestCase                     /serve/tree/cases/                      params=owner=group_${groupId}      headers=${header}
    ${addedTestCaseName}            Get Value From Json Response Content            ${responseGET}                  $..cases[?(@.id=='${caseId}')].text
    Log                             ${addedTestCaseName}
    Should Contain                  ${addedTestCaseName}                            ${caseType}
    [Return]                        ${caseId}


Delete Test Case
    [Arguments]                     ${caseId}                                       ${groupId}
    Create Session                  deleteTestCase                                  ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${responseDEL}=                 Delete On Session                               deleteTestCase                  /serve/cases/${caseId}/          headers=${header}
    Should Be Equal As Strings      ${responseDEL.status_code}                      204
    ${responseGET}=                 Get On Session                                  deleteTestCase                   /serve/tree/cases/              params=owner=group_${groupId}      headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    @{testCases}=                   Get Value From Json Response Content            ${responseGET}                   $.cases..id
    Log                             ${testCases}
    FOR                             ${i}                                            IN                               @{testCases}
                                    Should Not Be Equal As Strings                  ${i}                             ${caseId}
    END


Get Added Steps
    [Arguments]                     ${caseId}
    Create Session                  getAddedSteps                                   ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${response}=                    Get On Session                                  getAddedSteps                   /serve/cases/${caseId}/steps/    headers=${header}
    Should Be Equal As Strings      ${response.status_code}                         200
    Log                             ${response.content}
    ${startStepId}=                 Get Value From Json Response Content            ${response}                     $[?(@.name=='Start')].id
    ${startStepId}=                 Convert To String                               ${startStepId}
    @{startStepId}=                 Split String                                    ${startStepId}                  '
    Log                             ${startStepId}[1]
    ${endStepId}=                   Get Value From Json Response Content            ${response}                     $[?(@.name=='End')].id
    ${endStepId}=                   Convert To String                               ${endStepId}
    @{endStepId}=                   Split String                                    ${endStepId}                    '
    Log                             ${endStepId}[1]
    ${startStepSerialNumber}=       Get Value From Json Response Content            ${response}                     $[?(@.name=='Start')].serial
    ${startStepSerialNumber}=       Convert To String                               ${startStepSerialNumber}
    @{startStepSerialNumber}=       Split String                                    ${startStepSerialNumber}        '
    Log                             ${startStepSerialNumber}[1]
    ${endStepSerialNumber}=         Get Value From Json Response Content            ${response}                     $[?(@.name=='End')].serial
    ${endStepSerialNumber}=         Convert To String                               ${endStepSerialNumber}
    @{endStepSerialNumber}=         Split String                                    ${endStepSerialNumber}          '
    Log                             ${endStepSerialNumber}[1]
    [Return]                        ${startStepSerialNumber}[1]                     ${endStepSerialNumber}[1]       ${startStepId}[1]                       ${endStepId}[1]


Click Edit Button
    [Arguments]                     ${caseId}
    Create Session                  clickEditButton                         ${BASE_URL}                        disable_warnings=1
    ${header}=                      Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${response}=                    Patch On Session                        clickEditButton                    /serve/cases/${caseId}/edit/    headers=${header}
    Should Be Equal As Strings      ${response.status_code}                 200
    ${lockedBy}=                    Get Value From Json Response Content    ${response}                        locked
    Should Be Equal As Strings      ${lockedBy}                             [True]
    Log                             ${response.content}
    [Return]                        ${response.content}


Add Test Step
    [Arguments]                     ${caseId}                                       ${caseType}
    Create Session                  addTestStep                                     ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${position}=                    Create Dictionary                               x=${70}                         y=${-130}
    ${next_steps}=                  Create List
    ${bodyData}=                    Create Dictionary                               name=${caseType}                node_type=plugin        case=${caseId}      position=${position}    next_steps=${next_steps}
    ${response}=                    Post On Session                                 addTestStep                     /serve/steps/           json=${bodyData}    headers=${header}
    ${stepId}=                      Get Value From Dictionary Response Content      ${response}                     id
    Should Be Equal As Strings      ${response.status_code}                         201
    Log                             ${response.content}
    Log                             ${stepId}
    ${addedStepSerialNumber}=       Get Value From Dictionary Response Content      ${response}                     serial
    Log                             ${addedStepSerialNumber}
    ${responseGET}=                 Get On Session                                  addTestStep                     /serve/cases/${caseId}/steps/      headers=${header}
    ${addedStepName}                Get Value From Json Response Content            ${responseGET}                  $[?(@.id=='${stepId}')].name
    Log                             ${addedStepName}
    Should Contain                  ${addedStepName}                                ${caseType}
    [Return]                        ${stepId}                                       ${addedStepSerialNumber}


Delete Test Step
    [Arguments]                     ${stepId}                                       ${caseId}
    Create Session                  deleteTestStep                                  ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${responseDEL}=                 Delete On Session                               deleteTestStep                  /serve/steps/${stepId}/            headers=${header}
    Should Be Equal As Strings      ${responseDEL.status_code}                      204
    ${responseGET}=                 Get On Session                                  deleteTestStep                  /serve/cases/${caseId}/steps/      headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}                      200
    @{testSteps}=                   Get Value From Json Response Content            ${responseGET}                  $..id
    Log                             ${testSteps}
    FOR                             ${i}                                            IN                              @{testSteps}
                                    Should Not Be Equal As Strings                  ${i}                            ${stepId}
    END


Save Test Step
    [Arguments]                     ${stepId}                   ${caseType}                     ${nodeGroupId}=
    Create Session                  saveTestStep                ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary           Authorization=${AUTH_TOKEN}
    ${content}=                     Get Value From Json File    stepContents                    ${caseType}Content
    ${afterScript}=                 Get Value From Json File    stepAfterScripts                ${caseType}AfterScript
    IF                              "${caseType}" == "selenium"
                                    ${plugNo}=                  Set Variable                    ${seleniumPlugNo}
    ELSE IF                         "${caseType}" == "arc"
                                    ${plugNo}=                  Set Variable                    ${arcPlugNo}
    ELSE IF                         "${caseType}" == "rest"
                                    ${plugNo}=                  Set Variable                    ${restPlugNo}
    ELSE IF                         "${caseType}" == "uiRecord"
                                    ${plugNo}=                  Set Variable                    ${uirecordPlugNo}
    ELSE IF                         "${caseType}" == "mySql"
                                    ${plugNo}=                  Set Variable                    ${mysqlPlugNo}
    END
    ${bodyData}=                    Create Dictionary           stepId=${stepId}                name=${caseType}             plugin=${plugNo}    con_category=${nodeGroupId}    content=${content}    after_script=${afterScript}
    ${response}=                    Patch On Session            saveTestStep                    /serve/steps/${stepId}/      json=${bodyData}    headers=${header}
    Should Be Equal As Strings      ${response.status_code}     200
    Log                             ${response.content}
    [Return]                        ${response.content}


Add Way From Start Step to Added Step
    [Arguments]                     ${startStepId}                  ${addedStepSerialNumber}
    Create Session                  addWayFromStartToAddedStep      ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary               Authorization=${AUTH_TOKEN}
    ${next_steps}=                  Create List                     ${addedStepSerialNumber}
    ${bodyData}=                    Create Dictionary               next_steps=${next_steps}
    ${response}=                    Patch On Session                addWayFromStartToAddedStep      /serve/steps/${startStepId}/    json=${bodyData}    headers=${header}
    Should Be Equal As Strings      ${response.status_code}         200
    Log                             ${response.content}


Add Way From Added Step to End Step
    [Arguments]                     ${stepId}                       ${endStepSerialNumber}
    Create Session                  addWayFromAddedToEndStep        ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary               Authorization=${AUTH_TOKEN}
    ${next_step}=                   Create List                     ${endStepSerialNumber}
    ${bodyData}=                    Create Dictionary               next_steps=${next_step}
    ${response}=                    Patch On Session                addWayFromAddedToEndStep        /serve/steps/${stepId}/    json=${bodyData}    headers=${header}
    Should Be Equal As Strings      ${response.status_code}         200
    Log                             ${response.content}


Click Release Button
    [Arguments]                     ${caseId}
    Create Session                  clickReleaseButton                      ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${response}=                    Patch On Session                        clickReleaseButton              /serve/cases/${caseId}/release/    headers=${header}
    Should Be Equal As Strings      ${response.status_code}                 200
    Log                             ${response.content}
    ${lockedBy}=                    Get Value From Json Response Content    ${response}                     locked
    Should Be Equal As Strings      ${lockedBy}                             [False]
    [Return]                        ${response.content}


Add Value to Local Variable
    [Arguments]                     ${stepType}
    Create Session                  addValue                                 ${BASE_URL}                              disable_warnings=1
    ${header}=                      Create Dictionary                        Authorization=${AUTH_TOKEN}
    ${responseGET}=                 Get On Session                           addValue                                 /serve/parameters/                            headers=${header}
    Should Be Equal As Strings      ${responseGET.status_code}               200
    IF                              "${stepType}" == "arc"
                                    ${variableValueId}                       Get Value From Json Response Content     ${responseGET}                                $[?(@.name=='passwordArc')].id
                                    ${variableValueId}=                      Evaluate                                 max(${variableValueId})
                                    ${bodyData}=                             Create Dictionary                        value=1qaz!QAZ
    ELSE IF                         "${stepType}" == "selenium"
                                    ${variableValueId}                       Get Value From Json Response Content     ${responseGET}                                $[?(@.name=='urlSelenium')].id
                                    ${variableValueId}=                      Evaluate                                 max(${variableValueId})
                                    ${bodyData}=                             Create Dictionary                        value=https://www.google.com
    ELSE IF                         "${stepType}" == "rest"
                                    ${variableValueId}                       Get Value From Json Response Content     ${responseGET}                                $[?(@.name=='passwordRest')].id
                                    ${variableValueId}=                      Evaluate                                 max(${variableValueId})
                                    ${bodyData}=                             Create Dictionary                        value=1qaz!QAZ
    ELSE IF                         "${stepType}" == "uiRecord"
                                    ${variableValueId}                       Get Value From Json Response Content     ${responseGET}                                $[?(@.name=='valueUiRecord')].id
                                    ${variableValueId}=                      Evaluate                                 max(${variableValueId})
                                    ${bodyData}=                             Create Dictionary                        value=How did the idea for doodles originate?
    ELSE IF                         "${stepType}" == "mySql"
                                    ${variableValueId}                       Get Value From Json Response Content     ${responseGET}                                $[?(@.name=='idMySql')].id
                                    ${variableValueId}=                      Evaluate                                 max(${variableValueId})
                                    ${bodyData}=                             Create Dictionary                        value=1
    END
    ${responsePATCH}=               Patch On Session                         addValue                                 /serve/parameters/${variableValueId}/         data=${bodyData}                       headers=${header}
    Should Be Equal As Strings      ${responsePATCH.status_code}             200


Add All Test Cases With Test Steps
    ${groupId}=                                                                                                        Add Group
    ${productId}=                                                                                                      Add Product                             ${groupId}               ${namespaceId}
    ${versionId}=                                                                                                      Add Version                             ${productId}             ${groupId}
    ${folderId}=                                                                                                       Add Folder                              ${versionId}             ${groupId}
    ${seleniumCaseId}=                                                                                                 Add Test Case                           ${folderId}              ${groupId}                          selenium
    ${seleniumStartStepSerialNumber}  ${seleniumEndStepSerialNumber}  ${seleniumStartStepId}  ${seleniumEndStepId}=    Get Added Steps                         ${seleniumCaseId}
                                                                                                                       Click Edit Button                       ${seleniumCaseId}
    ${seleniumStepId}                 ${seleniumAddedStepSerialNumber}=                                                Add Test Step                           ${seleniumCaseId}        selenium
                                                                                                                       Save Test Step                          ${seleniumStepId}        selenium                            ${seleniumNodeGroupId}
                                                                                                                       Add Way From Start Step to Added Step   ${seleniumStartStepId}   ${seleniumAddedStepSerialNumber}
                                                                                                                       Add Way From Added Step to End Step     ${seleniumStepId}        ${seleniumEndStepSerialNumber}
                                                                                                                       Click Release Button                    ${seleniumCaseId}
                                                                                                                       Add Value to Local Variable             selenium
    ${arcCaseId}=                                                                                                      Add Test Case                           ${folderId}               ${groupId}                          arc
    ${arcStartStepSerialNumber}  ${arcEndStepSerialNumber}  ${arcStartStepId}  ${arcEndStepId}=                        Get Added Steps                         ${arcCaseId}
                                                                                                                       Click Edit Button                       ${arcCaseId}
    ${arcStepId}                 ${arcAddedStepSerialNumber}=                                                          Add Test Step                           ${arcCaseId}              arc
                                                                                                                       Save Test Step                          ${arcStepId}              arc                                 ${arcNodeGroupId}
                                                                                                                       Add Way From Start Step to Added Step   ${arcStartStepId}         ${arcAddedStepSerialNumber}
                                                                                                                       Add Way From Added Step to End Step     ${arcStepId}              ${arcEndStepSerialNumber}
                                                                                                                       Click Release Button                    ${arcCaseId}
                                                                                                                       Add Value to Local Variable             arc
    ${restCaseId}=                                                                                                     Add Test Case                           ${folderId}               ${groupId}                          rest
    ${restStartStepSerialNumber}  ${restEndStepSerialNumber}  ${restStartStepId}  ${restEndStepId}=                    Get Added Steps                         ${restCaseId}
                                                                                                                       Click Edit Button                       ${restCaseId}
    ${restStepId}                 ${restAddedStepSerialNumber}=                                                        Add Test Step                           ${restCaseId}             rest
                                                                                                                       Save Test Step                          ${restStepId}             rest                                ${restNodeGroupId}
                                                                                                                       Add Way From Start Step to Added Step   ${restStartStepId}        ${restAddedStepSerialNumber}
                                                                                                                       Add Way From Added Step to End Step     ${restStepId}             ${restEndStepSerialNumber}
                                                                                                                       Click Release Button                    ${restCaseId}
                                                                                                                       Add Value to Local Variable             rest
    ${uirecordCaseId}=                                                                                                 Add Test Case                           ${folderId}               ${groupId}                          uiRecord
    ${uirecordStartStepSerialNumber}  ${uirecordEndStepSerialNumber}  ${uirecordStartStepId}  ${uirecordEndStepId}=    Get Added Steps                         ${uirecordCaseId}
                                                                                                                       Click Edit Button                       ${uirecordCaseId}
    ${uirecordStepId}                 ${uirecordAddedStepSerialNumber}=                                                Add Test Step                           ${uirecordCaseId}         uiRecord
                                                                                                                       Save Test Step                          ${uirecordStepId}         uiRecord                            ${uirecordNodeGroupId}
                                                                                                                       Add Way From Start Step to Added Step   ${uirecordStartStepId}    ${uirecordAddedStepSerialNumber}
                                                                                                                       Add Way From Added Step to End Step     ${uirecordStepId}         ${uirecordEndStepSerialNumber}
                                                                                                                       Click Release Button                    ${uirecordCaseId}
                                                                                                                       Add Value to Local Variable             uiRecord
    ${mysqlCaseId}=                                                                                                    Add Test Case                           ${folderId}               ${groupId}                          mySql
    ${mysqlStartStepSerialNumber}  ${mysqlEndStepSerialNumber}  ${mysqlStartStepId}  ${mysqlEndStepId}=                Get Added Steps                         ${mysqlCaseId}
                                                                                                                       Click Edit Button                       ${mysqlCaseId}
    ${mysqlStepId}                 ${mysqlAddedStepSerialNumber}=                                                      Add Test Step                           ${mysqlCaseId}             mySql
                                                                                                                       Save Test Step                          ${mysqlStepId}             mySql                              ${mysqlNodeGroupId}
                                                                                                                       Add Way From Start Step to Added Step   ${mysqlStartStepId}        ${mysqlAddedStepSerialNumber}
                                                                                                                       Add Way From Added Step to End Step     ${mysqlStepId}             ${mysqlEndStepSerialNumber}
                                                                                                                       Click Release Button                    ${mysqlCaseId}
                                                                                                                       Add Value to Local Variable             mySql


Add All Test Cases Without Test Steps
    ${groupId}=              Add Group
    ${productId}=            Add Product            ${groupId}         ${namespaceId}
    ${versionId}=            Add Version            ${productId}       ${groupId}
    ${folderId}=             Add Folder             ${versionId}       ${groupId}
    ${caseId}=               Add Test Case          ${folderId}        ${groupId}          SELENIUM
    ${caseId}=               Add Test Case          ${folderId}        ${groupId}          ARC
    ${caseId}=               Add Test Case          ${folderId}        ${groupId}          REST
    ${caseId}=               Add Test Case          ${folderId}        ${groupId}          MYSQL
    ${caseId}=               Add Test Case          ${folderId}        ${groupId}          UI