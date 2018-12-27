'use strict';

goog.provide('Blockly.Python.function');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('function');

Blockly.Python['function_invoke'] = function(block) {
    var value_func_name = Blockly.Python.valueToCode(block, 'FUNC_NAME', Blockly.Python.ORDER_ATOMIC);
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
  };
  
  Blockly.Python['function'] = function(block) {
    var text_func_name = block.getFieldValue('FUNC_NAME');
    // TODO: Assemble Python into code variable.
    var code = '...';
    // TODO: Change ORDER_NONE to the correct strength.
    return [code, Blockly.Python.ORDER_NONE];
  };
  
  Blockly.Python['function_define'] = function(block) {
    var text_func_name = block.getFieldValue('FUNC_NAME');
    var statements_func_body = Blockly.Python.statementToCode(block, 'FUNC_BODY');
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
  };
