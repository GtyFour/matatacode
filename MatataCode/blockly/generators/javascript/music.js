'use strict';

goog.provide('Blockly.JavaScript.music');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('music');

Blockly.JavaScript['music_playsong'] = function(block) {
    var dropdown_music_list = block.getFieldValue('MUSIC_LIST');
    // TODO: Assemble JavaScript into code variable.
    var code = 'play_music('+ dropdown_music_list +');';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
  };
Blockly.JavaScript['music_do_dance'] = function(block) {
    var dropdown_dance_list = block.getFieldValue('DANCE_LIST');
    // TODO: Assemble JavaScript into code variable.
    var code = 'play_dance('+ dropdown_dance_list +');';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};

Blockly.JavaScript['music_playmelody'] = function(block) {
    var dropdown_melody_list = block.getFieldValue('MELODY_LIST');
    // TODO: Assemble JavaScript into code variable.
    var code = 'play_melody('+ dropdown_melody_list +');';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};

Blockly.JavaScript['music_alto'] = function(block) {
    var dropdown_alto_list = block.getFieldValue('ALTO_LIST');
    var dropdown_meter = block.getFieldValue('METER');
    // TODO: Assemble JavaScript into code variable.
    var code = 'play_alto('+ dropdown_alto_list +')_meter('+ dropdown_meter +');';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};

Blockly.JavaScript['music_treble'] = function(block) {
    var dropdown_treble_list = block.getFieldValue('TREBLE_LIST');
    var dropdown_meter = block.getFieldValue('METER');
    // TODO: Assemble JavaScript into code variable.
    var code = 'play_treble('+ dropdown_treble_list +')_meter('+ dropdown_meter +');';
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};
