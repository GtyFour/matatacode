'use strict';

goog.provide('Blockly.Blocks.motion');  // Deprecated
goog.provide('Blockly.Constants.Motion');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

//Blockly.Constants.Colour.HUE = 20;

Blockly.defineBlocksWithJsonArray([{
                                   "type": "motion_backward",
                                   "message0": "Backward %1",
                                   "args0": [
                                             {
                                             "type": "field_number",
                                             "name": "STEP",
                                             "value": 1,
                                             "min": 1,
                                             "max": 6,
                                             "precision": 1
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 122,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "motion_forward",
                                   "message0": "Forward %1",
                                   "args0": [
                                             {
                                             "type": "field_number",
                                             "name": "STEP",
                                             "value": 1,
                                             "min": 1,
                                             "max": 6,
                                             "precision": 1
                                             }
                                             ],
                                   "inputsInline": false,
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 122,
                                   "tooltip": "Move forward some steps",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "motion_turnleft",
                                   "message0": "Turn left for %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "ANGLE",
                                             "options": [
                                                         [
                                                          "30°",
                                                          "angle030"
                                                          ],
                                                         [
                                                          "36°",
                                                          "angle036"
                                                          ],
                                                         [
                                                          "45°",
                                                          "angle045"
                                                          ],
                                                         [
                                                          "60°",
                                                          "angle060"
                                                          ],
                                                         [
                                                          "72°",
                                                          "angle072"
                                                          ],
                                                          [
                                                           "90°",
                                                           "angle090"
                                                           ],
                                                         [
                                                          "108°",
                                                          "angle108"
                                                          ],
                                                         [
                                                          "120°",
                                                          "angle120"
                                                          ],
                                                         [
                                                          "135°",
                                                          "angle135"
                                                          ],
                                                         [
                                                          "144°",
                                                          "angle144"
                                                          ],
                                                         [
                                                          "150°",
                                                          "angle150"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 122,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "motion_turnright",
                                   "message0": "Turn Right For %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "ANGLE",
                                             "options": [
                                                         [
                                                          "30°",
                                                          "angle030"
                                                          ],
                                                         [
                                                          "36°",
                                                          "angle036"
                                                          ],
                                                         [
                                                          "45°",
                                                          "angle045"
                                                          ],
                                                         [
                                                          "60°",
                                                          "angle060"
                                                          ],
                                                         [
                                                          "72°",
                                                          "angle072"
                                                          ],
                                                          [
                                                           "90°",
                                                           "angle090"
                                                           ],
                                                         [
                                                          "108°",
                                                          "angle108"
                                                          ],
                                                         [
                                                          "120°",
                                                          "angle120"
                                                          ],
                                                         [
                                                          "135°",
                                                          "angle135"
                                                          ],
                                                         [
                                                          "144°",
                                                          "angle144"
                                                          ],
                                                         [
                                                          "150°",
                                                          "angle150"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 122,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "motion_left_optimize",
                                   "message0": "Turn-left %1 Optimize %2",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "ANGLE",
                                             "options": [
                                                         [
                                                          "30°",
                                                          "angle030"
                                                          ],
                                                         [
                                                          "36°",
                                                          "angle036"
                                                          ],
                                                         [
                                                          "45°",
                                                          "angle045"
                                                          ],
                                                         [
                                                          "60°",
                                                          "angle060"
                                                          ],
                                                         [
                                                          "72°",
                                                          "angle072"
                                                          ],
                                                          [
                                                           "90°",
                                                           "angle090"
                                                           ],
                                                         [
                                                          "108°",
                                                          "angle108"
                                                          ],
                                                         [
                                                          "120°",
                                                          "angle120"
                                                          ],
                                                         [
                                                          "135°",
                                                          "angle135"
                                                          ],
                                                         [
                                                          "144°",
                                                          "angle144"
                                                          ],
                                                         [
                                                          "150°",
                                                          "angle150"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "input_value",
                                             "name": "NAME",
                                             "check": "Boolean"
                                             }
                                             ],
                                   "inputsInline": false,
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 122,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "motion_right_optimize",
                                   "message0": "Turn-right %1 Optimize %2",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "ANGLE",
                                             "options": [
                                                         [
                                                          "30°",
                                                          "angle030"
                                                          ],
                                                         [
                                                          "36°",
                                                          "angle036"
                                                          ],
                                                         [
                                                          "45°",
                                                          "angle045"
                                                          ],
                                                         [
                                                          "60°",
                                                          "angle060"
                                                          ],
                                                          [
                                                           "72°",
                                                           "angle072"
                                                           ],
                                                           [
                                                            "90°",
                                                            "angle090"
                                                            ],
                                                         [
                                                          "108°",
                                                          "angle108"
                                                          ],
                                                         [
                                                          "120°",
                                                          "angle120"
                                                          ],
                                                         [
                                                          "135°",
                                                          "angle135"
                                                          ],
                                                         [
                                                          "144°",
                                                          "angle144"
                                                          ],
                                                         [
                                                          "150°",
                                                          "angle150"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "input_value",
                                             "name": "NAME",
                                             "check": "Boolean"
                                             }
                                             ],
                                   "inputsInline": false,
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 122,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                      {
                                      "type": "motion_straight_optimize",
                                      "message0": "Straight Optimize %1",
                                      "args0": [
                                                {
                                                "type": "input_value",
                                                "name": "NAME",
                                                "check": "Boolean"
                                                }
                                                ],
                                      "inputsInline": false,
                                      "previousStatement": null,
                                      "nextStatement": null,
                                      "colour": 122,
                                      "tooltip": "",
                                      "helpUrl": ""
                                   },{
                                   "type": "motion_do_action",
                                   "message0": "Do  %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "ACTION_LIST",
                                             "options": [
                                                         [
                                                          "action1",
                                                          "action_1"
                                                          ],
                                                         [
                                                          "action2",
                                                          "action_2"
                                                          ],
                                                         [
                                                          "action3",
                                                          "action_3"
                                                          ],
                                                         [
                                                          "action4",
                                                          "action_4"
                                                          ],
                                                         [
                                                          "action5",
                                                          "action_5"
                                                          ],
                                                         [
                                                          "action6",
                                                          "action_6"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 122,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   }]
); 
