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
          "left"
        ],
        [
          "Right",
          "right"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "DIRECTION",
      "options": [
        [
          "Forward",
          "forward"
        ],
        [
          "Backward",
          "backward"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "NAME",
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
          "forward"
        ],
        [
          "backward",
          "backward"
        ]
      ]
    },
    {
      "type": "field_dropdown",
      "name": "SPEED",
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
  "colour": Blockly.Constants.Wheel.HUE,
  "tooltip": "",
  "helpUrl": ""
                                   },
                                   {
                                   "type": "wheel_control_new",
                                   "message0": "Set L-Wheel: %1 R-Wheel: %2",
                                   "args0": [
                                             {
                                             "type": "field_dropdown",
                                             "name": "lspeed",
                                             "options": [
                                                         [
                                                          "NULL",
                                                          "15"
                                                          ],
                                                         [
                                                          "6",
                                                          "0"
                                                          ],
                                                         [
                                                          "5",
                                                          "1"
                                                          ],
                                                         [
                                                          "4",
                                                          "2"
                                                          ],
                                                         [
                                                          "3",
                                                          "3"
                                                          ],
                                                         [
                                                          "2",
                                                          "4"
                                                          ],
                                                         [
                                                          "1",
                                                          "5"
                                                          ],
                                                         [
                                                          "0",
                                                          "6"
                                                          ],
                                                         [
                                                          "-1",
                                                          "7"
                                                          ],
                                                         [
                                                          "-2",
                                                          "8"
                                                          ],
                                                         [
                                                          "-3",
                                                          "9"
                                                          ],
                                                         [
                                                          "-4",
                                                          "10"
                                                          ],
                                                         [
                                                          "-5",
                                                          "11"
                                                          ],
                                                         [
                                                          "-6",
                                                          "12"
                                                          ]
                                                         ]
                                             },
                                             {
                                             "type": "field_dropdown",
                                             "name": "rspeed",
                                             "options": [
                                                         [
                                                          "NULL",
                                                          "15"
                                                          ],
                                                         [
                                                          "6",
                                                          "0"
                                                          ],
                                                         [
                                                          "5",
                                                          "1"
                                                          ],
                                                         [
                                                          "4",
                                                          "2"
                                                          ],
                                                         [
                                                          "3",
                                                          "3"
                                                          ],
                                                         [
                                                          "2",
                                                          "4"
                                                          ],
                                                         [
                                                          "1",
                                                          "5"
                                                          ],
                                                         [
                                                          "0",
                                                          "6"
                                                          ],
                                                         [
                                                          "-1",
                                                          "7"
                                                          ],
                                                         [
                                                          "-2",
                                                          "8"
                                                          ],
                                                         [
                                                          "-3",
                                                          "9"
                                                          ],
                                                         [
                                                          "-4",
                                                          "10"
                                                          ],
                                                         [
                                                          "-5",
                                                          "11"
                                                          ],
                                                         [
                                                          "-6",
                                                          "12"
                                                          ]
                                                         ]
                                             }
                                             ],
                                   "previousStatement": null,
                                   "nextStatement": null,
                                   "colour": 355,
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
          "left"
        ],
        [
          "right",
          "right"
        ],
        [
          "both",
          "both"
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
