
obj/user/idle/idle:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:
#include <stdio.h>
#include <syscall.h>
#include <x86.h>

int main(int argc, char **argv)
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	53                   	push   %ebx
4000000e:	e8 c4 01 00 00       	call   400001d7 <__x86.get_pc_thunk.bx>
40000013:	81 c3 e1 3f 00 00    	add    $0x3fe1,%ebx
40000019:	51                   	push   %ecx
#if LAB <= 5
    printf("idle\n");
4000001a:	83 ec 0c             	sub    $0xc,%esp
4000001d:	8d 83 48 e0 ff ff    	lea    -0x1fb8(%ebx),%eax
40000023:	50                   	push   %eax
40000024:	e8 17 03 00 00       	call   40000340 <printf>

    pid_t ping_pid, pong_pid, ding_pid;

    if ((ping_pid = spawn(1, 1000)) != -1)
40000029:	59                   	pop    %ecx
4000002a:	58                   	pop    %eax
4000002b:	68 e8 03 00 00       	push   $0x3e8
40000030:	6a 01                	push   $0x1
40000032:	e8 b9 0a 00 00       	call   40000af0 <spawn>
40000037:	83 c4 10             	add    $0x10,%esp
4000003a:	83 f8 ff             	cmp    $0xffffffff,%eax
4000003d:	74 70                	je     400000af <main+0xaf>
        printf("ping in process %d.\n", ping_pid);
4000003f:	52                   	push   %edx
40000040:	52                   	push   %edx
40000041:	50                   	push   %eax
40000042:	8d 83 4e e0 ff ff    	lea    -0x1fb2(%ebx),%eax
40000048:	50                   	push   %eax
40000049:	e8 f2 02 00 00       	call   40000340 <printf>
4000004e:	83 c4 10             	add    $0x10,%esp
    else
        printf("Failed to launch ping.\n");

    if ((pong_pid = spawn(2, 1000)) != -1)
40000051:	83 ec 08             	sub    $0x8,%esp
40000054:	68 e8 03 00 00       	push   $0x3e8
40000059:	6a 02                	push   $0x2
4000005b:	e8 90 0a 00 00       	call   40000af0 <spawn>
40000060:	83 c4 10             	add    $0x10,%esp
40000063:	83 f8 ff             	cmp    $0xffffffff,%eax
40000066:	74 6f                	je     400000d7 <main+0xd7>
        printf("pong in process %d.\n", pong_pid);
40000068:	51                   	push   %ecx
40000069:	51                   	push   %ecx
4000006a:	50                   	push   %eax
4000006b:	8d 83 7b e0 ff ff    	lea    -0x1f85(%ebx),%eax
40000071:	50                   	push   %eax
40000072:	e8 c9 02 00 00       	call   40000340 <printf>
40000077:	83 c4 10             	add    $0x10,%esp
    else
        printf("Failed to launch pong.\n");

    if ((ding_pid = spawn(3, 1000)) != -1)
4000007a:	83 ec 08             	sub    $0x8,%esp
4000007d:	68 e8 03 00 00       	push   $0x3e8
40000082:	6a 03                	push   $0x3
40000084:	e8 67 0a 00 00       	call   40000af0 <spawn>
40000089:	83 c4 10             	add    $0x10,%esp
4000008c:	83 f8 ff             	cmp    $0xffffffff,%eax
4000008f:	74 32                	je     400000c3 <main+0xc3>
        printf("ding in process %d.\n", ding_pid);
40000091:	52                   	push   %edx
40000092:	52                   	push   %edx
40000093:	50                   	push   %eax
40000094:	8d 83 a8 e0 ff ff    	lea    -0x1f58(%ebx),%eax
4000009a:	50                   	push   %eax
4000009b:	e8 a0 02 00 00       	call   40000340 <printf>
400000a0:	83 c4 10             	add    $0x10,%esp
    else
        printf("Failed to launch fstest.\n");
#endif

    return 0;
}
400000a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
400000a6:	31 c0                	xor    %eax,%eax
400000a8:	59                   	pop    %ecx
400000a9:	5b                   	pop    %ebx
400000aa:	5d                   	pop    %ebp
400000ab:	8d 61 fc             	lea    -0x4(%ecx),%esp
400000ae:	c3                   	ret
        printf("Failed to launch ping.\n");
400000af:	83 ec 0c             	sub    $0xc,%esp
400000b2:	8d 83 63 e0 ff ff    	lea    -0x1f9d(%ebx),%eax
400000b8:	50                   	push   %eax
400000b9:	e8 82 02 00 00       	call   40000340 <printf>
400000be:	83 c4 10             	add    $0x10,%esp
400000c1:	eb 8e                	jmp    40000051 <main+0x51>
        printf("Failed to launch ding.\n");
400000c3:	83 ec 0c             	sub    $0xc,%esp
400000c6:	8d 83 bd e0 ff ff    	lea    -0x1f43(%ebx),%eax
400000cc:	50                   	push   %eax
400000cd:	e8 6e 02 00 00       	call   40000340 <printf>
400000d2:	83 c4 10             	add    $0x10,%esp
400000d5:	eb cc                	jmp    400000a3 <main+0xa3>
        printf("Failed to launch pong.\n");
400000d7:	83 ec 0c             	sub    $0xc,%esp
400000da:	8d 83 90 e0 ff ff    	lea    -0x1f70(%ebx),%eax
400000e0:	50                   	push   %eax
400000e1:	e8 5a 02 00 00       	call   40000340 <printf>
400000e6:	83 c4 10             	add    $0x10,%esp
400000e9:	eb 8f                	jmp    4000007a <main+0x7a>

400000eb <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
400000eb:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
400000f1:	75 04                	jne    400000f7 <args_exist>

400000f3 <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
400000f3:	6a 00                	push   $0x0
	pushl	$0
400000f5:	6a 00                	push   $0x0

400000f7 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
400000f7:	e8 04 ff ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
400000fc:	50                   	push   %eax
	/* Give the CPU to another process once main returns. */
	call	yield
400000fd:	e8 0e 0a 00 00       	call   40000b10 <yield>

40000102 <spin>:
spin:
	jmp	spin
40000102:	eb fe                	jmp    40000102 <spin>
40000104:	66 90                	xchg   %ax,%ax
40000106:	66 90                	xchg   %ax,%ax
40000108:	66 90                	xchg   %ax,%ax
4000010a:	66 90                	xchg   %ax,%ax
4000010c:	66 90                	xchg   %ax,%ax
4000010e:	66 90                	xchg   %ax,%ax

40000110 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
40000110:	53                   	push   %ebx
40000111:	e8 c1 00 00 00       	call   400001d7 <__x86.get_pc_thunk.bx>
40000116:	81 c3 de 3e 00 00    	add    $0x3ede,%ebx
4000011c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
4000011f:	ff 74 24 18          	push   0x18(%esp)
40000123:	ff 74 24 18          	push   0x18(%esp)
40000127:	8d 83 0c e0 ff ff    	lea    -0x1ff4(%ebx),%eax
4000012d:	50                   	push   %eax
4000012e:	e8 0d 02 00 00       	call   40000340 <printf>
    vcprintf(fmt, ap);
40000133:	58                   	pop    %eax
40000134:	5a                   	pop    %edx
40000135:	8d 44 24 24          	lea    0x24(%esp),%eax
40000139:	50                   	push   %eax
4000013a:	ff 74 24 24          	push   0x24(%esp)
4000013e:	e8 9d 01 00 00       	call   400002e0 <vcprintf>
    va_end(ap);
}
40000143:	83 c4 18             	add    $0x18,%esp
40000146:	5b                   	pop    %ebx
40000147:	c3                   	ret
40000148:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000014f:	00 

40000150 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000150:	53                   	push   %ebx
40000151:	e8 81 00 00 00       	call   400001d7 <__x86.get_pc_thunk.bx>
40000156:	81 c3 9e 3e 00 00    	add    $0x3e9e,%ebx
4000015c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
4000015f:	ff 74 24 18          	push   0x18(%esp)
40000163:	ff 74 24 18          	push   0x18(%esp)
40000167:	8d 83 18 e0 ff ff    	lea    -0x1fe8(%ebx),%eax
4000016d:	50                   	push   %eax
4000016e:	e8 cd 01 00 00       	call   40000340 <printf>
    vcprintf(fmt, ap);
40000173:	58                   	pop    %eax
40000174:	5a                   	pop    %edx
40000175:	8d 44 24 24          	lea    0x24(%esp),%eax
40000179:	50                   	push   %eax
4000017a:	ff 74 24 24          	push   0x24(%esp)
4000017e:	e8 5d 01 00 00       	call   400002e0 <vcprintf>
    va_end(ap);
}
40000183:	83 c4 18             	add    $0x18,%esp
40000186:	5b                   	pop    %ebx
40000187:	c3                   	ret
40000188:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000018f:	00 

40000190 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000190:	53                   	push   %ebx
40000191:	e8 41 00 00 00       	call   400001d7 <__x86.get_pc_thunk.bx>
40000196:	81 c3 5e 3e 00 00    	add    $0x3e5e,%ebx
4000019c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000019f:	ff 74 24 18          	push   0x18(%esp)
400001a3:	ff 74 24 18          	push   0x18(%esp)
400001a7:	8d 83 24 e0 ff ff    	lea    -0x1fdc(%ebx),%eax
400001ad:	50                   	push   %eax
400001ae:	e8 8d 01 00 00       	call   40000340 <printf>
    vcprintf(fmt, ap);
400001b3:	58                   	pop    %eax
400001b4:	5a                   	pop    %edx
400001b5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001b9:	50                   	push   %eax
400001ba:	ff 74 24 24          	push   0x24(%esp)
400001be:	e8 1d 01 00 00       	call   400002e0 <vcprintf>
400001c3:	83 c4 10             	add    $0x10,%esp
400001c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001cd:	00 
400001ce:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
400001d0:	e8 3b 09 00 00       	call   40000b10 <yield>
    while (1)
400001d5:	eb f9                	jmp    400001d0 <panic+0x40>

400001d7 <__x86.get_pc_thunk.bx>:
400001d7:	8b 1c 24             	mov    (%esp),%ebx
400001da:	c3                   	ret
400001db:	66 90                	xchg   %ax,%ax
400001dd:	66 90                	xchg   %ax,%ax
400001df:	90                   	nop

400001e0 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
400001e0:	55                   	push   %ebp
400001e1:	57                   	push   %edi
400001e2:	56                   	push   %esi
400001e3:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
400001e4:	8b 44 24 14          	mov    0x14(%esp),%eax
400001e8:	0f b6 00             	movzbl (%eax),%eax
400001eb:	3c 2b                	cmp    $0x2b,%al
400001ed:	0f 84 8d 00 00 00    	je     40000280 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
400001f3:	3c 2d                	cmp    $0x2d,%al
400001f5:	74 59                	je     40000250 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001f7:	8d 50 d0             	lea    -0x30(%eax),%edx
400001fa:	80 fa 09             	cmp    $0x9,%dl
400001fd:	77 71                	ja     40000270 <atoi+0x90>
    int negative = 0;
