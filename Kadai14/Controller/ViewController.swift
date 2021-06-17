//
//  ViewController.swift
//  Kadai14
//
//  Created by 今村京平 on 2021/06/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, InputViewDelegate {

    @IBOutlet private weak var tableView: UITableView!
    private var items: [Item] = [
        Item(name: Fruits.apple.name, checkMark: false),
        Item(name: Fruits.orange.name, checkMark: true),
        Item(name: Fruits.banana.name, checkMark: false),
        Item(name: Fruits.pineappple.name, checkMark: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.nib, forCellReuseIdentifier: ItemTableViewCell.identifier)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Input" {
            // swiftlint:disable:next force_cast
            let nav = segue.destination as! UINavigationController
            // swiftlint:disable:next force_cast
            let inputViewController = nav.topViewController as! InputViewController
            inputViewController.delegate = self
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemTableViewCell.identifier,
            for: indexPath
        ) as! ItemTableViewCell // swiftlint:disable:this force_cast
        cell.item(item: items[indexPath.row])
        return cell
    }

    // MARK: - InputViewDelegate
    func tappedSave(saveText: String) {
        items.append(Item(name: saveText, checkMark: false))
        tableView.reloadData()
    }
}
