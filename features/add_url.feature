Feature: Add Url
  In order to create a shorted URL
  As a non-logged user
  I want to create a short URL

  @javascript
  Scenario: URL screen
    Given The URL form is presented in the homepage
    When  The user complets the form with a valid URL
    Then  The successfully message should be showed

