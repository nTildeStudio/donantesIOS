//
//  ConfiguracionInicialIdentificadorDeDonanteViewController.swift
//  donantes
//
//  Created by Diego on 17/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit

class ConfiguracionInicialIdentificadorDeDonanteViewController: DonantesViewController {

    @IBOutlet weak var textFieldIdentificadorDonante: UITextField!
    @IBOutlet weak var buttonOmitir: UIButton!
    @IBOutlet weak var buttonContinuar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Donantes!"
        buttonContinuar.layer.borderColor = UIColor.redColor().CGColor
        buttonContinuar.layer.borderWidth = 1.0
        buttonContinuar.layer.cornerRadius = 6.0
        buttonOmitir.layer.borderColor = UIColor.redColor().CGColor
        buttonOmitir.layer.borderWidth = 1.0
        buttonOmitir.layer.cornerRadius = 6.0
        
        textFieldIdentificadorDonante.layer.borderColor = UIColor.redColor().CGColor
        textFieldIdentificadorDonante.layer.borderWidth = 1.0
        textFieldIdentificadorDonante.layer.cornerRadius = 6.0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToSeleccionarGrupoSanguineo" {
            if textFieldIdentificadorDonante.text != "" {
            AppInfo.sharedInstance.identificadorDonante = textFieldIdentificadorDonante.text
            }
        }
    }


}
