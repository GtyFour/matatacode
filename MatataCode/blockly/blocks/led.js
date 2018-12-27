'use strict';

goog.provide('Blockly.Blocks.led');  // Deprecated
goog.provide('Blockly.Constants.Led');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

//Blockly.Constants.Colour.HUE = 20;

Blockly.defineBlocksWithJsonArray([{
                                   "type": "led_left",
                                   "message0": "Left eye show color %1",
                                   "args0": [
                                             {
                                             "type": "field_colour",
                                             "name": "LED",
                                             "colour": "#ff0000"
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 195,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "led_right",
                                   "message0": "Right eye show color %1",
                                   "args0": [
                                             {
                                             "type": "field_colour",
                                             "name": "LED",
                                             "colour": "#ff0000"
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 195,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "led",
                                   "message0": "%1 eye show color %2",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "EYE",
                                             "options": [
                                                         [
                                                          "Left",
                                                          "EYEPOSITION_LEFT"
                                                          ],
                                                         [
                                                          "Right",
                                                          "EYEPOSITION_RIGHT"
                                                          ],
                                                         [
                                                          "Both",
                                                          "EYEPOSITION_BOTH"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_colour",
                                             "name": "COLOR",
                                             "colour": "#ff0000"
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 195,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   }]
); 
