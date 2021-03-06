//
//  AuthenticateSwampMessage.swift
//  Pods
//
//  Created by Yossi Abraham on 22/08/2016.
//
//

import Foundation
import SwiftyJSON

/// [AUTHENTICATE, signature|string, extra|dict]
class AuthenticateSwampMessage: SwampMessage {

    let type: SwampMessageType = .authenticate
    let signature: String
    let extra: [String: Any]

    init(signature: String, extra: [String: Any]) {
        self.signature = signature
        self.extra = extra
    }

    // MARK: SwampMessage protocol

    required init(payload: [Any]) {
        self.signature  = payload[0] as! String
        self.extra = payload[1] as! [String: Any]
    }

    func marshal() -> [Any] {
        return [self.type.rawValue, self.signature, self.extra]
    }
}
