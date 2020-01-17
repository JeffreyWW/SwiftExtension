//
// Created by Jeffrey Wei on 2020/1/17.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit

struct TestModel {
    let title: String
    let viewController: UIViewController
}

enum TestEnum: String, CaseIterable {
    case fullTest = "满屏测试"
}

extension TestEnum {
    var controller: UIViewController {
        var controller: UIViewController! = nil
        switch self {
        case .fullTest:
            controller = FullSubViewController()
        }
        controller.title = self.rawValue
        return controller
    }
}