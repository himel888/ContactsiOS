//
//  ConatctTableViewCell.swift
//  PracticeCoreData
//
//  Created by Mr. Hasan on 10/2/18.
//  Copyright © 2018 kazi. All rights reserved.
//

import UIKit

class ConatctTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var eMail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
