//
//  WeakScriptMessageDelegate.swift
//  MatataCode
//
//  Created by GtyFour on 2018/12/24.
//  Copyright © 2018 GtyFour. All rights reserved.
//

import UIKit
import WebKit
///内存管理,使用delegate类防止ViewController不释放
class WeakScriptMessageDelegate: NSObject, WKScriptMessageHandler {
    weak var scriptDelegate: WKScriptMessageHandler?
    init(_ scriptDelegate: WKScriptMessageHandler) {
        self.scriptDelegate = scriptDelegate
        super.init()
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        scriptDelegate?.userContentController(userContentController, didReceive: message)
    }
    deinit {
        print("WeakScriptMessageDelegate is deinit")
    }
}
