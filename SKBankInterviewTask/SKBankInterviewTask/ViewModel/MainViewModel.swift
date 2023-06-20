//
//  MainViewModel.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/16.
//

import RxSwift
import RxCocoa

class MainViewModel {
    
    // output
    let tableViewObservable = BehaviorRelay<[ZooParkInfo]>(value: [])
    let refreshSubject = PublishSubject<Bool>()
    
    func startToBind() {
        APIManager.getTaipeiZooParkInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let datas):
                guard let datas = datas else { return }
                self.tableViewObservable.accept(datas)
                self.refreshSubject.onNext(true)
            case .failure(let error):
                self.refreshSubject.onNext(true)
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
}
