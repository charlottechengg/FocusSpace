import SwiftUI

struct MainView: View {
    
    // MARK: - Variable
    @AppStorage("focusTime") private var focusTime = 25
    @AppStorage("breakTime") private var breakTime = 5
    
    @StateObject var taskManager: TaskManager = TaskManager()
    @StateObject var userManager: UserManager = UserManager()
    @StateObject var pusheen: Pusheen = Pusheen()
    @State private var selectionIndex = 0
    
    // MARK: - View
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TabView(selection: $selectionIndex) {
                    TimerMainView(taskManager: taskManager, userManager:userManager, pusheen: pusheen)
                        .padding(.top, 5)
                        .tag(0)
                    
                    
                }.navigationBarTitle(Text("Charlotte's Focus Space"))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(
                        leading:
                            NavigationLink(
                                destination: ChartWithTitleView(),
                                label: {
                                    Image(systemName: "chart.pie.fill").foregroundColor(Color(UIColor(rgb: 0x99A799)))
                                        .font(.title2)
                                }),
                        trailing:
                            NavigationLink(
                                destination: SettingsView(taskManager: taskManager),
                                label: {
                                    Image(systemName: "gearshape.fill")
                                        .foregroundColor(Color(UIColor(rgb: 0x99A799)))
                                        .font(.title2)
                                }))

                    .onChange(of: selectionIndex, perform: { value in
                        self.taskManager.resetTimer()
                        self.pusheen.updateFullness(num: 11)
                        self.userManager.user.updateFocusedTime(time: focusTime)
                        self.pusheen.setPusheen()
                })
            }
        }
        .onAppear(perform: {
            taskManager.task = Task(workSeconds: focusTime, shortRelaxSeconds: breakTime)
            taskManager.currentMin = taskManager.task.focusSeconds

        })
    }
}

// MARK: - Preview
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(taskManager: TaskManager(), pusheen: Pusheen())
    }
}
