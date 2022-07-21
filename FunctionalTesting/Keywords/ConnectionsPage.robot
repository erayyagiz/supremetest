*** Settings ***
Resource     ./Resources/customBase.robot
Resource     CommonPage.robot


*** Variables ***
${FIRST_PLUGIN_TYPE}            //tr[@class='MuiTableRow-root MuiTableRow-hover'][1]//div[not(contains(@class,'jss'))]
${ADD_NAMESPACE_BUTTON}         //span[@class='MuiButton-label' and text()='Add Namespace']
${ENVIRONMENTS_BUTTON}          //div[contains(@class,'jss') and text()='new']/parent::*/parent::*//span[@class='MuiButton-label' and text()='Environments']
${ADD_ENVIRONMENT_BUTTON}       //button[@id='AddEnvironment']
${NODE_GROUPS_BUTTON}           //span[@class='MuiButton-label' and text()='Node Groups']
${PLUGINS_SELECT}               //select[@id='plugin']
${ADD_NODE_GROUP_BUTTON}        //span[@class='MuiButton-label' and text()='Add Node Group']
${ARC_NODES_BUTTON}             //div[contains(@class,'jss') and text()='arcAuto']/parent::*/parent::*//span[@class='MuiButton-label' and text()='Nodes']
${UI_NODES_BUTTON}              //div[contains(@class,'jss') and text()='uiAuto']/parent::*/parent::*//span[@class='MuiButton-label' and text()='Nodes']
${REST_NODES_BUTTON}            //div[contains(@class,'jss') and text()='restAuto']/parent::*/parent::*//span[@class='MuiButton-label' and text()='Nodes']
${MYSQL_NODES_BUTTON}           //div[contains(@class,'jss') and text()='mysqlAuto']/parent::*/parent::*//span[@class='MuiButton-label' and text()='Nodes']
${SELENIUM_NODES_BUTTON}        //div[contains(@class,'jss') and text()='seleniumAuto']/parent::*/parent::*//span[@class='MuiButton-label' and text()='Nodes']
${ADD_NODE_BUTTON}              //span[@class='MuiButton-label' and text()='Add Node']
${NODE_NO_LIST}                 //div[@id='node_no']
${NODE_ONE}                     //li[@role='option' and text()='1']
${UI_NODE}                      //input[@id='_']
${DOMAIN_TEXTBOX}               //input[@id='domain']
${IP_TEXTBOX}                   //input[@id='ip']
${PORT_TEXTBOX}                 //input[@id='port']
${DB_NAME_TEXTBOX}              //input[@id='db_name']
${DB_USERNAME_TEXTBOX}          //input[@id='username']
${DB_PASSWORD_TEXTBOX}          //input[@id='password']


*** Keywords ***
Go to Connections Page
    Mouse Over                      ${hamburgerManagementButton}
    Click Element                   ${connectionsButton}
    ${currentPageTittle}=           Get Text                        ${pageTittle}
    Should Be Equal                 ${currentPageTittle}            Connections

Add Namespaces
    Click Element               ${addNamespaceButton}
    Input Text                  ${nameTextBox}          new
    Click Element               ${addButton}
    Sleep                       1 seconds
    ${nameSpaceName}=           Get Text                ${firstContainerName}
    Should Be Equal             ${nameSpaceName}        new

Add Environments
    Click Element               ${environmentsButton}
    Click Element               ${addEnvironmentButton}
    Input Text                  ${nameTextbox}          new
    Click Element               ${addButton}
    Sleep                       1 seconds
    ${environmentName}=         Get Text                ${firstContainerName}
    Should Be Equal             ${environmentName}      new

Add Arc Node Groups
    Wait Until Element Is Visible   ${nodeGroupsButton}
    Click Element                   ${nodeGroupsButton}
    Wait Until Element Is Visible   ${addNodeGroupButton}
    Click Element                   ${addNodeGroupButton}
    Wait Until Element Is Visible   ${nameTextbox}
    Input Text                      ${nameTextbox}          arcAuto
    Select From List By Label       ${pluginsSelect}        arc
    Click Element                   ${addButton}
    Sleep                           1 seconds
    ${pluginType}=                  Get Text                ${firstPluginType}
    Capture Page Screenshot
    Should Be Equal                 ${pluginType}           arc

Add Arc Nodes
    Wait Until Element Is Visible   ${arcNodesButton}
    Click Element                   ${arcNodesButton}
    Wait Until Element Is Visible   ${addNodeButton}
    Click Element                   ${addNodeButton}
    Wait Until Element Is Visible   ${nodeNoList}
    Click Element                   ${nodeNoList}
    Click Element                   ${nodeOne}
    Click Element                   ${addButton}

