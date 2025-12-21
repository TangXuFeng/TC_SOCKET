ENTRY(_start)

SECTIONS
{
    . = 0x80000000;

    .text : {
        *(.text*)
    }

    .rodata : {
        *(.rodata*)
    }

    .data : {
        *(.data*)
    }

    .bss : {
        *(.bss*)
        *(COMMON)
    }

    /* ∂®“Â 4KB ’ª */
    _stack_size = 4K;

    _stack_bottom = .;
    . = . + _stack_size;
    _stack_top = .;
}
