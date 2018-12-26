//
//  ReceiveDataCenter.swift
//  MatataCode
//
//  Created by GtyFour on 2018/12/24.
//  Copyright © 2018 GtyFour. All rights reserved.
//

import Foundation
import CoreBluetooth
import CmdBluetooth

class ReceiveDataCenter: NSObject, ParserDataReceiveDelegate {
    
    func receiveData(_ data: Data, peripheral: CBPeripheral, characteristic: CBCharacteristic) {
        let bytes = [UInt8](data)
        print(bytes)
        //[67, 97, 114, 58, 91, 48, 120, 56, 55, 93, 10]/*十进制ASCII*/
        //Car:[0x87]
        print("receive data: " + "\(data)")
    }
}
