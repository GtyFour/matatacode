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

public enum Dircetion{
    case left
    case right
    case line
}
/*
 //web报文参考
 
 window.webkit.messageHandlers.runcode.postMessage('movebackward_1');
 window.webkit.messageHandlers.runcode.postMessage('moveforward_1');
 window.webkit.messageHandlers.runcode.postMessage('turnleft_90degree');
 window.webkit.messageHandlers.runcode.postMessage('turnright_90degree');
 window.webkit.messageHandlers.runcode.postMessage('doaction_action1');
 window.webkit.messageHandlers.runcode.postMessage('dodance_dance1');
 window.webkit.messageHandlers.runcode.postMessage('playmusic_music1');
 window.webkit.messageHandlers.runcode.postMessage('playmelody_melody1');
 window.webkit.messageHandlers.runcode.postMessage('optimizeline_true');
 //两开花
 
 window.webkit.messageHandlers.runcode.postMessage('optimizeright_90degree_true');
 window.webkit.messageHandlers.runcode.postMessage('optimizeleft_90degree_true');
 //三及第
 
 window.webkit.messageHandlers.runcode.postMessage('eyeshowscolor_#ff0000_left_1');
 window.webkit.messageHandlers.runcode.postMessage('eyeshowscolor_#ff0000_right_1');
 window.webkit.messageHandlers.runcode.postMessage('eyeshowscolor_#ff0000_both_1');
 window.webkit.messageHandlers.runcode.postMessage('playalto_do_meter_meter1');
 window.webkit.messageHandlers.runcode.postMessage('playtreble_do_meter_meter1');
 //大四喜
 */
public class MataEvaluator: NSObject {
    
    public var expression = [UInt8]()
    
