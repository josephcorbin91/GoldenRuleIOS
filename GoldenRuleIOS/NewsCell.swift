//
//  NewsCell.swift
//  GoldenRuleIOS
//
//  Created by user132771 on 3/26/18.
//  Copyright © 2018 JohnTuttle. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var BodyLabel: UILabel!
    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
