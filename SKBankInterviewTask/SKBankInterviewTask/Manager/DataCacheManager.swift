//
//  DataCacheManager.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/20.
//

import Foundation

/// 簡易快取中心
class DataCacheManager {
    
    private init() {}
    
    static let shared = DataCacheManager()
    
    private var plantsInfoCache: [ZooPlantInfo] = []
    
    func clearCache() {
        plantsInfoCache.removeAll()
    }
    
    func updatePlantsCache(infos: [ZooPlantInfo]) {
        plantsInfoCache = infos
    }
    
    func getPlantsCache() -> [ZooPlantInfo]? {
        if !plantsInfoCache.isEmpty {
            return plantsInfoCache
        }
        return nil
    }
}
