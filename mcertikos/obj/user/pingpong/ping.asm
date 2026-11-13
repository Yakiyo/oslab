
obj/user/pingpong/ping:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:
#include <proc.h>
#include <stdio.h>
#include <syscall.h>

int main(int argc, char **argv)
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	53                   	push   %ebx
4000000e:	e8 64 01 00 00       	call   40000177 <__x86.get_pc_thunk.bx>
40000013:	81 c3 e1 3f 00 00    	add    $0x3fe1,%ebx
40000019:	51                   	push   %ecx
#if LAB <= 5
    /* Lab 5: each process has its own address space. */
    unsigned int val = 100;
    unsigned int *addr = (unsigned int *) 0xe0000000;

    printf("ping started.\n");
4000001a:	83 ec 0c             	sub    $0xc,%esp
4000001d:	8d 83 48 e0 ff ff    	lea    -0x1fb8(%ebx),%eax
40000023:	50                   	push   %eax
40000024:	e8 b7 02 00 00       	call   400002e0 <printf>
    printf("ping: the value at address %x: %d\n", addr, *addr);
40000029:	83 c4 0c             	add    $0xc,%esp
4000002c:	8d 83 b0 e1 ff ff    	lea    -0x1e50(%ebx),%eax
40000032:	ff 35 00 00 00 e0    	push   0xe0000000
40000038:	68 00 00 00 e0       	push   $0xe0000000
4000003d:	50                   	push   %eax
4000003e:	e8 9d 02 00 00       	call   400002e0 <printf>
    printf("ping: writing the value %d to the address %x\n", val, addr);
40000043:	83 c4 0c             	add    $0xc,%esp
40000046:	8d 83 d4 e1 ff ff    	lea    -0x1e2c(%ebx),%eax
4000004c:	68 00 00 00 e0       	push   $0xe0000000
40000051:	6a 64                	push   $0x64
40000053:	50                   	push   %eax
40000054:	e8 87 02 00 00       	call   400002e0 <printf>
    *addr = val;
40000059:	c7 05 00 00 00 e0 64 	movl   $0x64,0xe0000000
40000060:	00 00 00 
    yield();
40000063:	e8 48 0a 00 00       	call   40000ab0 <yield>
    printf("ping: the new value at address %x: %d\n", addr, *addr);
40000068:	83 c4 0c             	add    $0xc,%esp
4000006b:	8d 83 04 e2 ff ff    	lea    -0x1dfc(%ebx),%eax
40000071:	ff 35 00 00 00 e0    	push   0xe0000000
40000077:	68 00 00 00 e0       	push   $0xe0000000
4000007c:	50                   	push   %eax
4000007d:	e8 5e 02 00 00       	call   400002e0 <printf>
#else
    printf("ping started.\n");
#endif

    return 0;
}
40000082:	83 c4 10             	add    $0x10,%esp
40000085:	8d 65 f8             	lea    -0x8(%ebp),%esp
40000088:	31 c0                	xor    %eax,%eax
4000008a:	59                   	pop    %ecx
4000008b:	5b                   	pop    %ebx
4000008c:	5d                   	pop    %ebp
4000008d:	8d 61 fc             	lea    -0x4(%ecx),%esp
40000090:	c3                   	ret

40000091 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
40000091:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
40000097:	75 04                	jne    4000009d <args_exist>

40000099 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
40000099:	6a 00                	push   $0x0
	pushl	$0
4000009b:	6a 00                	push   $0x0

4000009d <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
4000009d:	e8 5e ff ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
400000a2:	50                   	push   %eax
	/* Give the CPU to another process once main returns. */
	call	yield
400000a3:	e8 08 0a 00 00       	call   40000ab0 <yield>

400000a8 <spin>:
spin:
	jmp	spin
400000a8:	eb fe                	jmp    400000a8 <spin>
400000aa:	66 90                	xchg   %ax,%ax
400000ac:	66 90                	xchg   %ax,%ax
400000ae:	66 90                	xchg   %ax,%ax

400000b0 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
400000b0:	53                   	push   %ebx
400000b1:	e8 c1 00 00 00       	call   40000177 <__x86.get_pc_thunk.bx>
400000b6:	81 c3 3e 3f 00 00    	add    $0x3f3e,%ebx
400000bc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
400000bf:	ff 74 24 18          	push   0x18(%esp)
400000c3:	ff 74 24 18          	push   0x18(%esp)
400000c7:	8d 83 0c e0 ff ff    	lea    -0x1ff4(%ebx),%eax
400000cd:	50                   	push   %eax
400000ce:	e8 0d 02 00 00       	call   400002e0 <printf>
    vcprintf(fmt, ap);
400000d3:	58                   	pop    %eax
400000d4:	5a                   	pop    %edx
400000d5:	8d 44 24 24          	lea    0x24(%esp),%eax
400000d9:	50                   	push   %eax
400000da:	ff 74 24 24          	push   0x24(%esp)
400000de:	e8 9d 01 00 00       	call   40000280 <vcprintf>
    va_end(ap);
}
400000e3:	83 c4 18             	add    $0x18,%esp
400000e6:	5b                   	pop    %ebx
400000e7:	c3                   	ret
400000e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400000ef:	00 

400000f0 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
400000f0:	53                   	push   %ebx
400000f1:	e8 81 00 00 00       	call   40000177 <__x86.get_pc_thunk.bx>
400000f6:	81 c3 fe 3e 00 00    	add    $0x3efe,%ebx
400000fc:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
400000ff:	ff 74 24 18          	push   0x18(%esp)
40000103:	ff 74 24 18          	push   0x18(%esp)
40000107:	8d 83 18 e0 ff ff    	lea    -0x1fe8(%ebx),%eax
4000010d:	50                   	push   %eax
4000010e:	e8 cd 01 00 00       	call   400002e0 <printf>
    vcprintf(fmt, ap);
40000113:	58                   	pop    %eax
40000114:	5a                   	pop    %edx
40000115:	8d 44 24 24          	lea    0x24(%esp),%eax
40000119:	50                   	push   %eax
4000011a:	ff 74 24 24          	push   0x24(%esp)
4000011e:	e8 5d 01 00 00       	call   40000280 <vcprintf>
    va_end(ap);
}
40000123:	83 c4 18             	add    $0x18,%esp
40000126:	5b                   	pop    %ebx
40000127:	c3                   	ret
40000128:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000012f:	00 

40000130 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000130:	53                   	push   %ebx
40000131:	e8 41 00 00 00       	call   40000177 <__x86.get_pc_thunk.bx>
40000136:	81 c3 be 3e 00 00    	add    $0x3ebe,%ebx
4000013c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000013f:	ff 74 24 18          	push   0x18(%esp)
40000143:	ff 74 24 18          	push   0x18(%esp)
40000147:	8d 83 24 e0 ff ff    	lea    -0x1fdc(%ebx),%eax
4000014d:	50                   	push   %eax
4000014e:	e8 8d 01 00 00       	call   400002e0 <printf>
    vcprintf(fmt, ap);
40000153:	58                   	pop    %eax
40000154:	5a                   	pop    %edx
40000155:	8d 44 24 24          	lea    0x24(%esp),%eax
40000159:	50                   	push   %eax
4000015a:	ff 74 24 24          	push   0x24(%esp)
4000015e:	e8 1d 01 00 00       	call   40000280 <vcprintf>
40000163:	83 c4 10             	add    $0x10,%esp
40000166:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000016d:	00 
4000016e:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
40000170:	e8 3b 09 00 00       	call   40000ab0 <yield>
    while (1)
40000175:	eb f9                	jmp    40000170 <panic+0x40>

40000177 <__x86.get_pc_thunk.bx>:
40000177:	8b 1c 24             	mov    (%esp),%ebx
4000017a:	c3                   	ret
4000017b:	66 90                	xchg   %ax,%ax
4000017d:	66 90                	xchg   %ax,%ax
4000017f:	90                   	nop

40000180 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
40000180:	55                   	push   %ebp
40000181:	57                   	push   %edi
40000182:	56                   	push   %esi
40000183:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
40000184:	8b 44 24 14          	mov    0x14(%esp),%eax
40000188:	0f b6 00             	movzbl (%eax),%eax
4000018b:	3c 2b                	cmp    $0x2b,%al
4000018d:	0f 84 8d 00 00 00    	je     40000220 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
40000193:	3c 2d                	cmp    $0x2d,%al
40000195:	74 59                	je     400001f0 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000197:	8d 50 d0             	lea    -0x30(%eax),%edx
4000019a:	80 fa 09             	cmp    $0x9,%dl
4000019d:	77 71                	ja     40000210 <atoi+0x90>
    int negative = 0;
4000019f:	31 ff                	xor    %edi,%edi
    int loc = 0;
400001a1:	31 f6                	xor    %esi,%esi
        loc++;
400001a3:	89 f2                	mov    %esi,%edx
    int acc = 0;
400001a5:	31 c9                	xor    %ecx,%ecx
400001a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001ae:	00 
400001af:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
400001b0:	83 e8 30             	sub    $0x30,%eax
400001b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
400001b6:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
400001b9:	0f be c0             	movsbl %al,%eax
400001bc:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001bf:	8b 44 24 14          	mov    0x14(%esp),%eax
400001c3:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
400001c7:	8d 68 d0             	lea    -0x30(%eax),%ebp
400001ca:	89 eb                	mov    %ebp,%ebx
400001cc:	80 fb 09             	cmp    $0x9,%bl
400001cf:	76 df                	jbe    400001b0 <atoi+0x30>
    }
    if (numstart == loc) {
400001d1:	39 f2                	cmp    %esi,%edx
400001d3:	74 3b                	je     40000210 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
400001d5:	89 c8                	mov    %ecx,%eax
400001d7:	f7 d8                	neg    %eax
400001d9:	85 ff                	test   %edi,%edi
400001db:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
400001de:	8b 44 24 18          	mov    0x18(%esp),%eax
400001e2:	89 08                	mov    %ecx,(%eax)
    return loc;
}
400001e4:	89 d0                	mov    %edx,%eax
400001e6:	5b                   	pop    %ebx
400001e7:	5e                   	pop    %esi
400001e8:	5f                   	pop    %edi
400001e9:	5d                   	pop    %ebp
400001ea:	c3                   	ret
400001eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001f0:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
400001f4:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
400001f9:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001fe:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000202:	8d 50 d0             	lea    -0x30(%eax),%edx
40000205:	80 fa 09             	cmp    $0x9,%dl
40000208:	76 99                	jbe    400001a3 <atoi+0x23>
4000020a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000210:	31 d2                	xor    %edx,%edx
}
40000212:	5b                   	pop    %ebx
40000213:	89 d0                	mov    %edx,%eax
40000215:	5e                   	pop    %esi
40000216:	5f                   	pop    %edi
40000217:	5d                   	pop    %ebp
40000218:	c3                   	ret
40000219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000220:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000224:	31 ff                	xor    %edi,%edi
        loc++;
