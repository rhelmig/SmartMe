*** Settings ***
Documentation   	Sample run against a Smart Me live demo.
Library   	        SeleniumLibrary   15.0   5.0
Resource            ../Resources/Common.robot
Suite Setup  Begin Test
#Suite Teardown   End Test

*** Test Cases ***
Turn ON Single Phase
    1 On
Turn ON all 3 Phases
    3 On
Turn ON Plug Light
    Plug On
Turn OFF the single Phase
    1 Off
Turn OFF 3 Phases
	3 Off
Test Lighted Plug is OFF
    Plug Off
Test Lighted Plug will NOT turn back on
    No Power


