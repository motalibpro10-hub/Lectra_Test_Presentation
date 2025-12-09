*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/GooglePage.py

*** Variables ***
${URL_Google}     https://www.google.com/
${browser}        chrome
${SearchText}     Lectra

*** Keywords ***
Google Website Navigation
    [Documentation]    End-to-End Navigation on Lectra Website
    Log To Console   \n\n
    Log To Console    --- Navigating to Google page ---\n
    Open Browser    ${URL_Google}     ${browser}
    Maximize Browser Window
    ${res}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${AcceptCookiesGoogle}    5s
    Run Keyword If    '${res[0]}'=='PASS'    Scroll Element Into View    ${AcceptCookiesGoogle}
    Run Keyword If    '${res[0]}'=='PASS'    Click Element    ${AcceptCookiesGoogle}
    Title Should Be    Google
    Click Element    name=${ResearchField}
    Input Text    name=${ResearchField}   ${SearchText} 
    Press Keys    name=${ResearchField}    ENTER