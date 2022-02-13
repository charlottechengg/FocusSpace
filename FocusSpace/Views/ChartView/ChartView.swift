//
//  ChartView.swift
//  pusheenDev
//
//  Created by Charlotte Cheng on 2022-01-16.
//
import Charts
import SwiftUI

struct ChartView: UIViewRepresentable {
    
    var entries: [PieChartDataEntry] = entriesForActivities(Database.connect())
    
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
        var parent: ChartView
        init(parent: ChartView) {
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

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .frame(height: 400)
            .padding()
    }
}
}
