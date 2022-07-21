*** Settings ***
Resource        ../Keywords/AccountSettingsPage.robot
Resource        ../Keywords/LoginPage.robot
Force Tags      accountsettings
Suite Setup     Get Authorization Token
Suite Teardown  Close All Sessions

*** Test Cases ***
#Should Update Full Name With Valid
#    [Tags]                              update
#    Update Full Name With Valid
#
#
#Should Not Update Full Name With Empty
#    [Tags]                              notupdate
#    Update Full Name With Empty
#
#
#Should Update Email Adress With Valid
#    [Tags]                              update
#    Update Email Adress With Valid
#
#
#Should Not Update Email Adress With Invalid
#    [Tags]                              notupdate
#    Update Email Adress With Invalid
#
#
#Should Not Update Email Adress With Empty
#    [Tags]                              notupdate
#    Update Email Adress With Empty
#
#
#Should Update Phone Number With Valid
#    [Tags]                              update
#    Update Phone Number With Valid
#
#
#Should Update Phone Number With Empty
#    [Tags]                              update
#    Update Phone Number With Empty
#

Should Update Visible Guide Off
    [Tags]                              update          apitesting
    Update Visible Guide                False


Should Update Visible Guide On
    [Tags]                              update          apitesting
    Update Visible Guide                True


Should Update Theme Blue
    [Tags]                              update           apitesting
    Update Theme                        1


Should Update Theme Dark
    [Tags]                              update           apitesting
    Update Theme                        0