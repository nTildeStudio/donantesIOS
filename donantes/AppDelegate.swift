//
//  AppDelegate.swift
//  donantes
//
//  Created by Alvaro on 14/9/15.
//  Copyright (c) 2015 Alvaro. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    func localizedWithComment(comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: comment)
    }
}

//extension UIView {
//    
//    
//    struct NLInnerShadowDirection : RawOptionSetType {
//        typealias RawValue = UInt
//        private var value: UInt = 0
//        init(_ value: UInt) { self.value = value }
//        init(rawValue value: UInt) { self.value = value }
//        init(nilLiteral: ()) { self.value = 0 }
//        static var allZeros: NLInnerShadowDirection { return self(0) }
//        static func fromMask(raw: UInt) -> NLInnerShadowDirection { return self(raw) }
//        var rawValue: UInt { return self.value }
//        
//        static var NLInnerShadowDirectionNone : NLInnerShadowDirection { return self(0) }
//        static var NLInnerShadowDirectionLeft   : NLInnerShadowDirection { return self(1 << 0) }
//        static var NLInnerShadowDirectionRight  : NLInnerShadowDirection  { return self(1 << 1) }
//        static var NLInnerShadowDirectionTop : NLInnerShadowDirection   { return self(1 << 2) }
//        static var NLInnerShadowDirectionBottom  : NLInnerShadowDirection   { return self(1 << 3) }
//        static var NLInnerShadowDirectionAll  : NLInnerShadowDirection    { return self(15) }
//    }
//    
//    func removeInnerShadow() {
//        for view: UIView in subviews {
//            if view.tag == kInnerShadowViewTag {
//                view.removeFromSuperview()
//            }
//        }
//    }
//    
//    func addInnerShadow() {
//        var color: UIColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
//        self.addInnerShadowWithRadius(3.0, andColor: color, inDirection: NLInnerShadowDirection.NLInnerShadowDirectionAll)
//    }
//    
//    func addInnerShadowWithRadius(radius: CGFloat, andAlpha alpha: CGFloat) {
//        var color: UIColor = UIColor.blackColor().colorWithAlphaComponent(alpha)
//        self.addInnerShadowWithRadius(radius, andColor: color, inDirection: NLInnerShadowDirection.NLInnerShadowDirectionAll)
//    }
//    
//    func addInnerShadowWithRadius(radius: CGFloat, andColor color: UIColor) {
//        self.addInnerShadowWithRadius(radius, andColor: color, inDirection: NLInnerShadowDirection.NLInnerShadowDirectionAll)
//    }
//    
//    func addInnerShadowWithRadius(radius: CGFloat, andColor color: UIColor, inDirection direction: NLInnerShadowDirection) {
//        self.removeInnerShadow()
//        var shadowView: UIView = self.createShadowViewWithRadius(radius, andColor: color, inDirection: direction)
//        self.addSubview(shadowView)
//    }
//    
//    func createShadowViewWithRadius(radius: CGFloat, andColor color: UIColor, inDirection direction: NLInnerShadowDirection) -> UIView {
//        var shadowView: UIView = UIView(frame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height))
//        shadowView.backgroundColor = UIColor.clearColor()
//        shadowView.tag = kInnerShadowViewTag
//        var shadow : CAGradientLayer
//
//        var colorsArray: [AnyObject] = [color.CGColor, UIColor.clearColor().CGColor]
//        if direction & NLInnerShadowDirection.NLInnerShadowDirectionTop {
//            var xOffset: CGFloat = 0.0
//            var topWidth: CGFloat = self.bounds.size.width
//            shadow = CAGradientLayer.layer()
//            shadow.colors = colorsArray
//            shadow.startPoint = CGPointMake(0.5, 0.0)
//            shadow.endPoint = CGPointMake(0.5, 1.0)
//            shadow.frame = CGRectMake(xOffset, 0, topWidth, radius)
//            shadowView.layer.insertSublayer(shadow, atIndex: 0)
//        }
//        if direction & NLInnerShadowDirection.NLInnerShadowDirectionBottom {
//            var xOffset: CGFloat = 0.0
//            var bottomWidth: CGFloat = self.bounds.size.width
//            shadow = CAGradientLayer.layer()
//            shadow.colors = colorsArray
//            shadow.startPoint = CGPointMake(0.5, 1.0)
//            shadow.endPoint = CGPointMake(0.5, 0.0)
//            shadow.frame = CGRectMake(xOffset, self.bounds.size.height - radius, bottomWidth, radius)
//            shadowView.layer.insertSublayer(shadow, atIndex: 0)
//        }
//        if direction & NLInnerShadowDirection.NLInnerShadowDirectionLeft {
//            var yOffset: CGFloat = 0.0
//            var leftHeight: CGFloat = self.bounds.size.height
//            shadow = CAGradientLayer.layer()
//            shadow.colors = colorsArray
//            shadow.frame = CGRectMake(0, yOffset, radius, leftHeight)
//            shadow.startPoint = CGPointMake(0.0, 0.5)
//            shadow.endPoint = CGPointMake(1.0, 0.5)
//            shadowView.layer.insertSublayer(shadow, atIndex: 0)
//        }
//        if direction & NLInnerShadowDirection.NLInnerShadowDirectionRight {
//            var yOffset: CGFloat = 0.0
//            var rightHeight: CGFloat = self.bounds.size.height
//            shadow = CAGradientLayer.layer()
//            shadow.colors = colorsArray
//            shadow.frame = CGRectMake(self.bounds.size.width - radius, yOffset, radius, rightHeight)
//            shadow.startPoint = CGPointMake(1.0, 0.5)
//            shadow.endPoint = CGPointMake(0.0, 0.5)
//            shadowView.layer.insertSublayer(shadow, atIndex: 0)
//        }
//        return shadowView
//    }
//    
//}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

