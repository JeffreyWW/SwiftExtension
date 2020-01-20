//
// Created by Jeffrey Wei on 2020/1/20.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit
class ChildFirstViewController:UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
    }

    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
    }
}
