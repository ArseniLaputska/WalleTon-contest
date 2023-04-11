//
//  StickersEnum.swift
//  WalleTon
//
//  Created by Arseni Laputska on 27.03.23.
//

enum Stickers: String {
    case start
    case loading
    case main
    case password
    case success
    case waiting
    case congratulations
    case testTime
    case created
    case tooBad
    case recovery
    
    var name: String {
        switch self {
            case .start:
                return "Start"
            case .loading:
                return "Loading"
            case .main:
                return "Main"
            case .password:
                return "Password"
            case .success:
                return "Success"
            case .waiting:
                return "Waiting TON"
            case .congratulations:
                return "Congratulations"
            case .testTime:
                return "Test Time"
            case .created:
                return "Created"
            case .tooBad:
                return "Too Bad"
            case .recovery:
                return "Recovery Phrase"
        }
    }
    
    var type: String {
        return "tgs"
    }
}
