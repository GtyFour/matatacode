'use strict';

goog.provide('Blockly.JavaScript.led');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('led');


Blockly.JavaScript['led_left'] = function(block) {
    var colour_color = block.getFieldValue('LED');
    // TODO: Assemble JavaScript into code variable.
    var code = 'eyeshowscolor_' + colour_color + '_left_1';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
  };

Blockly.JavaScript['led_right'] = function(block) {
    var colour_color = block.getFieldValue('LED');
    // TODO: Assemble JavaScript into code variable.
    var code = 'eyeshowscolor_' + colour_color + '_right_1';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};

Blockly.JavaScript['led_both'] = function(block) {
    var colour_color = block.getFieldValue('LED');
    // TODO: Assemble JavaScript into code variable.
    var code = 'eyeshowscolor_' + colour_color;
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};
  
  Blockly.JavaScript['led_led'] = function(block) {
    var dropdown_eye = block.getFieldValue('EYE');
    var colour_color = block.getFieldValue('COLOR');
    // TODO: Assemble JavaScript into code variable.
    var code = 'eyeshowscolor_' + colour_color + '_' + dropdown_eye + '_1';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
  };
Blockly.JavaScript['led_position_color_level'] = function(block) {
    var dropdown_eye = block.getFieldValue('EYE');
    var dropdown_color = block.getFieldValue('COLOR');
    var dropdown_level = block.getFieldValue('LEVEL');
    // TODO: Assemble JavaScript into code variable.
     var code = 'eyeshowscolor_' + dropdown_color + '_' + dropdown_eye + '_' + dropdown_level;
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};
