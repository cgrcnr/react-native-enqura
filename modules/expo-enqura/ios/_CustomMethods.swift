// //
// //  CustomMethods.swift
// //  DD4
// //
// //  Created by Nadir Kılınç on 04/10/2023.
// //


// import React
// import EnQualify
// import AVFoundation
// import UIKit
// import CoreNFC

// public class CustomMethods: BaseViewController, EnVerifyDelegate {
//   // Kamera ve mic izni iste
//   public static let shared = CustomMethods()

//   var agentRequestType: AgentRequestType = .none
//   var isNFCRetry: Bool = false
  
//   func luminosityAnalyzed(result: String) {
//     print("Ortam Işığı \(result)")
//     if result.contains("DARK") {
//       luminosityAnalyzedPopup()
//     }
//   }
  
//   func agentRequest(eventData: String) {
//     if !EnVSession.isFrontCameraOpen() {
//       frontCameraErrorPopup()
//       return
//     }
    
//     switch (eventData) {
//     case "livenessControlRetried".lowercased():
//       agentRequestType = .liveness
//       faceRetry()
//       break
//     case "nfcRetried".lowercased():
//       agentRequestType = .nfc
//       nfcRetry()
//       break
//     case "ocrRetried".lowercased():
//       agentRequestType = .ocr
//       idRetry()
//       break
//     case "faceRecognitionRetried".lowercased():
//       agentRequestType = .faceRecognition
//       faceRetry()
//       break
//     case "backToVideoCall".lowercased():
//       agentRequestType = .agent
//       EnVerify.startVideoChat()
//       break
//     default:
//       agentRequestType = .agent
//       debugPrint( "unknown agent request eventData: " + eventData)
//       break
//     }
//   }
  
//   public func idVerifyReady() {
//     debugPrint("Id verify started : " + EnVSession.getId())
//   }
  
//   func idSelfVerifyReady() {
//     print("idSelfVerifyReady")
//     EnVerify.idTypeCheckFrontStart()
//   }
  
//   func callWait() {
//     //TODO: Agent beklerken gözükmesi gereken ekran çağırılacak.
//   }
  
//   func callStart() {
//     popFrontViewController("MainVCView") {
//       EnVerify.startVideoChat()
//     }
//     EnVerify.startTimer()
//   }
  
//   func idTypeCheck() {
//     debugPrint("id type check started")
//     if agentRequestType == .ocr {
//       EnVerify.setSpeaker(soundOn: false)
//     } else {
//       EnVerify.setSpeaker(soundOn: true)
//       EnVerify.startLuminosityAnalyzer()
//     }
//   }
  
//   func idTypeCheckCompleted() {
//     debugPrint("id type check completed")
//     EnVerify.idFakeCheckStart()
//   }
  
//   func idFakeCheck() {
//     debugPrint("fake check")
//   }
  
//   func idFakeCheckCompleted() {
//     debugPrint("fake check completed")
//     EnVerify.idFrontStart()
//   }
  
//   func idFront() {
//     debugPrint("idFront start")
//   }
  
//   func idFrontCompleted() {
//     print("idFrontCompleted")
//     EnVerify.idBackStart()
//   }
  
//   func idBack() {
//     debugPrint("back start")
//   }
  
//   func idBackCompleted() {
//     EnVerify.idDocStore()
//   }
  
//   func idDocCompleted() {
//     //MARK: Kimlik bilgilerini ekranda gösterdikten sonra onayla ya basınca burası çalışır.
//     DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//       self.navigationController?.popViewController(animated: true)
      
//       if self.agentRequestType == .ocr {
//         self.agentRequestType = .agent
//         EnVerify.startVideoChat()
//       } else {
//         if #available(iOS 13.0, *) {
//           if NFCTagReaderSession.readingAvailable {
//             let nfcStart = EnVerify.nfcStart()
//             print("nfcStart :\(nfcStart)")
//             if nfcStart != NFCStartResponseType.success.rawValue {
//               EnVerify.faceDetectStart()
//             }
//           }
//         } else {
//           EnVerify.faceDetectStart()
//         }
//       }
//     }
//   }
  
//   func nfcVerify() {
//     debugPrint("nfcVerify start")
//     if agentRequestType == .nfc {
//         EnVerify.setSpeaker(soundOn: false)
//     } else{
//         EnVerify.setSpeaker(soundOn: true)
//     }
    
//     if isNFCRetry {
//       DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//         if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate{

