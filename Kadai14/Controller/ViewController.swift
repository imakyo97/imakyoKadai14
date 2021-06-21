//
//  ViewController.swift
//  Kadai14
//
//  Created by 今村京平 on 2021/06/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, InputViewControllerDelegate {

    /* ViewControllerが持つitemsの初期化にしか使っていないのでこちらへ移動してprivateを付けました。
     また、名前を定義したいだけであって、switchで分岐したいわけではないので、static letで定義しました。 */
    // TODO: enumでのstatic letの使い方を覚える
    private enum FruitNames {
        static let apple = "りんご"
        static let orange = "みかん"
        static let banana = "バナナ"
        static let pineappple = "パイナップル"
    }

    @IBOutlet private weak var tableView: UITableView!

    /* enumを変更したため、引数nameを変更
       命名をisCheckedに変更したため、引数名を変更 */
    private var items: [Item] = [
        Item(name: FruitNames.apple, isChecked: false),
        Item(name: FruitNames.orange, isChecked: true),
        Item(name: FruitNames.banana, isChecked: false),
        Item(name: FruitNames.pineappple, isChecked: true)
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
    // 命名をisCheckedに変更したため、引数名を変更
    func tappedSave(saveText: String) {
        items.append(Item(name: saveText, isChecked: false))
        tableView.reloadData()
    }
}
