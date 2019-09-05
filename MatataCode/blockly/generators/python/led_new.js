'use strict';

goog.provide('Blockly.Python.lednew');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('lednew');

Blockly.Python['sensor_led'] = function(block) {
  var dropdown_led = block.getFieldValue('LED');
  var dropdown_color = block.getFieldValue('COLOR');
  var dropdown_level = block.getFieldValue('LEVEL');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};

Blockly.Python['bot_led'] = function(block) {
  var dropdown_led = block.getFieldValue('LED');
  var dropdown_color = block.getFieldValue('COLOR');
  var dropdown_level = block.getFieldValue('LEVEL');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};