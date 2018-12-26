'use strict';

goog.provide('Blockly.Blocks.music');  // Deprecated
goog.provide('Blockly.Constants.Music');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

//Blockly.Constants.Colour.HUE = 20;

Blockly.defineBlocksWithJsonArray([{
                                   "type": "music_playsong",
                                   "message0": "Play %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "Play song",
                                             "options": [
                                                         [
                                                          "Little Star",
                                                          "SONG_1"
                                                          ],
                                                         [
                                                          "Snow Flare",
                                                          "SONG_2"
                                                          ],
                                                         [
                                                          "TEST",
                                                          "SONG_3"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 300,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   }]
); 
