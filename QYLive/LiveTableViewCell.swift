//
//  LiveTableViewCell.swift
//  QYLive
//
//  Created by Apple on 2017/2/18.
//  Copyright © 2017年 乔布永. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {

  

    @IBOutlet weak var imgPor: UIImageView!
    @IBOutlet weak var labelNick: UILabel!
    @IBOutlet weak var LabelViewers: UILabel!
    @IBOutlet weak var labelAddr: UILabel!
    @IBOutlet weak var libAddr: UIImageView!
    @IBOutlet weak var imgBig: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
