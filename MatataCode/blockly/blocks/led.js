'use strict';

goog.provide('Blockly.Blocks.led');  // Deprecated
goog.provide('Blockly.Constants.Led');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.Led.HUE = 308;

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
                                   "colour": Blockly.Constants.Led.HUE,
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
                                   "colour": Blockly.Constants.Led.HUE,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "led_both",
                                   "message0": "[!!THIS BLOCK ONLY RUN SOLO!!]Both eye show color %1",
                                   "args0": [
                                             {
                                             "type": "field_colour",
                                             "name": "LED",
                                             "colour": "#ff0000"
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": Blockly.Constants.Led.HUE,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "led_led",
                                   "message0": "%1 eye show color %2",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "EYE",
                                             "options": [
                                                         [
                                                          "Left",
                                                          "left"
                                                          ],
                                                         [
                                                          "Right",
                                                          "right"
                                                          ],
                                                         [
                                                          "Both",
                                                          "both"
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
                                   "colour": Blockly.Constants.Led.HUE,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "led_position_color_level",
                                   "message0": "%1 eye show color %2 at level %3",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "EYE",
                                             "options": [
                                                         [
                                                          "Left",
                                                          "1"
                                                          ],
                                                         [
                                                          "Right",
                                                          "2"
                                                          ],
                                                         [
                                                          "Both",
                                                          "0"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_dropdown",
                                             "name": "COLOR",
                                             "options": [
                                                         [
                                                          "White",
                                                          "1"
                                                          ],
                                                         [
                                                          "Red",
                                                          "2"
                                                          ],
                                                         [
                                                          "Yellow",
                                                          "3"
                                                          ],
                                                         [
                                                          "Green",
                                                          "4"
                                                          ],
                                                         [
                                                          "Blue",
                                                          "5"
                                                          ],
                                                         [
                                                          "Purple",
                                                          "6"
                                                          ],
                                                         [
                                                          "Black",
                                                          "7"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_dropdown",
                                             "name": "LEVEL",
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
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": Blockly.Constants.Led.HUE,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   }]
); 
