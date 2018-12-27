'use strict';

goog.provide('Blockly.Blocks.value');  // Deprecated
goog.provide('Blockly.Constants.Value');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

//Blockly.Constants.Colour.HUE = 20;

Blockly.defineBlocksWithJsonArray([{
    "type": "value_with_type",
    "message0": "value \" %1 %2 \" of type %3",
    "args0": [
      {
        "type": "field_dropdown",
        "name": "NAME",
        "options": [
          [
            "option",
            "OPTIONNAME"
          ],
          [
            "option",
            "OPTIONNAME"
          ],
          [
            "option",
            "OPTIONNAME"
          ]
        ]
      },
      {
        "type": "input_dummy"
      },
      {
        "type": "input_value",
        "name": "VALUE_TYPE",
        "check": "value_type"
      }
    ],
    "inputsInline": true,
    "colour": 345,
    "tooltip": "",
    "helpUrl": ""
  },
  {
    "type": "value",
    "message0": "value \" %1 %2 \"",
    "args0": [
      {
        "type": "field_dropdown",
        "name": "NAME",
        "options": [
          [
            "option",
            "OPTIONNAME"
          ],
          [
            "option",
            "OPTIONNAME"
          ],
          [
            "option",
            "OPTIONNAME"
          ]
        ]
      },
      {
        "type": "input_dummy"
      }
    ],
    "inputsInline": true,
    "output": null,
    "colour": 345,
    "tooltip": "",
    "helpUrl": ""
  },
  {
    "type": "value_define_with_type",
    "message0": "Define value called %1 of type %2 %3",
    "args0": [
      {
        "type": "field_input",
        "name": "VALUE_NAME",
        "text": "myValue"
      },
      {
        "type": "input_dummy"
      },
      {
        "type": "input_value",
        "name": "NAME",
        "check": "value_type"
      }
    ],
    "inputsInline": true,
    "previousStatement": null,
    "nextStatement": null,
    "colour": 345,
    "tooltip": "",
    "helpUrl": ""
  },
  {
    "type": "value_define",
    "message0": "Define value called %1",
    "args0": [
      {
        "type": "field_input",
        "name": "VALUE_NAME",
        "text": "myValue"
      }
    ],
    "inputsInline": true,
    "previousStatement": null,
    "nextStatement": null,
    "colour": 345,
    "tooltip": "",
    "helpUrl": ""
  },
  {
    "type": "value_type",
    "message0": "%1",
    "args0": [
      {
        "type": "field_dropdown",
        "name": "TYPE_NAME",
        "options": [
          [
            "Boolean",
            "TYPE_BOOL"
          ],
          [
            "Number",
            "TYPE_NUM"
          ],
          [
            "String",
            "TYPE_STR"
          ],
          [
            "Color",
            "TYPE_COLOR"
          ]
        ]
      }
    ],
    "output": null,
    "colour": 345,
    "tooltip": "",
    "helpUrl": ""
  }]
); 
