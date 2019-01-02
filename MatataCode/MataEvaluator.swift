//
//  MataEvaluator.swift
//  MatataCode
//
//  Created by GtyFour on 2018/12/26.
//  Copyright © 2018 GtyFour. All rights reserved.
//

import Foundation
import WebKit
import CoreBluetooth

class MataEvaluator: NSObject {
    
    var expression = [UInt8]()
    
    func evaluate(message: WKScriptMessage) -> Data {
        let code_to_run = message.body as? String
        print(code_to_run!)
        expression.append(0)
        return Data(bytes: expression)
    }
}
