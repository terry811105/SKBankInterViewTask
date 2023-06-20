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
        APIManager.getTaipeiZooPlantInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let datas):
                guard let datas = datas else { return }
                self.plantsInfoRelay.accept(datas)
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
