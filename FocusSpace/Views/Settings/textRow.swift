import SwiftUI

struct textRow: View {
    var label: LocalizedStringKey
    var value: LocalizedStringKey
    var iconName: String
    var iconColor: Color
    
    init(label: String, value: String, iconName: String, iconColor: Color) {
        self.label = LocalizedStringKey(label)
        self.value = LocalizedStringKey(value)
        self.iconName = iconName
        self.iconColor = iconColor
    }

    // MARK: - View
    var body: some View {
        HStack {
            Icon(iconName: iconName, iconColor: iconColor, backgroundColor: .white)
            
            Text(label)
                .foregroundColor(Color.secondary)
                .padding(.leading, 5)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            
            Spacer()
            
            Text(value)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        
    }
}

//// MARK: - Preview
//struct SettingsRow1_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsRowTypeAbout(iconName: "gear", iconColor: Color.blue, firstText: "Application", secondText: "Todo")
//            .previewLayout(.fixed(width: 375, height: 60))
//            .padding()
//    }
//}