40000226:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000022b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000022f:	8d 50 d0             	lea    -0x30(%eax),%edx
40000232:	80 fa 09             	cmp    $0x9,%dl
40000235:	0f 86 68 ff ff ff    	jbe    400001a3 <atoi+0x23>
        return 0;
4000023b:	31 d2                	xor    %edx,%edx
4000023d:	eb d3                	jmp    40000212 <atoi+0x92>
4000023f:	90                   	nop

40000240 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
40000240:	53                   	push   %ebx
40000241:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000245:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000024a:	8b 02                	mov    (%edx),%eax
4000024c:	8d 48 01             	lea    0x1(%eax),%ecx
4000024f:	89 0a                	mov    %ecx,(%edx)
40000251:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000255:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
4000025b:	75 14                	jne    40000271 <putch+0x31>
        b->buf[b->idx] = 0;
4000025d:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
40000264:	8d 5a 08             	lea    0x8(%edx),%ebx
#include <x86.h>
#include <file.h>

static gcc_inline void sys_puts(const char *s, size_t len)
{
    asm volatile ("int %0"
40000267:	31 c0                	xor    %eax,%eax
40000269:	cd 30                	int    $0x30
        b->idx = 0;
4000026b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
40000271:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
40000275:	5b                   	pop    %ebx
40000276:	c3                   	ret
40000277:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000027e:	00 
4000027f:	90                   	nop

40000280 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
40000280:	53                   	push   %ebx
40000281:	e8 f1 fe ff ff       	call   40000177 <__x86.get_pc_thunk.bx>
40000286:	81 c3 6e 3d 00 00    	add    $0x3d6e,%ebx
4000028c:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
40000292:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000299:	00 
    b.cnt = 0;
4000029a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400002a1:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
400002a2:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400002a9:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400002b0:	8d 44 24 10          	lea    0x10(%esp),%eax
400002b4:	50                   	push   %eax
400002b5:	8d 83 4c c2 ff ff    	lea    -0x3db4(%ebx),%eax
400002bb:	50                   	push   %eax
400002bc:	e8 3f 01 00 00       	call   40000400 <vprintfmt>

    b.buf[b.idx] = 0;
400002c1:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400002c5:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400002c9:	31 c0                	xor    %eax,%eax
400002cb:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
400002d0:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
400002d2:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400002d6:	81 c4 28 02 00 00    	add    $0x228,%esp
400002dc:	5b                   	pop    %ebx
400002dd:	c3                   	ret
400002de:	66 90                	xchg   %ax,%ax

400002e0 <printf>:

int printf(const char *fmt, ...)
{
400002e0:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
400002e3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400002e7:	50                   	push   %eax
400002e8:	ff 74 24 1c          	push   0x1c(%esp)
400002ec:	e8 8f ff ff ff       	call   40000280 <vcprintf>
    va_end(ap);

    return cnt;
}
400002f1:	83 c4 1c             	add    $0x1c,%esp
400002f4:	c3                   	ret
400002f5:	66 90                	xchg   %ax,%ax
400002f7:	66 90                	xchg   %ax,%ax
400002f9:	66 90                	xchg   %ax,%ax
400002fb:	66 90                	xchg   %ax,%ax
400002fd:	66 90                	xchg   %ax,%ax
400002ff:	90                   	nop

40000300 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000300:	e8 86 07 00 00       	call   40000a8b <__x86.get_pc_thunk.cx>
40000305:	81 c1 ef 3c 00 00    	add    $0x3cef,%ecx
{
4000030b:	55                   	push   %ebp
4000030c:	57                   	push   %edi
4000030d:	89 d7                	mov    %edx,%edi
4000030f:	56                   	push   %esi
40000310:	89 c6                	mov    %eax,%esi
40000312:	53                   	push   %ebx
40000313:	83 ec 2c             	sub    $0x2c,%esp
40000316:	8b 44 24 40          	mov    0x40(%esp),%eax
4000031a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000031e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000322:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000329:	00 
{
4000032a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000032e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000332:	8b 44 24 48          	mov    0x48(%esp),%eax
40000336:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000033a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000033e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000342:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000346:	89 44 24 10          	mov    %eax,0x10(%esp)
4000034a:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
4000034e:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
40000351:	73 55                	jae    400003a8 <printnum+0xa8>
        while (--width > 0)
40000353:	83 fa 01             	cmp    $0x1,%edx
40000356:	7e 17                	jle    4000036f <printnum+0x6f>
40000358:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000035f:	00 
            putch(padc, putdat);
40000360:	83 ec 08             	sub    $0x8,%esp
40000363:	57                   	push   %edi
40000364:	55                   	push   %ebp
40000365:	ff d6                	call   *%esi
        while (--width > 0)
40000367:	83 c4 10             	add    $0x10,%esp
4000036a:	83 eb 01             	sub    $0x1,%ebx
4000036d:	75 f1                	jne    40000360 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
4000036f:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000373:	ff 74 24 14          	push   0x14(%esp)
40000377:	ff 74 24 14          	push   0x14(%esp)
4000037b:	ff 74 24 14          	push   0x14(%esp)
4000037f:	ff 74 24 14          	push   0x14(%esp)
40000383:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
40000387:	e8 b4 0d 00 00       	call   40001140 <__umoddi3>
4000038c:	0f be 84 03 30 e0 ff 	movsbl -0x1fd0(%ebx,%eax,1),%eax
40000393:	ff 
40000394:	89 44 24 50          	mov    %eax,0x50(%esp)
}
40000398:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
4000039b:	89 f0                	mov    %esi,%eax
}
4000039d:	5b                   	pop    %ebx
4000039e:	5e                   	pop    %esi
4000039f:	5f                   	pop    %edi
400003a0:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
400003a1:	ff e0                	jmp    *%eax
400003a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
400003a8:	83 ec 0c             	sub    $0xc,%esp
400003ab:	55                   	push   %ebp
400003ac:	53                   	push   %ebx
400003ad:	50                   	push   %eax
400003ae:	83 ec 08             	sub    $0x8,%esp
400003b1:	ff 74 24 34          	push   0x34(%esp)
400003b5:	ff 74 24 34          	push   0x34(%esp)
400003b9:	ff 74 24 34          	push   0x34(%esp)
400003bd:	ff 74 24 34          	push   0x34(%esp)
400003c1:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400003c5:	e8 46 0c 00 00       	call   40001010 <__udivdi3>
400003ca:	83 c4 18             	add    $0x18,%esp
400003cd:	52                   	push   %edx
400003ce:	89 fa                	mov    %edi,%edx
400003d0:	50                   	push   %eax
400003d1:	89 f0                	mov    %esi,%eax
400003d3:	e8 28 ff ff ff       	call   40000300 <printnum>
400003d8:	83 c4 20             	add    $0x20,%esp
400003db:	eb 92                	jmp    4000036f <printnum+0x6f>
400003dd:	8d 76 00             	lea    0x0(%esi),%esi

400003e0 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
400003e0:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
400003e4:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
400003e8:	8b 10                	mov    (%eax),%edx
400003ea:	3b 50 04             	cmp    0x4(%eax),%edx
400003ed:	73 0b                	jae    400003fa <sprintputch+0x1a>
        *b->buf++ = ch;
400003ef:	8d 4a 01             	lea    0x1(%edx),%ecx
400003f2:	89 08                	mov    %ecx,(%eax)
400003f4:	8b 44 24 04          	mov    0x4(%esp),%eax
400003f8:	88 02                	mov    %al,(%edx)
}
400003fa:	c3                   	ret
400003fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000400 <vprintfmt>:
{
40000400:	e8 7e 06 00 00       	call   40000a83 <__x86.get_pc_thunk.ax>
40000405:	05 ef 3b 00 00       	add    $0x3bef,%eax
4000040a:	55                   	push   %ebp
4000040b:	57                   	push   %edi
4000040c:	56                   	push   %esi
4000040d:	53                   	push   %ebx
4000040e:	83 ec 2c             	sub    $0x2c,%esp
40000411:	8b 74 24 40          	mov    0x40(%esp),%esi
40000415:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000419:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000041d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000421:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000425:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000428:	83 f8 25             	cmp    $0x25,%eax
4000042b:	75 19                	jne    40000446 <vprintfmt+0x46>
4000042d:	eb 29                	jmp    40000458 <vprintfmt+0x58>
4000042f:	90                   	nop
            putch(ch, putdat);
40000430:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000433:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000436:	57                   	push   %edi
40000437:	50                   	push   %eax
40000438:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000043a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000043e:	83 c4 10             	add    $0x10,%esp
40000441:	83 f8 25             	cmp    $0x25,%eax
40000444:	74 12                	je     40000458 <vprintfmt+0x58>
            if (ch == '\0')
40000446:	85 c0                	test   %eax,%eax
40000448:	75 e6                	jne    40000430 <vprintfmt+0x30>
}
4000044a:	83 c4 2c             	add    $0x2c,%esp
4000044d:	5b                   	pop    %ebx
4000044e:	5e                   	pop    %esi
4000044f:	5f                   	pop    %edi
40000450:	5d                   	pop    %ebp
40000451:	c3                   	ret
40000452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
40000458:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
4000045d:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
40000462:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
40000469:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000470:	ff 
        lflag = 0;
40000471:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
40000478:	00 
40000479:	89 54 24 14          	mov    %edx,0x14(%esp)
4000047d:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000481:	0f b6 0b             	movzbl (%ebx),%ecx
40000484:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000487:	8d 41 dd             	lea    -0x23(%ecx),%eax
4000048a:	3c 55                	cmp    $0x55,%al
4000048c:	77 12                	ja     400004a0 <.L21>
4000048e:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000492:	0f b6 c0             	movzbl %al,%eax
40000495:	8b b4 82 58 e0 ff ff 	mov    -0x1fa8(%edx,%eax,4),%esi
4000049c:	01 d6                	add    %edx,%esi
4000049e:	ff e6                	jmp    *%esi

400004a0 <.L21>:
            putch('%', putdat);
400004a0:	8b 74 24 40          	mov    0x40(%esp),%esi
400004a4:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
400004a7:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
400004a9:	57                   	push   %edi
400004aa:	6a 25                	push   $0x25
400004ac:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
400004ae:	83 c4 10             	add    $0x10,%esp
400004b1:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
400004b5:	0f 84 66 ff ff ff    	je     40000421 <vprintfmt+0x21>
400004bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400004c0:	83 ed 01             	sub    $0x1,%ebp
400004c3:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400004c7:	75 f7                	jne    400004c0 <.L21+0x20>
400004c9:	e9 53 ff ff ff       	jmp    40000421 <vprintfmt+0x21>
400004ce:	66 90                	xchg   %ax,%ax

400004d0 <.L31>:
                ch = *fmt;
400004d0:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
400004d4:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
400004d7:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
400004d9:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
400004dd:	8d 48 d0             	lea    -0x30(%eax),%ecx
400004e0:	83 f9 09             	cmp    $0x9,%ecx
400004e3:	77 28                	ja     4000050d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
400004e5:	8b 74 24 40          	mov    0x40(%esp),%esi
400004e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
400004f0:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
400004f3:	8d 14 92             	lea    (%edx,%edx,4),%edx
400004f6:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
400004fa:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
400004fd:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000500:	83 f9 09             	cmp    $0x9,%ecx
40000503:	76 eb                	jbe    400004f0 <.L31+0x20>
40000505:	89 54 24 14          	mov    %edx,0x14(%esp)
40000509:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000050d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000511:	85 f6                	test   %esi,%esi
40000513:	0f 89 68 ff ff ff    	jns    40000481 <vprintfmt+0x81>
                width = precision, precision = -1;
40000519:	8b 44 24 14          	mov    0x14(%esp),%eax
4000051d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000524:	ff 
40000525:	89 44 24 08          	mov    %eax,0x8(%esp)
40000529:	e9 53 ff ff ff       	jmp    40000481 <vprintfmt+0x81>

4000052e <.L35>:
            altflag = 1;
4000052e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000535:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000537:	e9 45 ff ff ff       	jmp    40000481 <vprintfmt+0x81>

4000053c <.L34>:
            putch(ch, putdat);
4000053c:	8b 74 24 40          	mov    0x40(%esp),%esi
40000540:	83 ec 08             	sub    $0x8,%esp
40000543:	57                   	push   %edi
40000544:	6a 25                	push   $0x25
40000546:	ff d6                	call   *%esi
            break;
40000548:	83 c4 10             	add    $0x10,%esp
4000054b:	e9 d1 fe ff ff       	jmp    40000421 <vprintfmt+0x21>

40000550 <.L33>:
            precision = va_arg(ap, int);
40000550:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
40000554:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
40000556:	8b 00                	mov    (%eax),%eax
40000558:	89 44 24 14          	mov    %eax,0x14(%esp)
4000055c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000560:	83 c0 04             	add    $0x4,%eax
40000563:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
40000567:	eb a4                	jmp    4000050d <.L31+0x3d>

40000569 <.L32>:
            if (width < 0)
40000569:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000056d:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
4000056f:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
40000571:	85 c9                	test   %ecx,%ecx
40000573:	0f 49 c1             	cmovns %ecx,%eax
40000576:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
4000057a:	e9 02 ff ff ff       	jmp    40000481 <vprintfmt+0x81>

4000057f <.L30>:
            putch(va_arg(ap, int), putdat);
4000057f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000583:	8b 74 24 40          	mov    0x40(%esp),%esi
40000587:	83 ec 08             	sub    $0x8,%esp
4000058a:	57                   	push   %edi
4000058b:	8d 58 04             	lea    0x4(%eax),%ebx
4000058e:	8b 44 24 58          	mov    0x58(%esp),%eax
40000592:	ff 30                	push   (%eax)
40000594:	ff d6                	call   *%esi
            break;
40000596:	83 c4 10             	add    $0x10,%esp
            putch(va_arg(ap, int), putdat);
40000599:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
            break;
4000059d:	e9 7f fe ff ff       	jmp    40000421 <vprintfmt+0x21>

400005a2 <.L24>:
    if (lflag >= 2)
400005a2:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400005a7:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400005ab:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400005af:	0f 8f d8 01 00 00    	jg     4000078d <.L25+0xe0>
        return va_arg(*ap, unsigned long);
400005b5:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400005b9:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400005bc:	31 db                	xor    %ebx,%ebx
400005be:	ba 0a 00 00 00       	mov    $0xa,%edx
400005c3:	8b 09                	mov    (%ecx),%ecx
400005c5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400005c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
400005d0:	83 ec 0c             	sub    $0xc,%esp
400005d3:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
400005d8:	50                   	push   %eax
400005d9:	89 f0                	mov    %esi,%eax
400005db:	ff 74 24 18          	push   0x18(%esp)
400005df:	52                   	push   %edx
400005e0:	89 fa                	mov    %edi,%edx
400005e2:	53                   	push   %ebx
400005e3:	51                   	push   %ecx
400005e4:	e8 17 fd ff ff       	call   40000300 <printnum>
            break;
400005e9:	83 c4 20             	add    $0x20,%esp
400005ec:	e9 30 fe ff ff       	jmp    40000421 <vprintfmt+0x21>

400005f1 <.L26>:
            putch('0', putdat);
400005f1:	8b 74 24 40          	mov    0x40(%esp),%esi
400005f5:	83 ec 08             	sub    $0x8,%esp
400005f8:	57                   	push   %edi
400005f9:	6a 30                	push   $0x30
400005fb:	ff d6                	call   *%esi
            putch('x', putdat);
400005fd:	59                   	pop    %ecx
400005fe:	5b                   	pop    %ebx
400005ff:	57                   	push   %edi
40000600:	6a 78                	push   $0x78
            num = (unsigned long long)
40000602:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000604:	ff d6                	call   *%esi
            num = (unsigned long long)
40000606:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000060a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000060f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000611:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000614:	83 c0 04             	add    $0x4,%eax
40000617:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000061b:	eb b3                	jmp    400005d0 <.L24+0x2e>

4000061d <.L22>:
    if (lflag >= 2)
4000061d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000622:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000626:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000062a:	0f 8f 6e 01 00 00    	jg     4000079e <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000630:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000634:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000637:	31 db                	xor    %ebx,%ebx
40000639:	ba 10 00 00 00       	mov    $0x10,%edx
4000063e:	8b 09                	mov    (%ecx),%ecx
40000640:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000644:	eb 8a                	jmp    400005d0 <.L24+0x2e>

40000646 <.L29>:
    if (lflag >= 2)
40000646:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
4000064b:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
4000064f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
40000653:	0f 8f 5b 01 00 00    	jg     400007b4 <.L25+0x107>
        return va_arg(*ap, long);
40000659:	8b 00                	mov    (%eax),%eax
4000065b:	89 c3                	mov    %eax,%ebx
4000065d:	89 c1                	mov    %eax,%ecx
4000065f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000663:	c1 fb 1f             	sar    $0x1f,%ebx
40000666:	83 c0 04             	add    $0x4,%eax
40000669:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
4000066d:	85 db                	test   %ebx,%ebx
4000066f:	0f 88 68 01 00 00    	js     400007dd <.L19+0xc>
        return va_arg(*ap, unsigned long long);
40000675:	ba 0a 00 00 00       	mov    $0xa,%edx
4000067a:	e9 51 ff ff ff       	jmp    400005d0 <.L24+0x2e>

4000067f <.L28>:
            lflag++;
4000067f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000684:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000686:	e9 f6 fd ff ff       	jmp    40000481 <vprintfmt+0x81>

4000068b <.L27>:
            putch('X', putdat);
4000068b:	8b 74 24 40          	mov    0x40(%esp),%esi
4000068f:	83 ec 08             	sub    $0x8,%esp
40000692:	57                   	push   %edi
40000693:	6a 58                	push   $0x58
40000695:	ff d6                	call   *%esi
            putch('X', putdat);
40000697:	58                   	pop    %eax
40000698:	5a                   	pop    %edx
40000699:	57                   	push   %edi
4000069a:	6a 58                	push   $0x58
4000069c:	ff d6                	call   *%esi
            putch('X', putdat);
4000069e:	59                   	pop    %ecx
4000069f:	5b                   	pop    %ebx
400006a0:	57                   	push   %edi
400006a1:	6a 58                	push   $0x58
400006a3:	ff d6                	call   *%esi
            break;
400006a5:	83 c4 10             	add    $0x10,%esp
400006a8:	e9 74 fd ff ff       	jmp    40000421 <vprintfmt+0x21>

400006ad <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
400006ad:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
400006b1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
400006b5:	8b 54 24 14          	mov    0x14(%esp),%edx
400006b9:	8b 74 24 40          	mov    0x40(%esp),%esi
400006bd:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
400006c0:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
400006c5:	89 44 24 14          	mov    %eax,0x14(%esp)
400006c9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006cd:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
400006cf:	0f 95 c0             	setne  %al
400006d2:	85 c9                	test   %ecx,%ecx
400006d4:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
400006d7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
400006db:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
400006dd:	85 db                	test   %ebx,%ebx
400006df:	0f 84 21 01 00 00    	je     40000806 <.L19+0x35>
            if (width > 0 && padc != '-')
400006e5:	84 c0                	test   %al,%al
400006e7:	0f 85 48 01 00 00    	jne    40000835 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
400006ed:	89 d8                	mov    %ebx,%eax
400006ef:	8d 5b 01             	lea    0x1(%ebx),%ebx
400006f2:	0f be 08             	movsbl (%eax),%ecx
400006f5:	89 c8                	mov    %ecx,%eax
400006f7:	85 c9                	test   %ecx,%ecx
400006f9:	74 64                	je     4000075f <.L25+0xb2>
400006fb:	89 74 24 40          	mov    %esi,0x40(%esp)
400006ff:	89 d6                	mov    %edx,%esi
40000701:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000705:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000709:	eb 2a                	jmp    40000735 <.L25+0x88>
4000070b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000710:	83 e8 20             	sub    $0x20,%eax
40000713:	83 f8 5e             	cmp    $0x5e,%eax
40000716:	76 2d                	jbe    40000745 <.L25+0x98>
                    putch('?', putdat);
40000718:	83 ec 08             	sub    $0x8,%esp
4000071b:	57                   	push   %edi
4000071c:	6a 3f                	push   $0x3f
4000071e:	ff 54 24 50          	call   *0x50(%esp)
40000722:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000725:	0f be 03             	movsbl (%ebx),%eax
40000728:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000072b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000072e:	0f be c8             	movsbl %al,%ecx
40000731:	85 c9                	test   %ecx,%ecx
40000733:	74 1e                	je     40000753 <.L25+0xa6>
40000735:	85 f6                	test   %esi,%esi
40000737:	78 05                	js     4000073e <.L25+0x91>
                                         || --precision >= 0); width--)
