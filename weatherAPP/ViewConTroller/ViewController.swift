//
//  ViewController.swift
//  weatherAPP
//
//  Created by Huy on 4/13/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var colectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinDer: UIActivityIndicatorView!
    @IBOutlet weak var textToday: UILabel!
    @IBOutlet weak var textDetaill: UILabel!
    @IBOutlet weak var textDetail: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var ciTy: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    
    var b: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        spinDer.startAnimating()
        
        
        //        countTy.text = " Thứ \(Calendar.current.component(.weekday, from: NSDate(timeIntervalSince1970:datasource.weatherdays[0].date_epoch) as Date))"
        // Do any additional setup after loading the view, typically from a nib.
        //        tableView.dataSource = datasource
        //        tableView.delegate = delegate
        
        tableView.separatorStyle = .none
        
        Dataservice.shared.getDataAPI {[unowned self] weather in
            Dataservice.shared.arrWeather = weather.weatherdays
            let url = URL(string: "http:\(weather.icon)")
            let data = try? Data(contentsOf: url!)
            let iconImage = UIImage(data: data!)
            self.ciTy.text = "Hà Nội"
            self.imageIcon.image = iconImage
            self.textDetail.text = "\(weather.tem_c)℃"
            self.textToday.text = weather.text
            Dataservice.shared.iconSetBackgound = weather.icon
            self.backgroundImage.image = Dataservice.shared.setBacgoundDay()
            Dataservice.shared.getDataAPI24Hour {[unowned self] (weather) in
                Dataservice.shared.arrColectionView = weather.arrWeather24hour
                self.colectionView.reloadData()
            }
            self.tableView.reloadData()
            self.spinDer.stopAnimating()
            
            
        }
        
        
        
    }
    
}

extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Dataservice.shared.arrColectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell
        var dt_txt2 = Dataservice.shared.arrColectionView[indexPath.row].dt_txt
        cell.dayColection.text = "\(dt_txt2)"
        cell.tempColection.text = "\(Dataservice.shared.arrColectionView[indexPath.row].temp - 273)℃"
        cell.txtColectionView.text = Dataservice.shared.arrColectionView[indexPath.row].main
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate , UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dataservice.shared.arrWeather.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.time.text = Dataservice.shared.arrWeather[indexPath.row].date_epoch.dayWeek(identifier: "VI")
        cell.nhietDo.text = "\(Dataservice.shared.arrWeather[indexPath.row].avgtemp_c) ℃"
        cell.detailText.text = "\(Dataservice.shared.arrWeather[indexPath.row].text)"
        cell.imagee.download(from: "http:\(Dataservice.shared.arrWeather[indexPath.row].icon)")
        
        return cell
    }
}

