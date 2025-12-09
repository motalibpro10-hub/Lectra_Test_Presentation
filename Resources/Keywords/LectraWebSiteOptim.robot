*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/LectraWebSitePage.py
Variables    ../Locators/GooglePage.py

*** Variables ***
${URL}           https://www.lectra.com
${WaitSeconds}   10s

*** Keywords ***
LectraWebsiteOpti
    [Documentation]    End-to-End Navigation on Lectra Website
    Log To Console    --- Opening Lectra Website ---\n
    Open Lectra Website
    Accept Cookies
    Select English Language
    Navigate Fashion Section
    Navigate Automotive Section
    Navigate Furniture Section
    Navigate About Us
    Close Current Tab And Return

# --- Sub-keywords ---

Open Lectra Website
    Execute JavaScript    window.open("${URL}", '_blank');
    Switch Window    NEW

Accept Cookies
    ${res}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${AcceptCookiesLectra}    5s
    Run Keyword If    '${res[0]}'=='PASS'    Scroll Element Into View    ${AcceptCookiesLectra}
    Run Keyword If    '${res[0]}'=='PASS'    Click Element    ${AcceptCookiesLectra}

Select English Language
    Wait Until Element Is Visible    ${Languages}    ${WaitSeconds}
    Wait Until Element Is Enabled    ${Languages}    ${WaitSeconds}
    Wait Until Keyword Succeeds    2x    ${WaitSeconds}    Click Element    ${Languages}
    Click Element    ${English}

Navigate Fashion Section
    Log To Console    --- Navigating Fashion Section ---\n
    Click Element    ${Fashion}
    Wait Until Element Is Visible    ${LectraFashion}    ${WaitSeconds}
    Click Element    ${LectraFashion}
    Wait Until Element Is Visible    ${FashionTitle}

Navigate Automotive Section
    Log To Console    --- Navigating Automotive Section ---\n
    Click Element    ${Automotive}
    Wait Until Element Is Visible    ${DiscoverAutomotiveJourneyButton}    ${WaitSeconds}

Navigate Furniture Section
    Log To Console    --- Navigating Furniture Section ---\n
    Click Element    ${Furniture}
    Wait Until Element Is Visible    ${DiscoverFurniturejourneyButton}    ${WaitSeconds}

Navigate About Us
    Log To Console    --- Navigating About Us Section ---\n
    Wait Until Element Is Visible    ${AboutUsDropdown}    ${WaitSeconds}
    Click Element    ${AboutUsDropdown}
    Wait Until Element Is Visible    ${DiscoverLectra}    ${WaitSeconds}
    Click Element    ${DiscoverLectra}
    Wait Until Element Is Visible    ${DiscoverLectraPage}    ${WaitSeconds}

Close Current Tab And Return
    Close Window
    Switch Window    MAIN
