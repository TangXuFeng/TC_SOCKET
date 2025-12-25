/* 文件名: parking.c */
#include <stdint.h>

/* --- 1. 地址映射 (严格遵守你的要求) --- */
// 终端内存起始地址 (用于打印)
#define TERM_BASE      0x90000000

/* --- 2. 基础驱动函数 --- */

// 向终端写一个字符
void uart_putc(char c) {
    // volatile 告诉编译器不要优化这个写操作
    *(volatile char*)TERM_BASE = c;
}

// 打印字符串
void uart_print(const char* s) {
    while (*s) {
        uart_putc(*s++);
    }
}

/* --- 3. 安全的数学函数 (防止非法指令) --- */

// 软件乘法 (通过累加实现)
// 避免使用 '*'，防止编译器生成 mul 指令
int32_t soft_mul(int32_t a, int32_t b) {
    int32_t res = 0;
    for (int i = 0; i < b; i++) {
        res += a;
    }
    return res;
}

// 软件除法 (通过累减实现)
// 避免使用 '/'，防止编译器生成 div 指令
// 返回值为商，remainder指针返回余数
int32_t soft_div_mod(int32_t dividend, int32_t divisor, int32_t *remainder) {
    int32_t quotient = 0;
    while (dividend >= divisor) {
        dividend -= divisor;
        quotient++;
    }
    if (remainder) *remainder = dividend;
    return quotient;
}

// 打印整数 (基于软件除法)
void print_int(int32_t n) {
    if (n == 0) { uart_putc('0'); return; }
    
    char buf[12];
    int i = 0;
    
    // 提取每一位
    while (n > 0) {
        int32_t rem;
        n = soft_div_mod(n, 10, &rem); // n = n / 10;
        buf[i++] = rem + '0';
    }
    
    // 倒序输出
    while (i > 0) {
        uart_putc(buf[--i]);
    }
}

/* --- 4. 主逻辑 --- */

int main() {
    // 1. 开机自检
    uart_print("\nSystem Boot: OK\n");
    uart_print("Memory: 0x80000000\n");
    uart_print("Term  : 0x90000000\n");

    // 2. 模拟停车数据 (入场 8:30, 出场 10:45)
    int32_t in_h = 8, in_m = 30;
    int32_t out_h = 10, out_m = 45;

    // 3. 计算时间差 (全部换算成软乘法)
    // total_out = 10 * 60 + 45
    int32_t total_out = soft_mul(out_h, 60);
    total_out += out_m;

    // total_in = 8 * 60 + 30
    int32_t total_in = soft_mul(in_h, 60);
    total_in += in_m;

    int32_t duration = total_out - total_in; // 135 分钟

    uart_print("Duration: ");
    print_int(duration);
    uart_print(" min\n");

    // 4. 计算费用 (不满1小时按1小时算)
    // 算法: (duration + 59) / 60 * 5
    int32_t hours = soft_div_mod(duration + 59, 60, 0);
    int32_t fee = soft_mul(hours, 5);

    uart_print("Fee: ");
    print_int(fee);
    uart_print(" Yuan\n");

    // 5. 心跳包 (证明 CPU 还活着)
    uart_print("Running");
    while (1) {
        // 简单延时
        for (int i = 0; i < 50000; i++) {
            // 汇编空指令 nop
            __asm__ volatile ("nop");
        }
        uart_putc('.'); 
    }

    return 0;
}