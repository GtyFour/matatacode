cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
  {
    "id": "com.phonegap.plugins.barcodescanner.barcodescanner",
    "file": "plugins/com.phonegap.plugins.barcodescanner/www/barcodescanner.js",
    "pluginId": "com.phonegap.plugins.barcodescanner",
    "clobbers": [
      "plugins.barcodeScanner"
    ]
  }
];
module.exports.metadata = 
// TOP OF METADATA
{
  "cordova-plugin-whitelist": "1.3.3",
  "com.phonegap.plugins.barcodescanner": "0.6.1"
};
// BOTTOM OF METADATA
});