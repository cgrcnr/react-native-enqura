import Foundation

public class UserManager {
    private init() {}
    
    public static let shared = UserManager()
    
    var localStorage = LocalStorage()
    
    //MARK: - FirstLaunh
    func isFirstLaunch() -> Bool {
        let isFirstLaunch = !localStorage.getBool(key: LocalStorageConstants.KEY_IS_FIRST_LAUNCH)
        
        return isFirstLaunch
    }
    
    func setFirstLaunch(){
        localStorage.storeBool(key: LocalStorageConstants.KEY_IS_FIRST_LAUNCH, value: true)
        localStorage.sync()
    }
    
    //MARK: - Language
    func getAppLanguage() -> String? {
        localStorage.sync()
        return localStorage.getString(key: LocalStorageConstants.KEY_APP_LANGUAGE)
    }
    
    func setAppLanguage(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_APP_LANGUAGE, value: value)
        localStorage.sync()
    }
    
    //MARK: - ConfigurationCode
    func setConfigurationCode(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_CONFIGURATION_CODE, value: value)
    }
    
    func getConfigurationCode() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_CONFIGURATION_CODE)
    }
    
    //MARK: - ServiceState
    func setServiceState(state: String) {
        localStorage.storeServiceState(key: LocalStorageConstants.KEY_SERVICE_STATE, value: state)
        localStorage.sync()
    }
    
    func getServiceState() -> String? {
        localStorage.sync()
        return localStorage.getServiceState(key: LocalStorageConstants.KEY_SERVICE_STATE)
    }
    
    //MARK: - SettingsValues
    // Liveness Mode Value
    func setLivenessValue(value: Int) {
        localStorage.storeInt(key: LocalStorageConstants.KEY_LIVENESS_MODE, value: value)
    }
    
    func getLivenessValue() -> Int? {
        localStorage.getInt(key: LocalStorageConstants.KEY_LIVENESS_MODE)
    }
    
    // OCR Mode Value
    func setOCRValue(value: Int) {
        localStorage.storeInt(key: LocalStorageConstants.KEY_OCR_MODE, value: value)
    }
    
    func getOCRValue() -> Int? {
        localStorage.getInt(key: LocalStorageConstants.KEY_OCR_MODE)
    }
    
    // OCR Check Value
    func setOCRCheckValue(value: Int) {
        localStorage.storeInt(key: LocalStorageConstants.KEY_OCR_CHECK_VALUE, value: value)
    }
    
    func getOCRCheckValue() -> Int? {
        localStorage.getInt(key: LocalStorageConstants.KEY_OCR_CHECK_VALUE)
    }
    
    // Liveness Calibration
    func setLivenessCalibrationValue(value: Int) {
        localStorage.storeInt(key: LocalStorageConstants.KEY_LIVENESS_CALIBRATION, value: value)
    }
    
    func getLivenessCalibrationValue() -> Int? {
        localStorage.getInt(key: LocalStorageConstants.KEY_LIVENESS_CALIBRATION)
    }
    
    // EyeCloseMaxTime
    func setEyeCloseMaxTimeValue(value: Int) {
        localStorage.storeInt(key: LocalStorageConstants.KEY_EYE_CLOSE_MAX_TIME, value: value)
    }
    
    func getEyeCloseMaxTimeValue() -> Int? {
        localStorage.getInt(key: LocalStorageConstants.KEY_EYE_CLOSE_MAX_TIME)
    }
    
    // FaceAngleCalibration
    func setFaceAngleCalibrationValue(value: Int) {
        localStorage.storeInt(key: LocalStorageConstants.KEY_FACE_ANGLE_CALIBRATION, value: value)
    }
    
    func getFaceAngleCalibrationValue() -> Int? {
        localStorage.getInt(key: LocalStorageConstants.KEY_FACE_ANGLE_CALIBRATION)
    }
    
    // SmilingCalibration
    func setSmilingCalibrationValue(value: Float) {
        localStorage.storeFloat(key: LocalStorageConstants.KEY_SMILING_CALIBRATION, value: value)
    }
    
    func getSmilingCalibrationValue() -> Float? {
        localStorage.getFloat(key: LocalStorageConstants.KEY_SMILING_CALIBRATION)
    }
    
    // EyeCloseCalibration
    func setEyeCloseCalibrationValue(value: Float) {
        localStorage.storeFloat(key: LocalStorageConstants.KEY_EYE_CLOSE_CALIBRATION, value: value)
    }
    
    func getEyeCloseCalibrationValue() -> Float? {
        localStorage.getFloat(key: LocalStorageConstants.KEY_EYE_CLOSE_CALIBRATION)
    }
    
    // HoloDetectionType
    func setHoloDetectionType(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_HOLO_DETECTION_TYPE, value: value)
    }
    
    func getHoloDetectionType() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_HOLO_DETECTION_TYPE)
    }
    
    // DetectionThreshold
    func setDetectionThresholdValue(value: Float) {
        localStorage.storeFloat(key: LocalStorageConstants.KEY_DETECTION_THRESHOLD, value: value)
    }
    
    func getDetectionThresholdValue() -> Float? {
        localStorage.getFloat(key: LocalStorageConstants.KEY_DETECTION_THRESHOLD)
    }
    
    //MARK: - User
    // Name
    func setUserName(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_USER_NAME, value: value)
    }
    
    func getUserName() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_USER_NAME)
    }
    
    // Surname
    func setUserSurname(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_USER_SURNAME, value: value)
    }
    
    func getUserSurname() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_USER_SURNAME)
    }
    
    // Tckno
    func setUserTckNo(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_USER_TCKNO, value: value)
    }
    
    func getUserTckNo() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_USER_TCKNO)
    }
    
    //MARK: - ID Information
    // Serial Number
    func setSerialNumber(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_SERIAL_NUMBER, value: value)
    }
    
    func getSerialNumber() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_SERIAL_NUMBER)
    }
    
    // Expiry Date
    func setExpiryDateWithFormat(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_EXPIRY_DATE_NFC_FACE_FORMAT, value: value)
    }
    
    func getExpiryDateWithFormat() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_EXPIRY_DATE_NFC_FACE_FORMAT)
    }
    
    func setExpiryDate(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_EXPIRY_DATE, value: value)
    }
    
    func getExpiryDate() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_EXPIRY_DATE)
    }
    
    // Birthday
    func setBirthdayWithFormat(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_BIRTHDAY_NFC_FACE_FORMAT, value: value)
    }
    
    func getBirthdayWithFormat() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_BIRTHDAY_NFC_FACE_FORMAT)
    }
    
    func setBirthday(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_BIRTHDAY, value: value)
    }
    
    func getBirthday() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_BIRTHDAY)
    }
    
    // Gender
    func setGender(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_GENDER, value: value)
    }
    
    func getGender() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_GENDER)
    }
    
    // Nationality
    func setNationalityNameFlag(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_NATIONALITY_NAME_FLAG, value: value)
    }
    
    func getNationalityNameFlag() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_NATIONALITY_NAME_FLAG)
    }
    
    func setNationalityCode(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_NATIONALITY_CODE, value: value)
    }
    
    func getNationalityCode() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_NATIONALITY_CODE)
    }
    
    // CanAutoClose
    func setCanAutoCloseOpen(value: Bool) {
        localStorage.storeBool(key: LocalStorageConstants.KEY_CAN_AUTO_CLOSE, value: value)
    }
    
    func getCanAutoCloseOpen() -> Bool {
        localStorage.getBool(key: LocalStorageConstants.KEY_CAN_AUTO_CLOSE)
    }
    
    // TransactionDetails
    func setIsTransactionDetailsOpen(value: Bool) {
        localStorage.storeBool(key: LocalStorageConstants.KEY_TRANSACTION_DETAIL, value: value)
    }
    
    func getIsTransactionDetailsOpen() -> Bool {
        localStorage.getBool(key: LocalStorageConstants.KEY_TRANSACTION_DETAIL)
    }
    
    // RoutingScreens
    func setIsRoutingScreensOpen(value: Bool) {
        localStorage.storeBool(key: LocalStorageConstants.KEY_ROUTING_SCREEN, value: value)
    }
    
    func getIsRoutingScreensOpen() -> Bool {
        localStorage.getBool(key: LocalStorageConstants.KEY_ROUTING_SCREEN)
    }
    
    // QueueType
    func setQueueType(value: String) {
        localStorage.storeString(key: LocalStorageConstants.KEY_QUEUE_TYPE, value: value)
    }
    
    func getQueueType() -> String? {
        localStorage.getString(key: LocalStorageConstants.KEY_QUEUE_TYPE)
    }
    // AppRestart
    func getAppNeedsRestart() -> Bool {
        localStorage.sync()
        return localStorage.getBool(key: LocalStorageConstants.KEY_APP_NEEDS_RESTART)
    }
    
    
    // FaceUploadDataState
    func getFaceUploadDataState() -> Bool {
        localStorage.sync()
        return localStorage.getBool(key: LocalStorageConstants.FACE_UPLOAD_DATA_STATE)
    }
    
    func setFaceUploadDataState(value : Bool) {
        localStorage.sync()
        return localStorage.storeBool(key: LocalStorageConstants.FACE_UPLOAD_DATA_STATE, value: value)
    }
    
    func setMediaServer(value : Bool) {
        localStorage.sync()
        return localStorage.storeBool(key: LocalStorageConstants.MEDIA_SERVER, value: value)
    }
    func getMediaServer()-> Bool {
        localStorage.sync()
        return localStorage.getBool(key: LocalStorageConstants.MEDIA_SERVER)
    }
    
    func setLastCallReferenceID(value: String) {
        localStorage.sync()
        return localStorage.storeString(key: LocalStorageConstants.KEY_CALL_REFERENCE_ID, value: value)
    }
    
    func getLastCallReferenceID() -> String? {
        localStorage.sync()
        return localStorage.getString(key: LocalStorageConstants.KEY_CALL_REFERENCE_ID)
    }
    
    func setContinueCallPreference(value: Bool) {
        localStorage.sync()
        return localStorage.storeBool(key: LocalStorageConstants.KEY_CONTINUE_CALL_PREFERENCE, value: value)
    }
    
    func getContinueCallPreference() -> Bool {
        localStorage.sync()
        return localStorage.getBool(key: LocalStorageConstants.KEY_CONTINUE_CALL_PREFERENCE)
    }
}
