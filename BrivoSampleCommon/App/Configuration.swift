//
//  Configuration.swift
//  BrivoSampleDev
//
//  Created by Adrian Somesan on 09.09.2024.
//

import Foundation
import BrivoCore

// swiftlint:disable identifier_name
enum Environment: String, CaseIterable, Codable {
    case production = "Production"
    case qa = "QA"
    case int = "Int"

    private var region: Region? {
        let region = UserDefaultsAccessService().getRegion()
        switch region {
        case 0:
            return .us
        case 1:
            return .eu
        case .none:
            return .us
        case .some:
            return .us
        }
    }
// swiftlint:enable identifier_name

    var brivoOnAirAuth: String {
        switch self {
        case .production:
            return region == .eu ? "https://auth.eu.brivo.com" : "https://auth.brivo.com"
        case .qa:
            return region == .eu ? "https://auth.eu-qa.brivo.com" : "https://auth-qa.brivo.com"
        case .int:
            return region == .eu ? "https://auth.eu-inta.brivo.com" : "https://auth-inta.brivo.com"
        }
    }

    var brivoOnAirAPI: String {
        switch self {
        case .production:
            return region == .eu ? "https://pi.eu.brivo.com/api" :"https://pi.brivo.com/api"
        case .qa:
            return region == .eu ? "https://api.eu-qa.brivo.com/api" : "https://api-qa.brivo.com/api"
        case .int:
            return region == .eu ? "https://api.eu-inta.brivo.com/api" : "https://api-inta.brivo.com/api"
        }
    }

    var clientId: String {
        switch self {
        case .production:
            return region == .eu ? Constants.EU_CLIENT_ID : Constants.CLIENT_ID
        case .qa:
            return region == .eu ? "f2eb1cd0-d048-4a2f-9d4e-ff0db7d676a5" : "f2eb1cd0-d048-4a2f-9d4e-ff0db7d676a5"
        case .int:
            return region == .eu ? "6efe2f46-9972-4dd0-b7cb-e393162c0356" : "6efe2f46-9972-4dd0-b7cb-e393162c0356"
        }
    }

    var clientSecret: String {
        switch self {
        case .production:
            return region == .eu ? Constants.EU_CLIENT_SECRET : Constants.CLIENT_SECRET
        case .qa:
            return "IUnbkc1omb3uaYzlkFwqn1eHAXGPYqFi"
        case .int:
            return "yX7ae1gDq2oGIFeJIstjJQZje44bJoEl"
        }
    }
}

class Configuration {
    static let `default` = Configuration()

    var environment: Environment = {
        let environment = UserDefaultsAccessService().getEnvironment()
        return environment ?? .production
    }()
}
