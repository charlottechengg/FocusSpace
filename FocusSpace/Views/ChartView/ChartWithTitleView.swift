//
//  ChartWithTitleView.swift
//  pusheenDev
//
//  Created by user199782 on 2/12/22.
//

import SwiftUI

struct ChartWithTitleView: View {
    
    var body: some View {
        VStack {
            Text("Summary of Activities").bold().font(.system(size: 20)).padding()
            ChartView()
        }
    }
}

struct ChartWithTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ChartWithTitleView()
    }
}
