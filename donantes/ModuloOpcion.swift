//
//  ModuloOpcion.swift
//  donantes
//
//  Created by Diego on 16/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit

/// Clase utilizada para definir un módulo dentro de la APP. Contiene la información básica del mismo:
///
/// - Nombre
/// - Título
/// - Subtítulo
/// - Nombre de su StoryBoard
/// - Nombre del recurso utilizado para cargar su icono
class ModuloOpcion: NSObject {
    
    var nombre : String
    var titulo : String
   var subtitulo : String
    var storyBoard : String
    private var nombreIcono : String
    
    override init () {
        nombre = ""
        nombreIcono = ""
        titulo = ""
        subtitulo = ""
        storyBoard = ""
    }
    
    init (name : String, title : String, subtitle: String, iconName: String, storyBoardName : String) {
        nombre = name
        nombreIcono = iconName
        titulo = title
        subtitulo = subtitle
        storyBoard = storyBoardName
    }
    
    func icono() -> UIImage {
        if nombreIcono == "" {
        return UIImage(named: nombre)!
        } else {
        return UIImage(named: nombreIcono)!
        }
    }
}
