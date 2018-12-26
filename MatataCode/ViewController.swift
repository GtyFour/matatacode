//
//  ViewController.swift
//  MatataCode
//
//  Created by GtyFour on 2018/10/31.
//  Copyright © 2018 GtyFour. All rights reserved.
//

import UIKit
import WebKit
import CoreBluetooth
import CmdBluetooth


class ViewController: UIViewController, WKNavigationDelegate,WKScriptMessageHandler, UIScrollViewDelegate,UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scanBtn: UIButton!
    
    var code_to_run : String!
    var bleList = [CmdDiscovery]()
    let centralManager = CmdCentralManager.manager
    let parser = CBleParser()
    let receiverCenter = ReceiveDataCenter()
    let evaluator = MataEvaluator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preCheckBeforeStart()
        parser.dataComingMonitor = receiverCenter
        centralManager.parser = parser
        centralManager.cancelConnect(clearAutoConnect: true)
//        centralManager.autoConnect = true
        
        loadWebView()
    }
    
    @IBAction func scan(_ sender: UIButton) {
        self.bleList.removeAll()
        centralManager.scanWithServices(nil, duration: 5, discoveryHandle: { discovery in
          if discovery.peripheral.name != nil{
                print(discovery)
                self.bleList.insert(discovery, at: 0)
            }
        }, completeHandle: {
            self.tableView.reloadData()
            print("scan finish")
        })
     
    }
    
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        switch message.name {
        case "runcode":
            self.parser.writeDataWithoutResponse(evaluator.evaluate(message: message))
            break
        case "savecode":
            break
        default:
            break
        }
    }

    func loadWebView() {
        //读取主页面
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "runcode")
        scanBtn.addTarget(self, action: #selector(scan), for: .touchUpInside)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let htmlUrl = Bundle.main.url(forResource: "index_code", withExtension: "html", subdirectory: "blockly")
        webView.load(URLRequest.init(url: htmlUrl!))
    }

    func preCheckBeforeStart(){
        //1.进入页面后坚持蓝牙状态。如果开启则提示开启，并提供确定和取消，取消的选项会跳转到提示：只能编码和保存代码块，并且在Runcode消息触发时，提示蓝牙未打开，如拒绝打开则结束，打开则继续执行
        //2.在蓝牙打开的时候进入主动扫描状态，并提示打开小车，链接信号最强的MataLab（最低不低于-60），如未发现任何MataLab，则返回提示未发现可用小车请打开小车，提供不连接选项
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "BLECELL"
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
        }
        cell!.textLabel!.text = bleList[indexPath.row].peripheral.name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        centralManager.connect(bleList[indexPath.row], duration: 10, success: { (central, peripheral) in
             DispatchQueue.main.async {
                print("connect success")
            }
        }, fail: { (error) in
            DispatchQueue.main.async {
                print("connect fail")
            }
        })
    }
    
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI : NSNumber!){
        
    }
}
