//
//  ZooParkInfo.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/16.
//

import Foundation

struct GetZooParkInfoResponse: Codable {
    let result: ZooParkInfoResult
    
}

struct ZooParkInfoResult: Codable {
    let results: [ZooParkInfo]
}

struct ZooParkInfo: Codable {
    
    let id: Int
    
    let category: String
    
    let name: String
    
    let picUrl: String
    
    let info: String
    
    let memo: String
    
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case category = "e_category"
        case name = "e_name"
        case picUrl = "e_pic_url"
        case info = "e_info"
        case memo = "e_memo"
        case url = "e_url"
    }
}
