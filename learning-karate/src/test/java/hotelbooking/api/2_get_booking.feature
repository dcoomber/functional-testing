Feature: 2 Get Booking

Background:
  # LOAD SHARED FUNCTIONS
  * def common = callonce read('classpath:hotelbooking/common.feature')

  # SERVICE SPECIFIC
  * url common.serviceURL
  * def basePath = 'booking'

Scenario: 1 successful request

  * configure headers = { Accept: '*/*' }

  Given path basePath
  When method get
  Then status 200
  And match response contains { "bookingid": #present }
  * def bookingId = response[0].bookingid

  Given path basePath + '/' + bookingId
  When method get
  Then status 200

Scenario: 9 unsuccessful request

    * def bookingId = 0

    Given path basePath + '/' + bookingId
    When method get
    Then status 404
  