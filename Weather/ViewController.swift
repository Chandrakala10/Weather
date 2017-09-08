//
//  ViewController.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    fileprivate lazy var weatherManager = WeatherManager()
    
    lazy var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestForCurrentLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func requestForCurrentLocation(){
        let authorizationStatus = CLLocationManager.authorizationStatus()
        
        if (authorizationStatus == .denied) {
           locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool){
        weatherManager.downloadWeatherData(type: .geoLocation(mapView.region.center.latitude, mapView.region.center.longitude)) { weather in
            
        }
    }
    
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let mapRegion = MKCoordinateRegion(center:  mapView.userLocation.coordinate,
                                           span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        mapView.setRegion(mapRegion, animated: true)
    }
}


