//
//  ViewController.swift
//  BeaconTracker
//
//  Created by admin on 2/20/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let locationManager: CLLocationManager = CLLocationManager()
    var beaconsToMonitor: [CLBeaconRegion] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        
        if let uuid = UUID(uuidString: "2f234454-cf6d-4a0f-adf2-f4911ba9ffa6"){
            let beaconRegion = CLBeaconRegion(
                proximityUUID: uuid,
                major: 1,
                minor: 3,
                identifier: "iBeacon")
            locationManager.startMonitoring(for: beaconRegion)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if let beaconRegion = region as? CLBeaconRegion {
            print("DID ENTER REGION: uuid: \(beaconRegion.proximityUUID.uuidString)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if let beaconRegion = region as? CLBeaconRegion {
            print("DID EXIT REGION: uuid: \(beaconRegion.proximityUUID.uuidString)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("Started Monitoring Successfully!")
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("Error monitoring: \(error.localizedDescription)")
    }


}

