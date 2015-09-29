//
//  PuntoDeDonacionTableViewCell.swift
//  donantes
//
//  Created by Diego on 28/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import UIKit

class PuntoDeDonacionTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNombrePuntoDonacion: UILabel!
    
    @IBOutlet weak var labelDireccionPuntoDeDonacion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