40000739:	83 ee 01             	sub    $0x1,%esi
4000073c:	72 15                	jb     40000753 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000073e:	8b 14 24             	mov    (%esp),%edx
40000741:	85 d2                	test   %edx,%edx
40000743:	75 cb                	jne    40000710 <.L25+0x63>
                    putch(ch, putdat);
40000745:	83 ec 08             	sub    $0x8,%esp
40000748:	57                   	push   %edi
40000749:	51                   	push   %ecx
4000074a:	ff 54 24 50          	call   *0x50(%esp)
4000074e:	83 c4 10             	add    $0x10,%esp
40000751:	eb d2                	jmp    40000725 <.L25+0x78>
40000753:	89 6c 24 08          	mov    %ebp,0x8(%esp)
40000757:	8b 74 24 40          	mov    0x40(%esp),%esi
4000075b:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
4000075f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000763:	85 c0                	test   %eax,%eax
40000765:	7e 19                	jle    40000780 <.L25+0xd3>
40000767:	89 c3                	mov    %eax,%ebx
40000769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
40000770:	83 ec 08             	sub    $0x8,%esp
40000773:	57                   	push   %edi
40000774:	6a 20                	push   $0x20
40000776:	ff d6                	call   *%esi
            for (; width > 0; width--)
40000778:	83 c4 10             	add    $0x10,%esp
4000077b:	83 eb 01             	sub    $0x1,%ebx
4000077e:	75 f0                	jne    40000770 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
40000780:	8b 44 24 14          	mov    0x14(%esp),%eax
40000784:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000788:	e9 94 fc ff ff       	jmp    40000421 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
4000078d:	8b 08                	mov    (%eax),%ecx
4000078f:	8b 58 04             	mov    0x4(%eax),%ebx
40000792:	83 c0 08             	add    $0x8,%eax
40000795:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000799:	e9 d7 fe ff ff       	jmp    40000675 <.L29+0x2f>
4000079e:	8b 08                	mov    (%eax),%ecx
400007a0:	8b 58 04             	mov    0x4(%eax),%ebx
400007a3:	83 c0 08             	add    $0x8,%eax
400007a6:	ba 10 00 00 00       	mov    $0x10,%edx
400007ab:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007af:	e9 1c fe ff ff       	jmp    400005d0 <.L24+0x2e>
        return va_arg(*ap, long long);
