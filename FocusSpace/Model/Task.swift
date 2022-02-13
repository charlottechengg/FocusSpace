import Foundation
import SwiftUI

struct Task: Equatable {
    
    var focusSeconds: Int
    var breakSeconds: Int
    let oneSectionTotalSeconds: Int
    let taskStorage: [Int]
    
    init(workSeconds: Int = 25, shortRelaxSeconds: Int = 5) {
        
        self.focusSeconds = workSeconds
        self.breakSeconds = shortRelaxSeconds
        self.oneSectionTotalSeconds = workSeconds + shortRelaxSeconds
        
        taskStorage = [workSeconds, shortRelaxSeconds]
        print(workSeconds)
    }
}
