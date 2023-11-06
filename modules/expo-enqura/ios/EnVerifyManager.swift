import React
import EnQualify
import AVFoundation
import UIKit
import CoreNFC

public class EnverifyManager: EnVerifyDelegate {
  private init() {
  }

  public static let shared = EnverifyManager()
  var agentRequestType: AgentRequestType = .none
  var isNFCRetry: Bool = false
  var userManager = UserManager.shared
  
  public func luminosityAnalyzed(result: String) {
     debugPrint("not implemented yet")
  }
  
  public func agentRequest(eventData: String) {
    if !EnVSession.isFrontCameraOpen() {
      //x: frontCameraErrorPopup()
      return
    }
    
    switch (eventData) {
    case "livenessControlRetried".lowercased():
      agentRequestType = .liveness
      faceRetry()
      break
    case "nfcRetried".lowercased():
      agentRequestType = .nfc
      nfcRetry()
      break
    case "ocrRetried".lowercased():
      agentRequestType = .ocr
      idRetry()
      break
    case "faceRecognitionRetried".lowercased():
      agentRequestType = .faceRecognition
      faceRetry()
      break
    case "backToVideoCall".lowercased():
      agentRequestType = .agent
      EnVerify.startVideoChat()
      break
    default:
      agentRequestType = .agent
      debugPrint( "unknown agent request eventData: " + eventData)
      break
    }
  }
  
  public func idVerifyReady() {
    debugPrint("Id verify started : " + EnVSession.getId())
  }
  
  public func idSelfVerifyReady() {
    print("idSelfVerifyReady")
    EnVerify.idTypeCheckFrontStart()
  }
  
  public func callWait() {
    //TODO: Agent beklerken gözükmesi gereken ekran çağırılacak.
  }
  
  public func callStart() {
     debugPrint("not implemented yet")
  }
  
  public func idTypeCheck() {
    debugPrint("id type check started")
    if agentRequestType == .ocr {
      EnVerify.setSpeaker(soundOn: false)
    } else {
      EnVerify.setSpeaker(soundOn: true)
      EnVerify.startLuminosityAnalyzer()
    }
  }
  
  public func idTypeCheckCompleted() {
    debugPrint("id type check completed")
    EnVerify.idFakeCheckStart()
  }
  
  public func idFakeCheck() {
    debugPrint("fake check")
  }
  
  public func idFakeCheckCompleted() {
    debugPrint("fake check completed")
    EnVerify.idFrontStart()
  }
  
  public func idFront() {
    debugPrint("idFront start")
  }
  
  public func idFrontCompleted() {
    print("idFrontCompleted")
    EnVerify.idBackStart()
  }
  
  public func idBack() {
    debugPrint("back start")
  }
  
  public func idBackCompleted() {
    EnVerify.idDocStore()
  }
  
  public func idDocCompleted() {
    debugPrint("not implemented yet")
  }
  
  public func nfcVerify() {
    debugPrint("nfcVerify start")
    if agentRequestType == .nfc {
        EnVerify.setSpeaker(soundOn: false)
    } else{
        EnVerify.setSpeaker(soundOn: true)
    }
  }
  
  public func nfcVerifyCompleted() {
    debugPrint("Nfc completed : " + EnVerifyCustomerChip.shared.getIdentityType())
    EnVerify.nfcStore()
  }
  
  public func faceDetect() {
    if agentRequestType == .faceRecognition || agentRequestType == .liveness {
      EnVerify.setSpeaker(soundOn: false)
    } else {
      EnVerify.setSpeaker(soundOn: true)
    }
  }
  
  public func faceDetectCompleted() {
    if agentRequestType == .faceRecognition {
      agentRequestType = .agent
      EnVerify.startVideoChat()
    } else {
      EnVerify.faceStore()
      EnVerify.smileDetectStart()
    }
  }
  
  public func smileDetect() {
    debugPrint("smileDetect start")
  }
  
  public func smileDetectCompleted() {
    debugPrint("smileDetectCompleted completed")
    //MARK: "0" Zor değer.
    userManager.getLivenessValue() == 0 ? EnVerify.eyeCloseIntervalStart() : EnVerify.eyeCloseStart()
  }
  
