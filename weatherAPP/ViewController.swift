//
//  ViewController.swift
//  weatherAPP
//
//  Created by Huy on 4/13/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinDer: UIActivityIndicatorView!
    
    @IBOutlet weak var textDetaill: UILabel!
    @IBOutlet weak var textDetail: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var ciTy: UILabel!

    @IBOutlet weak var imageIcon: UIImageView!
    
    var datasource = Datasource()
    var delegate = Delegate()
    var b: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        spinDer.startAnimating()
        
        //        countTy.text = " Thứ \(Calendar.current.component(.weekday, from: NSDate(timeIntervalSince1970:datasource.weatherdays[0].date_epoch) as Date))"
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = datasource
        tableView.delegate = delegate
        tableView.separatorStyle = .none
        
        Dataservice.shared.getDataAPI {[unowned self] weather in
            Dataservice.shared.arrWeather = weather.weatherdays
            let url = URL(string: "http:\(weather.icon)")
            let data = try? Data(contentsOf: url!)
            let iconImage = UIImage(data: data!)
            self.ciTy.text = "Hà Nội"
            self.imageIcon.image = iconImage
            self.textDetail.text = "\(weather.tem_c)℃"
         //   self.textDetaill.text = weather.text
            Dataservice.shared.iconSetBackgound = weather.icon
            self.backgroundImage.image = Dataservice.shared.setBacgoundDay()
            self.tableView.reloadData()
            self.spinDer.stopAnimating()
            
        }
        
        Dataservice.shared.getDataAPI24Hour { (weather) in
            print(weather.arrWeather24hour[1].main)
        }
        
    }
    
}

