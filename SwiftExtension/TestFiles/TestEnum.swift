//
// Created by Jeffrey Wei on 2020/1/17.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation

struct TestModel {
    let title: String
    let type: ViewController.Type
}

enum TestEnum: String, CaseIterable {
    case fullTest = "满屏测试"
}

extension TestEnum {
    var type: AnyClass {
        FullViewController.self
    }
}