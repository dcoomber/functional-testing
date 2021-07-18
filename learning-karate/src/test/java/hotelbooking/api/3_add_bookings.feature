Feature: 3 Add Bookings

Background:
  # LOAD SHARED FUNCTIONS
  * def common = callonce read('classpath:hotelbooking/common.feature')

  # SERVICE SPECIFIC
  * url common.serviceURL
  * def basePath = 'booking'

Scenario Outline: <testNo> <description> returns <httpStatusCode>

  * configure headers = { Accept: '*/*' }
  * def requestJson = 
    """
    {
        "firstname": "<firstName>",
        "lastname": "<lastName>",
        "totalprice": <totalPrice>,
        "depositpaid": <depositPaid>,
        "bookingdates": {
            "checkin": "<checkIn>",
            "checkout": "<checkOut>"
        }
    }
    """

  Given path basePath
  And request requestJson
  When method post
  Then status <httpStatusCode>

Examples:
  | testNo | firstName | lastName | totalPrice | depositPaid | checkIn    | checkOut   | httpStatusCode | description          |
  | 1      | Mickey    | Mouse    | 100000     | 50000       | 2022-01-01 | 2022-01-31 | 200            | successful request   |
  | 2      | Donald    | Duck     | abc        | 50000       | 2022-02-01 | 2022-02-31 | 400            | invalid total amount |