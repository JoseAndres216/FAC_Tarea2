# PROGRAM THAT OPERATES t1 DEPENDING ON ITS OWN VALUE AND SOME MILESTONES. FROM t3 TO t4 ADDS a0 TO t1, FROM t4 TO t5 SUBTRACTS a0 FROM t1, FROM t5 TO t6 MULTIPLIES t1 BY a1 AND IF t1 IS GREATER THAN t6 THEN DIVIDES t1, BY a1. RESULTS ARE STORED IN t2.

main:
    # Stop mark for mainLoop.
    li t0, 1000

    # Counter for mainLoop.
    li t1, 0
    
    # Milestone for adderBlock.
    li t3, 0
    
    # Milestone for subtractorBlock.
    li t4, 250
    
    # Milestone for multiplierBlock.
    li t5, 500
    
    # Milestone for dividerBlock.
    li t6, 750
    
    # Value to operate on addition/subtraction.
    li a0, 1
    
    # Value to operate on multiplication/divition.
    li a1, 2
    
    # Jumps to comparatorLoop.
    j mainLoop
    
adderBlock:
    # Adds a0 to t1 and stores it in t2.
    add t2, t1, a0
    
    # Jumps back to mainloop
    j mainLoop

subtractorBlock:
    # Subtracts a0 from t1 and stores it in t2.
    sub t2, t1, a0
    
    # Jumps to comparatorLoop.
    j mainLoop
    
multiplierBlock:
    # Multiplies t1 by a1 and stores it in t2.
    mul t2, t1, a1
    
    # Jumps to comparatorLoop.
    j mainLoop
    
dividerBlock:
    # Divides t1 by a1 and stores it in t2.
    div t2, t1, a1
    
    # Jumps to comparatorLoop.
    j mainLoop
    
mainLoop:
    # Stop condition. Stops when t1 equals t0 (1000 iterations).
    bge t1, t0, end
    
    # Adds an unit to t1.
    addi t1, t1, 1
    
    # Integer to store operations results.
    li t2, 0
    
    # Jumps to dividerBlock if t1 reaches dividerBlock milestone (t6).
    bge t1, t6, dividerBlock
    
    # Jumps to multiplierBlock if t1 reaches multiplierBlock milestone (t5).
    bge t1, t5, multiplierBlock
    
    # Jumps to subtractorBlock if t1 reaches subtractorBlock milestone (t4).
    bge t1, t4, subtractorBlock
    
    # Jumps to adderBlock if t1 reaches adderBlock milestone (t3).
    bge t1, t3, adderBlock
    
end:
    nop
