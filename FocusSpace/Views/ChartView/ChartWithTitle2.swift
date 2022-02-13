//
//  ChartWithTitle2.swift
//  pusheenDev
//
//  Created by user199782 on 2/13/22.
//

import SwiftUI

struct ChartWithTitle2: View {
    var body: some View {
        VStack {
            Text("Summary of Activities").bold().font(.system(size: 20)).padding()
            Chart2()
        }
    }
}

struct ChartWithTitle2_Previews: PreviewProvider {
    static var previews: some View {
        ChartWithTitle2()
    }
}
