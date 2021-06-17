//
//  InputViewController.swift
//  Kadai14
//
//  Created by 今村京平 on 2021/06/17.
//

import UIKit

protocol InputViewDelegate: AnyObject {
    func tappedSave(saveText: String)
}

class InputViewController: UIViewController {

    weak var delegate: InputViewDelegate?

    @IBOutlet private weak var nameTextField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.text = ""
    }

    @IBAction private func tappedCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func tappedSave(_ sender: Any) {
        guard let saveText = nameTextField.text else { return }
        guard saveText != "" else {
            notInputAlert()
            return
        }
        delegate?.tappedSave(saveText: saveText)
        dismiss(animated: true, completion: nil)
    }

    private func notInputAlert() {
        let alert = UIAlertController(
            title: "名前が未入力です",
            message: "名前を入力して下さい",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }
}
