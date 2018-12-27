'use strict';

goog.provide('Blockly.Blocks.loop');  // Deprecated
goog.provide('Blockly.Constants.Loop');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

//Blockly.Constants.Colour.HUE = 20;

Blockly.defineBlocksWithJsonArray([{
    "type": "loop_start",
    "message0": "MataBot will do %1 times %2",
    "args0": [
      {
        "type": "input_value",
        "name": "TIMES",
        "check": "Number"
      },
      {
        "type": "input_statement",
        "name": "FUNC"
      }
    ],
    "inputsInline": true,
    "previousStatement": null,
    "nextStatement": null,
    "colour": 122,
    "tooltip": "",
    "helpUrl": ""
  },
  {
    "type": "loop_end",
    "message0": "!!!End the loop right now!!!",
    "previousStatement": null,
    "colour": 122,
    "tooltip": "",
    "helpUrl": ""
  }]
); 
