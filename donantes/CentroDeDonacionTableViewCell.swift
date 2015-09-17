//
//  CentroDeDonacionTableViewCell.swift
//  donantes
//
//  Created by Diego on 17/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit

/// Celda para mostrar la información de un centro de donación
class CentroDeDonacionTableViewCell: UITableViewCell {

    //MARK: Outlets
    /// Label que muestra el nombre del Centro
    @IBOutlet weak var labelNombreCentroDonacion: UILabel!
    /// Label que muestra la dirección del Centro
    @IBOutlet weak var labelDireccionCentroDonacion: UILabel!
    /// Label que muestra la distancia al Centro
    @IBOutlet weak var labelDistancia: UILabel!
    
// MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
