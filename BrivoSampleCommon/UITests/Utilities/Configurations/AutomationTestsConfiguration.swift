//
//  AutomationTestsConfiguration.swift
//  BrivoPassPlusUITests
//
//  Created by Mihai Dorhan on 16.04.2024.
//

import Foundation

struct RedeemPassConfig {
    let username: String
    let password: String
    let userId: String
    let referenceId: String
}

struct AutomationTestsConfiguration {
    let redeemPassConfig: RedeemPassConfig
    let accountId: Int
    let grantType = "password"
    let scope = "openid"
    let basicAuthBase64: String
    let apiBaseUrl: String
    let loginBaseUrl: String
    let audience: String

    static var configuration: AutomationTestsConfiguration {
        switch Configuration.default.environment {
        case .production:
            AutomationTestsConfiguration.Prod
        case .qa:
            AutomationTestsConfiguration.QA
        case .int:
            AutomationTestsConfiguration.Int
        }
    }
    static let Prod = AutomationTestsConfiguration(redeemPassConfig: RedeemPassConfig(username: "bmp.automation.tests@gmail.com",
                                                                                      password: "Brivo100",
                                                                                      userId: "60263499",
                                                                                      referenceId: "sdk.sample.automation.ios@brivo.com"),
                                                   accountId: 1861040,
                                                   basicAuthBase64: "WDerz2RAdLj1DBEHFlQpKCaLOp9EmN2B:EQD6YifgIj3QSQX38g-pT5_AM1TrNocdCaocncZlrfHmTp6jIdccBEXekjsY_GvC".toBase64() ?? "",
                                                   apiBaseUrl: "https://access.brivo.com/",
                                                   loginBaseUrl: "https://login.brivo.com/",
                                                   audience: "https://api.brivo.com")

    static let QA = AutomationTestsConfiguration(redeemPassConfig: RedeemPassConfig(username: "sdk.sample.automation+qa@gmail.com",
                                                                                    password: "Brivo100",
                                                                                    userId: "7921820",
                                                                                    referenceId: "sdk.sample.automation.ios@brivo.com"),
                                                   accountId: 101790,
                                                   basicAuthBase64: "7RttYlX43hmz1mUVdDlZVSgUOasIrHmt:vzSxSjqsnrjM05iv3QuU5Oq__Uwm3_e8NpYDQ-WKhjTxwhvqSYO8cHUtcVwg7pnN".toBase64() ?? "",
                                                   apiBaseUrl: "https://access.qa.brivo.com/",
                                                   loginBaseUrl: "https://login-qa.brivo.com/",
                                                   audience: "https://api-qa.brivo.com")

    static let Int = AutomationTestsConfiguration(redeemPassConfig: RedeemPassConfig(username: "sdk.sample.automation+int@gmail.com",
                                                                                     password: "Brivo100",
                                                                                     userId: "12039270",
                                                                                     referenceId: "sdk.sample.automation.ios@brivo.com"),
                                                   accountId: 82836,
                                                   basicAuthBase64: "HOyUZJqAypYlDW6ScMigwoGVuLEFFqAv:gPRlLx24Il4jItzKCZKyhJ86VJuPyJH9aF0wQkQ9uxi3Toq-NK_N-9w_JiU-z3q4".toBase64() ?? "",
                                                   apiBaseUrl: "https://access.int.brivo.com/",
                                                   loginBaseUrl: "https://login-inta.brivo.com/",
                                                   audience: "https://api-inta.brivo.com")
}
