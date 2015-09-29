//
//  HorarioDeDonacion.swift
//  donantes
//
//  Created by Diego on 24/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import Foundation
import Parse

// MARK: - Extensión de NSDate para simplificar el trabajo con fechas
extension NSDate
{
    convenience
    init(dateString:String) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateStringFormatter.locale = NSLocale.currentLocale()
        let d = dateStringFormatter.dateFromString(dateString)!
        self.init(timeInterval:0, sinceDate:d)
    }
    func dateWithOutTime() -> NSDate {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale.currentLocale()
        var d = dateStringFormatter.stringFromDate(self)
        dateStringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        d = d+" 00:00"
        return dateStringFormatter.dateFromString(d)!
    }
    
    func dateWithEndOfDayTime() -> NSDate {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale.currentLocale()
        var d = dateStringFormatter.stringFromDate(self)
        dateStringFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        d = d+" 23:59"
        return dateStringFormatter.dateFromString(d)!
    }
    func hour()->Int {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "HH"
        dateStringFormatter.locale = NSLocale.currentLocale()
        let d = dateStringFormatter.stringFromDate(self)
        return Int(d)!
    }
    func minute()->Int {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "mm"
        dateStringFormatter.locale = NSLocale.currentLocale()
        let d = dateStringFormatter.stringFromDate(self)
        return Int(d)!
    }
    func dayName()->String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "dd/MM"
        dateStringFormatter.locale = NSLocale.currentLocale()
        let d = dateStringFormatter.stringFromDate(self)
        return d
    }
    
    func isGreaterThanDate(dateToCompare : NSDate) -> Bool
    {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
        {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    
    func isLessThanDate(dateToCompare : NSDate) -> Bool
    {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
        {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    
    func isEqualTo(dateToCompare : NSDate) -> Bool
    {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedSame
        {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func isInside(initialDate iDate : NSDate, finalDate fDate : NSDate) -> Bool {
        return (isGreaterThanDate(iDate) && isLessThanDate(fDate))
    }
    
}

class HorarioDeDonacion: NSObject {
    
    var fechaInicio : NSDate?
    var fechaFin : NSDate?
    var horaInicio : NSDate?
    var horaFin : NSDate?
    
    /// Identificador del objeto dentro de la BD de Parse
    var identifier : String?
    /// Objeto de parse en base al que se construye el objeto
    var parseObject : PFObject?
    
     var stringFechaInicio : String!
     var stringFechaFin : String!
    private var stringHoraInicio : String!
    private var stringHoraFin : String!
    var stringHorario : String!
    
    init (parseObject : PFObject) {
        self.parseObject = parseObject
        identifier = parseObject.objectId

        fechaInicio = parseObject["FechaInicio"] as? NSDate
        fechaFin = parseObject["FechaFin"] as? NSDate
        horaInicio = parseObject["FechaInicio"] as? NSDate
        horaFin = parseObject["FechaFin"] as? NSDate
        stringFechaInicio = fechaInicio?.dayName()
                stringFechaFin = fechaFin?.dayName()
                stringHorario = parseObject["Horario"] as! String
        stringHoraInicio = parseObject["Horario"] as! String
        stringHoraFin = parseObject["Horario"] as! String

    }
}
