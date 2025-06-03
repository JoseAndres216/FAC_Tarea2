# PROGRAM THAT STORES AND LOADS AN INTEGER FROM 0 TO 999 IN 1000 MEMMORY REGISTERS.

.data

# Array to save 1000 integers in memory directions
array:  .word 4000

    .text
    .globl main

main:
    # t0 = 0: First value to store in array.
    li t0, 0
    
    # t1 saves the direction of the first position of the array.
    la t1, array
    
    # t2 = 1000. t2 is a mark number to manage the loop stop condition.
    li t2, 1000

storeLoop:
    # Stop condition. Stops when t0 equals t2 (1000 iterations).
    bge t0, t2, resett0
    
    # Calculates the memmory direction offset.
    slli t3, t0, 2
    
    # Determinates t4 as the first position of array plus offset.
    add t4, t1, t3
    
    # Saves t0 in array[t0]
    sw t0, 0(t4)

    # Modifies t0 to be t0+1 (t0++)
    addi t0, t0, 1
    
    # Restarts loop
    j storeLoop
    
resett0:
    # Resets t0 to 0 to reuse as index in the load loop.
    li t0, 0

loadLoop:
    # Stop condition. Stops when t0 equals t2 (1000 iterations).
    bge t0, t2, end

    # Calculates the memmory direction offset.
    slli t3, t0, 2

    # Determinates t4 as the position of array[t0].
    add t4, t1, t3

    # Loads the value at array[t0] into t5.
    lw t5, 0(t4)

    # Modifies t0 to be t0+1 (t0++)
    addi t0, t0, 1

    # Restarts loop
    j loadLoop

end:
    nop
