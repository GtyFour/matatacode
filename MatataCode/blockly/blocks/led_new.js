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
          "OPTION_ALL"
        ],
        [
          "next",
          "OPTION_NEXT"
        ],
        [
          "previous",
          "OPTION_PREVIOUS"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "COLOR",
      "options": [
        [
          "white",
          "OPTION_WHITE"
        ],
        [
          "red",
          "OPTION_RED"
        ],
        [
          "yellow",
          "OPTION_YELLOW"
        ],
        [
          "green",
          "OPTION_GREEN"
        ],
        [
          "blue",
          "OPTION_BLUE"
        ],
        [
          "purple",
          "OPTION_PURPLE"
        ],
        [
          "black",
          "OPTION_BLACK"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "LEVEL",
      "options": [
        [
          "1",
          "OPTION_1"
        ],
        [
          "2",
          "OPTION_2"
        ],
        [
          "3",
          "OPTION_3"
        ],
        [
          "4",
          "OPTION_4"
        ],
        [
          "5",
          "OPTION_5"
        ],
        [
          "6",
          "OPTION_6"
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
          "both",
          "OPTION_BOTH"
        ],
        [
          "left",
          "OPTION_LEFT"
        ],
        [
          "right",
          "OPTION_RIGHT"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "COLOR",
      "options": [
        [
          "white",
          "OPTION_WHITE"
        ],
        [
          "red",
          "OPTION_RED"
        ],
        [
          "yellow",
          "OPTION_YELLOW"
        ],
        [
          "green",
          "OPTION_GREEN"
        ],
        [
          "blue",
          "OPTION_BLUE"
        ],
        [
          "purple",
          "OPTION_PURPLE"
        ],
        [
          "black",
          "OPTION_BLACK"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "LEVEL",
      "options": [
        [
          "1",
          "OPTION_1"
        ],
        [
          "2",
          "OPTION_2"
        ],
        [
          "3",
          "OPTION_3"
        ],
        [
          "4",
          "OPTION_4"
        ],
        [
          "5",
          "OPTION_5"
        ],
        [
          "6",
          "OPTION_6"
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