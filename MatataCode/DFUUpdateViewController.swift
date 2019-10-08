//
//  DFUUpdateViewController.swift
//  MatataCode
//
//  Created by GtyFour on 2019/9/10.
//  Copyright © 2019 GtyFour. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth
import CmdBluetooth
import iOSDFULibrary

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

class DFUUpdateViewController: NORBaseViewController, NORScannerDelegate,DFUServiceDelegate, DFUProgressDelegate,LoggerDelegate,CBCentralManagerDelegate{
    
    let dfuServiceUUIDString  = "00001530-1212-EFDE-1523-785FEABCD123"
    let ANCSServiceUUIDString = "7905F431-B5CE-4E99-A40F-4B1E122D00D0"

    public var intoDfuCmd = [UInt8]()
    //MARK: - Class properties
    var selectedPeripheral : CBPeripheral?
    var dfuController      : DFUServiceController?
    var selectedFirmware   : DFUFirmware?
    var selectedFileURL    : URL?
    var isImportingFile = false
    var stopFlag = false
    var startFlag = false
    
    var bluetoothManager : CBCentralManager?
    var delegate         : NORScannerDelegate?
    var filterUUID       : CBUUID?
    var peripherals      : [NORScannedPeripheral]
    var timer            : Timer?
    var resourcesPath1   : String?
    
    
    var bleList = [CmdDiscovery]()
    var bleBestRssi:CmdDiscovery!
    let centralManager = CmdCentralManager.manager
    let parser = CBleParser()
    let receiverCenter = ReceiveDataCenter()
    //MARK: - UIViewController Outlets
    
    @IBOutlet weak var botUpgradeInOnedButton: UIButton!
    @IBOutlet weak var conUpgradeInOnedButton: UIButton!
    @IBOutlet weak var towerIntoBleUpgradeButton: UIButton!
    @IBOutlet weak var watchGuideVideoButton: UIButton!
    @IBOutlet weak var dfuSegmentControl: UISegmentedControl!
    @IBOutlet weak var progress: UIProgressView!
    
    
    required init?(coder aDecoder: NSCoder) {
        peripherals = []
        super.init(coder: aDecoder)
    }
    
    //MARK: - UIViewController Actions
    @IBAction func indexChanged(_ sender: AnyObject) {
        segmentAlert()
    }
    func segmentAlert(){
        switch self.dfuSegmentControl.selectedSegmentIndex
        {
        case 0://Bot
        
            self.towerIntoBleUpgradeButton.isHidden = true
            self.botUpgradeInOnedButton.isHidden = false
            self.conUpgradeInOnedButton.isHidden = true
            showAlert(title: "Warning", message: "Make sure you already check the guide video and ready to upgrade your 'MatataBot'.", OkeyHandler: { alert -> Void in
                self.towerIntoBleUpgradeButton.isEnabled = false
                self.botUpgradeInOnedButton.isEnabled = true
                self.conUpgradeInOnedButton.isEnabled = false
            },CancleHandler:{ alert -> Void in
                self.towerIntoBleUpgradeButton.isEnabled = false
                self.botUpgradeInOnedButton.isEnabled = false
                self.conUpgradeInOnedButton.isEnabled = false
            })
            break
        case 2://Con
            self.towerIntoBleUpgradeButton.isHidden = true
            self.botUpgradeInOnedButton.isHidden = true
            self.conUpgradeInOnedButton.isHidden = false
            showAlert(title: "Warning", message: "Make sure you already check the guide video and ready to upgrade your 'MatataController'.", OkeyHandler: { alert -> Void in
                self.towerIntoBleUpgradeButton.isEnabled = false
                self.botUpgradeInOnedButton.isEnabled = false
                self.conUpgradeInOnedButton.isEnabled = true
            },CancleHandler:{ alert -> Void in
                self.towerIntoBleUpgradeButton.isEnabled = false
                self.botUpgradeInOnedButton.isEnabled = false
                self.conUpgradeInOnedButton.isEnabled = false
            })
            break
        case 1://Tower
            self.towerIntoBleUpgradeButton.isHidden = false
            self.botUpgradeInOnedButton.isHidden = true
            self.conUpgradeInOnedButton.isHidden = true
            showAlert(title: "Warning", message: "Make sure you already check the guide video and ready to upgrade your 'MatataController'.", OkeyHandler: { alert -> Void in
                self.towerIntoBleUpgradeButton.isEnabled = true
                self.botUpgradeInOnedButton.isEnabled = false
                self.conUpgradeInOnedButton.isEnabled = false
            },CancleHandler:{ alert -> Void in
                self.towerIntoBleUpgradeButton.isEnabled = false
                self.botUpgradeInOnedButton.isEnabled = false
                self.conUpgradeInOnedButton.isEnabled = false
            })
            break
        default:
            break
        }
    }
    
