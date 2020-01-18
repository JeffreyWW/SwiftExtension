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
//        entries.append(BarChartDataEntry(x: 10, y: 4))
//        entries.append(BarChartDataEntry(x: 2, y: 4))
//        entries.append(BarChartDataEntry(x: -1, y: 4))
        return entries
    }()
    private let chartView = CombinedChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
    }


    private func setupChartView() {
        view.addSubview(chartView)
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
        var entries = self.entries
        let entry = BarChartDataEntry(x: 2, y: 6)
//        entries.append(entry)
        var set = BarChartDataSet(entries: entries)
        let set2 = BarChartDataSet(entries: [entry])
        set2.setColor(.yellow)
        set.setColor(.red)
//        set.append(BarChartDataEntry(x: 10, y: 4))
//        set.insert(BarChartDataEntry(x: 2, y: 4), at: 0)
        let barData = BarChartData(dataSets: [set])
        data.barData = barData
        chartView.data = data
        chartView.setVisibleXRangeMaximum(4)
//        chartView.setVisibleXRange(minXRange: 4, maxXRange: 4)
        let a = chartView.highestVisibleX
        let b = chartView.viewPortHandler.contentRight
        chartView.moveViewToX(chartView.xAxis.axisMaximum)
//        chartView.
        //直接加set不行,只显示边框
    }

    override func clickTest() {
        super.clickTest()
        let entry = BarChartDataEntry(x: 10, y: 6)
        let set = BarChartDataSet(entries: [entry])
//        chartView.data.addDataSet(set)
        chartView.data?.addEntry(entry, dataSetIndex: 0)
        chartView.notifyDataSetChanged()
        chartView.data?.notifyDataChanged()

        chartView.setVisibleXRangeMaximum(4)
        guard let data = chartView.data as? CombinedChartData else {
            return
        }
        return;
        data.barData.addDataSet(set)



        chartView.notifyDataSetChanged()
        chartView.setVisibleXRangeMaximum(4)

    }
}