400007b4:	8b 08                	mov    (%eax),%ecx
400007b6:	8b 58 04             	mov    0x4(%eax),%ebx
400007b9:	83 c0 08             	add    $0x8,%eax
400007bc:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007c0:	e9 a8 fe ff ff       	jmp    4000066d <.L29+0x27>

400007c5 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
400007c5:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400007ca:	89 eb                	mov    %ebp,%ebx
400007cc:	e9 b0 fc ff ff       	jmp    40000481 <vprintfmt+0x81>

400007d1 <.L19>:
            padc = '-';
400007d1:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400007d6:	89 eb                	mov    %ebp,%ebx
400007d8:	e9 a4 fc ff ff       	jmp    40000481 <vprintfmt+0x81>
400007dd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
400007e1:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
400007e4:	31 db                	xor    %ebx,%ebx
400007e6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
400007ea:	57                   	push   %edi
400007eb:	6a 2d                	push   $0x2d
400007ed:	ff d6                	call   *%esi
                num = -(long long) num;
400007ef:	8b 4c 24 10          	mov    0x10(%esp),%ecx
400007f3:	ba 0a 00 00 00       	mov    $0xa,%edx
400007f8:	f7 d9                	neg    %ecx
400007fa:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
400007fe:	83 c4 10             	add    $0x10,%esp
40000801:	e9 ca fd ff ff       	jmp    400005d0 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000806:	84 c0                	test   %al,%al
40000808:	0f 85 99 00 00 00    	jne    400008a7 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000080e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000812:	89 74 24 40          	mov    %esi,0x40(%esp)
40000816:	b9 28 00 00 00       	mov    $0x28,%ecx
4000081b:	89 d6                	mov    %edx,%esi
4000081d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000821:	b8 28 00 00 00       	mov    $0x28,%eax
40000826:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000082a:	8d 9b 42 e0 ff ff    	lea    -0x1fbe(%ebx),%ebx
40000830:	e9 00 ff ff ff       	jmp    40000735 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000835:	83 ec 08             	sub    $0x8,%esp
40000838:	52                   	push   %edx
40000839:	89 54 24 28          	mov    %edx,0x28(%esp)
4000083d:	ff 74 24 24          	push   0x24(%esp)
40000841:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000845:	e8 26 03 00 00       	call   40000b70 <strnlen>
4000084a:	29 44 24 18          	sub    %eax,0x18(%esp)
4000084e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000852:	83 c4 10             	add    $0x10,%esp
40000855:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000859:	85 c9                	test   %ecx,%ecx
4000085b:	0f 8e 99 00 00 00    	jle    400008fa <.L19+0x129>
                    putch(padc, putdat);
40000861:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000866:	89 54 24 10          	mov    %edx,0x10(%esp)
4000086a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000086e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000872:	83 ec 08             	sub    $0x8,%esp
40000875:	57                   	push   %edi
40000876:	53                   	push   %ebx
40000877:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
40000879:	83 c4 10             	add    $0x10,%esp
4000087c:	83 ed 01             	sub    $0x1,%ebp
4000087f:	75 f1                	jne    40000872 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
40000881:	8b 44 24 18          	mov    0x18(%esp),%eax
40000885:	8b 54 24 10          	mov    0x10(%esp),%edx
40000889:	89 6c 24 08          	mov    %ebp,0x8(%esp)
4000088d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000891:	8d 58 01             	lea    0x1(%eax),%ebx
40000894:	0f be 00             	movsbl (%eax),%eax
40000897:	0f be c8             	movsbl %al,%ecx
4000089a:	85 c9                	test   %ecx,%ecx
4000089c:	0f 85 59 fe ff ff    	jne    400006fb <.L25+0x4e>
400008a2:	e9 d9 fe ff ff       	jmp    40000780 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
400008a7:	83 ec 08             	sub    $0x8,%esp
400008aa:	52                   	push   %edx
400008ab:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400008af:	8d 8b 41 e0 ff ff    	lea    -0x1fbf(%ebx),%ecx
400008b5:	89 54 24 28          	mov    %edx,0x28(%esp)
400008b9:	51                   	push   %ecx
400008ba:	89 4c 24 28          	mov    %ecx,0x28(%esp)
400008be:	e8 ad 02 00 00       	call   40000b70 <strnlen>
400008c3:	29 44 24 18          	sub    %eax,0x18(%esp)
400008c7:	8b 44 24 18          	mov    0x18(%esp),%eax
400008cb:	83 c4 10             	add    $0x10,%esp
400008ce:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400008d2:	85 c0                	test   %eax,%eax
400008d4:	7f 8b                	jg     40000861 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
400008d6:	b9 28 00 00 00       	mov    $0x28,%ecx
400008db:	b8 28 00 00 00       	mov    $0x28,%eax
400008e0:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400008e4:	89 74 24 40          	mov    %esi,0x40(%esp)
400008e8:	89 d6                	mov    %edx,%esi
400008ea:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400008ee:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400008f2:	83 c3 01             	add    $0x1,%ebx
400008f5:	e9 3b fe ff ff       	jmp    40000735 <.L25+0x88>
400008fa:	8b 44 24 18          	mov    0x18(%esp),%eax
400008fe:	0f be 08             	movsbl (%eax),%ecx
40000901:	89 c8                	mov    %ecx,%eax
40000903:	85 c9                	test   %ecx,%ecx
40000905:	75 d9                	jne    400008e0 <.L19+0x10f>
40000907:	e9 74 fe ff ff       	jmp    40000780 <.L25+0xd3>
4000090c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000910 <printfmt>:
{
40000910:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000913:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000917:	50                   	push   %eax
40000918:	ff 74 24 1c          	push   0x1c(%esp)
4000091c:	ff 74 24 1c          	push   0x1c(%esp)
40000920:	ff 74 24 1c          	push   0x1c(%esp)
40000924:	e8 d7 fa ff ff       	call   40000400 <vprintfmt>
}
40000929:	83 c4 1c             	add    $0x1c,%esp
4000092c:	c3                   	ret
4000092d:	8d 76 00             	lea    0x0(%esi),%esi

