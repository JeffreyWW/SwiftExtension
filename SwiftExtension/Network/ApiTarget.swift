//
// Created by Jeffrey Wei on 2019/12/29.
// Copyright (c) 2019 Jeffrey Wei. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol ApiTarget: TargetType {
    var parameters: [String: Any] { get }
}

extension ApiTarget {
    public var task: Task {
        let encoding: ParameterEncoding = self.method == .get ? URLEncoding.default : JSONEncoding.default
        return .requestParameters(parameters: self.parameters, encoding: encoding)
    }
    public var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
}

