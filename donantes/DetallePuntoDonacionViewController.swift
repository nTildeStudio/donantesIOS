//
//  DetallePuntoDonacionViewController.swift
//  donantes
//
//  Created by Diego on 28/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import UIKit
import MapKit

class DetallePuntoDonacionViewController: UIViewController {

    //MARK: Outlets

    @IBOutlet weak var mapViewDetallePuntoDonacion: MKMapView!
    
    @IBOutlet weak var viewInformacionPuntoDeDonacion: UIView!
    @IBOutlet weak var labelNombrePuntoDeDonacion: UILabel!
    @IBOutlet weak var labelDireccionPuntoDeDonacion: UILabel!
    @IBOutlet weak var labelTelefonoPuntoDeDonacion: UILabel!
    @IBOutlet weak var labelHorarioPuntoDeDonacion: UILabel!
    
    //MARK: Variables
    
    var puntoDonacion : PuntoDeDonacion?
    
    //MARK: - View lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGrayColor().CGColor
        self.navigationController?.navigationBar.layer.shadowRadius = 5.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 1.0
        self.navigationController?.navigationBar.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        viewInformacionPuntoDeDonacion.layer.shadowColor = UIColor.lightGrayColor().CGColor
        viewInformacionPuntoDeDonacion.layer.shadowRadius = 5.0
        viewInformacionPuntoDeDonacion.layer.shadowOpacity = 1.0
        viewInformacionPuntoDeDonacion.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        labelNombrePuntoDeDonacion.text = puntoDonacion?.nombre
        labelDireccionPuntoDeDonacion.text = puntoDonacion?.direccion
        labelTelefonoPuntoDeDonacion.text = puntoDonacion?.telefono
        
        var horario = ""
        if puntoDonacion?.arrayHorarios != nil && puntoDonacion?.arrayHorarios.count > 0 {
        for h in (self.puntoDonacion?.arrayHorarios)! {
            horario = horario+"Del "+h.stringFechaInicio!+" al "
            horario = horario+h.stringFechaFin!+": "+h.stringHorario!+"\n"
        }
        }
        labelHorarioPuntoDeDonacion.text = horario
        self.mapViewDetallePuntoDonacion.addAnnotation(puntoDonacion!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doActionPushed(sender: AnyObject) {
        
        let optionMenu = UIAlertController(title: "Choose action".localized, message: nil, preferredStyle: .ActionSheet)
        

            let myAction = UIAlertAction(title: "Llamar".localized, style: .Default, handler: {
                (alert: UIAlertAction) -> Void in
                print("LLAMA AL PUNTO DE DONACIÓN!!!")
            })
            optionMenu.addAction(myAction)

        let myAction2 = UIAlertAction(title: "Cómo llegar".localized, style: .Default, handler: {
            (alert: UIAlertAction) -> Void in
            print("LANZA EL MAPS PARA LLEGAR AL PUNTO DE DONACIÓN!!!")
        })
        optionMenu.addAction(myAction2)
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .Cancel, handler:
            {
                (alert: UIAlertAction!) -> Void in
                print("Cancelled")
        })
        optionMenu.addAction(cancelAction)

        
        self.presentViewController(optionMenu, animated: true, completion: nil)
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
