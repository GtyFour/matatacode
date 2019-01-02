'use strict';

goog.provide('Blockly.Blocks.timer');  // Deprecated
goog.provide('Blockly.Constants.Timer');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

//Blockly.Constants.Colour.HUE = 20;

Blockly.defineBlocksWithJsonArray([{
                                   "type": "timer_wait",
                                   "message0": "Wait for %1 second",
                                   "args0": [
                                             {
                                             "type": "field_number",
                                             "name": "SECOND",
                                             "value": 1,
                                             "min": 1,
                                             "max": 10,
                                             "precision": 1
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 40,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   }]
); 
