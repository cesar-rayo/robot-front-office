*** Settings ***
Library  SeleniumLibrary

*** Variables ***
@{CAPABILITIES}
    ...  browserName: ${BROWSER},
    ...  platform: linux,
    ...  name: RobotFramework Test

${REMOTE_URL}  http://localhost:4444


*** Keywords ***
Set Browser Options
    IF  '${BROWSER}'.lower()=='chrome'
        ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
        Call Method    ${options}    add_argument    --start-maximized
        Call Method    ${options}    add_argument    --no-sandbox
        Call Method    ${options}    add_argument    --ignore-certificate-errors
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --disable-site-isolation-trials
        Set Global Variable    ${OPTIONS}    ${options}
    END
    #Open Browser    about:blank    remote_url=${REMOTE_URL}    desired_capabilities=${EMPTY.join(${CAPABILITIES})}  options=${OPTIONS}

Begin Web Test
    open browser  url=about:blank
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${EMPTY.join(${CAPABILITIES})}
    maximize browser window
    delete all cookies

End Web Test
    close all browsers

