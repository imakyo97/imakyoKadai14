//
//  ItemListViewModel.swift
//  Kadai14-MVVM
//
//  Created by 今村京平 on 2021/08/20.
//

import Foundation

final class ItemListViewModel {
    private let items: ItemsModel
    var store: [Item] { items.store }

    init(items: ItemsModel) {
        self.items = items
    }
}
