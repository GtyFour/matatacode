'use strict';

goog.provide('Blockly.JavaScript.sensor');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('sensor');
Blockly.JavaScript['sensor'] = function(block) {
  var dropdown_condition = block.getFieldValue('CONDITION');
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};

Blockly.JavaScript['sensor_send_data'] = function(block) {
  var dropdown_number = block.getFieldValue('NUMBER');
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};

Blockly.JavaScript['sensor_wait_data'] = function(block) {
  var dropdown_number = block.getFieldValue('NUMBER');
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};