400001ff:	31 ff                	xor    %edi,%edi
    int loc = 0;
40000201:	31 f6                	xor    %esi,%esi
        loc++;
40000203:	89 f2                	mov    %esi,%edx
    int acc = 0;
40000205:	31 c9                	xor    %ecx,%ecx
40000207:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000020e:	00 
4000020f:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
40000210:	83 e8 30             	sub    $0x30,%eax
40000213:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
40000216:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
40000219:	0f be c0             	movsbl %al,%eax
4000021c:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000021f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000223:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
40000227:	8d 68 d0             	lea    -0x30(%eax),%ebp
4000022a:	89 eb                	mov    %ebp,%ebx
4000022c:	80 fb 09             	cmp    $0x9,%bl
4000022f:	76 df                	jbe    40000210 <atoi+0x30>
    }
    if (numstart == loc) {
40000231:	39 f2                	cmp    %esi,%edx
40000233:	74 3b                	je     40000270 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
40000235:	89 c8                	mov    %ecx,%eax
40000237:	f7 d8                	neg    %eax
40000239:	85 ff                	test   %edi,%edi
4000023b:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
4000023e:	8b 44 24 18          	mov    0x18(%esp),%eax
40000242:	89 08                	mov    %ecx,(%eax)
    return loc;
}
40000244:	89 d0                	mov    %edx,%eax
40000246:	5b                   	pop    %ebx
40000247:	5e                   	pop    %esi
40000248:	5f                   	pop    %edi
40000249:	5d                   	pop    %ebp
4000024a:	c3                   	ret
4000024b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000250:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
40000254:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000259:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000025e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000262:	8d 50 d0             	lea    -0x30(%eax),%edx
40000265:	80 fa 09             	cmp    $0x9,%dl
40000268:	76 99                	jbe    40000203 <atoi+0x23>
4000026a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000270:	31 d2                	xor    %edx,%edx
}
40000272:	5b                   	pop    %ebx
40000273:	89 d0                	mov    %edx,%eax
40000275:	5e                   	pop    %esi
40000276:	5f                   	pop    %edi
40000277:	5d                   	pop    %ebp
40000278:	c3                   	ret
40000279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000280:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000284:	31 ff                	xor    %edi,%edi
        loc++;
40000286:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000028b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000028f:	8d 50 d0             	lea    -0x30(%eax),%edx
40000292:	80 fa 09             	cmp    $0x9,%dl
40000295:	0f 86 68 ff ff ff    	jbe    40000203 <atoi+0x23>
        return 0;
4000029b:	31 d2                	xor    %edx,%edx
4000029d:	eb d3                	jmp    40000272 <atoi+0x92>
4000029f:	90                   	nop

400002a0 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
400002a0:	53                   	push   %ebx
400002a1:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
400002a5:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
400002aa:	8b 02                	mov    (%edx),%eax
400002ac:	8d 48 01             	lea    0x1(%eax),%ecx
400002af:	89 0a                	mov    %ecx,(%edx)
400002b1:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
400002b5:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
400002bb:	75 14                	jne    400002d1 <putch+0x31>
        b->buf[b->idx] = 0;
400002bd:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
400002c4:	8d 5a 08             	lea    0x8(%edx),%ebx
#include <x86.h>
#include <file.h>