  public func eyeClose() {
    debugPrint("eyeClose start")
  }
  
  public func eyeCloseDetected() {
    debugPrint("Eye close completed" + String(EnVerifyCustomerFace.shared.getChipConfidence()))
    EnVerify.faceCompleteStart()
  }
  
  public func faceUp() {
    debugPrint("faceUp")
  }
  
  public func faceUpDetected() {
    EnVerify.faceCompleteStart()
  }
  
  public func faceLeft() {
    debugPrint("not implemented yet")
  }
  
  public func faceLeftDetected() {
    EnVerify.faceCompleteStart()
  }
  
  public func faceRight() {
    debugPrint("not implemented yet")
  }
  
  public func faceRightDetected() {
    EnVerify.faceCompleteStart()
  }
  
  public func eyeCloseInterval() {
    debugPrint("not implemented yet")
  }
  
  public func eyeCloseIntervalDetected() {
    EnVerify.eyeOpenIntervalStart()
  }
  
  public func eyeOpenInterval() {
    debugPrint("not implemented yet")
  }
  
  public func eyeOpenIntervalDetected() {
    randomLiveness()
  }
  
  //MARK: Random Liveness
  private func randomLiveness() {
    let randDetection = Int.random(in: 1..<4)
    switch (randDetection) {
    case 1:
      EnVerify.faceUpStart()
      break
    case 2:
      EnVerify.faceLeftStart()
      break
    case 3:
      EnVerify.faceRightStart()
      break
    default:
      EnVerify.faceRightStart()
      break
    }
  }
  
  public func hangupLocal() {
    print("Hangup Local Start")
    EnVerify.onHangupCall()
    EnVerify.onExitCall()
    //TODO: Anasayfaya dönecek fonksiyon yaz
  }
  
  public func hangupRemote() {
    print("Hangup Remote Start")
    EnVerify.onExitCall()
    //TODO: Anasayfaya dönecek fonksiyon yaz
  }
  
  public func failure() {
    print("Failure start")
    print("Failure agentRequestType ", agentRequestType)
  }
  
  public func tokenError() {
    debugPrint("not implemented yet")
  }
  
  public func noConnectionError() {
    debugPrint("not implemented yet")
  }
  
  public func idFakeDetected() {
    debugPrint("fake detected")
  }
  
  public func idDocStoreCompleted() {
   debugPrint("not implemented yet")
  }
  
  public func nfcStoreCompleted() {
    debugPrint("not implemented yet")
  }
  
