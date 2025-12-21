#define UART0 0x10000000UL

static inline void uart_putc(char c) {
    *(volatile unsigned char *)(UART0) = c;
}

#define QEMU_EXIT 0x100000

static inline void qemu_exit(void) {
    *(volatile unsigned int *)QEMU_EXIT = 0x5555;
}

static inline void uart_puts(const char *s) {
    while (*s) {
        uart_putc(*s++);
    }
}

int main() {
    uart_puts("Hello, RISC-V bare metal!\n");
    int i=0;
    while (i++<(1<<30)) {}
    qemu_exit();
    return 0;
}
