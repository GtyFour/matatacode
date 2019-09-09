'use strict';

goog.provide('Blockly.JavaScript.lednew');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('lednew');

Blockly.JavaScript['sensor_led'] = function(block) {
  var dropdown_led = block.getFieldValue('LED');
  var dropdown_color = block.getFieldValue('COLOR');
  var dropdown_level = block.getFieldValue('LEVEL');
  // TODO: Assemble JavaScript into code variable.

  var code = 'sensorled_' + dropdown_led + '_'+ dropdown_color +'_' + dropdown_level;
  var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n';
  return code_run;
};

Blockly.JavaScript['bot_led'] = function(block) {
  var dropdown_led = block.getFieldValue('LED');
  var dropdown_color = block.getFieldValue('COLOR');
  var dropdown_level = block.getFieldValue('LEVEL');
  // TODO: Assemble JavaScript into code variable.
  var code = 'matataboteye_' + dropdown_led + '_'+ dropdown_color +'_' + dropdown_level;
  var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n';
  return code_run;
};
