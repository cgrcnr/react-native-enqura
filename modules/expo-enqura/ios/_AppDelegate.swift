// //
// //  AppDelegate.swift
// //  ReactIDVerify
// //
// //  Created by svmac on 9.09.2022.
// //

// import Foundation
// import EnQualify
// @UIApplicationMain
// class AppDelegate: UIResponder, UIApplicationDelegate {
//   var window: UIWindow?
//   var bridge: RCTBridge!
//   let jsCodeLocation: URL = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")

//   var navigationController = EnVerify.getNavigationController()
//   var userManager = UserManager.shared
  
//   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//     let rootViewController = getVCFromModuleName("DD4", nil, launchOptions)
    
//     self.window = UIWindow(frame: UIScreen.main.bounds)
//     self.window?.rootViewController = rootViewController
//     navigationController = UINavigationController(rootViewController: rootViewController)
//     EnVerify.setNavigationController(navigator: navigationController!)
//     window?.rootViewController = navigationController
//     self.window?.makeKeyAndVisible()
    
//     if userManager.isFirstLaunch() {
//       //Defaults
//       userManager.setServiceState(state: "SS_VIDEO_CALL")
//       userManager.setLivenessValue(value: 1) // kolay mod.
//       userManager.setCanAutoCloseOpen(value: true)
//       userManager.setIsTransactionDetailsOpen(value: false)
//       userManager.setIsRoutingScreensOpen(value: false)
//       userManager.setHoloDetectionType(value: "HOLO_ANY_DETECT")
//       userManager.setDetectionThresholdValue(value: 0.9)
//       userManager.setFirstLaunch()
//     }
    
//     return true
//   }
  
  
//   func getVCFromModuleName(_ moduleName: String,_ initialProperties: NSDictionary?, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> UIViewController {
//     var props: [NSObject : AnyObject]? = nil
//     if (initialProperties != nil) {
//       props = initialProperties! as [NSObject : AnyObject]
//     }
//     let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: moduleName, initialProperties:props , launchOptions: launchOptions)
//     let rootViewController = UIViewController()
    
//     rootViewController.view = rootView
//     return rootViewController
//   }
  
//   func navigateToIDView(_ moduleName: String,_ initialProperties: NSDictionary?, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
//     let vc = getVCFromModuleName(moduleName, initialProperties, launchOptions)
//     DispatchQueue.main.async {
//       EnVerify.idViewStart(vc: vc)
//     }
//   }
  
//   func navigateToFaceView(_ moduleName: String,_ initialProperties: NSDictionary?, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
//     let vc = getVCFromModuleName(moduleName, initialProperties, launchOptions)
//     DispatchQueue.main.async { [self] in
//       navigationController?.pushViewController(vc, animated: false)
//     }
//   }
  
//   func navigateToVCView(_ moduleName: String,_ initialProperties: NSDictionary?, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
//     let vc = getVCFromModuleName(moduleName, initialProperties, launchOptions)
//     DispatchQueue.main.async { [self] in
//       navigationController?.pushViewController(vc, animated: false)
//     }
//   }
  
//   func popLastViewController() {
//     DispatchQueue.main.async { [self] in
//       navigationController?.popViewController(animated: false)
//     }
//   }
// }


// extension UIApplication {
  
//   class func topMostViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    
//     if let navigationController = controller as? UINavigationController {
//       return topMostViewController(controller: navigationController.visibleViewController)
//     }
    
//     if let tabController = controller as? UITabBarController {
//       if let selected = tabController.selectedViewController {
//         return topMostViewController(controller: selected)
//       }
//     }
    
//     if let presented = controller?.presentedViewController {
//       return topMostViewController(controller: presented)
//     }
    
//     return controller
//   }
// }
