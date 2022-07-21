*** Settings ***
Resource        ../Keywords/ConnectionsPage.robot
Resource        ../Keywords/GroupsPage.robot
Resource        ../Keywords/LoginPage.robot
Force Tags      connections
Suite Setup     Get Authorization Token
Suite Teardown  Close All Sessions

*** Test Cases ***
Should Add Namespace
    [Tags]             add                       apitesting
    ${namespaceId}=    Add Namespace


Should Delete Namespace
    [Tags]             delete
    ${namespaceId}=    Add Namespace
                       Delete Namespace          ${namespaceId}


Should Delete All Namespaces
    [Tags]             all                        delete
                       Delete All Groups
                       Delete All Namespaces


Should Add Environment
    [Tags]             add                      apitesting
    ${namespaceId}=    Add Namespace
    ${environmentId}=  Add Environment          ${namespaceId}


Should Delete Environment
    [Tags]             delete                   apitesting
    ${namespaceId}=    Add Namespace
    ${environmentId}=  Add Environment          ${namespaceId}
                       Delete Environment       ${environmentId}       ${namespaceId}


Should Add Selenium Node Group
    [Tags]              add                        selenium          apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Selenium Node Group    ${namespaceId}    ${environmentId}


Should Add Node in Selenium
    [Tags]              add                        selenium          apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Selenium Node Group    ${namespaceId}    ${environmentId}
                        Add Node in Selenium       ${nodeGroupId}    ${environmentId}


Should Delete Selenium Node Group
    [Tags]              delete                     selenium          apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Selenium Node Group    ${namespaceId}    ${environmentId}
                        Delete Node Group          ${nodeGroupId}    ${environmentId}


Should Add Arc Node Group
    [Tags]              add                        arc               apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Arc Node Group         ${namespaceId}    ${environmentId}


Should Add Node in Arc
    [Tags]              add                        arc               apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Arc Node Group         ${namespaceId}    ${environmentId}
                        Add Node in Arc            ${nodeGroupId}    ${environmentId}


Should Delete Arc Node Group
    [Tags]              delete                     arc               apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Arc Node Group         ${namespaceId}    ${environmentId}
                        Delete Node Group          ${nodeGroupId}    ${environmentId}


Should Add Rest Node Group
    [Tags]              add                        rest              apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Rest Node Group        ${namespaceId}    ${environmentId}


Should Add Node in Rest
    [Tags]              add                        rest              apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Rest Node Group        ${namespaceId}    ${environmentId}
                        Add Node in Rest           ${nodeGroupId}    ${environmentId}


Should Delete Rest Node Group
    [Tags]              delete                     rest              apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Rest Node Group        ${namespaceId}    ${environmentId}
                        Delete Node Group          ${nodeGroupId}    ${environmentId}


Should Add Ui Record Node Group
    [Tags]              add                        uirecord          apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Ui Record Node Group   ${namespaceId}    ${environmentId}


Should Add Node in Ui Record
    [Tags]              add                        uirecord          apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Ui Record Node Group   ${namespaceId}    ${environmentId}
                        Add Node in Ui Record      ${nodeGroupId}    ${environmentId}


Should Delete Ui Record Node Group
    [Tags]              delete                     uirecord          apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add Ui Record Node Group   ${namespaceId}    ${environmentId}
                        Delete Node Group          ${nodeGroupId}    ${environmentId}


Should Add My Sql Node Group
    [Tags]              add                        mysql             apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add My Sql Node Group      ${namespaceId}    ${environmentId}


Should Add Node in My Sql
    [Tags]              add                        mysql             apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add My Sql Node Group      ${namespaceId}    ${environmentId}
                        Add Node in My Sql         ${nodeGroupId}    ${environmentId}


Should Delete My Sql Node Group
    [Tags]              delete                     mysql             apitesting
    ${namespaceId}=     Add Namespace
    ${environmentId}=   Add Environment            ${namespaceId}
    ${nodeGroupId}=     Add My Sql Node Group      ${namespaceId}    ${environmentId}
                        Delete Node Group          ${nodeGroupId}    ${environmentId}