40000930 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000930:	e8 4e 01 00 00       	call   40000a83 <__x86.get_pc_thunk.ax>
40000935:	05 bf 36 00 00       	add    $0x36bf,%eax
{
4000093a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
4000093d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000941:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000948:	ff 
40000949:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000950:	00 
40000951:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000955:	ff 74 24 28          	push   0x28(%esp)
40000959:	ff 74 24 28          	push   0x28(%esp)
4000095d:	8d 80 ec c3 ff ff    	lea    -0x3c14(%eax),%eax
40000963:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000967:	52                   	push   %edx
40000968:	50                   	push   %eax
40000969:	e8 92 fa ff ff       	call   40000400 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
4000096e:	8b 44 24 14          	mov    0x14(%esp),%eax
40000972:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000975:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000979:	83 c4 2c             	add    $0x2c,%esp
4000097c:	c3                   	ret
4000097d:	8d 76 00             	lea    0x0(%esi),%esi

40000980 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000980:	e8 fe 00 00 00       	call   40000a83 <__x86.get_pc_thunk.ax>
40000985:	05 6f 36 00 00       	add    $0x366f,%eax
{
4000098a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
4000098d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000991:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000998:	ff 
40000999:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009a0:	00 
400009a1:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
400009a5:	8d 54 24 28          	lea    0x28(%esp),%edx
400009a9:	52                   	push   %edx
400009aa:	ff 74 24 28          	push   0x28(%esp)
400009ae:	8d 80 ec c3 ff ff    	lea    -0x3c14(%eax),%eax
400009b4:	8d 54 24 0c          	lea    0xc(%esp),%edx
400009b8:	52                   	push   %edx
400009b9:	50                   	push   %eax
400009ba:	e8 41 fa ff ff       	call   40000400 <vprintfmt>
    *b.buf = '\0';
400009bf:	8b 44 24 14          	mov    0x14(%esp),%eax
400009c3:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
400009c6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400009ca:	83 c4 2c             	add    $0x2c,%esp
400009cd:	c3                   	ret
400009ce:	66 90                	xchg   %ax,%ax

400009d0 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
400009d0:	e8 b2 00 00 00       	call   40000a87 <__x86.get_pc_thunk.dx>
400009d5:	81 c2 1f 36 00 00    	add    $0x361f,%edx
{
400009db:	83 ec 1c             	sub    $0x1c,%esp
400009de:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
400009e2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
400009e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009ed:	00 
400009ee:	89 44 24 04          	mov    %eax,0x4(%esp)
400009f2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
400009f6:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
400009fa:	ff 74 24 2c          	push   0x2c(%esp)
400009fe:	ff 74 24 2c          	push   0x2c(%esp)
40000a02:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a06:	50                   	push   %eax
40000a07:	8d 82 ec c3 ff ff    	lea    -0x3c14(%edx),%eax
40000a0d:	50                   	push   %eax
40000a0e:	e8 ed f9 ff ff       	call   40000400 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a13:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a17:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a1a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a1e:	83 c4 2c             	add    $0x2c,%esp
40000a21:	c3                   	ret
40000a22:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000a29:	00 
40000a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000a30 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a30:	e8 52 00 00 00       	call   40000a87 <__x86.get_pc_thunk.dx>
40000a35:	81 c2 bf 35 00 00    	add    $0x35bf,%edx
{
40000a3b:	83 ec 1c             	sub    $0x1c,%esp
40000a3e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a42:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000a46:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a4d:	00 
40000a4e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000a52:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000a56:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a5a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000a5e:	50                   	push   %eax
40000a5f:	ff 74 24 2c          	push   0x2c(%esp)
40000a63:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a67:	50                   	push   %eax
40000a68:	8d 82 ec c3 ff ff    	lea    -0x3c14(%edx),%eax
40000a6e:	50                   	push   %eax
40000a6f:	e8 8c f9 ff ff       	call   40000400 <vprintfmt>
    *b.buf = '\0';
40000a74:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a78:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000a7b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a7f:	83 c4 2c             	add    $0x2c,%esp
40000a82:	c3                   	ret

40000a83 <__x86.get_pc_thunk.ax>:
40000a83:	8b 04 24             	mov    (%esp),%eax
40000a86:	c3                   	ret

40000a87 <__x86.get_pc_thunk.dx>:
40000a87:	8b 14 24             	mov    (%esp),%edx
40000a8a:	c3                   	ret

40000a8b <__x86.get_pc_thunk.cx>:
40000a8b:	8b 0c 24             	mov    (%esp),%ecx
40000a8e:	c3                   	ret
40000a8f:	90                   	nop

40000a90 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000a90:	53                   	push   %ebx
static gcc_inline pid_t sys_spawn(unsigned int elf_id, unsigned int quota)
{
    int errno;
    pid_t pid;

    asm volatile ("int %2"
40000a91:	b8 01 00 00 00       	mov    $0x1,%eax
40000a96:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000a9a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000a9e:	cd 30                	int    $0x30
                    "a" (SYS_spawn),
                    "b" (elf_id),
                    "c" (quota)
                  : "cc", "memory");

    return errno ? -1 : pid;
40000aa0:	85 c0                	test   %eax,%eax
40000aa2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000aa7:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000aaa:	5b                   	pop    %ebx
40000aab:	c3                   	ret
40000aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000ab0 <yield>:
}

static gcc_inline void sys_yield(void)
{
    asm volatile ("int %0"
40000ab0:	b8 02 00 00 00       	mov    $0x2,%eax
40000ab5:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000ab7:	c3                   	ret
40000ab8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000abf:	00 

40000ac0 <produce>:
    return errno ? -1 : pid;
}

static gcc_inline void sys_produce(void)
{
    asm volatile ("int %0"
40000ac0:	b8 0d 00 00 00       	mov    $0xd,%eax
40000ac5:	cd 30                	int    $0x30

void produce(void)
{
    sys_produce();
}
40000ac7:	c3                   	ret
40000ac8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000acf:	00 

40000ad0 <consume>:
                  : "cc", "memory");
}

static gcc_inline void sys_consume(void)
{
    asm volatile ("int %0"
40000ad0:	b8 0e 00 00 00       	mov    $0xe,%eax
40000ad5:	cd 30                	int    $0x30

void consume(void)
{
    sys_consume();
}
40000ad7:	c3                   	ret
40000ad8:	66 90                	xchg   %ax,%ax
40000ada:	66 90                	xchg   %ax,%ax
40000adc:	66 90                	xchg   %ax,%ax
40000ade:	66 90                	xchg   %ax,%ax

40000ae0 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000ae0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000ae4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000aea:	c3                   	ret
40000aeb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000af0 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000af0:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000af4:	b8 01 00 00 00       	mov    $0x1,%eax
40000af9:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000afc:	85 c0                	test   %eax,%eax
40000afe:	74 13                	je     40000b13 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000b00:	b9 01 00 00 00       	mov    $0x1,%ecx
40000b05:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000b08:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000b0a:	89 c8                	mov    %ecx,%eax
40000b0c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b0f:	85 c0                	test   %eax,%eax
40000b11:	75 f5                	jne    40000b08 <spinlock_acquire+0x18>
}
40000b13:	c3                   	ret
40000b14:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b1b:	00 
40000b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b20 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000b20:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000b24:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000b26:	84 c0                	test   %al,%al
40000b28:	74 05                	je     40000b2f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000b2a:	31 c0                	xor    %eax,%eax
40000b2c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000b2f:	c3                   	ret

40000b30 <spinlock_holding>:
    return *lk;
40000b30:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b34:	8b 00                	mov    (%eax),%eax
}
40000b36:	c3                   	ret
40000b37:	66 90                	xchg   %ax,%ax
40000b39:	66 90                	xchg   %ax,%ax
40000b3b:	66 90                	xchg   %ax,%ax
40000b3d:	66 90                	xchg   %ax,%ax
40000b3f:	90                   	nop

40000b40 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000b40:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000b44:	31 c0                	xor    %eax,%eax
40000b46:	80 3a 00             	cmpb   $0x0,(%edx)
40000b49:	74 15                	je     40000b60 <strlen+0x20>
40000b4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000b50:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000b53:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000b57:	75 f7                	jne    40000b50 <strlen+0x10>
40000b59:	c3                   	ret
40000b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000b60:	c3                   	ret
40000b61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b68:	00 
40000b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000b70 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000b70:	8b 54 24 08          	mov    0x8(%esp),%edx
40000b74:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000b78:	31 c0                	xor    %eax,%eax
40000b7a:	85 d2                	test   %edx,%edx
40000b7c:	75 09                	jne    40000b87 <strnlen+0x17>
40000b7e:	c3                   	ret
40000b7f:	90                   	nop
        n++;
40000b80:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000b83:	39 c2                	cmp    %eax,%edx
40000b85:	74 09                	je     40000b90 <strnlen+0x20>
40000b87:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000b8b:	75 f3                	jne    40000b80 <strnlen+0x10>
40000b8d:	c3                   	ret
40000b8e:	66 90                	xchg   %ax,%ax
    return n;
}
40000b90:	c3                   	ret
40000b91:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b98:	00 
40000b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000ba0 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000ba0:	53                   	push   %ebx
40000ba1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000ba5:	31 c0                	xor    %eax,%eax
{
40000ba7:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000bab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000bb0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000bb4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000bb7:	83 c0 01             	add    $0x1,%eax
40000bba:	84 d2                	test   %dl,%dl
40000bbc:	75 f2                	jne    40000bb0 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000bbe:	89 c8                	mov    %ecx,%eax
40000bc0:	5b                   	pop    %ebx
40000bc1:	c3                   	ret
40000bc2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bc9:	00 
40000bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000bd0 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000bd0:	56                   	push   %esi
40000bd1:	53                   	push   %ebx
40000bd2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000bd6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000bda:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000bde:	85 db                	test   %ebx,%ebx
40000be0:	74 21                	je     40000c03 <strncpy+0x33>
40000be2:	01 f3                	add    %esi,%ebx
40000be4:	89 f0                	mov    %esi,%eax
40000be6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bed:	00 
40000bee:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000bf0:	0f b6 0a             	movzbl (%edx),%ecx
40000bf3:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000bf6:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000bf9:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000bfc:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000bff:	39 c3                	cmp    %eax,%ebx
40000c01:	75 ed                	jne    40000bf0 <strncpy+0x20>
    }
    return ret;
}
40000c03:	89 f0                	mov    %esi,%eax
40000c05:	5b                   	pop    %ebx
40000c06:	5e                   	pop    %esi
40000c07:	c3                   	ret
40000c08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c0f:	00 

40000c10 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000c10:	56                   	push   %esi
40000c11:	53                   	push   %ebx
40000c12:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c16:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c1a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000c1e:	85 c0                	test   %eax,%eax
40000c20:	74 29                	je     40000c4b <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000c22:	89 f2                	mov    %esi,%edx
40000c24:	83 e8 01             	sub    $0x1,%eax
40000c27:	74 1f                	je     40000c48 <strlcpy+0x38>
40000c29:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000c2c:	eb 0f                	jmp    40000c3d <strlcpy+0x2d>
40000c2e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000c30:	83 c2 01             	add    $0x1,%edx
40000c33:	83 c1 01             	add    $0x1,%ecx
40000c36:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000c39:	39 da                	cmp    %ebx,%edx
40000c3b:	74 07                	je     40000c44 <strlcpy+0x34>
40000c3d:	0f b6 01             	movzbl (%ecx),%eax
40000c40:	84 c0                	test   %al,%al
40000c42:	75 ec                	jne    40000c30 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000c44:	89 d0                	mov    %edx,%eax
40000c46:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000c48:	c6 02 00             	movb   $0x0,(%edx)
}
40000c4b:	5b                   	pop    %ebx
40000c4c:	5e                   	pop    %esi
40000c4d:	c3                   	ret
40000c4e:	66 90                	xchg   %ax,%ax

40000c50 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000c50:	53                   	push   %ebx
40000c51:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c55:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000c59:	0f b6 02             	movzbl (%edx),%eax
40000c5c:	84 c0                	test   %al,%al
40000c5e:	75 18                	jne    40000c78 <strcmp+0x28>
40000c60:	eb 30                	jmp    40000c92 <strcmp+0x42>
40000c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000c68:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000c6c:	83 c2 01             	add    $0x1,%edx
40000c6f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000c72:	84 c0                	test   %al,%al
40000c74:	74 12                	je     40000c88 <strcmp+0x38>
40000c76:	89 d9                	mov    %ebx,%ecx
40000c78:	0f b6 19             	movzbl (%ecx),%ebx
40000c7b:	38 c3                	cmp    %al,%bl
40000c7d:	74 e9                	je     40000c68 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000c7f:	29 d8                	sub    %ebx,%eax
}
40000c81:	5b                   	pop    %ebx
40000c82:	c3                   	ret
40000c83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000c88:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000c8c:	31 c0                	xor    %eax,%eax
40000c8e:	29 d8                	sub    %ebx,%eax
}
40000c90:	5b                   	pop    %ebx
40000c91:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000c92:	0f b6 19             	movzbl (%ecx),%ebx
40000c95:	31 c0                	xor    %eax,%eax
40000c97:	eb e6                	jmp    40000c7f <strcmp+0x2f>
40000c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000ca0 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000ca0:	53                   	push   %ebx
40000ca1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000ca5:	8b 44 24 08          	mov    0x8(%esp),%eax
40000ca9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000cad:	85 d2                	test   %edx,%edx
40000caf:	75 16                	jne    40000cc7 <strncmp+0x27>
40000cb1:	eb 2d                	jmp    40000ce0 <strncmp+0x40>
40000cb3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cb8:	3a 19                	cmp    (%ecx),%bl
40000cba:	75 12                	jne    40000cce <strncmp+0x2e>
        n--, p++, q++;
