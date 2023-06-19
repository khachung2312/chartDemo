//
//  ViewController.swift
//  demoChartNotLibrary
//
//  Created by Khắc Hùng on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var chartDataSource: [ChartModel] = []
    var chartView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initChartData()
        
        // Bước 2: Tạo một biểu đồ (chart view)
        chartView = UIView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 200))
        chartView.backgroundColor = .white
        
        // Bước 3: Add chartView vào trong View cha
        self.view.addSubview(chartView)
        
        // Bước 4: Vẽ biểu đồ
        drawChart()
        
        
        
    }
    
    func drawChart() {
        for (i , currentData) in chartDataSource.enumerated() {
            let chartTitle = UILabel(frame: CGRect(x: 0, y: 0, width: chartView.frame.width, height: 30))
            chartTitle.text = "Doanh thu theo tháng"
            chartTitle.textAlignment = .center
            chartTitle.textColor = .red
            chartView.addSubview(chartTitle)

            
            let currentX = 15 + (i * 30)
            let currentHeight = (currentData.value/maxValueInChart()) * (chartView.frame.height * 0.8)
            let currentY = chartView.frame.height - currentHeight
            let currentColumn = UIView(frame: CGRect(x: Double(currentX), y: currentY, width: 25, height: currentHeight))
            currentColumn.backgroundColor = currentData.color
            
            chartView.addSubview(currentColumn)
        }
    }
    

    func maxValueInChart () -> Double {
        var maxValue = chartDataSource[0].value
        for data in chartDataSource {
            if data.value > maxValue {
                maxValue = data.value
            }
        }
        return maxValue
    }
    
    func initChartData() {
        let thang1 = ChartModel(type: "Thang 1", value: 12000, color: .red)
        let thang2 = ChartModel(type: "Thang 2", value: 20000, color: .green)
        let thang3 = ChartModel(type: "Thang 3", value: 15000, color: .yellow)
        let thang4 = ChartModel(type: "Thang 4", value: 19000, color: .black)
        let thang5 = ChartModel(type: "Thang 5", value: 7000, color: .systemPink)
        
        chartDataSource.append(thang1)
        chartDataSource.append(thang2)
        chartDataSource.append(thang3)
        chartDataSource.append(thang4)
        chartDataSource.append(thang5)
    }
    
    
}

