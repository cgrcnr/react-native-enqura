import ExpoModulesCore
import Foundation
import React
import UIKit
import EnQualify

public class AppDelegate: ExpoAppDelegateSubscriber {
    var navigationController = EnVerify.getNavigationController()
    var userManager = UserManager.shared
    // public var window: UIWindow?
    
    // public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //   let rootViewController = UIApplication.topViewController()! as UIViewController
      
    //   self.window = UIWindow(frame: UIScreen.main.bounds)
    //   self.window?.rootViewController = rootViewController

    //   navigationController = UINavigationController(rootViewController: rootViewController)
    //   EnVerify.setNavigationController(navigator: navigationController!)

    //   window?.rootViewController = navigationController
    //   self.window?.makeKeyAndVisible()
      
    //   return true
    // }

  public func applicationDidBecomeActive(_ application: UIApplication) {
    print("ExpoAppDelegateSubscriber:applicationDidBecomeActive")
    
    //let rootViewController = UIApplication.topViewController()! as UIViewController

    if userManager.isFirstLaunch() {
      //Defaults
      userManager.setServiceState(state: "SS_VIDEO_CALL")
      userManager.setLivenessValue(value: 1) // kolay mod.
      userManager.setCanAutoCloseOpen(value: true)
      userManager.setIsTransactionDetailsOpen(value: false)
      userManager.setIsRoutingScreensOpen(value: false)
      userManager.setHoloDetectionType(value: "HOLO_ANY_DETECT")
      userManager.setDetectionThresholdValue(value: 0.9)
      userManager.setFirstLaunch()
    }
  }

  public func applicationWillResignActive(_ application: UIApplication) {
    // The app is about to become inactive.
  }

  public func applicationDidEnterBackground(_ application: UIApplication) {
    // The app is now in the background.
  }

  public func applicationWillEnterForeground(_ application: UIApplication) {
    // The app is about to enter the foreground.
  }

  public func applicationWillTerminate(_ application: UIApplication) {
    // The app is about to terminate.
  }
}

extension UIApplication { 
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
    class func topNavigationController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UINavigationController? {
        
        if let nav = viewController as? UINavigationController {
            return nav
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return selected.navigationController
            }
        }
        return viewController?.navigationController
    }
}

