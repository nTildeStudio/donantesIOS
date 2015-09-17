//
//  ConfiguracionInicialSeleccionarCentroDonacionViewController.swift
//  donantes
//
//  Created by Diego on 16/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit
import MapKit


let IdentifierCentroDonacionCell = "CentroDeDonacionTableViewCell"

/// Controlador que gestiona el primer paso de la configuración de la APP. En él el usuario seleccionará un centro de donación.
class ConfiguracionInicialSeleccionarCentroDonacionViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

 // MARK: Outlets
    
    @IBOutlet  var containerViewMap: UIView!
    @IBOutlet  var tableViewResults: UITableView!
    
    @IBOutlet weak var constraintTableViewVisible: NSLayoutConstraint!
    @IBOutlet weak var constraintTableViewHidden: NSLayoutConstraint!
    

    @IBOutlet weak var constraintMapViewFullScreen: NSLayoutConstraint!
    @IBOutlet weak var constraintMapViewPlusInfoView: NSLayoutConstraint!
    
    @IBOutlet weak var viewInformacionPuntoDonacion: UIView!
    @IBOutlet weak var mapViewPuntosDonacion: MKMapView!
    
// MARK: Variables
    
    var isTableViewVisible : Bool = true
    var firstTime : Bool = true
    
    var arrayCentrosDeDonacion : [CentroDeDonacion] = []
    
    // MARK: - View lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var vibrancy:UIVibrancyEffect = UIVibrancyEffect(forBlurEffect: blur)

//        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: vibrancy)
        effectView.frame = self.view.frame
//        effectView.backgroundColor = UIColor.whiteColor()
//                effectView.alpha = 0.4
//        view.addSubview(effectView)
        view.insertSubview(effectView, atIndex: 0)


        constraintTableViewVisible.priority = 800
        constraintTableViewHidden.priority = 200
        isTableViewVisible = true
        
        loadTestData()

        tableViewResults.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        //MARK: IBActions
    @IBAction func showPointInfo(sender: AnyObject) {
        if constraintMapViewFullScreen.priority == 800 {
            UIView.animateWithDuration(Double(0.35), animations: {
                self.constraintMapViewFullScreen.priority = 200
                self.constraintMapViewPlusInfoView.priority = 800
                self.viewInformacionPuntoDonacion.layoutIfNeeded()
                self.mapViewPuntosDonacion.layoutIfNeeded()
                println("Entró MAP 1")
                if self.firstTime {
                    self.viewInformacionPuntoDonacion.addInnerShadow()
                    self.firstTime = false
                }
            })
        } else  {
            UIView.animateWithDuration(Double(0.35), animations: {
                
                self.constraintMapViewFullScreen.priority = 800
                self.constraintMapViewPlusInfoView.priority = 200
                self.viewInformacionPuntoDonacion.layoutIfNeeded()
                self.mapViewPuntosDonacion.layoutIfNeeded()
                println("Entró MAP 2")
            })
        }

        
    }
    @IBAction func flipTapped(sender: AnyObject) {
        if isTableViewVisible {
            UIView.animateWithDuration(Double(0.5), animations: {
                self.constraintTableViewVisible.priority = 200
                self.constraintTableViewHidden.priority = 800
                self.tableViewResults.layoutIfNeeded()
                                self.containerViewMap.layoutIfNeeded()
                        println("Entró 1")

            })

            isTableViewVisible = false
        } else  {
            UIView.animateWithDuration(Double(0.5), animations: {

                self.constraintTableViewVisible.priority = 800
                self.constraintTableViewHidden.priority = 200
                self.tableViewResults.layoutIfNeeded()
                self.containerViewMap.layoutIfNeeded()
                        println("Entró 2")
            })

                        isTableViewVisible = true
        }

    }

    //MARK: TableView datasource
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if(tableView.respondsToSelector(Selector("setSeparatorInset:"))){
            tableView.separatorInset = UIEdgeInsetsZero
        }
        
        if(tableView.respondsToSelector(Selector("setLayoutMargins:"))){
            tableView.layoutMargins = UIEdgeInsetsZero
        }
        
        if(cell.respondsToSelector(Selector("setLayoutMargins:"))){
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return arrayCentrosDeDonacion.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(IdentifierCentroDonacionCell, forIndexPath: indexPath) as! CentroDeDonacionTableViewCell
//        cell.label.text = "sdifhjdsafjsd"
        return cell
    }
    
    //MARK: TableView delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
     self.performSegueWithIdentifier("goToIdentificadorDeDonanteSegue", sender: nil)
    }
   
    // MARK: Metodos para pruebas
    
    func loadTestData() {
        arrayCentrosDeDonacion = [CentroDeDonacion(name: "Lionel el Grande", address: "Calle sin nombre, edificion sin número")
            ,CentroDeDonacion(name: "Pedro", address: "Calle sin nombre, edificion sin número")
                        ,CentroDeDonacion(name: "Fernando", address: "Calle sin nombre, edificion sin número")
                        ,CentroDeDonacion(name: "Hermeniguilda", address: "Calle sin nombre, edificion sin número")
                        ,CentroDeDonacion(name: "Wenceslao", address: "Calle sin nombre, edificion sin número")
                        ,CentroDeDonacion(name: "Paquito", address: "Calle sin nombre, edificion sin número")
                        ,CentroDeDonacion(name: "Benito", address: "Calle sin nombre, edificion sin número")
        ]
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
