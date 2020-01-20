//
// Created by Jeffrey Wei on 2019/12/27.
// Copyright (c) 2019 Jeffrey Wei. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

@propertyWrapper
struct PropertyWrapperTest<T: UIView> {
    let color: UIColor
    private var _wrappedValue: T?

    init(color: UIColor) {
        self.color = color
    }

    var wrappedValue: T? {
        set {
            _wrappedValue = newValue
            if let label = _wrappedValue as? UILabel {
                label.textColor = self.color
                return
            }

            if let button = _wrappedValue as? UIButton {
                button.setTitleColor(.red, for: .normal)
                button.setTitleColor(color, for: .normal)
                return
            }

            _wrappedValue?.backgroundColor = self.color
        }
        get {
            _wrappedValue
        }
    }
}
