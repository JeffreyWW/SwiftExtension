//
// Created by Jeffrey Wei on 2020/1/18.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit

class ExtraSecondViewController: UIViewController, ExtaController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let test = UIView()
        test.backgroundColor = .red
        view.addSubview(test)
        test.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
}
