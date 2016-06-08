Feature: Open Route
  As a user
  I want to open a route in the browser

  Scenario:
    When I open a routes file
    And I insert:
    """
    GET /test controlle.Test.test()
    """

