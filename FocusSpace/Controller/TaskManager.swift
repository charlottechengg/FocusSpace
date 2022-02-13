//
//  TaskManager.swift
//  pusheenDev
//
//  Created by Charlotte Cheng on 2022-02-12.
//
import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    // MARK: - Variable
    @Published var isWorking = true
    @Published var isRelaxing = false
    @Published var startTime = false
    @Published var completedSection = 0
    @Published var task: Task = Task(workSeconds: 25, shortRelaxSeconds: 5)
    @Published var currentTo: CGFloat = 1
    @Published var currentHour: Int = 0
    @Published var currentMin: Int = 0
    @Published var currentSec: Int = 0
    @Published var color: Color = Color(UIColor(rgb: 0xCDBBA7))
    
    var audioPlayer = AudioPlayer()
    
    func startTimer() {
        
        if completedSection < task.taskStorage[1] {
            
            if task.focusSeconds != 0 {

                if task.focusSeconds == task.taskStorage[0] {
                    currentTo = 1
                    color = Color(UIColor(rgb: 0xCDBBA7))
  
                    currentMin = task.focusSeconds
                }
                
                task.focusSeconds -= 1
                currentMin = task.focusSeconds
                self.currentTo -= CGFloat( 1 / Double(task.taskStorage[0]))
                
                if task.focusSeconds == 0 {
                    audioPlayer.startPlayBack(audioUrl: AudioURL.done!)
                }
                
                
            } else if task.focusSeconds == 0 && task.breakSeconds != 0 {

                if task.breakSeconds == task.taskStorage[1] {
                    currentTo = 1
                    color = Color(UIColor(rgb: 0x99A799))
                    currentMin = task.breakSeconds
                }
                
                task.breakSeconds -= 1
                currentMin = task.breakSeconds
                self.currentTo -= CGFloat( 1 / Double(task.taskStorage[1]))
                
                if task.breakSeconds == 0 {
                    audioPlayer.startPlayBack(audioUrl: AudioURL.done!)
                }
                
            } else if task.breakSeconds == 0 {
                completedSection += 1
                
                if completedSection != task.taskStorage[1] {
                    task.focusSeconds = task.taskStorage[0]
                    task.breakSeconds = task.taskStorage[1]
                    color = Color(UIColor(rgb: 0xCDBBA7))
                    
                }
                currentTo = 1
            }
        }
    }
    
    func resetTimer() {
        self.startTime = false
        completedSection = 0
        currentTo = 1
        task.focusSeconds = task.taskStorage[0]
        task.breakSeconds = task.taskStorage[1]
        currentMin = task.focusSeconds
        color = Color(UIColor(rgb: 0xCDBBA7))
    }
    
}