Add Rest Node Groups
    Wait Until Element Is Visible   ${addNodeGroupButton}
    Click Element                   ${addNodeGroupButton}
    Wait Until Element Is Visible   ${nameTextbox}
    Input Text                      ${nameTextbox}          restAuto
    Select From List By Label       ${pluginsSelect}        rest
    Click Element                   ${addButton}
    Sleep                           1 seconds
    ${pluginType}=                  Get Text                ${firstPluginType}
    Capture Page Screenshot
    Should Be Equal                 ${pluginType}           rest

Add Rest Nodes
    Wait Until Element Is Visible   ${restNodesButton}
    Click Element                   ${restNodesButton}
    Wait Until Element Is Visible   ${addNodeButton}
    Click Element                   ${addNodeButton}
    Wait Until Element Is Visible   ${nodeNoList}
    Click Element                   ${nodeNoList}
    Click Element                   ${nodeOne}
    Input Text                      ${domainTextbox}        http://dev.supremetest.net
    Click Element                   ${addButton}

Add Selenium Node Groups
    Wait Until Element Is Visible   ${addNodeGroupButton}
    Click Element                   ${addNodeGroupButton}
    Wait Until Element Is Visible   ${nameTextbox}
    Input Text                      ${nameTextbox}          seleniumAuto
    Select From List By Label       ${pluginsSelect}        selenium
    Click Element                   ${addButton}
    Sleep                           1 seconds
    ${pluginType}=                  Get Text                ${firstPluginType}
    Capture Page Screenshot
    Should Be Equal                 ${pluginType}           selenium

Add Selenium Nodes
    Wait Until Element Is Visible   ${seleniumNodesButton}
    Click Element                   ${seleniumNodesButton}
    Wait Until Element Is Visible   ${addNodeButton}
    Click Element                   ${addNodeButton}
    Wait Until Element Is Visible   ${nodeNoList}
    Click Element                   ${nodeNoList}
    Click Element                   ${nodeOne}
    Input Text                      ${domainTextbox}        https://oauth-eray.yaqiz18-bc9cc:7e317d52-a5d2-4f49-8cc1-3e7f5218df46@ondemand.eu-central-1.saucelabs.com
    Input Text                      ${portTextbox}          443
    Click Element                   ${addButton}

Add Mysql Node Groups
    Wait Until Element Is Visible   ${addNodeGroupButton}
    Click Element                   ${addNodeGroupButton}
    Wait Until Element Is Visible   ${nameTextbox}
    Input Text                      ${nameTextbox}          mysqlAuto
    Select From List By Label       ${pluginsSelect}        mysql
    Click Element                   ${addButton}
    Sleep                           1 seconds
    ${pluginType}=                  Get Text                ${firstPluginType}
    Capture Page Screenshot
    Should Be Equal                 ${pluginType}           mysql

Add Mysql Nodes
    Wait Until Element Is Visible   ${mysqlNodesButton}
    Click Element                   ${mysqlNodesButton}
    Wait Until Element Is Visible   ${addNodeButton}
    Click Element                   ${addNodeButton}
    Wait Until Element Is Visible   ${nodeNoList}
    Click Element                   ${nodeNoList}
    Click Element                   ${nodeOne}
    Input Text                      ${ipTextBox}            159.138.82.23
    Input Text                      ${portTextbox}          3306
    Input Text                      ${dbNameTextbox}        tat_db
    Input Text                      ${dbUsernameTextbox}    tat
    Input Text                      ${dbPasswordTextbox}    tat
    Click Element                   ${addButton}

Add UI Record Node Groups
    Wait Until Element Is Visible   ${addNodeGroupButton}
    Click Element                   ${addNodeGroupButton}
    Wait Until Element Is Visible   ${nameTextbox}
    Input Text                      ${nameTextbox}          uiAuto
    Select From List By Label       ${pluginsSelect}        ui_record
    Click Element                   ${addButton}
    Sleep                           1 seconds
    ${pluginType}=                  Get Text                ${firstPluginType}
    Capture Page Screenshot
    Should Be Equal                 ${pluginType}           ui_record

Add UI Record Nodes
    Wait Until Element Is Visible   ${uiNodesButton}
    Click Element                   ${uiNodesButton}
    Wait Until Element Is Visible   ${addNodeButton}
    Click Element                   ${addNodeButton}
    Wait Until Element Is Visible   ${nodeNoList}
    Click Element                   ${nodeNoList}
    Click Element                   ${nodeOne}
    Input Text                      ${uiNode}               1
    Click Element                   ${addButton}