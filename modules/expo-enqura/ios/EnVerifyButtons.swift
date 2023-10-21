import UIKit

//MARK: - UI Elements
public var iconStartButton : UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.25 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvStart.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    button.imageView?.alpha = 0.5
    button.isUserInteractionEnabled = false
    return button
} ()

public var iconExitButton : UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.75 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvExit.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconRetryButton: UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.25 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvRetry.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconExitRetryButton : UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.75 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvExit.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconHangupRetryButton : UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.75 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvHangup.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconHangupChatButton : UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.50 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvHangup.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconCallButton: UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.25 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvCall.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconHangupButton : UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.75 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvHangup.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconRotateButton: UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.50 - width/2
    let y = UIScreen.main.bounds.height * 0.85 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "idvRotate.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconChatRotateButton: UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.25  - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: 50,height: 50)
    let image = UIImage(named: "idvRotate.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
} ()

public var iconFlashButton: UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.25 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: 50,height: 50)
    let image = UIImage(named: "flashon.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
}()

public var iconResultButton: UIButton = {
    let button = UIButton(type: UIButton.ButtonType.custom)
    let width: CGFloat = 50
    let height: CGFloat = 50
    let x = UIScreen.main.bounds.width * 0.75 - width/2
    let y = UIScreen.main.bounds.height * 0.90 - height/2
    button.frame = CGRect(x:x, y:y, width: width, height: height)
    let image = UIImage(named: "Searchicon.png", in: Bundle.main, compatibleWith: nil)
    button.setImage(image, for: .normal)
    return button
}()
