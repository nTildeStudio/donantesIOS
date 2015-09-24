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
    class func getListOfPuntosDeDonacionInBackground(centroRegional : CentroRegional ,completion: (result: [PuntoDeDonacion]) -> Void) {//)->[CentroRegional] {
        let query = PFQuery(className:"PuntosDeDonacion")
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
        
//        var arrayResults : [PFObject] = []
//        do {
//            try arrayResults = query.findObjects()
//            
//            
//        } catch {
//            print("Error obteniendo datos de Parse")
//        }
//        let test =
        query.findObjectsInBackgroundWithBlock { (res : [PFObject]?, e: NSError?) -> Void in
        var toret : [HorarioDeDonacion] = []
            for object in res! {
                toret.append(HorarioDeDonacion(parseObject: object))
            }
                    completion(result: toret)
        }
//        var toret : [HorarioDeDonacion] = []
//        
//        for object in arrayResults {
//            toret.append(HorarioDeDonacion(parseObject: object))
//        }
//        
//        completion(result: toret)
    }
//    func hardProcessingWithString(input: String, completion: (result: String) -> Void) {
//
//            completion(result: "we finished!")
//    }
//    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
//        var runningTotal = 0
//        func incrementer() -> Int {
//            runningTotal += amount
//            return runningTotal
//        }
//        return incrementer
//    }
    
    
}