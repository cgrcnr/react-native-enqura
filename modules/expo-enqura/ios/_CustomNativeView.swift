import UIKit
import EnQualify
import React

public class CustomView: UIView {

    var navigationController = EnVerify.getNavigationController()
    public static let shared = CustomView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI2() {
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 5.0

        let rootViewController = UIViewController()
        navigationController = UINavigationController(rootViewController: rootViewController)
        EnVerify.setNavigationController(navigator: navigationController!)
        
        if let navView = navigationController?.view {
            self.addSubview(navView)
        }
    }

    private func setupUI() {
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 2.0

        let label = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 30))
        label.text = "hello from native label ! ! !"
        label.textAlignment = .center
        label.textColor = UIColor.red
        
        label.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        self.addSubview(label)
    }
}



    // var navigationController = EnVerify.getNavigationController()

    // required init(appContext: AppContext? = nil) {
    //     super.init(appContext: appContext)
    //     clipsToBounds = true
        
    //     let rootViewController = UIViewController()
    //     rootViewController.view = self
    
    //     // self.window = UIWindow(frame: UIScreen.main.bounds)
    //     // self.window?.rootViewController = rootViewController

    //     navigationController = UINavigationController(rootViewController: rootViewController)
    //     EnVerify.setNavigationController(navigator: navigationController!)

    //     // window?.rootViewController = navigationController
    //     // self.window?.makeKeyAndVisible()
    //     //addChild(navigationController)

    //     let containerView = UIView()
    //     containerView.frame = CGRect(x: 0, y: 0, width: 320, height: 480) // Örneğin, bir boyut belirleyin
    //     //containerView.addSubview(navigationController.view!)

    //     if let navigationController = navigationController {
    //         containerView.addSubview(navigationController.view)
    //     }

    //     addSubview(containerView)
    // }