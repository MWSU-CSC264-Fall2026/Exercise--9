
.data
result1: .word 0
result2: .word 0
result3: .word 0
done:    .asciiz "Subroutine Exercise Complete!\n"

.text
.globl main
main:

    # Call max(7, 12)
    li a0, 7
    li a1, 12
    jal ra, max
    la t0, result1
    sw a0, 0(t0)

    # Call max(15, 5)
    li a0, 15
    li a1, 5
    jal ra, max
    la t0, result2
    sw a0, 0(t0)

    # Call max(4, 4)
    li a0, 4
    li a1, 4
    jal ra, max
    la t0, result3
    sw a0, 0(t0)

    # Print completion message
    la a1, done
    li a0, 4
    ecall

    # Exit
    li a0, 10
    ecall

# Return the larger of a0 and a1
max:
    bge a0, a1, max_done
    mv a0, a1

max_done:
    ret
