//
//  ContactTableViewCell.swift
//  ContactCRUDApp
//
//  Created by Muhammad Rajab Priharsanto on 20/05/20.
//  Copyright © 2020 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell
{
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var contactPhoto: UIImageView!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
