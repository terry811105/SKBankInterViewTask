//
//  UITableViewCellExtention.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/17.
//

import UIKit

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}
