//
//  UserDefaultsPasscodeRepository.swift
//  PasscodeLock


import Foundation
import PasscodeLock

public enum PasscodeError: Error {
    case noPasscode
}

class UserDefaultsPasscodeRepository: PasscodeRepositoryType {
    
    private let passcodeKey = "passcode.lock.passcode"
    
    private lazy var defaults: UserDefaults = {
        return UserDefaults.standard
    }()
    
    var hasPasscode: Bool {
        
        if passcode != nil {
            return true
        }
        
        return false
    }
    
    private var passcode: String? {
        
        return defaults.value(forKey: passcodeKey) as? String ?? nil
    }
    
    func save(passcode: String) {
        
        defaults.set(passcode, forKey: passcodeKey)
        defaults.synchronize()
    }
    
    func check(passcode: String) -> Bool {
        return self.passcode == passcode
    }
    
    func delete() {
        
        defaults.removeObject(forKey: passcodeKey)
        defaults.synchronize()
    }
}
