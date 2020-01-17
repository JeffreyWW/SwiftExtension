//
// Created by Jeffrey Wei on 2020/1/17.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ExtraFirstViewController: UIViewController, ExtaController {
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.snp.makeConstraints { $0.height.equalTo(200) }
        reloadData()
    }

    private func reloadData() {
        Completable.empty().delay(.seconds(2), scheduler: MainScheduler.instance).subscribe(onCompleted: {
            self.view.snp.updateConstraints { $0.height.equalTo(300) }
            self.layoutDone()
        }).disposed(by: disposeBag)
    }
}
