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
    var currentLocation = CLLocationCoordinate2D()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthorizationStatus()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: mapView)
        currentLocation = mapView.convert(point, toCoordinateFrom: mapView)
        Loader.show()
        weatherManager.loadWeather(latitude: currentLocation.latitude, longitude: currentLocation.longitude) { [weak self] result in
            Loader.dismiss()
            switch result {
            case .success:
                self?.performSegue(withIdentifier: "WeatherInfo", sender: nil)
            case .failure:
                // TODO: Need to Display error properly
                print("Display error")
                
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case is WeatherInfoViewController:
            let weatherInfo = segue.destination as! WeatherInfoViewController
            weatherInfo.weather = weatherManager.locationsWeather[geoCode()]
        default:
            break
        }
    }
}

// MARK: - UIGestureRecognizerDelegate

extension ViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

// MARK: - MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    
    public func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let mapRegion = MKCoordinateRegion(center:  mapView.userLocation.coordinate,
                                           span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0))
        mapView.setRegion(mapRegion, animated: true)
        
    }
    
    func geoCode() -> String {
        return weatherManager.query(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
    }
}


