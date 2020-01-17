//
// Created by Jeffrey Wei on 2020/1/17.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit

class FullSubViewController: FullViewController {
    init() {
        super.init(extraControllers: [ExtraFirstViewController()])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
