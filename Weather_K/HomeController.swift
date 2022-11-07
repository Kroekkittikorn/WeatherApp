//
//  ViewController.swift
//  Weather_K
//
//  Created by Kroekkittikorn Kawilo on 7/11/2565 BE.
//

import UIKit

class HomeViewModel {
    
    var weather: Weather?
    var forecast: Forecast?
    
    var dateno1: Int {
        return Int(forecast?.list[0].dt ?? 0)
    }
   
    var dateno2: Int {
        return Int(forecast?.list[8].dt ?? 0)
    }
    
    var dateno3: Int {
        return Int(forecast?.list[16].dt ?? 0)
    }
    
    var dateno4: Int {
        return Int(forecast?.list[24].dt ?? 0)
    }
    var dateno5: Int {
        return Int(forecast?.list[32].dt ?? 0)
    }
    
    var temperatureString: Double {
        return Double(weather?.main.temp ?? 0)
    }
    var humidityString: String{
        return String(weather?.main.humidity ?? 0)
    }
    
    var weatherCon: String{
        return String(weather?.weather[0].main ?? "")
    }
    
    var tempno1: Double{
        return Double(forecast?.list[0].main.temp ?? 0)
    }
    
    var tempno2: Double{
        return Double(forecast?.list[8].main.temp ?? 0)
    }
    
    var tempno3: Double{
        return Double(forecast?.list[16].main.temp ?? 0)
    }
    
    var tempno4: Double{
        return Double(forecast?.list[24].main.temp ?? 0)
    }
    
    var tempno5: Double{
        return Double(forecast?.list[32].main.temp ?? 0)
    }
    
    func fetchWeather(for cityId: Int = 1609350, _ completion: @escaping (() -> Void)){
        NetworkController.fetchWeather(for: cityId ) { weather in
            self.weather = weather
            completion()
            print(weather.weather[0].main)
            
        }
    }
    
    func fetchForecast(for cityId: Int = 1609350, _ completion: @escaping (() -> Void)){
        NetworkController2.fetchForecast(for: cityId) { forecast in
            self.forecast = forecast
            completion()
            print(forecast.list[20].main.temp)
        }
    }
}