  public func faceStoreCompleted() {
    //MARK: Tekrarlamadan gelindiğini anlamak için.
    debugPrint("agentRequestType : \(agentRequestType)")
    if userManager.getFaceUploadDataState() {
      userManager.setFaceUploadDataState(value: false)
    } else {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        //TODO: Face Result ekranı çağırılacak, devam butonunda onConfirmFaceWithOutPop çağırılacak tekrarlamak için onRetryFace çağırılacak.
        //EnVerify.onConfirmFaceWithOutPop()
      }
    }
  }
  
  public func idTypeBackCheck() {
    debugPrint("id type back check started")
  }
  
  public func nfcCompleted() {
    debugPrint("not implemented yet")
  }
  
  private func uploadFaceData() {
    if agentRequestType == .nfc {
      agentRequestType = .agent
      UserManager.shared.setFaceUploadDataState(value: true)
      EnVerify.uploadFaceData()
    }
  }
  
  public func faceCompleted() {
    debugPrint("not implemented yet")
  }
  
  public func idVerifyExited() {
    print("Enverify Exit")
  }
  
  public func timeoutFailure() {
    if agentRequestType == .ocr || EnVerify.isCallAnswered {
      //TODO: tekrar mı edecek, iptal mi edecek ekran gerekli --> FAIL EKRANI
    } else {
      EnVerify.handleFail()
    }
  }
  
  public func idCheckFailure() {
    if agentRequestType == .ocr || EnVerify.isCallAnswered {
      //TODO: tekrar mı edecek, iptal mi edecek ekran gerekli --> FAIL EKRANI
    } else {
      EnVerify.handleFail()
    }
  }
  
  public func tokenFailure() {
    return
  }
  
  public func connectionFailure() {
    debugPrint("connectionFailure")
  }
  
  public func nfcFailure() {
    print("agentRequestType \(agentRequestType)")
    EnVerify.handleFail()
    //TODO: NFC FAIL EKRANI GELECEK
  }
  
  public func nfcBACDATAFailure() {
    agentRequestType = .agent
    print(#function)
  }
  
  public func faceLivenessCheckFailure() {
    if EnVerifyCustomerFace.shared.isHashSuccess() {
      print("isHashSuccess", EnVerifyCustomerFace.shared.isHashSuccess())
    }
    EnVerify.handleFail()
    //TODO: FACE FAIL EKRANI GELECEK
  }
  
  public func idRetry() {
    print(#function)
    EnVerify.idTypeCheckFrontStart()
  }
  
  public func nfcRetry() {
    if #available(iOS 13.0, *) {
      let nfcStart = EnVerify.nfcStart()
      print("nfcStart: \(nfcStart)")
      
      if nfcStart != NFCStartResponseType.success.rawValue {
        return
      }
    } else {
      return
    }
  }
  
  public func faceRetry() {
    EnVerify.faceDetectStart()
  }
  
  public func hostConnected() {
    debugPrint("not implemented yet")
  }
  
  public func resolutionChanged() {
    let videoSize = EnVSession.getVideoSize()
    print("Resolution changed: ", videoSize)
  }
  
  public func callConnectionFailure() {
    EnVerify.noConnectionAction()
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
      EnVerify.handleCallFail()
    }
  }
  
  public func integrationAddCompleted() {
    print("integrationAddCompleted")
  }
  
  public func integrationAddFailure() {
    print("integrationAddFailure")
  }
  
  public func resultGetCompleted(_ value: EnQualify.EnverifyVerifyCallResult?) {
    if let model = value, let message = model.result {
        print("resultGetCompleted : \(message)")
    }
  }
  
  public func resultGetFailure() {
    EnVerify.onExitCall()
  }
  
  public func sessionStartFailure() {
    print("SESSIONFAIL")
  }
  
  public func sessionStartCompleted(sessionUid: String) {
    sendRequestIntegration()
  }
  
  public func getAuthTokenFailure() {
    debugPrint("not implemented yet")
  }
  
  public func getAuthTokenCompleted() {
    debugPrint("not implemented yet")
  }
  
  public func roomIDSendFailure() {
    debugPrint("not implemented yet")
  }
  
  public func roomIDSendCompleted() {
    debugPrint("not implemented yet")
  }
  
  public func idDocStoreFailure() {
    if self.agentRequestType == .ocr || EnVerify.isCallAnswered {
        //TODO: OCR FAIL EKRANI GELECEK
    } else {
        EnVerify.handleFail()
    }
  }
  
  public func addChipStoreFailure() {
    EnVerify.handleFail()
  }
  
  public func addChipStoreCompleted() {
    debugPrint("not implemented yet")
  }
  
  public func addFaceCompleted() {
    debugPrint("not implemented yet")
  }
  
  public func addFaceFailure() {
    EnVerify.handleFail()
  }
  
  public func requestVideoAudioPermissionsResult(_ granted: Bool) {
    if !EnVerify.checkPermissions() {
        DispatchQueue.main.async {
            //self.presentCameraSettings(vc: self)
        }
    }
  }
  
  public func forceHangup() {
    print("Force Hangup Start")
    EnVerify.onHangupCall()
  }
  
  public func idTextRecognitionTimeout() {
    //MARK: kaldığı yerden devam etmesi için kapatıldı.
    if self.agentRequestType == .ocr || EnVerify.isCallAnswered {
        //TODO: OCR FAIL EKRANI GELECEK
        EnVerify.handleFail() // for stopping loop.
    } else {
        EnVerify.handleFail()
    }
  }
  
  public func callSessionCloseResult(status: EnQualify.EnVerifyCallSessionStatusTypeEnum) {
    debugPrint("not implemented yet")
  }
  
  public func dismissBeforeAnswered() {
    debugPrint("not implemented yet")
  }
  
  public func dismissCallWait() {
    debugPrint("not implemented yet")
  }
  
  public func screenRecorderOnStart() {
    print("screenRecorderOnStart")
  }
  
  public func screenRecorderOnComplete() {
    debugPrint("File path recording : filepath")
  }
  
  public func screenRecorderOnError(eventData: String) {
    debugPrint("screenRecorderOnError eventData: ", eventData)
  }
  
  public func screenRecorderOnAppend() {
    debugPrint("not implemented yet")
  }
  
  public func cardFrontDetectStarted() {
    EnVerify.startCardHoloDetect()
  }
  
  public func cardFrontDetected() {
    debugPrint("not implemented yet")
  }
  
  public func cardBackDetectStarted() {
    debugPrint("Card Back Detect Started")
  }
  
  public func cardBackDetected() {
    debugPrint("Card Back Detected")
  }
  
  public func cardHoloDetectStarted() {
    debugPrint("Card Holo Detect Started")
  }
  
  public func cardHoloDetected() {
    debugPrint("Card Holo Detected")
  }
  
  public func videoUploadSuccess() {
    debugPrint("video upload success")
  }
  
  public func videoUploadFailure() {
    debugPrint("video upload failure")
  }
  
  public func maximumCallTimeExpired() {
    debugPrint("maximumCallTimeExpired")
  }

  // custom methods ----
  private func getAppSettings(completionHandler: @escaping () -> ()){
    EnVerify.setMSPrivateKey(value: "12345678901234567890")
    EnVerify.setSSLPinning(required: true)
    EnVerify.setShowLogs(value: true)
    AppSettings().getConfigurations(key: "devtest"){ bool in
      EnVerify.getAuthToken(UserDefaults.standard.string(forKey: "apiServerUser"), UserDefaults.standard.string(forKey: "apiServer") ?? ""){(_) -> () in
        completionHandler()
      }
    }
  }

  private func setCustomerInformation() {
    // data RN tarafından beslenicek
    EnVerify.callType = "NewCustomer"
    EnVSession.setUserName("Nadir")
    EnVSession.setUserSurname("Kılınç")
    EnVerify.identityNo = "49867297574"
    EnVerify.identityType = "T.C Kimlik Kartı"
    EnVerify.sessionAddPhone = "5555555555"
    EnVerify.sessionAddEmail = "enqura@enqura.com"
  }

  private func setSettings() {
    setEnverifyButtons()
    guard let path = Bundle.main.path(forResource: "test", ofType: "mov") else { return }
    EnVerify.agentDummyVideoPlayer = AVPlayer(url: URL(fileURLWithPath: path)) // add .mov video player
    EnVerify.agentDummyImage = UIImage(named: "imgLaunch") // add img player
  }

  private func setEnverifyButtons() {
    EnVerify.iconStartButton(iconStartButton)
    EnVerify.iconExitButton(iconExitButton)
    EnVerify.iconCallButton(iconCallButton)
    EnVerify.iconHangupButton(iconHangupButton)
    EnVerify.iconRetryButton(iconRetryButton)
    EnVerify.iconExitRetryButton(iconExitRetryButton)
    EnVerify.iconHangupChatButton(iconHangupChatButton)
    EnVerify.iconHangupRetryButton(iconHangupRetryButton)
    EnVerify.iconRotateButton(iconRotateButton)
    EnVerify.iconChatRotateButton(iconChatRotateButton)
  }

  private func sendRequestIntegration() {
    let name = "Nadir"
    let surname = "Kılınç"
    
    //MARK: - Coming From KPSInfo viewcontroller
    let serialNumber = "A18N96415"
    let expiryDate = "26.03.2029"
    let birthday = "22.10.1996"
    let gender = "Erkek"
    
    let nationalityCode = "TR"
    let reqModel = EnVerifyCallIDRegistrationModel(fatherName: "Enqura",
                                                   motherName: "Enqrua",
                                                   birthPlace: "Istanbul",
                                                   registrationPlaceFamilyRow: "1",
                                                   registrationPlacePersonalRow: "1",
                                                   identificationCardSerial: serialNumber,
                                                   identificationCardRecord: "1",
                                                   identityType: "T.C Kimlik Kartı",
                                                   identityNo: "49867297574",
                                                   documentNo: "1234567890",
                                                   name: name,
                                                   surname: surname,
                                                   gender: gender,
                                                   birthDate: birthday,
                                                   nationality: "TR",
                                                   issuedBy: "Enqura",
                                                   issuedDate: "24.11.2028",
                                                   expireDate: expiryDate)
    
    let addressModel = EnVerifyCallAddressRegistrationModel(addressType: "Ev",
                                                            district: "Türkiye",
                                                            districtCode: "1",
                                                            street: "Türkiye",
                                                            streetCode: "1",
                                                            villageCode: "1",
                                                            addressDetail: "Türkiye",
                                                            townCode: "1",
                                                            town: "Türkiye",
                                                            city: "Türkiye",
                                                            cityCode: "1",
                                                            country: "Türkiye",
                                                            countryCode: "1")
    
    let data: String = "{\"VideoKayıtOnayı\":\"Alındı\",\"KvkkOnayı\":\"Alındı\"}"
    EnVerify.integrationAdd(type: "Session", callType: "NewCustomer", phone: "05399999999", email: "info@enqura.com", data: data, addressRegistration: addressModel, iDRegistration: reqModel)
  }

  public func initialize() {
    getAppSettings(){
      DispatchQueue.main.async {
        
        self.setCustomerInformation()
        let holoDetectionType = "HOLO_ANY_DETECT"
        EnVerifyCustomerCard.shared.setHoloDetectionType(holoDetectionType: holoDetectionType)
        EnVerifyCustomerCard.shared.setDetectionThreshold(threshold: 0.9)
        if EnVerify.checkPermissions() {
          let referenceUUID = UUID().uuidString
          if (!EnVerify.idvSettings(domainName: UserDefaults.standard.string(forKey: "domainName"),
                                    certificateNames: ["enqura","enqura1"],
                                    aiUsername: UserDefaults.standard.string(forKey: "aiUserName"),
                                    aiPassword: UserDefaults.standard.string(forKey: "aiPassword"),
                                    signalingServer: UserDefaults.standard.string(forKey: "signalServer"),
                                    stunServer: UserDefaults.standard.string(forKey: "stunServer"),
                                    turnServer: UserDefaults.standard.string(forKey: "turnServer"),
                                    turnUsername: UserDefaults.standard.string(forKey: "turnServerUser"),
                                    turnPassword: UserDefaults.standard.string(forKey: "turnServerKey"),
                                    backOfficeBasePath: UserDefaults.standard.string(forKey: "apiServer"),
                                    userNameForToken: UserDefaults.standard.string(forKey: "apiServerUser"),
                                    referenceID: referenceUUID
                                   )) {
            print("Check settings")
            return
          }
          
          self.setSettings()
          DispatchQueue.main.async {
            guard EnVerify.idVerifyStart(self) else {return}
            EnVerify.requestVideoAudioPermissions()
          }
        } else {
          //self.presentCameraSettings(vc: self)
          debugPrint("self.presentCameraSettings(vc: self)")
        }
      }
    }
  }


  // -------- end of enverify delegate
  
