//
//  MainViewModel.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/16.
//

import RxSwift
import RxCocoa

class MainViewModel {
    
    // input
    let listObservable = BehaviorRelay<[ZooParkInfo]>(value: [])
    
    // output
    let tableViewObservable = BehaviorRelay<[ZooParkInfo]>(value: [])
    
    
    
    func startToBind(completion: @escaping () -> Void) {
        APIManager.getTaipeiZooParkInfo { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let datas):
                guard let datas = datas else { return }
                self.tableViewObservable.accept(datas)
                completion()
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                // TODO: 錯誤處理
            }
        }
    }
    
    func refreshData() -> Observable<[ZooParkInfo]> {
        return Observable.create { observer in
            APIManager.getTaipeiZooParkInfo { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let datas):
                    guard let datas = datas else { return }
                    self.tableViewObservable.accept(datas)
                    observer.onNext(datas)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
}
