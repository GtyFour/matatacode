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
  var code = '...;\n';
  return code;
};

Blockly.JavaScript['both_wheel_control'] = function(block) {
  var dropdown_direction = block.getFieldValue('DIRECTION');
  var dropdown_speed = block.getFieldValue('SPEED');
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};

Blockly.JavaScript['wheel_stop'] = function(block) {
  var dropdown_wheel = block.getFieldValue('WHEEL');
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};