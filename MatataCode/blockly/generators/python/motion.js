/**
 * @license
 * Visual Blocks Language
 *
 * Copyright 2012 Google Inc.
 * https://developers.google.com/blockly/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @fileoverview Generating Python for math blocks.
 * @author q.neutron@gmail.com (Quynh Neutron)
 */
'use strict';

goog.provide('Blockly.Python.motion');

goog.require('Blockly.Python');


// If any new block imports any library, add that library name here.
Blockly.Python.addReservedWords('motion');
Blockly.Python['motion_backward'] = function(block) {
    var number_step = block.getFieldValue('STEP');
    // TODO: Assemble Python into code variable.
    var code = '03-';
    return code;
};

Blockly.Python['motion_forward'] = function(block) {
    var number_step = block.getFieldValue('STEP');
    // TODO: Assemble Python into code variable.
    var code = '00-';
    return code;
};

Blockly.Python['motion_turnleft'] = function(block) {
    var angle_angle = block.getFieldValue('ANGLE');
    // TODO: Assemble Python into code variable.
    var code = '01-';
    return code;
};

Blockly.Python['motion_turnright'] = function(block) {
    var angle_angle = block.getFieldValue('ANGLE');
    // TODO: Assemble Python into code variable.
    var code = '02-';
    return code;
};

Blockly.Python['motion_left_optimize'] = function(block) {
    var angle_angle = block.getFieldValue('Angle');
    var value_name = Blockly.Python.valueToCode(block, 'NAME', Blockly.Python.ORDER_ATOMIC);
    // TODO: Assemble Python into code variable.
    var code = '...\n';
//    if value_name {
//        code = '62_'+angle_angle.toString()+'_00'
//    }else{
//        code = '62_'+angle_angle.toString()+'_01'
//    }
    return code;
};

Blockly.Python['motion_right_optimize'] = function(block) {
    var angle_angle = block.getFieldValue('Angle');
    var value_name = Blockly.Python.valueToCode(block, 'NAME', Blockly.Python.ORDER_ATOMIC);
    // TODO: Assemble Python into code variable.
    var code = '...\n';
//    if value_name {
//        code = '61_'+angle_angle.toString()+'_00'
//    }else{
//        code = '61_'+angle_angle.toString()+'_01'
//    }
    return code;
};

Blockly.Python['motion_straight_optimize'] = function(block) {
    var value_name = Blockly.Python.valueToCode(block, 'NAME', Blockly.Python.ORDER_ATOMIC);
    // TODO: Assemble Python into code variable.
    var code = '...\n';
//    if value_name {
//        code = '60_01'+'_00'
//    }else{
//        code = '60_01'+'_01'
//    }
    return code;
};