//           print("NFC scan açıldı")
//           appDelegate.navigateToIDView("NFCScan", nil, nil)
//         }
//       }
//     } else {
//       DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//         if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate{
//           print("NFC scan açıldı")

//           appDelegate.navigateToIDView("NFCScan", nil, nil)
//         }
//       }
//     }
//   }
  
//   func nfcVerifyCompleted() {
//     debugPrint("Nfc completed : " + EnVerifyCustomerChip.shared.getIdentityType())
//     EnVerify.nfcStore()
//   }
  
//   func faceDetect() {
//     if agentRequestType == .faceRecognition || agentRequestType == .liveness {
//       EnVerify.setSpeaker(soundOn: false)
//     } else {
//       EnVerify.setSpeaker(soundOn: true)
//     }
//   }
  
//   func faceDetectCompleted() {
//     if agentRequestType == .faceRecognition {
//       agentRequestType = .agent
//       EnVerify.startVideoChat()
//     } else {
//       EnVerify.faceStore()
//       EnVerify.smileDetectStart()
//     }
//   }
  
//   func smileDetect() {
//     debugPrint("smileDetect start")
//   }
  
//   func smileDetectCompleted() {
//     debugPrint("smileDetectCompleted completed")
//     //MARK: "0" Zor değer.
//     userManager.getLivenessValue() == 0 ? EnVerify.eyeCloseIntervalStart() : EnVerify.eyeCloseStart()
//   }
  
//   func eyeClose() {
//     debugPrint("eyeClose start")
//   }
  
//   func eyeCloseDetected() {
//     debugPrint("Eye close completed" + String(EnVerifyCustomerFace.shared.getChipConfidence()))
//     EnVerify.faceCompleteStart()
//   }
  
//   func faceUp() {
    
//   }
  
//   func faceUpDetected() {
//     EnVerify.faceCompleteStart()
//   }
  
//   func faceLeft() {
    
//   }
  
//   func faceLeftDetected() {
//     EnVerify.faceCompleteStart()
//   }
  
//   func faceRight() {
    
//   }
  
//   func faceRightDetected() {
//     EnVerify.faceCompleteStart()
//   }
  
//   func eyeCloseInterval() {
    
//   }
  
//   func eyeCloseIntervalDetected() {
//     EnVerify.eyeOpenIntervalStart()
//   }
  
//   func eyeOpenInterval() {
    
//   }
  
//   func eyeOpenIntervalDetected() {
//     randomLiveness()
//   }
  
//   //MARK: Random Liveness
//   private func randomLiveness() {
//     let randDetection = Int.random(in: 1..<4)
//     switch (randDetection) {
//     case 1:
//       EnVerify.faceUpStart()
//       break
//     case 2:
//       EnVerify.faceLeftStart()
//       break
//     case 3:
//       EnVerify.faceRightStart()
//       break
//     default:
//       EnVerify.faceRightStart()
//       break
//     }
//   }
  
//   func hangupLocal() {
//     print("Hangup Local Start")
//     EnVerify.onHangupCall()
//     EnVerify.onExitCall()
//     //TODO: Anasayfaya dönecek fonksiyon yaz
//   }
  
//   func hangupRemote() {
//     print("Hangup Remote Start")
//     EnVerify.onExitCall()
//     //TODO: Anasayfaya dönecek fonksiyon yaz
//   }
  
//   func failure() {
//     print("Failure start")
//     print("Failure agentRequestType ", agentRequestType)
//   }
  
//   func tokenError() {
    
//   }
  
//   func noConnectionError() {
    
//   }
  
//   func idFakeDetected() {
//     debugPrint("fake detected")
//   }
  
//   func idDocStoreCompleted() {
//     //EnVerify.onConfirmDocWithoutPop()
//     DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//       if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate{
        
//         appDelegate.navigateToIDView("OCRResult", nil, nil)
//       }
//     }
//   }
  
//   func nfcStoreCompleted() {
//     DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//       if self.isNFCRetry {
//         self.isNFCRetry = false
//         self.navigationController?.popViewController(animated: true)
//       }
//       //TODO: NFC RESULT EKRANI GÖSTERILECEK -> ONAYLA BUTONUNDA ONCONFIRMNFC TEKRARLA BUTONUNDA ONRETRYNFC CAGIRILACAK.
//       if let appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate{
        
//         appDelegate.navigateToIDView("NFCResult", nil, nil)
//       }
      
//       //EnVerify.onConfirmNFCWithoutPop()
//     }
//   }
  
