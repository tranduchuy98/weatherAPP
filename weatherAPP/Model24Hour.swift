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
  
    
    
    
}

class List {
    var temp: Double
    
    init?(dict: DICT) {
        guard let main = dict["main"] as? DICT else {return nil}
        guard let temp = main["temp"] as? Double else {return nil}
        self.temp = temp
    }
}


