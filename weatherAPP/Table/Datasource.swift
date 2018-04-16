//
//  Datasource.swift
//  weatherAPP
//
//  Created by Huy on 4/13/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import Foundation
import UIKit
class Datasource: NSObject, UITableViewDataSource {
    // var weatherdays: [WeatherDay] = Dataservice.shared.arrWeather
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dataservice.shared.arrWeather.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.time.text = Dataservice.shared.arrWeather[indexPath.row].date_epoch.dayWeek(identifier: "VI")
        cell.nhietDo.text = "\(Dataservice.shared.arrWeather[indexPath.row].avgtemp_c) ℃"
        cell.detailText.text = "\(Dataservice.shared.arrWeather[indexPath.row].date)"
        cell.imagee.download(from: "http:\(Dataservice.shared.arrWeather[indexPath.row].icon)")
        
        return cell
    }
}
