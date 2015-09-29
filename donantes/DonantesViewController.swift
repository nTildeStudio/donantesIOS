//
//  DonantesViewController.swift
//  donantes
//
//  Created by Diego on 29/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import UIKit

/// Clase que extiendo UIViewController para integrar en el mismo un "loadingView" que se pueda llamar durante las llamadas a parse
class DonantesViewController: UIViewController {
    
    private var loadingView : UIView?
    
    /**
    Bloquea la pantalla mostrando una vista transparente con blur y un spinner indicando al usuario que se está cargando algún tipod de información
    */
    func showLoading() {
        if loadingView == nil {
            loadingView = UIView(frame: self.view.frame)
            loadingView!.backgroundColor = UIColor.clearColor()
            let blur = FXBlurView(frame: loadingView!.frame)
            blur.dynamic = false
            blur.tintColor = UIColor.clearColor()
            blur.contentMode = UIViewContentMode.Bottom
            blur.underlyingView = self.view
            loadingView!.addSubview(blur)
            let spinnerSize = CGFloat(100.0)
            let spinner = MRActivityIndicatorView(frame: CGRectMake(CGFloat((loadingView!.frame.size.width/2)-(spinnerSize/2)), CGFloat((loadingView!.frame.size.height/2)-(spinnerSize/2)), CGFloat(spinnerSize), CGFloat(spinnerSize)))
            spinner.tintColor = UIColor.redColor()
            spinner.startAnimating()
            spinner.hidden = false
            loadingView!.addSubview(spinner)
        }
        
        
        self.view.addSubview(loadingView!)
    }
    
    /**
    Oculta la vista de loading en caso de que está esté en pantalla
    */
    func hideLoading() {
        if loadingView != nil {
            loadingView?.removeFromSuperview()
            loadingView = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
