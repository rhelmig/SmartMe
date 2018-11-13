*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${Browser}   	Chrome
${url}          http://smart-me.com/Description/Demo/

*** Keywords ***
Begin Test
    OPEN BROWSER  ${url}  ${Browser}
    maximize browser window

End test
    sleep  1s
    log  Test Completed!
    close browser