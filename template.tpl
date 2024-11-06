___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Snowplow v3 Settings",
  "description": "The Snowplow v3 Settings variable can be used to easily apply a set of tracker configuration parameters to tags created with the Snowplow v3 tag template.",
  "__wm": "VGVtcGxhdGUtQXV0aG9yX1Nub3dwbG93QW5hbHl0aWNzVjNWYXJpYWJsZS1TaW1vLUFoYXZh",
  "securityGroups": [],
  "categories": [
    "ANALYTICS"
  ],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "trackerOptions",
    "displayName": "Tracker Options",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "help": "This is the name of the tracker instance. It is used to distinguish the configuration you have set for one tracker instance from all the other possible tracker instances on the page.",
        "alwaysInSummary": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Tracker Name",
        "simpleValueType": true,
        "name": "trackerName",
        "type": "TEXT",
        "defaultValue": "spTracker"
      },
      {
        "help": "Enter the hostname of the collector. You can optionally provide the protocol (http:// or https://) if you want to force either HTTP or HTTPS.",
        "alwaysInSummary": true,
        "valueValidators": [
          {
            "args": [
              "^\\S+[^/]$"
            ],
            "errorMessage": "You must provide a valid hostname. Please check that no whitespace or trailing slashes are included.",
            "type": "REGEX"
          },
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Collector Endpoint Hostname",
        "simpleValueType": true,
        "name": "collectorEndpoint",
        "type": "TEXT",
        "valueHint": "e.g. snowplowcollector.mydomain.net"
      },
      {
        "displayName": "JavaScript Tracker",
        "name": "trackerGroup",
        "groupStyle": "ZIPPY_CLOSED",
        "type": "GROUP",
        "subParams": [
          {
            "type": "SELECT",
            "name": "spLibrary",
            "displayName": "Snowplow JavaScript Tracker Library",
            "macrosInSelect": false,
            "selectItems": [
              {
                "value": "jsDelivr",
                "displayValue": "jsDelivr"
              },
              {
                "value": "unpkg",
                "displayValue": "unpkg"
              },
              {
                "value": "selfHosted",
                "displayValue": "Self-hosted"
              },
              {
                "value": "doNotLoad",
                "displayValue": "Do not load"
              }
            ],
            "simpleValueType": true,
            "defaultValue": "selfHosted",
            "help": "Load the Snowplow JavaScript library from a third-party CDN or choose the location where the self-hosted library can be loaded from. `Do not load` can be used when the Tracker Snippet is loaded with another technique such as directly on the page."
          },
          {
            "type": "TEXT",
            "name": "selfHostedUrl",
            "displayName": "Self-hosted Library URL",
            "simpleValueType": true,
            "help": "Add the URL where your self-hosted Snowplow JavaScript library can be downloaded from. If this location is not in AWS S3 (via Cloudfront) or GCP Storage, remember to update \u003ca href\u003d\"https://www.simoahava.com/analytics/custom-templates-guide-for-google-tag-manager/#injects-scripts\"\u003e\u003cstrong\u003etemplate permissions\u003c/strong\u003e\u003c/a\u003e to allow script injection requests to this URL.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^https://.*"
                ]
              }
            ],
            "enablingConditions": [
              {
                "paramName": "spLibrary",
                "paramValue": "selfHosted",
                "type": "EQUALS"
              }
            ],
            "valueHint": "https://123.cloudfront.net/sp.js"
          },
          {
            "type": "TEXT",
            "name": "version",
            "displayName": "Library version",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "spLibrary",
                "paramValue": "unpkg",
                "type": "EQUALS"
              },
              {
                "paramName": "spLibrary",
                "paramValue": "jsDelivr",
                "type": "EQUALS"
              }
            ],
            "help": "Enter the version of the sp.js library you want to load. You can find more details about library versions \u003ca href\u003d\"https://docs.snowplow.io/docs/collecting-data/collecting-from-own-applications/javascript-trackers/javascript-tracker/third-party-cdn-hosting\"\u003ehere\u003c/a\u003e.",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^([3-9]|[1-9][0-9])\\..+$"
                ],
                "errorMessage": "The sp.js library version number must be greater or equal to 3 (e.g. 3.1.5)."
              }
            ],
            "valueHint": "3.8.0"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Application Settings",
    "name": "trackerParamsApp",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "help": "See \u003ca href\u003d\"https://docs.snowplow.io/docs/collecting-data/collecting-from-own-applications/javascript-trackers/javascript-tracker/javascript-tracker-v3/tracker-setup/initialization-options/#setting-the-application-id\"\u003ehere\u003c/a\u003e for more information.",
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "Application ID",
        "defaultValue": "my-site",
        "simpleValueType": true,
        "name": "appId",
        "type": "TEXT"
      },
      {
        "selectItems": [
          {
            "displayValue": "Web",
            "value": "web"
          },
          {
            "displayValue": "Mobile/Tablet",
            "value": "mob"
          },
          {
            "displayValue": "Desktop/Laptop/Notebook",
            "value": "pc"
          },
          {
            "displayValue": "Server-Side App",
            "value": "srv"
          },
          {
            "displayValue": "General App",
            "value": "app"
          },
          {
            "displayValue": "Connected TV",
            "value": "tv"
          },
          {
            "displayValue": "Games Console",
            "value": "cnsl"
          },
          {
            "displayValue": "Internet of Things",
            "value": "iot"
          },
          {
            "displayValue": "[Custom]",
            "value": "custom"
          }
        ],
        "displayName": "Platform",
        "simpleValueType": true,
        "name": "platform",
        "type": "SELECT",
        "subParams": [
          {
            "alwaysInSummary": false,
            "enablingConditions": [
              {
                "paramName": "platform",
                "type": "EQUALS",
                "paramValue": "custom"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "displayName": "",
            "simpleValueType": true,
            "name": "customPlatform",
            "type": "TEXT"
          }
        ]
      }
    ]
  },
  {
    "displayName": "Privacy",
    "name": "trackerParamsPrivacy",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "True",
            "value": true
          },
          {
            "displayValue": "False",
            "value": false
          }
        ],
        "displayName": "Respect \"Do Not Track\"",
        "simpleValueType": true,
        "name": "respectDoNotTrack",
        "type": "SELECT"
      },
      {
        "type": "SELECT",
        "name": "anonymousTracking",
        "displayName": "Anonymous Tracking",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": "anonymousTrackingFalse",
            "displayValue": "False"
          },
          {
            "value": "anonymousTrackingTrue",
            "displayValue": "True"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "anonymousTrackingFalse",
        "subParams": [
          {
            "type": "CHECKBOX",
            "name": "withServerAnonymisation",
            "checkboxText": "Server Anonymisation",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "anonymousTracking",
                "paramValue": "anonymousTrackingTrue",
                "type": "EQUALS"
              }
            ],
            "defaultValue": false
          },
          {
            "type": "CHECKBOX",
            "name": "withSessionTracking",
            "checkboxText": "Anonymous Session Tracking",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "anonymousTracking",
                "paramValue": "anonymousTrackingTrue",
                "type": "EQUALS"
              }
            ],
            "defaultValue": false
          }
        ],
        "help": "Please read \u003ca href\u003d\"https://docs.snowplow.io/docs/collecting-data/collecting-from-own-applications/javascript-trackers/javascript-tracker/javascript-tracker-v3/tracker-setup/initialization-options/#anonymous-tracking\"\u003ethis documentation\u003c/a\u003e carefully before selecting Anonymous Tracking in order to understand the implications."
      }
    ]
  },
  {
    "displayName": "Cookie Settings",
    "name": "trackerParamsCookie",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "alwaysInSummary": false,
        "selectItems": [
          {
            "displayValue": "Cookie and Local Storage",
            "value": "cookieAndLocalStorage"
          },
          {
            "displayValue": "Cookie",
            "value": "cookie"
          },
          {
            "displayValue": "Local Storage",
            "value": "localStorage"
          },
          {
            "value": "none",
            "displayValue": "None"
          }
        ],
        "displayName": "State Storage Strategy",
        "simpleValueType": true,
        "name": "stateStorageStrategy",
        "type": "SELECT",
        "defaultValue": "cookieAndLocalStorage"
      },
      {
        "help": "Set to \u003cstrong\u003eauto\u003c/strong\u003e to have Snowplow write the cookie on the root domain.",
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "type": "EQUALS",
            "paramValue": "cookie"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "displayName": "Cookie Domain",
        "defaultValue": "auto",
        "simpleValueType": true,
        "name": "cookieDomain",
        "type": "TEXT"
      },
      {
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "type": "EQUALS",
            "paramValue": "cookie"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "displayName": "Cookie Name",
        "defaultValue": "sp",
        "simpleValueType": true,
        "name": "cookieName",
        "type": "TEXT",
        "help": "Use this field to set the first-party cookie name prefix of the tracker instance. The default value is different to the JavaScript tracker\u0027s default. If you want it to be the same, set this to \u003cstrong\u003e_sp_\u003c/strong\u003e"
      },
      {
        "selectItems": [
          {
            "displayValue": "2 years",
            "value": 63072000
          },
          {
            "displayValue": "1 year",
            "value": 31536000
          },
          {
            "displayValue": "6 months",
            "value": 15552000
          },
          {
            "displayValue": "3 months",
            "value": 7776000
          },
          {
            "displayValue": "1 month",
            "value": 2592000
          },
          {
            "displayValue": "7 days",
            "value": 604800
          },
          {
            "displayValue": "1 day",
            "value": 86400
          },
          {
            "displayValue": "Session",
            "value": 0
          },
          {
            "displayValue": "Disable first-party cookie",
            "value": -1
          },
          {
            "displayValue": "[Custom lifetime]",
            "value": "custom"
          }
        ],
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "type": "EQUALS",
            "paramValue": "cookie"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "displayName": "Cookie Lifetime",
        "simpleValueType": true,
        "name": "cookieLifetime",
        "type": "SELECT",
        "subParams": [
          {
            "enablingConditions": [
              {
                "paramName": "cookieLifetime",
                "type": "EQUALS",
                "paramValue": "custom"
              }
            ],
            "valueValidators": [
              {
                "type": "POSITIVE_NUMBER"
              }
            ],
            "simpleValueType": true,
            "name": "customCookieLifetime",
            "type": "TEXT"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "cookieSameSite",
        "displayName": "Cookie SameSite",
        "macrosInSelect": true,
        "selectItems": [
          {
            "value": "None",
            "displayValue": "None"
          },
          {
            "value": "Lax",
            "displayValue": "Lax"
          },
          {
            "value": "Strict",
            "displayValue": "Strict"
          },
          {
            "value": "noSameSite",
            "displayValue": "null"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookie",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ],
        "defaultValue": "Lax"
      },
      {
        "type": "SELECT",
        "name": "cookieSecure",
        "displayName": "Cookie Secure",
        "selectItems": [
          {
            "value": true,
            "displayValue": "True"
          },
          {
            "value": false,
            "displayValue": "False"
          }
        ],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookie",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "sessionCookieTimeout",
        "displayName": "Session Cookie Timeout",
        "simpleValueType": true,
        "valueUnit": "seconds",
        "defaultValue": 1800,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookie",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "maxLocalStorageQueueSize",
        "displayName": "Maximum Local Storage Queue Size",
        "simpleValueType": true,
        "defaultValue": 1000,
        "enablingConditions": [
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "cookieAndLocalStorage",
            "type": "EQUALS"
          },
          {
            "paramName": "stateStorageStrategy",
            "paramValue": "localStorage",
            "type": "EQUALS"
          }
        ],
        "valueUnit": "events"
      }
    ]
  },
  {
    "displayName": "Dispatching",
    "name": "trackerParamsHit",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "POST",
            "value": "post"
          },
          {
            "displayValue": "GET",
            "value": "get"
          },
          {
            "displayValue": "Beacon",
            "value": "beacon"
          }
        ],
        "displayName": "Dispatch Method",
        "simpleValueType": true,
        "name": "eventMethod",
        "type": "SELECT",
        "defaultValue": "post"
      },
      {
        "macrosInSelect": false,
        "selectItems": [
          {
            "displayValue": "True",
            "value": true
          },
          {
            "displayValue": "False",
            "value": false
          }
        ],
        "displayName": "Encode Into Base64",
        "simpleValueType": true,
        "name": "encodeBase64",
        "type": "SELECT"
      },
      {
        "enablingConditions": [
          {
            "paramName": "eventMethod",
            "type": "NOT_EQUALS",
            "paramValue": "get"
          }
        ],
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "displayName": "Buffer Size",
        "defaultValue": 1,
        "simpleValueType": true,
        "name": "bufferSize",
        "type": "TEXT"
      },
      {
        "enablingConditions": [
          {
            "paramName": "eventMethod",
            "type": "NOT_EQUALS",
            "paramValue": "get"
          }
        ],
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "displayName": "POST Path",
        "defaultValue": "/com.snowplowanalytics.snowplow/tp2",
        "simpleValueType": true,
        "name": "postPath",
        "type": "TEXT"
      },
      {
        "enablingConditions": [
          {
            "paramName": "eventMethod",
            "type": "NOT_EQUALS",
            "paramValue": "get"
          }
        ],
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "displayName": "Maximum POST Payload Size",
        "defaultValue": 40000,
        "simpleValueType": true,
        "name": "maxPostBytes",
        "valueUnit": "bytes",
        "type": "TEXT"
      },
      {
        "type": "TEXT",
        "name": "connectionTimeout",
        "displayName": "Connection Timeout",
        "simpleValueType": true,
        "defaultValue": 5000,
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "help": "Set the connection timeout for POST and GET requests.The recommended value is between 5000 and 10000.",
        "valueUnit": "milliseconds"
      }
    ]
  },
  {
    "displayName": "Predefined Contexts",
    "name": "trackerParamsContexts",
    "groupStyle": "ZIPPY_CLOSED",
    "type": "GROUP",
    "subParams": [
      {
        "simpleValueType": true,
        "name": "webPage",
        "checkboxText": "webPage",
        "type": "CHECKBOX",
        "defaultValue": true
      },
      {
        "simpleValueType": true,
        "name": "performanceTiming",
        "checkboxText": "performanceTiming",
        "type": "CHECKBOX"
      },
      {
        "simpleValueType": true,
        "name": "gaCookies",
        "checkboxText": "gaCookies",
        "type": "CHECKBOX"
      },
      {
        "type": "CHECKBOX",
        "name": "clientHints",
        "checkboxText": "clientHints",
        "simpleValueType": true
      },
      {
        "simpleValueType": true,
        "name": "geolocation",
        "checkboxText": "geolocation",
        "type": "CHECKBOX"
      },
      {
        "type": "CHECKBOX",
        "name": "session",
        "checkboxText": "session",
        "simpleValueType": true,
        "help": "Adds client session context entity to events, provided that anonymous tracking is disabled. This option is only available since version 3.5 of the Snowplow JavaScript tracker.",
        "defaultValue": false
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const UNPKG =
  'https://unpkg.com/@snowplow/javascript-tracker@' +
  data.version +
  '/dist/sp.js';
const JSDELIVR =
  'https://cdn.jsdelivr.net/npm/@snowplow/javascript-tracker@' +
  data.version +
  '/dist/sp.min.js';

const libOptionsMap = {
  jsDelivr: JSDELIVR,
  unpkg: UNPKG,
  doNotLoad: 'doNotLoad',
  selfHosted: data.selfHostedUrl,
};

const anonymousTracking = (() => {
  if (
    data.anonymousTracking === 'anonymousTrackingFalse' ||
    !data.anonymousTracking
  ) {
    return false;
  }

  if (data.anonymousTracking === 'anonymousTrackingTrue') {
    return {
      withServerAnonymisation: data.withServerAnonymisation || false,
      withSessionTracking: data.withSessionTracking || false,
    };
  }

  return data.anonymousTracking;
})();

return {
  type: 'snowplow',
  appId: data.appId,
  platform: data.platform === 'custom' ? data.customPlatform : data.platform,
  respectDoNotTrack: data.respectDoNotTrack,
  stateStorageStrategy: data.stateStorageStrategy,
  cookieDomain: data.cookieDomain !== 'auto' && data.cookieDomain,
  discoverRootDomain: data.cookieDomain === 'auto',
  cookieName: data.cookieName,
  cookieLifetime:
    data.cookieLifetime !== 'custom' ? data.cookieLifetime : data.customCookieLifetime,
  cookieSameSite:
    data.cookieSameSite === 'noSameSite' ? null : data.cookieSameSite,
  cookieSecure: data.cookieSecure,
  sessionCookieTimeout: data.sessionCookieTimeout,
  maxLocalStorageQueueSize: data.maxLocalStorageQueueSize,
  eventMethod: data.eventMethod,
  encodeBase64: data.encodeBase64,
  bufferSize: data.bufferSize,
  postPath: data.postPath,
  maxPostBytes: data.maxPostBytes,
  connectionTimeout: data.connectionTimeout,
  anonymousTracking: anonymousTracking,
  contexts: {
    webPage: data.webPage,
    performanceTiming: data.performanceTiming,
    gaCookies: data.gaCookies,
    clientHints: data.clientHints,
    geolocation: data.geolocation,
    session: data.session,
  },
  trackerOptions: {
    trackerName: data.trackerName,
    collectorEndpoint: data.collectorEndpoint,
    libUrl: libOptionsMap[data.spLibrary],
  },
};


___TESTS___

scenarios:
- name: Variable returns expected object
  code: |
    const mockData = {
      trackerName: 'snowTracker',
      collectorEndpoint: 'https://www.test.com',

      spLibrary: 'unpkg',
      version: '3.5.0',

      appId: 'app-id',
      platform: 'custom',
      customPlatform: 'testPlatform',

      respectDoNotTrack: false,
      anonymousTracking: 'anonymousTrackingTrue',
      withServerAnonymisation: true,
      withSessionTracking: false,

      stateStorageStrategy: 'cookieAndLocalStorage',
      cookieDomain: 'auto',
      cookieName: 'sp',
      cookieLifetime: 'custom',
      customCookieLifetime: '123',
      cookieSameSite: 'Lax',
      cookieSecure: true,
      sessionCookieTimeout: '1800',
      maxLocalStorageQueueSize: '123',

      eventMethod: 'post',
      encodeBase64: false,
      bufferSize: '123',
      postPath: 'postPath',
      maxPostBytes: '123',
      resetActivityTrackingOnPageView: true,
      connectionTimeout: '500',

      webPage: true,
      performanceTiming: false,
      gaCookies: false,
      clientHints: false,
      geolocation: false,
      session: false,
    };

    const expected = {
      type: 'snowplow',
      appId: mockData.appId,
      platform: mockData.customPlatform,
      respectDoNotTrack: mockData.respectDoNotTrack,
      stateStorageStrategy: mockData.stateStorageStrategy,
      cookieDomain: false,
      discoverRootDomain: true,
      cookieName: mockData.cookieName,
      cookieLifetime: mockData.customCookieLifetime,
      cookieSameSite: 'Lax',
      cookieSecure: mockData.cookieSecure,
      sessionCookieTimeout: mockData.sessionCookieTimeout,
      maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,
      eventMethod: mockData.eventMethod,
      encodeBase64: mockData.encodeBase64,
      bufferSize: mockData.bufferSize,
      postPath: mockData.postPath,
      maxPostBytes: mockData.maxPostBytes,
      connectionTimeout: mockData.connectionTimeout,
      anonymousTracking: {
        withServerAnonymisation: mockData.withServerAnonymisation,
        withSessionTracking: mockData.withSessionTracking,
      },
      contexts: {
        webPage: mockData.webPage,
        performanceTiming: mockData.performanceTiming,
        gaCookies: mockData.gaCookies,
        geolocation: mockData.geolocation,
        clientHints: mockData.clientHints,
        session: mockData.session,
      },
      trackerOptions: {
        trackerName: mockData.trackerName,
        collectorEndpoint: mockData.collectorEndpoint,
        libUrl:
          'https://unpkg.com/@snowplow/javascript-tracker@' +
          mockData.version +
          '/dist/sp.js',
      },
    };

    // Call runCode to run the template's code.
    const variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(expected);
- name: Test anonymous tracking false
  code: |
    const mockData = {
      trackerName: 'spTracker',
      collectorEndpoint: 'test',

      spLibrary: 'jsDelivr',
      version: '3.5.0',

      appId: 'my-site',
      platform: 'web',

      respectDoNotTrack: true,
      anonymousTracking: 'anonymousTrackingFalse',

      stateStorageStrategy: 'cookieAndLocalStorage',
      cookieDomain: 'auto',
      cookieName: 'sp',
      cookieLifetime: 63072000,
      cookieSameSite: 'Lax',
      sessionCookieTimeout: '1800',
      cookieSecure: true,
      maxLocalStorageQueueSize: '1000',

      eventMethod: 'post',
      postPath: '/com.snowplowanalytics.snowplow/tp2',
      bufferSize: '1',
      encodeBase64: true,
      maxPostBytes: '40000',
      connectionTimeout: '5000',

      webPage: true,
      gaCookies: false,
      clientHints: false,
      performanceTiming: false,
      geolocation: false,
      session: true,
    };

    const expected = {
      type: 'snowplow',
      appId: mockData.appId,
      platform: mockData.platform,
      respectDoNotTrack: mockData.respectDoNotTrack,
      stateStorageStrategy: mockData.stateStorageStrategy,
      cookieDomain: false,
      discoverRootDomain: true,
      cookieName: mockData.cookieName,
      cookieLifetime: mockData.cookieLifetime,
      cookieSameSite: 'Lax',
      cookieSecure: mockData.cookieSecure,
      sessionCookieTimeout: mockData.sessionCookieTimeout,
      maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,
      eventMethod: mockData.eventMethod,
      encodeBase64: mockData.encodeBase64,
      bufferSize: mockData.bufferSize,
      postPath: mockData.postPath,
      maxPostBytes: mockData.maxPostBytes,
      connectionTimeout: mockData.connectionTimeout,
      anonymousTracking: false,
      contexts: {
        webPage: mockData.webPage,
        performanceTiming: mockData.performanceTiming,
        gaCookies: mockData.gaCookies,
        geolocation: mockData.geolocation,
        clientHints: mockData.clientHints,
        session: mockData.session,
      },
      trackerOptions: {
        trackerName: mockData.trackerName,
        collectorEndpoint: mockData.collectorEndpoint,
        libUrl:
          'https://cdn.jsdelivr.net/npm/@snowplow/javascript-tracker@' +
          mockData.version +
          '/dist/sp.min.js',
      },
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(expected);
- name: Test anonymous tracking from variable
  code: |
    const myConsentVar = {
      withServerAnonymisation: true,
      withSessionTracking: true,
    };

    const mockData = {
      trackerName: 'spTracker',
      collectorEndpoint: 'test',

      spLibrary: 'selfHosted',
      selfHostedUrl: 'https://foo.bar/sp.js',

      appId: 'my-site',
      platform: 'web',

      respectDoNotTrack: true,
      anonymousTracking: myConsentVar,

      stateStorageStrategy: 'cookieAndLocalStorage',
      cookieDomain: 'auto',
      cookieName: 'sp',
      cookieLifetime: 63072000,
      cookieSameSite: 'Lax',
      sessionCookieTimeout: '1800',
      cookieSecure: true,
      maxLocalStorageQueueSize: '1000',

      eventMethod: 'post',
      postPath: '/com.snowplowanalytics.snowplow/tp2',
      bufferSize: '1',
      encodeBase64: true,
      maxPostBytes: '40000',
      connectionTimeout: '5000',

      webPage: true,
      gaCookies: false,
      clientHints: false,
      performanceTiming: false,
      geolocation: false,
      session: false,
    };

    const expected = {
      type: 'snowplow',
      appId: mockData.appId,
      platform: mockData.platform,
      respectDoNotTrack: mockData.respectDoNotTrack,
      stateStorageStrategy: mockData.stateStorageStrategy,
      cookieDomain: false,
      discoverRootDomain: true,
      cookieName: mockData.cookieName,
      cookieLifetime: mockData.cookieLifetime,
      cookieSameSite: 'Lax',
      cookieSecure: mockData.cookieSecure,
      sessionCookieTimeout: mockData.sessionCookieTimeout,
      maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,
      eventMethod: mockData.eventMethod,
      encodeBase64: mockData.encodeBase64,
      bufferSize: mockData.bufferSize,
      postPath: mockData.postPath,
      maxPostBytes: mockData.maxPostBytes,
      connectionTimeout: mockData.connectionTimeout,
      anonymousTracking: myConsentVar,
      contexts: {
        webPage: mockData.webPage,
        performanceTiming: mockData.performanceTiming,
        gaCookies: mockData.gaCookies,
        geolocation: mockData.geolocation,
        clientHints: mockData.clientHints,
        session: mockData.session,
      },
      trackerOptions: {
        trackerName: mockData.trackerName,
        collectorEndpoint: mockData.collectorEndpoint,
        libUrl: mockData.selfHostedUrl,
      },
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);
    assertThat(variableResult).isEqualTo(expected);
- name: Test anonymous tracking true - options true
  code: |
    const mockData = {
      trackerName: 'spTracker',
      collectorEndpoint: 'test',

      spLibrary: 'jsDelivr',
      version: '3.5.0',

      appId: 'my-site',
      platform: 'web',

      respectDoNotTrack: true,
      anonymousTracking: 'anonymousTrackingTrue',
      withSessionTracking: true,
      withServerAnonymisation: true,

      stateStorageStrategy: 'cookieAndLocalStorage',
      cookieDomain: 'auto',
      cookieName: 'sp',
      cookieLifetime: 63072000,
      cookieSameSite: 'Lax',
      sessionCookieTimeout: '1800',
      cookieSecure: true,
      maxLocalStorageQueueSize: '1000',

      eventMethod: 'post',
      postPath: '/com.snowplowanalytics.snowplow/tp2',
      bufferSize: '1',
      encodeBase64: true,
      maxPostBytes: '40000',
      connectionTimeout: '5000',

      webPage: true,
      gaCookies: false,
      clientHints: false,
      performanceTiming: false,
      geolocation: false,
      session: false,
    };

    const expected = {
      type: 'snowplow',
      appId: mockData.appId,
      platform: mockData.platform,
      respectDoNotTrack: mockData.respectDoNotTrack,
      stateStorageStrategy: mockData.stateStorageStrategy,
      cookieDomain: false,
      discoverRootDomain: true,
      cookieName: mockData.cookieName,
      cookieLifetime: mockData.cookieLifetime,
      cookieSameSite: 'Lax',
      cookieSecure: mockData.cookieSecure,
      sessionCookieTimeout: mockData.sessionCookieTimeout,
      maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,
      eventMethod: mockData.eventMethod,
      encodeBase64: mockData.encodeBase64,
      bufferSize: mockData.bufferSize,
      postPath: mockData.postPath,
      maxPostBytes: mockData.maxPostBytes,
      connectionTimeout: mockData.connectionTimeout,
      anonymousTracking: {
        withSessionTracking: true,
        withServerAnonymisation: true,
      },
      contexts: {
        webPage: mockData.webPage,
        performanceTiming: mockData.performanceTiming,
        gaCookies: mockData.gaCookies,
        geolocation: mockData.geolocation,
        clientHints: mockData.clientHints,
        session: mockData.session,
      },
      trackerOptions: {
        trackerName: mockData.trackerName,
        collectorEndpoint: mockData.collectorEndpoint,
        libUrl:
          'https://cdn.jsdelivr.net/npm/@snowplow/javascript-tracker@' +
          mockData.version +
          '/dist/sp.min.js',
      },
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(expected);
- name: Test anonymous tracking true - options false
  code: |
    const mockData = {
      trackerName: 'spTracker',
      collectorEndpoint: 'test',

      spLibrary: 'jsDelivr',
      version: '3.5.0',

      appId: 'my-site',
      platform: 'web',

      respectDoNotTrack: true,
      anonymousTracking: 'anonymousTrackingTrue',
      withSessionTracking: false,
      withServerAnonymisation: false,

      stateStorageStrategy: 'cookieAndLocalStorage',
      cookieDomain: 'auto',
      cookieName: 'sp',
      cookieLifetime: 63072000,
      cookieSameSite: 'Lax',
      sessionCookieTimeout: '1800',
      cookieSecure: true,
      maxLocalStorageQueueSize: '1000',

      eventMethod: 'post',
      postPath: '/com.snowplowanalytics.snowplow/tp2',
      bufferSize: '1',
      encodeBase64: true,
      maxPostBytes: '40000',
      connectionTimeout: '5000',

      webPage: true,
      gaCookies: false,
      clientHints: false,
      performanceTiming: false,
      geolocation: false,
      session: false,
    };

    const expected = {
      type: 'snowplow',
      appId: mockData.appId,
      platform: mockData.platform,
      respectDoNotTrack: mockData.respectDoNotTrack,
      stateStorageStrategy: mockData.stateStorageStrategy,
      cookieDomain: false,
      discoverRootDomain: true,
      cookieName: mockData.cookieName,
      cookieLifetime: mockData.cookieLifetime,
      cookieSameSite: 'Lax',
      cookieSecure: mockData.cookieSecure,
      sessionCookieTimeout: mockData.sessionCookieTimeout,
      maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,
      eventMethod: mockData.eventMethod,
      encodeBase64: mockData.encodeBase64,
      bufferSize: mockData.bufferSize,
      postPath: mockData.postPath,
      maxPostBytes: mockData.maxPostBytes,
      connectionTimeout: mockData.connectionTimeout,
      anonymousTracking: {
        withSessionTracking: false,
        withServerAnonymisation: false,
      },
      contexts: {
        webPage: mockData.webPage,
        performanceTiming: mockData.performanceTiming,
        gaCookies: mockData.gaCookies,
        geolocation: mockData.geolocation,
        clientHints: mockData.clientHints,
        session: mockData.session,
      },
      trackerOptions: {
        trackerName: mockData.trackerName,
        collectorEndpoint: mockData.collectorEndpoint,
        libUrl:
          'https://cdn.jsdelivr.net/npm/@snowplow/javascript-tracker@' +
          mockData.version +
          '/dist/sp.min.js',
      },
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(expected);
setup: ''


___NOTES___

Created on 16/08/2019, 09:46:59
