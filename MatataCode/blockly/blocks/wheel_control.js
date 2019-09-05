'use strict';

goog.provide('Blockly.Blocks.wheel');  // Deprecated
goog.provide('Blockly.Constants.Wheel');  // deprecated, 2018 April 5

goog.require('Blockly.Blocks');
goog.require('Blockly');

Blockly.Constants.Wheel.HUE = 355;

Blockly.defineBlocksWithJsonArray([{
  "type": "wheel_control",
  "message0": "%1 Wheels %2 with speed level %3",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "WHEEL",
      "options": [
        [
          "Left",
          "OPTION_LEFT"
        ],
        [
          "Right",
          "OPTION_RIGHT"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "DIRECTION",
      "options": [
        [
          "Forward",
          "OPTION_FORWARD"
        ],
        [
          "Backward",
          "OPTION_BACKWARD"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "NAME",
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
  "colour": Blockly.Constants.Wheel.HUE,
  "tooltip": "",
  "helpUrl": ""
},
{
  "type": "both_wheel_control",
  "message0": "Both wheels %1 with speed %2",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "DIRECTION",
      "options": [
        [
          "forward",
          "OPTION_FORWARD"
        ],
        [
          "backward",
          "OPTION_BACKWARD"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "SPEED",
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
  "colour": Blockly.Constants.Wheel.HUE,
  "tooltip": "",
  "helpUrl": ""
},
{
  "type": "wheel_stop",
  "message0": "Stop %1 wheel",
  "args0": [
    {
      "type": "field_dropdown",
      "name": "WHEEL",
      "options": [
        [
          "left",
          "OPTION_LEFT"
        ],
        [
          "right",
          "OPTION_RIGHT"
        ],
        [
          "both",
          "OPTION_BOTH"
        ]
      ]
    }
  ],
  "previousStatement": null,
  "nextStatement": null,
  "colour": Blockly.Constants.Wheel.HUE,
  "tooltip": "",
  "helpUrl": ""
}]);