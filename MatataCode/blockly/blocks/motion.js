'use strict';

goog.provide('Blockly.Blocks.motion');  // Deprecated
goog.provide('Blockly.Constants.Motion');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.Motion.HUE = 83;

Blockly.defineBlocksWithJsonArray([{
                                   "type": "motion_backward",
                                   "message0": "Backward %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "STEP",
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
                                   "colour": Blockly.Constants.Motion.HUE,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   },
                                   {
                                   "type": "motion_forward",
                                   "message0": "Forward %1",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "STEP",
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
                                   "inputsInline": false,
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": Blockly.Constants.Motion.HUE,
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
                                                          "30degree"
                                                          ],
                                                         [
                                                          "36°",
                                                          "36degree"
                                                          ],
                                                         [
                                                          "45°",
                                                          "45degree"
                                                          ],
                                                         [
                                                          "60°",
                                                          "60degree"
                                                          ],
                                                         [
                                                          "72°",
                                                          "72degree"
                                                          ],
                                                         [
                                                          "90°",
                                                          "90degree"
                                                          ],
                                                         [
                                                          "108°",
                                                          "108degree"
                                                          ],
                                                         [
                                                          "120°",
                                                          "120degree"
                                                          ],
                                                         [
                                                          "135°",
                                                          "135degree"
                                                          ],
                                                         [
                                                          "144°",
                                                          "144degree"
                                                          ],
                                                         [
                                                          "150°",
                                                          "150degree"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": Blockly.Constants.Motion.HUE,
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
                                                          "30degree"
                                                          ],
                                                         [
                                                          "36°",
                                                          "36degree"
                                                          ],
                                                         [
                                                          "45°",
                                                          "45degree"
                                                          ],
                                                         [
                                                          "60°",
                                                          "60degree"
                                                          ],
                                                         [
                                                          "72°",
                                                          "72degree"
                                                          ],
                                                         [
                                                          "90°",
                                                          "90degree"
                                                          ],
                                                         [
                                                          "108°",
                                                          "108degree"
                                                          ],
                                                         [
                                                          "120°",
                                                          "120degree"
                                                          ],
                                                         [
                                                          "135°",
                                                          "135degree"
                                                          ],
                                                         [
                                                          "144°",
                                                          "144degree"
                                                          ],
                                                         [
                                                          "150°",
                                                          "150degree"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": Blockly.Constants.Motion.HUE,
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
                                                          "30degree"
                                                          ],
                                                         [
                                                          "36°",
                                                          "36degree"
                                                          ],
                                                         [
                                                          "45°",
                                                          "45degree"
                                                          ],
                                                         [
                                                          "60°",
                                                          "60degree"
                                                          ],
                                                         [
                                                          "72°",
                                                          "72degree"
                                                          ],
                                                         [
                                                          "90°",
                                                          "90degree"
                                                          ],
                                                         [
                                                          "108°",
                                                          "108degree"
                                                          ],
                                                         [
                                                          "120°",
                                                          "120degree"
                                                          ],
                                                         [
                                                          "135°",
                                                          "135degree"
                                                          ],
                                                         [
                                                          "144°",
                                                          "144degree"
                                                          ],
                                                         [
                                                          "150°",
                                                          "150degree"
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
                                   "colour": Blockly.Constants.Motion.HUE,
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
                                                          "30degree"
                                                          ],
                                                         [
                                                          "36°",
                                                          "36degree"
                                                          ],
                                                         [
                                                          "45°",
                                                          "45degree"
                                                          ],
                                                         [
                                                          "60°",
                                                          "60degree"
                                                          ],
                                                          [
                                                           "72°",
                                                           "72degree"
                                                           ],
                                                           [
                                                            "90°",
                                                            "90degree"
                                                            ],
                                                         [
                                                          "108°",
                                                          "108degree"
                                                          ],
                                                         [
                                                          "120°",
                                                          "120degree"
                                                          ],
                                                         [
                                                          "135°",
                                                          "135degree"
                                                          ],
                                                         [
                                                          "144°",
                                                          "144degree"
                                                          ],
                                                         [
                                                          "150°",
                                                          "150degree"
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
                                   "colour": Blockly.Constants.Motion.HUE,
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
                                      "colour": Blockly.Constants.Motion.HUE,
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
                                                          "Action1",
                                                          "action1"
                                                          ],
                                                         [
                                                          "Action2",
                                                          "action2"
                                                          ],
                                                         [
                                                          "Action3",
                                                          "action3"
                                                          ],
                                                         [
                                                          "Action4",
                                                          "action4"
                                                          ],
                                                         [
                                                          "Action5",
                                                          "action5"
                                                          ],
                                                         [
                                                          "Action6",
                                                          "action6"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": Blockly.Constants.Motion.HUE,
                                   "tooltip": "",
                                   "helpUrl": ""
                                   }]
); 