    public func MataEvaluator(){
        
    }
    public func stopcode()->Data{
        expression.removeAll()
        expression.append(UInt8(132))
        return Data(bytes: expression)
    }
    public func evaluate(message: WKScriptMessage) -> Data {
        expression.removeAll()
        let message_str = message.body as? String
        let array : Array = message_str!.components(separatedBy: "_")
        switch array.first {
        case "moveforward":
            switch array.last{
            case "1":moveForward();break
            case "2":moveForward(2);break
            case "3":moveForward(3);break
            case "4":moveForward(4);break
            case "5":moveForward(5);break
            case "6":moveForward(6);break
            default:moveForward();break
            }
            break
            
        case "movebackward":
            switch array.last{
            case "1":moveBackward();break
            case "2":moveBackward(2);break
            case "3":moveBackward(3);break
            case "4":moveBackward(4);break
            case "5":moveBackward(5);break
            case "6":moveBackward(6);break
            default:moveBackward();break
            }
            break
            
            
        case "wait":
            switch array.last{
            case "1":wait(1);break
            case "2":wait(2);break
            case "3":wait(3);break
            case "4":wait(4);break
            case "5":wait(5);break
            case "6":wait(6);break
            case "7":wait(7);break
            case "8":wait(8);break
            case "9":wait(9);break
            case "10":wait(10);break
            default:wait(1);break
            }
            break
            
        case "turnleft":
            switch array.last{
            case "30degree":turnLeft(30);break
            case "36degree":turnLeft(36);break
            case "45degree":turnLeft(45);break
            case "60degree":turnLeft(60);break
            case "72degree":turnLeft(72);break
            case "90degree":turnLeft();break
            case "108degree":turnLeft(108);break
            case "120degree":turnLeft(120);break
            case "135degree":turnLeft(135);break
            case "144degree":turnLeft(144);break
            case "150degree":turnLeft(150);break
            default:turnLeft();break
            }
            break
            
        case "turnright":
            switch array.last{
            case "30degree":turnRight(30);break
            case "36degree":turnRight(36);break
            case "45degree":turnRight(45);break
            case "60degree":turnRight(60);break
            case "72degree":turnRight(72);break
            case "90degree":turnRight();break
            case "108degree":turnRight(108);break
            case "120degree":turnRight(120);break
            case "135degree":turnRight(135);break
            case "144degree":turnRight(144);break
            case "150degree":turnRight(150);break
            default:turnRight();break
            }
            break
            
        case "doaction":
            switch array.last{
            case "action1":doAction(1);break
            case "action2":doAction(2);break
            case "action3":doAction(3);break
            case "action4":doAction(4);break
            case "action5":doAction(5);break
            case "action6":doAction(6);break
            default:doAction(1);break
            }
            break
            
        case "dodance":
            switch array.last{
            case "dance1":doDance(1);break
            case "dance2":doDance(2);break
            case "dance3":doDance(3);break
            case "dance4":doDance(4);break
            case "dance5":doDance(5);break
            case "dance6":doDance(6);break
            default:doDance(1);break
            }
            break
            
        case "playmusic":
            switch array.last{
            case "music1":playMusic(1);break
            case "music2":playMusic(2);break
            case "music3":playMusic(3);break
            case "music4":playMusic(4);break
            case "music5":playMusic(5);break
            case "music6":playMusic(6);break
            default:playMusic(1);break
            }
            break
            
        case "optimizeline":
            switch array.last{
            case "true":adjustmentStraight(true);break
            case "false":adjustmentStraight(false);break
            default:adjustmentStraight(true);break
            }
            break
            
        case "playmelody":
            switch array.last{
            case "melody1":playMelody(1);break
            case "melody2":playMelody(2);break
            case "melody3":playMelody(3);break
            case "melody4":playMelody(4);break
            case "melody5":playMelody(5);break
            case "melody6":playMelody(6);break
            case "melody7":playMelody(7);break
            case "melody8":playMelody(8);break
            case "melody9":playMelody(9);break
            case "melody10":playMelody(10);break
            default:playMelody(1);break
            }
            break
            
            
            
        case "playalto":
            var tone:Int = 1
            var meter:Int = 1
            switch array[1]{
            case "do":tone = 1;break
            case "re":tone = 2;break
            case "mi":tone = 3;break
            case "fa":tone = 4;break
            case "sol":tone = 5;break
            case "la":tone = 6;break
            case "ti":tone = 7;break
            default:tone = 1;break
            }
            switch array.last{
            case "meter1":meter = 1;break
            case "meter2":meter = 2;break
            case "meter3":meter = 3;break
            case "meter4":meter = 4;break
            case "meter5":meter = 5;break
            case "meter6":meter = 6;break
            default:meter = 1;break
            }
            playAlto(tone,meter)
            break
            
        case "playtreble":
            var tone:Int = 1
            var meter:Int = 1
            switch array[1]{
            case "do":tone = 1;break
            case "re":tone = 2;break
            case "mi":tone = 3;break
            case "fa":tone = 4;break
            case "sol":tone = 5;break
            case "la":tone = 6;break
            case "ti":tone = 7;break
            default:tone = 1;break
            }
            switch array.last{
            case "meter1":meter = 1;break
            case "meter2":meter = 2;break
            case "meter3":meter = 3;break
            case "meter4":meter = 4;break
            case "meter5":meter = 5;break
            case "meter6":meter = 6;break
            default:meter = 1;break
            }
            playTreble(tone,meter)
            break
            
        case "optimizeright":
            var angle:Int = 90
            var step:Bool = true
            switch array[1]{
            case "30degree":angle = 30;break
            case "36degree":angle = 36;break
            case "45degree":angle = 45;break
            case "60degree":angle = 60;break
            case "72degree":angle = 72;break
            case "90degree":angle = 90;break
            case "108degree":angle = 108;break
            case "120degree":angle = 120;break
            case "135degree":angle = 135;break
            case "144degree":angle = 144;break
            case "150degree":angle = 150;break
            default:angle = 90;break
            }
            switch array.last{
            case "true":step = true;break
            case "false":step = false;break
            default:step = true;break
            }
            adjustmentTurn(Dircetion.right,angle,step)
            break
            
        case "optimizeleft":
            var angle:Int = 90
            var step:Bool = true
            switch array[1]{
            case "30degree":angle = 30;break
            case "36degree":angle = 36;break
            case "45degree":angle = 45;break
            case "60degree":angle = 60;break
            case "72degree":angle = 72;break
            case "90degree":angle = 90;break
            case "108degree":angle = 108;break
            case "120degree":angle = 120;break
            case "135degree":angle = 135;break
            case "144degree":angle = 144;break
            case "150degree":angle = 150;break
            default:angle = 90;break
            }
            switch array.last{
            case "true":step = true;break
            case "false":step = false;break
            default:step = true;break
            }
            adjustmentTurn(Dircetion.left,angle,step)
            break
            
        case "eyeshowscolor"://不再使用 2019年09月23日14:21:27 GTY
            /*下位机未实现*/
            if array.count == 4{
                setBothEye(Int(array[2])!,
                           Int(array[1])!,
                           Int(array[3])!)
            }else{
                let color:String = array.last!
                setBothEye(color)
            }
            break
            
            
            
        //--------2019年09月06日16:02:17 新增协议 sensor add on
            
        case "wheel":
            var lspeed:Int = 15
            var rspeed:Int = 15
            switch array[1]{
            case "0":lspeed = 0;break
            case "1":lspeed = 1;break
            case "2":lspeed = 2;break
            case "3":lspeed = 3;break
            case "4":lspeed = 4;break
            case "5":lspeed = 5;break
            case "6":lspeed = 6;break
            case "7":lspeed = 7;break
            case "8":lspeed = 8;break
            case "9":lspeed = 9;break
            case "10":lspeed = 10;break
            case "11":lspeed = 11;break
            case "12":lspeed = 12;break
            default:lspeed = 15;break
            }
            switch array[2]{
            case "0":rspeed = 0;break
            case "1":rspeed = 1;break
            case "2":rspeed = 2;break
            case "3":rspeed = 3;break
            case "4":rspeed = 4;break
            case "5":rspeed = 5;break
            case "6":rspeed = 6;break
            case "7":rspeed = 7;break
            case "8":rspeed = 8;break
            case "9":rspeed = 9;break
            case "10":rspeed = 10;break
            case "11":rspeed = 11;break
            case "12":rspeed = 12;break
            default:rspeed = 15;break
            }
            setWheels(lspeed, rspeed);
            break
            
        case "sensorwaitdata":
            var data:Int = 1
            switch array[1]{
            case "1":data = 1;break
            case "2":data = 2;break
            case "3":data = 3;break
            case "4":data = 4;break
            case "5":data = 5;break
            case "6":data = 6;break
            default:data = 1;break
            }
            setSensorWaitData(data);
            break
            
        case "sensorsenddata":
            var data:Int = 1
            switch array[1]{
            case "1":data = 1;break
            case "2":data = 2;break
            case "3":data = 3;break
            case "4":data = 4;break
            case "5":data = 5;break
            case "6":data = 6;break
            default:data = 1;break
            }
            setSensorSendData(data);
            break
            
        case "sensorwait":
            var condition:Int = 1
            switch array[1]{
            case "1":condition = 1;break
            case "2":condition = 2;break
            case "3":condition = 3;break
            case "4":condition = 4;break
            case "5":condition = 5;break
            case "6":condition = 6;break
            case "7":condition = 7;break
            case "8":condition = 8;break
            case "9":condition = 9;break
            case "10":condition = 10;break
            default:condition = 1;break
            }
            setSensorWaitCondition(condition);
            break
            
        //sensorled matataboteye
        case "sensorled":
            var metho:Int = 1 //1-all 2-plus 3-minus
            var color:Int = 1
            var level:Int = 1
            switch array[1]{
            case "all":metho = 1;break
            case "plus":metho = 2;break
            case "minus":metho = 3;break
            default:metho = 1;break
            }
            switch array[2]{
            case "1":color = 1;break
            case "2":color = 2;break
            case "3":color = 3;break
            case "4":color = 4;break
            case "5":color = 5;break
            case "6":color = 6;break
            case "7":color = 7;break
            default:color = 1;break
            }
            switch array[3]{
            case "1":level = 1;break
            case "2":level = 2;break
            case "3":level = 3;break
            case "4":level = 4;break
            case "5":level = 5;break
            case "6":level = 6;break
            default:level = 1;break
            }
            setSensorLed(metho,color,level);
            break
            
        case "matataboteye":
            var eye:Int = 1 //1-both 2-left 3-right
            var color:Int = 1
            var level:Int = 1
            switch array[1]{
            case "both":eye = 1;break
            case "left":eye = 2;break
            case "right":eye = 3;break
            default:eye = 1;break
            }
            switch array[2]{
            case "1":color = 1;break
            case "2":color = 2;break
            case "3":color = 3;break
            case "4":color = 4;break
            case "5":color = 5;break
            case "6":color = 6;break
            case "7":color = 7;break
            default:color = 1;break
            }
            switch array[3]{
            case "1":level = 1;break
            case "2":level = 2;break
            case "3":level = 3;break
            case "4":level = 4;break
            case "5":level = 5;break
            case "6":level = 6;break
            default:level = 1;break
            }
            setBotEye(eye,color,level);
            break

            
        default:break
        }
        return Data(bytes: expression)
    }
    //:MARK 基础运动
    public func moveForward(){
        expression.append(0)
    }
    public func moveForward(_ step:Int){
        expression.append(32)
        expression.append(UInt8(step))
    }
    public func moveBackward(){
        expression.append(3)
    }
    public func moveBackward(_ step:Int){
        expression.append(35)
        expression.append(UInt8(step))
    }
    public func turnLeft(){
        expression.append(1)
    }
    public func turnRight(){
        expression.append(2)
    }
    public func turnLeft(_ angle:Int){
        expression.append(33)
        expression.append(UInt8(angle))
    }
    public func turnRight(_ angle:Int){
        expression.append(34)
        expression.append(UInt8(angle))
    }
    public func doAction(_ action:Int){
        expression.append(59)
        var value = action
        if value <= 1{ value = 1}
        if value >= 6{ value = 6}
        expression.append(UInt8(value))
    }
    
    
    //:MARK 艺术模块
    public func doDance(_ dance:Int){
        expression.append(58)
        var value = dance
        if value <= 1{ value = 1}
        if value >= 6{ value = 6}
        expression.append(UInt8(value))
        
    }
    public func playMusic(_ music:Int){
        expression.append(57)
        var value = music
        if value <= 1{ value = 1}
        if value >= 6{ value = 6}
        expression.append(UInt8(value))
    }
    public func playMelody(_ music:Int){
        expression.append(84)
        var value = music
        if value <= 1{ value = 1}
        if value >= 10{ value = 10}
        expression.append(UInt8(value))
    }
    public func playAlto(_ alto:Int, _ meter: Int){
        expression.append(112)
        var value = alto
        if value <= 1{ value = 1}
        if value >= 7{ value = 7}
        expression.append(UInt8(value))
        var value_m = meter
        if value_m <= 1{ value_m = 1}
        if value_m >= 6{ value_m = 6}
        expression.append(UInt8(value_m))
    }
    public func playAlto(_ alto:Int){
        expression.append(80)
        var value = alto
        if value <= 1{ value = 1}
        if value >= 7{ value = 7}
        expression.append(UInt8(value))
    }
    public func playTreble(_ treble: Int, _ meter: Int){
        expression.append(113)
        var value = treble
        if value <= 1{ value = 1}
        if value >= 7{ value = 7}
        expression.append(UInt8(value))
        var value_m = meter
        if value_m <= 1{ value_m = 1}
        if value_m >= 6{ value_m = 6}
        expression.append(UInt8(value_m))
    }
    public func playTreble(_ treble: Int){
        expression.append(81)
        var value = treble
        if value <= 1{ value = 1}
        if value >= 7{ value = 7}
        expression.append(UInt8(value))
    }
    //:MARK 控制
    public func stop(){
        expression.append(132)
    }
    public func start(){
        expression.append(133)
    }
    public func wait(_ second:Int){
        expression.append(62)
        expression.append(UInt8(second))
    }
//        public func setLeftEye(r: Int, g: Int, b: Int){
//            expression.append(132)
//        }
    //        public func setRightEye(r: Int, g: Int, b: Int){
    //            expression.append(132)
    //        }
    public func setBothEye(_ color_str:String){
        //使用单指令的工厂模式，待协议更新后适配
        //80 aa 55 06 03 ff ff ff
        expression.append(128)
        expression.append(170)
        expression.append(85)
        expression.append(6)
        expression.append(3)
        
        var color_ar = color_str.color()
        expression.append(color_ar[1])
        expression.append(color_ar[0])
        expression.append(color_ar[2])
        print(color_ar)
    }
    public func setBothEye(_ eye:Int,_ color:Int, _ level:Int){
        //使用单指令的工厂模式，待协议更新后适配
        //左右眼单控未实现
        expression.append(61)
        let data:Int = level * 16 + color
        print(data)
        expression.append(UInt8(data))
    }
    
