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


public let STATEMENT_DISCONNECTED : String! = "Dis-connected"
public let STATEMENT_CONNECTED : String! = "  Connected  "
public let STATEMENT_IDLE : String! = "Idling"
public let STATEMENT_OFFLINE : String! = "Offline-Mode"
public let STATEMENT_DEBUG : String! = "Debug"

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate,WKScriptMessageHandler, UIScrollViewDelegate,UITableViewDelegate, UITableViewDataSource{
    //MARK: - 成员变量
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var tableView: UITableView!//测试用设备列表，隐藏备用
    @IBOutlet weak var scanBtn: UIButton!//测试用扫描按钮，隐藏备用
    @IBOutlet weak var waitView: UIView!//等待链接小车，隐藏备用
    @IBOutlet weak var waitLabel: UILabel!//等待链接小车提示信息，隐藏备用
    @IBOutlet weak var stateLabel: UILabel!//等待链接小车提示信息，隐藏备用
    @IBOutlet weak var helpImg: UIImageView!//等待链接小车提示信息，隐藏备用
    
    var code_to_run : String!
    var code_to_save : String!
    var code_to_retrive : String!
    var alertview_input : String!
    var bleList = [CmdDiscovery]()
    let centralManager = CmdCentralManager.manager
    let parser = CBleParser()
    let receiverCenter = ReceiveDataCenter()
    let evaluator = MataEvaluator()
    //MARK: - ViewController自身实现
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(disconnect), name: Notification.Name(rawValue: CmdConnectStateNotify), object: false)
        NotificationCenter.default.addObserver(self, selector: #selector(connect), name: Notification.Name(rawValue: CmdConnectStateNotify), object: true)
        NotificationCenter.default.addObserver(self, selector: #selector(disconnect), name: Notification.Name(rawValue: CmdCentralStateNotify), object: false)
//        NotificationCenter.default.addObserver(self, selector: #selector(connect), name: Notification.Name(rawValue: CmdCentralStateNotify), object: true)

        
        stateLabel.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        setState(STATEMENT_DISCONNECTED)
        helpImg.isHidden = true
        waitView.isHidden = true
        waitLabel.isHidden = true
        parser.dataComingMonitor = receiverCenter
        centralManager.parser = parser
        centralManager.cancelConnect(clearAutoConnect: true)
        
        loadWebView()
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        helpImg.isHidden = true
        waitView.isHidden = true
        waitLabel.isHidden = true
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name:Notification.Name(rawValue: CmdCentralStateNotify), object: false)
        NotificationCenter.default.removeObserver(self, name:Notification.Name(rawValue: CmdConnectStateNotify), object: false)
        NotificationCenter.default.removeObserver(self, name:Notification.Name(rawValue: CmdConnectStateNotify), object: true)
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
        webView.uiDelegate = (self as WKUIDelegate)
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "runcode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "savecode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "loadcode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "checkcode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "deletecode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "connectbot")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "stopcode")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "disconectbot")
        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "helpbtn")
        
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissHelp))
        self.helpImg?.addGestureRecognizer(singleTapGesture)
        self.helpImg?.isUserInteractionEnabled = true

        scanBtn.addTarget(self, action: #selector(scan), for: .touchUpInside)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let htmlUrl = Bundle.main.url(forResource: "index_code", withExtension: "html", subdirectory: "blockly")
        webView.load(URLRequest.init(url: htmlUrl!))
    }
    
    //MARK: - cmdbluetooth相关
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI : NSNumber!){
        
    }
    
    func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?) {
        self.setState(STATEMENT_DISCONNECTED)
    }
    
    
    //MARK: - wkwebview相关相关响应
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        /// wkWebView调用js方法
        let js = "document.getElementsByName('google')[0].attributes['value'].value"
        webView.evaluateJavaScript(js) { (response, error) in
            print("response:", response ?? "No Response", "\n", "error:", error ?? "No Error")
        }
    }
    
    func disconnectbot(){
        
        let alertController = UIAlertController(title: "MatataBot", message: "Already linked!!Do you want to Dis-connect?", preferredStyle: UIAlertController.Style.alert)

        let saveAction = UIAlertAction(title: "Dis-Con", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.centralManager.cancelConnect(clearAutoConnect: true)
            self.setState(STATEMENT_DISCONNECTED)
            self.showAlert(title: "MatataBot", message: "Dis-connected!!")
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func connectbot() {
        print("connectbot")
//        if self.centralManager.connectedStatus == true {
//            self.showAlert(title: "MatataBot", message: "Already linked!!")
//            return
//        }
        
        if self.stateLabel.text == STATEMENT_CONNECTED{
            self.disconnectbot()
           
            return
        }
        //展示一个view
        waitView.isHidden = false
        waitLabel.isHidden = false
        //清理记录
        self.bleList.removeAll()
        
        //检查蓝牙
        switch centralManager.centralStatus {
            case 0://unknown:
                print("未获取到蓝牙设备")
                self.waitView.isHidden = true
                self.waitLabel.isHidden = true
                self.setState(STATEMENT_DISCONNECTED)
                showAlert(title: "Ble Err", message: "Unknown Ble.")
                return
            case 1://resetting:
                print("蓝牙功能重置中")
                self.waitView.isHidden = true
                self.waitLabel.isHidden = true
                self.setState(STATEMENT_DISCONNECTED)
                showAlert(title: "Ble Err", message: "Ble is resetting.")
                return
            case 2://unsupported:
                print("本设备不支持蓝牙功能")
                self.waitView.isHidden = true
                self.waitLabel.isHidden = true
                self.setState(STATEMENT_DISCONNECTED)
                showAlert(title: "Ble Err", message: "Device do NOT supports Ble.")
                return
            case 3://unauthorized:
                print("Mata未获得设备的蓝牙授权")
                self.waitView.isHidden = true
                self.waitLabel.isHidden = true
                self.setState(STATEMENT_DISCONNECTED)
                showAlert(title: "Ble Err", message: "MatataCode is unauthorized for Ble.")
                return
            case 4://poweredOff:
                print("设备蓝牙未未启动")
                self.waitView.isHidden = true
                self.waitLabel.isHidden = true
                self.setState(STATEMENT_DISCONNECTED)
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
            if (discovery.peripheral.name == "Matalab")&&(discovery.RSSI >= -90){
                print(discovery)
                self.bleList.insert(discovery, at: 0)
            }
        }, completeHandle: {
            print("scan finish")
            if self.bleList.count == 0{
                self.waitView.isHidden = true
                self.waitLabel.isHidden = true
                self.setState(STATEMENT_DISCONNECTED)
                self.showAlert(title: "MatataBot", message: "No bot availuable!")
                return
            }else{
                for bot in self.bleList{
                    if (bot.RSSI >= -90){
                        self.centralManager.connect(bot, duration: 5, success: { (central, peripheral) in
                            DispatchQueue.main.async {
                                print("connect success")
                                self.waitView.isHidden = true
                                self.waitLabel.isHidden = true
                                self.setState(STATEMENT_CONNECTED)
                                self.showAlert(title: "MatataBot", message: "Link SUCCESS!!")
                            }
                            return
                        }, fail: { (error) in
                            DispatchQueue.main.async {
                                print("connect fail")
                                self.waitView.isHidden = true
                                self.waitLabel.isHidden = true
                                self.setState(STATEMENT_DISCONNECTED)
                                self.showAlert(title: "MatataBot", message: "Link fail.")
                            }
                            return
                        })
                    }else{
                        self.setState(STATEMENT_DISCONNECTED)
                    }
                }
                self.waitView.isHidden = true
                self.waitLabel.isHidden = true
//                self.showAlert(title: "MatataBot", message: "RSSI Fail...Get the bot closer!")
            }
        })
    }
    
    
    func helpbtn() {
        self.helpImg.isHidden = false
    }
    @objc func dismissHelp() {
        self.helpImg.isHidden = true
    }
    
    func savecode(code_xml: WKScriptMessage) {
        self.helpImg.isHidden = true
        self.code_to_save = code_xml.body as? String
        //暂存，等待用户输入文件名
        saveButtonClicked()
    }
    
    func loadcode(message: WKScriptMessage) {
        self.helpImg.isHidden = true
        print("loadcode")
        loadButtonClicked()
    }
    
    func stopcode(message: WKScriptMessage) {
        self.helpImg.isHidden = true
        if self.stateLabel.text == STATEMENT_DISCONNECTED{
            self.showAlert(title: "MatataBot", message: "Please link to MatataBot first!")
            return
        }
        switch centralManager.centralStatus {
        case 0://unknown:
            print("未获取到蓝牙设备")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Unknown Ble.")
            return
        case 1://resetting:
            print("蓝牙功能重置中")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Ble is resetting.")
            return
        case 2://unsupported:
            print("本设备不支持蓝牙功能")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Device do NOT supports Ble.")
            return
        case 3://unauthorized:
            print("Mata未获得设备的蓝牙授权")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "MatataCode is unauthorized for Ble.")
            return
        case 4://poweredOff:
            print("设备蓝牙未未启动")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Ble is poweroff.")
            return
        case 5://poweredOn:
            print("设备蓝牙可用")
            break
        default:
            break
        }
        print("stopcode")
        self.parser.writeDataWithoutResponse(evaluator.stopcode())
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.4){}
    }
    

    func runcode(message: WKScriptMessage){
        self.helpImg.isHidden = true
//        if self.centralManager.connectedStatus == false{
//            self.showAlert(title: "MatataBot", message: "Please link to MatataBot first!")
//            return
//        }
        
        if self.stateLabel.text == STATEMENT_DISCONNECTED{
            self.showAlert(title: "MatataBot", message: "Please link to MatataBot first!")
            return
        }
        switch centralManager.centralStatus {
        case 0://unknown:
            print("未获取到蓝牙设备")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Unknown Ble.")
            return
        case 1://resetting:
            print("蓝牙功能重置中")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Ble is resetting.")
            return
        case 2://unsupported:
            print("本设备不支持蓝牙功能")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Device do NOT supports Ble.")
            return
        case 3://unauthorized:
            print("Mata未获得设备的蓝牙授权")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "MatataCode is unauthorized for Ble.")
            return
        case 4://poweredOff:
            print("设备蓝牙未未启动")
            self.waitView.isHidden = true
            self.waitLabel.isHidden = true
            self.setState(STATEMENT_DISCONNECTED)
            showAlert(title: "Ble Err", message: "Ble is poweroff.")
            return
        case 5://poweredOn:
            print("设备蓝牙可用")
            break
        default:
            break
        }
        print("runcode")
