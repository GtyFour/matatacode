'use strict';

goog.provide('Blockly.Blocks.music');  // Deprecated
goog.provide('Blockly.Constants.Music');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.Music.HUE = 300;

Blockly.defineBlocksWithJsonArray([{
                                   "type": "music_playsong",
                                   "message0": "Play %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "MUSIC_LIST",
                                             "options": [
                                                         [
                                                          "Music1",
                                                          "music1"
                                                          ],
                                                         [
                                                          "Music2",
                                                          "music2"
                                                          ],
                                                         [
                                                          "Music3",
                                                          "music3"
                                                          ],
                                                         [
                                                          "Music4",
                                                          "music4"
                                                          ],
                                                         [
                                                          "Music5",
                                                          "music5"
                                                          ],
                                                         [
                                                          "Music6",
                                                          "music6"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 300,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },{
                                   "type": "music_do_dance",
                                   "message0": "Dance %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "DANCE_LIST",
                                             "options": [
                                                         [
                                                          "Dance1",
                                                          "dance1"
                                                          ],
                                                         [
                                                          "Dance2",
                                                          "dance2"
                                                          ],
                                                         [
                                                          "Dance3",
                                                          "dance3"
                                                          ],
                                                         [
                                                          "Dance4",
                                                          "dance4"
                                                          ],
                                                         [
                                                          "Dance5",
                                                          "dance5"
                                                          ],
                                                         [
                                                          "Dance6",
                                                          "dance6"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 300,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "music_playmelody",
                                   "message0": "Play %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "MELODY_LIST",
                                             "options": [
                                                         [
                                                          "Melody1",
                                                          "melody1"
                                                          ],
                                                         [
                                                          "Melody2",
                                                          "melody2"
                                                          ],
                                                         [
                                                          "Melody3",
                                                          "melody3"
                                                          ],
                                                         [
                                                          "Melody4",
                                                          "melody4"
                                                          ],
                                                         [
                                                          "Melody5",
                                                          "melody5"
                                                          ],
                                                         [
                                                          "Melody6",
                                                          "melody6"
                                                          ],
                                                         [
                                                          "Melody7",
                                                          "melody7"
                                                          ],
                                                         [
                                                          "Melody8",
                                                          "melody8"
                                                          ],
                                                         [
                                                          "Melody9",
                                                          "melody9"
                                                          ],
                                                         [
                                                          "Melody10",
                                                          "melody10"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 300,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "music_alto",
                                   "message0": "Alto %1 %2",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "TONE_LIST",
                                             "options": [
                                                         [
                                                          "Do",
                                                          "do"
                                                          ],
                                                         [
                                                          "Re",
                                                          "re"
                                                          ],
                                                         [
                                                          "Mi",
                                                          "mi"
                                                          ],
                                                         [
                                                          "Fa",
                                                          "fa"
                                                          ],
                                                         [
                                                          "Sol",
                                                          "sol"
                                                          ],
                                                         [
                                                          "La",
                                                          "la"
                                                          ],
                                                         [
                                                          "Ti",
                                                          "ti"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_dropdown",
                                             "name": "METER",
                                             "options": [
                                                         [
                                                          "1/4",
                                                          "meter1"
                                                          ],
                                                         [
                                                          "2/4",
                                                          "meter2"
                                                          ],
                                                         [
                                                          "3/4",
                                                          "meter3"
                                                          ],
                                                         [
                                                          "4/4",
                                                          "meter4"
                                                          ],
                                                         [
                                                          "5/4",
                                                          "meter5"
                                                          ],
                                                         [
                                                          "6/4",
                                                          "meter6"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 300,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "music_treble",
                                   "message0": "Treble %1 %2",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "TONE_LIST",
                                             "options": [
                                                         [
                                                          "Do",
                                                          "do"
                                                          ],
                                                         [
                                                          "Re",
                                                          "re"
                                                          ],
                                                         [
                                                          "Mi",
                                                          "mi"
                                                          ],
                                                         [
                                                          "Fa",
                                                          "fa"
                                                          ],
                                                         [
                                                          "Sol",
                                                          "sol"
                                                          ],
                                                         [
                                                          "La",
                                                          "la"
                                                          ],
                                                         [
                                                          "Ti",
                                                          "ti"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_dropdown",
                                             "name": "METER",
                                             "options": [
                                                         [
                                                          "1/4",
                                                          "meter1"
                                                          ],
                                                         [
                                                          "2/4",
                                                          "meter2"
                                                          ],
                                                         [
                                                          "3/4",
                                                          "meter3"
                                                          ],
                                                         [
                                                          "4/4",
                                                          "meter4"
                                                          ],
                                                         [
                                                          "5/4",
                                                          "meter5"
                                                          ],
                                                         [
                                                          "6/4",
                                                          "meter6"
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