static gcc_inline void sys_puts(const char *s, size_t len)
{
    asm volatile ("int %0"
400002c7:	31 c0                	xor    %eax,%eax
400002c9:	cd 30                	int    $0x30
        b->idx = 0;
400002cb:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
400002d1:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
400002d5:	5b                   	pop    %ebx
400002d6:	c3                   	ret
400002d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400002de:	00 
400002df:	90                   	nop

400002e0 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
400002e0:	53                   	push   %ebx
400002e1:	e8 f1 fe ff ff       	call   400001d7 <__x86.get_pc_thunk.bx>
400002e6:	81 c3 0e 3d 00 00    	add    $0x3d0e,%ebx
400002ec:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
400002f2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
400002f9:	00 
    b.cnt = 0;
400002fa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000301:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
40000302:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000309:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000310:	8d 44 24 10          	lea    0x10(%esp),%eax
40000314:	50                   	push   %eax
40000315:	8d 83 ac c2 ff ff    	lea    -0x3d54(%ebx),%eax
4000031b:	50                   	push   %eax
4000031c:	e8 3f 01 00 00       	call   40000460 <vprintfmt>

    b.buf[b.idx] = 0;
40000321:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000325:	8d 5c 24 20          	lea    0x20(%esp),%ebx
40000329:	31 c0                	xor    %eax,%eax
4000032b:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
40000330:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
40000332:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000336:	81 c4 28 02 00 00    	add    $0x228,%esp
4000033c:	5b                   	pop    %ebx
4000033d:	c3                   	ret
4000033e:	66 90                	xchg   %ax,%ax

40000340 <printf>:

int printf(const char *fmt, ...)
{
40000340:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
40000343:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000347:	50                   	push   %eax
40000348:	ff 74 24 1c          	push   0x1c(%esp)
4000034c:	e8 8f ff ff ff       	call   400002e0 <vcprintf>
    va_end(ap);

    return cnt;
}
40000351:	83 c4 1c             	add    $0x1c,%esp
40000354:	c3                   	ret
40000355:	66 90                	xchg   %ax,%ax
40000357:	66 90                	xchg   %ax,%ax
40000359:	66 90                	xchg   %ax,%ax
4000035b:	66 90                	xchg   %ax,%ax
4000035d:	66 90                	xchg   %ax,%ax
4000035f:	90                   	nop

40000360 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000360:	e8 86 07 00 00       	call   40000aeb <__x86.get_pc_thunk.cx>
40000365:	81 c1 8f 3c 00 00    	add    $0x3c8f,%ecx
{
4000036b:	55                   	push   %ebp
4000036c:	57                   	push   %edi
4000036d:	89 d7                	mov    %edx,%edi
4000036f:	56                   	push   %esi
40000370:	89 c6                	mov    %eax,%esi
40000372:	53                   	push   %ebx
40000373:	83 ec 2c             	sub    $0x2c,%esp
40000376:	8b 44 24 40          	mov    0x40(%esp),%eax
4000037a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000037e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000382:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000389:	00 
{
4000038a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000038e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000392:	8b 44 24 48          	mov    0x48(%esp),%eax
40000396:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000039a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000039e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400003a2:	39 44 24 08          	cmp    %eax,0x8(%esp)
400003a6:	89 44 24 10          	mov    %eax,0x10(%esp)
400003aa:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
400003ae:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
400003b1:	73 55                	jae    40000408 <printnum+0xa8>
        while (--width > 0)
400003b3:	83 fa 01             	cmp    $0x1,%edx
400003b6:	7e 17                	jle    400003cf <printnum+0x6f>
400003b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400003bf:	00 
            putch(padc, putdat);
400003c0:	83 ec 08             	sub    $0x8,%esp
400003c3:	57                   	push   %edi
400003c4:	55                   	push   %ebp
400003c5:	ff d6                	call   *%esi
        while (--width > 0)
400003c7:	83 c4 10             	add    $0x10,%esp
400003ca:	83 eb 01             	sub    $0x1,%ebx
400003cd:	75 f1                	jne    400003c0 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
400003cf:	89 7c 24 44          	mov    %edi,0x44(%esp)
400003d3:	ff 74 24 14          	push   0x14(%esp)
400003d7:	ff 74 24 14          	push   0x14(%esp)
400003db:	ff 74 24 14          	push   0x14(%esp)
400003df:	ff 74 24 14          	push   0x14(%esp)
400003e3:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
400003e7:	e8 b4 0d 00 00       	call   400011a0 <__umoddi3>
400003ec:	0f be 84 03 30 e0 ff 	movsbl -0x1fd0(%ebx,%eax,1),%eax
400003f3:	ff 
400003f4:	89 44 24 50          	mov    %eax,0x50(%esp)
}
400003f8:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
400003fb:	89 f0                	mov    %esi,%eax
}
400003fd:	5b                   	pop    %ebx
400003fe:	5e                   	pop    %esi
400003ff:	5f                   	pop    %edi
40000400:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
40000401:	ff e0                	jmp    *%eax
40000403:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
40000408:	83 ec 0c             	sub    $0xc,%esp
4000040b:	55                   	push   %ebp
4000040c:	53                   	push   %ebx
4000040d:	50                   	push   %eax
4000040e:	83 ec 08             	sub    $0x8,%esp
40000411:	ff 74 24 34          	push   0x34(%esp)
40000415:	ff 74 24 34          	push   0x34(%esp)
40000419:	ff 74 24 34          	push   0x34(%esp)
4000041d:	ff 74 24 34          	push   0x34(%esp)
40000421:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
40000425:	e8 46 0c 00 00       	call   40001070 <__udivdi3>
4000042a:	83 c4 18             	add    $0x18,%esp
4000042d:	52                   	push   %edx
4000042e:	89 fa                	mov    %edi,%edx
40000430:	50                   	push   %eax
40000431:	89 f0                	mov    %esi,%eax
40000433:	e8 28 ff ff ff       	call   40000360 <printnum>
40000438:	83 c4 20             	add    $0x20,%esp
4000043b:	eb 92                	jmp    400003cf <printnum+0x6f>
4000043d:	8d 76 00             	lea    0x0(%esi),%esi

40000440 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
40000440:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
40000444:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
40000448:	8b 10                	mov    (%eax),%edx
4000044a:	3b 50 04             	cmp    0x4(%eax),%edx
4000044d:	73 0b                	jae    4000045a <sprintputch+0x1a>
        *b->buf++ = ch;
4000044f:	8d 4a 01             	lea    0x1(%edx),%ecx
40000452:	89 08                	mov    %ecx,(%eax)
40000454:	8b 44 24 04          	mov    0x4(%esp),%eax
40000458:	88 02                	mov    %al,(%edx)
}
4000045a:	c3                   	ret
4000045b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000460 <vprintfmt>:
{
40000460:	e8 7e 06 00 00       	call   40000ae3 <__x86.get_pc_thunk.ax>
40000465:	05 8f 3b 00 00       	add    $0x3b8f,%eax
4000046a:	55                   	push   %ebp
4000046b:	57                   	push   %edi
4000046c:	56                   	push   %esi
4000046d:	53                   	push   %ebx
4000046e:	83 ec 2c             	sub    $0x2c,%esp
40000471:	8b 74 24 40          	mov    0x40(%esp),%esi
40000475:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000479:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000047d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000481:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000485:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000488:	83 f8 25             	cmp    $0x25,%eax
4000048b:	75 19                	jne    400004a6 <vprintfmt+0x46>
4000048d:	eb 29                	jmp    400004b8 <vprintfmt+0x58>
4000048f:	90                   	nop
            putch(ch, putdat);
40000490:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000493:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000496:	57                   	push   %edi
40000497:	50                   	push   %eax
40000498:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000049a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000049e:	83 c4 10             	add    $0x10,%esp
400004a1:	83 f8 25             	cmp    $0x25,%eax
400004a4:	74 12                	je     400004b8 <vprintfmt+0x58>
            if (ch == '\0')
400004a6:	85 c0                	test   %eax,%eax
400004a8:	75 e6                	jne    40000490 <vprintfmt+0x30>
}
400004aa:	83 c4 2c             	add    $0x2c,%esp
400004ad:	5b                   	pop    %ebx
400004ae:	5e                   	pop    %esi
400004af:	5f                   	pop    %edi
400004b0:	5d                   	pop    %ebp
400004b1:	c3                   	ret
400004b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
400004b8:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
400004bd:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
400004c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
400004c9:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400004d0:	ff 
        lflag = 0;
400004d1:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
400004d8:	00 
400004d9:	89 54 24 14          	mov    %edx,0x14(%esp)
400004dd:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400004e1:	0f b6 0b             	movzbl (%ebx),%ecx
400004e4:	8d 6b 01             	lea    0x1(%ebx),%ebp
400004e7:	8d 41 dd             	lea    -0x23(%ecx),%eax
400004ea:	3c 55                	cmp    $0x55,%al
400004ec:	77 12                	ja     40000500 <.L21>
400004ee:	8b 54 24 0c          	mov    0xc(%esp),%edx
400004f2:	0f b6 c0             	movzbl %al,%eax
400004f5:	8b b4 82 d8 e0 ff ff 	mov    -0x1f28(%edx,%eax,4),%esi
400004fc:	01 d6                	add    %edx,%esi
400004fe:	ff e6                	jmp    *%esi

40000500 <.L21>:
            putch('%', putdat);
40000500:	8b 74 24 40          	mov    0x40(%esp),%esi
40000504:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
40000507:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
40000509:	57                   	push   %edi
4000050a:	6a 25                	push   $0x25
4000050c:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
4000050e:	83 c4 10             	add    $0x10,%esp
40000511:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
40000515:	0f 84 66 ff ff ff    	je     40000481 <vprintfmt+0x21>
4000051b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000520:	83 ed 01             	sub    $0x1,%ebp
40000523:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
40000527:	75 f7                	jne    40000520 <.L21+0x20>
40000529:	e9 53 ff ff ff       	jmp    40000481 <vprintfmt+0x21>
4000052e:	66 90                	xchg   %ax,%ax

40000530 <.L31>:
                ch = *fmt;
40000530:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
40000534:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
40000537:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
40000539:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
4000053d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000540:	83 f9 09             	cmp    $0x9,%ecx
40000543:	77 28                	ja     4000056d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
40000545:	8b 74 24 40          	mov    0x40(%esp),%esi
40000549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
40000550:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
40000553:	8d 14 92             	lea    (%edx,%edx,4),%edx
40000556:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
4000055a:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
4000055d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000560:	83 f9 09             	cmp    $0x9,%ecx
40000563:	76 eb                	jbe    40000550 <.L31+0x20>
40000565:	89 54 24 14          	mov    %edx,0x14(%esp)
40000569:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000056d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000571:	85 f6                	test   %esi,%esi
40000573:	0f 89 68 ff ff ff    	jns    400004e1 <vprintfmt+0x81>
                width = precision, precision = -1;
40000579:	8b 44 24 14          	mov    0x14(%esp),%eax
4000057d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000584:	ff 
40000585:	89 44 24 08          	mov    %eax,0x8(%esp)
40000589:	e9 53 ff ff ff       	jmp    400004e1 <vprintfmt+0x81>

4000058e <.L35>:
            altflag = 1;
4000058e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000595:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000597:	e9 45 ff ff ff       	jmp    400004e1 <vprintfmt+0x81>

4000059c <.L34>:
            putch(ch, putdat);
4000059c:	8b 74 24 40          	mov    0x40(%esp),%esi
400005a0:	83 ec 08             	sub    $0x8,%esp
400005a3:	57                   	push   %edi
400005a4:	6a 25                	push   $0x25
400005a6:	ff d6                	call   *%esi
            break;
400005a8:	83 c4 10             	add    $0x10,%esp
400005ab:	e9 d1 fe ff ff       	jmp    40000481 <vprintfmt+0x21>

400005b0 <.L33>:
            precision = va_arg(ap, int);
400005b0:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
400005b4:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
400005b6:	8b 00                	mov    (%eax),%eax
400005b8:	89 44 24 14          	mov    %eax,0x14(%esp)
400005bc:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400005c0:	83 c0 04             	add    $0x4,%eax
400005c3:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
400005c7:	eb a4                	jmp    4000056d <.L31+0x3d>

400005c9 <.L32>:
            if (width < 0)
400005c9:	8b 4c 24 08          	mov    0x8(%esp),%ecx
400005cd:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
400005cf:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
400005d1:	85 c9                	test   %ecx,%ecx
400005d3:	0f 49 c1             	cmovns %ecx,%eax
400005d6:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
400005da:	e9 02 ff ff ff       	jmp    400004e1 <vprintfmt+0x81>

400005df <.L30>:
            putch(va_arg(ap, int), putdat);
400005df:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400005e3:	8b 74 24 40          	mov    0x40(%esp),%esi
400005e7:	83 ec 08             	sub    $0x8,%esp
400005ea:	57                   	push   %edi
400005eb:	8d 58 04             	lea    0x4(%eax),%ebx
400005ee:	8b 44 24 58          	mov    0x58(%esp),%eax
400005f2:	ff 30                	push   (%eax)
400005f4:	ff d6                	call   *%esi
            break;
400005f6:	83 c4 10             	add    $0x10,%esp
            putch(va_arg(ap, int), putdat);
400005f9:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
            break;
400005fd:	e9 7f fe ff ff       	jmp    40000481 <vprintfmt+0x21>

40000602 <.L24>:
    if (lflag >= 2)
40000602:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000607:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
4000060b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000060f:	0f 8f d8 01 00 00    	jg     400007ed <.L25+0xe0>
        return va_arg(*ap, unsigned long);
40000615:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000619:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
4000061c:	31 db                	xor    %ebx,%ebx
4000061e:	ba 0a 00 00 00       	mov    $0xa,%edx
40000623:	8b 09                	mov    (%ecx),%ecx
40000625:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
40000630:	83 ec 0c             	sub    $0xc,%esp
40000633:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
40000638:	50                   	push   %eax
40000639:	89 f0                	mov    %esi,%eax
4000063b:	ff 74 24 18          	push   0x18(%esp)
4000063f:	52                   	push   %edx
40000640:	89 fa                	mov    %edi,%edx
40000642:	53                   	push   %ebx
40000643:	51                   	push   %ecx
40000644:	e8 17 fd ff ff       	call   40000360 <printnum>
            break;
40000649:	83 c4 20             	add    $0x20,%esp
4000064c:	e9 30 fe ff ff       	jmp    40000481 <vprintfmt+0x21>

40000651 <.L26>:
            putch('0', putdat);
40000651:	8b 74 24 40          	mov    0x40(%esp),%esi
40000655:	83 ec 08             	sub    $0x8,%esp
40000658:	57                   	push   %edi
40000659:	6a 30                	push   $0x30
4000065b:	ff d6                	call   *%esi
            putch('x', putdat);
4000065d:	59                   	pop    %ecx
4000065e:	5b                   	pop    %ebx
4000065f:	57                   	push   %edi
40000660:	6a 78                	push   $0x78
            num = (unsigned long long)
40000662:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000664:	ff d6                	call   *%esi
            num = (unsigned long long)
40000666:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000066a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000066f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000671:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000674:	83 c0 04             	add    $0x4,%eax
40000677:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000067b:	eb b3                	jmp    40000630 <.L24+0x2e>

4000067d <.L22>:
    if (lflag >= 2)
4000067d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000682:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000686:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000068a:	0f 8f 6e 01 00 00    	jg     400007fe <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000690:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000694:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000697:	31 db                	xor    %ebx,%ebx
40000699:	ba 10 00 00 00       	mov    $0x10,%edx
4000069e:	8b 09                	mov    (%ecx),%ecx
400006a0:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400006a4:	eb 8a                	jmp    40000630 <.L24+0x2e>

400006a6 <.L29>:
    if (lflag >= 2)
400006a6:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006ab:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
400006af:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006b3:	0f 8f 5b 01 00 00    	jg     40000814 <.L25+0x107>
        return va_arg(*ap, long);
400006b9:	8b 00                	mov    (%eax),%eax
400006bb:	89 c3                	mov    %eax,%ebx
400006bd:	89 c1                	mov    %eax,%ecx
400006bf:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006c3:	c1 fb 1f             	sar    $0x1f,%ebx
400006c6:	83 c0 04             	add    $0x4,%eax
400006c9:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
400006cd:	85 db                	test   %ebx,%ebx
400006cf:	0f 88 68 01 00 00    	js     4000083d <.L19+0xc>
        return va_arg(*ap, unsigned long long);
400006d5:	ba 0a 00 00 00       	mov    $0xa,%edx
400006da:	e9 51 ff ff ff       	jmp    40000630 <.L24+0x2e>

400006df <.L28>:
            lflag++;
400006df:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400006e4:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
400006e6:	e9 f6 fd ff ff       	jmp    400004e1 <vprintfmt+0x81>

400006eb <.L27>:
            putch('X', putdat);
400006eb:	8b 74 24 40          	mov    0x40(%esp),%esi
400006ef:	83 ec 08             	sub    $0x8,%esp
400006f2:	57                   	push   %edi
400006f3:	6a 58                	push   $0x58
400006f5:	ff d6                	call   *%esi
            putch('X', putdat);
400006f7:	58                   	pop    %eax
400006f8:	5a                   	pop    %edx
400006f9:	57                   	push   %edi
400006fa:	6a 58                	push   $0x58
400006fc:	ff d6                	call   *%esi
            putch('X', putdat);
400006fe:	59                   	pop    %ecx
400006ff:	5b                   	pop    %ebx
40000700:	57                   	push   %edi
40000701:	6a 58                	push   $0x58
40000703:	ff d6                	call   *%esi
            break;
40000705:	83 c4 10             	add    $0x10,%esp
40000708:	e9 74 fd ff ff       	jmp    40000481 <vprintfmt+0x21>

4000070d <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
4000070d:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
40000711:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
40000715:	8b 54 24 14          	mov    0x14(%esp),%edx
40000719:	8b 74 24 40          	mov    0x40(%esp),%esi
4000071d:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
40000720:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
40000725:	89 44 24 14          	mov    %eax,0x14(%esp)
40000729:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000072d:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
4000072f:	0f 95 c0             	setne  %al
40000732:	85 c9                	test   %ecx,%ecx
40000734:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
40000737:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
4000073b:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
4000073d:	85 db                	test   %ebx,%ebx
4000073f:	0f 84 21 01 00 00    	je     40000866 <.L19+0x35>
            if (width > 0 && padc != '-')
40000745:	84 c0                	test   %al,%al
40000747:	0f 85 48 01 00 00    	jne    40000895 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
4000074d:	89 d8                	mov    %ebx,%eax
4000074f:	8d 5b 01             	lea    0x1(%ebx),%ebx
40000752:	0f be 08             	movsbl (%eax),%ecx
40000755:	89 c8                	mov    %ecx,%eax
40000757:	85 c9                	test   %ecx,%ecx
40000759:	74 64                	je     400007bf <.L25+0xb2>
4000075b:	89 74 24 40          	mov    %esi,0x40(%esp)
4000075f:	89 d6                	mov    %edx,%esi
40000761:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000765:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000769:	eb 2a                	jmp    40000795 <.L25+0x88>
4000076b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000770:	83 e8 20             	sub    $0x20,%eax
40000773:	83 f8 5e             	cmp    $0x5e,%eax
40000776:	76 2d                	jbe    400007a5 <.L25+0x98>
                    putch('?', putdat);
40000778:	83 ec 08             	sub    $0x8,%esp
4000077b:	57                   	push   %edi
4000077c:	6a 3f                	push   $0x3f
4000077e:	ff 54 24 50          	call   *0x50(%esp)
40000782:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000785:	0f be 03             	movsbl (%ebx),%eax
40000788:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000078b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000078e:	0f be c8             	movsbl %al,%ecx
40000791:	85 c9                	test   %ecx,%ecx
40000793:	74 1e                	je     400007b3 <.L25+0xa6>
40000795:	85 f6                	test   %esi,%esi
40000797:	78 05                	js     4000079e <.L25+0x91>
                                         || --precision >= 0); width--)
