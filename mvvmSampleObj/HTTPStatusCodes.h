//
//  HTTPStatusCodes.h
//  mvvmSampleObj
//
//  Created by Saurabh Verma on 16/03/2017.
//  Copyright © 2017 Outware. All rights reserved.
//

#ifndef HTTPStatusCodes_h
#define HTTPStatusCodes_h

typedef NS_ENUM(NSInteger, HTTPCodesNo) {
    // Informational
    HTTPCodesNo1XXInformationalUnknown = 1,
    HTTPCodesNo100Continue = 100,
    HTTPCodesNo101SwitchingProtocols = 101,
    HTTPCodesNo102Processing = 102,

    // Success
    HTTPCodesNo2XXSuccessUnknown = 2,
    HTTPCodesNo200OK = 200,
    HTTPCodesNo201Created = 201,
    HTTPCodesNo202Accepted = 202,
    HTTPCodesNo203NonAuthoritativeInformation = 203,
    HTTPCodesNo204NoContent = 204,
    HTTPCodesNo205ResetContent = 205,
    HTTPCodesNo206PartialContent = 206,
    HTTPCodesNo207MultiStatus = 207,
    HTTPCodesNo208AlreadyReported = 208,
    HTTPCodesNo209IMUsed = 209,

    // Redirection
    HTTPCodesNo3XXSuccessUnknown = 3,
    HTTPCodesNo300MultipleChoices = 300,
    HTTPCodesNo301MovedPermanently = 301,
    HTTPCodesNo302Found = 302,
    HTTPCodesNo303SeeOther = 303,
    HTTPCodesNo304NotModified = 304,
    HTTPCodesNo305UseProxy = 305,
    HTTPCodesNo306SwitchProxy = 306,
    HTTPCodesNo307TemporaryRedirect = 307,
    HTTPCodesNo308PermanentRedirect = 308,

    // Client error
    HTTPCodesNo4XXSuccessUnknown = 4,
    HTTPCodesNo400BadRequest = 400,
    HTTPCodesNo401Unauthorised = 401,
    HTTPCodesNo402PaymentRequired = 402,
    HTTPCodesNo403Forbidden = 403,
    HTTPCodesNo404NotFound = 404,
    HTTPCodesNo405MethodNotAllowed = 405,
    HTTPCodesNo406NotAcceptable = 406,
    HTTPCodesNo407ProxyAuthenticationRequired = 407,
    HTTPCodesNo408RequestTimeout = 408,
    HTTPCodesNo409Conflict = 409,
    HTTPCodesNo410Gone = 410,
    HTTPCodesNo411LengthRequired = 411,
    HTTPCodesNo412PreconditionFailed = 412,
    HTTPCodesNo413RequestEntityTooLarge = 413,
    HTTPCodesNo414RequestURITooLong = 414,
    HTTPCodesNo415UnsupportedMediaType = 415,
    HTTPCodesNo416RequestedRangeNotSatisfiable = 416,
    HTTPCodesNo417ExpectationFailed = 417,
    HTTPCodesNo418IamATeapot = 418,
    HTTPCodesNo419AuthenticationTimeout = 419,
    HTTPCodesNo420MethodFailureSpringFramework = 420,
    HTTPCodesNo420EnhanceYourCalmTwitter = 4200,
    HTTPCodesNo422UnprocessableEntity = 422,
    HTTPCodesNo423Locked = 423,
    HTTPCodesNo424FailedDependency = 424,
    HTTPCodesNo424MethodFailureWebDaw = 4240,
    HTTPCodesNo425UnorderedCollection = 425,
    HTTPCodesNo426UpgradeRequired = 426,
    HTTPCodesNo428PreconditionRequired = 428,
    HTTPCodesNo429TooManyRequests = 429,
    HTTPCodesNo431RequestHeaderFieldsTooLarge = 431,
    HTTPCodesNo444NoResponseNginx = 444,
    HTTPCodesNo449RetryWithMicrosoft = 449,
    HTTPCodesNo450BlockedByWindowsParentalControls = 450,
    HTTPCodesNo451RedirectMicrosoft = 451,
    HTTPCodesNo451UnavailableForLegalReasons = 4510,
    HTTPCodesNo494RequestHeaderTooLargeNginx = 494,
    HTTPCodesNo495CertErrorNginx = 495,
    HTTPCodesNo496NoCertNginx = 496,
    HTTPCodesNo497HTTPToHTTPSNginx = 497,
    HTTPCodesNo499ClientClosedRequestNginx = 499,


    // Server error
    HTTPCodesNo5XXSuccessUnknown = 5,
    HTTPCodesNo500InternalServerError = 500,
    HTTPCodesNo501NotImplemented = 501,
    HTTPCodesNo502BadGateway = 502,
    HTTPCodesNo503ServiceUnavailable = 503,
    HTTPCodesNo504GatewayTimeout = 504,
    HTTPCodesNo505HTTPVersionNotSupported = 505,
    HTTPCodesNo506VariantAlsoNegotiates = 506,
    HTTPCodesNo507InsufficientStorage = 507,
    HTTPCodesNo508LoopDetected = 508,
    HTTPCodesNo509BandwidthLimitExceeded = 509,
    HTTPCodesNo510NotExtended = 510,
    HTTPCodesNo511NetworkAuthenticationRequired = 511,
    HTTPCodesNo522ConnectionTimedOut = 522,
    HTTPCodesNo598NetworkReadTimeoutErrorUnknown = 598,
    HTTPCodesNo599NetworkConnectTimeoutErrorUnknown = 599
};

#endif /* HTTPStatusCodes_h */
