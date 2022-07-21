*** Settings ***
Resource    ../../Resources/customBase.robot

*** Variables ***
${AUTH_TOKEN}   null
${USER_ID}      null

*** Keywords ***
Create Scheduled Mode Task
    [Arguments]                      ${caseId}                               ${environmentId}
    Create Session                   createScheduled                         ${BASE_URL}                    disable_warnings=1
    ${date1}=                        Get Current Date                        UTC                            -0 hours
    ${date2}=                        Add Time to Date                        ${date1}                       00:00:10
    ${first}=                        Get Substring                           ${date2}                       0                                 10
    ${second}=	                     Get Substring	                         ${date2}	                    11                                23
    ${scheduled_at}=                 Convert To String                       ${first}T${second}Z
    ${header}=                       Create Dictionary                       Authorization=${AUTH_TOKEN}
    @{cases}=                        Create List                             ${caseId}
    ${bodyData}=                     Create Dictionary                       mode=s                        scheduled_at=${scheduled_at}       env_group=${environmentId}     name=taskAuto        cases=${cases}
    ${responsePOST}=                 Post On Session                         createScheduled               /serve/tasks/                      json=${bodyData}               headers=${header}
    Should Be Equal As Strings       ${responsePOST.status_code}             201
    Log                              ${responsePOST.content}
    ${taskId}=                       Get Value From Json Response Content    ${responsePOST}               $.id
    ${taskId}=                       Set Variable                            ${taskId}[0]
    ${responseGET}=                  Get On Session                          createScheduled               /serve/tasks/${taskId}/            headers=${header}
    Should Be Equal As Strings       ${responseGET.status_code}              200
    Log                              ${responseGET.content}


Create Recurrent Mode Task
    [Arguments]                      ${caseId}                               ${environmentId}
    Create Session                   createRecurrent                         ${BASE_URL}                    disable_warnings=1
    ${date1}=                        Get Current Date                        UTC                            -0 hours
    ${date2}=                        Add Time to Date                        ${date1}                       00:00:10
    ${first}=                        Get Substring                           ${date2}                       0                                       10
    ${second}=	                     Get Substring	                         ${date2}	                    11                                      23
    ${scheduled_at}=                 Convert To String                       ${first}T${second}Z
    ${header}=                       Create Dictionary                       Authorization=${AUTH_TOKEN}
    @{cases}=                        Create List                             ${caseId}
    ${bodyData}=                     Create Dictionary                       mode=r                        scheduled_at=${scheduled_at}             env_group=${environmentId}     name=taskAuto        cases=${cases}    recurrence=d
    ${responsePOST}=                 Post On Session                         createRecurrent               /serve/tasks/                            json=${bodyData}               headers=${header}
    Should Be Equal As Strings       ${responsePOST.status_code}             201
    Log                              ${responsePOST.content}
    ${taskId}=                       Get Value From Json Response Content    ${responsePOST}               $.id
    ${taskId}=                       Set Variable                            ${taskId}[0]
    ${responseGET}=                  Get On Session                          createRecurrent               /serve/tasks/${taskId}/           headers=${header}
    Should Be Equal As Strings       ${responseGET.status_code}              200
    Log                              ${responseGET.content}
    Sleep                            60 seconds
    ${responsePATCH}=                Patch On Session                        createRecurrent               /serve/tasks/${taskId}/cancel/    headers=${header}
    Should Be Equal As Strings       ${responsePATCH.status_code}            200


Create Massive Mode Task
    [Arguments]                      ${caseId}                               ${environmentId}              ${caseType}
    Create Session                   createMassive                           ${BASE_URL}                   disable_warnings=1
    ${header}=                       Create Dictionary                       Authorization=${AUTH_TOKEN}
    ${data}=                         Evaluate                                {'file':('csvFile.csv',open('./Json&Files/Csv/${caseType}.csv','rb'),'text/csv')}
    ${responsePOST1}=                Post On Session                         createMassive                 /serve/tasks/massive_file_upload/                                files=${data}    headers=${header}
    Should Be Equal As Strings       ${responsePOST1.status_code}            200
    Log                              ${responsePOST1.content}
    ${csvFileName}=                  Get Value From Json Response Content    ${responsePOST1}              $.file_name
    ${date1}=                        Get Current Date                        UTC                           -0 hours
    ${date2}=                        Add Time to Date                        ${date1}                      00:00:10
    ${first}=                        Get Substring                           ${date2}                      0                                                                  10
    ${second}=	                     Get Substring	                         ${date2}	                   11                                                                 23
    ${scheduled_at}=                 Convert To String                       ${first}T${second}Z
    @{cases}=                        Create List                             ${caseId}
    ${bodyData}=                     Create Dictionary                       mode=m                        massiveUploadFromServer=${csvFileName}[0]                          scheduled_at=${scheduled_at}     env_group=${environmentId}    name=taskAuto     cases=${cases}
    ${responsePOST}=                 Post On Session                         createMassive                 /serve/tasks/                                                      json=${bodyData}      headers=${header}
    Should Be Equal As Strings       ${responsePOST.status_code}             201
    Log                              ${responsePOST.content}
    ${taskId}=                       Get Value From Json Response Content    ${responsePOST}               $.id
    ${taskId}=                       Set Variable                            ${taskId}[0]
    ${responseGET}=                  Get On Session                          createMassive                 /serve/tasks/${taskId}/                                            headers=${header}
    Should Be Equal As Strings       ${responseGET.status_code}              200
    Log                              ${responseGET.content}