//
// Created by Jeffrey Wei on 2020/1/18.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupNavigation()
    }

    private func setupDefault() {
        view.backgroundColor = .white
    }

    private func setupNavigation() {
        let item = UIBarButtonItem(title: "test", style: .plain, target: self, action: #selector(clickTest))
        navigationItem.rightBarButtonItem = item
    }


    @objc func clickTest() {

    }
}
