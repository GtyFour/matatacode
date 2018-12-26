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
    
    func evaluate(message: WKScriptMessage) -> Data {
        let code_to_run = message.body as? String
        var a = [UInt8]()
        let array : Array = code_to_run!.components(separatedBy: "-")
        for num in array{
            if(num == "00"){
                a.append(0)
            }else if(num == "01"){
                a.append(1)
            }else if(num == "02"){
                a.append(2)
            }else if(num == "03"){
                a.append(3)
            }
        }
        let data = Data(bytes: a)
        return data
    }
}
