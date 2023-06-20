//
//  ZooParkInfoDetailViewController.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/18.
//

import UIKit
import Stevia
import RxCocoa
import RxSwift
import RxDataSources
import SafariServices

/// 園區簡介詳細頁+該區植物列表
class ZooParkInfoDetailViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(ZooParkDetailTableViewCell.self, forCellReuseIdentifier: ZooParkDetailTableViewCell.reuseIdentifier())
        table.register(ZooPlantTableViewCell.self, forCellReuseIdentifier: ZooPlantTableViewCell.reuseIdentifier())
        return table
    }()
    
    private var viewModel: ZooParkInfoDetailViewModel
    
    let disposeBag = DisposeBag()
    
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
        bind()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.subviews(tableView)
        tableView.fillContainer()
        navigationItem.title = viewModel.model.name
    }
    
    func bind() {
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfCustomData>(
            configureCell: { dataSource, tableView, indexPath, item in
                // 園區
                if let zooParkInfo = item as? ZooParkInfo,
                   let cell = tableView.dequeueReusableCell(withIdentifier: ZooParkDetailTableViewCell.reuseIdentifier(), for: indexPath) as? ZooParkDetailTableViewCell {
                    SDWebImageManager.shared.setImage(imageView: cell.parkImageView, imgUrl: zooParkInfo.picUrl)
                    cell.descriptionLabel.text = zooParkInfo.info
                    cell.memoLabel.text = zooParkInfo.memo
                    cell.categoryLabel.text = zooParkInfo.category
                    cell.clickBtnAction = { [weak self] in
                        guard let url = URL(string: zooParkInfo.url) else { return }
                        let safari = SFSafariViewController(url: url)
                        self?.present(safari, animated: true)
                    }
                    return cell
                }
                // 植物
                if let plantInfo = item as? ZooPlantInfo,
                   let cell = tableView.dequeueReusableCell(withIdentifier: ZooPlantTableViewCell.reuseIdentifier(), for: indexPath) as? ZooPlantTableViewCell {
                    SDWebImageManager.shared.setImage(imageView: cell.plantImageView, imgUrl: plantInfo.pic01_URL)
                    cell.titleLabel.text = plantInfo.﻿name
                    cell.descriptionLabel.text = plantInfo.alsoKnown
                    cell.accessoryType = .disclosureIndicator
                    return cell
                }
                
                return UITableViewCell()
            }, titleForHeaderInSection: { datasource, section in
                if section == 0 {
                    return "園區簡介"
                }
                if section == 1 {
                    return "園區植物"
                }
                return ""
            })
        
        Observable.combineLatest(viewModel.parkInfoRelay.asObservable(), viewModel.plantsInfoRelay.asObservable())
            .map { (parkInfo, plantsInfo) -> [SectionOfCustomData] in
                
                return [
                    SectionOfCustomData(header: "園區簡介", items: [parkInfo]),
                    SectionOfCustomData(header: "園區植物", items: plantsInfo)
                ]
            }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.modelSelected(ZooPlantInfo.self), tableView.rx.itemSelected)
            .subscribe(onNext: { [weak self] (info, index) in
                let vc = ZooPlantDetailViewController(model: info)
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
    
}

