*** Comments ***

*** Settings ***
Documentation    New Test Suite
Library           QForce
Library           String
Suite Setup       openbrowser         about:blank    chrome
Suite Teardown    CloseAllBrowsers

*** Variables ***
${Type}                Inversor
*** Test Cases ***
TC:1 Create an Account
    SF_Login
    ${PhoneNumber}     Generate Random String      10                          [NUMBERS]
    Log To Console     ${PhoneNumber}
    Log To Console     ${AccountCreation.Account Name}
    ClickText          Accounts                    timeout=45
    ClickText          New
    UseModal           On
    TypeText           *Account Name               ${AccountCreation.Account Name}
    TypeText           Phone                       ${PhoneNumber}
    TypeText           Website                     ${AccountCreation.Account Name}
    PickList           Type                        ${Type}
    TypeText       Employees                   50
    TypeText           Annual Revenue              525045.89
    ClickText          Save                        partial_match=false
    UseModal           off
    ClickText          Details                     timeout= 45
TC2:2 Create an Opportunities
    ClickText    New Opportunity    timeout=45
    UseModal     on
    ${OppName}                      Generate Random String    3    [NUMBERS]
    TypeText     *Opportunity Name    ${AccountCreation.Account Name}_${OppName}
    PickList     *Stage               Prospecting
    TypeText     Amount               59045.99
    TypeText     Next Step            Analasys
    ClickText          Save                        partial_match=false
TC:3 Create Contact
    ClickText    Contacts    timeout=45
    ClickText    New
    UseModal     on
    PickList     Salutation    Sr.
    TypeText     First Name    ${LeadCreation.FirstName}
    TypeText     *Last Name    ${LeadCreation.LastName}
    DropDown     *Account Name    ${AccountCreation.Account Name}
    ${PhoneNumber}     Generate Random String      10                          [NUMBERS]
    TypeText           Phone                       ${PhoneNumber}
    ClickText          Save                        partial_match=false
*** Keywords ***
SF_Login
    JwtAuthenticate    ${client_id}                ${username}                 ${PrivateKey}
    JwtLogin           /lightning/page/home