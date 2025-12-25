/* 硬件地址定义 */
#define TERM_BASE      0x50000000  // 显存起始地址
#define KBD_DATA_REG   0x40000000  // 键盘数据寄存器
#define KBD_STAT_REG   0x40000004  // 键盘状态寄存器 (可选)

/* 环形缓冲区定义（用于键盘中断） */
#define BUF_SIZE 64
volatile char kbd_buffer[BUF_SIZE];
volatile int head = 0;
volatile int tail = 0;

/* --- 1. 显示输出函数 (显存映射) --- */
static int cursor = 0;

void my_putc(char c) {
    volatile char* vram = (char*)TERM_BASE;
    if (c == '\n') {
        // 简易换行逻辑：跳到下一行开头（假设一行80字符）
        cursor = (cursor / 80 + 1) * 80;
    } else {
        vram[cursor++] = c;
    }
    // 超过屏幕自动清零（假设屏幕 80x25）
    if (cursor >= 2000) cursor = 0;
}

void my_console_print(const char* s) {
    while (*s) {
        my_putc(*s++);
    }
}

/* --- 2. 键盘输入函数 (中断驱动) --- */

// 中断服务程序：由硬件中断触发
// 使用 interrupt 属性确保编译器正确处理寄存器现场和 mret 指令
void __attribute__((interrupt)) handle_keyboard_interrupt() {
    char key = (char)(*(volatile int*)KBD_DATA_REG);
    int next = (head + 1) % BUF_SIZE;
    if (next != tail) {
        kbd_buffer[head] = key;
        head = next;
    }
    // 注意：硬件上通常需要写某个寄存器来清空中断位，这里根据你的FPGA设计添加
}

char my_get_char() {
    // 阻塞等待缓冲区有数据
    while (head == tail);
    char c = kbd_buffer[tail];
    tail = (tail + 1) % BUF_SIZE;
    return c;
}

/* --- 3. 辅助转换函数 (替代 printf 的一部分功能) --- */
void my_print_int(int n) {
    if (n == 0) { my_putc('0'); return; }
    char buf[10];
    int i = 0;
    while (n > 0) {
        buf[i++] = (n % 10) + '0';
        n /= 10;
    }
    while (i > 0) my_putc(buf[--i]);
}

/* --- 4. 主程序：停车场收费逻辑 --- */
int main() {
    // 硬件初始化（开启中断等逻辑应在此处或启动代码中）
    
    my_console_print("System Ready. Waiting for input...\n");

    /* 模拟输入过程 */
    // 实际上你会调用 my_get_char() 来获取按键并转为数字
    int in_h = 8, in_m = 30;
    int out_h = 10, out_m = 45;

    int total_mins = (out_h * 60 + out_m) - (in_h * 60 + in_m);
    if (total_mins < 0) total_mins += 1440;

    // 方案二：减法循环代替除法，避免产生 mulh
    int hours = 0;
    int temp = total_mins + 59; 
    while (temp >= 60) {
        temp -= 60;
        hours++;
    }

    int fee = hours * 5; // 这里会生成普通的 mul 指令

    /* 输出结果 */
    my_console_print("Duration: ");
    my_print_int(total_mins);
    my_console_print(" mins\nFee: ");
    my_print_int(fee);
    my_console_print(" Yuan\n");

    while (1); // 裸机程序不退出
    return 0;
}