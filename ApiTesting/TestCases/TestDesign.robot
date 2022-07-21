*** Settings ***
Resource        ../Keywords/TestDesignPage.robot
Resource        ../Keywords/GroupsPage.robot
Resource        ../Keywords/ConnectionsPage.robot
Resource        ../Keywords/LoginPage.robot
Force Tags      testdesign
Suite Setup     Get Authorization Token
Suite Teardown  Close All Sessions

*** Test Cases ***
Should Add Product
    [Tags]                add                 apitesting
    ${groupId}=           Add Group
    ${namespaceId}=       Add Namespace
    ${productId}=         Add Product         ${groupId}       ${namespaceId}


Should Delete Product
    [Tags]                delete              apitesting
    ${groupId}=           Add Group
    ${namespaceId}=       Add Namespace
    ${productId}=         Add Product         ${groupId}       ${namespaceId}
                          Delete Product      ${productId}     ${groupId}


Should Add Version
    [Tags]                add                 apitesting
    ${groupId}=           Add Group
    ${namespaceId}=       Add Namespace
    ${productId}=         Add Product         ${groupId}       ${namespaceId}
    ${versionId}=         Add Version         ${productId}     ${groupId}


Should Delete Version
    [Tags]                delete              apitesting
    ${groupId}=           Add Group
    ${namespaceId}=       Add Namespace
    ${productId}=         Add Product         ${groupId}       ${namespaceId}
    ${versionId}=         Add Version         ${productId}     ${groupId}
                          Delete Version      ${versionId}     ${groupId}


Should Add Folder
    [Tags]                add                 apitesting
    ${groupId}=           Add Group
    ${namespaceId}=       Add Namespace
    ${productId}=         Add Product         ${groupId}       ${namespaceId}
    ${versionId}=         Add Version         ${productId}     ${groupId}
    ${folderId}=          Add Folder          ${versionId}     ${groupId}


Should Delete Folder
    [Tags]                delete              apitesting
    ${groupId}=           Add Group
    ${namespaceId}=       Add Namespace
    ${productId}=         Add Product         ${groupId}       ${namespaceId}
    ${versionId}=         Add Version         ${productId}     ${groupId}
    ${folderId}=          Add Folder          ${versionId}     ${groupId}
                          Delete Folder       ${folderId}      ${groupId}


Should Add Test Case
    [Tags]                   add                    apitesting
    ${groupId}=              Add Group
    ${namespaceId}=          Add Namespace
    ${productId}=            Add Product            ${groupId}         ${namespaceId}
    ${versionId}=            Add Version            ${productId}       ${groupId}
    ${folderId}=             Add Folder             ${versionId}       ${groupId}
    ${caseId}=               Add Test Case          ${folderId}        ${groupId}          ApiAutomation


Should Delete Test Case
    [Tags]                   delete                 apitesting
    ${groupId}=              Add Group
    ${namespaceId}=          Add Namespace
    ${productId}=            Add Product            ${groupId}         ${namespaceId}
    ${versionId}=            Add Version            ${productId}       ${groupId}
    ${folderId}=             Add Folder             ${versionId}       ${groupId}
    ${caseId}=               Add Test Case          ${folderId}        ${groupId}          ApiAutomation
                             Delete Test Case       ${caseId}          ${groupId}


Should Click Edit Button On Test Case
    [Tags]                  editbutton              apitesting
    ${groupId}=             Add Group
    ${namespaceId}=         Add Namespace
    ${productId}=           Add Product             ${groupId}         ${namespaceId}
    ${versionId}=           Add Version             ${productId}       ${groupId}
    ${folderId}=            Add Folder              ${versionId}       ${groupId}
    ${caseId}=              Add Test Case           ${folderId}        ${groupId}          ApiAutomation
                            Click Edit Button       ${caseId}


Should Release Button On Test Case
    [Tags]                  releasebutton           apitesting
    ${groupId}=             Add Group
    ${namespaceId}=         Add Namespace
    ${productId}=           Add Product             ${groupId}         ${namespaceId}
    ${versionId}=           Add Version             ${productId}       ${groupId}
    ${folderId}=            Add Folder              ${versionId}       ${groupId}
    ${caseId}=              Add Test Case           ${folderId}        ${groupId}          ApiAutomation
                            Click Edit Button       ${caseId}
                            Click Release Button    ${caseId}


