'use strict';

goog.provide('Blockly.Blocks.function');  // Deprecated
goog.provide('Blockly.Constants.Function');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

//Blockly.Constants.Colour.HUE = 20;

Blockly.defineBlocksWithJsonArray([{
    "type": "function_invoke",
    "message0": "Invoke function called %1",
    "args0": [
      {
        "type": "input_value",
        "name": "FUNC_NAME",
        "check": "function"
      }
    ],
    "previousStatement": null,
    "nextStatement": null,
    "colour": 285,
    "tooltip": "",
    "helpUrl": ""
  },
  {
    "type": "function",
    "message0": "Func: %1",
    "args0": [
      {
        "type": "field_input",
        "name": "FUNC_NAME",
        "text": "myFunc"
      }
    ],
    "output": null,
    "colour": 285,
    "tooltip": "",
    "helpUrl": ""
  },
  {
    "type": "function_define",
    "message0": "Define Function called: %1 %2 %3",
    "args0": [
      {
        "type": "field_input",
        "name": "FUNC_NAME",
        "text": "myFunc"
      },
      {
        "type": "input_dummy"
      },
      {
        "type": "input_statement",
        "name": "FUNC_BODY"
      }
    ],
    "colour": 285,
    "tooltip": "",
    "helpUrl": ""
  }]
); 
