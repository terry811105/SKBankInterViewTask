//
//  ZooPlantDetailViewController.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/20.
//

import UIKit
import Stevia

/// 植物詳細頁
class ZooPlantDetailViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = UIScrollView()
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    
    private let model: ZooPlantInfo
    
    // 這頁沒有太多畫面邏輯，因此直接注入model
    init(model: ZooPlantInfo) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = model.﻿name
        view.subviews(scrollView)
        scrollView.Top == view.safeAreaLayoutGuide.Top
        scrollView.left(0).right(0).bottom(0)
        scrollView.subviews(imageView)
        imageView.top(0).left(0).right(0)
        imageView.height(250)
        imageView.Width == view.Width
        SDWebImageManager.shared.setImage(imageView: imageView, imgUrl: model.pic01_URL)
        scrollView.subviews(stack)
        stack.Top == imageView.Bottom + 16
        stack.Left == view.Left + 16
        stack.Right == view.Right - 16
        stack.Bottom == scrollView.Bottom
        
    }
    
    private func configure() {
        let nameView = TitleComponentView(title: model.﻿name, content: model.nameEn)
        stack.addArrangedSubview(nameView)
        let subNameView = TitleComponentView(title: "附名", content: model.alsoKnown)
        stack.addArrangedSubview(subNameView)
        let introView = TitleComponentView(title: "簡介", content: model.brief)
        stack.addArrangedSubview(introView)
        let recognizeMethosView = TitleComponentView(title: "分辨方式", content: model.feature)
        stack.addArrangedSubview(recognizeMethosView)
        let functionView = TitleComponentView(title: "功能性", content: model.functionApplication)
        stack.addArrangedSubview(functionView)
        let updateTimeView = TitleComponentView(title: "最後更新：\(model.update)", content: "")
        stack.addArrangedSubview(updateTimeView)
    }
    
}
