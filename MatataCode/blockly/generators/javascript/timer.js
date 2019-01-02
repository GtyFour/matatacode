'use strict';

goog.provide('Blockly.JavaScript.timer');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('timer');

Blockly.JavaScript['timer_wait'] = function(block) {
    var number_second = block.getFieldValue('SECOND');
    // TODO: Assemble JavaScript into code variable.
    var code = 'timer_wait(' + number_second + ');';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
  };
