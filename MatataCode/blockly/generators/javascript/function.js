'use strict';

goog.provide('Blockly.JavaScript.function');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('function');

Blockly.JavaScript['function_invoke'] = function(block) {
  var value_func_name = Blockly.JavaScript.valueToCode(block, 'FUNC_NAME', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};

Blockly.JavaScript['function_func'] = function(block) {
  var text_func_name = block.getFieldValue('FUNC_NAME');
  // TODO: Assemble JavaScript into code variable.
  var code = '...';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['function_define'] = function(block) {
  var text_func_name = block.getFieldValue('FUNC_NAME');
  var statements_func_body = Blockly.JavaScript.statementToCode(block, 'FUNC_BODY');
  // TODO: Assemble JavaScript into code variable.
  var code = '...;\n';
  return code;
};
