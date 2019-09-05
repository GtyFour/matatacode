'use strict';

goog.provide('Blockly.Python.sensor');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('sensor');

Blockly.Python['sensor'] = function(block) {
  var dropdown_condition = block.getFieldValue('CONDITION');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};

Blockly.Python['sensor_send_data'] = function(block) {
  var dropdown_number = block.getFieldValue('NUMBER');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};

Blockly.Python['sensor_wait_data'] = function(block) {
  var dropdown_number = block.getFieldValue('NUMBER');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};