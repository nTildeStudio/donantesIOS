//
//  MainViewController.swift
//  donantes
//
//  Created by Diego on 16/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit

//MARK: Constantes

let MainCellIdentifier = "MainOptionsTableViewCell"

/// Controlador principal, se encarga de gestionar la vista principal de la APP, desde la que el usuario puede acceder a las diferentes opiones de la misma
class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var tableViewListadoOpciones: UITableView!
    
    //MARK: Variables
    var arrayModulos : [ModuloOpcion] = []
    
    //MARK: - View lifecicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                self.title = "Donantes!"
//        var bounds = self.navigationController?.navigationBar.bounds as CGRect!
//        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
//        visualEffectView.frame = bounds
//        visualEffectView.autoresizingMask = .FlexibleHeight | .FlexibleWidth
//        self.navigationController?.navigationBar.addSubview(visualEffectView)
        


        
        arrayModulos = loadModules()
        self.tableViewListadoOpciones.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if true  {
            
            let nc = self.storyboard!.instantiateViewControllerWithIdentifier("ConfiguracionInicialNavigationController") as! UINavigationController
//            let vc = nc.viewControllers.first as! ConfiguracionInicialSeleccionarCentroDonacionViewController
            
            self.presentViewController(nc, animated: true, completion: nil)

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
        return arrayModulos.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MainCellIdentifier, forIndexPath: indexPath) as! MainOptionsTableViewCell
        cell.labelTitulo.text = arrayModulos[indexPath.row].titulo.localized
        return cell
    }
    
    //MARK: TableView delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let story = UIStoryboard(name: arrayModulos[indexPath.row].storyBoard, bundle: nil)
        let vc : UIViewController! = story.instantiateInitialViewController()! as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //MARK: - Carga de datos
    /**
    Función que se ocupa de cargar un array con todos los módulos disponibles en la APP, después de inicializar la información de los mismos
    
    - returns: Array de objetos "ModuloOpcion" que representan los diferentes módulos disponibles en la APP
    */
    func loadModules() -> [ModuloOpcion] {
        var toret : [ModuloOpcion] = []
        let op1 = ModuloOpcion(name: "DondeDonar", title: "Donde donar", subtitle: "DondeDonar", iconName: "DondeDonar", storyBoardName: "DondeDonar")
        toret.append(op1)
        let op2 = ModuloOpcion(name: "AgendaDonaciones", title: "Agenda de donaciones", subtitle: "AgendaDonaciones", iconName: "AgendaDonaciones", storyBoardName: "AgendaDonaciones")
        toret.append(op2)
        let op3 = ModuloOpcion(name: "AgendaDonaciones", title: "Información al donante", subtitle: "AgendaDonaciones", iconName: "AgendaDonaciones", storyBoardName: "AgendaDonaciones")
        toret.append(op3)
        let op4 = ModuloOpcion(name: "Mensajes", title: "Mensajes del CTG Galicia", subtitle: "Mensajes", iconName: "Mensajes", storyBoardName: "Mensajes")
        toret.append(op4)
        let op5 = ModuloOpcion(name: "Configuracion", title: "Configuracion ", subtitle: "Configuracion", iconName: "Configuracion", storyBoardName: "Configuracion")
        toret.append(op5)
        return toret
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