Should Add Selenium Test Step
    [Tags]                                        add                       selenium            apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}         selenium
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           selenium


Should Delete Selenium Test Step
    [Tags]                                        delete                    selenium            apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}         selenium
                                                  Click Edit Button         ${caseId}
    ${stepId}         ${addedStepSerialNumber}=   Add Test Step             ${caseId}           selenium
                                                  Delete Test Step          ${stepId}           ${caseId}


Should Save Selenium Test Step Without Node
    [Tags]                                        save                      seleniumwithoutnode                    apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}         selenium
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           selenium
                                                  Save Test Step            ${stepId}           selenium


Should Save Selenium Test Step With Node
    [Tags]                                        save                      seleniumwithnode    apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${environmentId}=                             Add Environment           ${namespaceId}
    ${nodeGroupId}=                               Add Selenium Node Group   ${namespaceId}      ${environmentId}
                                                  Add Node in Selenium      ${nodeGroupId}      ${environmentId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}         selenium
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           selenium
                                                  Save Test Step            ${stepId}           selenium           ${nodeGroupId}


Should Add Ways Added Selenium Step With Start End Steps
    [Tags]                                                                            add                                     selenium              ways                    apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                         ${namespaceId}
    ${nodeGroupId}=                                                                   Add Selenium Node Group                 ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Selenium                    ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                             ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                             ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                              ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                           ${folderId}         ${groupId}                 selenium
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                         ${caseId}
                                                                                      Click Edit Button                       ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                           ${caseId}           selenium
                                                                                      Save Test Step                          ${stepId}           selenium                   ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step   ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step     ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                    ${caseId}


Should Add Arc Test Step
    [Tags]                                      add                      arc                 apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product              ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version              ${productId}        ${groupId}
    ${folderId}=                                Add Folder               ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case            ${folderId}         ${groupId}         arc
                                                Click Edit Button        ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step            ${caseId}           arc


Should Delete Arc Test Step
    [Tags]                                      delete                   arc                 apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product              ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version              ${productId}        ${groupId}
    ${folderId}=                                Add Folder               ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case            ${folderId}         ${groupId}         arc
                                                Click Edit Button        ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step            ${caseId}           arc
                                                Delete Test Step         ${stepId}           ${caseId}


Should Save Arc Test Step Without Node
    [Tags]                                        save                arcwithoutnode      apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product         ${groupId}          ${namespaceId}
    ${versionId}=                                 Add Version         ${productId}        ${groupId}
    ${folderId}=                                  Add Folder          ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case       ${folderId}         ${groupId}         arc
                                                  Click Edit Button   ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step       ${caseId}           arc
                                                  Save Test Step      ${stepId}           arc


Should Save Arc Test Step With Node
    [Tags]                                        save                       arcwithnode         apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product                ${groupId}          ${namespaceId}
    ${environmentId}=                             Add Environment            ${namespaceId}
    ${nodeGroupId}=                               Add Arc Node Group         ${namespaceId}      ${environmentId}
                                                  Add Node in Arc            ${nodeGroupId}      ${environmentId}
    ${versionId}=                                 Add Version                ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                 ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case              ${folderId}         ${groupId}           arc
                                                  Click Edit Button          ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step              ${caseId}           arc
                                                  Save Test Step             ${stepId}           arc                  ${nodeGroupId}


Should Add Ways Added Arc Step With Start End Steps
    [Tags]                                                                            add                                     arc                  ways                     apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                         ${namespaceId}
    ${nodeGroupId}=                                                                   Add Arc Node Group                      ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Arc                         ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                             ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                             ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                              ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                           ${folderId}         ${groupId}                 arc
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                         ${caseId}
                                                                                      Click Edit Button                       ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                           ${caseId}           arc
                                                                                      Save Test Step                          ${stepId}           arc                        ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step   ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step     ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                    ${caseId}


Should Add Rest Test Step
    [Tags]                                      add                     rest                apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product             ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version             ${productId}        ${groupId}
    ${folderId}=                                Add Folder              ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case           ${folderId}         ${groupId}         rest
                                                Click Edit Button       ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step           ${caseId}           rest