// //   override func viewDidLoad() {
// //     super.viewDidLoad()
    
// //     view.backgroundColor = .white
    
// //   }
  
//   @objc func viewDidLoadNative() {
//     getAppSettings(){
//       DispatchQueue.main.async {
        
//         self.setCustomerInformation()
//         let holoDetectionType = "HOLO_ANY_DETECT"
//         EnVerifyCustomerCard.shared.setHoloDetectionType(holoDetectionType: holoDetectionType)
//         EnVerifyCustomerCard.shared.setDetectionThreshold(threshold: 0.9)
//         if EnVerify.checkPermissions() {
//           let referenceUUID = UUID().uuidString
//           if (!EnVerify.idvSettings(domainName: UserDefaults.standard.string(forKey: "domainName"),
//                                     certificateNames: ["enqura","enqura1"],
//                                     aiUsername: UserDefaults.standard.string(forKey: "aiUserName"),
//                                     aiPassword: UserDefaults.standard.string(forKey: "aiPassword"),
//                                     signalingServer: UserDefaults.standard.string(forKey: "signalServer"),
//                                     stunServer: UserDefaults.standard.string(forKey: "stunServer"),
//                                     turnServer: UserDefaults.standard.string(forKey: "turnServer"),
//                                     turnUsername: UserDefaults.standard.string(forKey: "turnServerUser"),
//                                     turnPassword: UserDefaults.standard.string(forKey: "turnServerKey"),
//                                     backOfficeBasePath: UserDefaults.standard.string(forKey: "apiServer"),
//                                     userNameForToken: UserDefaults.standard.string(forKey: "apiServerUser"),
//                                     referenceID: referenceUUID
//                                    )) {
//             print("Check settings")
//             return
//           }
          
