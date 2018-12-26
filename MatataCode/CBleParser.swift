//
//  CBleParser.swift
//  MatataCode
//
//  Created by GtyFour on 2018/12/24.
//  Copyright © 2018 GtyFour. All rights reserved.
//

import Foundation
import CmdBluetooth

class CBleParser: CmdBaseParser {
    
    static let notifyCharacterUUIDStr = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E"
    static let writeCharacterUUIDStr = "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"
    
    /**
     define types for writing data to BLE device, like this
     */
    func writeDataWithResponse(_ data: Data) {
        do {
            try super.writeData(data, characterUUIDStr: CBleParser.writeCharacterUUIDStr, withResponse: true)
        } catch let error {
            print("[Error: ]__Write Data Error    " + "\(error)")
        }
    }
    /**
     write data to BLE without Response
     */
    func writeDataWithoutResponse(_ data: Data) {
        do {
            try super.writeData(data, characterUUIDStr: CBleParser.writeCharacterUUIDStr, withResponse: false)
        } catch let error {
            print("[Error: ]__Write Data Error    " + "\(error)")
        }
    }
    /**
     read data, such as read battery/ read heart rate
     */
    func readData(_ characterUUIDStr: String) {
        do {
            try super.readCharacteristic(characterUUIDStr)

        } catch let error {
            print("[Error: ]__Read Data Error    " + "\(error)")
        }
    }
    //......Many....many ^_^!
}
