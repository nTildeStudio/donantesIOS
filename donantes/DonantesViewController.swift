//
//  DonantesViewController.swift
//  donantes
//
//  Created by Diego on 29/9/15.
//  Copyright © 2015 Alvaro. All rights reserved.
//

import UIKit

class DonantesViewController: UIViewController {
    
    private var loadingView : UIView?
    
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
//            let spinner = UIActivityIndicatorView(frame: CGRectMake(CGFloat((loadingView!.frame.size.width/2)-(spinnerSize/2)), CGFloat((loadingView!.frame.size.height/2)-(spinnerSize/2)), CGFloat(spinnerSize), CGFloat(spinnerSize))) //(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
//            spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
            spinner.tintColor = UIColor.redColor()
//            spinner.color = UIColor.redColor()
            spinner.startAnimating()
            spinner.hidden = false
            loadingView!.addSubview(spinner)
//            let constX : NSLayoutConstraint = NSLayoutConstraint(item: spinner, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: loadingView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
//            let constY : NSLayoutConstraint = NSLayoutConstraint(item: spinner, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: loadingView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
//            loadingView!.addConstraints([constX, constY])
            
//            let constX:NSLayoutConstraint = NSLayoutConstraint(item: ev, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: viewEventsGrid, attribute: NSLayoutAttribute.Trailing, multiplier: xPercent, constant: 0)


        }
        
        
        self.view.addSubview(loadingView!)
    }
    
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
