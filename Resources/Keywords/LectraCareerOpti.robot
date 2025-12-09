*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables   ../Locators/LectraCareerWebSite.py

*** Variables ***
${URL_Lectra_Career}     https://careers.lectra.com/?locale=en_US

*** Keywords ***
LectraCareerOpti
    [Documentation]    Lectra Career Website Job Search Flow
    Log To Console    --- Navigating to Lectra Career website Section ---\n

    # Open in a new tab
    Execute JavaScript    window.open('${URL_Lectra_Career}', '_blank')
    Switch Window    NEW

    # Actions
    Wait Until Element Is Visible   ${AllOpportunitiesButton}    10s
    Click Element    ${AllOpportunitiesButton}

    Wait Until Element Is Visible    ${CookieAcceptButton}    10s
    Click Element    ${CookieAcceptButton}

    Wait Until Element Is Visible    ${SearchJobButton}   10s
    Click Element    ${SearchJobButton}

    Wait Until Element Is Visible    ${FirstElemntTableOfSearchJob}    10s
    Click Element    ${FirstElemntTableOfSearchJob}

    # ----------------------------
    # Assertion: tab is closed
    # ----------------------------

    # Get the handle of the current tab before closing it
    ${window_to_close}=    Get Window Handles

    # Retrieve the list of tabs BEFORE closing
    ${before}=    Get Window Handles
    ${count_before}=    Get Length    ${before}

    # Close the window
    Close Window

   # Retrieve the list of tabs AFTER closing
    ${after}=    Get Window Handles
    ${count_after}=    Get Length    ${after}

    # Verify that the number of tabs has decreased by 1
    Should Be True    ${count_after} == ${count_before - 1}    

    # Verify that the closed handle no longer exists
    List Should Not Contain Value   ${after}    ${window_to_close}
