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
import Moya

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
        let rx = ProviderManager.stock.rx.request(.saveStock).mapString().subscribe(onSuccess: { string in
            print(string)
        })
    }
}
