//
//  HorarioDeDonacion.swift
//  donantes
//
//  Created by Diego on 24/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import Foundation
import Parse

class HorarioDeDonacion: NSObject {
    
    var fechaInicio : NSDate?
    var fechaFin : NSDate?
    var horaInicio : NSDate?
    var horaFin : NSDate?
    private var stringFechaInicio : String?
    private var stringFechaFin : String?
    private var stringHoraInicio : String?
    private var stringHoraFin : String?
    
    init (parseObject : PFObject) {
//        print(parseObject)
        stringFechaInicio = parseObject["FechaInicio"] as? String
        stringFechaFin = parseObject["FechaFin"] as? String
        stringHoraInicio = parseObject["Horario"] as? String
        stringHoraFin = parseObject["Horario"] as? String
    }
}
