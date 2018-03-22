Feature: Plugin integrated in project with Density APK splits

Scenario: Density Splits project builds successfully
    When I build "density_splits" using the "standard" bugsnag config
    Then I should receive 14 request

    And the request 0 is valid for the Build API
    And the request 1 is valid for the Build API
    And the request 2 is valid for the Build API
    And the request 3 is valid for the Build API
    And the request 4 is valid for the Build API
    And the request 5 is valid for the Build API
    And the request 6 is valid for the Build API

    And the payload field "appVersion" equals "1.0" for request 0
    And the payload field "apiKey" equals "TEST_API_KEY" for request 0
    And the payload field "appVersionCode" equals "1" for request 0

    And the request 7 is valid for the Android Mapping API
    And the request 8 is valid for the Android Mapping API
    And the request 9 is valid for the Android Mapping API
    And the request 10 is valid for the Android Mapping API
    And the request 11 is valid for the Android Mapping API
    And the request 12 is valid for the Android Mapping API
    And the request 13 is valid for the Android Mapping API

    And the part "apiKey" for request 7 equals "TEST_API_KEY"
    And the part "versionCode" for request 7 equals "1"
    And the part "versionName" for request 7 equals "1.0"
    And the part "appId" for request 7 equals "com.bugsnag.android.example"

Scenario: Density Splits automatic upload disabled
    When I build "density_splits" using the "all_disabled" bugsnag config
    Then I should receive no requests

Scenario: Density Splits manual upload of build API
    When I build the "Hdpi-release" variantOutput for "density_splits" using the "all_disabled" bugsnag config
    Then I should receive 1 request
    And the request 0 is valid for the Android Mapping API
    And the part "apiKey" for request 0 equals "TEST_API_KEY"
    And the part "versionCode" for request 0 equals "1"
    And the part "versionName" for request 0 equals "1.0"
    And the part "appId" for request 0 equals "com.bugsnag.android.example"
