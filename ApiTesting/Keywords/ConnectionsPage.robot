*** Settings ***
Resource    ../../Resources/customBase.robot

*** Variables ***
${AUTH_TOKEN}           null
${USER_ID}              null
${SELENIUM_PLUG_NO}     null
${ARC_PLUG_NO}          null
${REST_PLUG_NO}         null
${UIRECORD_PLUG_NO}     null
${MYSQL_PLUG_NO}        null

*** Keywords ***
Add Namespace
    Create Session                addNamespace                                  ${BASE_URL}                     disable_warnings=1
    ${header}=                    Create Dictionary                             Authorization=${AUTH_TOKEN}
    ${namespaceName}=             Generate Random String                        8
    ${bodyData}=                  Create Dictionary                             name=${namespaceName}
    ${response}=                  Post On Session                               addNamespace                    /serve/envnamespaces/    data=${bodyData}    headers=${header}
    Should Be Equal As Strings    ${response.status_code}                       201
    Log                           ${response.content}
    ${namespaceId}=               Get Value From Dictionary Response Content    ${response}                     id
    Log                           ${namespaceId}
    [Return]                      ${namespaceId}


Delete Namespace
    [Arguments]                    ${namespaceId}
    Create Session                 deleteNamespace                              ${BASE_URL}                       disable_warnings=1
    ${header}=                     Create Dictionary                            Authorization=${AUTH_TOKEN}
    ${responseDEL}=                Delete On Session                            deleteNamespace                   /serve/envnamespaces/${namespaceId}/       headers=${header}
    Should Be Equal As Strings     ${responseDEL.status_code}                   204
    ${responseGET}=                Get On Session                               deleteNamespace                   /serve/envnamespaces/                      headers=${header}
    Should Be Equal As Strings     ${responseGET.status_code}                   200
    @{namespaces}=                 Get Value From Json Response Content         ${responseGET}                    $..id
    Log                            ${namespaces}
    FOR                            ${i}                                         IN                                @{namespaces}
                                   Should Not Be Equal As Strings               ${i}                              ${namespaceId}
    END


Add Environment
    [Arguments]                    ${namespaceId}
    Create Session                 addEnvironment                               ${BASE_URL}                     disable_warnings=1
    ${header}=                     Create Dictionary                            Authorization=${AUTH_TOKEN}
    ${environmentName}=            Generate Random String                       8
    ${bodyData}=                   Create Dictionary                            name=${environmentName}         env_namespace=${namespaceId}
    ${response}=                   Post On Session                              addEnvironment                  /serve/envgroups/               data=${bodyData}    headers=${header}
    Should Be Equal As Strings     ${response.status_code}                      201
    Log                            ${response.content}
    ${environmentId}=              Get Value From Dictionary Response Content   ${response}    id
    Log                            ${environmentId}
    [Return]                       ${environmentId}


Delete Environment
    [Arguments]                    ${environmentId}                             ${namespaceId}
    Create Session                 deleteEnvironment                            ${BASE_URL}                       disable_warnings=1
    ${header}=                     Create Dictionary                            Authorization=${AUTH_TOKEN}
    ${responseDEL}=                Delete On Session                            deleteEnvironment                 /serve/envgroups/${environmentId}/                 headers=${header}
    Should Be Equal As Strings     ${responseDEL.status_code}                   204
    ${responseGET}=                Get On Session                               deleteEnvironment                 /serve/envnamespaces/${namespaceId}/envgroups/     headers=${header}
    Should Be Equal As Strings     ${responseGET.status_code}                   200
    Should Be Equal As Strings     ${responseGET.content}                       []


