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
                                             "max": 10
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
                                             "max": 10
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
                                             "type": "field_angle",
                                             "name": "ANGLE",
                                             "angle": 90
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
                                             "type": "field_angle",
                                             "name": "ANGLE",
                                             "angle": 90
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
                                                "type": "field_angle",
                                                "name": "Angle",
                                                "angle": 90
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
                                                "type": "field_angle",
                                                "name": "Angle",
                                                "angle": 90
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
                                      }]
); 