Should Delete Rest Test Step
    [Tags]                                      delete                  rest                apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product             ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version             ${productId}        ${groupId}
    ${folderId}=                                Add Folder              ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case           ${folderId}         ${groupId}         rest
                                                Click Edit Button       ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step           ${caseId}           rest
                                                Delete Test Step        ${stepId}           ${caseId}


Should Save Rest Test Step Without Node
    [Tags]                                        save                      restwithoutnode     apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}         rest
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           rest
                                                  Save Test Step            ${stepId}           rest


Should Save Rest Test Step With Node
    [Tags]                                        save                      restwithnode        apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${environmentId}=                             Add Environment           ${namespaceId}
    ${nodeGroupId}=                               Add Rest Node Group       ${namespaceId}      ${environmentId}
                                                  Add Node in Rest          ${nodeGroupId}      ${environmentId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}           rest
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           rest
                                                  Save Test Step            ${stepId}           rest                 ${nodeGroupId}


Should Add Ways Added Rest Step With Start End Steps
    [Tags]                                                                            add                                     rest                  ways                    apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                         ${namespaceId}
    ${nodeGroupId}=                                                                   Add Rest Node Group                     ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Rest                        ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                             ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                             ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                              ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                           ${folderId}         ${groupId}                 rest
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                         ${caseId}
                                                                                      Click Edit Button                       ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                           ${caseId}           rest
                                                                                      Save Test Step                          ${stepId}           rest                       ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step   ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step     ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                    ${caseId}


Should Add Ui Record Test Step
    [Tags]                                      add                     uirecord             apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product              ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version              ${productId}        ${groupId}
    ${folderId}=                                Add Folder               ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case            ${folderId}         ${groupId}         uiRecord
                                                Click Edit Button        ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step            ${caseId}           uiRecord


Should Delete Ui Record Test Step
    [Tags]                                      delete                  uirecord             apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product              ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version              ${productId}        ${groupId}
    ${folderId}=                                Add Folder               ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case            ${folderId}         ${groupId}         uiRecord
                                                Click Edit Button        ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step            ${caseId}           uiRecord
                                                Delete Test Step         ${stepId}           ${caseId}


Should Save Ui Record Test Step Without Node
    [Tags]                                        save                      uirecordwithoutnode                    apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}         uiRecord
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           uiRecord
                                                  Save Test Step            ${stepId}           uiRecord


Should Save Ui Record Test Step With Node
    [Tags]                                        save                      uirecordwithnode     apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product                ${groupId}          ${namespaceId}
    ${environmentId}=                             Add Environment            ${namespaceId}
    ${nodeGroupId}=                               Add Ui Record Node Group   ${namespaceId}      ${environmentId}
                                                  Add Node in Ui Record      ${nodeGroupId}      ${environmentId}
    ${versionId}=                                 Add Version                ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                 ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case              ${folderId}         ${groupId}           uiRecord
                                                  Click Edit Button          ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step              ${caseId}           uiRecord
                                                  Save Test Step             ${stepId}           uiRecord             ${nodeGroupId}


Should Add Ways Added Ui Record Step With Start End Steps
    [Tags]                                                                            add                                     uirecord             ways                     apitesting
    ${groupId}=                                                                       Add Group
    ${namespaceId}=                                                                   Add Namespace
    ${environmentId}=                                                                 Add Environment                         ${namespaceId}
    ${nodeGroupId}=                                                                   Add Ui Record Node Group                ${namespaceId}      ${environmentId}
    ${response}=                                                                      Add Node in Ui Record                   ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                     Add Product                             ${groupId}          ${namespaceId}
    ${versionId}=                                                                     Add Version                             ${productId}        ${groupId}
    ${folderId}=                                                                      Add Folder                              ${versionId}        ${groupId}
    ${caseId}=                                                                        Add Test Case                           ${folderId}         ${groupId}                 uiRecord
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=   Get Added Steps                         ${caseId}
                                                                                      Click Edit Button                       ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                               Add Test Step                           ${caseId}           uiRecord
                                                                                      Save Test Step                          ${stepId}           uiRecord                   ${nodeGroupId}
                                                                                      Add Way From Start Step to Added Step   ${startStepId}      ${addedStepSerialNumber}
                                                                                      Add Way From Added Step to End Step     ${stepId}           ${endStepSerialNumber}
                                                                                      Click Release Button                    ${caseId}