//           self.setSettings()
//           DispatchQueue.main.async {
//             guard EnVerify.idVerifyStart(self) else {return}
//             EnVerify.requestVideoAudioPermissions()
//           }
//         } else {
//           self.presentCameraSettings(vc: self)
//         }
//       }
//     }
//   }
  
//   public func presentCameraSettings(vc: UIViewController) {
//     let alertController = UIAlertController(title: "uyarı", message: "Kamera veya Mikrofon Kapalı \n\n Lütfen Ayarlar Ekranına Girin \n Kamera ve Mikrofonu Açıp, Uygulamayı Tekrar Çalıştırın.", preferredStyle: .alert)
//     alertController.addAction(UIAlertAction(title: "ayarlar", style: .cancel) {_ in
//       if let url = URL(string: UIApplication.openSettingsURLString) {
//         UIApplication.shared.open(url, options: [:], completionHandler: { _ in
          
//         })
//       }
//     })
//     vc.present(alertController, animated: true)
//   }
  
//   private func setEnverifyButtons() {
//     EnVerify.iconStartButton(iconStartButton)
//     EnVerify.iconExitButton(iconExitButton)
//     EnVerify.iconCallButton(iconCallButton)
//     EnVerify.iconHangupButton(iconHangupButton)
//     EnVerify.iconRetryButton(iconRetryButton)
//     EnVerify.iconExitRetryButton(iconExitRetryButton)
//     EnVerify.iconHangupChatButton(iconHangupChatButton)
//     EnVerify.iconHangupRetryButton(iconHangupRetryButton)
//     EnVerify.iconRotateButton(iconRotateButton)
//     EnVerify.iconChatRotateButton(iconChatRotateButton)
//   }
  
