//
//  AlarmTableViewCell.swift
//  Budzik
//
//  Created by Miguel Pelayo Mercado Caram on 4/11/21.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var alarmBgImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
