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
    
    @IBOutlet weak var weatherStackView: UIStackView!
    
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
    func configureView(weatherInformation : WeatherInformation){
        self.cityName.text = weatherInformation.name
        if let weather = weatherInformation.weather.first{
            self.weatherDescription.text = weather.description
        }
        self.temp.text = "\(Int(weatherInformation.temp.temp - 273.15))℃"
        self.minTemp.text = "최저: \(Int(weatherInformation.temp.minTemp - 273.15))℃"
        self.maxTemp.text = "최고: \(Int(weatherInformation.temp.maxTemp - 273.15))℃"
    }
    
    func showAlert(message : String){
        let alert  = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getCurrentWeather(cityname : String){
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityname)&appid=6201b871893500eb044d2171ed1e1768") else {return}
        let session = URLSession(configuration: .default)
        session.dataTask(with: url){
            [weak self] data, response, error in
            guard let data = data , error == nil else {return}
            guard let weatherInformation = try? JSONDecoder().decode(WeatherInformation.self, from: data) else {return}
            
            if let response = response as? HTTPURLResponse, response.statusCode < 300 && response.statusCode >= 200{ // response를 HTTPURLResponse로 다운캐스팅 해서, 200~299의 값을 status로 가지는지 확인
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInformation: weatherInformation)
                }
            }
            else{
                guard let errorMessage = try? JSONDecoder().decode(ErrorMessage.self, from: data) else {return}
                DispatchQueue.main.async {
                    self?.showAlert(message: errorMessage.message)
                }
            }
            
            
        }.resume()
    }
}

