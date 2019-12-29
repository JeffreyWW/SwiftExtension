//
// Created by Jeffrey Wei on 2019/12/29.
// Copyright (c) 2019 Jeffrey Wei. All rights reserved.
//

import Foundation
import Moya


class ProviderManager {
    static let stock: MoyaProvider<StockApi> = MoyaProvider<StockApi>(plugins: [CodingPlugin()])
}