//   func faceStoreCompleted() {
//     //MARK: Tekrarlamadan gelindiğini anlamak için.
//     debugPrint("agentRequestType : \(agentRequestType)")
//     if userManager.getFaceUploadDataState() {
//       userManager.setFaceUploadDataState(value: false)
//     } else {
//       DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//         //TODO: Face Result ekranı çağırılacak, devam butonunda onConfirmFaceWithOutPop çağırılacak tekrarlamak için onRetryFace çağırılacak.
// //        EnVerify.onConfirmFaceWithOutPop()
//       }
//     }
//   }
  
//   func idTypeBackCheck() {
//     debugPrint("id type back check started")
//   }
  
//   func nfcCompleted() {
//     debugPrint("agentRequestType : \(agentRequestType)")
//     DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//       if self.agentRequestType == .nfc {
//         self.navigationController?.popViewController(animated: true)
//         EnVerify.startVideoChat()
//         self.uploadFaceData()
//       } else {
//         self.popFrontViewController("MainSSView") {
//           EnVerify.faceDetectStart()
//         }
//       }
//     }
//   }
  
//   private func uploadFaceData() {
//     if agentRequestType == .nfc {
//       agentRequestType = .agent
//       UserManager.shared.setFaceUploadDataState(value: true)
//       EnVerify.uploadFaceData()
//     }
//   }
  
//   func faceCompleted() {
//     //MARK: Tekrarlamadan gelindiğini anlamak için.
//     debugPrint("agentRequestType : \(agentRequestType)")
//     DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//       self.navigationController?.popViewController(animated: true)
      
//       if self.agentRequestType == .liveness {
//         EnVerify.startVideoChat()
//       } else{
//         self.agentRequestType = .agent
//         EnVerify.stopSSStartVC(self)
//         EnVerify.onStartCall()
//       }
//     }
//   }
  
//   func idVerifyExited() {
//     print("Enverify Exit")
//   }
  
//   func timeoutFailure() {
//     if agentRequestType == .ocr || EnVerify.isCallAnswered {
//       //TODO: tekrar mı edecek, iptal mi edecek ekran gerekli --> FAIL EKRANI
//     } else {
//       EnVerify.handleFail()
//     }
//   }
  
//   func idCheckFailure() {
//     if agentRequestType == .ocr || EnVerify.isCallAnswered {
//       //TODO: tekrar mı edecek, iptal mi edecek ekran gerekli --> FAIL EKRANI
//     } else {
//       EnVerify.handleFail()
//     }
//   }
  
//   func tokenFailure() {
//     return
//   }
  
//   func connectionFailure() {
//     debugPrint("connectionFailure")
//   }
  
//   func nfcFailure() {
//     print("agentRequestType \(agentRequestType)")
//     EnVerify.handleFail()
//     //TODO: NFC FAIL EKRANI GELECEK
//   }
  
//   func nfcBACDATAFailure() {
//     agentRequestType = .agent
//     print(#function)
//   }
  
//   func faceLivenessCheckFailure() {
//     if EnVerifyCustomerFace.shared.isHashSuccess() {
//       print("isHashSuccess", EnVerifyCustomerFace.shared.isHashSuccess())
//     }
//     EnVerify.handleFail()
//     //TODO: FACE FAIL EKRANI GELECEK
//   }
  
//   func idRetry() {
//     print(#function)
//     EnVerify.idTypeCheckFrontStart()
//   }
  
//   func nfcRetry() {
//     if #available(iOS 13.0, *) {
//       var nfcStart = EnVerify.nfcStart()
//       print("nfcStart: \(nfcStart)")
      
//       if nfcStart != NFCStartResponseType.success.rawValue {
//         return
//       }
//     } else {
//       return
//     }
//   }
  
//   func faceRetry() {
//     EnVerify.faceDetectStart()
//   }
  
//   func hostConnected() {
    
//   }
  
//   func resolutionChanged() {
//     let videoSize = EnVSession.getVideoSize()
//     print("Resolution changed: ", videoSize)
//   }
  
//   func callConnectionFailure() {
//     EnVerify.noConnectionAction()
//     DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//       EnVerify.handleCallFail()
//     }
//   }
  
//   func integrationAddCompleted() {
//     print("integrationAddCompleted")
//   }
  
//   func integrationAddFailure() {
//     print("integrationAddFailure")
//   }
  
//   func resultGetCompleted(_ value: EnQualify.EnverifyVerifyCallResult?) {
//     if let model = value, let message = model.result {
//         print("resultGetCompleted : \(message)")
//     }
//   }
  
