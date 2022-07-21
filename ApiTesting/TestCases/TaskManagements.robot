*** Settings ***
Resource        ../Keywords/TaskManagementsPage.robot
Resource        ../Keywords/TestDesignPage.robot
Resource        ../Keywords/GroupsPage.robot
Resource        ../Keywords/ConnectionsPage.robot
Resource        ../Keywords/LoginPage.robot
Force Tags      taskmanagements
Suite Setup     Get Authorization Token
Suite Teardown  Close All Sessions

*** Test Cases ***
Should Create Scheduled Mode Task With Arc
    [Tags]                                                                            create                                    schedule            arc                        apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Arc Node Group                        ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Arc                           ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 arc
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           arc
                                                                                      Save Test Step                            ${stepId}           arc                        ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               arc
                                                                                      Create Scheduled Mode Task                ${caseId}           ${environmentId}


Should Create Scheduled Mode Task With Selenium
    [Tags]                                                                            create                                    scheduled           selenium                  apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Selenium Node Group                   ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Selenium                      ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 selenium
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           selenium
                                                                                      Save Test Step                            ${stepId}           selenium                    ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               selenium
                                                                                      Create Scheduled Mode Task                ${caseId}           ${environmentId}


Should Create Scheduled Mode Task With Rest
    [Tags]                                                                            create                                    schedule            rest                      apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Rest Node Group                       ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Rest                          ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 rest
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           rest
                                                                                      Save Test Step                            ${stepId}           rest                       ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               rest
                                                                                      Create Scheduled Mode Task                ${caseId}           ${environmentId}


Should Create Scheduled Mode Task With Ui Record
    [Tags]                                                                            create                                    schedule            uirecord                  apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Ui Record Node Group                  ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Ui Record                     ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 uiRecord
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           uiRecord
                                                                                      Save Test Step                            ${stepId}           uiRecord                   ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               uiRecord
                                                                                      Create Scheduled Mode Task                ${caseId}           ${environmentId}


Should Create Scheduled Mode Task With My Sql
    [Tags]                                                                            create                                    schedule            mysql                     apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add My Sql Node Group                     ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in My Sql                        ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 mySql
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           mySql
                                                                                      Save Test Step                            ${stepId}           mySql                      ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               mySql
                                                                                      Create Scheduled Mode Task                ${caseId}           ${environmentId}


Should Create Recurrent Mode Task With Arc
    [Tags]                                                                            create                                    recurrent           arc                       apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Arc Node Group                        ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Arc                           ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 arc
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           arc
                                                                                      Save Test Step                            ${stepId}           arc                        ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               arc
                                                                                      Create Recurrent Mode Task                ${caseId}           ${environmentId}


Should Create Recurrent Mode Task With Selenium
    [Tags]                                                                            create                                    recurrent           selenium                 apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Selenium Node Group                   ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Selenium                      ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 selenium
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           selenium
                                                                                      Save Test Step                            ${stepId}           selenium                   ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               selenium
                                                                                      Create Recurrent Mode Task                ${caseId}           ${environmentId}


Should Create Recurrent Mode Task With Rest
    [Tags]                                                                            create                                    recurrent           rest                      apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Rest Node Group                       ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Rest                          ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 rest
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           rest
                                                                                      Save Test Step                            ${stepId}           rest                        ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               rest
                                                                                      Create Recurrent Mode Task                ${caseId}           ${environmentId}


Should Create Recurrent Mode Task With Ui Record
    [Tags]                                                                            create                                    recurrent           uirecord                  apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Ui Record Node Group                  ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Ui Record                     ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 uiRecord
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           uiRecord
                                                                                      Save Test Step                            ${stepId}           uiRecord                   ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               uiRecord
                                                                                      Create Recurrent Mode Task                ${caseId}           ${environmentId}


Should Create Recurrent Mode Task With My Sql
    [Tags]                                                                            create                                    recurrent           mysql                     apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add My Sql Node Group                     ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in My Sql                        ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 mySql
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           mySql
                                                                                      Save Test Step                            ${stepId}           mySql                      ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               mySql
                                                                                      Create Recurrent Mode Task                ${caseId}           ${environmentId}


Should Create Massive Mode Task With Arc
    [Tags]                                                                            create                                    massive             arc                        apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Arc Node Group                        ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Arc                           ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 arc
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           arc
                                                                                      Save Test Step                            ${stepId}           arc                        ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               arc
                                                                                      Create Massive Mode Task                  ${caseId}           ${environmentId}            arc

Should Create Massive Mode Task With Selenium
    [Tags]                                                                            create                                    massive             selenium                 apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Selenium Node Group                   ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Selenium                      ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 selenium
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           selenium
                                                                                      Save Test Step                            ${stepId}           selenium                   ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               selenium
                                                                                      Create Massive Mode Task                  ${caseId}           ${environmentId}            selenium


Should Create Massive Mode Task With Rest
    [Tags]                                                                            create                                    massive             rest                       apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Rest Node Group                       ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Rest                          ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 rest
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           rest
                                                                                      Save Test Step                            ${stepId}           rest                        ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               rest
                                                                                      Create Massive Mode Task                  ${caseId}           ${environmentId}            rest

Should Create Massive Mode Task With Ui Record
    [Tags]                                                                            create                                    massive             uirecord                  apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add Ui Record Node Group                  ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Ui Record                     ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 uiRecord
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           uiRecord
                                                                                      Save Test Step                            ${stepId}           uiRecord                   ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               uiRecord
                                                                                      Create Massive Mode Task                  ${caseId}           ${environmentId}            uiRecord


Should Create Massive Mode Task With My Sql
    [Tags]                                                                            create                                    massive             mysql                      apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                           ${namespaceId}
    ${nodeGroupId}=                                                                   Add My Sql Node Group                     ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in My Sql                        ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                               ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                               ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                                ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                             ${folderId}         ${groupId}                 mySql
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                           ${caseId}
                                                                                      Click Edit Button                         ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                             ${caseId}           mySql
                                                                                      Save Test Step                            ${stepId}           mySql                      ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step     ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step       ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                      ${caseId}
                                                                                      Add Value to Local Variable               mySql
                                                                                      Create Massive Mode Task                  ${caseId}           ${environmentId}            mySql