40000799:	83 ee 01             	sub    $0x1,%esi
4000079c:	72 15                	jb     400007b3 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000079e:	8b 14 24             	mov    (%esp),%edx
400007a1:	85 d2                	test   %edx,%edx
400007a3:	75 cb                	jne    40000770 <.L25+0x63>
                    putch(ch, putdat);
400007a5:	83 ec 08             	sub    $0x8,%esp
400007a8:	57                   	push   %edi
400007a9:	51                   	push   %ecx
400007aa:	ff 54 24 50          	call   *0x50(%esp)
400007ae:	83 c4 10             	add    $0x10,%esp
400007b1:	eb d2                	jmp    40000785 <.L25+0x78>
400007b3:	89 6c 24 08          	mov    %ebp,0x8(%esp)
400007b7:	8b 74 24 40          	mov    0x40(%esp),%esi
400007bb:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
400007bf:	8b 44 24 08          	mov    0x8(%esp),%eax
400007c3:	85 c0                	test   %eax,%eax
400007c5:	7e 19                	jle    400007e0 <.L25+0xd3>
400007c7:	89 c3                	mov    %eax,%ebx
400007c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
400007d0:	83 ec 08             	sub    $0x8,%esp
400007d3:	57                   	push   %edi
400007d4:	6a 20                	push   $0x20
400007d6:	ff d6                	call   *%esi
            for (; width > 0; width--)
400007d8:	83 c4 10             	add    $0x10,%esp
400007db:	83 eb 01             	sub    $0x1,%ebx
400007de:	75 f0                	jne    400007d0 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
400007e0:	8b 44 24 14          	mov    0x14(%esp),%eax
400007e4:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007e8:	e9 94 fc ff ff       	jmp    40000481 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
400007ed:	8b 08                	mov    (%eax),%ecx
400007ef:	8b 58 04             	mov    0x4(%eax),%ebx
400007f2:	83 c0 08             	add    $0x8,%eax
400007f5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007f9:	e9 d7 fe ff ff       	jmp    400006d5 <.L29+0x2f>
400007fe:	8b 08                	mov    (%eax),%ecx
40000800:	8b 58 04             	mov    0x4(%eax),%ebx
40000803:	83 c0 08             	add    $0x8,%eax
40000806:	ba 10 00 00 00       	mov    $0x10,%edx
4000080b:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000080f:	e9 1c fe ff ff       	jmp    40000630 <.L24+0x2e>
        return va_arg(*ap, long long);
40000814:	8b 08                	mov    (%eax),%ecx
40000816:	8b 58 04             	mov    0x4(%eax),%ebx
40000819:	83 c0 08             	add    $0x8,%eax
4000081c:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000820:	e9 a8 fe ff ff       	jmp    400006cd <.L29+0x27>

40000825 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
40000825:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
4000082a:	89 eb                	mov    %ebp,%ebx
4000082c:	e9 b0 fc ff ff       	jmp    400004e1 <vprintfmt+0x81>

40000831 <.L19>:
            padc = '-';
40000831:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000836:	89 eb                	mov    %ebp,%ebx
40000838:	e9 a4 fc ff ff       	jmp    400004e1 <vprintfmt+0x81>
4000083d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
40000841:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
40000844:	31 db                	xor    %ebx,%ebx
40000846:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
4000084a:	57                   	push   %edi
4000084b:	6a 2d                	push   $0x2d
4000084d:	ff d6                	call   *%esi
                num = -(long long) num;
4000084f:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000853:	ba 0a 00 00 00       	mov    $0xa,%edx
40000858:	f7 d9                	neg    %ecx
4000085a:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
4000085e:	83 c4 10             	add    $0x10,%esp
40000861:	e9 ca fd ff ff       	jmp    40000630 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000866:	84 c0                	test   %al,%al
40000868:	0f 85 99 00 00 00    	jne    40000907 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000086e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000872:	89 74 24 40          	mov    %esi,0x40(%esp)
40000876:	b9 28 00 00 00       	mov    $0x28,%ecx
4000087b:	89 d6                	mov    %edx,%esi
4000087d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000881:	b8 28 00 00 00       	mov    $0x28,%eax
40000886:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000088a:	8d 9b 42 e0 ff ff    	lea    -0x1fbe(%ebx),%ebx
40000890:	e9 00 ff ff ff       	jmp    40000795 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000895:	83 ec 08             	sub    $0x8,%esp
40000898:	52                   	push   %edx
40000899:	89 54 24 28          	mov    %edx,0x28(%esp)
4000089d:	ff 74 24 24          	push   0x24(%esp)
400008a1:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400008a5:	e8 26 03 00 00       	call   40000bd0 <strnlen>
400008aa:	29 44 24 18          	sub    %eax,0x18(%esp)
400008ae:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400008b2:	83 c4 10             	add    $0x10,%esp
400008b5:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400008b9:	85 c9                	test   %ecx,%ecx
400008bb:	0f 8e 99 00 00 00    	jle    4000095a <.L19+0x129>
                    putch(padc, putdat);
400008c1:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
400008c6:	89 54 24 10          	mov    %edx,0x10(%esp)
400008ca:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400008ce:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400008d2:	83 ec 08             	sub    $0x8,%esp
400008d5:	57                   	push   %edi
400008d6:	53                   	push   %ebx
400008d7:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
400008d9:	83 c4 10             	add    $0x10,%esp
400008dc:	83 ed 01             	sub    $0x1,%ebp
400008df:	75 f1                	jne    400008d2 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
400008e1:	8b 44 24 18          	mov    0x18(%esp),%eax
400008e5:	8b 54 24 10          	mov    0x10(%esp),%edx
400008e9:	89 6c 24 08          	mov    %ebp,0x8(%esp)
400008ed:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400008f1:	8d 58 01             	lea    0x1(%eax),%ebx
400008f4:	0f be 00             	movsbl (%eax),%eax
400008f7:	0f be c8             	movsbl %al,%ecx
400008fa:	85 c9                	test   %ecx,%ecx
400008fc:	0f 85 59 fe ff ff    	jne    4000075b <.L25+0x4e>
40000902:	e9 d9 fe ff ff       	jmp    400007e0 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
40000907:	83 ec 08             	sub    $0x8,%esp
4000090a:	52                   	push   %edx
4000090b:	8b 5c 24 18          	mov    0x18(%esp),%ebx
4000090f:	8d 8b 41 e0 ff ff    	lea    -0x1fbf(%ebx),%ecx
40000915:	89 54 24 28          	mov    %edx,0x28(%esp)
40000919:	51                   	push   %ecx
4000091a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
4000091e:	e8 ad 02 00 00       	call   40000bd0 <strnlen>
40000923:	29 44 24 18          	sub    %eax,0x18(%esp)
40000927:	8b 44 24 18          	mov    0x18(%esp),%eax
4000092b:	83 c4 10             	add    $0x10,%esp
4000092e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000932:	85 c0                	test   %eax,%eax
40000934:	7f 8b                	jg     400008c1 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
40000936:	b9 28 00 00 00       	mov    $0x28,%ecx
4000093b:	b8 28 00 00 00       	mov    $0x28,%eax
40000940:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000944:	89 74 24 40          	mov    %esi,0x40(%esp)
40000948:	89 d6                	mov    %edx,%esi
4000094a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000094e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000952:	83 c3 01             	add    $0x1,%ebx
40000955:	e9 3b fe ff ff       	jmp    40000795 <.L25+0x88>
4000095a:	8b 44 24 18          	mov    0x18(%esp),%eax
4000095e:	0f be 08             	movsbl (%eax),%ecx
40000961:	89 c8                	mov    %ecx,%eax
40000963:	85 c9                	test   %ecx,%ecx
40000965:	75 d9                	jne    40000940 <.L19+0x10f>
40000967:	e9 74 fe ff ff       	jmp    400007e0 <.L25+0xd3>
4000096c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000970 <printfmt>:
{
40000970:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000973:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000977:	50                   	push   %eax
40000978:	ff 74 24 1c          	push   0x1c(%esp)
4000097c:	ff 74 24 1c          	push   0x1c(%esp)
40000980:	ff 74 24 1c          	push   0x1c(%esp)
40000984:	e8 d7 fa ff ff       	call   40000460 <vprintfmt>
}
40000989:	83 c4 1c             	add    $0x1c,%esp
4000098c:	c3                   	ret
4000098d:	8d 76 00             	lea    0x0(%esi),%esi

