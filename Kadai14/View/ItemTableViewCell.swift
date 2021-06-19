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

    override func prepareForReuse() {
        fruitsLabel.text = ""
        checkMark.isHidden = true
    }

    func item(item: Item) {
        fruitsLabel.text = item.name
        checkMark.image = UIImage(named: "CheckMark")
        checkMark.isHidden = item.checkMark
    }
}
