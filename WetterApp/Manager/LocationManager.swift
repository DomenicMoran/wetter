//
//  LocationManager.swift
//  WetterApp
//
//  Created by Domenic Moran on 26.08.22.
//

import Foundation
import CoreLocation


// create the class conform to protocol
// NSObject, ObserveableObject, ClLocationManagerDelegate
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // create new instance of CLLocationManagerDelegate
    let manager = CLLocationManager()
    
    // create location and loading state
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
