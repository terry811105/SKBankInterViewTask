//
//  ZooPlantTableViewCell.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/20.
//

import UIKit
import Stevia

class ZooPlantTableViewCell: UITableViewCell {

    lazy var plantImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.textAlignment = .left
        lb.font = .boldSystemFont(ofSize: 18)
        return lb
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.textAlignment = .left
        lb.numberOfLines = 2
        lb.font = .systemFont(ofSize: 14)
        return lb
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
        plantImageView.image = nil
    }

    private func setupUI() {
        
        
    }
}
