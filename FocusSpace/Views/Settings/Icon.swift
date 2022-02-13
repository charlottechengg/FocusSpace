import SwiftUI

struct Icon: View {
    
    // MARK: - Variable
    var iconName: String
    var iconColor: Color
    var backgroundColor: Color
    
    // MARK: - View
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(backgroundColor)
            Image(systemName: iconName)
                .foregroundColor(iconColor)
        }
        .frame(width: 35, height: 35, alignment: .center)
        
    }
}