40000990 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000990:	e8 4e 01 00 00       	call   40000ae3 <__x86.get_pc_thunk.ax>
40000995:	05 5f 36 00 00       	add    $0x365f,%eax
{
4000099a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
4000099d:	8b 54 24 20          	mov    0x20(%esp),%edx
400009a1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400009a8:	ff 
400009a9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009b0:	00 
400009b1:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
400009b5:	ff 74 24 28          	push   0x28(%esp)
400009b9:	ff 74 24 28          	push   0x28(%esp)
400009bd:	8d 80 4c c4 ff ff    	lea    -0x3bb4(%eax),%eax
400009c3:	8d 54 24 0c          	lea    0xc(%esp),%edx
400009c7:	52                   	push   %edx
400009c8:	50                   	push   %eax
400009c9:	e8 92 fa ff ff       	call   40000460 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
400009ce:	8b 44 24 14          	mov    0x14(%esp),%eax
400009d2:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
400009d5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400009d9:	83 c4 2c             	add    $0x2c,%esp
400009dc:	c3                   	ret
400009dd:	8d 76 00             	lea    0x0(%esi),%esi

400009e0 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
400009e0:	e8 fe 00 00 00       	call   40000ae3 <__x86.get_pc_thunk.ax>
400009e5:	05 0f 36 00 00       	add    $0x360f,%eax
{
400009ea:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400009ed:	8b 54 24 20          	mov    0x20(%esp),%edx
400009f1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400009f8:	ff 
400009f9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a00:	00 
40000a01:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a05:	8d 54 24 28          	lea    0x28(%esp),%edx
40000a09:	52                   	push   %edx
40000a0a:	ff 74 24 28          	push   0x28(%esp)
40000a0e:	8d 80 4c c4 ff ff    	lea    -0x3bb4(%eax),%eax
40000a14:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a18:	52                   	push   %edx
40000a19:	50                   	push   %eax
40000a1a:	e8 41 fa ff ff       	call   40000460 <vprintfmt>
    *b.buf = '\0';
40000a1f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a23:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
40000a26:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a2a:	83 c4 2c             	add    $0x2c,%esp
40000a2d:	c3                   	ret
40000a2e:	66 90                	xchg   %ax,%ax

40000a30 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a30:	e8 b2 00 00 00       	call   40000ae7 <__x86.get_pc_thunk.dx>
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

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a5a:	ff 74 24 2c          	push   0x2c(%esp)
40000a5e:	ff 74 24 2c          	push   0x2c(%esp)
40000a62:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a66:	50                   	push   %eax
40000a67:	8d 82 4c c4 ff ff    	lea    -0x3bb4(%edx),%eax
40000a6d:	50                   	push   %eax
40000a6e:	e8 ed f9 ff ff       	call   40000460 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a73:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a77:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a7a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a7e:	83 c4 2c             	add    $0x2c,%esp
40000a81:	c3                   	ret
40000a82:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000a89:	00 
40000a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000a90 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a90:	e8 52 00 00 00       	call   40000ae7 <__x86.get_pc_thunk.dx>
40000a95:	81 c2 5f 35 00 00    	add    $0x355f,%edx
{
40000a9b:	83 ec 1c             	sub    $0x1c,%esp
40000a9e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000aa2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000aa6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000aad:	00 
40000aae:	89 44 24 04          	mov    %eax,0x4(%esp)
40000ab2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000ab6:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000aba:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000abe:	50                   	push   %eax
40000abf:	ff 74 24 2c          	push   0x2c(%esp)
40000ac3:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000ac7:	50                   	push   %eax
40000ac8:	8d 82 4c c4 ff ff    	lea    -0x3bb4(%edx),%eax
40000ace:	50                   	push   %eax
40000acf:	e8 8c f9 ff ff       	call   40000460 <vprintfmt>
    *b.buf = '\0';
40000ad4:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ad8:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000adb:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000adf:	83 c4 2c             	add    $0x2c,%esp
40000ae2:	c3                   	ret

40000ae3 <__x86.get_pc_thunk.ax>:
40000ae3:	8b 04 24             	mov    (%esp),%eax
40000ae6:	c3                   	ret

40000ae7 <__x86.get_pc_thunk.dx>:
40000ae7:	8b 14 24             	mov    (%esp),%edx
40000aea:	c3                   	ret

40000aeb <__x86.get_pc_thunk.cx>:
40000aeb:	8b 0c 24             	mov    (%esp),%ecx
40000aee:	c3                   	ret
40000aef:	90                   	nop

40000af0 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000af0:	53                   	push   %ebx
static gcc_inline pid_t sys_spawn(unsigned int elf_id, unsigned int quota)
{
    int errno;
    pid_t pid;

    asm volatile ("int %2"
40000af1:	b8 01 00 00 00       	mov    $0x1,%eax
40000af6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000afa:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000afe:	cd 30                	int    $0x30
                    "a" (SYS_spawn),
                    "b" (elf_id),
                    "c" (quota)
                  : "cc", "memory");

    return errno ? -1 : pid;
40000b00:	85 c0                	test   %eax,%eax
40000b02:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000b07:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000b0a:	5b                   	pop    %ebx
40000b0b:	c3                   	ret
40000b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b10 <yield>:
}

static gcc_inline void sys_yield(void)
{
    asm volatile ("int %0"
40000b10:	b8 02 00 00 00       	mov    $0x2,%eax
40000b15:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000b17:	c3                   	ret
40000b18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b1f:	00 

40000b20 <produce>:
    return errno ? -1 : pid;
}

static gcc_inline void sys_produce(void)
{
    asm volatile ("int %0"
40000b20:	b8 0d 00 00 00       	mov    $0xd,%eax
40000b25:	cd 30                	int    $0x30

void produce(void)
{
    sys_produce();
}
40000b27:	c3                   	ret
40000b28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b2f:	00 

40000b30 <consume>:
                  : "cc", "memory");
}

static gcc_inline void sys_consume(void)
{
    asm volatile ("int %0"
40000b30:	b8 0e 00 00 00       	mov    $0xe,%eax
40000b35:	cd 30                	int    $0x30

void consume(void)
{
    sys_consume();
}
40000b37:	c3                   	ret
40000b38:	66 90                	xchg   %ax,%ax
40000b3a:	66 90                	xchg   %ax,%ax
40000b3c:	66 90                	xchg   %ax,%ax
40000b3e:	66 90                	xchg   %ax,%ax

40000b40 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000b40:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b44:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000b4a:	c3                   	ret
40000b4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000b50 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000b50:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000b54:	b8 01 00 00 00       	mov    $0x1,%eax
40000b59:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b5c:	85 c0                	test   %eax,%eax
40000b5e:	74 13                	je     40000b73 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000b60:	b9 01 00 00 00       	mov    $0x1,%ecx
40000b65:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000b68:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000b6a:	89 c8                	mov    %ecx,%eax
40000b6c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b6f:	85 c0                	test   %eax,%eax
40000b71:	75 f5                	jne    40000b68 <spinlock_acquire+0x18>
}
40000b73:	c3                   	ret
40000b74:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b7b:	00 
40000b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b80 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000b80:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000b84:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000b86:	84 c0                	test   %al,%al
40000b88:	74 05                	je     40000b8f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000b8a:	31 c0                	xor    %eax,%eax
40000b8c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000b8f:	c3                   	ret

40000b90 <spinlock_holding>:
    return *lk;
40000b90:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b94:	8b 00                	mov    (%eax),%eax
}
40000b96:	c3                   	ret
40000b97:	66 90                	xchg   %ax,%ax
40000b99:	66 90                	xchg   %ax,%ax
40000b9b:	66 90                	xchg   %ax,%ax
40000b9d:	66 90                	xchg   %ax,%ax
40000b9f:	90                   	nop

40000ba0 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000ba0:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000ba4:	31 c0                	xor    %eax,%eax
40000ba6:	80 3a 00             	cmpb   $0x0,(%edx)
40000ba9:	74 15                	je     40000bc0 <strlen+0x20>
40000bab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000bb0:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000bb3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000bb7:	75 f7                	jne    40000bb0 <strlen+0x10>
40000bb9:	c3                   	ret
40000bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000bc0:	c3                   	ret
40000bc1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bc8:	00 
40000bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000bd0 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000bd0:	8b 54 24 08          	mov    0x8(%esp),%edx
40000bd4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000bd8:	31 c0                	xor    %eax,%eax
40000bda:	85 d2                	test   %edx,%edx
40000bdc:	75 09                	jne    40000be7 <strnlen+0x17>
40000bde:	c3                   	ret
40000bdf:	90                   	nop
        n++;
40000be0:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000be3:	39 c2                	cmp    %eax,%edx
40000be5:	74 09                	je     40000bf0 <strnlen+0x20>
40000be7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000beb:	75 f3                	jne    40000be0 <strnlen+0x10>
40000bed:	c3                   	ret
40000bee:	66 90                	xchg   %ax,%ax
    return n;
}
40000bf0:	c3                   	ret
40000bf1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bf8:	00 
40000bf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c00 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000c00:	53                   	push   %ebx
40000c01:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000c05:	31 c0                	xor    %eax,%eax
{
40000c07:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000c0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000c10:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000c14:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000c17:	83 c0 01             	add    $0x1,%eax
40000c1a:	84 d2                	test   %dl,%dl
40000c1c:	75 f2                	jne    40000c10 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000c1e:	89 c8                	mov    %ecx,%eax
40000c20:	5b                   	pop    %ebx
40000c21:	c3                   	ret
40000c22:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c29:	00 
40000c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000c30 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000c30:	56                   	push   %esi
40000c31:	53                   	push   %ebx
40000c32:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000c36:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c3a:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000c3e:	85 db                	test   %ebx,%ebx
40000c40:	74 21                	je     40000c63 <strncpy+0x33>
40000c42:	01 f3                	add    %esi,%ebx
40000c44:	89 f0                	mov    %esi,%eax
40000c46:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c4d:	00 
40000c4e:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000c50:	0f b6 0a             	movzbl (%edx),%ecx
40000c53:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000c56:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000c59:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000c5c:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000c5f:	39 c3                	cmp    %eax,%ebx
40000c61:	75 ed                	jne    40000c50 <strncpy+0x20>
    }
    return ret;
}
40000c63:	89 f0                	mov    %esi,%eax
40000c65:	5b                   	pop    %ebx
40000c66:	5e                   	pop    %esi
40000c67:	c3                   	ret
40000c68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c6f:	00 

40000c70 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000c70:	56                   	push   %esi
40000c71:	53                   	push   %ebx
40000c72:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c76:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c7a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000c7e:	85 c0                	test   %eax,%eax
40000c80:	74 29                	je     40000cab <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000c82:	89 f2                	mov    %esi,%edx
40000c84:	83 e8 01             	sub    $0x1,%eax
40000c87:	74 1f                	je     40000ca8 <strlcpy+0x38>
40000c89:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000c8c:	eb 0f                	jmp    40000c9d <strlcpy+0x2d>
40000c8e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000c90:	83 c2 01             	add    $0x1,%edx
40000c93:	83 c1 01             	add    $0x1,%ecx
40000c96:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000c99:	39 da                	cmp    %ebx,%edx
40000c9b:	74 07                	je     40000ca4 <strlcpy+0x34>
40000c9d:	0f b6 01             	movzbl (%ecx),%eax
40000ca0:	84 c0                	test   %al,%al
40000ca2:	75 ec                	jne    40000c90 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000ca4:	89 d0                	mov    %edx,%eax
40000ca6:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000ca8:	c6 02 00             	movb   $0x0,(%edx)
}
40000cab:	5b                   	pop    %ebx
40000cac:	5e                   	pop    %esi
40000cad:	c3                   	ret
40000cae:	66 90                	xchg   %ax,%ax

40000cb0 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000cb0:	53                   	push   %ebx
40000cb1:	8b 54 24 08          	mov    0x8(%esp),%edx
40000cb5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000cb9:	0f b6 02             	movzbl (%edx),%eax
40000cbc:	84 c0                	test   %al,%al
40000cbe:	75 18                	jne    40000cd8 <strcmp+0x28>
40000cc0:	eb 30                	jmp    40000cf2 <strcmp+0x42>
40000cc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000cc8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000ccc:	83 c2 01             	add    $0x1,%edx
40000ccf:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000cd2:	84 c0                	test   %al,%al
40000cd4:	74 12                	je     40000ce8 <strcmp+0x38>
40000cd6:	89 d9                	mov    %ebx,%ecx
40000cd8:	0f b6 19             	movzbl (%ecx),%ebx
40000cdb:	38 c3                	cmp    %al,%bl
40000cdd:	74 e9                	je     40000cc8 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000cdf:	29 d8                	sub    %ebx,%eax
}
40000ce1:	5b                   	pop    %ebx
40000ce2:	c3                   	ret
40000ce3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000ce8:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000cec:	31 c0                	xor    %eax,%eax
40000cee:	29 d8                	sub    %ebx,%eax
}
40000cf0:	5b                   	pop    %ebx
40000cf1:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000cf2:	0f b6 19             	movzbl (%ecx),%ebx
40000cf5:	31 c0                	xor    %eax,%eax
40000cf7:	eb e6                	jmp    40000cdf <strcmp+0x2f>
40000cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000d00 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000d00:	53                   	push   %ebx
40000d01:	8b 54 24 10          	mov    0x10(%esp),%edx
40000d05:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d09:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000d0d:	85 d2                	test   %edx,%edx
40000d0f:	75 16                	jne    40000d27 <strncmp+0x27>
40000d11:	eb 2d                	jmp    40000d40 <strncmp+0x40>
40000d13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d18:	3a 19                	cmp    (%ecx),%bl
40000d1a:	75 12                	jne    40000d2e <strncmp+0x2e>
        n--, p++, q++;
