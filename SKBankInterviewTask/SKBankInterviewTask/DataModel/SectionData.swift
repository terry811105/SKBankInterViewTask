//
//  SectionData.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/20.
//

import Foundation
import RxDataSources

struct SectionOfCustomData {
    var header: String
    var items: [Item]
}
extension SectionOfCustomData: SectionModelType {
    typealias Item = ZooInfo
    
    init(original: SectionOfCustomData, items: [Item]) {
        self = original
        self.items = items
    }
}
