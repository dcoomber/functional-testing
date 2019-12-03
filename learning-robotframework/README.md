# Setup

## Install Robot Framework libraries

```
pip install robotframework
pip install --upgrade robotframework-selenium
pip install --upgrade robotframework-requests
pip install --upgrade robotframework-jsonlibrary
```
## Browser drivers

Download the relevant browser drivers from SeleniumHQ and extract these to your path

## Add plugins to PyCharm

RobotFramework Support
IntelliBot

## Configure external tools

I followed the steps listed on https://softwaretester.info/pycharm-and-robot-framework/
`Note:  it's now robot, not pybot`

Alternatively, run it on the command line using `robot path/to/test/file.robot`

# Test Suite specifics

## Google authentication test

Add the following ENV VARS with values representing your `client_id`, `client_secret` and `refresh_token`:
```bash
# Robot Framework
export GOOGLE_AUTH_CLIENT_ID=<<YOUR ID HERE>>
export GOOGLE_AUTH_CLIENT_SECRET=<<YOUR SECRET HERE>>
export GOOGLE_AUTH_REFRESH_TOKEN=<<YOUR TOKEN HERE>>
```
