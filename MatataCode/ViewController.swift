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
    //MARK: - 成员变量
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tableView: UITableView!//测试用设备列表，隐藏备用
    @IBOutlet weak var scanBtn: UIButton!//测试用扫描按钮，隐藏备用
    
    var code_to_run : String!
    var bleList = [CmdDiscovery]()
    let centralManager = CmdCentralManager.manager
    let parser = CBleParser()
    let receiverCenter = ReceiveDataCenter()
    let evaluator = MataEvaluator()
    
    //MARK: - ViewController自身实现
    override func viewDidLoad() {
        super.viewDidLoad()
        parser.dataComingMonitor = receiverCenter
        centralManager.parser = parser
        centralManager.cancelConnect(clearAutoConnect: true)
        
        loadWebView()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func loadWebView() {
        //读取主页面
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
//        webView.uiDelegate = (self as! WKUIDelegate)
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "runcode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "savecode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "connectbot")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "disconectbot")
        
        scanBtn.addTarget(self, action: #selector(scan), for: .touchUpInside)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let htmlUrl = Bundle.main.url(forResource: "index_code", withExtension: "html", subdirectory: "blockly")
        webView.load(URLRequest.init(url: htmlUrl!))
    }
    
    //MARK: - cmdbluetooth相关
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI : NSNumber!){
        
    }
    
    //MARK: - wkwebview相关相关响应
    func connectbot() {
        //清理记录
        self.bleList.removeAll()
        
        //检查蓝牙
        switch centralManager.centralStatus {
            case 0://unknown:
                print("未获取到蓝牙设备")
                showAlert(title: "Ble Err", message: "Unknown Ble.")
                return
            case 1://resetting:
                print("蓝牙功能重置中")
                showAlert(title: "Ble Err", message: "Ble is resetting.")
                return
            case 2://unsupported:
                print("本设备不支持蓝牙功能")
                showAlert(title: "Ble Err", message: "Device do NOT supports Ble.")
                return
            case 3://unauthorized:
                print("Mata未获得设备的蓝牙授权")
                showAlert(title: "Ble Err", message: "MatataCode is unauthorized for Ble.")
                return
            case 4://poweredOff:
                print("设备蓝牙未未启动")
                showAlert(title: "Ble Err", message: "Ble is poweroff.")
                return
            case 5://poweredOn:
                print("设备蓝牙可用")
                break
            default:
                break
        }
        
        //链接
        centralManager.scanWithServices(nil, duration: 3, discoveryHandle: { discovery in
            if (discovery.peripheral.name == "Matalab")&&(discovery.RSSI >= -50){
                print(discovery)
                self.bleList.insert(discovery, at: 0)
            }
        }, completeHandle: {
            print("scan finish")
            if self.bleList.count == 0{
                self.showAlert(title: "MatataBot", message: "No bot availuable!")
                return
            }
            for bot in self.bleList{
                if (bot.RSSI >= -45){
                    self.centralManager.connect(bot, duration: 5, success: { (central, peripheral) in
                        DispatchQueue.main.async {
                            print("connect success")
                            self.showAlert(title: "MatataBot", message: "Link SUCCESS!!")
                        }
                        return
                    }, fail: { (error) in
                        DispatchQueue.main.async {
                            print("connect fail")
                            self.showAlert(title: "MatataBot", message: "Link fail.")
                        }
                        return
                    })
                }
                
            }
            
        })
    }
    
    func disconnectbot() {
        centralManager.cancelConnect(clearAutoConnect: true)
    }
    func runcode(message: WKScriptMessage){
        if self.centralManager.connectedStatus == false{
            self.showAlert(title: "MatataBot", message: "Please link to MatataBot first!")
            return
        }
        print("runcode")
//        showAlert(title: "Runcode", message: "run")
        self.parser.writeDataWithoutResponse(evaluator.evaluate(message: message))
    }
    
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        
        print(message)
        switch message.name {
        case "runcode":
            self.runcode(message: message)
            break
        case "savecode":
            print("savecode")
            break
        case "connectbot":
            print("connectbot")
            self.connectbot()
            break
        case "disconectbot":
            print("disconectbot")
            self.disconnectbot()
            break
        default:
            break
        }
    }


    //MARK: - tableView相关代理
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
    
    
    
    //MARK: - wkwebview相关代理实现
    func showAlert(title: String, message:String, handler: ((UIAlertAction) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message,preferredStyle: .alert)
        alertController.title = title
        alertController.message = message
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
//        {action in
//            print("点击了确定")
//        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
//        self.view.addSubview(alertController.view)
        self.present(alertController, animated: true, completion: nil)
        
    }
    //Alert弹框
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "好的", style: UIAlertAction.Style.cancel) { (_) in
            completionHandler()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    //confirm弹框
    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { (_) in
            completionHandler(true)
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel) { (_) in
            completionHandler(false)
        }
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    //TextInput弹框
    func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (_) in}
        let action = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) { (_) in
            completionHandler(alert.textFields?.last?.text)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
