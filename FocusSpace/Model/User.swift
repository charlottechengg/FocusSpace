//
//  User.swift.swift
//  pusheenDev
//
//  Created by Charlotte Cheng on 2022-02-12.
//

import SwiftUI
class User: Identifiable, ObservableObject, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.username == rhs.username && lhs.status == rhs.status && lhs.totalFocusedMinutes == rhs.totalFocusedMinutes && lhs.iconName == rhs.iconName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(username)
        hasher.combine(status)
        hasher.combine(totalFocusedMinutes)
        hasher.combine(iconName)
    }
    
    @Published var id = UUID()
    @Published var username: String
    @Published var status: String
    @Published var totalFocusedMinutes: Int
    @Published var iconName: String
    @Published var color: Color
    
//    let dailyFocusedMinutes: Int
//    let weeklyFocusedMinutes: Int
    init(username: String, status: String, totalFocusedMinutes: Int) {
        self.username = username
        self.status = status
        self.totalFocusedMinutes = totalFocusedMinutes
        self.iconName = "circle.dashed"
        self.color = .gray
    }
    
    func setStatus(newStatus: String) {
        if newStatus == status  && newStatus == "Focus"{
            self.status = "Idle"
        }else {
            self.status = newStatus
        }
        
        self.iconName = self.getIcon()
        self.color = self.getColor()
    }
    
    func updateFocusedTime(time: Int){
        self.totalFocusedMinutes = self.totalFocusedMinutes + time
        print("test \(self.totalFocusedMinutes)")
    }
    func getColor() -> Color{
        var color: Color
        switch status {
            case "Idle":
                color = Color(UIColor(rgb: 0xCDBBA7))
            case "Focus":
                color = .green
            default:
                color = .gray
        }
        return color
    }
    func getIcon() -> String{
        var icon: String
        switch status {
            case "Idle":
                icon = "moon.fill"
            case "Focus":
                icon = "circle.fill"
            default:
                icon = "circle.dashed"
        }
        return icon
    }
}


