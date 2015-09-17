//
//  CentroDeDonacion.swift
//  donantes
//
//  Created by Diego on 17/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit

/// Clase que contiene la información de un Centro de donación
class CentroDeDonacion: NSObject {
    
 /// Nombre del Centro
    var nombre : String?
 /// Dirección del Centro
    var direccion : String?
   
    init (name : String, address : String) {
        nombre = name
direccion = address
    }
}
