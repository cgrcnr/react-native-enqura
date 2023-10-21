import Foundation

public class LocalStorage {
    private let userDefaults = UserDefaults.standard
    
    //    MARK: - Strings
    func storeString(key: String, value: String) {
        userDefaults.set(value, forKey: key)
    }
    
    func getString(key: String) -> String? {
        return userDefaults.string(forKey: key)
    }
    
    //MARK: - Bools
    func storeBool(key: String, value: Bool) {
        userDefaults.set(value, forKey: key)
    }
    
    func getBool(key: String) -> Bool {
        return userDefaults.bool(forKey: key)
    }
    
    //MARK: - ServiceState
    func storeServiceState(key: String, value: String) {
        userDefaults.set(value, forKey: key)
    }
    
    func getServiceState(key: String) -> String? {
        if let data = userDefaults.object(forKey: key) {
            return data as? String
        }
        return nil
    }
    
    func sync() {
        UserDefaults.standard.synchronize()
    }
    
    //MARK: - Int
    func storeInt(key: String, value: Int) {
        userDefaults.set(value, forKey: key)
    }
    
    func getInt(key: String) -> Int? {
        if let data = userDefaults.object(forKey: key) as? Int {
            return data
        }
        return nil
    }
    
    //MARK: - Float
    func storeFloat(key: String, value: Float) {
        userDefaults.set(value, forKey: key)
    }
    
    func getFloat(key: String) -> Float? {
        if let data = userDefaults.object(forKey: key) as? Float {
            return data
        }
        return nil
    }
}
