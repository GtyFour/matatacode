'use strict';

goog.provide('Blockly.Python.led');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('led');


Blockly.Python['led_left'] = function(block) {
    var colour_led = block.getFieldValue('LED');
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
};

Blockly.Python['led_right'] = function(block) {
    var colour_led = block.getFieldValue('LED');
    // TODO: Assemble Python into code variable.
    var code = '...\n';
    return code;
};

Blockly.Python['led'] = function(block) {
    var dropdown_eye = block.getFieldValue('EYE');
    var colour_color = block.getFieldValue('COLOR');
    // TODO: Assemble Python into code variable.
    var code = '...;\n';
    return code;
};
