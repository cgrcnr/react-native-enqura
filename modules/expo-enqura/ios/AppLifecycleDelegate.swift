import ExpoModulesCore
import EnQualify
import Foundation

public class AppLifecycleDelegate: ExpoAppDelegateSubscriber {
  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    //let rootViewController = getVCFromModuleName("DD4", nil, launchOptions)
    let rootViewController = UIViewController()
    var userManager = UserManager.shared
    // self.window = UIWindow(frame: UIScreen.main.bounds)
    // self.window?.rootViewController = rootViewController
    var navigationController = UINavigationController(rootViewController: rootViewController)
    EnVerify.setNavigationController(navigator: navigationController)
    //window?.rootViewController = navigationController
    //self.window?.makeKeyAndVisible()
    
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
}
