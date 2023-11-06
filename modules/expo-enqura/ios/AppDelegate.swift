import ExpoModulesCore
import EnQualify
import Foundation
import React
import UIKit

public class AppDelegate: ExpoAppDelegateSubscriber {
  var navigationController = EnVerify.getNavigationController()
  var userManager = UserManager.shared

  public var window: UIWindow?
  let jsCodeLocation: URL = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: ".expo/.virtual-metro-entry")

  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let rootViewController = getVCFromModuleName("main", nil, launchOptions)
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = rootViewController

    navigationController = UINavigationController(rootViewController: rootViewController)
    EnVerify.setNavigationController(navigator: navigationController!)

    window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
    
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
    
    return true
  }

  public func applicationDidBecomeActive(_ application: UIApplication) {
    // //let rootViewController = UIApplication.shared.windows.first?.rootViewController as? UIViewController
    // //let rootViewController = UIApplication.shared.keyWindow?.rootViewController
    // //let rootViewController = UIApplication.shared.windows.last?.rootViewController
    // let rootViewController = UIApplication.shared.firstKeyWindow?.rootViewController
    // let x = UIApplication.shared.connectedScenes.filter({ $0.activationState == .foregroundActive }).compactMap({$0 as? UIWindowScene})
    // // self.window = UIWindow(frame: UIScreen.main.bounds)
    // // self.window?.rootViewController = rootViewController

    // navigationController = UINavigationController(rootViewController: rootViewController!)
    // EnVerify.setNavigationController(navigator: navigationController!)

    // // window?.rootViewController = navigationController
    // // self.window?.makeKeyAndVisible()
    
    // if userManager.isFirstLaunch() {
    //   //Defaults
    //   userManager.setServiceState(state: "SS_VIDEO_CALL")
    //   userManager.setLivenessValue(value: 1) // kolay mod.
    //   userManager.setCanAutoCloseOpen(value: true)
    //   userManager.setIsTransactionDetailsOpen(value: false)
    //   userManager.setIsRoutingScreensOpen(value: false)
    //   userManager.setHoloDetectionType(value: "HOLO_ANY_DETECT")
    //   userManager.setDetectionThresholdValue(value: 0.9)
    //   userManager.setFirstLaunch()
    // }
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

  func getVCFromModuleName(_ moduleName: String,_ initialProperties: NSDictionary?, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> UIViewController {
    var props: [NSObject : AnyObject]? = nil
    if (initialProperties != nil) {
      props = initialProperties! as [NSObject : AnyObject]
    }
    let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: moduleName, initialProperties:props , launchOptions: launchOptions)
    let rootViewController = UIViewController()
    
    rootViewController.view = rootView
    return rootViewController
  }

  // func navigateToIDView() {
  //   //let vc = getVCFromModuleName(moduleName, initialProperties, launchOptions)
  //   // DispatchQueue.main.async {
  //   //   //EnVerify.idViewStart(vc: window?.rootViewController)
  //   //   EnVerify.idViewStart(vc: self.window?.rootViewController as! UIViewController)
  //   // }
  // }

  // func navigateToIDView() {
  //   // let vc = getVCFromModuleName(moduleName, initialProperties, launchOptions)
  //   // let jsCodeLocation: URL
  //   // #if DEBUG
  //   // jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
  //   // #else
  //   // jsCodeLocation = Bundle.main.url(forResource: "main", withExtension: "jsbundle")!
  //   // #endif

  //   let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "MyApp", initialProperties: nil, launchOptions: nil)
  //   let mainViewController = UIViewController()
  //   mainViewController.view = rootView
  //   DispatchQueue.main.async {
  //     EnVerify.idViewStart(vc: mainViewController)
  //   }
  // }
}

extension UIApplication {
  
  class func topMostViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    
    if let navigationController = controller as? UINavigationController {
      return topMostViewController(controller: navigationController.visibleViewController)
    }
    
    if let tabController = controller as? UITabBarController {
      if let selected = tabController.selectedViewController {
        return topMostViewController(controller: selected)
      }
    }
    
    if let presented = controller?.presentedViewController {
      return topMostViewController(controller: presented)
    }
    
    return controller
  }
}

// extension UIApplication {
//     var firstKeyWindow: UIWindow? {
//         // 1
//         let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
//         // 2
//         let activeScene = windowScenes.filter { $0.activationState == .foregroundActive }
//         // 3
//         let firstActiveScene = activeScene.first
//         // 4
//         let keyWindow = firstActiveScene?.keyWindow
        
//         return keyWindow
//     }
// }

// extension UIApplication {
//     var firstKeyWindow: UIWindow? {
//         return UIApplication.shared.connectedScenes
//             .compactMap { $0 as? UIWindowScene }
//             .filter { $0.activationState == .foregroundActive }
//             .first?.windows
//             .first(where: \.isKeyWindow)

//     }
// }

// extension AppDelegate: RCTBridgeDelegate {
//     public func sourceURL(for bridge: RCTBridge!) -> URL! {
//         #if DEBUG
//         return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "App", fallbackResource: nil)
//         #else
//         return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
//         #endif
//     }
// }
  

