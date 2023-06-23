//
//  ViewController.swift
//  demoChartNotLibrary
//
//  Created by Khắc Hùng on 19/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var chartDataSource: [ChartModel] = []
    var chartView: UIView = UIView(frame: CGRect(x: 0, y: 50, width: 0, height: 0))
    var verticalAxisView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initChartData()
        
        // Bước 2: Tạo một biểu đồ (chart view)
        chartView = UIView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 500))
        chartView.backgroundColor = .white
        
        // Bước 3: Add chartView vào trong View cha
        self.view.addSubview(chartView)
        
        // Bước 4: Vẽ biểu đồ
        drawChart()

        // Bước 5: vẽ trục y
        drawVerticalAxis()
        
        // Bước 6: vẽ trục x
        xAxisView()
        
        // Bước 7: vẽ các đường kẻ ngang
        drawHorizontalLines()
        
        
    }
    
    
    func drawChart() {
        for (i , currentData) in chartDataSource.enumerated() {
            let chartTitle = UILabel(frame: CGRect(x: 0, y: 0, width: chartView.frame.width, height: 30))
            chartTitle.text = "Doanh thu theo tháng"
            chartTitle.textAlignment = .center
            chartTitle.textColor = .red
            chartTitle.font = UIFont.boldSystemFont(ofSize: 15)
            chartView.addSubview(chartTitle)

            let currentX = 15 + (i * 30)
            let currentHeight = (currentData.value/maxValueInChart()) * (chartView.frame.height * 0.9)
            let currentY = chartView.frame.height - currentHeight
            let currentColumn = UIView(frame: CGRect(x: Double(currentX + 20), y: currentY, width: 25, height: currentHeight))
            currentColumn.backgroundColor = currentData.color
            chartView.addSubview(currentColumn)
            


            // Hiển thị số liệu lên cột
            let label = UILabel(frame: CGRect(x: Double(currentX + 20), y: currentY - 20, width: 25, height: 20))
            label.text = "\(Int(currentData.value))"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .gray
            chartView.addSubview(label)
        }
    }
    
    func drawVerticalAxis() {

          let maxChartValue = chartDataSource.map { $0.value }.max() ?? 0
          let values: [Int] = initYValues(maxValue: Int(maxChartValue))
          let maxValue = CGFloat(maxValueInChart())
          let chartHeight = chartView.frame.height * 0.9

          for value in values {
              let labelY = chartView.frame.height - (CGFloat(value) / maxValue) * chartHeight - 20

              let label = UILabel(frame: CGRect(x: 0, y: labelY, width: 30, height: 20))
              label.text = String(value) + "$"
              label.textAlignment = .right
              label.font = UIFont.boldSystemFont(ofSize: 12)
              label.textColor = .black
              chartView.addSubview(label)
          }
      }
    func initYValues(maxValue: Int) -> [Int] {
        let numberOfStep = 6
        var values: [Int] = []
        let stepValue = maxValue / (numberOfStep - 1)
        for i in 0..<numberOfStep  {
            let value = stepValue * i
            values.append(value)
        }
        return values
    }
    
    func xAxisView () {
        let columnWidth = (chartView.frame.width - 30) / CGFloat(chartDataSource.count)
        let xAxisView = UIView(frame: CGRect(x: 10, y: chartView.frame.height - 1, width: chartView.frame.width, height: 20))
        xAxisView.backgroundColor = .clear

        for (index, data) in chartDataSource.enumerated() {
            let label = UILabel(frame: CGRect(x: 15 + (CGFloat(index) * columnWidth), y: 0, width: columnWidth, height: 20))
            label.text = data.type
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .black
            xAxisView.addSubview(label)
        }

        chartView.addSubview(xAxisView)
    }
    
    func drawHorizontalLines() {
        let maxChartValue = chartDataSource.map { $0.value }.max() ?? 0
        let values: [Int] = initYValues(maxValue: Int(maxChartValue))
        let maxValue = CGFloat(maxValueInChart())
        let chartHeight = chartView.frame.height * 0.9

        for value in values {
            let labelY = chartView.frame.height - (CGFloat(value) / maxValue) * chartHeight

            let line = UIView(frame: CGRect(x: 35, y: labelY, width: chartView.frame.width, height: 0.5))
            line.backgroundColor = .lightGray

            chartView.addSubview(line)
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
        let thang1 = ChartModel(type: "T1", value: 12, color: .red)
        let thang2 = ChartModel(type: "T2", value: 25, color: .green)
        let thang3 = ChartModel(type: "T3", value: 15, color: .yellow)
        let thang4 = ChartModel(type: "T4", value: 19, color: .blue)
        let thang5 = ChartModel(type: "T5", value: 70, color: .systemPink)
        let thang6 = ChartModel(type: "T6", value: 80, color: .red)
        let thang7 = ChartModel(type: "T7", value: 20, color: .green)
        let thang8 = ChartModel(type: "T8", value: 60, color: .yellow)
        let thang9 = ChartModel(type: "T9", value: 25, color: .blue)
        let thang10 = ChartModel(type: "T10", value: 30, color: .systemPink)
        let thang11 = ChartModel(type: "T11", value: 70, color: .red)
        let thang12 = ChartModel(type: "T12", value: 75, color: .green)
        
        chartDataSource.append(thang1)
        chartDataSource.append(thang2)
        chartDataSource.append(thang3)
        chartDataSource.append(thang4)
        chartDataSource.append(thang5)
        chartDataSource.append(thang6)
        chartDataSource.append(thang7)
        chartDataSource.append(thang8)
        chartDataSource.append(thang9)
        chartDataSource.append(thang10)
        chartDataSource.append(thang11)
        chartDataSource.append(thang12)
        
    }
    
    
}