40000cbc:	83 c0 01             	add    $0x1,%eax
40000cbf:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000cc2:	83 ea 01             	sub    $0x1,%edx
40000cc5:	74 19                	je     40000ce0 <strncmp+0x40>
40000cc7:	0f b6 18             	movzbl (%eax),%ebx
40000cca:	84 db                	test   %bl,%bl
40000ccc:	75 ea                	jne    40000cb8 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000cce:	0f b6 00             	movzbl (%eax),%eax
40000cd1:	0f b6 11             	movzbl (%ecx),%edx
}
40000cd4:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000cd5:	29 d0                	sub    %edx,%eax
}
40000cd7:	c3                   	ret
40000cd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000cdf:	00 
        return 0;
40000ce0:	31 c0                	xor    %eax,%eax
}
40000ce2:	5b                   	pop    %ebx
40000ce3:	c3                   	ret
40000ce4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ceb:	00 
40000cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000cf0 <strchr>:

char *strchr(const char *s, char c)
{
40000cf0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000cf4:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000cf9:	0f b6 10             	movzbl (%eax),%edx
40000cfc:	84 d2                	test   %dl,%dl
40000cfe:	75 13                	jne    40000d13 <strchr+0x23>
40000d00:	eb 1e                	jmp    40000d20 <strchr+0x30>
40000d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d08:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d0c:	83 c0 01             	add    $0x1,%eax
40000d0f:	84 d2                	test   %dl,%dl
40000d11:	74 0d                	je     40000d20 <strchr+0x30>
        if (*s == c)
40000d13:	38 d1                	cmp    %dl,%cl
40000d15:	75 f1                	jne    40000d08 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000d17:	c3                   	ret
40000d18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d1f:	00 
    return 0;
40000d20:	31 c0                	xor    %eax,%eax
}
40000d22:	c3                   	ret
40000d23:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d2a:	00 
40000d2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000d30 <strfind>:

char *strfind(const char *s, char c)
{
40000d30:	53                   	push   %ebx
40000d31:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d35:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000d39:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000d3c:	38 d3                	cmp    %dl,%bl
40000d3e:	74 1f                	je     40000d5f <strfind+0x2f>
40000d40:	89 d1                	mov    %edx,%ecx
40000d42:	84 db                	test   %bl,%bl
40000d44:	75 0e                	jne    40000d54 <strfind+0x24>
40000d46:	eb 17                	jmp    40000d5f <strfind+0x2f>
40000d48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d4f:	00 
40000d50:	84 d2                	test   %dl,%dl
40000d52:	74 0b                	je     40000d5f <strfind+0x2f>
    for (; *s; s++)
40000d54:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d58:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000d5b:	38 ca                	cmp    %cl,%dl
40000d5d:	75 f1                	jne    40000d50 <strfind+0x20>
            break;
    return (char *) s;
}
40000d5f:	5b                   	pop    %ebx
40000d60:	c3                   	ret
40000d61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d68:	00 
40000d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000d70 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000d70:	55                   	push   %ebp
40000d71:	57                   	push   %edi
40000d72:	56                   	push   %esi
40000d73:	53                   	push   %ebx
40000d74:	8b 54 24 14          	mov    0x14(%esp),%edx
40000d78:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000d7c:	0f b6 02             	movzbl (%edx),%eax
40000d7f:	3c 20                	cmp    $0x20,%al
40000d81:	75 10                	jne    40000d93 <strtol+0x23>
40000d83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d88:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000d8c:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000d8f:	3c 20                	cmp    $0x20,%al
40000d91:	74 f5                	je     40000d88 <strtol+0x18>
40000d93:	3c 09                	cmp    $0x9,%al
40000d95:	74 f1                	je     40000d88 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000d97:	3c 2b                	cmp    $0x2b,%al
40000d99:	0f 84 b1 00 00 00    	je     40000e50 <strtol+0xe0>
    int neg = 0;
40000d9f:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000da1:	3c 2d                	cmp    $0x2d,%al
40000da3:	0f 84 97 00 00 00    	je     40000e40 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000da9:	0f b6 02             	movzbl (%edx),%eax
40000dac:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000db3:	ff 
40000db4:	75 1d                	jne    40000dd3 <strtol+0x63>
40000db6:	3c 30                	cmp    $0x30,%al
40000db8:	0f 84 a2 00 00 00    	je     40000e60 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000dbe:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000dc3:	19 c0                	sbb    %eax,%eax
40000dc5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000dc9:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000dce:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000dd3:	31 c9                	xor    %ecx,%ecx
40000dd5:	eb 1c                	jmp    40000df3 <strtol+0x83>
40000dd7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dde:	00 
40000ddf:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000de0:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000de3:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000de7:	7d 2a                	jge    40000e13 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000de9:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000dee:	83 c2 01             	add    $0x1,%edx
40000df1:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000df3:	0f be 02             	movsbl (%edx),%eax
40000df6:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000df9:	89 eb                	mov    %ebp,%ebx
40000dfb:	80 fb 09             	cmp    $0x9,%bl
40000dfe:	76 e0                	jbe    40000de0 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000e00:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000e03:	89 eb                	mov    %ebp,%ebx
40000e05:	80 fb 19             	cmp    $0x19,%bl
40000e08:	77 26                	ja     40000e30 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000e0a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000e0d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e11:	7c d6                	jl     40000de9 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000e13:	85 f6                	test   %esi,%esi
40000e15:	74 02                	je     40000e19 <strtol+0xa9>
        *endptr = (char *) s;
40000e17:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000e19:	89 c8                	mov    %ecx,%eax
}
40000e1b:	5b                   	pop    %ebx
40000e1c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000e1d:	f7 d8                	neg    %eax
40000e1f:	85 ff                	test   %edi,%edi
}
40000e21:	5f                   	pop    %edi
40000e22:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000e23:	0f 45 c8             	cmovne %eax,%ecx
}
40000e26:	89 c8                	mov    %ecx,%eax
40000e28:	c3                   	ret
40000e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000e30:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000e33:	89 eb                	mov    %ebp,%ebx
40000e35:	80 fb 19             	cmp    $0x19,%bl
40000e38:	77 d9                	ja     40000e13 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000e3a:	83 e8 37             	sub    $0x37,%eax
40000e3d:	eb a4                	jmp    40000de3 <strtol+0x73>
40000e3f:	90                   	nop
        s++, neg = 1;
40000e40:	83 c2 01             	add    $0x1,%edx
40000e43:	bf 01 00 00 00       	mov    $0x1,%edi
40000e48:	e9 5c ff ff ff       	jmp    40000da9 <strtol+0x39>
40000e4d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000e50:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000e53:	31 ff                	xor    %edi,%edi
40000e55:	e9 4f ff ff ff       	jmp    40000da9 <strtol+0x39>
40000e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000e60:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000e64:	74 25                	je     40000e8b <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000e66:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000e6a:	85 c0                	test   %eax,%eax
40000e6c:	74 0d                	je     40000e7b <strtol+0x10b>
40000e6e:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000e75:	00 
40000e76:	e9 58 ff ff ff       	jmp    40000dd3 <strtol+0x63>
        s++, base = 8;
40000e7b:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000e82:	00 
40000e83:	83 c2 01             	add    $0x1,%edx
40000e86:	e9 48 ff ff ff       	jmp    40000dd3 <strtol+0x63>
        s += 2, base = 16;
40000e8b:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000e92:	00 
40000e93:	83 c2 02             	add    $0x2,%edx
40000e96:	e9 38 ff ff ff       	jmp    40000dd3 <strtol+0x63>
40000e9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000ea0 <memset>:

void *memset(void *v, int c, size_t n)
{
40000ea0:	57                   	push   %edi
40000ea1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000ea5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000ea9:	85 c9                	test   %ecx,%ecx
40000eab:	74 19                	je     40000ec6 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000ead:	89 f8                	mov    %edi,%eax
40000eaf:	09 c8                	or     %ecx,%eax
40000eb1:	a8 03                	test   $0x3,%al
40000eb3:	75 1b                	jne    40000ed0 <memset+0x30>
        c &= 0xFF;
40000eb5:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000eba:	c1 e9 02             	shr    $0x2,%ecx
40000ebd:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000ec3:	fc                   	cld
40000ec4:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000ec6:	89 f8                	mov    %edi,%eax
40000ec8:	5f                   	pop    %edi
40000ec9:	c3                   	ret
40000eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000ed0:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ed4:	fc                   	cld
40000ed5:	f3 aa                	rep stos %al,%es:(%edi)
}
40000ed7:	89 f8                	mov    %edi,%eax
40000ed9:	5f                   	pop    %edi
40000eda:	c3                   	ret
40000edb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000ee0 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000ee0:	57                   	push   %edi
40000ee1:	56                   	push   %esi
40000ee2:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000ee6:	8b 74 24 10          	mov    0x10(%esp),%esi
40000eea:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000eee:	39 c6                	cmp    %eax,%esi
40000ef0:	73 26                	jae    40000f18 <memmove+0x38>
40000ef2:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000ef5:	39 d0                	cmp    %edx,%eax
40000ef7:	73 1f                	jae    40000f18 <memmove+0x38>
        s += n;
        d += n;
