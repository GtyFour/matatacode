'use strict';

goog.provide('Blockly.JavaScript.value');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('value');

Blockly.JavaScript['value_v'] = function(block) {
  var dropdown_name = block.getFieldValue('NAME');
  // TODO: Assemble JavaScript into code variable.
  var code = '...';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['value_define'] = function(block) {
  var text_value_name = block.getFieldValue('VALUE_NAME');
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};

Blockly.JavaScript['value_type'] = function(block) {
  var dropdown_type_name = block.getFieldValue('TYPE_NAME');
  // TODO: Assemble JavaScript into code variable.
  var code = '...';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['value_with_type'] = function(block) {
  var dropdown_name = block.getFieldValue('NAME');
  var value_value_type = Blockly.JavaScript.valueToCode(block, 'VALUE_TYPE', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};

Blockly.JavaScript['value_define_with_type'] = function(block) {
  var text_value_name = block.getFieldValue('VALUE_NAME');
  var value_name = Blockly.JavaScript.valueToCode(block, 'NAME', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};
