Feature: 1 Get Bookings

Background:
  # LOAD SHARED FUNCTIONS
  * def common = callonce read('classpath:hotelbooking/common.feature')

  # SERVICE SPECIFIC
  * url common.serviceURL
  * def basePath = 'booking'

Scenario: 1 successful request

  Given path basePath
  When method get
  Then status 200
  And match response contains { "bookingid": #present }
