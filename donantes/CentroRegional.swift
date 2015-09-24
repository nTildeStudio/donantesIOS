//
//  CentroRegional.swift
//  donantes
//
//  Created by Diego on 17/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit
import Parse
import MapKit
/// Clase que contiene la información de un Centro de donación
class CentroRegional: NSObject, MKAnnotation {

    /// Coordenadas del Centro de Donación
    var coordinate: CLLocationCoordinate2D
    var title : String? {
        return nombre
    }
    var subtitle : String? {
        return descripcion
    }
    
 /// Nombre del Centro
    var nombre : String?
 /// Dirección del Centro
    var direccion : String?
    /// Descripción del Centro
    var descripcion : String?
    /// Teléfono del Centro
    var telefono : String?
    /// Web del Centro
    var web : String?
    /// Identificador del objeto dentro de la BD de Parse
    var identifier : String?
    
   
    
    
    init (name : String, address : String) {
        nombre = name
        direccion = address
        descripcion = ""
        telefono = ""
        web = ""
        identifier = ""
        coordinate = CLLocationCoordinate2DMake(0.0, 0.0)
    }
    
    init (name : String, address : String, description : String, phone : String, webPage : String) {
        nombre = name
        direccion = address
        descripcion = description
        telefono = phone
        web = webPage
        identifier = ""
        coordinate = CLLocationCoordinate2DMake(0.0, 0.0)
    }
    
    init (parseObject : PFObject) {
        identifier = parseObject.objectId
        nombre = parseObject["Nombre"] as? String
        direccion = parseObject["Direccion"] as? String
        telefono = parseObject["Telefono"] as? String
        web = parseObject["Web"] as? String
        descripcion = parseObject["Descripcion"] as? String
        let cord = parseObject["Ubicacion"] as! PFGeoPoint
                coordinate = CLLocationCoordinate2DMake(cord.latitude, cord.longitude)
    }
    

}
