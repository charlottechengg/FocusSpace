//
//  LogInView.swift
//  pusheenDev
//
//  Created by user199782 on 2/12/22.
//

import SwiftUI

struct LogInView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Username: ").padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black)).padding()
                }
                HStack {
                    Text("Password: ").padding()
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black)).padding()
                    
                }
                NavigationLink(destination: MainView().navigationBarHidden(true)) {
                    Text("Log In")
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
