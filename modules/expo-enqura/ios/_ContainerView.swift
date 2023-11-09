import UIKit
import EnQualify
import React

public class ContainerView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        // CustomViewController oluşturun
        let customViewController = CustomViewController()
        
        // CustomViewController'ın view'ını ekleyin
        if let customView = customViewController.view {
            addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
            
            // Constraints (kısıtlamalar) ile CustomViewController'ın view'ını yerleştirin
            NSLayoutConstraint.activate([
                customView.topAnchor.constraint(equalTo: topAnchor),
                customView.leadingAnchor.constraint(equalTo: leadingAnchor),
                customView.trailingAnchor.constraint(equalTo: trailingAnchor),
                customView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
}

public class CustomViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        // CustomViewController'ın içeriği burada oluşturulabilir

        let customView = CustomView()
        self.view.addSubview(customView)
    }
}

// public class CustomViewController: UIViewController {
//     public var navigationController = EnVerify.getNavigationController()

//     public override func viewDidLoad() {
//         super.viewDidLoad()

//         let rootViewController = UIViewController()
//         var navigationController = EnVerify.getNavigationController()
//         navigationController = UINavigationController(rootViewController: rootViewController)

//         EnVerify.setNavigationController(navigator: navigationController!)
//         //navigationController.push()
        
//         if let uwNavigationContainer = navigationController {
//             self.addChildViewController(uwNavigationContainer)
//             self.addSubview(uwNavigationContainer.view)
//             // uwNavigationContainer.didMove(toParent: self)
//         }

//     }
// }