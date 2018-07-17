# Hard-CNN
2018 Summer Semester(July 2 - July 28)

Design a CNN with verilog.

My goal: a naive conv layer && pool layer.

# Progress (up-to-now)

## 1. Convolutionary Layer
### 1) calculate module
    adder.v: add 2 signed numbers together, word_width = 9, compiled with no errors

    adder_tree.v: add 9 signed numbers together, word_width = 9, compiled with no errors
        
    mul.v: multiple 2 signed number together, word_width = 9, compiled with no errors

    ReLU_unit.v: activate 1 signed number with ReLU, word_width = 9, compiled with no errors

    conv_unit.v: most basic conv unit, calculate conv sum of 2 3*3 matrix, compiled with no errors

    conv_PE.v: basic process unit to be combined to a conv layer, compiled with no errors
### 2) control module
    conv_ctrl.v: control module of conv layer, assign value to every control signal
    
    conv_top.v: top module of conv layer

### 3) other module
    mem30x30: memory, size 30*30, read or write one byte at a time, word_width = 9, compiled with no errors

## 2. Pooling(max) Layer
### 1) calculate module
    max.v: get the larger one between 2 signed numbers

    max_pool2x2.v: 
### 2) control module
    pool_ctrl.v: 

## 3. Fully-Connected Layer


# To-Do

change max_pool2x2 to max_pool, which could process any size of blocks 

    norm

    dropout

# Reference