//   @objc private func setSettings() {
//     setEnverifyButtons()
//     guard let path = Bundle.main.path(forResource: "test", ofType: "mov") else { return }
//     EnVerify.agentDummyVideoPlayer = AVPlayer(url: URL(fileURLWithPath: path)) // add .mov video player
//     EnVerify.agentDummyImage = UIImage(named: "imgLaunch") // add img player
//   }
  
//   @objc public func startNFCService() {
    
//     print("startNFCService")
//   }
  
//   private func getAppSettings(completionHandler: @escaping () -> ()){
//     EnVerify.setMSPrivateKey(value: "12345678901234567890")
//     EnVerify.setSSLPinning(required: true)
//     EnVerify.setShowLogs(value: true)
//     AppSettings().getConfigurations(key: "devtest"){ bool in
//       EnVerify.getAuthToken(UserDefaults.standard.string(forKey: "apiServerUser"), UserDefaults.standard.string(forKey: "apiServer") ?? ""){(_) -> () in
//         completionHandler()
//       }
//     }
//   }
  
  public func startVerification() -> Void {
    DispatchQueue.main.async {
      self._startVerification()
    }
  }
  
  public func _startVerification() -> Void {
    // var items = [String]()
    // let message = RCTConvert.nsString()
    // if message != "" {
    //   items.append(message!)
    // }
    // if items.count == 0 {
    //   print("No message to share")
    //   return
    // }
    //let controller = RCTPresentedViewController()
    //let shareController = UIActivityViewController(activityItems: items, applicationActivities: nil)
    //shareController.popoverPresentationController?.sourceView = controller?.view
    //controller?.present(shareController, animated: true, completion: nil)
    
    agentRequestType = .busy
    
    DispatchQueue.main.async {
      guard EnVerify.selfServiceStart(self) else {return}
    }
  }
  
  
  
