//
//  PuntoDeDonacion.swift
//  donantes
//
//  Created by Diego on 24/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import Foundation
import Parse
import MapKit

/// Objeto del modelo de datos utilizado para almacenar la información de un punto de donación
class PuntoDeDonacion: NSObject, MKAnnotation {
    
    /// Coordenadas del Punto de Donación
    var coordinate: CLLocationCoordinate2D
    var title : String? {
        return nombre
    }
    var subtitle : String? {
        return direccion
    }
    
    /// Direccion del punto de donación
    var direccion : String?
    /// Nombre del punto de donación
    var nombre : String?
    /// Teléfono del punto de donación
    var telefono : String?
    /// Identificador del objeto dentro de la BD de Parse
    var identifier : String?
    /// Objeto de parse en base al que se construye el objeto
    var parseObject : PFObject?
    
    var arrayHorarios : [HorarioDeDonacion] = []
    
    init (parseObject : PFObject) {
        self.parseObject = parseObject
        identifier = parseObject.objectId
        nombre = parseObject["Nombre"] as? String
        direccion = parseObject["Direccion"] as? String
        telefono = parseObject["Telefono"] as? String
        let cord = parseObject["Ubicacion"] as! PFGeoPoint
        coordinate = CLLocationCoordinate2DMake(cord.latitude, cord.longitude)
        super.init()
        APIParseCommunicator.getListOfHorariosDeDonacionInBackground(self) { (result) -> Void in
            self.arrayHorarios = result
        }
    }
}
