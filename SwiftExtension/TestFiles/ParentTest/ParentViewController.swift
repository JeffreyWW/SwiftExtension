//
// Created by Jeffrey Wei on 2020/1/20.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit
import SwifterSwift
import SnapKit

class ParentViewController: TestViewController {
    let childFirst = ChildFirstViewController()
    let childSecond = ChildSecondViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildren()
        setupView()
    }

    private func setupChildren() {
//        view.addSubview(childFirst.view)
        addChild(childFirst)
        addChild(childSecond)
//        addChild(childSecond)
    }

    private func setupView() {
        let subView = UIView()
        view.addSubview(subView)
        subView.backgroundColor = .red
        subView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(300)
        }
        subView.addSubview(childFirst.view)

        childFirst.view.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    var isFirst = true

    override func clickTest() {
        super.clickTest()
        if isFirst {
            transition(from: childFirst, to: childSecond, duration: 0.1, animations: nil) { tag in
                self.childSecond.view.snp.makeConstraints { $0.edges.equalToSuperview() }
            }
        } else {
            transition(from: childSecond, to: childFirst, duration: 0.1, animations: nil) { tag in
                self.childFirst.view.snp.makeConstraints { $0.edges.equalToSuperview() }
            }
        }
        isFirst = !isFirst
    }
}
