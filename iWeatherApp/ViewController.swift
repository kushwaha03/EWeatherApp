//
//  ViewController.swift
//  iWeatherApp
//
//  Created by Krishna Kushwaha on 10/09/20.
//  Copyright © 2020 Krishna Kushwaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClickCity(_ sender: UIButton) {
        guard let weatherV = self.storyboard?.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { return  }
        if sender.tag == 0 {
        weatherV.city = "london"
        } else if sender.tag == 1 {
            weatherV.city = "bengaluru"

        }
        self.navigationController?.pushViewController(weatherV, animated: true)
              
    }
    
}

