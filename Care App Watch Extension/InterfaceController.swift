//
//  InterfaceController.swift
//  Care App Watch Extension
//
//  Created by Dias Elfurion on 24.12.16.
//  Copyright © 2016 Me. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
fileprivate let session = WCSession.default()
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func call(){
        
        
        let url = URL(string: "tel://03458239845")!
            WKExtension.shared().openSystemURL(url)
        let msg = ["message": "Four score and seven years..."]
        session.sendMessage(msg, replyHandler: nil, errorHandler: nil)
        
        
    }

    @IBAction func SMSbut() {
            let url = URL(string:"sms:380630273663")!
            WKExtension.shared().openSystemURL(url)
        }
  /*  @IBAction func contextTapped() {
        let context = "OMG I UPDATED MY CONTEXT"
        do {
            try session.updateApplicationContext(["WCApplicationContext": context])
        } catch {
            print(error)
        }
    } 
     
     override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
     // This method is called when a remote notification needs to be presented.
     // Implement it if you use a dynamic notification interface.
     // Populate your dynamic notification interface as quickly as possible.
     //
     // After populating your dynamic notification interface call the completion block.
     completionHandler(.Custom)
     }
     func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
     // Do nothing for now
     NSLog("Workout error: \(error.userInfo)")
     }
     
     func workoutDidStart(_ date : Date) {
     if let query = createHeartRateStreamingQuery(date) {
     healthStore.execute(query)
     } else {
     label.setText("cannot start")
     }
     }
     
     func workoutDidEnd(_ date : Date) {
     if let query = createHeartRateStreamingQuery(date) {
     healthStore.stop(query)
     label.setText("---")
     } else {
     label.setText("cannot stop")
     }
     }
     
     // MARK: - Actions
     @IBAction func startBtnTapped() {
     if (self.workoutActive) {
     //finish the current workout
     self.workoutActive = false
     self.startStopButton.setTitle("Start")
     if let workout = self.workoutSession {
     healthStore.end(workout)
     }
     } else {
     //start a new workout
     self.workoutActive = true
     self.startStopButton.setTitle("Stop")
     startWorkout()
     }
     
     }
     
     func startWorkout() {
     self.workoutSession = HKWorkoutSession(activityType: HKWorkoutActivityType.crossTraining, locationType: HKWorkoutSessionLocationType.indoor)
     self.workoutSession?.delegate = self
     healthStore.start(self.workoutSession!)
     }
     
     func createHeartRateStreamingQuery(_ workoutStartDate: Date) -> HKQuery? {
     // adding predicate will not work
     // let predicate = HKQuery.predicateForSamplesWithStartDate(workoutStartDate, endDate: nil, options: HKQueryOptions.None)
     
     guard let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate) else { return nil }
     
     let heartRateQuery = HKAnchoredObjectQuery(type: quantityType, predicate: nil, anchor: anchor, limit: Int(HKObjectQueryNoLimit)) { (query, sampleObjects, deletedObjects, newAnchor, error) -> Void in
     guard let newAnchor = newAnchor else {return}
     self.anchor = newAnchor
     self.updateHeartRate(sampleObjects)
     }
     
     heartRateQuery.updateHandler = {(query, samples, deleteObjects, newAnchor, error) -> Void in
     self.anchor = newAnchor!
     self.updateHeartRate(samples)
     }
     return heartRateQuery
     }
     
     func updateHeartRate(_ samples: [HKSample]?) {
     guard let heartRateSamples = samples as? [HKQuantitySample] else {return}
     
     DispatchQueue.main.async {
     guard let sample = heartRateSamples.first else{return}
     let value = sample.quantity.doubleValue(for: self.heartRateUnit)
     self.label.setText(String(UInt16(value)))
     
     // retrieve source from sample
     let name = sample.sourceRevision.source.name
     self.updateDeviceName(name)
     self.animateHeart()
     }
     }
     
     func updateDeviceName(_ deviceName: String) {
     deviceLabel.setText(deviceName)
     }
     
     func animateHeart() {
     self.animate(withDuration: 0.5) {
     self.heart.setWidth(60)
     self.heart.setHeight(90)
     }
     
     let when = DispatchTime.now() + Double(Int64(0.5 * double_t(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
     let queue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
     queue.asyncAfter(deadline: when) {
     DispatchQueue.main.async(execute: {
     self.animate(withDuration: 0.5, animations: {
     self.heart.setWidth(50)
     self.heart.setHeight(80)
     })
     })
     }
     }
 */
    }

