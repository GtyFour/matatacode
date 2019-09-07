'use strict';

goog.provide('Blockly.JavaScript.wheel');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('wheel');

Blockly.JavaScript['wheel_control'] = function(block) {
  var dropdown_wheel = block.getFieldValue('WHEEL');
  var dropdown_direction = block.getFieldValue('DIRECTION');
  var dropdown_name = block.getFieldValue('NAME');
  // TODO: Assemble JavaScript into code variable.
  var code = 'wheel_' + dropdown_wheel + '_'+ dropdown_direction +'_' + dropdown_name;
  var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n';
  return code_run;
};

Blockly.JavaScript['both_wheel_control'] = function(block) {
  var dropdown_direction = block.getFieldValue('DIRECTION');
  var dropdown_speed = block.getFieldValue('SPEED');
  // TODO: Assemble JavaScript into code variable.
  var code = 'wheel_' + dropdown_direction + '_'+ dropdown_speed +'_' + dropdown_name;
  var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n';
  return code_run;
};

Blockly.JavaScript['wheel_stop'] = function(block) {
  var dropdown_wheel = block.getFieldValue('WHEEL');
  // TODO: Assemble JavaScript into code variable.
  var code = 'wheel_' + dropdown_wheel + '_stop';
  var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n';
  return code_run;
};

Blockly.JavaScript['wheel_control_new'] = function(block) {
  var dropdown_lspeed = block.getFieldValue('lspeed');
  var dropdown_rspeed = block.getFieldValue('rspeed');
  // TODO: Assemble JavaScript into code variable.
  var code = 'wheel_' + dropdown_lspeed + '_' + dropdown_rspeed;
  var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n';
  return code_run;
};