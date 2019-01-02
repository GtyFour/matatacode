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
                                             "name": "MUSIC_LIST",
                                             "options": [
                                                         [
                                                          "music1",
                                                          "music_1"
                                                          ],
                                                         [
                                                          "music2",
                                                          "music_2"
                                                          ],
                                                         [
                                                          "music3",
                                                          "music_3"
                                                          ],
                                                         [
                                                          "music4",
                                                          "music_4"
                                                          ],
                                                         [
                                                          "music5",
                                                          "music_5"
                                                          ],
                                                         [
                                                          "music6",
                                                          "music_6"
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
                                                          "dance1",
                                                          "dance_1"
                                                          ],
                                                         [
                                                          "dance2",
                                                          "dance_2"
                                                          ],
                                                         [
                                                          "dance3",
                                                          "dance_3"
                                                          ],
                                                         [
                                                          "dance4",
                                                          "dance_4"
                                                          ],
                                                         [
                                                          "dance5",
                                                          "dance_5"
                                                          ],
                                                         [
                                                          "dance6",
                                                          "dance_6"
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
                                                          "melody1",
                                                          "melody_01"
                                                          ],
                                                         [
                                                          "melody2",
                                                          "melody_02"
                                                          ],
                                                         [
                                                          "melody3",
                                                          "melody_03"
                                                          ],
                                                         [
                                                          "melody4",
                                                          "melody_04"
                                                          ],
                                                         [
                                                          "melody5",
                                                          "melody_05"
                                                          ],
                                                         [
                                                          "melody6",
                                                          "melody_06"
                                                          ],
                                                         [
                                                          "melody7",
                                                          "melody_07"
                                                          ],
                                                         [
                                                          "melody8",
                                                          "melody_08"
                                                          ],
                                                         [
                                                          "melody9",
                                                          "melody_09"
                                                          ],
                                                         [
                                                          "melody10",
                                                          "melody_10"
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
                                             "name": "ALTO_LIST",
                                             "options": [
                                                         [
                                                          "do",
                                                          "alto_1"
                                                          ],
                                                         [
                                                          "re",
                                                          "alto_2"
                                                          ],
                                                         [
                                                          "mi",
                                                          "alto_3"
                                                          ],
                                                         [
                                                          "fa",
                                                          "alto_4"
                                                          ],
                                                         [
                                                          "sol",
                                                          "alto_5"
                                                          ],
                                                         [
                                                          "la",
                                                          "alto_6"
                                                          ],
                                                         [
                                                          "ti",
                                                          "alto_7"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_dropdown",
                                             "name": "METER",
                                             "options": [
                                                         [
                                                          "1/4",
                                                          "meter_1"
                                                          ],
                                                         [
                                                          "2/4",
                                                          "meter_2"
                                                          ],
                                                         [
                                                          "3/4",
                                                          "meter_3"
                                                          ],
                                                         [
                                                          "4/4",
                                                          "meter_4"
                                                          ],
                                                         [
                                                          "5/4",
                                                          "meter_5"
                                                          ],
                                                         [
                                                          "6/4",
                                                          "meter_6"
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
                                             "name": "TREBLE_LIST",
                                             "options": [
                                                         [
                                                          "do",
                                                          "treble_1"
                                                          ],
                                                         [
                                                          "re",
                                                          "treble_2"
                                                          ],
                                                         [
                                                          "mi",
                                                          "treble_3"
                                                          ],
                                                         [
                                                          "fa",
                                                          "treble_4"
                                                          ],
                                                         [
                                                          "sol",
                                                          "treble_5"
                                                          ],
                                                         [
                                                          "la",
                                                          "treble_6"
                                                          ],
                                                         [
                                                          "ti",
                                                          "treble_7"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_dropdown",
                                             "name": "METER",
                                             "options": [
                                                         [
                                                          "1/4",
                                                          "meter_1"
                                                          ],
                                                         [
                                                          "2/4",
                                                          "meter_2"
                                                          ],
                                                         [
                                                          "3/4",
                                                          "meter_3"
                                                          ],
                                                         [
                                                          "4/4",
                                                          "meter_4"
                                                          ],
                                                         [
                                                          "5/4",
                                                          "meter_5"
                                                          ],
                                                         [
                                                          "6/4",
                                                          "meter_6"
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
