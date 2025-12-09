*** Settings ***

Library    OperatingSystem
Library    SeleniumLibrary
Resource    ../Resources/Keywords/LectraWebSiteOptim.robot
Resource    ../Resources/Keywords/LectraCareerOpti.robot
Resource    ../Resources/Keywords/Common.robot


*** Test Cases ***
TC1:Lectra careers Website Test
    [Documentation]    Lectra careers Website Test
    [Tags]    critical_1
    Google Website Navigation
    LectraWebsiteOpti
    LectraCareerOpti
    Close Browser
