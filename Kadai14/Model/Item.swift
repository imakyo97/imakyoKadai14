//
//  Item.swift
//  Kadai14
//
//  Created by 今村京平 on 2021/06/17.
//

import Foundation

/* Bool型のプロパティの命名は先頭がisなどになるのがiOS開発では一般的（例：isHidden, isEnabled）
 命名をcheckMarkからisCheckedに変更 */
struct Item {
    let name: String
    let isChecked: Bool
}
