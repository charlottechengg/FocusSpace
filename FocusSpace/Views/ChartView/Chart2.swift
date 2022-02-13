//
//  Chart2.swift
//  pusheenDev
//
//  Created by user199782 on 2/13/22.
//
import Charts
import SwiftUI

struct Chart2: UIViewRepresentable {
    
    static var data: [Summary] = [
        Summary(activity: "study", insist_time: 10),
        Summary(activity: "work", insist_time: 15),
        Summary(activity: "workout", insist_time: 3),
        Summary(activity: "rest", insist_time: 5),
        Summary(activity: "meditate", insist_time: 2),
        Summary(activity: "other", insist_time: 4)
    ]
    
    var entries: [PieChartDataEntry] = entriesForActivities(data)
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    let pieChart = PieChartView()
    
    func makeUIView(context: Context) -> PieChartView {
        pieChart.delegate = context.coordinator
        return pieChart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = [UIColor(red: 231, green: 212, blue: 181), UIColor(red: 211, green: 228, blue: 205), UIColor(red: 173, green: 194, blue: 169), UIColor(red: 153, green: 167, blue: 153), UIColor(red: 227, green: 205, blue: 193), UIColor(red: 216, green: 179, blue: 132)]
        let pieChartData = PieChartData(dataSet: dataSet)
        uiView.data = pieChartData
        configureChart(uiView)
        formatCenter(uiView)
        formatDescription(uiView.chartDescription)
        formatLegend(uiView.legend)
        formatDataSet(dataSet)
        uiView.notifyDataSetChanged()
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        var parent: Chart2
        init(parent: Chart2) {
            self.parent = parent
        }
    }
    
    static func entriesForActivities(_ activities: [Summary]) -> [PieChartDataEntry] {
        return activities.map {
            PieChartDataEntry(value: $0.insist_time, label: $0.activity)
        }
    }
    
    func configureChart(_ pieChart: PieChartView) {
        pieChart.rotationEnabled = false
        pieChart.animate(xAxisDuration: 0.5, easingOption: .easeInCirc)
    }
    
    func formatCenter(_ pieChart: PieChartView) {
        pieChart.holeColor = UIColor.systemBackground
        pieChart.centerText = "Activities"
    }
    
    func formatDescription(_ description: Description) {
    }
    
    func formatLegend(_ legend: Legend) {
        legend.formSize = 18
        
    }
    
    func formatDataSet(_ dataSet: ChartDataSet) {
        
    }
    
}

struct Chart2_Previews: PreviewProvider {
    static var previews: some View {
        Chart2()
            .frame(height: 400)
            .padding()    }
}
