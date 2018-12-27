'use strict';

goog.provide('Blockly.Python.loop');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('loop');

Blockly.Python['loop_start'] = function(block) {
    var value_times = Blockly.Python.valueToCode(block, 'TIMES', Blockly.Python.ORDER_ATOMIC);
    var statements_func = Blockly.Python.statementToCode(block, 'FUNC');
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
  };
  
  Blockly.Python['loop_end'] = function(block) {
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
  };