40000ef9:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000efc:	89 fe                	mov    %edi,%esi
40000efe:	09 ce                	or     %ecx,%esi
40000f00:	09 d6                	or     %edx,%esi
40000f02:	83 e6 03             	and    $0x3,%esi
40000f05:	74 39                	je     40000f40 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000f07:	83 ef 01             	sub    $0x1,%edi
40000f0a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000f0d:	fd                   	std
40000f0e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000f10:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000f11:	5e                   	pop    %esi
40000f12:	5f                   	pop    %edi
40000f13:	c3                   	ret
40000f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f18:	89 c2                	mov    %eax,%edx
40000f1a:	09 ca                	or     %ecx,%edx
40000f1c:	09 f2                	or     %esi,%edx
40000f1e:	83 e2 03             	and    $0x3,%edx
40000f21:	74 0d                	je     40000f30 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40000f23:	89 c7                	mov    %eax,%edi
40000f25:	fc                   	cld
40000f26:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40000f28:	5e                   	pop    %esi
40000f29:	5f                   	pop    %edi
40000f2a:	c3                   	ret
40000f2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40000f30:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40000f33:	89 c7                	mov    %eax,%edi
40000f35:	fc                   	cld
40000f36:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000f38:	eb ee                	jmp    40000f28 <memmove+0x48>
40000f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40000f40:	83 ef 04             	sub    $0x4,%edi
40000f43:	8d 72 fc             	lea    -0x4(%edx),%esi
40000f46:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40000f49:	fd                   	std
40000f4a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000f4c:	eb c2                	jmp    40000f10 <memmove+0x30>
40000f4e:	66 90                	xchg   %ax,%ax

40000f50 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40000f50:	eb 8e                	jmp    40000ee0 <memmove>
40000f52:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000f59:	00 
40000f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000f60 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40000f60:	56                   	push   %esi
40000f61:	53                   	push   %ebx
40000f62:	8b 74 24 14          	mov    0x14(%esp),%esi
40000f66:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f6a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
40000f6e:	85 f6                	test   %esi,%esi
40000f70:	74 2e                	je     40000fa0 <memcmp+0x40>
40000f72:	01 c6                	add    %eax,%esi
40000f74:	eb 14                	jmp    40000f8a <memcmp+0x2a>
40000f76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000f7d:	00 
40000f7e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40000f80:	83 c0 01             	add    $0x1,%eax
40000f83:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40000f86:	39 f0                	cmp    %esi,%eax
40000f88:	74 16                	je     40000fa0 <memcmp+0x40>
        if (*s1 != *s2)
40000f8a:	0f b6 08             	movzbl (%eax),%ecx
40000f8d:	0f b6 1a             	movzbl (%edx),%ebx
40000f90:	38 d9                	cmp    %bl,%cl
40000f92:	74 ec                	je     40000f80 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40000f94:	0f b6 c1             	movzbl %cl,%eax
40000f97:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40000f99:	5b                   	pop    %ebx
40000f9a:	5e                   	pop    %esi
40000f9b:	c3                   	ret
40000f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
40000fa0:	31 c0                	xor    %eax,%eax
}
40000fa2:	5b                   	pop    %ebx
40000fa3:	5e                   	pop    %esi
40000fa4:	c3                   	ret
40000fa5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fac:	00 
40000fad:	8d 76 00             	lea    0x0(%esi),%esi

40000fb0 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40000fb0:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
40000fb4:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000fb8:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
40000fba:	39 d0                	cmp    %edx,%eax
40000fbc:	73 1a                	jae    40000fd8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
40000fbe:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
40000fc3:	eb 0a                	jmp    40000fcf <memchr+0x1f>
40000fc5:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
40000fc8:	83 c0 01             	add    $0x1,%eax
40000fcb:	39 c2                	cmp    %eax,%edx
40000fcd:	74 09                	je     40000fd8 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
40000fcf:	38 08                	cmp    %cl,(%eax)
40000fd1:	75 f5                	jne    40000fc8 <memchr+0x18>
            return (void *) s;
    return NULL;
}
40000fd3:	c3                   	ret
40000fd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
40000fd8:	31 c0                	xor    %eax,%eax
}
40000fda:	c3                   	ret
40000fdb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000fe0 <memzero>:

void *memzero(void *v, size_t n)
{
40000fe0:	57                   	push   %edi
40000fe1:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000fe5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000fe9:	85 c9                	test   %ecx,%ecx
40000feb:	74 0f                	je     40000ffc <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000fed:	89 f8                	mov    %edi,%eax
40000fef:	09 c8                	or     %ecx,%eax
40000ff1:	83 e0 03             	and    $0x3,%eax
40000ff4:	75 0a                	jne    40001000 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40000ff6:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40000ff9:	fc                   	cld
40000ffa:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
40000ffc:	89 f8                	mov    %edi,%eax
40000ffe:	5f                   	pop    %edi
40000fff:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001000:	31 c0                	xor    %eax,%eax
40001002:	fc                   	cld
40001003:	f3 aa                	rep stos %al,%es:(%edi)
}
40001005:	89 f8                	mov    %edi,%eax
40001007:	5f                   	pop    %edi
40001008:	c3                   	ret
40001009:	66 90                	xchg   %ax,%ax
4000100b:	66 90                	xchg   %ax,%ax
4000100d:	66 90                	xchg   %ax,%ax
4000100f:	90                   	nop

40001010 <__udivdi3>:
40001010:	f3 0f 1e fb          	endbr32
40001014:	55                   	push   %ebp
40001015:	89 e5                	mov    %esp,%ebp
40001017:	57                   	push   %edi
40001018:	56                   	push   %esi
40001019:	53                   	push   %ebx
4000101a:	83 ec 1c             	sub    $0x1c,%esp
4000101d:	8b 7d 08             	mov    0x8(%ebp),%edi
40001020:	8b 45 14             	mov    0x14(%ebp),%eax
40001023:	8b 75 0c             	mov    0xc(%ebp),%esi
40001026:	8b 5d 10             	mov    0x10(%ebp),%ebx
40001029:	89 7d e4             	mov    %edi,-0x1c(%ebp)
4000102c:	85 c0                	test   %eax,%eax
4000102e:	75 20                	jne    40001050 <__udivdi3+0x40>
40001030:	39 de                	cmp    %ebx,%esi
40001032:	73 54                	jae    40001088 <__udivdi3+0x78>
40001034:	89 f8                	mov    %edi,%eax
40001036:	31 ff                	xor    %edi,%edi
40001038:	89 f2                	mov    %esi,%edx
4000103a:	f7 f3                	div    %ebx
4000103c:	89 fa                	mov    %edi,%edx
4000103e:	83 c4 1c             	add    $0x1c,%esp
40001041:	5b                   	pop    %ebx
40001042:	5e                   	pop    %esi
40001043:	5f                   	pop    %edi
40001044:	5d                   	pop    %ebp
40001045:	c3                   	ret
40001046:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000104d:	00 
4000104e:	66 90                	xchg   %ax,%ax
40001050:	39 c6                	cmp    %eax,%esi
40001052:	73 14                	jae    40001068 <__udivdi3+0x58>
40001054:	31 ff                	xor    %edi,%edi
40001056:	31 c0                	xor    %eax,%eax
40001058:	89 fa                	mov    %edi,%edx
4000105a:	83 c4 1c             	add    $0x1c,%esp
4000105d:	5b                   	pop    %ebx
4000105e:	5e                   	pop    %esi
4000105f:	5f                   	pop    %edi
40001060:	5d                   	pop    %ebp
40001061:	c3                   	ret
40001062:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001068:	0f bd f8             	bsr    %eax,%edi
4000106b:	83 f7 1f             	xor    $0x1f,%edi
4000106e:	75 48                	jne    400010b8 <__udivdi3+0xa8>
40001070:	39 f0                	cmp    %esi,%eax
40001072:	72 07                	jb     4000107b <__udivdi3+0x6b>
40001074:	31 c0                	xor    %eax,%eax
40001076:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
40001079:	72 dd                	jb     40001058 <__udivdi3+0x48>
4000107b:	b8 01 00 00 00       	mov    $0x1,%eax
40001080:	eb d6                	jmp    40001058 <__udivdi3+0x48>
40001082:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001088:	89 d9                	mov    %ebx,%ecx
4000108a:	85 db                	test   %ebx,%ebx
4000108c:	75 0b                	jne    40001099 <__udivdi3+0x89>
4000108e:	b8 01 00 00 00       	mov    $0x1,%eax
40001093:	31 d2                	xor    %edx,%edx
40001095:	f7 f3                	div    %ebx
40001097:	89 c1                	mov    %eax,%ecx
40001099:	31 d2                	xor    %edx,%edx
4000109b:	89 f0                	mov    %esi,%eax
4000109d:	f7 f1                	div    %ecx
4000109f:	89 c6                	mov    %eax,%esi
400010a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
400010a4:	89 f7                	mov    %esi,%edi
400010a6:	f7 f1                	div    %ecx
400010a8:	89 fa                	mov    %edi,%edx
400010aa:	83 c4 1c             	add    $0x1c,%esp
400010ad:	5b                   	pop    %ebx
400010ae:	5e                   	pop    %esi
400010af:	5f                   	pop    %edi
400010b0:	5d                   	pop    %ebp
400010b1:	c3                   	ret
400010b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400010b8:	89 f9                	mov    %edi,%ecx
400010ba:	ba 20 00 00 00       	mov    $0x20,%edx
400010bf:	29 fa                	sub    %edi,%edx
400010c1:	d3 e0                	shl    %cl,%eax
400010c3:	89 45 e0             	mov    %eax,-0x20(%ebp)
400010c6:	89 d1                	mov    %edx,%ecx
400010c8:	89 d8                	mov    %ebx,%eax
400010ca:	d3 e8                	shr    %cl,%eax
400010cc:	89 c1                	mov    %eax,%ecx
400010ce:	8b 45 e0             	mov    -0x20(%ebp),%eax
400010d1:	09 c1                	or     %eax,%ecx
400010d3:	89 f0                	mov    %esi,%eax
400010d5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
400010d8:	89 f9                	mov    %edi,%ecx
400010da:	d3 e3                	shl    %cl,%ebx
400010dc:	89 d1                	mov    %edx,%ecx
400010de:	d3 e8                	shr    %cl,%eax
400010e0:	89 5d dc             	mov    %ebx,-0x24(%ebp)
400010e3:	89 f9                	mov    %edi,%ecx
400010e5:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
400010e8:	d3 e6                	shl    %cl,%esi
400010ea:	89 d1                	mov    %edx,%ecx
400010ec:	d3 eb                	shr    %cl,%ebx
400010ee:	09 f3                	or     %esi,%ebx
400010f0:	89 c6                	mov    %eax,%esi
400010f2:	89 f2                	mov    %esi,%edx
400010f4:	89 d8                	mov    %ebx,%eax
400010f6:	f7 75 e0             	divl   -0x20(%ebp)
400010f9:	89 d6                	mov    %edx,%esi
400010fb:	89 c3                	mov    %eax,%ebx
400010fd:	f7 65 dc             	mull   -0x24(%ebp)
40001100:	89 55 e0             	mov    %edx,-0x20(%ebp)
40001103:	39 d6                	cmp    %edx,%esi
40001105:	72 21                	jb     40001128 <__udivdi3+0x118>
40001107:	8b 55 e4             	mov    -0x1c(%ebp),%edx
4000110a:	89 f9                	mov    %edi,%ecx
4000110c:	d3 e2                	shl    %cl,%edx
4000110e:	39 c2                	cmp    %eax,%edx
40001110:	73 07                	jae    40001119 <__udivdi3+0x109>
40001112:	8b 55 e0             	mov    -0x20(%ebp),%edx
40001115:	39 d6                	cmp    %edx,%esi
40001117:	74 0f                	je     40001128 <__udivdi3+0x118>
40001119:	89 d8                	mov    %ebx,%eax
4000111b:	31 ff                	xor    %edi,%edi
4000111d:	e9 36 ff ff ff       	jmp    40001058 <__udivdi3+0x48>
40001122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001128:	8d 43 ff             	lea    -0x1(%ebx),%eax
4000112b:	31 ff                	xor    %edi,%edi
4000112d:	e9 26 ff ff ff       	jmp    40001058 <__udivdi3+0x48>
40001132:	66 90                	xchg   %ax,%ax
40001134:	66 90                	xchg   %ax,%ax
40001136:	66 90                	xchg   %ax,%ax
40001138:	66 90                	xchg   %ax,%ax
4000113a:	66 90                	xchg   %ax,%ax
4000113c:	66 90                	xchg   %ax,%ax
4000113e:	66 90                	xchg   %ax,%ax

