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

struct SectionOfCustomData {
    var header: String
    var items: [Item]
}
extension SectionOfCustomData: SectionModelType {
    typealias Item = ZooInfo
    
    init(original: SectionOfCustomData, items: [Item]) {
        self = original
        self.items = items
    }
}

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
                let parkPlants: [ZooPlantInfo] = plantsInfo.filter { plant in
                    let components: [String] = plant.location.components(separatedBy: "；")
                    return components.contains(parkInfo.name)
                }
                
                return [
                    SectionOfCustomData(header: "園區簡介", items: [parkInfo]),
                    SectionOfCustomData(header: "園區植物", items: parkPlants)
                ]
            }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.modelSelected(ZooPlantInfo.self), tableView.rx.itemSelected)
            .subscribe(onNext: { [unowned self] (info, index) in
                print("Selected cell at indexPath: \(index.row), info: \(info.﻿name)")
                
            })
            .disposed(by: disposeBag)
        
    }
    
}

