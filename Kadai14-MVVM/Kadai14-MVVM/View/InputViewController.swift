//
//  InputViewController.swift
//  Kadai14-MVVM
//
//  Created by 今村京平 on 2021/08/20.
//

import UIKit
import RxSwift
import RxCocoa

class InputViewController: UIViewController {

    @IBOutlet private weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet private weak var doneBarButton: UIBarButtonItem!
    @IBOutlet private weak var nameTextField: UITextField!

    var viewModel: InputViewModel?
    private let subject = PublishSubject<String>()
    var didTapDoneButton: Observable<String> { return subject }
    private let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        settingObservabel()
    }

    func settingObservabel() {
        cancelBarButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
            .disposed(by: disposeBag)

        doneBarButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard self?.nameTextField.text != "" else { return }
                self?.viewModel?.addItem(name: (self?.nameTextField.text)!, isChecked: false)
                self?.dismiss(animated: true, completion: nil)
                self?.subject.onNext("doneボタンが押されました")
            })
            .disposed(by: disposeBag)
    }
}
