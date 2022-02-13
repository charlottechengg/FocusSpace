import SwiftUI

struct PeerRow: View {
    
    // MARK: - Variable
//    @ObservedObject var userManager: UserManager
    var iconName: String
    var iconColor: Color
    var firstText: LocalizedStringKey
    var secondText: LocalizedStringKey
    
    init(iconName: String, iconColor: Color, label: String, value: String) {
        self.firstText = LocalizedStringKey(label)
        self.secondText = LocalizedStringKey(value)
        self.iconName = iconName
        self.iconColor = iconColor
    }
    
    // MARK: - View
    var body: some View {
        HStack {
            
            Icon(iconName: iconName, iconColor: iconColor, backgroundColor: .white)
                .onChange(of: iconName, perform: { g in
                    print("test \(g)")
                })
            
            Text(firstText)
                .fontWeight(.regular)
                .foregroundColor(Color.primary)
                .padding(.leading, 5)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Spacer()
            
            Text(secondText)
                .fontWeight(.regular)
                .foregroundColor(Color.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
        }
        
    }
}

//// MARK: - Preview
//struct TimerSettingsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerSettingsRow(iconName: "gear", iconColor: Color.blue, firstText: "Application", secondText: "Todo")
//            .previewLayout(.fixed(width: 375, height: 60))
//            .padding()
//    }
//}

