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
      "type": "input_value",
      "name": "NAME",
      "check": [
        "Number",
        "String"
      ]
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
      "type": "input_value",
      "name": "NAME",
      "check": [
        "Number",
        "String"
      ]
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": 195,
  "tooltip": "",
  "helpUrl": ""
}]
); 
