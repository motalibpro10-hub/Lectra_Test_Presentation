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

    # Ouvrir dans un nouvel onglet
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
    #  Assertion : onglet fermé
    # ----------------------------

    # Récupérer le handle de l'onglet actuel avant fermeture
    ${window_to_close}=    Get Window Handles

    # Récupérer la liste des onglets AVANT fermeture
    ${before}=    Get Window Handles
    ${count_before}=    Get Length    ${before}

    # Fermer la fenêtre
    Close Window

    # Récupérer la liste des onglets APRÈS fermeture
    ${after}=    Get Window Handles
    ${count_after}=    Get Length    ${after}

    # Vérifier que le nombre d’onglets a diminué de 1
    Should Be True    ${count_after} == ${count_before - 1}    

    # Vérifier que le handle fermé n'existe plus
    List Should Not Contain Value   ${after}    ${window_to_close}
