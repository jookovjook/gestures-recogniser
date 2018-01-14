//
//  AppDelegate.swift
//  mouseTrack
//
//  Created by Жека on 14/01/2018.
//  Copyright © 2018 Жека. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {

    var eventHandler : GlobalEventMonitor?
    var gecount : Int = 0
    
    var mouseOffset = 0.05
    
    var xs: [CGFloat] = []
    var ys: [CGFloat] = []
    var previousTime : Double = 0
    var currentTime: Double = 0

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        eventHandler = GlobalEventMonitor(mask: .mouseMoved, handler: { (mouseEvent: NSEvent?) in
            
            let currentMouseLocation = NSEvent.mouseLocation
            self.xs.append(currentMouseLocation.x)
            self.ys.append(currentMouseLocation.y)
            self.previousTime = self.currentTime
            self.currentTime = -(CACurrentMediaTime().distance(to: 0))
//            print("\(currentMouseLocation.x) \(currentMouseLocation.y)")
            if(self.currentTime - self.previousTime < self.mouseOffset){
                self.restartMovementHandler()
            }
            
        })
        eventHandler?.start()
        
        NSUserNotificationCenter.default.delegate = self
        
    }
    
    func restartMovementHandler(){
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(movementHandler), object: nil)
        perform(#selector(movementHandler), with: nil, afterDelay: mouseOffset)
    }
    
    @objc func movementHandler(){
        self.gecount += 1
        if(xs.count < 1) { return }
        let gesture = compare(xs, ys)
        if(gesture == Gestures.none){
            print("Gesture is not recognized")
        }else{
            let notification = NSUserNotification()
            notification.title = "Gesture was recognized!"
            switch gesture{
            case Gestures.g1:
                notification.informativeText = "Gesture 1"
                break
            case Gestures.g2:
                notification.informativeText = "Gesture 2"
                break
            case Gestures.g3:
                notification.informativeText = "Gesture 3"
                break
            case Gestures.g4:
                notification.informativeText = "Gesture 4"
                break
            default:
                break
            }
            NSUserNotificationCenter.default.deliver(notification)
        }
        
        xs.removeAll()
        ys.removeAll()
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter,
                                shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

