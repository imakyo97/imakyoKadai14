//
//  Items.swift
//  Kadai14-MVVM
//
//  Created by 今村京平 on 2021/08/20.
//

import RxSwift

protocol ItemsModel {
    var store: [Item] { get set }
    func addItem(name: String, isChecked: Bool)
}

struct Item {
        let name: String
        let isChecked: Bool
    }

class Items: ItemsModel {

    enum Fruits {
        static let apple = "りんご"
        static let orange = "みかん"
        static let banana = "バナナ"
        static let pineapple = "パイナップル"
    }

    var store: [Item] = [
        Item(name: Fruits.apple, isChecked: false),
        Item(name: Fruits.orange, isChecked: true),
        Item(name: Fruits.banana, isChecked: false),
        Item(name: Fruits.pineapple, isChecked: true)
    ]

    func addItem(name: String, isChecked: Bool) {
        store.append(
                    Item(name: name, isChecked: isChecked)
                )
    }
}
