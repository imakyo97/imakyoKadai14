//
//  ItemListViewController.swift
//  Kadai14-MVVM
//
//  Created by 今村京平 on 2021/08/20.
//

import UIKit
import RxSwift

final class ItemListViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var addBarButton: UIBarButtonItem!

    private let items = Items()
    private lazy var viewModel = ItemListViewModel(items: items)
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView()
    }

    private func settingTableView() {
        itemTableView.dataSource = self
        itemTableView.register(ItemTableViewCell.nib, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Input" {
            let navigationController = segue.destination as! UINavigationController
            let inputViewController = navigationController.topViewController as! InputViewController
            inputViewController.viewModel = InputViewModel(items: items)
            inputViewController.didTapDoneButton
                .subscribe(onNext: { [weak self] _ in
                    self?.itemTableView.reloadData()
                })
                .disposed(by: disposeBag)
        }
    }
}

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.store.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier)
            as! ItemTableViewCell // swiftlint:disable:this force_cast
        let item = viewModel.store[indexPath.row]
        cell.configure(name: item.name, isChecked: item.isChecked)
        return cell
    }
}

