//
// Created by Jeffrey Wei on 2019/12/29.
// Copyright (c) 2019 Jeffrey Wei. All rights reserved.
//

import Foundation
import Moya

struct CodingPlugin: PluginType {
    //加密
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        request
    }

    //解密
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        result
    }
}
