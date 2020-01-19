//
// Created by Jeffrey Wei on 2020/1/18.
// Copyright (c) 2020 Jeffrey Wei. All rights reserved.
//

import Foundation
import Charts
import SnapKit
import SwifterSwift

class ChartTestViewController: TestViewController {
    private let dataSource = 3..<10
    private lazy var entries: [BarChartDataEntry] = {
        var entries = dataSource.map { index in
            BarChartDataEntry(x: Double(index), y: Double(index) * 2)
        }
        return entries
    }()
    private let chartView = CombinedChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
    }


    private func setupChartView() {
        view.addSubview(chartView)
        //类似k线自动缩放
//        chartView.autoScaleMinMaxEnabled = true
        chartView.xAxis.labelPosition = .bottom
        chartView.scaleYEnabled = false
        chartView.leftAxis.labelCount = 4
        chartView.leftAxis.forceLabelsEnabled = true
        chartView.xAxis.labelCount = 5
        chartView.xAxis.forceLabelsEnabled = true
        chartView.snp.makeConstraints {
            $0.center.width.equalToSuperview()
            $0.height.equalTo(400)
        }
        let data = CombinedChartData()
        let set = BarChartDataSet(entries: entries)
        let barData = BarChartData(dataSet: set)
        data.barData = barData
        chartView.data = data
        chartView.setVisibleXRangeMaximum(4)
        chartView.moveViewToX(chartView.xAxis.axisMaximum)
    }

    override func clickTest() {
        super.clickTest()
        let entry = BarChartDataEntry(x: 1, y: 6)
        let entry2 = BarChartDataEntry(x: 2, y: 6)
        chartView.data?.addEntry(entry, dataSetIndex: 0)
        chartView.data?.addEntry(entry2, dataSetIndex: 0)
        chartView.notifyDataSetChanged()
        chartView.setVisibleXRangeMaximum(4)
    }
}
