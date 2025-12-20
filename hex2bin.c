#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

int main(int argc, char *argv[])
{
    if (argc < 3) {
        printf("用法: %s input.hex output.bin\n", argv[0]);
        return 1;
    }

    FILE *fin = fopen(argv[1], "r");
    if (!fin) {
        perror("无法打开输入文件");
        return 1;
    }

    FILE *fout = fopen(argv[2], "wb");
    if (!fout) {
        perror("无法打开输出文件");
        fclose(fin);
        return 1;
    }

    char line[256];

    while (fgets(line, sizeof(line), fin)) {

        // 去掉 # 注释
        char *p = strchr(line, '#');
        if (p) *p = '\0';

        // 去掉前后空白
        char *hex = line;
        while (*hex == ' ' || *hex == '\t') hex++;
        if (*hex == '\0') continue;  // 空行

        // 解析 32 位十六进制
        uint32_t value = 0;
        if (sscanf(hex, "%x", &value) == 1) {
            // 写入小端序（RISC-V 默认小端）
            uint8_t b[4];
            b[0] = value & 0xFF;
            b[1] = (value >> 8) & 0xFF;
            b[2] = (value >> 16) & 0xFF;
            b[3] = (value >> 24) & 0xFF;
            fwrite(b, 1, 4, fout);
        }
    }

    fclose(fin);
    fclose(fout);

    printf("转换完成: %s -> %s\n", argv[1], argv[2]);
    return 0;
}