Should Add My Sql Test Step
    [Tags]                                      add                     mysql               apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product             ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version             ${productId}        ${groupId}
    ${folderId}=                                Add Folder              ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case           ${folderId}         ${groupId}         mySql
                                                Click Edit Button       ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step           ${caseId}           mySql


Should Delete My Sql Test Step
    [Tags]                                      delete                  mysql               apitesting
    ${groupId}=                                 Add Group
    ${namespaceId}=                             Add Namespace
    ${productId}=                               Add Product             ${groupId}          ${namespaceId}
    ${versionId}=                               Add Version             ${productId}        ${groupId}
    ${folderId}=                                Add Folder              ${versionId}        ${groupId}
    ${caseId}=                                  Add Test Case           ${folderId}         ${groupId}         mySql
                                                Click Edit Button       ${caseId}
    ${stepId}       ${addedStepSerialNumber}=   Add Test Step           ${caseId}           mySql
                                                Delete Test Step        ${stepId}           ${caseId}


Should Save My Sql Test Step Without Node
    [Tags]                                        save                      mysqlwithoutnode    apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}         mySql
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           mySql
                                                  Save Test Step            ${stepId}           mySql


Should Save My Sql Test Step With Node
    [Tags]                                        save                      mysqlwithnode       apitesting
    ${groupId}=                                   Add Group
    ${namespaceId}=                               Add Namespace
    ${productId}=                                 Add Product               ${groupId}          ${namespaceId}
    ${environmentId}=                             Add Environment           ${namespaceId}
    ${nodeGroupId}=                               Add My Sql Node Group     ${namespaceId}      ${environmentId}
                                                  Add Node in My Sql        ${nodeGroupId}      ${environmentId}
    ${versionId}=                                 Add Version               ${productId}        ${groupId}
    ${folderId}=                                  Add Folder                ${versionId}        ${groupId}
    ${caseId}=                                    Add Test Case             ${folderId}         ${groupId}           mySql
                                                  Click Edit Button         ${caseId}
    ${stepId}       ${addedStepSerialNumber}=     Add Test Step             ${caseId}           mySql
                                                  Save Test Step            ${stepId}           mySql                ${nodeGroupId}


Should Add Ways Added My Sql Step With Start End Steps
    [Tags]                                                                             add                                     mysql                ways                      apitesting
    ${groupId}=                                                                        Add Group
    ${namespaceId}=                                                                    Add Namespace
    ${environmentId}=                                                                  Add Environment                         ${namespaceId}
    ${nodeGroupId}=                                                                    Add My Sql Node Group                   ${namespaceId}      ${environmentId}
    ${response}=                                                                       Add Node in My Sql                      ${nodeGroupId}      ${environmentId}
    ${productId}=                                                                      Add Product                             ${groupId}          ${namespaceId}
    ${versionId}=                                                                      Add Version                             ${productId}        ${groupId}
    ${folderId}=                                                                       Add Folder                              ${versionId}        ${groupId}
    ${caseId}=                                                                         Add Test Case                           ${folderId}         ${groupId}                 mySql
    ${startStepSerialNumber}  ${endStepSerialNumber}  ${startStepId}  ${endStepId}=    Get Added Steps                         ${caseId}
                                                                                       Click Edit Button                       ${caseId}
    ${stepId}                 ${addedStepSerialNumber}=                                Add Test Step                           ${caseId}           mySql
                                                                                       Save Test Step                          ${stepId}           mySql                      ${nodeGroupId}
                                                                                       Add Way From Start Step to Added Step   ${startStepId}      ${addedStepSerialNumber}
                                                                                       Add Way From Added Step to End Step     ${stepId}           ${endStepSerialNumber}
                                                                                       Click Release Button                    ${caseId}

Should Add All Test Cases
    [Tags]                              all        cases
    Add All Node Group with Nodes
    Add All Test Cases With Test Steps