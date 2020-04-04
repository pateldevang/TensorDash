//
//  chartsViewController.swift
//  TensorDash
//
//  Created by Devang Patel on 04/04/20.
//  Copyright © 2020 Tensor Dash. All rights reserved.
//

import UIKit
import Charts

class chartsViewController: UIViewController {

    @IBOutlet weak var lossChart: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [0.980, 0.10, 0.60, 0.30, 1.110, 0.99980]
        setChart(dataPoints: months, values: unitsSold)
        lossChart.rightAxis.drawBottomYLabelEntryEnabled = true
        lossChart.leftAxis.labelTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lossChart.xAxis.labelTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lossChart.rightAxis.drawLabelsEnabled = false
        lossChart.xAxis.labelPosition = XAxis.LabelPosition.bottom
        lossChart.legend.textColor = .white

        
        lossChart.leftAxis.drawAxisLineEnabled = false
        lossChart.leftAxis.drawGridLinesEnabled = false
        lossChart.rightAxis.drawAxisLineEnabled = false
        lossChart.rightAxis.drawGridLinesEnabled = false
        

    }
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        
        
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Loss")
        
        lineChartDataSet.circleRadius = 4.0
        lineChartDataSet.colors = [#colorLiteral(red: 0, green: 0.5422532558, blue: 0.01405961998, alpha: 1)]
        lineChartDataSet.valueTextColor = #colorLiteral(red: 0, green: 0.5422532558, blue: 0.01405961998, alpha: 1)
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lossChart.data = lineChartData

        let ll = ChartLimitLine(limit: 1.0)
        ll.lineColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        lossChart.rightAxis.addLimitLine(ll)

    }
    
}
