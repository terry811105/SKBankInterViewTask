//
//  TitleComponentView.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/20.
//

import UIKit
import Stevia

class TitleComponentView: UIView {
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 14)
        return lb
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textColor = UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    init(title: String, content: String) {
        super.init(frame: .zero)
        setupUI()
        titleLabel.text = title
        descriptionLabel.text = content
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        subviews(titleLabel)
        subviews(descriptionLabel)
        titleLabel.top(0).left(0).right(0)
        descriptionLabel.Top == titleLabel.Bottom
        descriptionLabel.left(0).right(0).bottom(0)
    }
    
}
