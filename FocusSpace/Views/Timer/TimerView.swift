import SwiftUI

struct TimerView: View {
    
    // MARK: - Variable
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @ObservedObject var taskManager: TaskManager
    @ObservedObject var userManager: UserManager
    @ObservedObject var pusheen: Pusheen
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @State var audioPlayer = AudioPlayer()
    
    // MARK: - View
    var body: some View {
        
        VStack {
            ZStack {
                VStack(spacing: 10) {
                    Image(uiImage: (UIImage(named: "\(pusheen.imageName).png")!))
                }
                .frame(width: screenWidth/2.6, height: screenWidth/2.6, alignment: .center)
                .scaledToFill()
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: screenWidth/10, lineCap: .round))
                    
                    // Active Timer Circle
                    Circle()
                        .trim(from: 0, to: taskManager.currentTo)
                        .stroke(taskManager.color, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                    
                    // Button
                    Button(action: {
                        self.audioPlayer.startPlayBack(audioUrl: AudioURL.toggleOn!)
                        taskManager.startTime.toggle()
                        pusheen.setPusheen()
                        userManager.user.setStatus(newStatus: "Focus")
                        print(userManager.user.status)
                        print(userManager.user.getIcon())
                    }, label: {
                        Circle() 
                            .trim(from: 0, to: 1)
                            .foregroundColor(Color.clear)
                    })
                    
                }
                .frame(width: screenWidth/1.5, height: screenWidth/1.5, alignment: .center)
                
                
            }
            
        }
        .onAppear {
            pusheen.setPusheen()
        }
        .onReceive(self.timer, perform: { _ in
            if self.taskManager.startTime {
                withAnimation {
                    taskManager.startTimer()
                }
                if taskManager.task.focusSeconds == 0 && taskManager.task.breakSeconds >= shortRest {
                    pusheen.updateFullness(num: 11)
                    pusheen.setPusheen()
                }
            }
        })
        .onChange(of: self.taskManager.startTime, perform: { _ in
            if !self.taskManager.startTime {
                withAnimation {
                    taskManager.resetTimer()
                }
                
            }
        })
        
    } // End of body
    
    
    // MARK: - Function
    // None
    
}


// MARK: - Preview
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(taskManager: TaskManager(), userManager:UserManager(), pusheen: Pusheen())
    }
}