Add Selenium Node Group
    [Arguments]                     ${namespaceId}                              ${environmentId}
    Create Session                  addSeleniumNodeGroup                        ${BASE_URL}                         disable_warnings=1
    ${header}=                      Create Dictionary                           Authorization=${AUTH_TOKEN}
    ${namespaceName}=               Generate Random String                      8
    ${bodyData}=                    Create Dictionary                           env_namespace=${namespaceId}        env_group=${environmentId}    name=SeleniumAuto    plugin=${seleniumPlugNo}
    ${response}=                    Post On Session                             addSeleniumNodeGroup                /serve/concategories/         data=${bodyData}     headers=${header}
    Should Be Equal As Strings      ${response.status_code}                     201
    Log                             ${response.content}
    ${seleniumNodeGroupId}=         Get Value From Dictionary Response Content  ${response}    id
    Log                             ${seleniumNodeGroupId}
    [Return]                        ${seleniumNodeGroupId}


Add Node in Selenium
    [Arguments]                     ${seleniumNodeGroupId}      ${environmentId}
    Create Session                  addSeleniumNode             ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary           Authorization=${AUTH_TOKEN}
    ${fields}=                      Create Dictionary           domain=https://oauth-eray.yaqiz18-bc9cc:7e317d52-a5d2-4f49-8cc1-3e7f5218df46@ondemand.eu-central-1.saucelabs.com             port=443
    ${bodyData}=                    Create Dictionary           no=1                            con_category=${seleniumNodeGroupId}    env_group=${environmentId}    fields=${fields}
    ${response}=                    Post On Session             addSeleniumNode                 /serve/connodes/                       json=${bodyData}              headers=${header}
    Should Be Equal As Strings      ${response.status_code}     201
    Log                             ${response.content}
    [Return]                        ${response.content}


Add Arc Node Group
    [Arguments]                     ${namespaceId}                                  ${environmentId}
    Create Session                  addArcNodeGroup                                 ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${namespaceName}=               Generate Random String                          8
    ${bodyData}=                    Create Dictionary                               env_namespace=${namespaceId}    env_group=${environmentId}    name=ArcAuto      plugin=${arcPlugNo}
    ${response}=                    Post On Session                                 addArcNodeGroup                 /serve/concategories/         data=${bodyData}  headers=${header}
    Should Be Equal As Strings      ${response.status_code}                         201
    Log                             ${response.content}
    ${arcNodeGroupId}=              Get Value From Dictionary Response Content      ${response}                     id
    Log                             ${arcNodeGroupId}
    [Return]                        ${arcNodeGroupId}


Add Node in Arc
    [Arguments]                     ${arcNodeGroupId}           ${environmentId}
    Create Session                  addArcNode                  ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary           Authorization=${AUTH_TOKEN}
    ${bodyData}=                    Create Dictionary           no=1                            con_category=${arcNodeGroupId}    env_group=${environmentId}
    ${response}=                    Post On Session             addArcNode                      /serve/connodes/                  data=${bodyData}              headers=${header}
    Should Be Equal As Strings      ${response.status_code}     201
    Log                             ${response.content}
    [Return]                        ${response.content}


Add Rest Node Group
    [Arguments]                     ${namespaceId}                                  ${environmentId}
    Create Session                  addRestNodeGroup                                ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${namespaceName}=               Generate Random String                          8
    ${bodyData}=                    Create Dictionary                               env_namespace=${namespaceId}    env_group=${environmentId}    name=RestAuto     plugin=${restPlugNo}
    ${response}=                    Post On Session                                 addRestNodeGroup                /serve/concategories/         data=${bodyData}  headers=${header}
    Should Be Equal As Strings      ${response.status_code}                         201
    Log                             ${response.content}
    ${restNodeGroupId}=             Get Value From Dictionary Response Content      ${response}                     id
    Log                             ${restNodeGroupId}
    [Return]                        ${restNodeGroupId}


Add Node in Rest
    [Arguments]                     ${restNodeGroupId}          ${environmentId}
    Create Session                  addRestNode                 ${BASE_URL}                         disable_warnings=1
    ${header}=                      Create Dictionary           Authorization=${AUTH_TOKEN}
    ${fields}=                      Create Dictionary           domain=http://dev.supremetest.net   port=
    ${bodyData}=                    Create Dictionary           no=1                                con_category=${restNodeGroupId}     env_group=${environmentId}      fields=${fields}
    ${response}=                    Post On Session             addRestNode                         /serve/connodes/                    json=${bodyData}                headers=${header}
    Should Be Equal As Strings      ${response.status_code}     201
    Log                             ${response.content}
    [Return]                        ${response.content}


