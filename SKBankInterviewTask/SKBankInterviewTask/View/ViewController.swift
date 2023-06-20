//
//  ViewController.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/14.
//

import UIKit
import Stevia
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    private lazy var label: UILabel = UILabel()
    
    private lazy var refreshControl: UIRefreshControl = {
        let rf = UIRefreshControl()
        return rf
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .lightGray
        table.register(ZooParkTableViewCell.self, forCellReuseIdentifier: ZooParkTableViewCell.reuseIdentifier())
        return table
    }()

    let disposeBag: DisposeBag = DisposeBag()
    
    private lazy var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        navigationItem.title = "動物園"
        view.backgroundColor = .white
        view.subviews(tableView)
        tableView.left(0).right(0).bottom(0)
        tableView.Top == view.safeAreaLayoutGuide.Top
        tableView.refreshControl = refreshControl
        refreshControl.sendActions(for: .valueChanged)
    }
    
    private func bind() {
        refreshControl.beginRefreshing()
        viewModel.startToBind { [weak self] in
            self?.refreshControl.endRefreshing()
        }
        
        viewModel.tableViewObservable
            .bind(to: tableView.rx.items(cellIdentifier: ZooParkTableViewCell.reuseIdentifier(), cellType: ZooParkTableViewCell.self)) { [weak self] (row, element, cell) in
                self?.configCell(cell: cell, model: element)
            }
            .disposed(by: disposeBag)
//
//        tableView.rx.willDisplayCell
//            .subscribe(onNext: { [weak self] (cell, indexPath) in
//                print("index display: \(indexPath.row)")
//            })
//            .disposed(by: disposeBag)
        
        Observable.zip(tableView.rx.modelSelected(ZooParkInfo.self), tableView.rx.itemSelected)
            .subscribe(onNext: { [unowned self] (info, index) in
                print("Selected cell at indexPath: \(index.row), info: \(info.name)")
                let vm = ZooParkInfoDetailViewModel(info: info)
                let vc = ZooParkInfoDetailViewController(viewModel: vm)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
    
    private func configCell(cell: ZooParkTableViewCell, model: ZooParkInfo) {
        cell.titleLabel.text = model.name
        cell.descriptionLabel.text = model.info
        cell.memoLabel.text = model.memo
        SDWebImageManager.shared.setImage(imageView: cell.parkImageView, imgUrl: model.picUrl)
        cell.accessoryType = .disclosureIndicator
    }
    
}

