'use strict';

goog.provide('Blockly.Blocks.sensor');  // Deprecated
goog.provide('Blockly.Constants.Sensor');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.Sensor.HUE = 181;

Blockly.defineBlocksWithJsonArray([{
  "type": "sensor",
  "message0": "Sensor wait until detect %1",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "CONDITION",
      "options": [
        [
          "color yellow",
          "1"
        ],
        [
          "color red",
          "2"
        ],
        [
          "color green",
          "3"
        ],
        [
          "getting near",
          "4"
        ],
        [
          "Play-button pressed",
          "5"
        ],
        [
          "bright",
          "6"
        ],
        [
          "dark",
          "7"
        ],
        [
          "a sound",
          "8"
        ],
        [
          "shake",
          "9"
        ],
        [
          "getting away",
          "10"
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
  "message0": "Sensor send number %1",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "NUMBER",
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
  "colour": Blockly.Constants.Sensor.HUE,
  "tooltip": "",
  "helpUrl": ""
}]
); 