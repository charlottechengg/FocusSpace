//
//  PeerList.swift
//  pusheenDev
//
//  Created by Charlotte Cheng on 2022-02-11.
//

import SwiftUI

struct PeerList: View{
    
    // MARK: - Variable
    @ObservedObject var userManager: UserManager
    

    // MARK: - View
    var body: some View {
        VStack {
            NavigationLink(destination: ChartWithTitleView()) {
                PeerRow(iconName: userManager.user.getIcon(), iconColor: userManager.user.getColor(), label: "\(userManager.user.username)", value: "\(userManager.user.status)")
                    .padding(.vertical, 2)
                    .buttonStyle(PlainButtonStyle())
            }
            .onReceive(userManager.user.$status) { _ in self.userManager.objectWillChange.send() }
            
            ForEach(userManager.peers, id: \.id) { user in
                NavigationLink(destination: ChartWithTitle2()) {
                    PeerRow(iconName: user.iconName, iconColor: user.getColor(), label: "\(user.username)", value: "\(user.status)")
                        .padding(.vertical, 2)
                        .buttonStyle(PlainButtonStyle())
                }
                .onReceive(user.$status) { _ in self.userManager.objectWillChange.send() }
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PeerList(userManager: UserManager())
    }
}


