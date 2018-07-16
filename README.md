# Hard-CNN
2018 Summer(July 2 - July 28)

Design a CNN with verilog.

My goal: a naive AlexNet.

# Progress (up-to-now)

## 1. Convolutionary Layer
### 1) calculate module
    adder.v: add 2 signed numbers together, word_width = 9

    adder_tree.v: add 9 signed numbers together, word_width = 9
        
    mul.v: multiple 2 signed number together, word_width = 9

    ReLU_unit.v: activate 1 signed number with ReLU, word_width = 9

    conv_PE.v: basic process unit to be combined to a conv layer
### 2) control module
    conv_top.v: top ctrl module of conv layer

### 3) other module
    mem30x30: memory, size 30*30, word_width = 9

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