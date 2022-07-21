*** Settings ***
Resource     ./Resources/customBase.robot
Resource     CommonPage.robot


*** Variables ***
${UPDATE_BUTTON}        //span[@class='MuiButton-label' and text()='Update']
${GROUP_BUTTON}         //div[@id='groups']
${CURRENT_GROUP}        (//tr[@class='MuiTableRow-root MuiTableRow-hover']/td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall']/div)[last()]
${GROUP_NEW}            //span[@class='MuiTypography-root MuiListItemText-primary MuiTypography-body1 MuiTypography-displayBlock' and text()='new']
${EDIT_BUTTON}          //span[@class='MuiButton-label' and text()='Edit']


*** Keywords ***
Go to Users Page
    Mouse Over                      ${hamburgerSettingsButton}
    Click Element                   ${usersButton}
    ${currentPageTittle}=           Get Text                        ${pageTittle}
    Should Be Equal                 ${currentPageTittle}            User

Connect the Group to the User
    ${currentGroupName}=        Get Text                          ${currentGroup}
    IF                          "${currentGroupName}" != "new"
                                Click Element                     ${updateButton}
                                Click Element                     ${groupButton}
                                Click Element                     ${groupNew}
                                Double Click Element              //h2[text()='Edit']
                                Click Element                     ${editButton}
                                ${currentGroupName}=              Get Text                ${currentGroup}
    END
    Sleep                       0.5 seconds
    ${currentGroupName}=        Get Text                          ${currentGroup}
    Should Be Equal             ${currentGroupName}               new