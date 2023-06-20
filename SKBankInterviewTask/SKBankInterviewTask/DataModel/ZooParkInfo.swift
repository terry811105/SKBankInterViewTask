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

struct ZooParkInfo: Codable, ZooInfo {
    
    var id: Int = 0
    
    var category: String = ""
    
    var name: String = ""
    
    var picUrl: String = ""
    
    var info: String = ""
    
    var memo: String = ""
    
    var url: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case category = "e_category"
        case name = "e_name"
        case picUrl = "e_pic_url"
        case info = "e_info"
        case memo = "e_memo"
        case url = "e_url"
    }
    
    init() {
        
    }
    
    init(id: Int, name: String, category: String, picUrl: String, info: String, memo: String, url: String) {
        self.id = id
        self.category = category
        self.name = name
        self.picUrl = picUrl
        self.info = info
        self.memo = memo
        self.url = url
    }
}
