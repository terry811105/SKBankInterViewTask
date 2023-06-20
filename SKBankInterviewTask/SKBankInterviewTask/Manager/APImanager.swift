//
//  APImanager.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/15.
//

import Foundation
import Alamofire

class APIManager {
    
    static private let getTaipeiZooParkInfoUrl: String = "https://data.taipei/api/v1/dataset/5a0e5fbb-72f8-41c6-908e-2fb25eff9b8a?scope=resourceAquire"
    
    static private let getTaipeiZooPlantInfoUrl: String = "https://data.taipei/api/v1/dataset/f18de02f-b6c9-47c0-8cda-50efad621c14?scope=resourceAquire"
    
    /// 取得園區簡介
    static func getTaipeiZooParkInfo(completion: @escaping (Result<[ZooParkInfo]?, Error>) -> Void) {
        guard let url = URL(string: getTaipeiZooParkInfoUrl) else {
            completion(.success([]))
            return
        }
        AF.request(url).response { response in
            switch response.result {
            case .success(let datas):
                
                guard let data = datas,
                      let response = try? JSONDecoder().decode(GetZooParkInfoResponse.self, from: data) else {
                    #if DEBUG
                    print("失敗-轉換資料失敗")
                    #endif
                    completion(.success(nil))
                    return
                }
                var infos: [ZooParkInfo] = response.result.results.map { info in
                    let imgUrl = info.picUrl.replacingOccurrences(of: "http", with: "https")
                    let memo = info.memo.isEmpty ? "無休館資訊" : info.memo
                    return ZooParkInfo(id: info.id,
                                       name: info.name,
                                       category: info.category,
                                       picUrl: imgUrl,
                                       info: info.info,
                                       memo: memo,
                                       url: info.url)
                }
                
                completion(.success(infos))
                
            case .failure(let error):
                #if DEBUG
                print("失敗-請求錯誤-\(error.localizedDescription)")
                #endif
                completion(.failure(error))
            }
        }
    }
    
    /// 取得園區植物
    static func getTaipeiZooPlantInfo(completion: @escaping (Result<[ZooPlantInfo]?, Error>) -> Void) {
        guard let url = URL(string: getTaipeiZooPlantInfoUrl) else {
            completion(.success([]))
            return
        }
        AF.request(url).response { response in
            switch response.result {
            case .success(let datas):
                guard let data = datas,
                      let response = try? JSONDecoder().decode(GetZooPlantInfoResponse.self, from: data) else {
                    #if DEBUG
                    print("失敗-轉換資料失敗")
                    #endif
                    completion(.success(nil))
                    return
                }
                let infos: [ZooPlantInfo] = response.result.results.map { info in
                    let url = info.pic01_URL.replacingOccurrences(of: "http", with: "https")
                    let plant = ZooPlantInfo(id: info.id, ﻿name: info.﻿name, summary: info.summary, keywords: info.keywords, alsoKnown: info.alsoKnown, location: info.location, nameEn: info.nameEn, nameLatin: info.nameLatin, family: info.family, genus: info.genus, brief: info.brief, feature: info.feature, functionApplication: info.functionApplication, pic01_ALT: info.pic01_ALT, pic01_URL: url, update: info.update)
                    return plant
                }
                
                completion(.success(infos))
                
            case .failure(let error):
                #if DEBUG
                print("失敗-請求錯誤-\(error.localizedDescription)")
                #endif
                completion(.failure(error))
            }
        }
    }
    
    

    
}






