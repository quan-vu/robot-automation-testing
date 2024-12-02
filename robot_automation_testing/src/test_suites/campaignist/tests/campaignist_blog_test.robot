*** Settings ***
Library           SeleniumLibrary
Resource         ../resources/campaignist_keywords.resource

*** Keywords ***
Open Site
    Open Browser    ${URL}    ${HEADLESS_BROWSER}
    Maximize Browser Window

*** Test Cases ***
Verify Site Title
    Open Site
    ${title}=    Get Title
    Should Contain    ${title}    Campaignist
    