    public func adjustmentTurn(_ direction:Dircetion, _ angle:Int, _ step:Bool){
        if direction == .left{
            expression.append(97)
        }else if direction == .right{
            expression.append(98)
        }
        expression.append(UInt8(angle))
        if step{
            expression.append(0)
        }else{
            expression.append(1)
        }
    }
    public func adjustmentStraight(_ step:Bool){
        expression.append(96)
        expression.append(1)
        if step{
            expression.append(0)
        }else{
            expression.append(1)
        }
    }
    //-------2019年09月06日10:29:20 sensor add on新增协议--gty--重做左右眼
    
    public func setBotEye(_ which: Int,_ color: Int,_ level: Int){
        expression.append(100)
        var data_color:Int
        data_color = ( color - 1 ) * 16 + level
        expression.append(UInt8(data_color))
        switch which {
        case 1:
            expression.append(11)
        case 2:
            expression.append(5)
        case 3:
            expression.append(6)
        default:
            expression.append(11)
        }
    }
    public func setSensorLed(_ metho: Int,_ color: Int,_ level: Int){
        expression.append(104)
        expression.append(UInt8(metho))
        var data_color:Int
        data_color = ( color - 1 ) * 16 + level
        expression.append(UInt8(data_color))
    }
    public func setWheels(_ lspeed: Int,_ rspeed: Int){
        expression.append(100)
        var data_speed:Int
        data_speed = lspeed * 16 + rspeed
        expression.append(UInt8(data_speed))
        expression.append(1)
    }
    public func setSensorWaitCondition(_ condition: Int){
        expression.append(102)
        expression.append(16)
        expression.append(UInt8(condition))
    }
    public func setSensorSendData(_ data: Int){
        expression.append(103)
        expression.append(1)
        expression.append(UInt8(data))
    }
    public func setSensorWaitData(_ data: Int){
        expression.append(102)
        expression.append(16)
        var data_send:Int
        data_send = data + 10
        expression.append(UInt8(data_send))
    }
    

}

