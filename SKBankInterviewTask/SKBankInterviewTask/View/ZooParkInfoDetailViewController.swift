//
//  ZooParkInfoDetailViewController.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/18.
//

import UIKit
import Stevia

class ZooParkInfoDetailViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        return lb
    }()
    
    private lazy var categoryLabel: UILabel = {
        let lb = UILabel()
        
        return lb
    }()
    
    private lazy var memoLabel: UILabel = {
         let lb = UILabel()
        
        return lb
    }()
    
    private lazy var openWebButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(ZooParkDetailTableViewCell.self, forCellReuseIdentifier: ZooParkDetailTableViewCell.reuseIdentifier())
        table.register(ZooPlantTableViewCell.self, forCellReuseIdentifier: ZooPlantTableViewCell.reuseIdentifier())
        return table
    }()
    
    var viewModel: ZooParkInfoDetailViewModel
    
    init(viewModel: ZooParkInfoDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    private func setupUI() {
        view.backgroundColor = .white
        
        view.subviews(imageView)
        imageView.Top == view.safeAreaLayoutGuide.Top 
        imageView.left(0).right(0)
        imageView.height(200)
        view.subviews(descriptionLabel)
        descriptionLabel.Top == imageView.Bottom + 16
        descriptionLabel.left(16).right(16)
        
    }
    
    func bind() {
        let info = viewModel.model
        navigationItem.title = info.name
        descriptionLabel.text = info.info
        memoLabel.text = info.memo
        categoryLabel.text = info.category
        SDWebImageManager.shared.setImage(imageView: imageView, imgUrl: info.picUrl)
    }

}
