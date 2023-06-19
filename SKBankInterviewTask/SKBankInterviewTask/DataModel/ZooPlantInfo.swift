//
//  ZooPlantInfo.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/19.
//

import Foundation

struct ZooPlantInfo: Codable {
    let id: Int
    let ﻿name: String
    let summary: String
    let keywords: String
    let alsoKnown: String
    let location: String
    let nameEn: String
    let nameLatin: String
    let family: String
    let genus: String
    let brief: String
    let feature: String
    let functionApplication: String
    let pic01_ALT: String
    let pic01_URL: String
    let update: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case ﻿name = "F_Name_Ch"
        case summary = "F_Summary"
        case keywords = "F_Keywords"
        case alsoKnown = "F_AlsoKnown"
        case location = "F_Location"
        case nameEn = "F_Name_En"
        case nameLatin = "F_Name_Latin"
        case family = "F_Family"
        case genus = "F_Genus"
        case brief = "F_Brief"
        case feature = "F_Feature"
        case functionApplication = "F_Function＆Application"
        case pic01_ALT = "F_Pic01_ALT"
        case pic01_URL = "F_Pic01_URL"
        case update = "F_Update"
    }
    
}

struct GetZooPlantInfoResponse: Codable {
    let result: ZooPlantInfoResult
}

struct ZooPlantInfoResult: Codable {
    let results: [ZooPlantInfo]
}








