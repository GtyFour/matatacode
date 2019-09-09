'use strict';

goog.provide('Blockly.Blocks.lednew');  // Deprecated
goog.provide('Blockly.Constants.LedNew');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.LedNew.HUE = 285;

Blockly.defineBlocksWithJsonArray([{
  "type": "sensor_led",
  "message0": "Set the sensor's  %1 led to color %2 at level %3",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "LED",
      "options": [
        [
          "all",
          "all"
        ],
        [
          "plus",
          "plus"
        ],
        [
          "minus",
          "minus"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "COLOR",
      "options": [
        [
          "white",
          "1"
        ],
        [
          "red",
          "2"
        ],
        [
          "yellow",
          "3"
        ],
        [
          "green",
          "4"
        ],
        [
          "blue",
          "5"
        ],
        [
          "purple",
          "6"
        ],
        [
          "black",
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
  "colour": Blockly.Constants.LedNew.HUE,
  "tooltip": "",
  "helpUrl": ""
},
{
  "type": "bot_led",
  "message0": "Set the bot's  %1 eye to color %2 at level %3",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "LED",
      "options": [
        [
          "left",
          "left"
        ],
        [
          "right",
          "right"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "COLOR",
      "options": [
        [
          "white",
          "1"
        ],
        [
          "red",
          "2"
        ],
        [
          "yellow",
          "3"
        ],
        [
          "green",
          "4"
        ],
        [
          "blue",
          "5"
        ],
        [
          "purple",
          "6"
        ],
        [
          "black",
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
  "colour": Blockly.Constants.LedNew.HUE,
  "tooltip": "",
  "helpUrl": ""
}]);
