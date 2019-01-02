'use strict';

goog.provide('Blockly.JavaScript.led');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('led');


Blockly.JavaScript['led_left'] = function(block) {
    var colour_color = block.getFieldValue('LED');
    // TODO: Assemble JavaScript into code variable.
    var code = 'eye_shows_color(' + colour_color + ')_position(left_)_second(1.00);';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
  };
  
  Blockly.JavaScript['led_right'] = function(block) {
    var colour_color = block.getFieldValue('LED');
    // TODO: Assemble JavaScript into code variable.
      var code = 'eye_shows_color(' + colour_color + ')_position(right)_second(1.00);';
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };
  
  Blockly.JavaScript['led_led'] = function(block) {
    var dropdown_eye = block.getFieldValue('EYE');
    var colour_color = block.getFieldValue('COLOR');
    // TODO: Assemble JavaScript into code variable.
    var code = 'eye_shows_color(' + colour_color + ')_position(' + dropdown_eye + ')_second(1.00);';
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };
