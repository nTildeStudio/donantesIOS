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
class ConfiguracionInicialSeleccionarCentroDonacionViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, MKMapViewDelegate {
    
    // MARK: Outlets
    
    @IBOutlet  var containerViewMap: UIView!
    @IBOutlet  var tableViewResults: UITableView!
    
    @IBOutlet weak var viewInfoSeleccionaPuntoDonacion: UIView!
    @IBOutlet weak var constraintTableViewVisible: NSLayoutConstraint!
    @IBOutlet weak var constraintTableViewHidden: NSLayoutConstraint!
    
    
    @IBOutlet weak var constraintMapViewFullScreen: NSLayoutConstraint!
    @IBOutlet weak var constraintMapViewPlusInfoView: NSLayoutConstraint!
    
    @IBOutlet weak var viewInformacionPuntoDonacion: UIView!
    @IBOutlet weak var mapViewPuntosDonacion: MKMapView!
    
    @IBOutlet weak var labelNombreCentroDonacionSeleccionado: UILabel!
    @IBOutlet weak var labelDescripcionCentroDonacionSeleccionado: UILabel!
    @IBOutlet weak var labelDireccionCentoDonacionSeleccionado: UILabel!
    @IBOutlet weak var labelDistanciaCentroDonacionSeleccionado: UILabel!
    @IBOutlet weak var buttonSeleccionarCentroDonacion: UIButton!
    
    
    // MARK: Variables
    
    var isTableViewVisible : Bool = true
    var firstTime : Bool = true
    
    var arrayCentrosDeDonacion : [CentroRegional] = []
    
    // MARK: - View lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Donantes!"
        
        let blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let vibrancy:UIVibrancyEffect = UIVibrancyEffect(forBlurEffect: blur)
        
        //        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        let effectView:UIVisualEffectView = UIVisualEffectView (effect: vibrancy)
        effectView.frame = self.view.frame
        //        effectView.backgroundColor = UIColor.whiteColor()
        //                effectView.alpha = 0.4
        //        view.addSubview(effectView)
        view.insertSubview(effectView, atIndex: 0)
        
        
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGrayColor().CGColor
        self.navigationController?.navigationBar.layer.shadowRadius = 5.0
        self.navigationController?.navigationBar.layer.shadowOpacity = 1.0
        self.navigationController?.navigationBar.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        viewInfoSeleccionaPuntoDonacion.layer.shadowColor = UIColor.lightGrayColor().CGColor
        viewInfoSeleccionaPuntoDonacion.layer.shadowRadius = 5.0
        viewInfoSeleccionaPuntoDonacion.layer.shadowOpacity = 1.0
        viewInfoSeleccionaPuntoDonacion.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        
        buttonSeleccionarCentroDonacion.layer.borderColor = UIColor.redColor().CGColor
        buttonSeleccionarCentroDonacion.layer.borderWidth = 1.0
        buttonSeleccionarCentroDonacion.layer.cornerRadius = 6.0
        
        constraintTableViewVisible.priority = 800
        constraintTableViewHidden.priority = 200
        constraintMapViewPlusInfoView.priority = 200
        
        isTableViewVisible = true
        
        mapViewPuntosDonacion.delegate = self
        //        arrayCentrosDeDonacion = APIParseCommunicator.getListOfCentrosDeDonacion()
        
        APIParseCommunicator.getListOfCentrosRegionalesInBackground { (result) -> Void in
            self.arrayCentrosDeDonacion = result
            self.tableViewResults.reloadData()
            self.insertDataOnMap()
            
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    
    func showPointInfo(point : CentroRegional) {
        if constraintMapViewFullScreen.priority == 800 {
            UIView.animateWithDuration(Double(0.35), animations: {
                self.constraintMapViewFullScreen.priority = 200
                self.constraintMapViewPlusInfoView.priority = 800
                self.viewInformacionPuntoDonacion.layoutIfNeeded()
                self.mapViewPuntosDonacion.layoutIfNeeded()
                
                if self.firstTime {
                    self.viewInformacionPuntoDonacion.addInnerShadowWithRadius(CGFloat(4.0), andColor: UIColor.blackColor(), inDirection: [NLInnerShadowDirection.Top, NLInnerShadowDirection.Bottom])
                    //addInnerShadow()
                    self.firstTime = false
                }
            })
            labelDescripcionCentroDonacionSeleccionado.text = point.descripcion
            labelNombreCentroDonacionSeleccionado.text = point.nombre
            labelDireccionCentoDonacionSeleccionado.text = point.direccion
        }
        
        /*        else  {
        UIView.animateWithDuration(Double(0.35), animations: {
        
        self.constraintMapViewFullScreen.priority = 800
        self.constraintMapViewPlusInfoView.priority = 200
        self.viewInformacionPuntoDonacion.layoutIfNeeded()
        self.mapViewPuntosDonacion.layoutIfNeeded()
        print("Entró MAP 2")
        })
        }
        */
        
        
    }
    
    @IBAction func flipTapped(sender: AnyObject) {
        if isTableViewVisible {
            UIView.animateWithDuration(Double(0.5), animations: {
                self.constraintTableViewVisible.priority = 200
                self.constraintTableViewHidden.priority = 800
                self.tableViewResults.layoutIfNeeded()
                self.containerViewMap.layoutIfNeeded()
                print("Entró 1")
                
            })
            
            isTableViewVisible = false
        } else  {
            UIView.animateWithDuration(Double(0.5), animations: {
                
                self.constraintTableViewVisible.priority = 800
                self.constraintTableViewHidden.priority = 200
                self.tableViewResults.layoutIfNeeded()
                self.containerViewMap.layoutIfNeeded()
                print("Entró 2")
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
        cell.labelDireccionCentroDonacion.text = arrayCentrosDeDonacion[indexPath.row].direccion
        cell.labelNombreCentroDonacion.text = arrayCentrosDeDonacion[indexPath.row].nombre
        return cell
    }
    
    //MARK: TableView delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("goToIdentificadorDeDonanteSegue", sender: nil)
    }
    
    // MARK: MapKit delegate
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapViewPuntosDonacion.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        showPointInfo(view.annotation as! CentroRegional)
    }
    
    //MARK: funciones auxiliares
    func insertDataOnMap() {
        for pin in arrayCentrosDeDonacion {
            mapViewPuntosDonacion.addAnnotation(pin)
        }
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
