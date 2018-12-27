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
        
        let array : Array = code_to_run!.components(separatedBy: "-")
        for num in array{
            if(num == "00"){
                expression.append(0)
            }else if(num == "01"){
                expression.append(1)
            }else if(num == "02"){
                expression.append(2)
            }else if(num == "03"){
                expression.append(3)
            }
        }
        return Data(bytes: expression)
    }
}
