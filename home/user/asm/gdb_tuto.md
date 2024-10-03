gdb first

layout asm          ; Do one,
layout regs         ; then the other.

break _start        ; set a breakpoint.

run                 ; it will stop at the break point (the _start) label.

stepi               ; incremental step. Will move 1 into eax.

info registers eax  ; to show the value of eax.
info registers ebx  ; value of 0
stepi
info registers ebx  ; value of 1.

x/2x $ebx            ; show the value contained at the address stored in the ebx register. Useful if a data word has been moved to a register directly, and not its value.
Also works with any address lol. ebx would store an address if we moved a pointer to a data section element in it, without dereferencing it first.


Go up/down command history: ctrl+P, ctrl+N (also works outside TUI mode, in cmd mode. And in bash!!)

Test what tui reg float does. Supposedly shows the floating point registers. Works when you already have done layout asm, I believe.

stepi<nb of steps>
    info registers a b c d eflags


---
gdb <file> -> la a -> la r -> b _start -> r -> si <nb of steps> -> i r a b c d eflags -> ...
x/3x <address in memory>
CTRL+P, CTRL+N, CTRL+R <search history>.
p $esp to print the value of the stack pointer. Or any other register.
---

Printing the value inside a 32-bit floating point register: `p $xmm0.v4_float[0]`. For 3.14, you get 3.1400001. For 2.1, you get 2.0999999.
This is because these values are stored using a special notation, "ieee754 floating point numbers". Basically approvimation of floating points in binary with minimal .. problems. We try to represent decimal numbers as accurately as possible. We are limited by the fact that we are working with (inverse) powers of 2. We can only get so close to some decimal values in base 10. We have to account for this king of precision. Some finite decimals (D) in base 10 are infinite (Q) in base 2.

So we need to make decisions about our precision. Round it? Keep an imprecision? etc.
IEEE754 is the standard definition for the representation of floating point numbers in binary in any language. At least every big language normally adheres to this standard.


Use `strace ./my_prog` to see the system calls and return values.
        It's so good.

in gdb, use `x/10s` to read not as hex, but as strings! x/1s or x/s reads until a null byte is found (null-terminator). While x/2x reads 2 bytes (4 hex digits).

