___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Snowplow v4 Settings",
  "description": "The Snowplow v4 Settings variable can be used to easily apply a set of tracker configuration parameters to tags created with the Snowplow v4 tag template.",
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
                  "^4\\..+$"
                ],
                "errorMessage": "The sp.js library version number must be greater or equal to 4 (e.g. 4.0.2)"
              }
            ],
            "valueHint": "4.0.2"
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
        ],
        "defaultValue": "web",
        "help": "Platform the tracker runs on. (Default: Web)"
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
            "displayValue": "False",
            "value": false
          },
          {
            "value": true,
            "displayValue": "True"
          }
        ],
        "displayName": "Respect \"Do Not Track\"",
        "simpleValueType": true,
        "name": "respectDoNotTrack",
        "type": "SELECT",
        "defaultValue": false,
        "help": "Whether to respect browser DNT. (Default: False)"
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
        "help": "Please read \u003ca href\u003d\"https://docs.snowplow.io/docs/collecting-data/collecting-from-own-applications/javascript-trackers/javascript-tracker/javascript-tracker-v3/tracker-setup/initialization-options/#anonymous-tracking\"\u003ethis documentation\u003c/a\u003e carefully before selecting Anonymous Tracking in order to understand the implications. (Default: False)"
      },
      {
        "type": "TEXT",
        "name": "idService",
        "displayName": "Cookie Extension Service",
        "simpleValueType": true,
        "help": "Sets the \u003ca href\u003d\"https://docs.snowplow.io/docs/sources/trackers/javascript-trackers/web-tracker/browsers/#what-is-a-cookie-extension-service\"\u003eCookie Extension Service\u003c/a\u003e endpoint."
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
        "defaultValue": "cookieAndLocalStorage",
        "help": "This option sets the state storage strategy. (Default: Cookie and Local Storage)"
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
        ],
        "defaultValue": 63072000,
        "help": "This option sets the cookie expiration. (Default: 2 years)"
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
        "defaultValue": "Lax",
        "help": "This option sets the cookie samesite attribute. (Default: Lax)"
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
        ],
        "defaultValue": true,
        "help": "This option sets the cookie secure attribute. (Default: True)"
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
      },
      {
        "type": "SELECT",
        "name": "synchronousCookieWrite",
        "displayName": "Synchronously Write Cookies",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": false,
            "displayValue": "False"
          },
          {
            "value": true,
            "displayValue": "True"
          }
        ],
        "simpleValueType": true,
        "help": "Controls whether cookies are \u003ca href\u003d\"https://docs.snowplow.io/docs/sources/trackers/javascript-trackers/web-tracker/configuring-how-events-sent/#synchronous-cookie-writes\"\u003ewritten synchronously\u003c/a\u003e. (Default: False)",
        "defaultValue": false
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
        "type": "SELECT",
        "help": "Whether to base64 encode event data. If unset, the tracker automatically uses false for POST requests and true for GET requests. Only set explicitly if you need to override this automatic behavior.",
        "notSetText": "Auto"
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
      },
      {
        "type": "SELECT",
        "name": "keepalive",
        "displayName": "Enable keepalive",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": false,
            "displayValue": "False"
          },
          {
            "value": true,
            "displayValue": "True"
          }
        ],
        "simpleValueType": true,
        "help": "The \u003ca href\u003d\"https://docs.snowplow.io/docs/sources/trackers/javascript-trackers/web-tracker/configuring-how-events-sent/#keepalive-option-for-collector-requests\"\u003ekeepalive\u003c/a\u003e feature in the fetch API indicates that the request should be allowed to outlive the webpage that initiated it. It enables requests to the Snowplow Collector to complete even if the page is closed or navigated away from. (Default: False)",
        "defaultValue": false
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
        "help": "Adds client session context entity to events, provided that anonymous tracking is disabled.",
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "performanceNavigationTiming",
        "checkboxText": "performanceNavigationTiming",
        "simpleValueType": true,
        "help": "Attach a context entity with metrics regarding the browser\u0027s document navigation events."
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
  keepalive: data.keepalive,
  synchronousCookieWrite: data.synchronousCookieWrite,
  idService: data.idService,
  cookieExtensionService: data.idService,
  contexts: {
    webPage: data.webPage,
    gaCookies: data.gaCookies,
    clientHints: data.clientHints,
    geolocation: data.geolocation,
    session: data.session,
    performanceNavigationTiming: data.performanceNavigationTiming,
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
  code: "const mockData = {\n  trackerName: 'snowTracker',\n  collectorEndpoint: 'https://www.test.com',\n\
    \n  spLibrary: 'unpkg',\n  version: '4.0.1',\n\n  appId: 'app-id',\n  platform:\
    \ 'custom',\n  customPlatform: 'testPlatform',\n\n  respectDoNotTrack: false,\n\
    \  anonymousTracking: 'anonymousTrackingTrue',\n  idService: \"https://example.com\"\
    ,\n  cookieExtensionService: \"https://example.com\",\n  withServerAnonymisation:\
    \ true,\n  withSessionTracking: false,\n\n  stateStorageStrategy: 'cookieAndLocalStorage',\n\
    \  cookieDomain: 'auto',\n  cookieName: 'sp',\n  cookieLifetime: 'custom',\n \
    \ customCookieLifetime: '123',\n  cookieSameSite: 'Lax',\n  cookieSecure: true,\n\
    \  sessionCookieTimeout: '1800',\n  maxLocalStorageQueueSize: '123',\n  synchronousCookieWrite:\
    \ false,\n\n  eventMethod: 'post',\n  encodeBase64: false,\n  bufferSize: '123',\n\
    \  postPath: 'postPath',\n  maxPostBytes: '123',\n  resetActivityTrackingOnPageView:\
    \ true,\n  connectionTimeout: '500',\n  keepalive: false,\n  \n  webPage: true,\n\
    \  gaCookies: false,\n  clientHints: false,\n  geolocation: false,\n  session:\
    \ false,\n  performanceNavigationTiming: false,\n};\n\nconst expected = {\n  type:\
    \ 'snowplow',\n  appId: mockData.appId,\n  platform: mockData.customPlatform,\n\
    \  respectDoNotTrack: mockData.respectDoNotTrack,\n  stateStorageStrategy: mockData.stateStorageStrategy,\n\
    \  cookieDomain: false,\n  discoverRootDomain: true,\n  cookieName: mockData.cookieName,\n\
    \  cookieLifetime: mockData.customCookieLifetime,\n  cookieSameSite: 'Lax',\n\
    \  cookieSecure: mockData.cookieSecure,\n  sessionCookieTimeout: mockData.sessionCookieTimeout,\n\
    \  maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,\n  eventMethod:\
    \ mockData.eventMethod,\n  encodeBase64: mockData.encodeBase64,\n  bufferSize:\
    \ mockData.bufferSize,\n  postPath: mockData.postPath,\n  maxPostBytes: mockData.maxPostBytes,\n\
    \  connectionTimeout: mockData.connectionTimeout,\n  keepalive: mockData.keepalive,\n\
    \  synchronousCookieWrite: mockData.synchronousCookieWrite,\n  idService: mockData.idService,\n\
    \  cookieExtensionService: mockData.cookieExtensionService,\n  anonymousTracking:\
    \ {\n    withServerAnonymisation: mockData.withServerAnonymisation,\n    withSessionTracking:\
    \ mockData.withSessionTracking,\n  },\n  contexts: {\n    webPage: mockData.webPage,\n\
    \    gaCookies: mockData.gaCookies,\n    geolocation: mockData.geolocation,\n\
    \    clientHints: mockData.clientHints,\n    session: mockData.session,\n    performanceNavigationTiming:\
    \ mockData.performanceNavigationTiming,\n  },\n  trackerOptions: {\n    trackerName:\
    \ mockData.trackerName,\n    collectorEndpoint: mockData.collectorEndpoint,\n\
    \    libUrl:\n      'https://unpkg.com/@snowplow/javascript-tracker@' +\n    \
    \  mockData.version +\n      '/dist/sp.js',\n  },\n};\n\n// Call runCode to run\
    \ the template's code.\nconst variableResult = runCode(mockData);\n\n// Verify\
    \ that the variable returns a result.\nassertThat(variableResult).isEqualTo(expected);\n"
- name: Test anonymous tracking false
  code: |
    const mockData = {
      trackerName: 'spTracker',
      collectorEndpoint: 'test',

      spLibrary: 'jsDelivr',
      version: '4.0.1',

      appId: 'my-site',
      platform: 'web',

      respectDoNotTrack: true,
      anonymousTracking: 'anonymousTrackingFalse',
      idService: "https://example.com",
      cookieExtensionService: "https://example.com",

      stateStorageStrategy: 'cookieAndLocalStorage',
      cookieDomain: 'auto',
      cookieName: 'sp',
      cookieLifetime: 63072000,
      cookieSameSite: 'Lax',
      sessionCookieTimeout: '1800',
      cookieSecure: true,
      maxLocalStorageQueueSize: '1000',
      synchronousCookieWrite: false,

      eventMethod: 'post',
      postPath: '/com.snowplowanalytics.snowplow/tp2',
      bufferSize: '1',
      encodeBase64: true,
      maxPostBytes: '40000',
      connectionTimeout: '5000',
      keepalive: false,

      webPage: true,
      gaCookies: false,
      clientHints: false,
      geolocation: false,
      session: true,
      performanceNavigationTiming: false,
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
      keepalive: mockData.keepalive,
      synchronousCookieWrite: mockData.synchronousCookieWrite,
      idService: mockData.idService,
      cookieExtensionService: mockData.cookieExtensionService,
      contexts: {
        webPage: mockData.webPage,
        gaCookies: mockData.gaCookies,
        geolocation: mockData.geolocation,
        clientHints: mockData.clientHints,
        session: mockData.session,
        performanceNavigationTiming: mockData.performanceNavigationTiming,
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
  code: "const myConsentVar = {\n  withServerAnonymisation: true,\n  withSessionTracking:\
    \ true,\n};\n\nconst mockData = {\n  trackerName: 'spTracker',\n  collectorEndpoint:\
    \ 'test',\n\n  spLibrary: 'selfHosted',\n  selfHostedUrl: 'https://foo.bar/sp.js',\n\
    \n  appId: 'my-site',\n  platform: 'web',\n\n  respectDoNotTrack: true,\n  anonymousTracking:\
    \ myConsentVar,\n  idService: \"https://example.com\",\n  cookieExtensionService:\
    \ \"https://example.com\",\n\n  stateStorageStrategy: 'cookieAndLocalStorage',\n\
    \  cookieDomain: 'auto',\n  cookieName: 'sp',\n  cookieLifetime: 63072000,\n \
    \ cookieSameSite: 'Lax',\n  sessionCookieTimeout: '1800',\n  cookieSecure: true,\n\
    \  maxLocalStorageQueueSize: '1000',\n  synchronousCookieWrite: false,\n  \n \
    \ eventMethod: 'post',\n  postPath: '/com.snowplowanalytics.snowplow/tp2',\n \
    \ bufferSize: '1',\n  encodeBase64: true,\n  maxPostBytes: '40000',\n  connectionTimeout:\
    \ '5000',\n  keepalive: false,\n  \n  webPage: true,\n  gaCookies: false,\n  clientHints:\
    \ false,\n  geolocation: false,\n  session: false,\n};\n\nconst expected = {\n\
    \  type: 'snowplow',\n  appId: mockData.appId,\n  platform: mockData.platform,\n\
    \  respectDoNotTrack: mockData.respectDoNotTrack,\n  stateStorageStrategy: mockData.stateStorageStrategy,\n\
    \  cookieDomain: false,\n  discoverRootDomain: true,\n  cookieName: mockData.cookieName,\n\
    \  cookieLifetime: mockData.cookieLifetime,\n  cookieSameSite: 'Lax',\n  cookieSecure:\
    \ mockData.cookieSecure,\n  sessionCookieTimeout: mockData.sessionCookieTimeout,\n\
    \  maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,\n  eventMethod:\
    \ mockData.eventMethod,\n  encodeBase64: mockData.encodeBase64,\n  bufferSize:\
    \ mockData.bufferSize,\n  postPath: mockData.postPath,\n  maxPostBytes: mockData.maxPostBytes,\n\
    \  connectionTimeout: mockData.connectionTimeout,\n  anonymousTracking: myConsentVar,\n\
    \  keepalive: mockData.keepalive,\n  synchronousCookieWrite: mockData.synchronousCookieWrite,\n\
    \  idService: mockData.idService,\n  cookieExtensionService: mockData.cookieExtensionService,\n\
    \  contexts: {\n    webPage: mockData.webPage,\n    gaCookies: mockData.gaCookies,\n\
    \    geolocation: mockData.geolocation,\n    clientHints: mockData.clientHints,\n\
    \    session: mockData.session,\n    performanceNavigationTiming: mockData.performanceNavigationTiming,\n\
    \  },\n  trackerOptions: {\n    trackerName: mockData.trackerName,\n    collectorEndpoint:\
    \ mockData.collectorEndpoint,\n    libUrl: mockData.selfHostedUrl,\n  },\n};\n\
    \n// Call runCode to run the template's code.\nlet variableResult = runCode(mockData);\n\
    assertThat(variableResult).isEqualTo(expected);\n"
- name: Test anonymous tracking true - options true
  code: "const mockData = {\n  trackerName: 'spTracker',\n  collectorEndpoint: 'test',\n\
    \n  spLibrary: 'jsDelivr',\n  version: '4.0.1',\n\n  appId: 'my-site',\n  platform:\
    \ 'web',\n\n  respectDoNotTrack: true,\n  anonymousTracking: 'anonymousTrackingTrue',\n\
    \  idService: \"https://example.com\",\n  cookieExtensionService: \"https://example.com\"\
    ,\n  withSessionTracking: true,\n  withServerAnonymisation: true,\n\n  stateStorageStrategy:\
    \ 'cookieAndLocalStorage',\n  cookieDomain: 'auto',\n  cookieName: 'sp',\n  cookieLifetime:\
    \ 63072000,\n  cookieSameSite: 'Lax',\n  sessionCookieTimeout: '1800',\n  cookieSecure:\
    \ true,\n  maxLocalStorageQueueSize: '1000',\n  synchronousCookieWrite: false,\n\
    \n  eventMethod: 'post',\n  postPath: '/com.snowplowanalytics.snowplow/tp2',\n\
    \  bufferSize: '1',\n  encodeBase64: true,\n  maxPostBytes: '40000',\n  connectionTimeout:\
    \ '5000',\n  keepalive: false,\n  \n  webPage: true,\n  gaCookies: false,\n  clientHints:\
    \ false,\n  geolocation: false,\n  session: false,\n};\n\nconst expected = {\n\
    \  type: 'snowplow',\n  appId: mockData.appId,\n  platform: mockData.platform,\n\
    \  respectDoNotTrack: mockData.respectDoNotTrack,\n  stateStorageStrategy: mockData.stateStorageStrategy,\n\
    \  cookieDomain: false,\n  discoverRootDomain: true,\n  cookieName: mockData.cookieName,\n\
    \  cookieLifetime: mockData.cookieLifetime,\n  cookieSameSite: 'Lax',\n  cookieSecure:\
    \ mockData.cookieSecure,\n  sessionCookieTimeout: mockData.sessionCookieTimeout,\n\
    \  maxLocalStorageQueueSize: mockData.maxLocalStorageQueueSize,\n  eventMethod:\
    \ mockData.eventMethod,\n  encodeBase64: mockData.encodeBase64,\n  bufferSize:\
    \ mockData.bufferSize,\n  postPath: mockData.postPath,\n  maxPostBytes: mockData.maxPostBytes,\n\
    \  connectionTimeout: mockData.connectionTimeout,\n  keepalive: mockData.keepalive,\n\
    \  synchronousCookieWrite: mockData.synchronousCookieWrite,\n  idService: mockData.idService,\n\
    \  cookieExtensionService: mockData.cookieExtensionService,\n  anonymousTracking:\
    \ {\n    withSessionTracking: true,\n    withServerAnonymisation: true,\n  },\n\
    \  contexts: {\n    webPage: mockData.webPage,\n    gaCookies: mockData.gaCookies,\n\
    \    geolocation: mockData.geolocation,\n    clientHints: mockData.clientHints,\n\
    \    session: mockData.session,\n    performanceNavigationTiming: mockData.performanceNavigationTiming,\n\
    \  },\n  trackerOptions: {\n    trackerName: mockData.trackerName,\n    collectorEndpoint:\
    \ mockData.collectorEndpoint,\n    libUrl:\n      'https://cdn.jsdelivr.net/npm/@snowplow/javascript-tracker@'\
    \ +\n      mockData.version +\n      '/dist/sp.min.js',\n  },\n};\n\n// Call runCode\
    \ to run the template's code.\nlet variableResult = runCode(mockData);\n\n// Verify\
    \ that the variable returns a result.\nassertThat(variableResult).isEqualTo(expected);\n"
- name: Test anonymous tracking true - options false
  code: "const mockData = {\n  trackerName: 'spTracker',\n  collectorEndpoint: 'test',\n\
    \n  spLibrary: 'jsDelivr',\n  version: '4.0.1',\n\n  appId: 'my-site',\n  platform:\
    \ 'web',\n\n  respectDoNotTrack: true,\n  anonymousTracking: 'anonymousTrackingTrue',\n\
    \  idService: \"https://example.com\",\n  cookieExtensionService: \"https://example.com\"\
    ,\n  withSessionTracking: false,\n  withServerAnonymisation: false,\n\n  stateStorageStrategy:\
    \ 'cookieAndLocalStorage',\n  cookieDomain: 'auto',\n  cookieName: 'sp',\n  cookieLifetime:\
    \ 63072000,\n  cookieSameSite: 'Lax',\n  sessionCookieTimeout: '1800',\n  cookieSecure:\
    \ true,\n  maxLocalStorageQueueSize: '1000',\n  synchronousCookieWrite: false,\n\
    \  \n  eventMethod: 'post',\n  postPath: '/com.snowplowanalytics.snowplow/tp2',\n\
    \  bufferSize: '1',\n  encodeBase64: true,\n  maxPostBytes: '40000',\n  connectionTimeout:\
    \ '5000',\n  keepalive: false,\n\n  webPage: true,\n  gaCookies: false,\n  clientHints:\
    \ false,\n  geolocation: false,\n  session: false,\n  performanceNavigationTiming:\
    \ false,\n};\n\nconst expected = {\n  type: 'snowplow',\n  appId: mockData.appId,\n\
    \  platform: mockData.platform,\n  respectDoNotTrack: mockData.respectDoNotTrack,\n\
    \  stateStorageStrategy: mockData.stateStorageStrategy,\n  cookieDomain: false,\n\
    \  discoverRootDomain: true,\n  cookieName: mockData.cookieName,\n  cookieLifetime:\
    \ mockData.cookieLifetime,\n  cookieSameSite: 'Lax',\n  cookieSecure: mockData.cookieSecure,\n\
    \  sessionCookieTimeout: mockData.sessionCookieTimeout,\n  maxLocalStorageQueueSize:\
    \ mockData.maxLocalStorageQueueSize,\n  eventMethod: mockData.eventMethod,\n \
    \ encodeBase64: mockData.encodeBase64,\n  bufferSize: mockData.bufferSize,\n \
    \ postPath: mockData.postPath,\n  maxPostBytes: mockData.maxPostBytes,\n  connectionTimeout:\
    \ mockData.connectionTimeout,\n  keepalive: mockData.keepalive,\n  synchronousCookieWrite:\
    \ mockData.synchronousCookieWrite,\n  idService: mockData.idService,\n  cookieExtensionService:\
    \ mockData.cookieExtensionService,\n  anonymousTracking: {\n    withSessionTracking:\
    \ false,\n    withServerAnonymisation: false,\n  },\n  contexts: {\n    webPage:\
    \ mockData.webPage,\n    gaCookies: mockData.gaCookies,\n    geolocation: mockData.geolocation,\n\
    \    clientHints: mockData.clientHints,\n    session: mockData.session,\n    performanceNavigationTiming:\
    \ mockData.performanceNavigationTiming,\n  },\n  trackerOptions: {\n    trackerName:\
    \ mockData.trackerName,\n    collectorEndpoint: mockData.collectorEndpoint,\n\
    \    libUrl:\n      'https://cdn.jsdelivr.net/npm/@snowplow/javascript-tracker@'\
    \ +\n      mockData.version +\n      '/dist/sp.min.js',\n  },\n};\n\n// Call runCode\
    \ to run the template's code.\nlet variableResult = runCode(mockData);\n\n// Verify\
    \ that the variable returns a result.\nassertThat(variableResult).isEqualTo(expected);\n"
- name: Test that undefined values pass through correctly
  code: |-
    const mockData = {
      trackerName: 'minimalTracker',
      collectorEndpoint: 'https://collector.example.com',
      spLibrary: 'jsDelivr',
      version: '4.0.1',
      appId: 'minimal-app',
      // Omit fields
      // platform
      // respectDoNotTrack
      // cookieLifetime
      // cookieSecure
      // synchronousCookieWrite
      // encodeBase64
      // keepalive
      stateStorageStrategy: 'cookieAndLocalStorage',
      cookieDomain: 'example.com',
      cookieName: 'test',
      cookieSameSite: 'Lax',
      sessionCookieTimeout: '1800',
      maxLocalStorageQueueSize: '1000',
      eventMethod: 'post',
      bufferSize: '1',
      postPath: '/tp2',
      maxPostBytes: '40000',
      connectionTimeout: '5000',
      anonymousTracking: 'anonymousTrackingFalse',
      webPage: true,
      gaCookies: false,
      clientHints: false,
      geolocation: false,
      session: false,
      performanceNavigationTiming: false,
    };

    const variableResult = runCode(mockData);

    // Verify undefined values pass through
    assertThat(variableResult.platform).isUndefined();
    assertThat(variableResult.respectDoNotTrack).isUndefined();
    assertThat(variableResult.cookieLifetime).isUndefined();
    assertThat(variableResult.cookieSecure).isUndefined();
    assertThat(variableResult.synchronousCookieWrite).isUndefined();
    assertThat(variableResult.encodeBase64).isUndefined();
    assertThat(variableResult.keepalive).isUndefined();

    // Verify other fields work correctly
    assertThat(variableResult.appId).isEqualTo('minimal-app');
    assertThat(variableResult.stateStorageStrategy).isEqualTo('cookieAndLocalStorage');
    assertThat(variableResult.cookieSameSite).isEqualTo('Lax');
setup: ''


___NOTES___

Created on 16/08/2019, 09:46:59


