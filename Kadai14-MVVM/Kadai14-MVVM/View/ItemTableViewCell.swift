//
//  ItemTableViewCell.swift
//  Kadai14-MVVM
//
//  Created by 今村京平 on 2021/08/20.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: identifier, bundle: nil) }

    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    func configure(name: String, isChecked: Bool) {
        nameLabel.text = name
        checkImageView.image = isChecked ? UIImage(named: "CheckMark") : nil
    }
}
