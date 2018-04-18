//
//  Model24Hour.swift
//  weatherAPP
//
//  Created by Huy on 4/16/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import Foundation
import UIKit

class Weather24Hour {

    var arrWeather24hour: [List] = []
   // var arrList24hour: [WeatherList] = []
    init?(dict: DICT) {
        guard let list = dict["list"] as? [DICT] else {return nil}
        for obj in list {
            if let temp = List(dict: obj){
                arrWeather24hour.append(temp)
            }
        }

    }
    
    

}

class List {
    var temp: Double
    var dt_txt: String
    var main: String
    var icon: String
    init?(dict: DICT) {
        guard let mainDict = dict["main"] as? DICT else {return nil}
        guard let dt_txt = dict["dt_txt"] as? String else {return nil}
        guard let temp = mainDict["temp"] as? Double else {return nil}
        guard let weather = dict["weather"] as? [DICT] else {return nil}
        guard let main = weather[0]["main"] as? String else {return nil}
        guard let icon = weather[0]["icon"] as? String else {return nil}
        self.temp = temp
        self.dt_txt = dt_txt
        self.main = main
        self.icon = icon
        
    }
}



