'use strict';

goog.provide('Blockly.Python.music');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('music');

Blockly.Python['music_playsong'] = function(block) {
    var dropdown_song_list = block.getFieldValue('SONG_LIST');
    // TODO: Assemble Python into code variable.
    var code = '...;\n';
    return code;
};

