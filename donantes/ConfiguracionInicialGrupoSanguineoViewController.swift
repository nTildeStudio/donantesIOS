//
//  ConfiguracionInicialGrupoSanguineoViewController.swift
//  donantes
//
//  Created by Diego on 17/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit

    /// Constante utilizada para representar la "no selección" de un grupo sanguíneo
    let SinGrupo : String = " "

/// Controlador encargado de gestionar la vista en la que el usuario selecciona su grupo sanguíneo
class ConfiguracionInicialGrupoSanguineoViewController: UIViewController, UIPickerViewDataSource {

    //MARK: Outlets
    
    @IBOutlet weak var buttonOmitir: UIButton!
    @IBOutlet weak var buttonContinuar: UIButton!
    @IBOutlet weak var pickerViewTipoSanguineo: UIPickerView!
    
    //MARK: Variables
    /// Array utilizado para nutrir el PickerView. Contiene todos los tipos de sangre y, a mayores, una línea para que el usuario pueda dejar la opción sin seleccionar
    let arrayGrupos = [SinGrupo,"A+","A-","B+","B-","AB+","AB-","0+","0-"]
    /// Variable utilizada para almacenar el valor del grupo sanguíneo seleccionado por el usuario, por defecto tiene el valor "no seleccionado"
    var grupoSeleccionado = SinGrupo
    
    //MARK: - View lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Donantes!"

        buttonContinuar.layer.borderColor = UIColor.redColor().CGColor
        buttonContinuar.layer.borderWidth = 1.0
        buttonContinuar.layer.cornerRadius = 6.0
        
        buttonOmitir.layer.borderColor = UIColor.redColor().CGColor
        buttonOmitir.layer.borderWidth = 1.0
        buttonOmitir.layer.cornerRadius = 6.0
        
        buttonContinuar.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : IBActions
    @IBAction func aceptarPushed(sender: AnyObject) {
        AppInfo.sharedInstance.grupoSanguineoDonante = grupoSeleccionado
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func omitirPushed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: PickerView Data Source
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayGrupos.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
        // MARK: PickerView Delegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayGrupos[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

            buttonContinuar.enabled = row>0
        grupoSeleccionado = arrayGrupos[row]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
