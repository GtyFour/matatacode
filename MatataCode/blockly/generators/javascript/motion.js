'use strict';

goog.provide('Blockly.JavaScript.motion');

goog.require('Blockly.JavaScript');


// If any new block imports any library, add that library name here.
Blockly.JavaScript.addReservedWords('motion');

Blockly.JavaScript['motion_left_optimize'] = function(block) {
    var dropdown_angle = block.getFieldValue('ANGLE');
    var value_name = Blockly.JavaScript.valueToCode(block, 'NAME', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
    var code = 'optimizeleft_'+ dropdown_angle +'_' + value_name;
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
  };
  
  Blockly.JavaScript['motion_right_optimize'] = function(block) {
    var dropdown_angle = block.getFieldValue('ANGLE');
    var value_name = Blockly.JavaScript.valueToCode(block, 'NAME', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
      var code = 'optimizeright_'+ dropdown_angle +'_' + value_name;
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };
  
  Blockly.JavaScript['motion_straight_optimize'] = function(block) {
    var value_name = Blockly.JavaScript.valueToCode(block, 'NAME', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable
      var code = 'optimizeline_' + value_name;
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };
  
  Blockly.JavaScript['motion_backward'] = function(block) {
    var number_step = block.getFieldValue('STEP');
    // TODO: Assemble JavaScript into code variable.
    var code = 'movebackward_'+ number_step;
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };
  
  Blockly.JavaScript['motion_forward'] = function(block) {
    var number_step = block.getFieldValue('STEP');
    // TODO: Assemble JavaScript into code variable.
      var code = 'moveforward_'+ number_step;
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };
  
  Blockly.JavaScript['motion_turnleft'] = function(block) {
    var dropdown_angle = block.getFieldValue('ANGLE');
    // TODO: Assemble JavaScript into code variable.
      var code = 'turnleft_'+ dropdown_angle;
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };
  
  Blockly.JavaScript['motion_turnright'] = function(block) {
    var dropdown_angle = block.getFieldValue('ANGLE');
    // TODO: Assemble JavaScript into code variable.
      var code = 'turnright_'+ dropdown_angle;
      var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
      return code_run;
  };


  Blockly.JavaScript['motion_do_action'] = function(block) {
    var dropdown_action_list = block.getFieldValue('ACTION_LIST');
    // TODO: Assemble JavaScript into code variable.
    var code = 'doaction_'+ dropdown_action_list;
    var code_run = 'window.webkit.messageHandlers.runcode.postMessage(\'' + code + '\');\n'
    return code_run;
};
