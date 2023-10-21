import Foundation
import Alamofire
import SwiftyJSON

class AppSettings {
  
  func getConfigurations(key:String, completionHandler: @escaping (Bool) -> ()) {
          let url = "https://dev3.enqura.com/config/enverify/\(key).json"
  //        let headers: HTTPHeaders = [
  //                "Accept": "application/json"
  //             ]
          AF.request(url).responseJSON { response in
              print(response)
              if let error = response.error {
                completionHandler(false)
                  print(error)
              }else {
                  let json = JSON(response.data!)
                  
                  let title = json["Title"].stringValue
                  let apiServerUser = json["APIServerUser"].stringValue
                  let domainName = json["DomainName"].stringValue
                  let certificateName = json["CertificateName"].stringValue
                  let aiUserName = json["AIUsername"].stringValue
                  let aiPassword = json["AIPassword"].stringValue
                  let signalServer = json["SignalServer"].stringValue
                  let stunServer = json["StunServer"].stringValue
                  let turnServer = json["TurnServer"].stringValue
                  let turnServerUser = json["TurnServerUser"].stringValue
                  let turnServerKey = json["TurnServerKey"].stringValue
                  let apiServer = json["APIServer"].stringValue
                  let enableMediaServer = json["enableMediaServer"].boolValue
                  
                  self.setUserfaults(key: key, title: title, apiServerUser: apiServerUser, domainName: domainName, certificateName: certificateName, aiUserName: aiUserName, aiPassword: aiPassword, signalServer: signalServer, stunServer: stunServer, turnServer: turnServer, turnServerUser: turnServerUser, turnServerKey: turnServerKey, apiServer: apiServer, enableMediaServer: enableMediaServer)
                
                completionHandler(true)
            }
          }
      }
  
  func setUserfaults(key:String,
                         title:String,
                         apiServerUser:String,
                         domainName:String,
                         certificateName:String,
                         aiUserName:String,
                         aiPassword:String,
                         signalServer:String,
                         stunServer:String,
                         turnServer:String,
                         turnServerUser:String,
                         turnServerKey:String,
                         apiServer:String,
                         enableMediaServer:Bool) {
          UserDefaults.standard.set(key, forKey: "configurationKey")
          UserDefaults.standard.set(title, forKey: "title")
          UserDefaults.standard.set(apiServerUser, forKey: "apiServerUser")
          UserDefaults.standard.set(domainName, forKey: "domainName")
          UserDefaults.standard.set(certificateName, forKey: "certificateName")
          UserDefaults.standard.set(aiUserName, forKey: "aiUserName")
          UserDefaults.standard.set(aiPassword, forKey: "aiPassword")
          UserDefaults.standard.set(signalServer, forKey: "signalServer")
          UserDefaults.standard.set(stunServer, forKey: "stunServer")
          UserDefaults.standard.set(turnServer, forKey: "turnServer")
          UserDefaults.standard.set(turnServerUser, forKey: "turnServerUser")
          UserDefaults.standard.set(turnServerKey, forKey: "turnServerKey")
          UserDefaults.standard.set(apiServer, forKey: "apiServer")
          UserDefaults.standard.set(enableMediaServer, forKey: "enableMediaServer")
    UserDefaults.standard.synchronize()
      }
}
