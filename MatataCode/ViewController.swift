//
//  ViewController.swift
//  MatataCode
//
//  Created by GtyFour on 2018/10/31.
//  Copyright © 2018 GtyFour. All rights reserved.
//

import UIKit
import WebKit



class ViewController: UIViewController, WKNavigationDelegate, UIScrollViewDelegate{
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        self.webView.scrollView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        loadWebView()
    }
    
    func loadWebView() {
        //读取主页面
        if let htmlUrl = Bundle.main.url(forResource: "index_code", withExtension: "html", subdirectory: "blockly") {
            webView.load(URLRequest.init(url: htmlUrl))
        }

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
