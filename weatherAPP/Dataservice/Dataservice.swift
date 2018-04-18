//
//  Dataservice.swift
//  weatherAPP
//
//  Created by Huy on 4/13/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import Foundation
import  UIKit
class Dataservice {
    static let shared: Dataservice = Dataservice()
    var iconSetBackgound: String?
    var arrWeather: [WeatherDay] = []
    var arrColectionView: [List] = []
    func getDataAPI(complete: @escaping (Weather)->Void) {
        let urlString = "https://api.apixu.com/v1/forecast.json?key=fe5d02d695944feca8292137181204&q=Hanoi&days=7&lang=vi"
        let urlString24Hour = "http://api.openweathermap.org/data/2.5/forecast?q=Hanoi&APPID=26f5c851bec66e093e6dd6919008f381"
        guard let requestURL = URL(string: urlString) else {return}
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
                guard error == nil else {return}
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) else {return}
                guard let jsonObj = json as? DICT else {return}
                guard let weather = Weather(dict: jsonObj) else {return}
                DispatchQueue.main.async {
                    complete(weather)
                }
            }.resume()
        }
    }
    
    func getDataAPI24Hour(complete: @escaping (Weather24Hour)->Void) {
        let urlString = "http://api.openweathermap.org/data/2.5/forecast?q=Hanoi&APPID=26f5c851bec66e093e6dd6919008f381"
        guard let requestURL = URL(string: urlString) else {return}
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
                guard error == nil else {return}
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) else {return}
                guard let jsonObj = json as? DICT else {return}
                guard let weather = Weather24Hour(dict: jsonObj) else {return}
                DispatchQueue.main.async {
                    complete(weather)
                }
                }.resume()
        }
    }
    

    
    
    func setBacgoundDay() -> UIImage {
        if iconSetBackgound == "//cdn.apixu.com/weather/64x64/day/296.png" ?? "//cdn.apixu.com/weather/64x64/day/356.png" ?? "//cdn.apixu.com/weather/64x64/day/353.png" ?? "//cdn.apixu.com/weather/64x64/day/299.png" ?? "//cdn.apixu.com/weather/64x64/day/358.png" ?? "//cdn.apixu.com/weather/64x64/day/305.png" ?? "//cdn.apixu.com/weather/64x64/day/176.png"{return UIImage(named: "troiMua")!}
        else{if iconSetBackgound == "//cdn.apixu.com/weather/64x64/day/143.png" ?? "//cdn.apixu.com/weather/64x64/day/200.png"  ?? "//cdn.apixu.com/weather/64x64/day/112.png" {return UIImage(named: "AmU")!}
        else {if iconSetBackgound == "//cdn.apixu.com/weather/64x64/day/116.png" ?? "//cdn.apixu.com/weather/64x64/day/113.png" {return UIImage(named: "troiNang")!}}
        }
        return UIImage(named: "dem")!
    }
    
    
}

