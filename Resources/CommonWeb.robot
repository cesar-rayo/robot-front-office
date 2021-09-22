*** Settings ***
Library  SeleniumLibrary

*** Variables ***
@{CAPABILITIES}
    ...  browserName: ${BROWSER},
    ...  platform: linux,
    ...  name: RobotFramework Test

${REMOTE_URL}  http://localhost:4444


*** Keywords ***
Begin Web Test
    open browser  url=about:blank
    ...  remote_url=${REMOTE_URL}
    ...  desired_capabilities=${EMPTY.join(${CAPABILITIES})}
    maximize browser window
    delete all cookies

End Web Test
    close all browsers