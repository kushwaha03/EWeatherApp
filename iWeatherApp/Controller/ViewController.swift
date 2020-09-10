//
//  ViewController.swift
//  iWeatherApp
//
//  Created by Krishna Kushwaha on 10/09/20.
//  Copyright © 2020 Krishna Kushwaha. All rights reserved.
//

import UIKit
import Network
class ViewController: UIViewController {

    
    let monitor = NWPathMonitor()

    var isoffline = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         let queue = DispatchQueue(label: "Monitor")
         monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
                self.isoffline = false
            } else {
                print("No connection.")
                self.isoffline = true
            }

            print(path.isExpensive)
        }

    }

    @IBAction func onClickCity(_ sender: UIButton) {
        guard let weatherV = self.storyboard?.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { return  }
        if sender.tag == 0 {
        weatherV.city = "London"
        } else if sender.tag == 1 {
            weatherV.city = "Bengaluru"

        }
        weatherV.isoffline = isoffline
        self.navigationController?.pushViewController(weatherV, animated: true)
              
    }
    
}

