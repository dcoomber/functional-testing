@ignore
Feature: common.feature

Scenario: load shared functions and variables

      # COMMON VARIABLES
      * def appId = 'EE Hotel Booking API'
      * def appSecret = 'YWRtaW46cGFzc3dvcmQxMjM='
      * def serviceURL = 'http://hotel-test.equalexperts.io'

      # SHARED FUNCTIONS
      * def getDate =
      """
      function() {
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
        var sdf = new SimpleDateFormat("yyyy-MM-dd");
        var date = new java.util.Date();
        return sdf.format(date);
      }
      """
