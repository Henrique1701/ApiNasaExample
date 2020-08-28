//
//  Apod.swift
//  ApiNasaExample
//
//  Created by José Henrique Fernandes Silva on 28/08/20.
//  Copyright © 2020 José Henrique Fernandes Silva. All rights reserved.
//

import Foundation

// MARK: - Apod
struct Apod: Codable {
    let date, explanation: String
    let hdurl: String
    let mediaType, serviceVersion, title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
