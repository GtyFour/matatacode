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
                                             "name": "SONG_LIST",
                                             "options": [
                                                         [
                                                          "music1",
                                                          "SONG_1"
                                                          ],
                                                         [
                                                          "music2",
                                                          "SONG_2"
                                                          ],
                                                         [
                                                          "music3",
                                                          "SONG_3"
                                                          ],
                                                         [
                                                          "music4",
                                                          "SONG_4"
                                                          ],
                                                         [
                                                          "music5",
                                                          "SONG_5"
                                                          ],
                                                         [
                                                          "music6",
                                                          "SONG_6"
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
