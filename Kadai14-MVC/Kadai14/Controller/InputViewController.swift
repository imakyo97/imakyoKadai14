//
//  InputViewController.swift
//  Kadai14
//
//  Created by 今村京平 on 2021/06/17.
//

import UIKit

// TODO: InputViewController に deinit を追加し、そこにprintを書いて試してみる
// ここが理解できていなかったため、自作のdelegate = selfの実装に時間がかかった。

// InputViewControllerのデリゲートのため、命名をInputViewDelegateからInputViewControllerDelegateに変更
protocol InputViewControllerDelegate: AnyObject {
    func tappedSave(saveText: String)
}

class InputViewController: UIViewController {

    weak var delegate: InputViewControllerDelegate?

    @IBOutlet private weak var nameTextField: UITextField!

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        nameTextField.text = ""
//    }

    // インスタンス化後に何度も表示されるわけではないため、ラベル初期化のタイミングとしてはviewDidLodeの方が適切
    // 個人的理解(dismissで戻るとインスタンスが削除され、再度、画面遷移されるたびに新しくインスタンス化されるためviewDidLodeが適切)
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = ""
    }

    @IBAction private func tappedCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func tappedSave(_ sender: Any) {
        guard let saveText = nameTextField.text else { return }
        guard saveText != "" else {
            presentNotInputAlert()
            return
        }
        delegate?.tappedSave(saveText: saveText)
        dismiss(animated: true, completion: nil)
    }

    // メソッド名の先頭は動詞にする(notInputAlert()からpresentNotInputAlert()に変更)
    private func presentNotInputAlert() {
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