40000d1c:	83 c0 01             	add    $0x1,%eax
40000d1f:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000d22:	83 ea 01             	sub    $0x1,%edx
40000d25:	74 19                	je     40000d40 <strncmp+0x40>
40000d27:	0f b6 18             	movzbl (%eax),%ebx
40000d2a:	84 db                	test   %bl,%bl
40000d2c:	75 ea                	jne    40000d18 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d2e:	0f b6 00             	movzbl (%eax),%eax
40000d31:	0f b6 11             	movzbl (%ecx),%edx
}
40000d34:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d35:	29 d0                	sub    %edx,%eax
}
40000d37:	c3                   	ret
40000d38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d3f:	00 
        return 0;
40000d40:	31 c0                	xor    %eax,%eax
}
40000d42:	5b                   	pop    %ebx
40000d43:	c3                   	ret
40000d44:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d4b:	00 
40000d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000d50 <strchr>:

char *strchr(const char *s, char c)
{
40000d50:	8b 44 24 04          	mov    0x4(%esp),%eax
40000d54:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000d59:	0f b6 10             	movzbl (%eax),%edx
40000d5c:	84 d2                	test   %dl,%dl
40000d5e:	75 13                	jne    40000d73 <strchr+0x23>
40000d60:	eb 1e                	jmp    40000d80 <strchr+0x30>
40000d62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d68:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d6c:	83 c0 01             	add    $0x1,%eax
40000d6f:	84 d2                	test   %dl,%dl
40000d71:	74 0d                	je     40000d80 <strchr+0x30>
        if (*s == c)
40000d73:	38 d1                	cmp    %dl,%cl
40000d75:	75 f1                	jne    40000d68 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000d77:	c3                   	ret
40000d78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d7f:	00 
    return 0;
40000d80:	31 c0                	xor    %eax,%eax
}
40000d82:	c3                   	ret
40000d83:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d8a:	00 
40000d8b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000d90 <strfind>:

char *strfind(const char *s, char c)
{
40000d90:	53                   	push   %ebx
40000d91:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d95:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000d99:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000d9c:	38 d3                	cmp    %dl,%bl
40000d9e:	74 1f                	je     40000dbf <strfind+0x2f>
40000da0:	89 d1                	mov    %edx,%ecx
40000da2:	84 db                	test   %bl,%bl
40000da4:	75 0e                	jne    40000db4 <strfind+0x24>
40000da6:	eb 17                	jmp    40000dbf <strfind+0x2f>
40000da8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000daf:	00 
40000db0:	84 d2                	test   %dl,%dl
40000db2:	74 0b                	je     40000dbf <strfind+0x2f>
    for (; *s; s++)
40000db4:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000db8:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000dbb:	38 ca                	cmp    %cl,%dl
40000dbd:	75 f1                	jne    40000db0 <strfind+0x20>
            break;
    return (char *) s;
}
40000dbf:	5b                   	pop    %ebx
40000dc0:	c3                   	ret
40000dc1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dc8:	00 
40000dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000dd0 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000dd0:	55                   	push   %ebp
40000dd1:	57                   	push   %edi
40000dd2:	56                   	push   %esi
40000dd3:	53                   	push   %ebx
40000dd4:	8b 54 24 14          	mov    0x14(%esp),%edx
40000dd8:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000ddc:	0f b6 02             	movzbl (%edx),%eax
40000ddf:	3c 20                	cmp    $0x20,%al
40000de1:	75 10                	jne    40000df3 <strtol+0x23>
40000de3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000de8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000dec:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000def:	3c 20                	cmp    $0x20,%al
40000df1:	74 f5                	je     40000de8 <strtol+0x18>
40000df3:	3c 09                	cmp    $0x9,%al
40000df5:	74 f1                	je     40000de8 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000df7:	3c 2b                	cmp    $0x2b,%al
40000df9:	0f 84 b1 00 00 00    	je     40000eb0 <strtol+0xe0>
    int neg = 0;
40000dff:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000e01:	3c 2d                	cmp    $0x2d,%al
40000e03:	0f 84 97 00 00 00    	je     40000ea0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000e09:	0f b6 02             	movzbl (%edx),%eax
40000e0c:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000e13:	ff 
40000e14:	75 1d                	jne    40000e33 <strtol+0x63>
40000e16:	3c 30                	cmp    $0x30,%al
40000e18:	0f 84 a2 00 00 00    	je     40000ec0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000e1e:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000e23:	19 c0                	sbb    %eax,%eax
40000e25:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000e29:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000e2e:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000e33:	31 c9                	xor    %ecx,%ecx
40000e35:	eb 1c                	jmp    40000e53 <strtol+0x83>
40000e37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e3e:	00 
40000e3f:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000e40:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000e43:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e47:	7d 2a                	jge    40000e73 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000e49:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000e4e:	83 c2 01             	add    $0x1,%edx
40000e51:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000e53:	0f be 02             	movsbl (%edx),%eax
40000e56:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000e59:	89 eb                	mov    %ebp,%ebx
40000e5b:	80 fb 09             	cmp    $0x9,%bl
40000e5e:	76 e0                	jbe    40000e40 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000e60:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000e63:	89 eb                	mov    %ebp,%ebx
40000e65:	80 fb 19             	cmp    $0x19,%bl
40000e68:	77 26                	ja     40000e90 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000e6a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000e6d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e71:	7c d6                	jl     40000e49 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000e73:	85 f6                	test   %esi,%esi
40000e75:	74 02                	je     40000e79 <strtol+0xa9>
        *endptr = (char *) s;
40000e77:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000e79:	89 c8                	mov    %ecx,%eax
}
40000e7b:	5b                   	pop    %ebx
40000e7c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000e7d:	f7 d8                	neg    %eax
40000e7f:	85 ff                	test   %edi,%edi
}
40000e81:	5f                   	pop    %edi
40000e82:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000e83:	0f 45 c8             	cmovne %eax,%ecx
}
40000e86:	89 c8                	mov    %ecx,%eax
40000e88:	c3                   	ret
40000e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000e90:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000e93:	89 eb                	mov    %ebp,%ebx
40000e95:	80 fb 19             	cmp    $0x19,%bl
40000e98:	77 d9                	ja     40000e73 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000e9a:	83 e8 37             	sub    $0x37,%eax
40000e9d:	eb a4                	jmp    40000e43 <strtol+0x73>
40000e9f:	90                   	nop
        s++, neg = 1;
40000ea0:	83 c2 01             	add    $0x1,%edx
40000ea3:	bf 01 00 00 00       	mov    $0x1,%edi
40000ea8:	e9 5c ff ff ff       	jmp    40000e09 <strtol+0x39>
40000ead:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000eb0:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000eb3:	31 ff                	xor    %edi,%edi
40000eb5:	e9 4f ff ff ff       	jmp    40000e09 <strtol+0x39>
40000eba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000ec0:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000ec4:	74 25                	je     40000eeb <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000ec6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000eca:	85 c0                	test   %eax,%eax
40000ecc:	74 0d                	je     40000edb <strtol+0x10b>
40000ece:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000ed5:	00 
40000ed6:	e9 58 ff ff ff       	jmp    40000e33 <strtol+0x63>
        s++, base = 8;
40000edb:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000ee2:	00 
40000ee3:	83 c2 01             	add    $0x1,%edx
40000ee6:	e9 48 ff ff ff       	jmp    40000e33 <strtol+0x63>
        s += 2, base = 16;
40000eeb:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000ef2:	00 
40000ef3:	83 c2 02             	add    $0x2,%edx
40000ef6:	e9 38 ff ff ff       	jmp    40000e33 <strtol+0x63>
40000efb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f00 <memset>:

