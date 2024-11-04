---
tags:
  - note
---

`constexpr` 修饰的函数，如果其传入的参数可以在编译时期计算出来，那么这个函数就会产生编译时期的值。但是，传入的参数如果不能在编译时期计算出来，那么 `constexpr` 修饰的函数就和普通函数一样了。

```c++
#include <iostream>
#include <array>
using namespace std;

constexpr int foo(int i)
{
    return i + 5;
}

int main()
{
    int i = 10;
    std::array<int, foo(5)> arr; // OK
    
    foo(i); // Call is Ok
    
    // But...
    std::array<int, foo(i)> arr1; // Error
   
}
```

---

`fileno`, `errno` 中的 `no` 是 `numero` 的缩写

---

[tty raw mode](https://viewsourcecode.org/snaptoken/kilo/02.enteringRawMode.html):

```c
#include <stdio.h>
#include <unistd.h>
#include <termios.h>
static int ttyfd = STDIN_FILENO;
static struct termios orig_termios;
/* reset tty - useful also for restoring the terminal when this process
   wishes to temporarily relinquish the tty
*/
int tty_reset(void){
    /* flush and reset */
    if (tcsetattr(ttyfd,TCSAFLUSH,&orig_termios) < 0) return -1;
    return 0;
}
/* put terminal in raw mode - see termio(7I) for modes */
void tty_raw(void)
{
    struct termios raw;
    raw = orig_termios;  /* copy original and then modify below */
    /* input modes - clear indicated ones giving: no break, no CR to NL,
       no parity check, no strip char, no start/stop output (sic) control */
    raw.c_iflag &= ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON);
    /* output modes - clear giving: no post processing such as NL to CR+NL */
    raw.c_oflag &= ~(OPOST);
    /* control modes - set 8 bit chars */
    raw.c_cflag |= (CS8);
    /* local modes - clear giving: echoing off, canonical off (no erase with
       backspace, ^U,...),  no extended functions, no signal chars (^Z,^C) */
    raw.c_lflag &= ~(ECHO | ICANON | IEXTEN | ISIG);
    /* control chars - set return condition: min number of bytes and timer */
    raw.c_cc[VMIN] = 5; raw.c_cc[VTIME] = 8; /* after 5 bytes or .8 seconds
                                                after first byte seen      */
    raw.c_cc[VMIN] = 0; raw.c_cc[VTIME] = 0; /* immediate - anything       */
    raw.c_cc[VMIN] = 2; raw.c_cc[VTIME] = 0; /* after two bytes, no timer  */
    raw.c_cc[VMIN] = 0; raw.c_cc[VTIME] = 8; /* after a byte or .8 seconds */
    /* put terminal in raw mode after flushing */
    tcsetattr(ttyfd,TCSAFLUSH,&raw);
}
int main(int argc, char *argv[]) {
    atexit(tty_reset);
    tty_raw();
    FILE *fp = fdopen(ttyfd, "r");
    setvbuf(fp, NULL, _IONBF, 0);
    char buffer[20];
    buffer[0] = 0;
    fgets(buffer, 20, fp);
    printf("buffer is:%s", buffer);
    return 0;
}
```

或者

```shell
stty -F "$(tty)" raw # set raw mode
stty -F "$(tty)" raw -echo # suppress echoing characters
stty -F "$(tty)" sano # restore
```

另见 [cfmakeraw()](https://linux.die.net/man/3/cfmakeraw)

---

[C Posix 标准库](https://en.wikibooks.org/wiki/C_Programming/POSIX_Reference)

---