40001140 <__umoddi3>:
40001140:	f3 0f 1e fb          	endbr32
40001144:	55                   	push   %ebp
40001145:	89 e5                	mov    %esp,%ebp
40001147:	57                   	push   %edi
40001148:	56                   	push   %esi
40001149:	53                   	push   %ebx
4000114a:	83 ec 2c             	sub    $0x2c,%esp
4000114d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
40001150:	8b 45 14             	mov    0x14(%ebp),%eax
40001153:	8b 75 08             	mov    0x8(%ebp),%esi
40001156:	8b 7d 10             	mov    0x10(%ebp),%edi
40001159:	89 da                	mov    %ebx,%edx
4000115b:	85 c0                	test   %eax,%eax
4000115d:	75 19                	jne    40001178 <__umoddi3+0x38>
4000115f:	39 fb                	cmp    %edi,%ebx
40001161:	73 5d                	jae    400011c0 <__umoddi3+0x80>
40001163:	89 f0                	mov    %esi,%eax
40001165:	f7 f7                	div    %edi
40001167:	89 d0                	mov    %edx,%eax
40001169:	31 d2                	xor    %edx,%edx
4000116b:	83 c4 2c             	add    $0x2c,%esp
4000116e:	5b                   	pop    %ebx
4000116f:	5e                   	pop    %esi
40001170:	5f                   	pop    %edi
40001171:	5d                   	pop    %ebp
40001172:	c3                   	ret
40001173:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40001178:	89 75 e0             	mov    %esi,-0x20(%ebp)
4000117b:	39 c3                	cmp    %eax,%ebx
4000117d:	73 11                	jae    40001190 <__umoddi3+0x50>
4000117f:	89 f0                	mov    %esi,%eax
40001181:	83 c4 2c             	add    $0x2c,%esp
40001184:	5b                   	pop    %ebx
40001185:	5e                   	pop    %esi
40001186:	5f                   	pop    %edi
40001187:	5d                   	pop    %ebp
40001188:	c3                   	ret
40001189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001190:	0f bd c8             	bsr    %eax,%ecx
40001193:	83 f1 1f             	xor    $0x1f,%ecx
40001196:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
40001199:	75 45                	jne    400011e0 <__umoddi3+0xa0>
4000119b:	39 d8                	cmp    %ebx,%eax
4000119d:	0f 82 d5 00 00 00    	jb     40001278 <__umoddi3+0x138>
400011a3:	39 fe                	cmp    %edi,%esi
400011a5:	0f 83 cd 00 00 00    	jae    40001278 <__umoddi3+0x138>
400011ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
400011ae:	83 c4 2c             	add    $0x2c,%esp
400011b1:	5b                   	pop    %ebx
400011b2:	5e                   	pop    %esi
400011b3:	5f                   	pop    %edi
400011b4:	5d                   	pop    %ebp
400011b5:	c3                   	ret
400011b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400011bd:	00 
400011be:	66 90                	xchg   %ax,%ax
400011c0:	89 f9                	mov    %edi,%ecx
400011c2:	85 ff                	test   %edi,%edi
400011c4:	75 0b                	jne    400011d1 <__umoddi3+0x91>
400011c6:	b8 01 00 00 00       	mov    $0x1,%eax
400011cb:	31 d2                	xor    %edx,%edx
400011cd:	f7 f7                	div    %edi
400011cf:	89 c1                	mov    %eax,%ecx
400011d1:	89 d8                	mov    %ebx,%eax
400011d3:	31 d2                	xor    %edx,%edx
400011d5:	f7 f1                	div    %ecx
400011d7:	89 f0                	mov    %esi,%eax
400011d9:	f7 f1                	div    %ecx
400011db:	eb 8a                	jmp    40001167 <__umoddi3+0x27>
400011dd:	8d 76 00             	lea    0x0(%esi),%esi
400011e0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
400011e3:	ba 20 00 00 00       	mov    $0x20,%edx
400011e8:	29 ca                	sub    %ecx,%edx
400011ea:	d3 e0                	shl    %cl,%eax
400011ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
400011ef:	89 d1                	mov    %edx,%ecx
400011f1:	89 f8                	mov    %edi,%eax
400011f3:	d3 e8                	shr    %cl,%eax
400011f5:	89 55 e0             	mov    %edx,-0x20(%ebp)
400011f8:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
400011fc:	89 c2                	mov    %eax,%edx
400011fe:	8b 45 dc             	mov    -0x24(%ebp),%eax
40001201:	d3 e7                	shl    %cl,%edi
40001203:	09 c2                	or     %eax,%edx
40001205:	8b 45 e0             	mov    -0x20(%ebp),%eax
40001208:	89 7d d8             	mov    %edi,-0x28(%ebp)
4000120b:	89 f7                	mov    %esi,%edi
4000120d:	89 55 dc             	mov    %edx,-0x24(%ebp)
40001210:	89 da                	mov    %ebx,%edx
40001212:	89 c1                	mov    %eax,%ecx
40001214:	d3 ea                	shr    %cl,%edx
40001216:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
4000121a:	d3 e3                	shl    %cl,%ebx
4000121c:	89 c1                	mov    %eax,%ecx
4000121e:	d3 ef                	shr    %cl,%edi
40001220:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
40001224:	89 f8                	mov    %edi,%eax
40001226:	d3 e6                	shl    %cl,%esi
40001228:	09 d8                	or     %ebx,%eax
4000122a:	f7 75 dc             	divl   -0x24(%ebp)
4000122d:	89 d3                	mov    %edx,%ebx
4000122f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
40001232:	89 f7                	mov    %esi,%edi
40001234:	f7 65 d8             	mull   -0x28(%ebp)
40001237:	89 c6                	mov    %eax,%esi
40001239:	89 d1                	mov    %edx,%ecx
4000123b:	39 d3                	cmp    %edx,%ebx
4000123d:	72 06                	jb     40001245 <__umoddi3+0x105>
4000123f:	75 0e                	jne    4000124f <__umoddi3+0x10f>
40001241:	39 c7                	cmp    %eax,%edi
40001243:	73 0a                	jae    4000124f <__umoddi3+0x10f>
40001245:	2b 45 d8             	sub    -0x28(%ebp),%eax
40001248:	1b 55 dc             	sbb    -0x24(%ebp),%edx
4000124b:	89 d1                	mov    %edx,%ecx
4000124d:	89 c6                	mov    %eax,%esi
4000124f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
40001252:	8b 7d e4             	mov    -0x1c(%ebp),%edi
40001255:	29 f0                	sub    %esi,%eax
40001257:	19 cb                	sbb    %ecx,%ebx
40001259:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
4000125d:	89 da                	mov    %ebx,%edx
4000125f:	d3 e2                	shl    %cl,%edx
40001261:	89 f9                	mov    %edi,%ecx
40001263:	d3 e8                	shr    %cl,%eax
40001265:	d3 eb                	shr    %cl,%ebx
40001267:	09 d0                	or     %edx,%eax
40001269:	89 da                	mov    %ebx,%edx
4000126b:	83 c4 2c             	add    $0x2c,%esp
4000126e:	5b                   	pop    %ebx
4000126f:	5e                   	pop    %esi
40001270:	5f                   	pop    %edi
40001271:	5d                   	pop    %ebp
40001272:	c3                   	ret
40001273:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40001278:	89 da                	mov    %ebx,%edx
4000127a:	29 fe                	sub    %edi,%esi
4000127c:	19 c2                	sbb    %eax,%edx
4000127e:	89 75 e0             	mov    %esi,-0x20(%ebp)
40001281:	e9 25 ff ff ff       	jmp    400011ab <__umoddi3+0x6b>