void *memset(void *v, int c, size_t n)
{
40000f00:	57                   	push   %edi
40000f01:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000f05:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000f09:	85 c9                	test   %ecx,%ecx
40000f0b:	74 19                	je     40000f26 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000f0d:	89 f8                	mov    %edi,%eax
40000f0f:	09 c8                	or     %ecx,%eax
40000f11:	a8 03                	test   $0x3,%al
40000f13:	75 1b                	jne    40000f30 <memset+0x30>
        c &= 0xFF;
40000f15:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000f1a:	c1 e9 02             	shr    $0x2,%ecx
40000f1d:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000f23:	fc                   	cld
40000f24:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000f26:	89 f8                	mov    %edi,%eax
40000f28:	5f                   	pop    %edi
40000f29:	c3                   	ret
40000f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000f30:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f34:	fc                   	cld
40000f35:	f3 aa                	rep stos %al,%es:(%edi)
}
40000f37:	89 f8                	mov    %edi,%eax
40000f39:	5f                   	pop    %edi
40000f3a:	c3                   	ret
40000f3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f40 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000f40:	57                   	push   %edi
40000f41:	56                   	push   %esi
40000f42:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f46:	8b 74 24 10          	mov    0x10(%esp),%esi
40000f4a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000f4e:	39 c6                	cmp    %eax,%esi
40000f50:	73 26                	jae    40000f78 <memmove+0x38>
40000f52:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000f55:	39 d0                	cmp    %edx,%eax
40000f57:	73 1f                	jae    40000f78 <memmove+0x38>
        s += n;
        d += n;
40000f59:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f5c:	89 fe                	mov    %edi,%esi
40000f5e:	09 ce                	or     %ecx,%esi
40000f60:	09 d6                	or     %edx,%esi
40000f62:	83 e6 03             	and    $0x3,%esi
40000f65:	74 39                	je     40000fa0 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000f67:	83 ef 01             	sub    $0x1,%edi
40000f6a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000f6d:	fd                   	std
40000f6e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000f70:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000f71:	5e                   	pop    %esi
40000f72:	5f                   	pop    %edi
40000f73:	c3                   	ret
40000f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f78:	89 c2                	mov    %eax,%edx
40000f7a:	09 ca                	or     %ecx,%edx
40000f7c:	09 f2                	or     %esi,%edx
40000f7e:	83 e2 03             	and    $0x3,%edx
40000f81:	74 0d                	je     40000f90 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40000f83:	89 c7                	mov    %eax,%edi
40000f85:	fc                   	cld
40000f86:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40000f88:	5e                   	pop    %esi
40000f89:	5f                   	pop    %edi
40000f8a:	c3                   	ret
40000f8b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40000f90:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40000f93:	89 c7                	mov    %eax,%edi
40000f95:	fc                   	cld
40000f96:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000f98:	eb ee                	jmp    40000f88 <memmove+0x48>
40000f9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40000fa0:	83 ef 04             	sub    $0x4,%edi
40000fa3:	8d 72 fc             	lea    -0x4(%edx),%esi
40000fa6:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40000fa9:	fd                   	std
40000faa:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000fac:	eb c2                	jmp    40000f70 <memmove+0x30>
40000fae:	66 90                	xchg   %ax,%ax

40000fb0 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40000fb0:	eb 8e                	jmp    40000f40 <memmove>
40000fb2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fb9:	00 
40000fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000fc0 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40000fc0:	56                   	push   %esi
40000fc1:	53                   	push   %ebx
40000fc2:	8b 74 24 14          	mov    0x14(%esp),%esi
40000fc6:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fca:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
40000fce:	85 f6                	test   %esi,%esi
40000fd0:	74 2e                	je     40001000 <memcmp+0x40>
40000fd2:	01 c6                	add    %eax,%esi
40000fd4:	eb 14                	jmp    40000fea <memcmp+0x2a>
40000fd6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fdd:	00 
40000fde:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40000fe0:	83 c0 01             	add    $0x1,%eax
40000fe3:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40000fe6:	39 f0                	cmp    %esi,%eax
40000fe8:	74 16                	je     40001000 <memcmp+0x40>
        if (*s1 != *s2)
40000fea:	0f b6 08             	movzbl (%eax),%ecx
40000fed:	0f b6 1a             	movzbl (%edx),%ebx
40000ff0:	38 d9                	cmp    %bl,%cl
40000ff2:	74 ec                	je     40000fe0 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40000ff4:	0f b6 c1             	movzbl %cl,%eax
40000ff7:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40000ff9:	5b                   	pop    %ebx
40000ffa:	5e                   	pop    %esi
40000ffb:	c3                   	ret
40000ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
40001000:	31 c0                	xor    %eax,%eax
}
40001002:	5b                   	pop    %ebx
40001003:	5e                   	pop    %esi
40001004:	c3                   	ret
40001005:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000100c:	00 
4000100d:	8d 76 00             	lea    0x0(%esi),%esi

40001010 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40001010:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
40001014:	8b 54 24 0c          	mov    0xc(%esp),%edx
40001018:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
4000101a:	39 d0                	cmp    %edx,%eax
4000101c:	73 1a                	jae    40001038 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000101e:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
40001023:	eb 0a                	jmp    4000102f <memchr+0x1f>
40001025:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
40001028:	83 c0 01             	add    $0x1,%eax
4000102b:	39 c2                	cmp    %eax,%edx
4000102d:	74 09                	je     40001038 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000102f:	38 08                	cmp    %cl,(%eax)
40001031:	75 f5                	jne    40001028 <memchr+0x18>
            return (void *) s;
    return NULL;
}
40001033:	c3                   	ret
40001034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
40001038:	31 c0                	xor    %eax,%eax
}
4000103a:	c3                   	ret
4000103b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001040 <memzero>:

void *memzero(void *v, size_t n)
{
40001040:	57                   	push   %edi
40001041:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40001045:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40001049:	85 c9                	test   %ecx,%ecx
4000104b:	74 0f                	je     4000105c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
4000104d:	89 f8                	mov    %edi,%eax
4000104f:	09 c8                	or     %ecx,%eax
40001051:	83 e0 03             	and    $0x3,%eax
40001054:	75 0a                	jne    40001060 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40001056:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40001059:	fc                   	cld
4000105a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
4000105c:	89 f8                	mov    %edi,%eax
4000105e:	5f                   	pop    %edi
4000105f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001060:	31 c0                	xor    %eax,%eax
40001062:	fc                   	cld
40001063:	f3 aa                	rep stos %al,%es:(%edi)
}
40001065:	89 f8                	mov    %edi,%eax
40001067:	5f                   	pop    %edi
40001068:	c3                   	ret
40001069:	66 90                	xchg   %ax,%ax
4000106b:	66 90                	xchg   %ax,%ax
4000106d:	66 90                	xchg   %ax,%ax
4000106f:	90                   	nop

40001070 <__udivdi3>:
40001070:	f3 0f 1e fb          	endbr32
40001074:	55                   	push   %ebp
40001075:	89 e5                	mov    %esp,%ebp
40001077:	57                   	push   %edi
40001078:	56                   	push   %esi
40001079:	53                   	push   %ebx
4000107a:	83 ec 1c             	sub    $0x1c,%esp
4000107d:	8b 7d 08             	mov    0x8(%ebp),%edi
40001080:	8b 45 14             	mov    0x14(%ebp),%eax
40001083:	8b 75 0c             	mov    0xc(%ebp),%esi
40001086:	8b 5d 10             	mov    0x10(%ebp),%ebx
40001089:	89 7d e4             	mov    %edi,-0x1c(%ebp)
4000108c:	85 c0                	test   %eax,%eax
4000108e:	75 20                	jne    400010b0 <__udivdi3+0x40>
40001090:	39 de                	cmp    %ebx,%esi
40001092:	73 54                	jae    400010e8 <__udivdi3+0x78>
40001094:	89 f8                	mov    %edi,%eax
40001096:	31 ff                	xor    %edi,%edi
40001098:	89 f2                	mov    %esi,%edx
4000109a:	f7 f3                	div    %ebx
4000109c:	89 fa                	mov    %edi,%edx
4000109e:	83 c4 1c             	add    $0x1c,%esp
400010a1:	5b                   	pop    %ebx
400010a2:	5e                   	pop    %esi
400010a3:	5f                   	pop    %edi
400010a4:	5d                   	pop    %ebp
400010a5:	c3                   	ret
400010a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400010ad:	00 
400010ae:	66 90                	xchg   %ax,%ax
400010b0:	39 c6                	cmp    %eax,%esi
400010b2:	73 14                	jae    400010c8 <__udivdi3+0x58>
400010b4:	31 ff                	xor    %edi,%edi
400010b6:	31 c0                	xor    %eax,%eax
400010b8:	89 fa                	mov    %edi,%edx
400010ba:	83 c4 1c             	add    $0x1c,%esp
400010bd:	5b                   	pop    %ebx
400010be:	5e                   	pop    %esi
400010bf:	5f                   	pop    %edi
400010c0:	5d                   	pop    %ebp
400010c1:	c3                   	ret
400010c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400010c8:	0f bd f8             	bsr    %eax,%edi
400010cb:	83 f7 1f             	xor    $0x1f,%edi
400010ce:	75 48                	jne    40001118 <__udivdi3+0xa8>
400010d0:	39 f0                	cmp    %esi,%eax
400010d2:	72 07                	jb     400010db <__udivdi3+0x6b>
400010d4:	31 c0                	xor    %eax,%eax
400010d6:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
400010d9:	72 dd                	jb     400010b8 <__udivdi3+0x48>
400010db:	b8 01 00 00 00       	mov    $0x1,%eax
400010e0:	eb d6                	jmp    400010b8 <__udivdi3+0x48>
400010e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400010e8:	89 d9                	mov    %ebx,%ecx
400010ea:	85 db                	test   %ebx,%ebx
400010ec:	75 0b                	jne    400010f9 <__udivdi3+0x89>
400010ee:	b8 01 00 00 00       	mov    $0x1,%eax
400010f3:	31 d2                	xor    %edx,%edx
400010f5:	f7 f3                	div    %ebx
400010f7:	89 c1                	mov    %eax,%ecx
400010f9:	31 d2                	xor    %edx,%edx
400010fb:	89 f0                	mov    %esi,%eax
400010fd:	f7 f1                	div    %ecx
400010ff:	89 c6                	mov    %eax,%esi
40001101:	8b 45 e4             	mov    -0x1c(%ebp),%eax
40001104:	89 f7                	mov    %esi,%edi
40001106:	f7 f1                	div    %ecx
40001108:	89 fa                	mov    %edi,%edx
4000110a:	83 c4 1c             	add    $0x1c,%esp
4000110d:	5b                   	pop    %ebx
4000110e:	5e                   	pop    %esi
4000110f:	5f                   	pop    %edi
40001110:	5d                   	pop    %ebp
40001111:	c3                   	ret
40001112:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001118:	89 f9                	mov    %edi,%ecx
4000111a:	ba 20 00 00 00       	mov    $0x20,%edx
4000111f:	29 fa                	sub    %edi,%edx
40001121:	d3 e0                	shl    %cl,%eax
40001123:	89 45 e0             	mov    %eax,-0x20(%ebp)
40001126:	89 d1                	mov    %edx,%ecx
40001128:	89 d8                	mov    %ebx,%eax
4000112a:	d3 e8                	shr    %cl,%eax
4000112c:	89 c1                	mov    %eax,%ecx
4000112e:	8b 45 e0             	mov    -0x20(%ebp),%eax
40001131:	09 c1                	or     %eax,%ecx
40001133:	89 f0                	mov    %esi,%eax
40001135:	89 4d e0             	mov    %ecx,-0x20(%ebp)
40001138:	89 f9                	mov    %edi,%ecx
4000113a:	d3 e3                	shl    %cl,%ebx
4000113c:	89 d1                	mov    %edx,%ecx
4000113e:	d3 e8                	shr    %cl,%eax
40001140:	89 5d dc             	mov    %ebx,-0x24(%ebp)
40001143:	89 f9                	mov    %edi,%ecx
40001145:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
40001148:	d3 e6                	shl    %cl,%esi
4000114a:	89 d1                	mov    %edx,%ecx
4000114c:	d3 eb                	shr    %cl,%ebx
4000114e:	09 f3                	or     %esi,%ebx
40001150:	89 c6                	mov    %eax,%esi
40001152:	89 f2                	mov    %esi,%edx
40001154:	89 d8                	mov    %ebx,%eax
40001156:	f7 75 e0             	divl   -0x20(%ebp)
40001159:	89 d6                	mov    %edx,%esi
4000115b:	89 c3                	mov    %eax,%ebx
4000115d:	f7 65 dc             	mull   -0x24(%ebp)
40001160:	89 55 e0             	mov    %edx,-0x20(%ebp)
40001163:	39 d6                	cmp    %edx,%esi
40001165:	72 21                	jb     40001188 <__udivdi3+0x118>
40001167:	8b 55 e4             	mov    -0x1c(%ebp),%edx
4000116a:	89 f9                	mov    %edi,%ecx
4000116c:	d3 e2                	shl    %cl,%edx
4000116e:	39 c2                	cmp    %eax,%edx
40001170:	73 07                	jae    40001179 <__udivdi3+0x109>
40001172:	8b 55 e0             	mov    -0x20(%ebp),%edx
40001175:	39 d6                	cmp    %edx,%esi
40001177:	74 0f                	je     40001188 <__udivdi3+0x118>
40001179:	89 d8                	mov    %ebx,%eax
4000117b:	31 ff                	xor    %edi,%edi
4000117d:	e9 36 ff ff ff       	jmp    400010b8 <__udivdi3+0x48>
40001182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001188:	8d 43 ff             	lea    -0x1(%ebx),%eax
4000118b:	31 ff                	xor    %edi,%edi
4000118d:	e9 26 ff ff ff       	jmp    400010b8 <__udivdi3+0x48>
40001192:	66 90                	xchg   %ax,%ax
40001194:	66 90                	xchg   %ax,%ax
40001196:	66 90                	xchg   %ax,%ax
40001198:	66 90                	xchg   %ax,%ax
4000119a:	66 90                	xchg   %ax,%ax
4000119c:	66 90                	xchg   %ax,%ax
4000119e:	66 90                	xchg   %ax,%ax

