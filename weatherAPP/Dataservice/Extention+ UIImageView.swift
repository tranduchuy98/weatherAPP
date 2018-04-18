//
//  Extention+ UIImage.swift
//  weatherAPP
//
//  Created by Huy on 4/16/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit
extension UIImageView {
    func download(from urlString: String) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data)
                    }
                }
            }
        }
    }
}
