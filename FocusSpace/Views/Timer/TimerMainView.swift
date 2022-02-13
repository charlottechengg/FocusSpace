import SwiftUI

struct TimerMainView: View {
    
    // MARK: - Variable
    @ObservedObject var taskManager:TaskManager
    @ObservedObject var userManager:UserManager
    @ObservedObject var pusheen:Pusheen
    @AppStorage("focusTime") private var focusTime = 25
    @AppStorage("restTime") private var restTime = 5
    
    
    // MARK: - View
    var body: some View {
        
        ScrollView { // do not delete: manages spacing
            VStack {
                HStack {
                    Text("\(pusheen.status)")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor(rgb: 0x8E806A)))
                    ProgressBar(value: $pusheen.fullness)
                    Spacer()
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 25)
                .padding(.bottom, 5)
                
                
                TimerView(taskManager: taskManager, userManager: userManager, pusheen: pusheen)
                    .padding(20)
                
                
                VStack {
                    
                    if taskManager.startTime {
                        Text("\(taskManager.currentMin) min")
                            .fontWeight(.bold)
                            .font(.system(size: 45))
                    } else {
                        Text("\(focusTime) min")
                            .fontWeight(.bold)
                            .font(.system(size: 45))
                    }
                    
                    Menu("Activity") {
                        Button("Study") {
                            
                        }
                        Button("Work") {
                            
                        }
                        Button("Workout") {
                            
                        }
                        Button("Rest") {
                            
                        }
                        Button("Mediate") {
                            
                        }
                        Button("Other") {
                            
                        }
                    }
                    
                    PeerList(userManager: userManager)
                }
                .padding()
            }
        }
        
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TimerMainView(taskManager: TaskManager(), userManager:UserManager(),pusheen: Pusheen())
    }
}
