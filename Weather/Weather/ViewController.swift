//
//  ViewController.swift
//  Weather
//
//  Created by admin on 2022/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapFetchWeatherButton(_ sender: Any) {
        if let cityName = self.cityNameTextField.text{
            self.getCurrentWeather(cityname: cityName)
            self.view.endEditing(true)
        }
    }
    
    func getCurrentWeather(cityname : String){
        guard let url = URL(string: "api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=6201b871893500eb044d2171ed1e1768") else {return}
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url, completionHandler: {
            data, response, error in
            guard let data = data , error == nil else {return}
            let decoder = JSONDecoder()
            let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data)
            debugPrint(weatherInformation)
        }).resume()
    }
}

