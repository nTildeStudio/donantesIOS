//
//  AppInfo.swift
//  donantes
//
//  Created by Diego on 24/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import Foundation

let IDENTIFICADOR_CENTRO_REGIONAL_SELECCIONADO = "IndentificadorCentroRegionalSeleccionado"
let IDENTIFICADOR_DONANTE = "IndentificadorDonante"
let GRUPO_SANGUINEO_DONANTE = "GrupoSanguineo"

/// Objeto singleton utilizado para almacenar y gestionar toda la información común a la APP.
class AppInfo: NSObject {
    /// Nos devuelve la instancia del Singleton
    static let sharedInstance = AppInfo()
    
    /// Centro Regional en base al que está configurado la APP
    var centroRegional : CentroRegional?
    
    
    private var _identificadorDonante : String?
    /// Identificador del donante que utiliza la APP. No es un valor obligatorio
    var identificadorDonante : String? {
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(IDENTIFICADOR_DONANTE)
        }
        set {
            self._identificadorDonante = newValue
            NSUserDefaults.standardUserDefaults().setValue(newValue, forKey: IDENTIFICADOR_DONANTE)
        }
    }
    
        /// Tipo del grupo sanguineo donante que utiliza la APP. No es un valor obligatorio
    private var _grupoSanguineoDonante : String?
    var grupoSanguineoDonante : String? {
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(GRUPO_SANGUINEO_DONANTE)
        }
        set {
            self._grupoSanguineoDonante = newValue
            NSUserDefaults.standardUserDefaults().setValue(newValue, forKey: GRUPO_SANGUINEO_DONANTE)
        }
    }
        /// Identificador del centro regional sobre el que está configurado la APP. Puede ser utilizado para recuperar, en base al mismo, el resto de información de dicho centro regional
    private var _identificadorCentroRegional : String?
    var identificadorCentroRegional : String? {
        get {
            return NSUserDefaults.standardUserDefaults().stringForKey(IDENTIFICADOR_CENTRO_REGIONAL_SELECCIONADO)
        }
        set {
            self._identificadorCentroRegional = newValue
            NSUserDefaults.standardUserDefaults().setValue(newValue, forKey: IDENTIFICADOR_CENTRO_REGIONAL_SELECCIONADO)
        }
    }
    
    /**
    Inicializador privado de la clase
    
    - returns: Objeto de la clase
    */
    private override init() {
        _identificadorCentroRegional = NSUserDefaults.standardUserDefaults().stringForKey(IDENTIFICADOR_CENTRO_REGIONAL_SELECCIONADO)
           _grupoSanguineoDonante = NSUserDefaults.standardUserDefaults().stringForKey(GRUPO_SANGUINEO_DONANTE)
           _identificadorDonante = NSUserDefaults.standardUserDefaults().stringForKey(IDENTIFICADOR_DONANTE)
    }

}