'use strict';

goog.provide('Blockly.Python.value');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('value');

Blockly.Python['value_with_type'] = function(block) {
    var dropdown_name = block.getFieldValue('NAME');
    var value_value_type = Blockly.Python.valueToCode(block, 'VALUE_TYPE', Blockly.Python.ORDER_ATOMIC);
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
  };
  
  Blockly.Python['value'] = function(block) {
    var dropdown_name = block.getFieldValue('NAME');
    // TODO: Assemble Python into code variable.
    var code = '...';
    // TODO: Change ORDER_NONE to the correct strength.
    return [code, Blockly.Python.ORDER_NONE];
  };
  
  Blockly.Python['value_define_with_type'] = function(block) {
    var text_value_name = block.getFieldValue('VALUE_NAME');
    var value_name = Blockly.Python.valueToCode(block, 'NAME', Blockly.Python.ORDER_ATOMIC);
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
  };
  
  Blockly.Python['value_define'] = function(block) {
    var text_value_name = block.getFieldValue('VALUE_NAME');
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
  };
  
  Blockly.Python['value_type'] = function(block) {
    var dropdown_type_name = block.getFieldValue('TYPE_NAME');
    // TODO: Assemble Python into code variable.
    var code = '...';
    // TODO: Change ORDER_NONE to the correct strength.
    return [code, Blockly.Python.ORDER_NONE];
  };