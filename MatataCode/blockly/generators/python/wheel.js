'use strict';

goog.provide('Blockly.Python.wheel');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('wheel');

Blockly.Python['wheel_control'] = function(block) {
  var dropdown_wheel = block.getFieldValue('WHEEL');
  var dropdown_direction = block.getFieldValue('DIRECTION');
  var dropdown_name = block.getFieldValue('NAME');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};

Blockly.Python['both_wheel_control'] = function(block) {
  var dropdown_direction = block.getFieldValue('DIRECTION');
  var dropdown_speed = block.getFieldValue('SPEED');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};

Blockly.Python['wheel_stop'] = function(block) {
  var dropdown_wheel = block.getFieldValue('WHEEL');
  // TODO: Assemble Python into code variable.
  var code = '...\n';
  return code;
};