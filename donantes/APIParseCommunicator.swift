//
//  APIParseCommunicator.swift
//  donantes
//
//  Created by Diego on 24/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import Foundation
import Parse

/// Clase ocupada de gestionar la comunicación con el API de Parse
class APIParseCommunicator : NSObject {
    
 
    /**
    Función que devuelve el listado de todos los Centros de Donación disponibles en la base de datos
    
    - parameter completion: devuelve un array de objetos "CentroRegional"
    */
    class func getListOfCentrosRegionalesInBackground( completion: (result: [CentroRegional]) -> Void) {
        
        let query = PFQuery(className:"CentrosRegionales")
        query.findObjectsInBackgroundWithBlock { (res : [PFObject]?, e: NSError?) -> Void in
            var toret : [CentroRegional] = []
            for object in res! {
                toret.append(CentroRegional(parseObject: object))
            }
            completion(result: toret)
        }
    }
    
    /**
    Función que devuelve un centro regional en base a su identificador
    
    - parameter centroRegionalIdentifier: Indentificador den centro regional a buscar
    - parameter completion:               Centro Regional correspondiente al ID especificado, en caso de no encontrar ninguno se devuelve "nil"
    */
    class func getCentroRegionaleInBackground(centroRegionalIdentifier : String, completion: (result: CentroRegional?) -> Void) {
        
        let query = PFQuery(className:"CentrosRegionales")
        query.getObjectInBackgroundWithId(centroRegionalIdentifier) {
            (res: PFObject?, error: NSError?) -> Void in
            if res == nil {
                completion(result: nil)
            } else {
                completion(result: CentroRegional(parseObject:res!))
            }
        }
    }
    
    
    /**
    Función que devuelve el listado de todos los puntos de donación asociados a un determinado Centro Regional
    
    - parameter centroRegional: Centro Regional del que se quieren obtener los puntos de donación
    - parameter completion:     Listado de Puntos de donación asociados al Centro Regional indicado
    */
    class func getListOfPuntosDeDonacionInBackground(centroRegional : CentroRegional ,completion: (result: [PuntoDeDonacion]) -> Void) {//)->[CentroRegional] {
        let query = PFQuery(className:"PuntosDeDonacion")
         query.whereKey("CentroRegional", equalTo:centroRegional.identifier!)
        query.findObjectsInBackgroundWithBlock { (res : [PFObject]?, e: NSError?) -> Void in
            var toret : [PuntoDeDonacion] = []
            for object in res! {
                toret.append(PuntoDeDonacion(parseObject: object))
            }
            completion(result: toret)
        }
    }
    
    class func getListOfHorariosDeDonacionInBackground(centroRegional : PuntoDeDonacion ,completion: (result: [HorarioDeDonacion]) -> Void) {//)->[CentroRegional] {
        let query = PFQuery(className:"HorariosDeDonacion")

        query.findObjectsInBackgroundWithBlock { (res : [PFObject]?, e: NSError?) -> Void in
        var toret : [HorarioDeDonacion] = []
            for object in res! {
                toret.append(HorarioDeDonacion(parseObject: object))
            }
                    completion(result: toret)
        }
        
    }
    
}