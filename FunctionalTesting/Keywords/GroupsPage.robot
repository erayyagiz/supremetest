*** Settings ***
Resource     ./Resources/customBase.robot
Resource     CommonPage.robot

*** Variables ***
${ADD_GROUP_BUTTON}     //span[@class='MuiButton-label' and text()='Add Group']


*** Keywords ***
Go to Groups Page
    Mouse Over                ${hamburgerSettingsButton}
    Click Element             ${groupsButton}
    ${currentPageTittle}=     Get Text                   ${pageTittle}
    Should Be Equal           ${currentPageTittle}       Group

Add Groups
    Click Element           ${addGroupButton}
    Input Text              ${nameTextbox}          new
    Click Element           ${addButton}
    Sleep                   1 seconds
    ${groupSpaceName}=      Get Text                ${firstContainerName}
    Should Be Equal         ${groupSpaceName}       new