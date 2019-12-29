//
//  ViewController.swift
//  SwiftExtension
//
//  Created by Jeffrey Wei on 2019/12/26.
//  Copyright © 2019 JF. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit


class ViewController: UIViewController {
//    @PropertyWrapperTest(color: .red, superViewColor: .yellow)
//    var label: UILabel!
//    @PropertyWrapperTest(color: .red, superViewColor: .yellow)
    @PropertyWrapperTest(color: .red)
    var bgView: UIView!
    @IBOutlet private var nibLabel: UILabel!
    @PropertyWrapperTest(color: .blue)
    @IBOutlet private var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        var a: String? = nil
        var t :String = "1"
        let b = a.map { (s: String) -> Int in
            return 1
        }
//        self.view.addSubview(self.label)
//        self.label.text = "this is a test"
//        self.nibLabel.isHidden = false
//        self.label.textColor = .red
//        self.label.snp.makeConstraints { $0.center.equalToSuperview() }
        // Do any additional setup after loading the view.
    }


}
