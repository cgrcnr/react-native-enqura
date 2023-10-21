import Foundation

public struct LocalStorageConstants {
    public static let KEY_IS_FIRST_LAUNCH = "is_first_launch"
    public static let KEY_APP_LANGUAGE = "app_language"
    public static let KEY_CONFIGURATION_CODE = "configurationKey"
    
    //User
    public static let KEY_USER_NAME = "name"
    public static let KEY_USER_SURNAME = "surname"
    public static let KEY_USER_TCKNO = "tckno"
    
    //SettingsValues
    public static let KEY_SERVICE_STATE = "service_state"
    public static let KEY_LIVENESS_MODE = "liveness_mode"
    public static let KEY_OCR_MODE = "ocr_mode"
    public static let KEY_OCR_CHECK_VALUE = "ocr_check_value"
    public static let KEY_LIVENESS_CALIBRATION = "liveness_calibration"
    public static let KEY_EYE_CLOSE_MAX_TIME = "eye_close_max_time"
    public static let KEY_FACE_ANGLE_CALIBRATION = "face_angle_calibration"
    public static let KEY_SMILING_CALIBRATION = "smiling_calibration"
    public static let KEY_EYE_CLOSE_CALIBRATION = "eye_close_calibration"
    public static let KEY_HOLO_DETECTION_TYPE = "holoDetectionType"
    public static let KEY_DETECTION_THRESHOLD = "detectionThreshold"
    
    public static let KEY_CAN_AUTO_CLOSE = "canAutoClose"
    public static let KEY_TRANSACTION_DETAIL = "transactionDetailsOpen"
    public static let KEY_ROUTING_SCREEN = "routingScreendsOpen"
    
    //ID Information
    public static let KEY_SERIAL_NUMBER = "serialNumber"
    public static let KEY_EXPIRY_DATE_NFC_FACE_FORMAT = "expiryDateNFCFACEFormat"
    public static let KEY_EXPIRY_DATE = "expiryDate"
    public static let KEY_BIRTHDAY_NFC_FACE_FORMAT = "birthdayNFCFACEFormat"
    public static let KEY_BIRTHDAY = "birthday"
    public static let KEY_GENDER = "gender"
    public static let KEY_NATIONALITY_NAME_FLAG = "nationalityNameFlag"
    public static let KEY_NATIONALITY_CODE = "nationalityCode"
    public static let KEY_QUEUE_TYPE = "key_queue_Type"
    public static let KEY_APP_NEEDS_RESTART = "key_app_needs_restart"
    public static let FACE_UPLOAD_DATA_STATE = "FACE_UPLOAD_DATA_STATE"
    public static let MEDIA_SERVER = "MEDIA_SERVER"
    
    //Continue Appointment
    public static let KEY_CALL_REFERENCE_ID = "call_reference_id"
    public static let KEY_CONTINUE_CALL_PREFERENCE = "call_continue_preference"
    
}