Add UI Record Node Group
    [Arguments]                     ${namespaceId}                                  ${environmentId}
    Create Session                  addUiRecordNodeGroup                            ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${namespaceName}=               Generate Random String                          8
    ${bodyData}=                    Create Dictionary                               env_namespace=${namespaceId}    env_group=${environmentId}     name=UiRecordAuto    plugin=${uiRecordPlugNo}
    ${response}=                    Post On Session                                 addUiRecordNodeGroup            /serve/concategories/          data=${bodyData}     headers=${header}
    Should Be Equal As Strings      ${response.status_code}                         201
    Log                             ${response.content}
    ${uiRecordNodeGroupId}=         Get Value From Dictionary Response Content      ${response}                      id
    Log                             ${uiRecordNodeGroupId}
    [Return]                        ${uiRecordNodeGroupId}


Add Node in UI Record
    [Arguments]                     ${uiRecordNodeGroupId}      ${environmentId}
    Create Session                  addUiRecordNode             ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary           Authorization=${AUTH_TOKEN}
    ${fields}=                      Create Dictionary           _=1
    ${bodyData}=                    Create Dictionary           no=1                            con_category=${uiRecordNodeGroupId}     env_group=${environmentId}    fields=${fields}
    ${response}=                    Post On Session             addUiRecordNode                 /serve/connodes/                        json=${bodyData}              headers=${header}
    Should Be Equal As Strings      ${response.status_code}     201
    Log                             ${response.content}
    [Return]                        ${response.content}

Add My Sql Node Group
    [Arguments]                     ${namespaceId}                                  ${environmentId}
    Create Session                  addMySqlNodeGroup                               ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary                               Authorization=${AUTH_TOKEN}
    ${namespaceName}=               Generate Random String                          8
    ${bodyData}=                    Create Dictionary                               env_namespace=${namespaceId}    env_group=${environmentId}     name=MysqlAuto      plugin=${mySqlPlugNo}
    ${response}=                    Post On Session                                 addMySqlNodeGroup               /serve/concategories/          data=${bodyData}    headers=${header}
    Should Be Equal As Strings      ${response.status_code}                         201
    Log                             ${response.content}
    ${mySqlNodeGroupId}=            Get Value From Dictionary Response Content      ${response}                      id
    Log                             ${mySqlNodeGroupId}
    [Return]                        ${mySqlNodeGroupId}


Add Node in My Sql
    [Arguments]                     ${mySqlNodeGroupId}         ${environmentId}
    Create Session                  addMySqlNode                ${BASE_URL}                     disable_warnings=1
    ${header}=                      Create Dictionary           Authorization=${AUTH_TOKEN}
    ${fields}=                      Create Dictionary           ip=159.138.82.23                port=3306                           db_name=tat_db                username=tat          password=tat
    ${bodyData}=                    Create Dictionary           no=1                            con_category=${mySqlNodeGroupId}    env_group=${environmentId}    fields=${fields}
    ${response}=                    Post On Session             addMySqlNode                    /serve/connodes/                    json=${bodyData}              headers=${header}
    Should Be Equal As Strings      ${response.status_code}     201
    Log                             ${response.content}
    [Return]                        ${response.content}


Delete Node Group
    [Arguments]                    ${nodeGroupId}                               ${environmentId}
    Create Session                 deleteNodeGroup                              ${BASE_URL}                       disable_warnings=1
    ${header}=                     Create Dictionary                            Authorization=${AUTH_TOKEN}
    ${responseDEL}=                Delete On Session                            deleteNodeGroup                   /serve/concategories/${nodeGroupId}/                  headers=${header}
    Should Be Equal As Strings     ${responseDEL.status_code}                   204
    ${responseGET}=                Get On Session                               deleteNodeGroup                   /serve/envgroups/${environmentId}/concategories/      headers=${header}
    Should Be Equal As Strings     ${responseGET.status_code}                   200
    Should Be Equal As Strings     ${responseGET.content}                       []


