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
    @IBOutlet var doubleTap: UITapGestureRecognizer!
    fileprivate lazy var weatherManager = WeatherManager()
    
    lazy var locationManager = CLLocationManager()
    
    var isDoubleTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthorizationStatus()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        isDoubleTapped = true
    }
    
}

extension ViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}

extension ViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
        guard isDoubleTapped else {
            return
        }
        
        isDoubleTapped = false
        weatherManager.downloadWeatherData(type: .geoLocation(mapView.region.center.latitude,
                                                              mapView.region.center.longitude)) { [weak self] result in
                                                                switch result {
                                                                case .success(let weather):
                                                                    self?.performSegue(withIdentifier: "WeatherInfo", sender: nil)
                                                                case .failure(let error):
                                                                    print("Display error")
                                                                    
                                                                }
        }
    }
    
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let mapRegion = MKCoordinateRegion(center:  mapView.userLocation.coordinate,
                                           span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))
        mapView.setRegion(mapRegion, animated: true)

    }
}


