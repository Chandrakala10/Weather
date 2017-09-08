//
//  WeatherInfoViewController.swift
//  Weather
//
//  Created by Chandrakala Neerukonda on 9/8/17.
//  Copyright © 2017 Chandrakala Neerukonda. All rights reserved.
//

import UIKit

class WeatherInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
