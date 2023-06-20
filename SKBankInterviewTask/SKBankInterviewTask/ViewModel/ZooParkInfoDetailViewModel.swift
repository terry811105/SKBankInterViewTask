//
//  ZooParkInfoDetailViewModel.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/18.
//

import Foundation
import RxCocoa
import RxSwift

class ZooParkInfoDetailViewModel {
    
    let model: ZooParkInfo
    
    let parkInfoRelay = BehaviorRelay<ZooParkInfo>(value: ZooParkInfo())
    let plantsInfoRelay = BehaviorRelay<[ZooPlantInfo]>(value: [])
    
    init(info: ZooParkInfo) {
        self.model = info
        parkInfoRelay.accept(info)
        getPlantsInfo()
    }
    
    func getPlantsInfo() {
        
        // 有快取拿快取
        if let infos = DataCacheManager.shared.getPlantsCache() {
            plantsInfoRelay.accept(filterPlants(parkInfo: model, plantInfos: infos))
            return
        }
        // 沒快取再打api
        APIManager.getTaipeiZooPlantInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let datas):
                guard let datas = datas else { return }
                DataCacheManager.shared.updatePlantsCache(infos: datas)
                self.plantsInfoRelay.accept(self.filterPlants(parkInfo: self.model, plantInfos: datas))
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    /// 篩選出在這個園區的植物
    private func filterPlants(parkInfo: ZooParkInfo , plantInfos: [ZooPlantInfo]) -> [ZooPlantInfo] {
        return plantInfos.filter { plant in
            let components: [String] = plant.location.components(separatedBy: "；")
            return components.contains(parkInfo.name)
        }
    }
}