//   func resultGetFailure() {
//     EnVerify.onExitCall()
//   }
  
//   func sessionStartFailure() {
//     print("SESSIONFAIL")
//   }
  
//   func sessionStartCompleted(sessionUid: String) {
//     sendRequestIntegration()
//   }
  
//   func getAuthTokenFailure() {
    
//   }
  
//   func getAuthTokenCompleted() {
    
//   }
  
//   func roomIDSendFailure() {
    
//   }
  
//   func roomIDSendCompleted() {
    
//   }
  
//   func idDocStoreFailure() {
//     if self.agentRequestType == .ocr || EnVerify.isCallAnswered {
//         //TODO: OCR FAIL EKRANI GELECEK
//     } else {
//         EnVerify.handleFail()
//     }
//   }
  
//   func addChipStoreFailure() {
//     EnVerify.handleFail()
//   }
  
//   func addChipStoreCompleted() {
    
//   }
  
//   func addFaceCompleted() {
    
//   }
  
//   func addFaceFailure() {
//     EnVerify.handleFail()
//   }
  
//   func requestVideoAudioPermissionsResult(_ granted: Bool) {
//     if !EnVerify.checkPermissions() {
//         DispatchQueue.main.async {
//             self.presentCameraSettings(vc: self)
//         }
//     }
//   }
  
//   func forceHangup() {
//     print("Force Hangup Start")
//     EnVerify.onHangupCall()
//   }
  
//   func idTextRecognitionTimeout() {
//     //MARK: kaldığı yerden devam etmesi için kapatıldı.
//     if self.agentRequestType == .ocr || EnVerify.isCallAnswered {
//         //TODO: OCR FAIL EKRANI GELECEK
//         EnVerify.handleFail() // for stopping loop.
//     } else {
//         EnVerify.handleFail()
//     }
//   }
  
//   func callSessionCloseResult(status: EnQualify.EnVerifyCallSessionStatusTypeEnum) {
    
//   }
  
//   func dismissBeforeAnswered() {
    
//   }
  
//   func dismissCallWait() {
    
//   }
  
//   func screenRecorderOnStart() {
//     print("screenRecorderOnStart")
//   }
  
//   func screenRecorderOnComplete() {
//     debugPrint("File path recording : filepath")
//   }
  
//   func screenRecorderOnError(eventData: String) {
//     debugPrint("screenRecorderOnError eventData: ", eventData)
//   }
  
//   func screenRecorderOnAppend() {
    
//   }
  
//   func cardFrontDetectStarted() {
//     EnVerify.startCardHoloDetect()
//   }
  
//   func cardFrontDetected() {
    
//   }
  
//   func cardBackDetectStarted() {
//     debugPrint("Card Back Detect Started")
//   }
  
//   func cardBackDetected() {
//     debugPrint("Card Back Detected")
//   }
  
//   func cardHoloDetectStarted() {
//     debugPrint("Card Holo Detect Started")
//   }
  
//   func cardHoloDetected() {
//     debugPrint("Card Holo Detected")
//   }
  
//   func videoUploadSuccess() {
//     debugPrint("video upload success")
//   }
  
//   func videoUploadFailure() {
//     debugPrint("video upload failure")
//   }
  
//   func maximumCallTimeExpired() {
//     hangupLocal()
//     maximumCallTimePopup()
//   }
  
//   override func viewDidLoad() {
//     super.viewDidLoad()
    
//     view.backgroundColor = .white
    
//   }
  
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
  
//   func presentCameraSettings(vc: UIViewController) {
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
  
//   @objc func startVerification(_ options: NSDictionary) -> Void {
//     DispatchQueue.main.async {
//       self._startVerification(options: options)
//     }
//   }
  
//   func _startVerification(options: NSDictionary) -> Void {
//     var items = [String]()
//     let message = RCTConvert.nsString(options["message"])
//     if message != "" {
//       items.append(message!)
//     }
//     if items.count == 0 {
//       print("No message to share")
//       return
//     }
//     //let controller = RCTPresentedViewController()
//     //let shareController = UIActivityViewController(activityItems: items, applicationActivities: nil)
//     //shareController.popoverPresentationController?.sourceView = controller?.view
//     //controller?.present(shareController, animated: true, completion: nil)
    
//     agentRequestType = .busy
    
//     DispatchQueue.main.async {
//       guard EnVerify.selfServiceStart(self) else {return}
//     }
//   }
  
  
  
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
// }