Delete All Namespaces
    Create Session                 deleteAllNamespaces                      ${BASE_URL}                             disable_warnings=1
    ${header}=                     Create Dictionary                        Authorization=${AUTH_TOKEN}
    ${responseGET}=                Get On Session                           deleteAllNamespaces                     /serve/envnamespaces/                  headers=${header}
    Should Be Equal As Strings     ${responseGET.status_code}               200
    @{namespaces}=                 Get Value From Json Response Content     ${responseGET}                          $..id
    Log                            ${namespaces}
    FOR                            ${namespaceId}                           IN                                      @{namespaces}
                                   ${responseGET}=                          Get On Session                          deleteAllNamespaces                     /serve/envnamespaces/${namespaceId}/envgroups/            headers=${header}
                                   @{environments}=                         Get Value From Json Response Content    ${responseGET}                          $..id
                                   Should Be Equal As Strings               ${responseGET.status_code}              200
                                   FOR                                      ${environmentId}                        IN                                      @{environments}
                                                                            ${responseGET}=                         Get On Session                          deleteAllNamespaces                                       /serve/envgroups/${environmentId}/concategories/   headers=${header}
                                                                            @{nodeGroups}=                          Get Value From Json Response Content    ${responseGET}                                            $..id
                                                                            FOR                                     ${nodeGroupId}                          IN                                                        @{nodeGroups}
                                                                                                                    ${responseDEL}=                         Delete On Session                                         deleteAllNamespaces                                /serve/concategories/${nodeGroupId}/      headers=${header}
                                                                                                                    Should Be Equal As Strings              ${responseDEL.status_code}                                204
                                                                            END
                                                                            ${responseDEL}=                         Delete On Session                       deleteAllNamespaces                                       /serve/envgroups/${environmentId}/                 headers=${header}
                                                                            Should Be Equal As Strings              ${responseDEL.status_code}              204
                                   END
                                   ${responseDEL}=                          Delete On Session                       deleteAllNamespaces                     /serve/envnamespaces/${namespaceId}/                      headers=${header}
                                   Should Be Equal As Strings               ${responseDEL.status_code}              204
    END


Add All Node Group with Nodes
    ${namespaceId1}=            Add Namespace
    Set Global Variable         ${NAMESPACE_ID}                 ${namespaceId1}
    ${environmentId}=           Add Environment                 ${namespaceId}
    ${seleniumNodeGroupId1}=    Add Selenium Node Group         ${namespaceId}             ${environmentId}
    Set Global Variable         ${SELENIUM_NODE_GROUP_ID}       ${seleniumNodeGroupId1}
                                Add Node in Selenium            ${seleniumNodeGroupId1}    ${environmentId}
    ${arcNodeGroupId1}=         Add Arc Node Group              ${namespaceId}             ${environmentId}
    Set Global Variable         ${ARC_NODE_GROUP_ID}            ${arcNodeGroupId1}
                                Add Node in Arc                 ${arcNodeGroupId1}         ${environmentId}
    ${restNodeGroupId1}=        Add Rest Node Group             ${namespaceId}             ${environmentId}
    Set Global Variable         ${REST_NODE_GROUP_ID}           ${restNodeGroupId1}
                                Add Node in Rest                ${restNodeGroupId1}        ${environmentId}
    ${uiRecordNodeGroupId1}=    Add Ui Record Node Group        ${namespaceId}             ${environmentId}
    Set Global Variable         ${UI_RECORD_NODE_GROUP_ID}      ${uiRecordNodeGroupId1}
                                Add Node in Ui Record           ${uiRecordNodeGroupId1}    ${environmentId}
    ${mySqlNodeGroupId1}=       Add My Sql Node Group           ${namespaceId}             ${environmentId}
    Set Global Variable         ${MYSQL_NODE_GROUP_ID}          ${mySqlNodeGroupId1}
                                Add Node in My Sql              ${mySqlNodeGroupId1}       ${environmentId}