//
//  Fruits.swift
//  Kadai14
//
//  Created by 今村京平 on 2021/06/17.
//

import Foundation

enum Fruits {
    case apple
    case orange
    case banana
    case pineappple

    var name: String {
        switch self {
        case .apple: return "りんご"
        case .orange: return "みかん"
        case .banana: return "バナナ"
        case .pineappple: return "パイナップル"
        }
    }
}
