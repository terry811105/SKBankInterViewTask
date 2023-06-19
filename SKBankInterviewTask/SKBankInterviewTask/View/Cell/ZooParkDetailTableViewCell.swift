//
//  ZooParkDetailTableViewCell.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/19.
//

import UIKit
import Stevia

class ZooParkDetailTableViewCell: UITableViewCell {
    
    lazy var parkImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    lazy var categoryLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    lazy var memoLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    lazy var openWebButton: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = ""
        memoLabel.text = ""
        parkImageView.image = nil
    }
    
    private func setupUI() {
        contentView.subviews(parkImageView)
        parkImageView.top(0).left(0).right(0)
        parkImageView.height(180)
        contentView.subviews(descriptionLabel)
        descriptionLabel.Top == parkImageView.Bottom + 16
        descriptionLabel.left(16).right(16)
        
    }
    
    @objc
    private func clickBtn() {
        
    }
}
