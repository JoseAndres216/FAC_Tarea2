# PROGRAM THAT EXECUTES TWO LOOPS, ADDERLOOP ADDS AN UNIT TO t2 UTIL t2 REACHES t1 VALUE, COMPARATOR LOOP ADDS AN UNIT TO t1 UNTIL t1 REACHES t0 VALUE.

main:
    # Stop mark for comparatorLoop.
    li t0, 1000

    # Stop mark for adderLoop.
    li t1, 0
    
    # Jumps to comparatorLoop.
    j comparatorLoop
    
adderLoop:
    # Stop condition. Stops when t2 equals t1.
    bge t2, t1, comparatorLoop
    
    # Adds an unit to t2.
    addi t2, t2, 1
    
    # Restarts loop
    j adderLoop
    
comparatorLoop:
   
    # Stop condition. Stops when t1 equals t0 (1000 iterations).
    bge t1, t0, end
    
    # Adds an unit to t1.
    addi t1, t1, 1
    
    # Counter for aderLoop.
    li t2, 0
    
    # Jumps to adderLoop
    j adderLoop
    

end:
    nop
