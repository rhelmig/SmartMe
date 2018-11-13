*** Settings ***
Documentation   	Sample run against a Smart Me live demo.
Library   	        SeleniumLibrary   15.0   5.0
Resource            ../Resources/Common.robot

Suite Setup  Begin Test
#Suite Teardown   End Test

*** Test Cases ***
##Need to add an OFF for the single Phase switch

Turn on Single Phase
    select frame        //*[@id="liveDemoDiv"]/iframe
    click link          //*[@id="MainContent_FolderTree_lbASTreeNode3"]
    Click Element   	SwitchOnIconOutput10
	Click Element   	SwitchButtonOn1
	sleep  3s
	${watts_ph1}  get text  //*[@id="Tile1"]
    capture page screenshot
    should be true  ${watts_ph1} > 1.0
    log  ${watts_ph1}


Turn ON all 3 Phases
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

Turn OFF/ON Plug
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


Turn OFF all Phases
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

Test Lighted Plug is OFF
    select frame        //*[@id="liveDemoDiv"]/iframe

    Click Link   	MainContent_FolderTree_lbASTreeNode5
    sleep  5s
    ${light_watts}  get text  //*[@id="Tile1"]
    capture page screenshot
    should be true  ${light_watts} <= 0.5
    log  ${light_watts}

Test Lighted Plug will NOT turn back on
    click element       //*[@id="SwitchButtonOn1"]
    ${final_watts}  get text  //*[@id="Tile1"]
    capture page screenshot
    should be true  ${final_watts} <= 0.5
    log  ${final_watts}
