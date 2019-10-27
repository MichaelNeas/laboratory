//
//  ViewController.swift
//  Beacons
//
//  Created by Michael Neas on 10/27/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var distanceReading: UILabel!
    var locationManager: CLLocationManager?
    var hasDetectedABeacon = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        // non-blocking
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .gray
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            // can we detect if a beacon is available or not
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                // can we detect how far away the beacon is
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-4814-09E77F6B7E5")!
        let beaconRegion = CLBeaconRegion(uuid: uuid, major: 123, minor: 456, identifier: "MyBeacon")
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(in: beaconRegion)
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
            switch distance {
            case .far:
                self.view.backgroundColor = .blue
                self.distanceReading.text = "FAR"
            case .near:
                self.view.backgroundColor = .orange
                self.distanceReading.text = "NEAR"
            case .immediate:
                self.view.backgroundColor = .red
                self.distanceReading.text = "RIGHT HERE"
            default:
                self.view.backgroundColor = .gray
                self.distanceReading.text = "UNKNOWN"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
            if !hasDetectedABeacon {
                let ac = UIAlertController(title: "Found one!", message: "You have found a beacon", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
                present(ac, animated: true)
                hasDetectedABeacon = true
            }
        } else {
            update(distance: .unknown)
        }
    }

}

