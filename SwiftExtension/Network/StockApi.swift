//
// Created by Jeffrey Wei on 2019/12/29.
// Copyright (c) 2019 Jeffrey Wei. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum StockApi {
    case saveStock
}

extension StockApi: ApiTarget {
    public var baseURL: URL {
        URL(string: "https://www.baidu.com")!
    }
    public var path: String {
        ""
    }
    public var method: Moya.Method {
        .get
    }
    public var sampleData: Data {
        fatalError("sampleData has not been implemented")
    }
    var parameters: [String: Any] {
        [:]
    }
}