class HomeController: UIViewController {
    private let viewModel = HomeViewModel()
    @IBOutlet weak var temperatueLabel: UILabel!
    @IBOutlet weak var ddate: UITextView!
    @IBOutlet weak var weathercondition: UITextView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var FButton: UIButton!
    @IBOutlet weak var Date1: UILabel!
    @IBOutlet weak var Date2: UILabel!
    @IBOutlet weak var Date3: UILabel!
    @IBOutlet weak var Date4: UILabel!
    @IBOutlet weak var Date5: UILabel!
    @IBOutlet weak var Temp1: UILabel!
    @IBOutlet weak var Temp2: UILabel!
    @IBOutlet weak var Temp3: UILabel!
    @IBOutlet weak var Temp4: UILabel!
    @IBOutlet weak var Temp5: UILabel!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var forecastButton: UIButton!
    @IBOutlet weak var ForecastView: UIView!
    override func viewDidLoad() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "BG")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        super.viewDidLoad()
        title = "Weather"
        viewModel.fetchWeather{ [weak self] in
            DispatchQueue.main.async {
                
                self?.setupUI()
            }
        }
        viewModel.fetchForecast {
        }
    }
    var buttonpressed = false
    @IBAction func press(_ sender: Any) {
        if buttonpressed == false{
            let fah = (viewModel.temperatureString - 273.15) * 9/5 + 32
            let convertfah: String = String(format: "%.0f", fah)
            temperatueLabel.text = "\(convertfah)°F"
            FButton.setTitle("C", for: .normal)
            buttonpressed = true
        }else{
            let cel = viewModel.temperatureString - 273.15
            let a: String = String(format: "%.0f", cel)
            temperatueLabel.text = "\(a)°C"
            FButton.setTitle("F", for: .normal)
            buttonpressed = false
        }
        
    }
    
    @IBAction func ForcastPressed(_ sender: Any) {
        let date = NSDate(timeIntervalSince1970: TimeInterval(viewModel.dateno1))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "E"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        Date1.text = ("\(dateString)")
        let cel1 = viewModel.tempno1 - 273.15
        let a: String = String(format: "%.0f", cel1)
        Temp1.text = "\(a)°C"
        //-------------
        let date2 = NSDate(timeIntervalSince1970: TimeInterval(viewModel.dateno2))
        let dayTimePeriodFormatter2 = DateFormatter()
        dayTimePeriodFormatter2.dateFormat = "E"
        let dateString2 = dayTimePeriodFormatter2.string(from: date2 as Date)
        Date2.text = ("\(dateString2)")
        let cel2 = viewModel.tempno2 - 273.15
        let b: String = String(format: "%.0f", cel2)
        Temp2.text = "\(b)°C"
        //--------------
        let date3 = NSDate(timeIntervalSince1970: TimeInterval(viewModel.dateno3))
        let dayTimePeriodFormatter3 = DateFormatter()
        dayTimePeriodFormatter3.dateFormat = "E"
        let dateString3 = dayTimePeriodFormatter3.string(from: date3 as Date)
        Date3.text = ("\(dateString3)")
        let cel3 = viewModel.tempno3 - 273.15
        let c: String = String(format: "%.0f", cel3)
        Temp3.text = "\(c)°C"
        //---------
        let date4 = NSDate(timeIntervalSince1970: TimeInterval(viewModel.dateno4))
        let dayTimePeriodFormatter4 = DateFormatter()
        dayTimePeriodFormatter4.dateFormat = "E"
        let dateString4 = dayTimePeriodFormatter4.string(from: date4 as Date)
        Date4.text = ("\(dateString4)")
        var cel4 = viewModel.tempno4 - 273.15
        let d: String = String(format: "%.0f", cel4)
        Temp4.text = "\(d)°C"
        //-----------
        let date5 = NSDate(timeIntervalSince1970: TimeInterval(viewModel.dateno5))
        let dayTimePeriodFormatter5 = DateFormatter()
        dayTimePeriodFormatter5.dateFormat = "E"
        let dateString5 = dayTimePeriodFormatter5.string(from: date5 as Date)
        Date5.text = ("\(dateString5)")
        var cel5 = viewModel.tempno5 - 273.15
        let e: String = String(format: "%.0f", cel5)
        Temp5.text = "\(e)°C"
        ForecastView.isHidden = false
        ForecastView.layer.shadowColor = UIColor.black.cgColor
        ForecastView.layer.shadowOpacity = 1
        ForecastView.layer.shadowOffset = .zero
        ForecastView.layer.shadowRadius = 50
    }
    
    
    @IBAction func BackForecast(_ sender: Any) {
        ForecastView.isHidden = true
    }
    
    
    @IBAction func cpress(_ sender: Any) {
        let cel = viewModel.temperatureString - 273.15
        let a: String = String(format: "%.0f", cel)
        temperatueLabel.text = "\(a)°C"
    }
    
    private func setupUI(){
        ForecastView.isHidden = true
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.string(from: date)
        let cel = viewModel.temperatureString - 273.15
        let a: String = String(format: "%.0f", cel)
        temperatueLabel.text = "\(a)°C"
        ddate.text = ("Humidity: \(viewModel.humidityString)")
        weathercondition.text = viewModel.weatherCon
        let wcon = viewModel.weatherCon
        if (wcon == "Clouds"){
            weatherImage.image = UIImage(systemName: "cloud")
        }
        else if (wcon == "Thunderstorm"){
            weatherImage.image = UIImage(systemName: "cloud.bolt.rain")
        }
        else if (wcon == "Drizzle"){
            weatherImage.image = UIImage(systemName: "cloud.drizzle")
        }
        else if (wcon == "Rain"){
            weatherImage.image = UIImage(systemName: "cloud.rain")
        }
        else if (wcon == "Snow"){
            weatherImage.image = UIImage(systemName: "cloud.snow")
        }
        else if (wcon == "Atmosphere"){
            weatherImage.image = UIImage(systemName: "cloud.fog")
        }
        else if (wcon == "Clear"){
            weatherImage.image = UIImage(systemName: "sun.max")
        }
        
       
    }

}

