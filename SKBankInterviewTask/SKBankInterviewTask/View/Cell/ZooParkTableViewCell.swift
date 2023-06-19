//
//  ZooParkTableViewCell.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/16.
//

import UIKit
import Stevia

class ZooParkTableViewCell: UITableViewCell {
    
    lazy var parkImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.textAlignment = .left
        lb.numberOfLines = 2
        return lb
    }()
    
    lazy var memoLabel: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .left
        lb.textColor = .black
        return lb
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, memoLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 5
        return stack
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
        titleLabel.text = ""
        descriptionLabel.text = ""
        memoLabel.text = ""
        parkImageView.image = nil
    }

    private func setupUI() {
        contentView.subviews(parkImageView)
        parkImageView.top(20).left(16).bottom(20)
        parkImageView.width(80).height(80)
        contentView.subviews(stack)
        stack.Left == parkImageView.Right + 16
        stack.top(8).right(16).bottom(8)
        let titleFont: UIFont = .boldSystemFont(ofSize: 18)
        let font: UIFont = .systemFont(ofSize: 14)
        titleLabel.font = titleFont
        descriptionLabel.font = font
        memoLabel.font = font
        
    }
}
