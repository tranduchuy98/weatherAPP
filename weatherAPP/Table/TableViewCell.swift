//
//  TableViewCell.swift
//  weatherAPP
//
//  Created by Huy on 4/13/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var nhietDo: UILabel!
    @IBOutlet weak var imagee: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
