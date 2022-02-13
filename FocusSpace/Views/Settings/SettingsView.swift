import SwiftUI

struct SettingsView: View {
    
    // MARK: - Variable
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("numOfSection") private var numOfSection = 4
    
    @ObservedObject var taskManager:TaskManager
    var colorBrown = Color(UIColor(rgb: 0x968C83))
    var colorGreen = Color(UIColor(rgb: 0x8DB596))
    // MARK: - View
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            // Form
            Form {
                Section(header: Text("Account")) {
                    buttonRow(iconName: "person.crop.circle", iconColor: colorBrown, text: "Switch Account", link: "https://www.google.com")
                    buttonRow(iconName: "person.2.fill", iconColor: colorBrown, text: "Workspace", link: "https://www.google.com")
                }
                .padding(.vertical, 1)
                
                Section(header: Text("Support")) {
                    buttonRow(iconName: "hand.raised.fill", iconColor: colorBrown, text: "Privacy Policy", link: "https://www.google.com")
                    buttonRow(iconName: "questionmark.circle.fill", iconColor: colorBrown, text: "Support", link: "https://www.google.com")
                    buttonRow(iconName: "hand.thumbsup.fill", iconColor: colorBrown, text: "Rate us", link: "https://www.google.com")
                    buttonRow(iconName: "envelope.fill", iconColor: colorBrown, text: "Feedback", link: "https://www.google.com")
                }
                .padding(.vertical, 1)
                
                Section(header: Text("About")) {
                    textRow(label: "Compatibility", value: "iPhone", iconName: "checkmark.circle.fill", iconColor: colorGreen)
                    textRow(label: "Programming Language", value: "Swift", iconName: "swift", iconColor: colorGreen)
                }
                .padding(.vertical, 1)

                
                
                // Footer
                HStack {
                    Spacer()
                    Text("Stay focused with Pusheen")
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                Section {
                    NavigationLink(
                        destination: LogInView().navigationBarHidden(true)) {
                        Text("Log Out")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .edgesIgnoringSafeArea(.all)
            
        }
        .navigationBarTitle("Settings", displayMode: .inline)
        // Hide the system back button
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.left.circle.fill")
                                        Text("Back")
                                    }
                                })
        .onChange(of: work, perform: { value in
            print("test\(work)")
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest)
            taskManager.resetTimer()
        })
        .onChange(of: shortRest, perform: { value in
            taskManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest)
            taskManager.resetTimer()
        })
    }
    
}

// MARK: - Preview
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(taskManager: TaskManager())
    }
}
