Feature: Plugin integrated in project with Density APK splits

Scenario: Density Splits project builds successfully
    When I build "density_splits" using the "standard" bugsnag config
    And I wait to receive 14 builds

    Then 7 requests are valid for the build API and match the following:
      | appVersionCode | appVersion |
      | 1              | 1.0        |
      | 2              | 1.0        |
      | 3              | 1.0        |
      | 4              | 1.0        |
      | 5              | 1.0        |
      | 6              | 1.0        |
      | 7              | 1.0        |

    And 7 requests are valid for the android mapping API and match the following:
      | versionCode | versionName |
      | 1           | 1.0         |
      | 2           | 1.0         |
      | 3           | 1.0         |
      | 4           | 1.0         |
      | 5           | 1.0         |
      | 6           | 1.0         |
      | 7           | 1.0         |

Scenario: Density Splits automatic upload disabled
    When I build "density_splits" using the "all_disabled" bugsnag config
    And I wait for 3 seconds
    Then I should receive no builds

Scenario: Density Splits manual upload of build API
    When I build the "Hdpi-release" variantOutput for "density_splits" using the "all_disabled" bugsnag config
    And I wait to receive a build
    Then the build request is valid for the Android Mapping API
    And the build payload field "apiKey" equals "TEST_API_KEY"
    And the build payload field "versionCode" equals "4"
    And the build payload field "versionName" equals "1.0"
    And the build payload field "appId" equals "com.bugsnag.android.example"
