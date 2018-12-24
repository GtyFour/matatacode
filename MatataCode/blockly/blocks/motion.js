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
      "type": "input_value",
      "name": "STEP",
      "check": "Number"
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
      "type": "input_value",
      "name": "STEP",
      "check": "Number"
    }
  ],
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
      "type": "input_value",
      "name": "NAME",
      "check": "Number"
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
      "type": "input_value",
      "name": "NAME",
      "check": "Number"
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 122,
  "tooltip": "",
  "helpUrl": ""
}]
); 
