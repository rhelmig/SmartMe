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

1 On
    select frame        //*[@id="liveDemoDiv"]/iframe
    click link          //*[@id="MainContent_FolderTree_lbASTreeNode3"]
    Click Element   	SwitchOnIconOutput10
	Click Element   	SwitchButtonOn1
	sleep  5s
	${watts_ph1}  get text  //*[@id="Tile1"]
    capture page screenshot
    log  ${watts_ph1}

3 On
    click link          //*[@id="MainContent_FolderTree_lbASTreeNode4"]
    sleep  2s
    Click Element   	SwitchOnIconOutput1
	Click Element   	SwitchOnIconOutput2
	Click Element   	SwitchOnIconOutput3
	Click Element   	SwitchOnIconOutput10
	Click Element   	SwitchOnIconOutput11
    sleep  7s
    ${watts_on}  get text  //*[@id="Tile1"]
    capture page screenshot
    should be true  ${watts_on} >= 5.0
    log  ${watts_on}

Plug On
    click link                      //*[@id="MainContent_FolderTree_lbASTreeNode5"]
    wait until element is visible   //*[@id="SwitchButtonOff1"]
    click element                   //*[@id="SwitchButtonOff1"]
    sleep  2s
    click element                   //*[@id="SwitchButtonOn1"]
    sleep  5s
    ${watts}  get text              //*[@id="Tile1"]
    capture page screenshot
    should be true  ${watts} >= .2
    log  ${watts}

1 Off
    click link                          //*[@id="MainContent_FolderTree_lbASTreeNode3"]
    Wait Until Element Is Visible   	SwitchButtonOff1
	Click Element   	                SwitchButtonOff1
    ${watts}  get text              //*[@id="Tile1"]
    capture page screenshot
    log  ${watts}

3 Off
    click link          //*[@id="MainContent_FolderTree_lbASTreeNode4"]
	Click Element   	SwitchOffIconOutput1
	Click Element   	SwitchOffIconOutput2
	Click Element   	SwitchOffIconOutput3
	Click Element   	SwitchOffIconOutput10
	Click Element   	SwitchOffIconOutput11
    sleep  5s
    ${watts_off}  get text  //*[@id="Tile1"]
    capture page screenshot
    log  ${watts_off}
    Page Should Contain   	0.0

Plug Off
    select frame        //*[@id="liveDemoDiv"]/iframe
    Click Link   	MainContent_FolderTree_lbASTreeNode5
    sleep  5s
    ${light_watts}  get text  //*[@id="Tile1"]
    capture page screenshot
    log  ${light_watts}

No Power
    click element       //*[@id="SwitchButtonOn1"]
    ${final_watts}  get text  //*[@id="Tile1"]
    capture page screenshot
    # Watts remain when all are off. Expected result???
    should be true  ${final_watts} <= 0.5
    log  ${final_watts}
