//
//  Model.swift
//  weatherAPP
//
//  Created by Huy on 4/13/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import Foundation

typealias DICT = Dictionary<AnyHashable, Any>

class Weather {
    var name: String
    var country: String
    var icon: String
    var tem_c: Double
    var text: String
    var weatherdays: [WeatherDay] = []
    
    init?(dict: DICT) {
        guard let location = dict["location"] as? DICT else {return nil}
        guard let name = location["name"] as? String else {return nil}
        guard let country = location["country"] as? String else {return nil}
        guard let forecast = dict["forecast"] as? DICT else {return nil}
        guard let forecastday = forecast["forecastday"] as? [DICT] else {return nil}
        guard let current = dict["current"] as? DICT else {return nil}
        guard let condition = current["condition"] as? DICT else {return nil}
        guard let tem_c = current["temp_c"] as? Double else {return nil}
        guard let icon = condition["icon"] as? String else {return nil}
       guard let text = condition["text"] as? String else {return nil}
        for dayObj in forecastday {
            if let day = WeatherDay(dict: dayObj) {
                weatherdays.append(day)
            }
        }
        self.name = name
        self.country = country
        self.icon = icon
        self.tem_c = tem_c
        self.text = text
    }
}

class WeatherDay {
    var date_epoch: TimeInterval
    var avgtemp_c: Double
    var text: String
    var icon: String
    var date: String
    init?(dict: DICT) {
        guard let date_epoch = dict["date_epoch"] as? TimeInterval else {return nil}
        guard let day = dict["day"] as? DICT else {return nil}
        guard let date = dict["date"] as? String else {return nil}
        guard let avgtemp_c = day["avgtemp_c"] as? Double else {return nil}
        guard let condition = day["condition"] as? DICT else {return nil}
        guard let text = condition["text"] as? String else {return nil}
        guard let icon = condition["icon"] as? String else {return nil}
        self.date_epoch = date_epoch
        self.avgtemp_c = avgtemp_c
        self.text = text
        self.icon = icon
        self.date = date
    }
    
}
