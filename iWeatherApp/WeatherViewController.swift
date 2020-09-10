//
//  WeatherViewController.swift
//  iWeatherApp
//
//  Created by Krishna Kushwaha on 10/09/20.
//  Copyright © 2020 Krishna Kushwaha. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var city = "london"
    @IBOutlet weak var cityLbl: UILabel!

    @IBOutlet weak var cctempLbl: UILabel!
    @IBOutlet weak var disLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var humidtyLbl: UILabel!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!

    @IBOutlet weak var lowtempLbl: UILabel!
      @IBOutlet weak var hightempLbl: UILabel!
    
    var weather = [Weather]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        navigationController?.title = "Weather"
        self.title = "Weather"
        getJSON()


    }
    
    
       func getJSON(){
        
           guard let gitUrl = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=30790b6843bea44e921e09de2bc595a5") else { return }
           
           URLSession.shared.dataTask(with: gitUrl) { (data, response
               
               , error) in
               
               guard let data = data else { return }
               
               
               do {
                   
                   let decoder = JSONDecoder()
                    let weatherModel = try? decoder.decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    
                    self.cityLbl.text = weatherModel?.name
                    self.disLbl.text = weatherModel?.weather[0].weatherDescription
                    if let degb = (weatherModel?.wind.deg),
                     let mainb = (weatherModel?.main.pressure),
                        let speedb =  (weatherModel?.wind.speed),
                        let humb = (weatherModel?.main.humidity),
                        let sunr =  (weatherModel?.sys.sunrise),
                        let suns = (weatherModel?.sys.sunset),
                        let lowt =  (weatherModel?.main.tempMin),
                        let hight = (weatherModel?.main.tempMax){
                         self.cctempLbl.text = String(degb) + "℃"
                        self.pressureLbl.text = "Pressure : " + String(mainb)
                        self.windLbl.text = "Wind : " + String(speedb)
                        self.humidtyLbl.text = "Humidity : " + String(humb)
                        self.sunriseLbl.text = "Sunrise : " + String(sunr)
                        self.sunsetLbl.text = "Sunset : " + String(suns)
                        self.lowtempLbl.text = "Low : " + String(lowt)
                        self.hightempLbl.text = "High : " + String(hight)

                    }
               
                   }
    
               } catch let err {
                   
                   print("Err", err)
                   
               }
               
           }.resume()
           
       }
       
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
