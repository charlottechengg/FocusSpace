//
//  UserManager.swift
//  pusheenDev
//
//  Created by Charlotte Cheng on 2022-02-12.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    @Published var workspace = "0"
    @Published var user = User(username: "Charlotte", status: "Idle", totalFocusedMinutes: 0)
    @Published var peers = [
        User(username: "Kevin", status: "Offline", totalFocusedMinutes: 0),
        User(username: "Senni", status: "Offline", totalFocusedMinutes: 50)
    ]

}

