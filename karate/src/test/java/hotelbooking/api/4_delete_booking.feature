Feature: 4 Delete Booking

Background:
  # LOAD SHARED FUNCTIONS
  * def common = callonce read('classpath:hotelbooking/common.feature')

  # SERVICE SPECIFIC
  * url common.serviceURL
  * def basePath = 'booking'

Scenario: 01 Delete a booking

  * def requestJson = 
    """
    {
        "firstname": "Goofy",
        "lastname": "Goof",
        "totalprice": 50000,
        "depositpaid": 25000,
        "bookingdates": {
            "checkin": "2022-05-01",
            "checkout": "2022-05-31"
        }
    }
    """

  * configure headers = { Accept: '*/*' }

  Given path basePath
  And request requestJson
  When method post
  Then status 200
  And match response contains { "bookingid": #present }
  * def bookingId = response.bookingid

  * configure headers = { authorization: '#("Basic " + common.appSecret)' }

  Given path basePath + '/' + bookingId
  When method delete
  Then status 201

  