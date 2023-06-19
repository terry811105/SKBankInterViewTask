//
//  ZooPlantDetailViewController.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/20.
//

import UIKit
import Stevia

class ZooPlantDetailViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.subviews(scrollView)
        scrollView.fillContainer()
        
    }
    
}
