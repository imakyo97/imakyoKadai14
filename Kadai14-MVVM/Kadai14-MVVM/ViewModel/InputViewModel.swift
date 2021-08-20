//
//  InputViewModel.swift
//  Kadai14-MVVM
//
//  Created by 今村京平 on 2021/08/20.
//

import RxSwift

final class InputViewModel {
    let items: ItemsModel

    init(items: ItemsModel) {
        self.items = items
    }

    func addItem(name: String, isChecked: Bool){
        items.addItem(name: name, isChecked: isChecked)
    }
}
