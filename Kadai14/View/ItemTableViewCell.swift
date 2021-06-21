//
//  ItemTableViewCell.swift
//  Kadai14
//
//  Created by 今村京平 on 2021/06/17.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var fruitsLabel: UILabel!
    @IBOutlet private weak var checkMark: UIImageView!

    static var identifier: String { String(describing: self)}
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil)}

    /*
     パフォーマンス上の理由により、prepareForReuseでコンテンツ表示の初期化をすべきではない、ということになっています

     ↓根拠が載っています
     prepareForReuse() | Apple Developer Documentation
     https://developer.apple.com/documentation/uikit/uitableviewcell/1623223-prepareforreuse
     */
    // TODO: ドキュメントを確認する
//    override func prepareForReuse() {
//        fruitsLabel.text = ""
//        checkMark.isHidden = true
//    }

    /* isCheckedがtrueであってもfalseであっても、.imageが必ず初期化されるようにしました
       こうすることによって、セルの再利用のエラーが防げる */
    func item(item: Item) {
        fruitsLabel.text = item.name
        checkMark.image = item.isChecked ? UIImage(named: "CheckMark") : nil
    }
}
