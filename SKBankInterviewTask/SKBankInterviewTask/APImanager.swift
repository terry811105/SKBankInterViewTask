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
                completion(.success(response.result.results))
                
            case .failure(let error):
                #if DEBUG
                print("失敗-請求錯誤-\(error.localizedDescription)")
                #endif
                completion(.failure(error))
            }
        }
    }
    

    
}






