'use strict';

goog.provide('Blockly.Python.timer');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('timer');

Blockly.Python['timer_wait'] = function(block) {
    var number_second = block.getFieldValue('SECOND');
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
};
