import SwiftUI

@main
struct pusheenU: App {
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    
    var body: some Scene {
        WindowGroup {
            LogInView()
        }
    }
}
