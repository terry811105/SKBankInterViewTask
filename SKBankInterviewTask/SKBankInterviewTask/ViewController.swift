//
//  ViewController.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/14.
//

import UIKit
import Stevia

class ViewController: UIViewController {
    
    private lazy var label: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        label.text = "hello world"
        
        let redView = UIView()
        redView.backgroundColor = .red
        view.subviews(redView)
        
        // 设置红色视图的约束
        // redView.centerInContainer()
        redView.size(100)
        
        // 创建一个蓝色的标签，并将其添加到红色视图中
        let blueLabel = UILabel()
        blueLabel.text = "Hello, Stevia!"
        blueLabel.textColor = .blue
        redView.subviews(blueLabel)
        
        
        // 设置蓝色标签的约束
        // blueLabel.centerInContainer()
        
        view.layout(
            320,  // 设置父视图与子视图之间的间距
            |-redView-|,  // 设置 redView 的左右边缘与父视图对齐
            20,  // 设置 redView 与 blueLabel 之间的间距
            blueLabel.centerInContainer(),  // 将 blueLabel 居中于 redView
            20  // 设置父视图与子视图之间的间距
        )
    }
    
    
}

