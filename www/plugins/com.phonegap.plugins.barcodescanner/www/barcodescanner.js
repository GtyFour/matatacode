cordova.define("com.phonegap.plugins.barcodescanner.barcodescanner", function(require, exports, module) {
/**
 * cordova is available under *either* the terms of the modified BSD license *or* the
 * MIT License (2008). See http://opensource.org/licenses/alphabetical for full text.
 *
 * Copyright (c) Matt Kane 2010
 * Copyright (c) 2011, IBM Corporation
 */



 var exec = require('cordova/exec'),
    cordova = require('cordova');

 var BarcodeScanner = function () {
 };

//-------------------------------------------------------------------
BarcodeScanner.Encode = {
    TEXT_TYPE: "TEXT_TYPE",
    EMAIL_TYPE: "EMAIL_TYPE",
    PHONE_TYPE: "PHONE_TYPE",
    SMS_TYPE: "SMS_TYPE",
    //  CONTACT_TYPE: "CONTACT_TYPE",  // TODO:  not implemented, requires passing a Bundle class from Javascript to Java
    //  LOCATION_TYPE: "LOCATION_TYPE" // TODO:  not implemented, requires passing a Bundle class from Javascript to Java
};

//-------------------------------------------------------------------
BarcodeScanner.prototype.scan = function (successCallback, errorCallback ,config) {
    if (config instanceof Array) {
                // do nothing
    } else {
       if (typeof(config) === 'object') {
         // string spaces between formats, ZXing does not like that
         if (config.formats) {
             config.formats = config.formats.replace(/\s+/g, '');
          }
         config = [ config ];
        } else {
          config = [];
        }
    }
 
    if (errorCallback == null) {
        errorCallback = function () {
        }
    }

    if (typeof errorCallback != "function") {
        console.log("BarcodeScanner.scan failure: failure parameter not a function");
        return
    }

    if (typeof successCallback != "function") {
        console.log("BarcodeScanner.scan failure: success callback parameter must be a function");
        return
    }

    cordova.exec(successCallback, errorCallback, 'BarcodeScanner', 'scan', config);
};

//-------------------------------------------------------------------
BarcodeScanner.prototype.encode = function (type, data, successCallback, errorCallback, options) {
    if (errorCallback == null) {
        errorCallback = function () {
        }
    }

    if (typeof errorCallback != "function") {
        console.log("BarcodeScanner.encode failure: failure parameter not a function");
        return
    }

    if (typeof successCallback != "function") {
        console.log("BarcodeScanner.encode failure: success callback parameter must be a function");
        return
    }

    cordova.exec(successCallback, errorCallback, 'BarcodeScanner', 'encode', [
        {"type": type, "data": data, "options": options}
        ]);
};

var barcodeScanner = new BarcodeScanner();
module.exports = barcodeScanner;

});