//   private func setCustomerInformation() {
//     // data RN tarafından beslenicek
//     EnVerify.callType = "NewCustomer"
//     EnVSession.setUserName("Nadir")
//     EnVSession.setUserSurname("Kılınç")
//     EnVerify.identityNo = "49867297574"
//     EnVerify.identityType = "T.C Kimlik Kartı"
//     EnVerify.sessionAddPhone = "5555555555"
//     EnVerify.sessionAddEmail = "enqura@enqura.com"
//   }
  
//   private func sendRequestIntegration() {
//     let name = "Nadir"
//     let surname = "Kılınç"
    
//     //MARK: - Coming From KPSInfo viewcontroller
//     let serialNumber = "A18N96415"
//     let expiryDate = "26.03.2029"
//     let birthday = "22.10.1996"
//     let gender = "Erkek"
    
//     let nationalityCode = "TR"
//     let reqModel = EnVerifyCallIDRegistrationModel(fatherName: "Enqura",
//                                                    motherName: "Enqrua",
//                                                    birthPlace: "Istanbul",
//                                                    registrationPlaceFamilyRow: "1",
//                                                    registrationPlacePersonalRow: "1",
//                                                    identificationCardSerial: serialNumber,
//                                                    identificationCardRecord: "1",
//                                                    identityType: "T.C Kimlik Kartı",
//                                                    identityNo: "49867297574",
//                                                    documentNo: "1234567890",
//                                                    name: name,
//                                                    surname: surname,
//                                                    gender: gender,
//                                                    birthDate: birthday,
//                                                    nationality: "TR",
//                                                    issuedBy: "Enqura",
//                                                    issuedDate: "24.11.2028",
//                                                    expireDate: expiryDate)
    
//     let addressModel = EnVerifyCallAddressRegistrationModel(addressType: "Ev",
//                                                             district: "Türkiye",
//                                                             districtCode: "1",
//                                                             street: "Türkiye",
//                                                             streetCode: "1",
//                                                             villageCode: "1",
//                                                             addressDetail: "Türkiye",
//                                                             townCode: "1",
//                                                             town: "Türkiye",
//                                                             city: "Türkiye",
//                                                             cityCode: "1",
//                                                             country: "Türkiye",
//                                                             countryCode: "1")
    
//     let data: String = "{\"VideoKayıtOnayı\":\"Alındı\",\"KvkkOnayı\":\"Alındı\"}"
//     EnVerify.integrationAdd(type: "Session", callType: "NewCustomer", phone: "05399999999", email: "info@enqura.com", data: data, addressRegistration: addressModel, iDRegistration: reqModel)
//   }
  
//   @objc func viewWillAppearNative() {
//     //setConfigurationValues()
//   }
  
//   @objc func OCRCompleteNative() {
//     print(#function)
//     DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//       EnVerify.onConfirmDocWithoutPop()
//     }
//   }
  
//   // Bu fonksiyon gidicek, onConfirmDoc da çağırılacak
//   @objc func NFCStartNative() {
//     print(#function)
//     if #available(iOS 13.0, *) {
//       let nfcStart = EnVerify.nfcStart()
//       if nfcStart != NFCStartResponseType.success.rawValue {
//         EnVerify.faceDetectStart()
//       }
//     } else {
//       EnVerify.faceDetectStart()
//     }
//   }
  
//   @objc func onRetryDocNative() {
//     print(#function)
//     EnVerify.onRetryDoc()
//   }
  
//   @objc func faceStartNative() {
//     print(#function)
//     self.popFrontViewController("MainSSView") {
//       EnVerify.onConfirmNFC()
//     }
//   }
  
//   @objc func NFCRetryNative() {
//     print(#function)
//     isNFCRetry = true
//     EnVerify.onRetryNFC()
//   }
}
