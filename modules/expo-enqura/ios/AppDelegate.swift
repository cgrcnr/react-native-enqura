import ExpoModulesCore
import EnQualify
import Foundation
import React

public class AppDelegate: ExpoAppDelegateSubscriber {
  var navigationController = EnVerify.getNavigationController()
  var userManager = UserManager.shared

  public var window: UIWindow?

  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //let rootViewController = getVCFromModuleName("DD4", nil, launchOptions)
    //let rootViewController = UIApplication.shared.firstKeyWindow?.rootViewController
    //let rootViewController = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
    //let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController
    let rootViewController = MainViewController()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = rootViewController

    navigationController = UINavigationController(rootViewController: rootViewController!)
    EnVerify.setNavigationController(navigator: navigationController!)

    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
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
    // The app has become active.
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

  func navigateToIDView() {
    //let vc = getVCFromModuleName(moduleName, initialProperties, launchOptions)
    // DispatchQueue.main.async {
    //   //EnVerify.idViewStart(vc: window?.rootViewController)
    //   EnVerify.idViewStart(vc: self.window?.rootViewController as! UIViewController)
    // }
  }
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
  

