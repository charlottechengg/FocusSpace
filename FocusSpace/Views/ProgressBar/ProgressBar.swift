import Foundation
import SwiftUI

struct ProgressBar: View {
    @Binding var value: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                
                Rectangle().frame(width: min(CGFloat(Float(value)/Float(100))*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor(rgb: 0xCDBBA7)))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
    
    
}
