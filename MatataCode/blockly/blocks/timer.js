'use strict';

goog.provide('Blockly.Blocks.timer');  // Deprecated
goog.provide('Blockly.Constants.Timer');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.Timer.HUE = 83;

Blockly.defineBlocksWithJsonArray([{
                                   "type": "timer_wait",
                                   "message0": "Wait for %1 second",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "SECOND",
                                             "options": [
                                                         [
                                                          "1",
                                                          "1"
                                                          ],
                                                         [
                                                          "2",
                                                          "2"
                                                          ],
                                                         [
                                                          "3",
                                                          "3"
                                                          ],
                                                         [
                                                          "4",
                                                          "4"
                                                          ],
                                                         [
                                                          "5",
                                                          "5"
                                                          ],
                                                         [
                                                          "6",
                                                          "6"
                                                          ],
                                                         [
                                                          "7",
                                                          "7"
                                                          ],
                                                         [
                                                          "8",
                                                          "8"
                                                          ],
                                                         [
                                                          "9",
                                                          "9"
                                                          ],
                                                         [
                                                          "10",
                                                          "10"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": Blockly.Constants.Timer.HUE,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   }]
); 
