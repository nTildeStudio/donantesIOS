//
//  ListadoPuntosDonacionViewController.swift
//  donantes
//
//  Created by Diego on 28/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import UIKit
import MapKit

let PuntoDeDonacionTableViewCellIndentifier = "PuntoDeDonacionTableViewCellIndentifier"

/// Controlador encargado de gestionar la vista que muestra el listado de puntos de donación asociados a un centro regional
class ListadoPuntosDonacionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate {

    //MARK: Outlets
    
    @IBOutlet weak var tableViewPuntosDonacion: UITableView!
    @IBOutlet weak var mapViewPuntosDonacion: MKMapView!
    @IBOutlet weak var contraintTableViewFullScreen: NSLayoutConstraint!
    @IBOutlet weak var constraintTableViewHidden: NSLayoutConstraint!
    
    // MARK: Variables 
    
    var arrayPuntosDeDonacion : [PuntoDeDonacion] = []

    var puntoDonacionSeleccionado : PuntoDeDonacion?
    
    // MARK: - view lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()

        APIParseCommunicator.getListOfPuntosDeDonacionInBackground(AppInfo.sharedInstance.centroRegional!) { (result) -> Void in
            self.arrayPuntosDeDonacion = result
            self.tableViewPuntosDonacion.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return arrayPuntosDeDonacion.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(PuntoDeDonacionTableViewCellIndentifier, forIndexPath: indexPath) as! PuntoDeDonacionTableViewCell
cell.labelDireccionPuntoDeDonacion.text = arrayPuntosDeDonacion[indexPath.row].direccion
        cell.labelNombrePuntoDonacion.text = arrayPuntosDeDonacion[indexPath.row].nombre
        return cell
    }
    
    //MARK: TableView delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: MapKit delegate
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapViewPuntosDonacion.setRegion(coordinateRegion, animated: true)
    }
    
    /*
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
    centroRegionalSeleccionado = view.annotation as? CentroRegional
    showPointInfo(view.annotation as! CentroRegional)
    }
    */
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "goToDetallePuntoDonacionSegue" {
            let cell = sender as! UITableViewCell
            
            puntoDonacionSeleccionado = arrayPuntosDeDonacion[(self.tableViewPuntosDonacion.indexPathForCell(cell)?.row)!]
            let vc = segue.destinationViewController as! DetallePuntoDonacionViewController
            vc.puntoDonacion = puntoDonacionSeleccionado
            
        }
    }


}