400011a0 <__umoddi3>:
400011a0:	f3 0f 1e fb          	endbr32
400011a4:	55                   	push   %ebp
400011a5:	89 e5                	mov    %esp,%ebp
400011a7:	57                   	push   %edi
400011a8:	56                   	push   %esi
400011a9:	53                   	push   %ebx
400011aa:	83 ec 2c             	sub    $0x2c,%esp
400011ad:	8b 5d 0c             	mov    0xc(%ebp),%ebx
400011b0:	8b 45 14             	mov    0x14(%ebp),%eax
400011b3:	8b 75 08             	mov    0x8(%ebp),%esi
400011b6:	8b 7d 10             	mov    0x10(%ebp),%edi
400011b9:	89 da                	mov    %ebx,%edx
400011bb:	85 c0                	test   %eax,%eax
400011bd:	75 19                	jne    400011d8 <__umoddi3+0x38>
400011bf:	39 fb                	cmp    %edi,%ebx
400011c1:	73 5d                	jae    40001220 <__umoddi3+0x80>
400011c3:	89 f0                	mov    %esi,%eax
400011c5:	f7 f7                	div    %edi
400011c7:	89 d0                	mov    %edx,%eax
400011c9:	31 d2                	xor    %edx,%edx
400011cb:	83 c4 2c             	add    $0x2c,%esp
400011ce:	5b                   	pop    %ebx
400011cf:	5e                   	pop    %esi
400011d0:	5f                   	pop    %edi
400011d1:	5d                   	pop    %ebp
400011d2:	c3                   	ret
400011d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400011d8:	89 75 e0             	mov    %esi,-0x20(%ebp)
400011db:	39 c3                	cmp    %eax,%ebx
400011dd:	73 11                	jae    400011f0 <__umoddi3+0x50>
400011df:	89 f0                	mov    %esi,%eax
400011e1:	83 c4 2c             	add    $0x2c,%esp
400011e4:	5b                   	pop    %ebx
400011e5:	5e                   	pop    %esi
400011e6:	5f                   	pop    %edi
400011e7:	5d                   	pop    %ebp
400011e8:	c3                   	ret
400011e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400011f0:	0f bd c8             	bsr    %eax,%ecx
400011f3:	83 f1 1f             	xor    $0x1f,%ecx
400011f6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
400011f9:	75 45                	jne    40001240 <__umoddi3+0xa0>
400011fb:	39 d8                	cmp    %ebx,%eax
400011fd:	0f 82 d5 00 00 00    	jb     400012d8 <__umoddi3+0x138>
40001203:	39 fe                	cmp    %edi,%esi
40001205:	0f 83 cd 00 00 00    	jae    400012d8 <__umoddi3+0x138>
4000120b:	8b 45 e0             	mov    -0x20(%ebp),%eax
4000120e:	83 c4 2c             	add    $0x2c,%esp
40001211:	5b                   	pop    %ebx
40001212:	5e                   	pop    %esi
40001213:	5f                   	pop    %edi
40001214:	5d                   	pop    %ebp
40001215:	c3                   	ret
40001216:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000121d:	00 
4000121e:	66 90                	xchg   %ax,%ax
40001220:	89 f9                	mov    %edi,%ecx
40001222:	85 ff                	test   %edi,%edi
40001224:	75 0b                	jne    40001231 <__umoddi3+0x91>
40001226:	b8 01 00 00 00       	mov    $0x1,%eax
4000122b:	31 d2                	xor    %edx,%edx
4000122d:	f7 f7                	div    %edi
4000122f:	89 c1                	mov    %eax,%ecx
40001231:	89 d8                	mov    %ebx,%eax
40001233:	31 d2                	xor    %edx,%edx
40001235:	f7 f1                	div    %ecx
40001237:	89 f0                	mov    %esi,%eax
40001239:	f7 f1                	div    %ecx
4000123b:	eb 8a                	jmp    400011c7 <__umoddi3+0x27>
4000123d:	8d 76 00             	lea    0x0(%esi),%esi
40001240:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
40001243:	ba 20 00 00 00       	mov    $0x20,%edx
40001248:	29 ca                	sub    %ecx,%edx
4000124a:	d3 e0                	shl    %cl,%eax
4000124c:	89 45 dc             	mov    %eax,-0x24(%ebp)
4000124f:	89 d1                	mov    %edx,%ecx
40001251:	89 f8                	mov    %edi,%eax
40001253:	d3 e8                	shr    %cl,%eax
40001255:	89 55 e0             	mov    %edx,-0x20(%ebp)
40001258:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
4000125c:	89 c2                	mov    %eax,%edx
4000125e:	8b 45 dc             	mov    -0x24(%ebp),%eax
40001261:	d3 e7                	shl    %cl,%edi
40001263:	09 c2                	or     %eax,%edx
40001265:	8b 45 e0             	mov    -0x20(%ebp),%eax
40001268:	89 7d d8             	mov    %edi,-0x28(%ebp)
4000126b:	89 f7                	mov    %esi,%edi
4000126d:	89 55 dc             	mov    %edx,-0x24(%ebp)
40001270:	89 da                	mov    %ebx,%edx
40001272:	89 c1                	mov    %eax,%ecx
40001274:	d3 ea                	shr    %cl,%edx
40001276:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
4000127a:	d3 e3                	shl    %cl,%ebx
4000127c:	89 c1                	mov    %eax,%ecx
4000127e:	d3 ef                	shr    %cl,%edi
40001280:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
40001284:	89 f8                	mov    %edi,%eax
40001286:	d3 e6                	shl    %cl,%esi
40001288:	09 d8                	or     %ebx,%eax
4000128a:	f7 75 dc             	divl   -0x24(%ebp)
4000128d:	89 d3                	mov    %edx,%ebx
4000128f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
40001292:	89 f7                	mov    %esi,%edi
40001294:	f7 65 d8             	mull   -0x28(%ebp)
40001297:	89 c6                	mov    %eax,%esi
40001299:	89 d1                	mov    %edx,%ecx
4000129b:	39 d3                	cmp    %edx,%ebx
4000129d:	72 06                	jb     400012a5 <__umoddi3+0x105>
4000129f:	75 0e                	jne    400012af <__umoddi3+0x10f>
400012a1:	39 c7                	cmp    %eax,%edi
400012a3:	73 0a                	jae    400012af <__umoddi3+0x10f>
400012a5:	2b 45 d8             	sub    -0x28(%ebp),%eax
400012a8:	1b 55 dc             	sbb    -0x24(%ebp),%edx
400012ab:	89 d1                	mov    %edx,%ecx
400012ad:	89 c6                	mov    %eax,%esi
400012af:	8b 45 d4             	mov    -0x2c(%ebp),%eax
400012b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
400012b5:	29 f0                	sub    %esi,%eax
400012b7:	19 cb                	sbb    %ecx,%ebx
400012b9:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
400012bd:	89 da                	mov    %ebx,%edx
400012bf:	d3 e2                	shl    %cl,%edx
400012c1:	89 f9                	mov    %edi,%ecx
400012c3:	d3 e8                	shr    %cl,%eax
400012c5:	d3 eb                	shr    %cl,%ebx
400012c7:	09 d0                	or     %edx,%eax
400012c9:	89 da                	mov    %ebx,%edx
400012cb:	83 c4 2c             	add    $0x2c,%esp
400012ce:	5b                   	pop    %ebx
400012cf:	5e                   	pop    %esi
400012d0:	5f                   	pop    %edi
400012d1:	5d                   	pop    %ebp
400012d2:	c3                   	ret
400012d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400012d8:	89 da                	mov    %ebx,%edx
400012da:	29 fe                	sub    %edi,%esi
400012dc:	19 c2                	sbb    %eax,%edx
400012de:	89 75 e0             	mov    %esi,-0x20(%ebp)
400012e1:	e9 25 ff ff ff       	jmp    4000120b <__umoddi3+0x6b>