//        showAlert(title: "Runcode", message: "run")
        self.parser.writeDataWithoutResponse(evaluator.evaluate(message: message))
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.4){}
    }
    
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        
        print(message)
        switch message.name {
        case "runcode":
            self.runcode(message: message)
            break
        case "stopcode":
            self.stopcode(message: message)
            break
        case "savecode":
            self.savecode(code_xml: message)
            break
        case "loadcode":
            self.loadcode(message: message)
            break
        case "checkcode":
            self.checkcode()
            break
        case "deletecode":
            self.deleteButtonClicked()
            break
        case "connectbot":
            print("connectbot")
            self.connectbot()
            break
        case "disconectbot":
            print("disconectbot")
            self.disconnectbot()
            break
        case "helpbtn":
            print("help")//helpbtn
            self.helpbtn()
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
    func saveButtonClicked(){
        self.helpImg.isHidden = true
        let alertController = UIAlertController(title: "Save your codes!", message: "Input codes' name:", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "YourProgramName"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.alertview_input = alertController.textFields![0].text
            self.saveCodeFile(self.alertview_input,self.code_to_save)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func loadButtonClicked(){
        self.helpImg.isHidden = true
        let alertController = UIAlertController(title: "Choose your codes!", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "YourProgramName"
        }
        let loadAction = UIAlertAction(title: "Load", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.alertview_input = alertController.textFields![0].text
            if self.loadCodeFile(self.alertview_input) {
                //let js1 = "Blockly.Xml.domToWorkspace(Blockly.Xml.textToDom('<xml xmlns=\"http://www.w3.org/1999/xhtml\"><variables></variables><block type=\"motion_forward\" id=\"Izo9rE_7UER+R.Ykw5}Y\" x=\"18\" y=\"53\"><field name=\"STEP\">1</field></block><block type=\"motion_turnleft\" id=\"3c`O|llrVkk!ya!O2W9G\" x=\"18\" y=\"123\"><field name=\"ANGLE\">90degree</field></block></xml>'), Code.workspace);"
                let js = "Blockly.Xml.domToWorkspace(Blockly.Xml.textToDom('" + self.txtToXml(self.code_to_retrive) + "'), Code.workspace);"
                self.webView.evaluateJavaScript(js) { (response, error) in
                    print("response:", response ?? "No Response", "\n", "error:", error ?? "No Error")
                }
            }else{
                self.showAlert(title: "File ERROR!", message: "The codes you were looking is NOT here!!")
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(loadAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteButtonClicked(){
        self.helpImg.isHidden = true
        let alertController = UIAlertController(title: "Choose your codes!", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "YourProgramName"
        }
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.alertview_input = alertController.textFields![0].text
            if self.deleteCodeFile(self.alertview_input) {
                self.showAlert(title: "Delete success!", message: "The codes were gone.")
            }else{
                self.showAlert(title: "File ERROR!", message: "The codes you attempt to delete is NOT here!!")
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}


//MARK: 文件相关操作
extension ViewController{
    func saveCodeFile(_ codename:String, _ codes:String){
        let DocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        let manager = FileManager.default
        let contents = try? manager.contentsOfDirectory(atPath: DocumentPath.first!)
//        print("contentsOfPath: \(String(describing: contents))")
        let res = contents?.filter({ $0 == codename })
        if res?.count == 0{
            //文件不存在，进行保存
            let StringPath: String = DocumentPath.first! + "/" + codename + ".txt"
            let stringInfo = codes
            try! stringInfo.write(toFile: StringPath, atomically: true, encoding: String.Encoding.utf8)
//            print("String存储文件位置 : \(StringPath)")
        }else{
            //文件已存在，弹框提示
            self.showAlert(title: "File ERROR!", message: "The codes you named ALREADY here!!")
        }
    }
    func loadCodeFile(_ codename:String)->Bool{
        let DocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        let manager = FileManager.default
        let contents = try? manager.contentsOfDirectory(atPath: DocumentPath.first!)
//        print("contentsOfPath: \(String(describing: contents))")
//        print("contents: \(contents)")
//        print("codename: \(codename)")
        let codename_txt = codename + ".txt"
        let res = contents?.filter({ $0 == codename_txt })
        if res?.count == 0{
            //文件不存在，进行错误
            return false
        }else{
            //文件已存在，返回
            let StringPath: String = DocumentPath.first!  + "/" + codename + ".txt"
            let data = manager.contents(atPath: StringPath)
            let codes = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("文件内容: \(String(describing: codes))")
            self.code_to_retrive = codes! as String
//            print(self.txtToXml(self.code_to_retrive))
//            print("---------")
            return true
        }
    }

    func deleteCodeFile(_ codename:String)->Bool{
        let DocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        let manager = FileManager.default
        let contents = try? manager.contentsOfDirectory(atPath: DocumentPath.first!)
        let codename_txt = codename + ".txt"
        let res = contents?.filter({ $0 == codename_txt })
        if res?.count == 0{
            //文件不存在，返回错误
            return false
        }else{
            //文件已存在，进行删除
            let StringPath: String = DocumentPath.first!  + "/" + codename + ".txt"
            try! manager.removeItem(atPath: StringPath)
            return true
        }
    }
    
    func checkcode(){
        self.helpImg.isHidden = true
        let DocumentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        print(DocumentPath)
        let manager = FileManager.default
        let contents = try? manager.contentsOfDirectory(atPath: DocumentPath.first!)
        var cons_show = [String]()
        for con in contents!{
            let str = con.replacingOccurrences(of: ".txt", with: "")
            cons_show.append(str)
        }
        self.showAlert(title: "Code List", message: (String(describing: cons_show)))
    }
    
    func txtToXml(_ txt:String)->String{
//        let index_s = txt.index(txt.startIndex, offsetBy: 0)
//        let subString = txt[index_s..<txt.endIndex]
//        return String(subString)
        let str = txt.replacingOccurrences(of: "\"", with: "\\\"")
        return str
    }
    
    
    func setState(_ statement:String){
        self.helpImg.isHidden = true
        switch statement {
        case STATEMENT_CONNECTED:
            self.stateLabel.textColor = UIColor(red: 0.2, green: 1.0, blue: 0.2, alpha: 1)
            self.stateLabel.text = statement
            break
        case STATEMENT_DISCONNECTED:
            self.stateLabel.textColor = UIColor(red: 1.0, green: 0.2, blue: 0.2, alpha: 1)
            self.stateLabel.text = statement
            break
        default:
            break
        }
    }
}

//MARK: 蓝牙事件响应
extension ViewController{
    @objc func disconnect(){
        setState(STATEMENT_DISCONNECTED)
    }
    
    @objc func connect(){
        setState(STATEMENT_CONNECTED)
    }
}

//MARK:blockly新的版本使用了js的弹框进行输入，增加支持
extension ViewController {
  
}
