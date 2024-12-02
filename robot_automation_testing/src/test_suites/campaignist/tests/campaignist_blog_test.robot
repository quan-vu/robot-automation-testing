*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://campaignist.io
${BROWSER}        Chrome

*** Keywords ***
Open Site
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

*** Test Cases ***
Verify Site Title
    Open Site
    ${title}=    Get Title
    Should Contain    ${title}    Campaignist
    