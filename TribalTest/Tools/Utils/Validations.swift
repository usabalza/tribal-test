
import Foundation

enum Alert {
    case success
    case failure
    case error
}

enum Valid {
    case success
    case failure(Alert, AlertMessages?)
}

enum ValidationType {
    case email
    case stringWithFirstLetterCaps
    case phoneNo
    case alphabeticString
    case password
    case username
    case name
    case lastname
    case role
    case producer
    case releaseYear
    case location
    case description
    case link
}

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{5,15}$" // Password length 6-15
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$" // e.g. hello sandeep
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$" // SandsHell
    case phoneNo = "[0-9]{10,14}" // PhoneNo 10-14 Digits
    case username = "[A-Za-z0-9.-]{5,12}"
    case name = "[A-Za-z ]{1,30}"
    case year = "[0-9]{4}"
    //Change RegEx according to your Requirement
}

enum AlertMessages: String {
    case inValidEmail = "Email Invalido"
    case invalidFirstLetterCaps = "First Letter should be capital"
    case inValidPhone = "Número de telefono invalido"
    case invalidAlphabeticString = "Invalid String"
    case inValidPSW = "Contraseña Invalida"
    case inValidUN = "Invalid Username"
    case invalidName = "Invalid Name"
    case invalidLastname = "Invalid Lastname"
    case invalidRYear = "Invalid Release Year"
    
    case emptyPhone = "Número de telefono vacío"
    case emptyEmail = "Email vacío"
    case emptyFirstLetterCaps = "Empty Name "
    case emptyAlphabeticString = "Empty String"
    case emptyPSW = "Contraseña vacía"
    case emptyUN  = "Empty Username"
    case emptyName = "Empty Name"
    case emptyLastname = "Empty Lastname"
    case emptyDescription = "Empty Description"
    case emptyRole = "Empty Role"
    case emptyProducer = "Empty Producer"
    case emptyLocation = "Empty Location"
    case emptyLink = "Empty Link"
    case emptyRYear = "Empty Release Year"
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            case .email:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .email, .emptyEmail, .inValidEmail)) {
                    return tempValue
                }
            case .stringWithFirstLetterCaps:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringFirstLetterCaps, .emptyFirstLetterCaps, .invalidFirstLetterCaps)) {
                    return tempValue
                }
            case .phoneNo:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .phoneNo, .emptyPhone, .inValidPhone)) {
                    return tempValue
                }
            case .alphabeticString:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringWithSpace, .emptyAlphabeticString, .invalidAlphabeticString)) {
                    return tempValue
                }
            case .password:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .password, .emptyPSW, .inValidPSW)) {
                    return tempValue
                }
            case .username:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .username, .emptyUN, .inValidUN)) {
                    return tempValue
                }
                
            case .name:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .name, .emptyName, .invalidName)) {
                    return tempValue
                }
            case .lastname:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .name, .emptyLastname, .invalidLastname)) {
                    return tempValue
                }
            case .description:
                if let tempValue = isValidString((valueToBeChecked.inputValue, nil, .emptyDescription, nil)) {
                    return tempValue
                }
            case .role:
                if let tempValue = isValidString((valueToBeChecked.inputValue, nil, .emptyRole, nil)) {
                    return tempValue
                }
            case .producer:
                if let tempValue = isValidString((valueToBeChecked.inputValue, nil, .emptyProducer, nil)) {
                    return tempValue
                }
            case .location:
                if let tempValue = isValidString((valueToBeChecked.inputValue, nil, .emptyLocation, nil)) {
                    return tempValue
                }
            case .link:
                if let tempValue = isValidString((valueToBeChecked.inputValue, nil, .emptyLink, nil)) {
                    return tempValue
                }
            case .releaseYear:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .year, .emptyRYear, .invalidRYear)) {
                    return tempValue
                }
                
            }
        }
        return .success
    }
    
    func isValidString(_ input: (text: String, regex: RegEx?, emptyAlert: AlertMessages, invalidAlert: AlertMessages?)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, input.emptyAlert)
        } else if input.regex != nil && isValidRegEx(input.text, input.regex!) != true {
            return .failure(.error, input.invalidAlert)
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}
