import Foundation
import UIKit

class Pusheen: ObservableObject {
    @Published var imageName : String = "greeting"
    @Published var fullness : Int = 0
    @Published var status : String = "Tap to focus!"
    
    func updateFullness (num : Int) {
        if fullness + num <= 100 {
            self.fullness += num
        } else {
            self.fullness = 100
        }
    }
    
    func setPusheen () {
        var imageName = "greeting"
        switch fullness {
            case 0...10:
                imageName = "study1"
                status = "Tap to focus"
            case 11...20:
                imageName = "study2"
                status = "Keep going"
            case 21...30:
                imageName = "work1"
                status = "Good job"
            case 31...40:
                imageName = "work2"
                status = "Well done"
            case 41...50:
                imageName = "hungry4"
                status = "Take a break"
            case 51...60:
                imageName = "hungry3"
                status = "Get some water"
            case 61...70:
                imageName = "hungry2"
                status = "Have some rest"
            case 71...80:
                imageName = "hungry1"
                status = "Go for a walk"
            case 81...90:
                imageName = "crying"
                status = "So tired"
            default:
                imageName = "unicorn"
                status = "Woooohoo"
            
        }
        self.imageName = imageName
    }
    
}