extension String {
    func color() -> [UInt8] {
        var doString = self
        // 去除空格
        doString = doString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        var length = doString.count
        // 判断是否含有 “#”
        if doString.hasPrefix("#"){
            let index = doString.index(doString.startIndex, offsetBy:1)
            doString = doString.substring(from: index)
            length = doString.count
        }
        if length == 6 {
            let rRang = doString.index(doString.startIndex, offsetBy: 2)
            let redStr = doString.substring(to: rRang)
            doString = doString.substring(from: rRang)
            let gRang = doString.index(doString.startIndex, offsetBy: 2)
            let greenStr = doString.substring(to: gRang)
            doString = doString.substring(from: gRang)
            let blueRang = doString.index(doString.startIndex, offsetBy: 2)
            let blueStr = doString.substring(to: blueRang)
            // 声明三个变量
            var r:CUnsignedInt = 0 ,g:CUnsignedInt = 0, b:CUnsignedInt = 0
            var color = [UInt8]()
            // 获取其值
            Scanner.init(string: redStr).scanHexInt32(&r)
            Scanner.init(string: greenStr).scanHexInt32(&g)
            Scanner.init(string: blueStr).scanHexInt32(&b)
            color.append(UInt8(r))
            color.append(UInt8(b))
            color.append(UInt8(g))
            return color
        }
        return [255,255,255]
    }
}