    @IBAction func towerIntoBleUpgradeButtonTapped(_ sender: AnyObject) {
        print("towerIntoBleUpgradeButtonTapped!");
        switch self.dfuSegmentControl.selectedSegmentIndex
        {
        case 0://Bot
            self.botUpgradeInOnedButton.isEnabled = false
            break
        case 2://Con
            self.conUpgradeInOnedButton.isEnabled = false
            break
        case 1://Tower
            self.towerIntoBleUpgradeButton.isEnabled = false
            break
        default:
            break
        }
        self.dfuSegmentControl.isEnabled = false
        ConfirmTowerUpdateAlert()
    }
    @IBAction func botUpgradeInOnedButtonTapped(_ sender: AnyObject) {
        print("uploadButtonTapped!");
        switch self.dfuSegmentControl.selectedSegmentIndex
        {
        case 0://Bot
            self.botUpgradeInOnedButton.isEnabled = false
            break
        case 2://Con
            self.conUpgradeInOnedButton.isEnabled = false
            break
        case 1://Tower
            self.towerIntoBleUpgradeButton.isEnabled = false
            break
        default:
            break
        }
        self.dfuSegmentControl.isEnabled = false
        ConfirmBotUpdateAlert()
    }
    @IBAction func conUpgradeInOnedButtonTapped(_ sender: AnyObject) {
        print("intoDfuButtonTapped!");
        switch self.dfuSegmentControl.selectedSegmentIndex
        {
        case 0://Bot
            self.botUpgradeInOnedButton.isEnabled = false
            break
        case 2://Con
            self.conUpgradeInOnedButton.isEnabled = false
            break
        case 1://Tower
            self.towerIntoBleUpgradeButton.isEnabled = false
            break
        default:
            break
        }
        self.dfuSegmentControl.isEnabled = false
        ConfirmConUpdateAlert()
    }
    @IBAction func watchGuideVideoButtonTapped(_ sender: AnyObject) {
        print("uploadButtonTapped!");
        var url:URL?
        if self.getCurrentLanguage()=="cn"{
            url = URL.init(string: "https://www.bilibili.com/video/av68882667/")
        }else{
            url = URL.init(string: "https://youtu.be/zBRkFO3qnN8")
        }
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    func handleTowerIntoBleUpgradeButtonTapped() {
        print("towerIntoBleUpgradeButtonTapped!");
        let dfuname:String = "mdfutow"
        let dfuname_old:String = "MataDfu"
        let string = resourcesPath1! + "/firmware/Tower-update.zip"
        let urlwithPercentEscapes = string.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        selectedFileURL = URL.init(string: urlwithPercentEscapes!)
        self.onFileSelected(withURL: selectedFileURL!)
        
        print(dfuname);
        print(selectedFileURL as Any);
        
        for peri_ in peripherals {
            print(peri_.name())
            if (peri_.name() == dfuname)||(peri_.name() == dfuname_old)
            {
                print(peri_.name())
                self.delegate?.centralManagerDidSelectPeripheral(withManager: bluetoothManager!, andPeripheral: peri_.peripheral)
                selectedPeripheral = peri_.peripheral
                
                guard dfuController != nil else {
                    self.performDFU()
                    print("DFU SUCC")
                    dfuSegmentControl.isEnabled = true
                    return
                }
            }
        }
        TowerDfuUnfindAlert()
    }
    
    func handlerControllerUploadButtonTapped() {
        let dfuname:String = "mdfucon"
        let string = resourcesPath1! + "/firmware/Mata_Con.zip"
        let urlwithPercentEscapes = string.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        selectedFileURL = URL.init(string: urlwithPercentEscapes!)
        self.onFileSelected(withURL: selectedFileURL!)
        print(dfuname);
        print(selectedFileURL as Any);
        
        for peri_ in peripherals {
            if peri_.name() == dfuname
            {
                print(peri_.name())
                self.delegate?.centralManagerDidSelectPeripheral(withManager: bluetoothManager!, andPeripheral: peri_.peripheral)
                selectedPeripheral = peri_.peripheral
                
                guard dfuController != nil else {
                    self.performDFU()
                    print("DFU SUCC")
                    return
                }
            }
        }
    }
    
    func handlerBotUploadButtonTapped() {
        let dfuname:String = "mdfubot"
        let dfuname_old:String = "MataDfu"
        let string = resourcesPath1! + "/firmware/Car-update.zip"
        let urlwithPercentEscapes = string.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        selectedFileURL = URL.init(string: urlwithPercentEscapes!)
        self.onFileSelected(withURL: selectedFileURL!)
        
        print(dfuname);
        print(selectedFileURL as Any);
        print(selectedFirmware as Any);
        
        for peri_ in peripherals {
            if (peri_.name() == dfuname)||(peri_.name() == dfuname_old)
            {
                print(peri_.name())
                self.delegate?.centralManagerDidSelectPeripheral(withManager: bluetoothManager!, andPeripheral: peri_.peripheral)
                selectedPeripheral = peri_.peripheral
                guard dfuController != nil else {
                    self.performDFU()
                    print("DFU SUCC")
                    return
                }
            }
        }
    }
    func handlerConUploadButtonTapped() {
        let dfuname:String = "mdfucon"
        let string = resourcesPath1! + "/firmware/Mata_Con.zip"
        let urlwithPercentEscapes = string.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        selectedFileURL = URL.init(string: urlwithPercentEscapes!)
        self.onFileSelected(withURL: selectedFileURL!)
        
        print(dfuname);
        print(selectedFileURL as Any);
        
        for peri_ in peripherals {
            if (peri_.name() == dfuname)
            {
                print(peri_.name())
                self.delegate?.centralManagerDidSelectPeripheral(withManager: bluetoothManager!, andPeripheral: peri_.peripheral)
                selectedPeripheral = peri_.peripheral
                guard dfuController != nil else {
                    self.performDFU()
                    print("DFU SUCC")
                    return
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isImportingFile = true
        stopFlag = false
        if #available(iOS 13, *) {
//            resourcesPath1 = nibBundle!.bundlePath
            resourcesPath1 = "file://" + nibBundle!.bundlePath
//            print(resourcesPath1)
            //高于 iOS 13
        } else {
//            resourcesPath1 = nibBundle!.bundlePath
            resourcesPath1 = "file:///private" + nibBundle!.bundlePath
//            print(resourcesPath1)
            //低于 iOS 13
        }
        towerIntoBleUpgradeButton.isEnabled = false
        botUpgradeInOnedButton.isEnabled = false
        conUpgradeInOnedButton.isEnabled = false
        
        towerIntoBleUpgradeButton.isHidden = true
        botUpgradeInOnedButton.isHidden = false
        conUpgradeInOnedButton.isHidden = true
        
        centralManager.parser = parser
        centralManager.cancelConnect(clearAutoConnect: true)
        
        
        let centralQueue = DispatchQueue(label: "no.nordicsemi.nRFToolBox", attributes: [])
        bluetoothManager = CBCentralManager(delegate: self, queue: centralQueue)
    }
    override func viewDidAppear(_ animated: Bool) {
        showNotice(title: "MATATA WARNING!!", message: "This upgrade was processing on HARDWARE. Before you start, please watch the guide video, and follow it step-by-step. Any un-recommand action may damege your device!!", OkeyHandler: { alert -> Void in
            self.stopFlag = false
            self.centralManager.cancelConnect(clearAutoConnect: true)
            self.dfuSegmentControl.isEnabled = true
            self.segmentAlert()
        })
    }
    override func viewDidDisappear(_ animated: Bool) {
        centralManager.cancelConnect(clearAutoConnect: true)
        if selectedPeripheral != nil{
            peripherals = []
            bluetoothManager?.cancelPeripheralConnection(selectedPeripheral!)
        }
        
        super.viewDidDisappear(animated)
        //if DFU peripheral is connected and user press Back button then disconnect it
        if self.isMovingFromParent && dfuController != nil {
            let aborted = dfuController?.abort()
            if aborted! == false {
                NORDFUConstantsUtility.showAlert(message: "DFU upgrade fail!！")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - cmdbluetooth相关
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!, advertisementData: [NSObject : AnyObject]!, RSSI : NSNumber!){
        
    }
    
    private func centralManager(central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: NSError?){
    }
    
    //MARK: - NORScannerDelegate
    func centralManagerDidSelectPeripheral(withManager aManager: CBCentralManager, andPeripheral aPeripheral: CBPeripheral) {
        NSLog("aManager:%@",aManager);
        NSLog("aPeripheral:%@",aPeripheral);
        selectedPeripheral = aPeripheral
        bluetoothManager = aManager
    }
    //MARK: - LoggerDelegate
    func logWith(_ level:LogLevel, message:String){
        var levelString : String?
        switch(level) {
        case .application:
            levelString = "Application"
        case .debug:
            levelString = "Debug"
        case .error:
            levelString = "Error"
        case .info:
            levelString = "Info"
        case .verbose:
            levelString = "Verbose"
        case .warning:
            levelString = "Warning"
        }
        print("\(levelString!): \(message)")
    }
    //MARK: - DFUServiceDelegate
    func dfuStateDidChange(to state: DFUState) {
        switch state {
        case .connecting:
            NSLog("正在连接mdfucon...");
        case .starting:
            NSLog("开始Dfu升级...");
        case .enablingDfuMode:
            NSLog("正在激活DFU启动引导...");
        case .uploading:
            NSLog("上传文件中...");
        case .validating:
            NSLog("校验文件中...");
        case .disconnecting:
            NSLog("正在断开连接...");
        case .completed:
            NORDFUConstantsUtility.showAlert(message: "DFU upgrade success")
            if NORDFUConstantsUtility.isApplicationStateInactiveOrBackgrounded() {
                NORDFUConstantsUtility.showBackgroundNotification(message: "DFU upgrade success")
                
            }
//            showNotice(title:"Matata DFU", message:"DFU upgrade success!")
            self.clearUI()
        case .aborted:
            NORDFUConstantsUtility.showAlert(message: "DFU upgrade abort！")
            if NORDFUConstantsUtility.isApplicationStateInactiveOrBackgrounded(){
                NORDFUConstantsUtility.showBackgroundNotification(message: "DFU upgrade abort！")
            }
//            showNotice(title:"Matata DFU", message:"DFU upgrade abort!")
            self.clearUI()
        }
    }
    
    func dfuError(_ error: DFUError, didOccurWithMessage message: String) {
        if NORDFUConstantsUtility.isApplicationStateInactiveOrBackgrounded() {
            NORDFUConstantsUtility.showBackgroundNotification(message: message)
        }
        NORDFUConstantsUtility.showAlert(message: "DFU upgrade ERROR！")
        showNotice(title:"Matata DFU", message:"DFU upgrade ERROR!")
        clearUI()
        DispatchQueue.main.async {
            NSLog("Error:%@",message);
        }
    }
    
    //MARK: - DFUProgressDelegate
    func dfuProgressDidChange(for part: Int, outOf totalParts: Int, to progress: Int, currentSpeedBytesPerSecond: Double, avgSpeedBytesPerSecond: Double) {
        self.progress.setProgress(Float(progress) / 100.0, animated: true)
    }
    
  

    
    @objc func applicationDidEnterBackgroundCallback() {
        if dfuController != nil {
            NORDFUConstantsUtility.showBackgroundNotification(message: "正在上传固件...")
        }
    }
    
    @objc func applicationDidBecomeActiveCallback() {
        UIApplication.shared.cancelAllLocalNotifications()
    }
    
    func clearUI() {
        DispatchQueue.main.async {
            self.selectedFirmware       = nil
            self.selectedFileURL        = nil
            self.dfuController          = nil
            self.selectedPeripheral     = nil
            self.progress.progress      = 0.0
            
            self.dfuSegmentControl.isEnabled = true
            self.removeObservers()
            
            switch self.dfuSegmentControl.selectedSegmentIndex
            {
            case 0://Bot
                self.botUpgradeInOnedButton.isEnabled = true
                break
            case 2://Con
                self.conUpgradeInOnedButton.isEnabled = true
                break
            case 1://Tower
                self.towerIntoBleUpgradeButton.isEnabled = true
                break
            default:
                break
            }
            if self.selectedPeripheral != nil{
                self.peripherals = []
                self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
            }
        }
    }
    
    func performDFU() {
        guard dfuController != nil else {
            self.registerObservers()
            //To start the DFU operation the DFUServiceInitiator must be used
            let initiator = DFUServiceInitiator(centralManager: bluetoothManager!, target: selectedPeripheral!)
            initiator.forceDfu = UserDefaults.standard.bool(forKey: "dfu_force_dfu")
            initiator.packetReceiptNotificationParameter = UInt16(UserDefaults.standard.integer(forKey: "dfu_number_of_packets"))
            initiator.logger = (self as LoggerDelegate)
            initiator.delegate = self
            initiator.progressDelegate = self
            initiator.enableUnsafeExperimentalButtonlessServiceInSecureDfu = true
            //禁止交互
            dfuController = initiator.with(firmware: selectedFirmware!).start()
            return
        }
    }
    func onFileImported(withURL aFileURL: URL){
        selectedFileURL = aFileURL
        self.isImportingFile = true
    }

    func onFileSelected(withURL aFileURL: URL) {
        selectedFileURL = aFileURL
        selectedFirmware = nil
        
        let fileNameExtension = aFileURL.pathExtension.lowercased()
        print(fileNameExtension)
        
        if fileNameExtension == "zip" {
            selectedFirmware = DFUFirmware(urlToZipFile: aFileURL)
            if selectedFirmware == nil {
                print("selectedFirmware = nil")
            }else{
                print(selectedFirmware as Any)
            }
        }
    }
    
    func getConnectedPeripherals() -> [CBPeripheral] {
        guard let bluetoothManager = bluetoothManager else {
            return []
        }
        
        var retreivedPeripherals : [CBPeripheral]
        
        if filterUUID == nil {
            let dfuServiceUUID       = CBUUID(string: dfuServiceUUIDString)
            let ancsServiceUUID      = CBUUID(string: ANCSServiceUUIDString)
            retreivedPeripherals     = bluetoothManager.retrieveConnectedPeripherals(withServices: [dfuServiceUUID, ancsServiceUUID])
        } else {
            retreivedPeripherals     = bluetoothManager.retrieveConnectedPeripherals(withServices: [filterUUID!])
        }
        
        return retreivedPeripherals
    }
    func scanForPeripherals(_ enable:Bool) -> Bool {
        guard bluetoothManager?.state == .poweredOn else {
            return false
        }
        
        DispatchQueue.main.async {
            if enable == true {
                let options: NSDictionary = NSDictionary(objects: [NSNumber(value: true as Bool)], forKeys: [CBCentralManagerScanOptionAllowDuplicatesKey as NSCopying])
                if self.filterUUID != nil {
                    self.bluetoothManager?.scanForPeripherals(withServices: [self.filterUUID!], options: options as? [String : AnyObject])
                } else {
                    self.bluetoothManager?.scanForPeripherals(withServices: nil, options: options as? [String : AnyObject])
                }
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerFire), userInfo: nil, repeats: true)
            } else {
                self.timer?.invalidate()
                self.timer = nil
                self.bluetoothManager?.stopScan()
            }
        }
        
        return true
    }
    //MARK: - CBCentralManagerDelgate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        guard central.state == .poweredOn else {
            print("Bluetooth is porewed off")
            return
        }
        
        let connectedPeripherals = self.getConnectedPeripherals()
        var newScannedPeripherals: [NORScannedPeripheral] = []
        connectedPeripherals.forEach { (connectedPeripheral: CBPeripheral) in
            let connected = connectedPeripheral.state == .connected
            let scannedPeripheral = NORScannedPeripheral(withPeripheral: connectedPeripheral, andIsConnected: connected )
            newScannedPeripherals.append(scannedPeripheral)
        }
        peripherals = newScannedPeripherals
        let success = self.scanForPeripherals(true)
        if !success {
            print("Bluetooth is powered off!")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // Scanner uses other queue to send events. We must edit UI in the main queue
        DispatchQueue.main.async(execute: {
            var sensor = NORScannedPeripheral(withPeripheral: peripheral, andRSSI: RSSI.int32Value, andIsConnected: false)
            if ((self.peripherals.contains(sensor)) == false) {
                self.peripherals.append(sensor)
            }else{
                sensor = self.peripherals[self.peripherals.index(of: sensor)!]
                sensor.RSSI = RSSI.int32Value
            }
        })
    }
    
    
    @objc func timerFire() {
        if peripherals.count > 0 {
                print("Did find peri!")
        }
    }
    func connectDfu_Con(){
        print("connectDfu")
        if self.centralManager.connectedStatus == true {
            self.centralManager.cancelConnect(clearAutoConnect: true)
        }

        //检查蓝牙
        if centralManager.centralStatus != 5 {
            print("蓝牙设备异常")
            self.showNotice(title: "BlueToothErr", message: "MatataCode can't access to your phone's BlueTooth.")
        }
        centralManager.scanWithServices(nil, duration: 3, discoveryHandle: { discovery in
            if ((discovery.peripheral.name == "MatataCon")&&(discovery.RSSI >= -70)){
                print(discovery)
                self.bleList.insert(discovery, at: 0)
            }
        }, completeHandle: {
            print("scan finish")
            if self.bleList.count == 0{
                print("scan nothing")
                self.showAlert(title: "Notice", message: "Didn't find any MatataController was ready for upgrade. Click 'OK' to search 'mdfucon'.", OkeyHandler: { alert -> Void in
                    self.handlerConUploadButtonTapped()
                },CancleHandler:{ alert -> Void in
                    self.stopFlag = true
                    self.centralManager.cancelConnect(clearAutoConnect: true)
                    self.conUpgradeInOnedButton.isEnabled = true
                    self.dfuSegmentControl.isEnabled = true
                    if self.selectedPeripheral != nil{
                        self.peripherals = []
                        self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
                    }
                })
                return
            }else
            {
                self.bleList.sort { (CmdDiscovery1, CmdDiscovery2) -> Bool in
                    if CmdDiscovery1.RSSI >= CmdDiscovery2.RSSI {
                        return true
                    }else
                    {
                        return false
                    }
                }
                self.bleBestRssi = self.bleList.first!
                if (self.bleBestRssi.RSSI <= -70){
                    self.showAlert(title: "Notice", message: "Didn't find any MatataController was ready for upgrade. Click 'OK' to search 'mdfucon'.", OkeyHandler: { alert -> Void in
                        self.handlerConUploadButtonTapped()
                    },CancleHandler:{ alert -> Void in
                        self.stopFlag = true
                        self.centralManager.cancelConnect(clearAutoConnect: true)
                        self.conUpgradeInOnedButton.isEnabled = true
                        self.dfuSegmentControl.isEnabled = true
                        if self.selectedPeripheral != nil{
                            self.peripherals = []
                            self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
                        }
                    })
                    return
                }else{
                    self.centralManager.connect(self.bleBestRssi, duration: 5, success: { (central, peripheral) in
                        DispatchQueue.main.async {
                            print("connect success")
                            self.initIntoDfuCmd()
                            print("initIntoDfuCmd success")
                            print(Data(bytes: self.intoDfuCmd))
                            self.parser.writeDataWithoutResponse(Data(bytes: self.intoDfuCmd))
                            print("initIntoDfuCmd writeData success")
                            self.ConfirmConIntoDfuModeAlert()
                        }
                        return
                    }, fail: { (error) in
                        DispatchQueue.main.async {
                            print("connect fail")
                        }
                        return
                    })
                }
            }
        })

    }
    
    
    func ConfirmBotUpdateAlert(){
        let alertController = UIAlertController(title: "DFU Upgrade", message: "Turn on your bot and make sure it is un-connected and have enough power.", preferredStyle: UIAlertController.Style.alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.connectDfu_bot()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in
            self.selectedFirmware = nil
            self.selectedFileURL = nil
            self.botUpgradeInOnedButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
            self.stopFlag = true
            self.centralManager.cancelConnect(clearAutoConnect: true)
            if self.selectedPeripheral != nil{
                self.peripherals = []
                self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
            }
        })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    func ConfirmConUpdateAlert(){
        let alertController = UIAlertController(title: "DFU Upgrade", message: "Turn on your Controllor and switch to Sensor Mode. Make sure it is un-connected and have enough power.", preferredStyle: UIAlertController.Style.alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.connectDfu_Con()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in
            self.selectedFirmware = nil
            self.selectedFileURL = nil
            self.conUpgradeInOnedButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
            self.stopFlag = true
            self.centralManager.cancelConnect(clearAutoConnect: true)
            if self.selectedPeripheral != nil{
                self.peripherals = []
                self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
            }
        })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    func ConfirmTowerUpdateAlert(){
        let alertController = UIAlertController(title: "DFU Upgrade", message: "Use MatataTowerUpgrade(software runs on Windows-PC) to get your Tower ready for Upgrade.", preferredStyle: UIAlertController.Style.alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.handleTowerIntoBleUpgradeButtonTapped()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in
            self.selectedFirmware = nil
            self.selectedFileURL = nil
            self.conUpgradeInOnedButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
            self.stopFlag = true
            self.centralManager.cancelConnect(clearAutoConnect: true)
            if self.selectedPeripheral != nil{
                self.peripherals = []
                self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
            }
        })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    func connectDfu_bot() {
        print("connectDfu_bot")
        if self.centralManager.connectedStatus == true {
            self.centralManager.cancelConnect(clearAutoConnect: true)
        }
        //检查蓝牙
        if centralManager.centralStatus != 5 {
            print("蓝牙设备异常")
            self.showNotice(title: "BlueToothErr", message: "MatataCode can't access to your phone's BlueTooth.")
        }
        //链接 Matalab--MatataBot--MatataCon
        centralManager.scanWithServices(nil, duration: 3, discoveryHandle: { discovery in
            if ((discovery.peripheral.name == "Matalab")||(discovery.peripheral.name == "MatataBot"))&&(discovery.RSSI >= -70){
                print(discovery)
                self.bleList.insert(discovery, at: 0)
            }
        }, completeHandle: {
            print("scan finish")
            if self.bleList.count == 0{
                print("scan nothing")
                self.showAlert(title: "Notice", message: "Didn't find any MatataBot was ready for upgrade. Click 'OK' to search 'mdfubot'.", OkeyHandler: { alert -> Void in
                    self.handlerBotUploadButtonTapped()
                },CancleHandler:{ alert -> Void in
                    self.selectedFirmware = nil
                    self.selectedFileURL = nil
                    self.stopFlag = true
                    self.centralManager.cancelConnect(clearAutoConnect: true)
                    self.botUpgradeInOnedButton.isEnabled = true
                    self.dfuSegmentControl.isEnabled = true
                    if self.selectedPeripheral != nil{
                        self.peripherals = []
                        self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
                    }
                })
                return
            }else{
                self.bleList.sort { (CmdDiscovery1, CmdDiscovery2) -> Bool in
                    if CmdDiscovery1.RSSI >= CmdDiscovery2.RSSI {
                        return true
                    }else
                    {
                        return false
                    }
                }
                self.bleBestRssi = self.bleList.first!
                if (self.bleBestRssi.RSSI <= -70){
                    self.showAlert(title: "Notice", message: "Didn't find any MatataBot was ready for upgrade. Click 'OK' to search 'mdfubot'.", OkeyHandler: { alert -> Void in
                        self.handlerBotUploadButtonTapped()
                    },CancleHandler:{ alert -> Void in
                        self.stopFlag = true
                        self.centralManager.cancelConnect(clearAutoConnect: true)
                        self.conUpgradeInOnedButton.isEnabled = true
                        self.dfuSegmentControl.isEnabled = true
                        if self.selectedPeripheral != nil{
                            self.peripherals = []
                            self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
                        }
                    })
                    return
                }else{
                    self.centralManager.connect(self.bleBestRssi, duration: 5, success: { (central, peripheral) in
                        DispatchQueue.main.async {
                            print("connect success")
                            self.initIntoDfuCmd_bot()
                            print("initIntoDfuCmd success")
                            print(Data(bytes: self.intoDfuCmd))
                            self.parser.writeDataWithoutResponse(Data(bytes: self.intoDfuCmd))
                            print("initIntoDfuCmd writeData success")
                            self.ConfirmBotIntoDfuModeAlert()
                        }
                        return
                    }, fail: { (error) in
                        DispatchQueue.main.async {
                            print("connect fail")
                        }
                        return
                    })
                }
            }
        })
    }
    func ConfirmBotIntoDfuModeAlert(){
        let alertController = UIAlertController(title: "DFU Upgrade", message: "Is the Ble-Light turn off?", preferredStyle: UIAlertController.Style.alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.handlerBotUploadButtonTapped()
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in
            self.selectedFirmware = nil
            self.selectedFileURL = nil
            self.stopFlag = true
            self.centralManager.cancelConnect(clearAutoConnect: true)
            self.botUpgradeInOnedButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
            if self.selectedPeripheral != nil{
                self.peripherals = []
                self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
            }
        })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func BotDfuUnfindAlert(){
        showNotice(title: "DFU Upgrade", message: "Doesn't find a Bot waitting for upgrade. Please charging your bot and try again.", OkeyHandler: { alert -> Void in
        self.selectedFirmware = nil
        self.selectedFileURL = nil
            self.stopFlag = false
            self.centralManager.cancelConnect(clearAutoConnect: true)
            self.botUpgradeInOnedButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
            if self.selectedPeripheral != nil{
                self.peripherals = []
                self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
            }
        })
    }
    func ConfirmConIntoDfuModeAlert(){
        let alertController = UIAlertController(title: "DFU Upgrade", message: "Is the Ble-Light turn dark? Press the switch button, then click ‘OK’.", preferredStyle: UIAlertController.Style.alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { alert -> Void in
            self.handlerConUploadButtonTapped()
            
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in
            self.selectedFirmware = nil
            self.selectedFileURL = nil
            self.stopFlag = true
            self.centralManager.cancelConnect(clearAutoConnect: true)
            self.conUpgradeInOnedButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
            if self.selectedPeripheral != nil{
                self.peripherals = []
                self.bluetoothManager?.cancelPeripheralConnection(self.selectedPeripheral!)
            }
        })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func ConDfuUnfindAlert(){
        showNotice(title: "DFU Upgrade", message: "Doesn't find a MatataController waitting for upgrade. Please check your device and try again.", OkeyHandler: { alert -> Void in
            self.selectedFirmware = nil
            self.selectedFileURL = nil
            self.stopFlag = false
            self.centralManager.cancelConnect(clearAutoConnect: true)
            self.conUpgradeInOnedButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
        })
    }
    
    func TowerDfuUnfindAlert(){
        showNotice(title: "DFU Upgrade", message: "Doesn't find a MatataTower waitting for upgrade. Please check your device and try again.", OkeyHandler: { alert -> Void in
            self.selectedFirmware = nil
            self.selectedFileURL = nil
            self.stopFlag = false
            self.centralManager.cancelConnect(clearAutoConnect: true)
            self.towerIntoBleUpgradeButton.isEnabled = true
            self.dfuSegmentControl.isEnabled = true
        })
    }
    //MARK: - DFUDataInit
    func initIntoDfuCmd(){
        intoDfuCmd.removeAll()
        intoDfuCmd.append(UInt8(128))   //80
        intoDfuCmd.append(UInt8(170))   //aa
        intoDfuCmd.append(UInt8(85))    //55
        intoDfuCmd.append(UInt8(19))    //13
    }
    func initIntoDfuCmd_bot(){
        intoDfuCmd.removeAll()
        intoDfuCmd.append(UInt8(128))   //80
        intoDfuCmd.append(UInt8(170))   //aa
        intoDfuCmd.append(UInt8(85))    //55
        intoDfuCmd.append(UInt8(129))   //81
        intoDfuCmd.append(UInt8(00))    //00
    }
    //MARK: - Alert And Notice
    func showAlert(title: String, message:String, OkeyHandler: ((UIAlertAction) -> Void)? = nil, CancleHandler: ((UIAlertAction) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message,preferredStyle: .alert)
        alertController.title = title
        alertController.message = message
        let okAction = UIAlertAction(title: "OK", style: .default, handler: OkeyHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: CancleHandler)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showNotice(title: String, message:String, OkeyHandler: ((UIAlertAction) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message,preferredStyle: .alert)
        alertController.title = title
        alertController.message = message
        let okAction = UIAlertAction(title: "OK", style: .default, handler: OkeyHandler)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
     func registerObservers() {
            if UIApplication.instancesRespond(to: #selector(UIApplication.registerUserNotificationSettings(_:))) {
                UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert], categories: nil))
                NotificationCenter.default.addObserver(self, selector: #selector(self.applicationDidEnterBackgroundCallback), name: NSNotification.Name.NSExtensionHostDidEnterBackground, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(self.applicationDidBecomeActiveCallback), name: NSNotification.Name.NSExtensionHostDidBecomeActive, object: nil)
            }
        }
    
    func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.NSExtensionHostDidBecomeActive, object: nil)
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.NSExtensionHostDidEnterBackground, object: nil)
    }
    func getCurrentLanguage() -> String {
            let preferredLang = Bundle.main.preferredLocalizations.first! as NSString
            print(Bundle.main.preferredLocalizations)
            print(preferredLang)
            switch String(describing: preferredLang) {
            case "en-US", "en-CN":
                return "en"//英文
            case "zh-Hans-US","zh-Hans-CN","zh-Hant-CN","zh-TW","zh-HK","zh-Hans":
                return "cn"//中文
            default:
                return "en"
            }
        }
}
