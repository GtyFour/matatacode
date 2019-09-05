'use strict';

goog.provide('Blockly.Blocks.sensor');  // Deprecated
goog.provide('Blockly.Constants.Sensor');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.Sensor.HUE = 181;

Blockly.defineBlocksWithJsonArray([{
  "type": "sensor",
  "message0": "Wait until Sensor detect %1",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "CONDITION",
      "options": [
        [
          "coloryellow",
          "OPTION_YELLOW"
        ],
        [
          "color red",
          "OPTION_RED"
        ],
        [
          "color green",
          "OPTION_GREEN"
        ],
        [
          "getting near",
          "OPTION_NEAR"
        ],
        [
          "Play-button pressed",
          "OPTION_BTN"
        ],
        [
          "brightness",
          "OPTION_BRIGHT"
        ],
        [
          "darkness",
          "OPTION_DARK"
        ],
        [
          "a sound",
          "OPTION_SOUND"
        ],
        [
          "shake",
          "OPTION_SHAKE"
        ],
        [
          "getting away",
          "OPTION_AWAY"
        ]
      ]
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": Blockly.Constants.Sensor.HUE,
  "tooltip": "",
  "helpUrl": ""
},
{
  "type": "sensor_send_data",
  "message0": "Sensor send number %1 away",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "NUMBER",
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
  "colour": Blockly.Constants.Sensor.HUE,
  "tooltip": "",
  "helpUrl": ""
},
{
  "type": "sensor_wait_data",
  "message0": "Sensor wait for number %1",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "NUMBER",
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
  "colour": Blockly.Constants.Sensor.HUE,
  "tooltip": "",
  "helpUrl": ""
}]
); 