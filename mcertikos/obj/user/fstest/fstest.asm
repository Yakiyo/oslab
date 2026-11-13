
obj/user/fstest/fstest:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:

    printf("=====bigdir ok=====\n\n");
}

int main(int argc, char *argv[])
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
40000007:	ff 71 fc             	push   -0x4(%ecx)
4000000a:	55                   	push   %ebp
4000000b:	89 e5                	mov    %esp,%ebp
4000000d:	57                   	push   %edi
4000000e:	56                   	push   %esi
4000000f:	e8 97 2b 00 00       	call   40002bab <__x86.get_pc_thunk.si>
40000014:	81 c6 e0 6f 00 00    	add    $0x6fe0,%esi
4000001a:	53                   	push   %ebx
4000001b:	51                   	push   %ecx
4000001c:	83 ec 14             	sub    $0x14,%esp
    printf("*******usertests starting*******\n\n");
4000001f:	8d 86 74 d0 ff ff    	lea    -0x2f8c(%esi),%eax
40000025:	89 f3                	mov    %esi,%ebx
static gcc_inline int sys_open(char *path, int omode)
{
    int errno;
    int fd;

    asm volatile ("int %2"
40000027:	8d be 67 ca ff ff    	lea    -0x3599(%esi),%edi
4000002d:	50                   	push   %eax
4000002e:	e8 1d 03 00 00       	call   40000350 <printf>

    printf("=====test file usertests.ran does not exists=====\n");
40000033:	8d 86 98 d0 ff ff    	lea    -0x2f68(%esi),%eax
40000039:	89 04 24             	mov    %eax,(%esp)
4000003c:	e8 0f 03 00 00       	call   40000350 <printf>
40000041:	b8 03 00 00 00       	mov    $0x3,%eax
40000046:	31 c9                	xor    %ecx,%ecx
40000048:	89 fb                	mov    %edi,%ebx
4000004a:	cd 30                	int    $0x30

    if (open("usertests.ran", O_RDONLY) >= 0) {
4000004c:	83 c4 10             	add    $0x10,%esp
4000004f:	85 db                	test   %ebx,%ebx
40000051:	78 08                	js     4000005b <main+0x5b>
40000053:	85 c0                	test   %eax,%eax
40000055:	0f 84 91 00 00 00    	je     400000ec <main+0xec>
        printf("already ran user tests (file usertests.ran exists) "
               "-- recreate certikos_disk.img\n");
        exit(1);
    }
    printf("=====test file usertests.ran does not exists: ok\n\n");
4000005b:	83 ec 0c             	sub    $0xc,%esp
4000005e:	8d 86 20 d1 ff ff    	lea    -0x2ee0(%esi),%eax
40000064:	89 f3                	mov    %esi,%ebx
40000066:	50                   	push   %eax
40000067:	e8 e4 02 00 00       	call   40000350 <printf>
4000006c:	b8 03 00 00 00       	mov    $0x3,%eax
40000071:	b9 00 02 00 00       	mov    $0x200,%ecx
40000076:	89 fb                	mov    %edi,%ebx
40000078:	cd 30                	int    $0x30
                    "a" (SYS_open),
                    "b" (path),
                    "c" (omode)
                  : "cc", "memory");

    return errno ? -1 : fd;
4000007a:	83 c4 10             	add    $0x10,%esp
4000007d:	85 c0                	test   %eax,%eax
4000007f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000084:	0f 45 d8             	cmovne %eax,%ebx
    asm volatile ("int %2"
40000087:	b8 04 00 00 00       	mov    $0x4,%eax
4000008c:	cd 30                	int    $0x30
    close(open("usertests.ran", O_CREATE));

    smallfile();
4000008e:	e8 ed 0f 00 00       	call   40001080 <smallfile>
    linktest();
    unlinkread();
    dirfile();
    iref();
    bigdir();  // slow
    printf("*******end of tests*******\n");
40000093:	89 f3                	mov    %esi,%ebx
    bigfile1();
40000095:	e8 16 12 00 00       	call   400012b0 <bigfile1>
    createtest();
4000009a:	e8 21 14 00 00       	call   400014c0 <createtest>
    rmdot();
4000009f:	e8 fc 14 00 00       	call   400015a0 <rmdot>
    fourteen();
400000a4:	e8 87 16 00 00       	call   40001730 <fourteen>
    bigfile2();
400000a9:	e8 02 18 00 00       	call   400018b0 <bigfile2>
    subdir();
400000ae:	e8 5d 1a 00 00       	call   40001b10 <subdir>
    linktest();
400000b3:	e8 a8 21 00 00       	call   40002260 <linktest>
    unlinkread();
400000b8:	e8 13 24 00 00       	call   400024d0 <unlinkread>
    dirfile();
400000bd:	e8 0e 26 00 00       	call   400026d0 <dirfile>
    iref();
400000c2:	e8 39 28 00 00       	call   40002900 <iref>
    bigdir();  // slow
400000c7:	e8 74 29 00 00       	call   40002a40 <bigdir>
    printf("*******end of tests*******\n");
400000cc:	83 ec 0c             	sub    $0xc,%esp
400000cf:	8d 86 75 ca ff ff    	lea    -0x358b(%esi),%eax
400000d5:	50                   	push   %eax
400000d6:	e8 75 02 00 00       	call   40000350 <printf>
    return 0;
400000db:	83 c4 10             	add    $0x10,%esp
400000de:	31 c0                	xor    %eax,%eax
}
400000e0:	8d 65 f0             	lea    -0x10(%ebp),%esp
400000e3:	59                   	pop    %ecx
400000e4:	5b                   	pop    %ebx
400000e5:	5e                   	pop    %esi
400000e6:	5f                   	pop    %edi
400000e7:	5d                   	pop    %ebp
400000e8:	8d 61 fc             	lea    -0x4(%ecx),%esp
400000eb:	c3                   	ret
        printf("already ran user tests (file usertests.ran exists) "
400000ec:	83 ec 0c             	sub    $0xc,%esp
400000ef:	8d 86 cc d0 ff ff    	lea    -0x2f34(%esi),%eax
400000f5:	89 f3                	mov    %esi,%ebx
400000f7:	50                   	push   %eax
400000f8:	e8 53 02 00 00       	call   40000350 <printf>
        exit(1);
400000fd:	83 c4 10             	add    $0x10,%esp
40000100:	b8 01 00 00 00       	mov    $0x1,%eax
40000105:	eb d9                	jmp    400000e0 <main+0xe0>

40000107 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
40000107:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
4000010d:	75 04                	jne    40000113 <args_exist>

4000010f <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
4000010f:	6a 00                	push   $0x0
	pushl	$0
40000111:	6a 00                	push   $0x0

40000113 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
40000113:	e8 e8 fe ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
40000118:	50                   	push   %eax
	/* Give the CPU to another process once main returns. */
	call	yield
40000119:	e8 02 0a 00 00       	call   40000b20 <yield>

4000011e <spin>:
spin:
	jmp	spin
4000011e:	eb fe                	jmp    4000011e <spin>

40000120 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
40000120:	53                   	push   %ebx
40000121:	e8 c1 00 00 00       	call   400001e7 <__x86.get_pc_thunk.bx>
40000126:	81 c3 ce 6e 00 00    	add    $0x6ece,%ebx
4000012c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
4000012f:	ff 74 24 18          	push   0x18(%esp)
40000133:	ff 74 24 18          	push   0x18(%esp)
40000137:	8d 83 0c c0 ff ff    	lea    -0x3ff4(%ebx),%eax
4000013d:	50                   	push   %eax
4000013e:	e8 0d 02 00 00       	call   40000350 <printf>
    vcprintf(fmt, ap);
40000143:	58                   	pop    %eax
40000144:	5a                   	pop    %edx
40000145:	8d 44 24 24          	lea    0x24(%esp),%eax
40000149:	50                   	push   %eax
4000014a:	ff 74 24 24          	push   0x24(%esp)
4000014e:	e8 9d 01 00 00       	call   400002f0 <vcprintf>
    va_end(ap);
}
40000153:	83 c4 18             	add    $0x18,%esp
40000156:	5b                   	pop    %ebx
40000157:	c3                   	ret
40000158:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000015f:	00 

40000160 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000160:	53                   	push   %ebx
40000161:	e8 81 00 00 00       	call   400001e7 <__x86.get_pc_thunk.bx>
40000166:	81 c3 8e 6e 00 00    	add    $0x6e8e,%ebx
4000016c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
4000016f:	ff 74 24 18          	push   0x18(%esp)
40000173:	ff 74 24 18          	push   0x18(%esp)
40000177:	8d 83 18 c0 ff ff    	lea    -0x3fe8(%ebx),%eax
4000017d:	50                   	push   %eax
4000017e:	e8 cd 01 00 00       	call   40000350 <printf>
    vcprintf(fmt, ap);
40000183:	58                   	pop    %eax
40000184:	5a                   	pop    %edx
40000185:	8d 44 24 24          	lea    0x24(%esp),%eax
40000189:	50                   	push   %eax
4000018a:	ff 74 24 24          	push   0x24(%esp)
4000018e:	e8 5d 01 00 00       	call   400002f0 <vcprintf>
    va_end(ap);
}
40000193:	83 c4 18             	add    $0x18,%esp
40000196:	5b                   	pop    %ebx
40000197:	c3                   	ret
40000198:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000019f:	00 

400001a0 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
400001a0:	53                   	push   %ebx
400001a1:	e8 41 00 00 00       	call   400001e7 <__x86.get_pc_thunk.bx>
400001a6:	81 c3 4e 6e 00 00    	add    $0x6e4e,%ebx
400001ac:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
400001af:	ff 74 24 18          	push   0x18(%esp)
400001b3:	ff 74 24 18          	push   0x18(%esp)
400001b7:	8d 83 24 c0 ff ff    	lea    -0x3fdc(%ebx),%eax
400001bd:	50                   	push   %eax
400001be:	e8 8d 01 00 00       	call   40000350 <printf>
    vcprintf(fmt, ap);
400001c3:	58                   	pop    %eax
400001c4:	5a                   	pop    %edx
400001c5:	8d 44 24 24          	lea    0x24(%esp),%eax
400001c9:	50                   	push   %eax
400001ca:	ff 74 24 24          	push   0x24(%esp)
400001ce:	e8 1d 01 00 00       	call   400002f0 <vcprintf>
400001d3:	83 c4 10             	add    $0x10,%esp
400001d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001dd:	00 
400001de:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
400001e0:	e8 3b 09 00 00       	call   40000b20 <yield>
    while (1)
400001e5:	eb f9                	jmp    400001e0 <panic+0x40>

400001e7 <__x86.get_pc_thunk.bx>:
400001e7:	8b 1c 24             	mov    (%esp),%ebx
400001ea:	c3                   	ret
400001eb:	66 90                	xchg   %ax,%ax
400001ed:	66 90                	xchg   %ax,%ax
400001ef:	90                   	nop

400001f0 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
400001f0:	55                   	push   %ebp
400001f1:	57                   	push   %edi
400001f2:	56                   	push   %esi
400001f3:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
400001f4:	8b 44 24 14          	mov    0x14(%esp),%eax
400001f8:	0f b6 00             	movzbl (%eax),%eax
400001fb:	3c 2b                	cmp    $0x2b,%al
400001fd:	0f 84 8d 00 00 00    	je     40000290 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
40000203:	3c 2d                	cmp    $0x2d,%al
40000205:	74 59                	je     40000260 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000207:	8d 50 d0             	lea    -0x30(%eax),%edx
4000020a:	80 fa 09             	cmp    $0x9,%dl
4000020d:	77 71                	ja     40000280 <atoi+0x90>
    int negative = 0;
4000020f:	31 ff                	xor    %edi,%edi
    int loc = 0;
40000211:	31 f6                	xor    %esi,%esi
        loc++;
40000213:	89 f2                	mov    %esi,%edx
    int acc = 0;
40000215:	31 c9                	xor    %ecx,%ecx
40000217:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000021e:	00 
4000021f:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
40000220:	83 e8 30             	sub    $0x30,%eax
40000223:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
40000226:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
40000229:	0f be c0             	movsbl %al,%eax
4000022c:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000022f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000233:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
40000237:	8d 68 d0             	lea    -0x30(%eax),%ebp
4000023a:	89 eb                	mov    %ebp,%ebx
4000023c:	80 fb 09             	cmp    $0x9,%bl
4000023f:	76 df                	jbe    40000220 <atoi+0x30>
    }
    if (numstart == loc) {
40000241:	39 f2                	cmp    %esi,%edx
40000243:	74 3b                	je     40000280 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
40000245:	89 c8                	mov    %ecx,%eax
40000247:	f7 d8                	neg    %eax
40000249:	85 ff                	test   %edi,%edi
4000024b:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
4000024e:	8b 44 24 18          	mov    0x18(%esp),%eax
40000252:	89 08                	mov    %ecx,(%eax)
    return loc;
}
40000254:	89 d0                	mov    %edx,%eax
40000256:	5b                   	pop    %ebx
40000257:	5e                   	pop    %esi
40000258:	5f                   	pop    %edi
40000259:	5d                   	pop    %ebp
4000025a:	c3                   	ret
4000025b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000260:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
40000264:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000269:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000026e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000272:	8d 50 d0             	lea    -0x30(%eax),%edx
40000275:	80 fa 09             	cmp    $0x9,%dl
40000278:	76 99                	jbe    40000213 <atoi+0x23>
4000027a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000280:	31 d2                	xor    %edx,%edx
}
40000282:	5b                   	pop    %ebx
40000283:	89 d0                	mov    %edx,%eax
40000285:	5e                   	pop    %esi
40000286:	5f                   	pop    %edi
40000287:	5d                   	pop    %ebp
40000288:	c3                   	ret
40000289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000290:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000294:	31 ff                	xor    %edi,%edi
        loc++;
40000296:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000029b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000029f:	8d 50 d0             	lea    -0x30(%eax),%edx
400002a2:	80 fa 09             	cmp    $0x9,%dl
400002a5:	0f 86 68 ff ff ff    	jbe    40000213 <atoi+0x23>
        return 0;
400002ab:	31 d2                	xor    %edx,%edx
400002ad:	eb d3                	jmp    40000282 <atoi+0x92>
400002af:	90                   	nop

400002b0 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
400002b0:	53                   	push   %ebx
400002b1:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
400002b5:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
400002ba:	8b 02                	mov    (%edx),%eax
400002bc:	8d 48 01             	lea    0x1(%eax),%ecx
400002bf:	89 0a                	mov    %ecx,(%edx)
400002c1:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
400002c5:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
400002cb:	75 14                	jne    400002e1 <putch+0x31>
        b->buf[b->idx] = 0;
400002cd:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
400002d4:	8d 5a 08             	lea    0x8(%edx),%ebx
    asm volatile ("int %0"
400002d7:	31 c0                	xor    %eax,%eax
400002d9:	cd 30                	int    $0x30
        b->idx = 0;
400002db:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
400002e1:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
400002e5:	5b                   	pop    %ebx
400002e6:	c3                   	ret
400002e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400002ee:	00 
400002ef:	90                   	nop

400002f0 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
400002f0:	53                   	push   %ebx
400002f1:	e8 f1 fe ff ff       	call   400001e7 <__x86.get_pc_thunk.bx>
400002f6:	81 c3 fe 6c 00 00    	add    $0x6cfe,%ebx
400002fc:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
40000302:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000309:	00 
    b.cnt = 0;
4000030a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000311:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
40000312:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000319:	ff b4 24 24 02 00 00 	push   0x224(%esp)
40000320:	8d 44 24 10          	lea    0x10(%esp),%eax
40000324:	50                   	push   %eax
40000325:	8d 83 bc 92 ff ff    	lea    -0x6d44(%ebx),%eax
4000032b:	50                   	push   %eax
4000032c:	e8 3f 01 00 00       	call   40000470 <vprintfmt>

    b.buf[b.idx] = 0;
40000331:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000335:	8d 5c 24 20          	lea    0x20(%esp),%ebx
40000339:	31 c0                	xor    %eax,%eax
4000033b:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
40000340:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
40000342:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000346:	81 c4 28 02 00 00    	add    $0x228,%esp
4000034c:	5b                   	pop    %ebx
4000034d:	c3                   	ret
4000034e:	66 90                	xchg   %ax,%ax

40000350 <printf>:

int printf(const char *fmt, ...)
{
40000350:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
40000353:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000357:	50                   	push   %eax
40000358:	ff 74 24 1c          	push   0x1c(%esp)
4000035c:	e8 8f ff ff ff       	call   400002f0 <vcprintf>
    va_end(ap);

    return cnt;
}
40000361:	83 c4 1c             	add    $0x1c,%esp
40000364:	c3                   	ret
40000365:	66 90                	xchg   %ax,%ax
40000367:	66 90                	xchg   %ax,%ax
40000369:	66 90                	xchg   %ax,%ax
4000036b:	66 90                	xchg   %ax,%ax
4000036d:	66 90                	xchg   %ax,%ax
4000036f:	90                   	nop

40000370 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000370:	e8 86 07 00 00       	call   40000afb <__x86.get_pc_thunk.cx>
40000375:	81 c1 7f 6c 00 00    	add    $0x6c7f,%ecx
{
4000037b:	55                   	push   %ebp
4000037c:	57                   	push   %edi
4000037d:	89 d7                	mov    %edx,%edi
4000037f:	56                   	push   %esi
40000380:	89 c6                	mov    %eax,%esi
40000382:	53                   	push   %ebx
40000383:	83 ec 2c             	sub    $0x2c,%esp
40000386:	8b 44 24 40          	mov    0x40(%esp),%eax
4000038a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000038e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000392:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000399:	00 
{
4000039a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000039e:	89 44 24 08          	mov    %eax,0x8(%esp)
400003a2:	8b 44 24 48          	mov    0x48(%esp),%eax
400003a6:	89 54 24 0c          	mov    %edx,0xc(%esp)
400003aa:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
400003ae:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400003b2:	39 44 24 08          	cmp    %eax,0x8(%esp)
400003b6:	89 44 24 10          	mov    %eax,0x10(%esp)
400003ba:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
400003be:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
400003c1:	73 55                	jae    40000418 <printnum+0xa8>
        while (--width > 0)
400003c3:	83 fa 01             	cmp    $0x1,%edx
400003c6:	7e 17                	jle    400003df <printnum+0x6f>
400003c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400003cf:	00 
            putch(padc, putdat);
400003d0:	83 ec 08             	sub    $0x8,%esp
400003d3:	57                   	push   %edi
400003d4:	55                   	push   %ebp
400003d5:	ff d6                	call   *%esi
        while (--width > 0)
400003d7:	83 c4 10             	add    $0x10,%esp
400003da:	83 eb 01             	sub    $0x1,%ebx
400003dd:	75 f1                	jne    400003d0 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
400003df:	89 7c 24 44          	mov    %edi,0x44(%esp)
400003e3:	ff 74 24 14          	push   0x14(%esp)
400003e7:	ff 74 24 14          	push   0x14(%esp)
400003eb:	ff 74 24 14          	push   0x14(%esp)
400003ef:	ff 74 24 14          	push   0x14(%esp)
400003f3:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
400003f7:	e8 f4 28 00 00       	call   40002cf0 <__umoddi3>
400003fc:	0f be 84 03 30 c0 ff 	movsbl -0x3fd0(%ebx,%eax,1),%eax
40000403:	ff 
40000404:	89 44 24 50          	mov    %eax,0x50(%esp)
}
40000408:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
4000040b:	89 f0                	mov    %esi,%eax
}
4000040d:	5b                   	pop    %ebx
4000040e:	5e                   	pop    %esi
4000040f:	5f                   	pop    %edi
40000410:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
40000411:	ff e0                	jmp    *%eax
40000413:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
40000418:	83 ec 0c             	sub    $0xc,%esp
4000041b:	55                   	push   %ebp
4000041c:	53                   	push   %ebx
4000041d:	50                   	push   %eax
4000041e:	83 ec 08             	sub    $0x8,%esp
40000421:	ff 74 24 34          	push   0x34(%esp)
40000425:	ff 74 24 34          	push   0x34(%esp)
40000429:	ff 74 24 34          	push   0x34(%esp)
4000042d:	ff 74 24 34          	push   0x34(%esp)
40000431:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
40000435:	e8 86 27 00 00       	call   40002bc0 <__udivdi3>
4000043a:	83 c4 18             	add    $0x18,%esp
4000043d:	52                   	push   %edx
4000043e:	89 fa                	mov    %edi,%edx
40000440:	50                   	push   %eax
40000441:	89 f0                	mov    %esi,%eax
40000443:	e8 28 ff ff ff       	call   40000370 <printnum>
40000448:	83 c4 20             	add    $0x20,%esp
4000044b:	eb 92                	jmp    400003df <printnum+0x6f>
4000044d:	8d 76 00             	lea    0x0(%esi),%esi

40000450 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
40000450:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
40000454:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
40000458:	8b 10                	mov    (%eax),%edx
4000045a:	3b 50 04             	cmp    0x4(%eax),%edx
4000045d:	73 0b                	jae    4000046a <sprintputch+0x1a>
        *b->buf++ = ch;
4000045f:	8d 4a 01             	lea    0x1(%edx),%ecx
40000462:	89 08                	mov    %ecx,(%eax)
40000464:	8b 44 24 04          	mov    0x4(%esp),%eax
40000468:	88 02                	mov    %al,(%edx)
}
4000046a:	c3                   	ret
4000046b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000470 <vprintfmt>:
{
40000470:	e8 7e 06 00 00       	call   40000af3 <__x86.get_pc_thunk.ax>
40000475:	05 7f 6b 00 00       	add    $0x6b7f,%eax
4000047a:	55                   	push   %ebp
4000047b:	57                   	push   %edi
4000047c:	56                   	push   %esi
4000047d:	53                   	push   %ebx
4000047e:	83 ec 2c             	sub    $0x2c,%esp
40000481:	8b 74 24 40          	mov    0x40(%esp),%esi
40000485:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000489:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000048d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000491:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000495:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000498:	83 f8 25             	cmp    $0x25,%eax
4000049b:	75 19                	jne    400004b6 <vprintfmt+0x46>
4000049d:	eb 29                	jmp    400004c8 <vprintfmt+0x58>
4000049f:	90                   	nop
            putch(ch, putdat);
400004a0:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
400004a3:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
400004a6:	57                   	push   %edi
400004a7:	50                   	push   %eax
400004a8:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
400004aa:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
400004ae:	83 c4 10             	add    $0x10,%esp
400004b1:	83 f8 25             	cmp    $0x25,%eax
400004b4:	74 12                	je     400004c8 <vprintfmt+0x58>
            if (ch == '\0')
400004b6:	85 c0                	test   %eax,%eax
400004b8:	75 e6                	jne    400004a0 <vprintfmt+0x30>
}
400004ba:	83 c4 2c             	add    $0x2c,%esp
400004bd:	5b                   	pop    %ebx
400004be:	5e                   	pop    %esi
400004bf:	5f                   	pop    %edi
400004c0:	5d                   	pop    %ebp
400004c1:	c3                   	ret
400004c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
400004c8:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
400004cd:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
400004d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
400004d9:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400004e0:	ff 
        lflag = 0;
400004e1:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
400004e8:	00 
400004e9:	89 54 24 14          	mov    %edx,0x14(%esp)
400004ed:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400004f1:	0f b6 0b             	movzbl (%ebx),%ecx
400004f4:	8d 6b 01             	lea    0x1(%ebx),%ebp
400004f7:	8d 41 dd             	lea    -0x23(%ecx),%eax
400004fa:	3c 55                	cmp    $0x55,%al
400004fc:	77 12                	ja     40000510 <.L21>
400004fe:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000502:	0f b6 c0             	movzbl %al,%eax
40000505:	8b b4 82 a8 ca ff ff 	mov    -0x3558(%edx,%eax,4),%esi
4000050c:	01 d6                	add    %edx,%esi
4000050e:	ff e6                	jmp    *%esi

40000510 <.L21>:
            putch('%', putdat);
40000510:	8b 74 24 40          	mov    0x40(%esp),%esi
40000514:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
40000517:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
40000519:	57                   	push   %edi
4000051a:	6a 25                	push   $0x25
4000051c:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
4000051e:	83 c4 10             	add    $0x10,%esp
40000521:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
40000525:	0f 84 66 ff ff ff    	je     40000491 <vprintfmt+0x21>
4000052b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000530:	83 ed 01             	sub    $0x1,%ebp
40000533:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
40000537:	75 f7                	jne    40000530 <.L21+0x20>
40000539:	e9 53 ff ff ff       	jmp    40000491 <vprintfmt+0x21>
4000053e:	66 90                	xchg   %ax,%ax

40000540 <.L31>:
                ch = *fmt;
40000540:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
40000544:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
40000547:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
40000549:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
4000054d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000550:	83 f9 09             	cmp    $0x9,%ecx
40000553:	77 28                	ja     4000057d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
40000555:	8b 74 24 40          	mov    0x40(%esp),%esi
40000559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
40000560:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
40000563:	8d 14 92             	lea    (%edx,%edx,4),%edx
40000566:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
4000056a:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
4000056d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000570:	83 f9 09             	cmp    $0x9,%ecx
40000573:	76 eb                	jbe    40000560 <.L31+0x20>
40000575:	89 54 24 14          	mov    %edx,0x14(%esp)
40000579:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000057d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000581:	85 f6                	test   %esi,%esi
40000583:	0f 89 68 ff ff ff    	jns    400004f1 <vprintfmt+0x81>
                width = precision, precision = -1;
40000589:	8b 44 24 14          	mov    0x14(%esp),%eax
4000058d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000594:	ff 
40000595:	89 44 24 08          	mov    %eax,0x8(%esp)
40000599:	e9 53 ff ff ff       	jmp    400004f1 <vprintfmt+0x81>

4000059e <.L35>:
            altflag = 1;
4000059e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400005a5:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
400005a7:	e9 45 ff ff ff       	jmp    400004f1 <vprintfmt+0x81>

400005ac <.L34>:
            putch(ch, putdat);
400005ac:	8b 74 24 40          	mov    0x40(%esp),%esi
400005b0:	83 ec 08             	sub    $0x8,%esp
400005b3:	57                   	push   %edi
400005b4:	6a 25                	push   $0x25
400005b6:	ff d6                	call   *%esi
            break;
400005b8:	83 c4 10             	add    $0x10,%esp
400005bb:	e9 d1 fe ff ff       	jmp    40000491 <vprintfmt+0x21>

400005c0 <.L33>:
            precision = va_arg(ap, int);
400005c0:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
400005c4:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
400005c6:	8b 00                	mov    (%eax),%eax
400005c8:	89 44 24 14          	mov    %eax,0x14(%esp)
400005cc:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400005d0:	83 c0 04             	add    $0x4,%eax
400005d3:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
400005d7:	eb a4                	jmp    4000057d <.L31+0x3d>

400005d9 <.L32>:
            if (width < 0)
400005d9:	8b 4c 24 08          	mov    0x8(%esp),%ecx
400005dd:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
400005df:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
400005e1:	85 c9                	test   %ecx,%ecx
400005e3:	0f 49 c1             	cmovns %ecx,%eax
400005e6:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
400005ea:	e9 02 ff ff ff       	jmp    400004f1 <vprintfmt+0x81>

400005ef <.L30>:
            putch(va_arg(ap, int), putdat);
400005ef:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400005f3:	8b 74 24 40          	mov    0x40(%esp),%esi
400005f7:	83 ec 08             	sub    $0x8,%esp
400005fa:	57                   	push   %edi
400005fb:	8d 58 04             	lea    0x4(%eax),%ebx
400005fe:	8b 44 24 58          	mov    0x58(%esp),%eax
40000602:	ff 30                	push   (%eax)
40000604:	ff d6                	call   *%esi
            break;
40000606:	83 c4 10             	add    $0x10,%esp
            putch(va_arg(ap, int), putdat);
40000609:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
            break;
4000060d:	e9 7f fe ff ff       	jmp    40000491 <vprintfmt+0x21>

40000612 <.L24>:
    if (lflag >= 2)
40000612:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000617:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
4000061b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000061f:	0f 8f d8 01 00 00    	jg     400007fd <.L25+0xe0>
        return va_arg(*ap, unsigned long);
40000625:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000629:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
4000062c:	31 db                	xor    %ebx,%ebx
4000062e:	ba 0a 00 00 00       	mov    $0xa,%edx
40000633:	8b 09                	mov    (%ecx),%ecx
40000635:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
40000640:	83 ec 0c             	sub    $0xc,%esp
40000643:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
40000648:	50                   	push   %eax
40000649:	89 f0                	mov    %esi,%eax
4000064b:	ff 74 24 18          	push   0x18(%esp)
4000064f:	52                   	push   %edx
40000650:	89 fa                	mov    %edi,%edx
40000652:	53                   	push   %ebx
40000653:	51                   	push   %ecx
40000654:	e8 17 fd ff ff       	call   40000370 <printnum>
            break;
40000659:	83 c4 20             	add    $0x20,%esp
4000065c:	e9 30 fe ff ff       	jmp    40000491 <vprintfmt+0x21>

40000661 <.L26>:
            putch('0', putdat);
40000661:	8b 74 24 40          	mov    0x40(%esp),%esi
40000665:	83 ec 08             	sub    $0x8,%esp
40000668:	57                   	push   %edi
40000669:	6a 30                	push   $0x30
4000066b:	ff d6                	call   *%esi
            putch('x', putdat);
4000066d:	59                   	pop    %ecx
4000066e:	5b                   	pop    %ebx
4000066f:	57                   	push   %edi
40000670:	6a 78                	push   $0x78
            num = (unsigned long long)
40000672:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000674:	ff d6                	call   *%esi
            num = (unsigned long long)
40000676:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000067a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000067f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000681:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000684:	83 c0 04             	add    $0x4,%eax
40000687:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000068b:	eb b3                	jmp    40000640 <.L24+0x2e>

4000068d <.L22>:
    if (lflag >= 2)
4000068d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000692:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000696:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000069a:	0f 8f 6e 01 00 00    	jg     4000080e <.L25+0xf1>
        return va_arg(*ap, unsigned long);
400006a0:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400006a4:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400006a7:	31 db                	xor    %ebx,%ebx
400006a9:	ba 10 00 00 00       	mov    $0x10,%edx
400006ae:	8b 09                	mov    (%ecx),%ecx
400006b0:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400006b4:	eb 8a                	jmp    40000640 <.L24+0x2e>

400006b6 <.L29>:
    if (lflag >= 2)
400006b6:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400006bb:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
400006bf:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400006c3:	0f 8f 5b 01 00 00    	jg     40000824 <.L25+0x107>
        return va_arg(*ap, long);
400006c9:	8b 00                	mov    (%eax),%eax
400006cb:	89 c3                	mov    %eax,%ebx
400006cd:	89 c1                	mov    %eax,%ecx
400006cf:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006d3:	c1 fb 1f             	sar    $0x1f,%ebx
400006d6:	83 c0 04             	add    $0x4,%eax
400006d9:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
400006dd:	85 db                	test   %ebx,%ebx
400006df:	0f 88 68 01 00 00    	js     4000084d <.L19+0xc>
        return va_arg(*ap, unsigned long long);
400006e5:	ba 0a 00 00 00       	mov    $0xa,%edx
400006ea:	e9 51 ff ff ff       	jmp    40000640 <.L24+0x2e>

400006ef <.L28>:
            lflag++;
400006ef:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400006f4:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
400006f6:	e9 f6 fd ff ff       	jmp    400004f1 <vprintfmt+0x81>

400006fb <.L27>:
            putch('X', putdat);
400006fb:	8b 74 24 40          	mov    0x40(%esp),%esi
400006ff:	83 ec 08             	sub    $0x8,%esp
40000702:	57                   	push   %edi
40000703:	6a 58                	push   $0x58
40000705:	ff d6                	call   *%esi
            putch('X', putdat);
40000707:	58                   	pop    %eax
40000708:	5a                   	pop    %edx
40000709:	57                   	push   %edi
4000070a:	6a 58                	push   $0x58
4000070c:	ff d6                	call   *%esi
            putch('X', putdat);
4000070e:	59                   	pop    %ecx
4000070f:	5b                   	pop    %ebx
40000710:	57                   	push   %edi
40000711:	6a 58                	push   $0x58
40000713:	ff d6                	call   *%esi
            break;
40000715:	83 c4 10             	add    $0x10,%esp
40000718:	e9 74 fd ff ff       	jmp    40000491 <vprintfmt+0x21>

4000071d <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
4000071d:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
40000721:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
40000725:	8b 54 24 14          	mov    0x14(%esp),%edx
40000729:	8b 74 24 40          	mov    0x40(%esp),%esi
4000072d:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
40000730:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
40000735:	89 44 24 14          	mov    %eax,0x14(%esp)
40000739:	8b 44 24 4c          	mov    0x4c(%esp),%eax
4000073d:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
4000073f:	0f 95 c0             	setne  %al
40000742:	85 c9                	test   %ecx,%ecx
40000744:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
40000747:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
4000074b:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
4000074d:	85 db                	test   %ebx,%ebx
4000074f:	0f 84 21 01 00 00    	je     40000876 <.L19+0x35>
            if (width > 0 && padc != '-')
40000755:	84 c0                	test   %al,%al
40000757:	0f 85 48 01 00 00    	jne    400008a5 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
4000075d:	89 d8                	mov    %ebx,%eax
4000075f:	8d 5b 01             	lea    0x1(%ebx),%ebx
40000762:	0f be 08             	movsbl (%eax),%ecx
40000765:	89 c8                	mov    %ecx,%eax
40000767:	85 c9                	test   %ecx,%ecx
40000769:	74 64                	je     400007cf <.L25+0xb2>
4000076b:	89 74 24 40          	mov    %esi,0x40(%esp)
4000076f:	89 d6                	mov    %edx,%esi
40000771:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000775:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000779:	eb 2a                	jmp    400007a5 <.L25+0x88>
4000077b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000780:	83 e8 20             	sub    $0x20,%eax
40000783:	83 f8 5e             	cmp    $0x5e,%eax
40000786:	76 2d                	jbe    400007b5 <.L25+0x98>
                    putch('?', putdat);
40000788:	83 ec 08             	sub    $0x8,%esp
4000078b:	57                   	push   %edi
4000078c:	6a 3f                	push   $0x3f
4000078e:	ff 54 24 50          	call   *0x50(%esp)
40000792:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000795:	0f be 03             	movsbl (%ebx),%eax
40000798:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000079b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000079e:	0f be c8             	movsbl %al,%ecx
400007a1:	85 c9                	test   %ecx,%ecx
400007a3:	74 1e                	je     400007c3 <.L25+0xa6>
400007a5:	85 f6                	test   %esi,%esi
400007a7:	78 05                	js     400007ae <.L25+0x91>
                                         || --precision >= 0); width--)
400007a9:	83 ee 01             	sub    $0x1,%esi
400007ac:	72 15                	jb     400007c3 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
400007ae:	8b 14 24             	mov    (%esp),%edx
400007b1:	85 d2                	test   %edx,%edx
400007b3:	75 cb                	jne    40000780 <.L25+0x63>
                    putch(ch, putdat);
400007b5:	83 ec 08             	sub    $0x8,%esp
400007b8:	57                   	push   %edi
400007b9:	51                   	push   %ecx
400007ba:	ff 54 24 50          	call   *0x50(%esp)
400007be:	83 c4 10             	add    $0x10,%esp
400007c1:	eb d2                	jmp    40000795 <.L25+0x78>
400007c3:	89 6c 24 08          	mov    %ebp,0x8(%esp)
400007c7:	8b 74 24 40          	mov    0x40(%esp),%esi
400007cb:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
400007cf:	8b 44 24 08          	mov    0x8(%esp),%eax
400007d3:	85 c0                	test   %eax,%eax
400007d5:	7e 19                	jle    400007f0 <.L25+0xd3>
400007d7:	89 c3                	mov    %eax,%ebx
400007d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
400007e0:	83 ec 08             	sub    $0x8,%esp
400007e3:	57                   	push   %edi
400007e4:	6a 20                	push   $0x20
400007e6:	ff d6                	call   *%esi
            for (; width > 0; width--)
400007e8:	83 c4 10             	add    $0x10,%esp
400007eb:	83 eb 01             	sub    $0x1,%ebx
400007ee:	75 f0                	jne    400007e0 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
400007f0:	8b 44 24 14          	mov    0x14(%esp),%eax
400007f4:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007f8:	e9 94 fc ff ff       	jmp    40000491 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
400007fd:	8b 08                	mov    (%eax),%ecx
400007ff:	8b 58 04             	mov    0x4(%eax),%ebx
40000802:	83 c0 08             	add    $0x8,%eax
40000805:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000809:	e9 d7 fe ff ff       	jmp    400006e5 <.L29+0x2f>
4000080e:	8b 08                	mov    (%eax),%ecx
40000810:	8b 58 04             	mov    0x4(%eax),%ebx
40000813:	83 c0 08             	add    $0x8,%eax
40000816:	ba 10 00 00 00       	mov    $0x10,%edx
4000081b:	89 44 24 4c          	mov    %eax,0x4c(%esp)
4000081f:	e9 1c fe ff ff       	jmp    40000640 <.L24+0x2e>
        return va_arg(*ap, long long);
40000824:	8b 08                	mov    (%eax),%ecx
40000826:	8b 58 04             	mov    0x4(%eax),%ebx
40000829:	83 c0 08             	add    $0x8,%eax
4000082c:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000830:	e9 a8 fe ff ff       	jmp    400006dd <.L29+0x27>

40000835 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
40000835:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
4000083a:	89 eb                	mov    %ebp,%ebx
4000083c:	e9 b0 fc ff ff       	jmp    400004f1 <vprintfmt+0x81>

40000841 <.L19>:
            padc = '-';
40000841:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000846:	89 eb                	mov    %ebp,%ebx
40000848:	e9 a4 fc ff ff       	jmp    400004f1 <vprintfmt+0x81>
4000084d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
40000851:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
40000854:	31 db                	xor    %ebx,%ebx
40000856:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
4000085a:	57                   	push   %edi
4000085b:	6a 2d                	push   $0x2d
4000085d:	ff d6                	call   *%esi
                num = -(long long) num;
4000085f:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000863:	ba 0a 00 00 00       	mov    $0xa,%edx
40000868:	f7 d9                	neg    %ecx
4000086a:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
4000086e:	83 c4 10             	add    $0x10,%esp
40000871:	e9 ca fd ff ff       	jmp    40000640 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000876:	84 c0                	test   %al,%al
40000878:	0f 85 99 00 00 00    	jne    40000917 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000087e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000882:	89 74 24 40          	mov    %esi,0x40(%esp)
40000886:	b9 28 00 00 00       	mov    $0x28,%ecx
4000088b:	89 d6                	mov    %edx,%esi
4000088d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000891:	b8 28 00 00 00       	mov    $0x28,%eax
40000896:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000089a:	8d 9b 42 c0 ff ff    	lea    -0x3fbe(%ebx),%ebx
400008a0:	e9 00 ff ff ff       	jmp    400007a5 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
400008a5:	83 ec 08             	sub    $0x8,%esp
400008a8:	52                   	push   %edx
400008a9:	89 54 24 28          	mov    %edx,0x28(%esp)
400008ad:	ff 74 24 24          	push   0x24(%esp)
400008b1:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400008b5:	e8 26 03 00 00       	call   40000be0 <strnlen>
400008ba:	29 44 24 18          	sub    %eax,0x18(%esp)
400008be:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400008c2:	83 c4 10             	add    $0x10,%esp
400008c5:	8b 54 24 1c          	mov    0x1c(%esp),%edx
400008c9:	85 c9                	test   %ecx,%ecx
400008cb:	0f 8e 99 00 00 00    	jle    4000096a <.L19+0x129>
                    putch(padc, putdat);
400008d1:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
400008d6:	89 54 24 10          	mov    %edx,0x10(%esp)
400008da:	89 6c 24 48          	mov    %ebp,0x48(%esp)
400008de:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400008e2:	83 ec 08             	sub    $0x8,%esp
400008e5:	57                   	push   %edi
400008e6:	53                   	push   %ebx
400008e7:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
400008e9:	83 c4 10             	add    $0x10,%esp
400008ec:	83 ed 01             	sub    $0x1,%ebp
400008ef:	75 f1                	jne    400008e2 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
400008f1:	8b 44 24 18          	mov    0x18(%esp),%eax
400008f5:	8b 54 24 10          	mov    0x10(%esp),%edx
400008f9:	89 6c 24 08          	mov    %ebp,0x8(%esp)
400008fd:	8b 6c 24 48          	mov    0x48(%esp),%ebp
40000901:	8d 58 01             	lea    0x1(%eax),%ebx
40000904:	0f be 00             	movsbl (%eax),%eax
40000907:	0f be c8             	movsbl %al,%ecx
4000090a:	85 c9                	test   %ecx,%ecx
4000090c:	0f 85 59 fe ff ff    	jne    4000076b <.L25+0x4e>
40000912:	e9 d9 fe ff ff       	jmp    400007f0 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
40000917:	83 ec 08             	sub    $0x8,%esp
4000091a:	52                   	push   %edx
4000091b:	8b 5c 24 18          	mov    0x18(%esp),%ebx
4000091f:	8d 8b 41 c0 ff ff    	lea    -0x3fbf(%ebx),%ecx
40000925:	89 54 24 28          	mov    %edx,0x28(%esp)
40000929:	51                   	push   %ecx
4000092a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
4000092e:	e8 ad 02 00 00       	call   40000be0 <strnlen>
40000933:	29 44 24 18          	sub    %eax,0x18(%esp)
40000937:	8b 44 24 18          	mov    0x18(%esp),%eax
4000093b:	83 c4 10             	add    $0x10,%esp
4000093e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000942:	85 c0                	test   %eax,%eax
40000944:	7f 8b                	jg     400008d1 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
40000946:	b9 28 00 00 00       	mov    $0x28,%ecx
4000094b:	b8 28 00 00 00       	mov    $0x28,%eax
40000950:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000954:	89 74 24 40          	mov    %esi,0x40(%esp)
40000958:	89 d6                	mov    %edx,%esi
4000095a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000095e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000962:	83 c3 01             	add    $0x1,%ebx
40000965:	e9 3b fe ff ff       	jmp    400007a5 <.L25+0x88>
4000096a:	8b 44 24 18          	mov    0x18(%esp),%eax
4000096e:	0f be 08             	movsbl (%eax),%ecx
40000971:	89 c8                	mov    %ecx,%eax
40000973:	85 c9                	test   %ecx,%ecx
40000975:	75 d9                	jne    40000950 <.L19+0x10f>
40000977:	e9 74 fe ff ff       	jmp    400007f0 <.L25+0xd3>
4000097c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000980 <printfmt>:
{
40000980:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000983:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000987:	50                   	push   %eax
40000988:	ff 74 24 1c          	push   0x1c(%esp)
4000098c:	ff 74 24 1c          	push   0x1c(%esp)
40000990:	ff 74 24 1c          	push   0x1c(%esp)
40000994:	e8 d7 fa ff ff       	call   40000470 <vprintfmt>
}
40000999:	83 c4 1c             	add    $0x1c,%esp
4000099c:	c3                   	ret
4000099d:	8d 76 00             	lea    0x0(%esi),%esi

400009a0 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400009a0:	e8 4e 01 00 00       	call   40000af3 <__x86.get_pc_thunk.ax>
400009a5:	05 4f 66 00 00       	add    $0x664f,%eax
{
400009aa:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400009ad:	8b 54 24 20          	mov    0x20(%esp),%edx
400009b1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400009b8:	ff 
400009b9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009c0:	00 
400009c1:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
400009c5:	ff 74 24 28          	push   0x28(%esp)
400009c9:	ff 74 24 28          	push   0x28(%esp)
400009cd:	8d 80 5c 94 ff ff    	lea    -0x6ba4(%eax),%eax
400009d3:	8d 54 24 0c          	lea    0xc(%esp),%edx
400009d7:	52                   	push   %edx
400009d8:	50                   	push   %eax
400009d9:	e8 92 fa ff ff       	call   40000470 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
400009de:	8b 44 24 14          	mov    0x14(%esp),%eax
400009e2:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
400009e5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400009e9:	83 c4 2c             	add    $0x2c,%esp
400009ec:	c3                   	ret
400009ed:	8d 76 00             	lea    0x0(%esi),%esi

400009f0 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
400009f0:	e8 fe 00 00 00       	call   40000af3 <__x86.get_pc_thunk.ax>
400009f5:	05 ff 65 00 00       	add    $0x65ff,%eax
{
400009fa:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400009fd:	8b 54 24 20          	mov    0x20(%esp),%edx
40000a01:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000a08:	ff 
40000a09:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a10:	00 
40000a11:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a15:	8d 54 24 28          	lea    0x28(%esp),%edx
40000a19:	52                   	push   %edx
40000a1a:	ff 74 24 28          	push   0x28(%esp)
40000a1e:	8d 80 5c 94 ff ff    	lea    -0x6ba4(%eax),%eax
40000a24:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000a28:	52                   	push   %edx
40000a29:	50                   	push   %eax
40000a2a:	e8 41 fa ff ff       	call   40000470 <vprintfmt>
    *b.buf = '\0';
40000a2f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a33:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
40000a36:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a3a:	83 c4 2c             	add    $0x2c,%esp
40000a3d:	c3                   	ret
40000a3e:	66 90                	xchg   %ax,%ax

40000a40 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a40:	e8 b2 00 00 00       	call   40000af7 <__x86.get_pc_thunk.dx>
40000a45:	81 c2 af 65 00 00    	add    $0x65af,%edx
{
40000a4b:	83 ec 1c             	sub    $0x1c,%esp
40000a4e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a52:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000a56:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a5d:	00 
40000a5e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000a62:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000a66:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a6a:	ff 74 24 2c          	push   0x2c(%esp)
40000a6e:	ff 74 24 2c          	push   0x2c(%esp)
40000a72:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a76:	50                   	push   %eax
40000a77:	8d 82 5c 94 ff ff    	lea    -0x6ba4(%edx),%eax
40000a7d:	50                   	push   %eax
40000a7e:	e8 ed f9 ff ff       	call   40000470 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a83:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a87:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a8a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a8e:	83 c4 2c             	add    $0x2c,%esp
40000a91:	c3                   	ret
40000a92:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000a99:	00 
40000a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000aa0 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000aa0:	e8 52 00 00 00       	call   40000af7 <__x86.get_pc_thunk.dx>
40000aa5:	81 c2 4f 65 00 00    	add    $0x654f,%edx
{
40000aab:	83 ec 1c             	sub    $0x1c,%esp
40000aae:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000ab2:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000ab6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000abd:	00 
40000abe:	89 44 24 04          	mov    %eax,0x4(%esp)
40000ac2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000ac6:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000aca:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000ace:	50                   	push   %eax
40000acf:	ff 74 24 2c          	push   0x2c(%esp)
40000ad3:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000ad7:	50                   	push   %eax
40000ad8:	8d 82 5c 94 ff ff    	lea    -0x6ba4(%edx),%eax
40000ade:	50                   	push   %eax
40000adf:	e8 8c f9 ff ff       	call   40000470 <vprintfmt>
    *b.buf = '\0';
40000ae4:	8b 44 24 14          	mov    0x14(%esp),%eax
40000ae8:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000aeb:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000aef:	83 c4 2c             	add    $0x2c,%esp
40000af2:	c3                   	ret

40000af3 <__x86.get_pc_thunk.ax>:
40000af3:	8b 04 24             	mov    (%esp),%eax
40000af6:	c3                   	ret

40000af7 <__x86.get_pc_thunk.dx>:
40000af7:	8b 14 24             	mov    (%esp),%edx
40000afa:	c3                   	ret

40000afb <__x86.get_pc_thunk.cx>:
40000afb:	8b 0c 24             	mov    (%esp),%ecx
40000afe:	c3                   	ret
40000aff:	90                   	nop

40000b00 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000b00:	53                   	push   %ebx
    asm volatile ("int %2"
40000b01:	b8 01 00 00 00       	mov    $0x1,%eax
40000b06:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000b0a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000b0e:	cd 30                	int    $0x30
    return errno ? -1 : pid;
40000b10:	85 c0                	test   %eax,%eax
40000b12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000b17:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000b1a:	5b                   	pop    %ebx
40000b1b:	c3                   	ret
40000b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b20 <yield>:
    asm volatile ("int %0"
40000b20:	b8 02 00 00 00       	mov    $0x2,%eax
40000b25:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000b27:	c3                   	ret
40000b28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b2f:	00 

40000b30 <produce>:
    return errno ? -1 : pid;
}

static gcc_inline void sys_produce(void)
{
    asm volatile ("int %0"
40000b30:	b8 0d 00 00 00       	mov    $0xd,%eax
40000b35:	cd 30                	int    $0x30

void produce(void)
{
    sys_produce();
}
40000b37:	c3                   	ret
40000b38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b3f:	00 

40000b40 <consume>:
                  : "cc", "memory");
}

static gcc_inline void sys_consume(void)
{
    asm volatile ("int %0"
40000b40:	b8 0e 00 00 00       	mov    $0xe,%eax
40000b45:	cd 30                	int    $0x30

void consume(void)
{
    sys_consume();
}
40000b47:	c3                   	ret
40000b48:	66 90                	xchg   %ax,%ax
40000b4a:	66 90                	xchg   %ax,%ax
40000b4c:	66 90                	xchg   %ax,%ax
40000b4e:	66 90                	xchg   %ax,%ax

40000b50 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000b50:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b54:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000b5a:	c3                   	ret
40000b5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000b60 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000b60:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000b64:	b8 01 00 00 00       	mov    $0x1,%eax
40000b69:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b6c:	85 c0                	test   %eax,%eax
40000b6e:	74 13                	je     40000b83 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000b70:	b9 01 00 00 00       	mov    $0x1,%ecx
40000b75:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000b78:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000b7a:	89 c8                	mov    %ecx,%eax
40000b7c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b7f:	85 c0                	test   %eax,%eax
40000b81:	75 f5                	jne    40000b78 <spinlock_acquire+0x18>
}
40000b83:	c3                   	ret
40000b84:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b8b:	00 
40000b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b90 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000b90:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000b94:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000b96:	84 c0                	test   %al,%al
40000b98:	74 05                	je     40000b9f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000b9a:	31 c0                	xor    %eax,%eax
40000b9c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000b9f:	c3                   	ret

40000ba0 <spinlock_holding>:
    return *lk;
40000ba0:	8b 44 24 04          	mov    0x4(%esp),%eax
40000ba4:	8b 00                	mov    (%eax),%eax
}
40000ba6:	c3                   	ret
40000ba7:	66 90                	xchg   %ax,%ax
40000ba9:	66 90                	xchg   %ax,%ax
40000bab:	66 90                	xchg   %ax,%ax
40000bad:	66 90                	xchg   %ax,%ax
40000baf:	90                   	nop

40000bb0 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000bb0:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000bb4:	31 c0                	xor    %eax,%eax
40000bb6:	80 3a 00             	cmpb   $0x0,(%edx)
40000bb9:	74 15                	je     40000bd0 <strlen+0x20>
40000bbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000bc0:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000bc3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000bc7:	75 f7                	jne    40000bc0 <strlen+0x10>
40000bc9:	c3                   	ret
40000bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000bd0:	c3                   	ret
40000bd1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bd8:	00 
40000bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000be0 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000be0:	8b 54 24 08          	mov    0x8(%esp),%edx
40000be4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000be8:	31 c0                	xor    %eax,%eax
40000bea:	85 d2                	test   %edx,%edx
40000bec:	75 09                	jne    40000bf7 <strnlen+0x17>
40000bee:	c3                   	ret
40000bef:	90                   	nop
        n++;
40000bf0:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000bf3:	39 c2                	cmp    %eax,%edx
40000bf5:	74 09                	je     40000c00 <strnlen+0x20>
40000bf7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000bfb:	75 f3                	jne    40000bf0 <strnlen+0x10>
40000bfd:	c3                   	ret
40000bfe:	66 90                	xchg   %ax,%ax
    return n;
}
40000c00:	c3                   	ret
40000c01:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c08:	00 
40000c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000c10 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000c10:	53                   	push   %ebx
40000c11:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000c15:	31 c0                	xor    %eax,%eax
{
40000c17:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000c1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000c20:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000c24:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000c27:	83 c0 01             	add    $0x1,%eax
40000c2a:	84 d2                	test   %dl,%dl
40000c2c:	75 f2                	jne    40000c20 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000c2e:	89 c8                	mov    %ecx,%eax
40000c30:	5b                   	pop    %ebx
40000c31:	c3                   	ret
40000c32:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c39:	00 
40000c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000c40 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000c40:	56                   	push   %esi
40000c41:	53                   	push   %ebx
40000c42:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000c46:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c4a:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000c4e:	85 db                	test   %ebx,%ebx
40000c50:	74 21                	je     40000c73 <strncpy+0x33>
40000c52:	01 f3                	add    %esi,%ebx
40000c54:	89 f0                	mov    %esi,%eax
40000c56:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c5d:	00 
40000c5e:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000c60:	0f b6 0a             	movzbl (%edx),%ecx
40000c63:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000c66:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000c69:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000c6c:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000c6f:	39 c3                	cmp    %eax,%ebx
40000c71:	75 ed                	jne    40000c60 <strncpy+0x20>
    }
    return ret;
}
40000c73:	89 f0                	mov    %esi,%eax
40000c75:	5b                   	pop    %ebx
40000c76:	5e                   	pop    %esi
40000c77:	c3                   	ret
40000c78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c7f:	00 

40000c80 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000c80:	56                   	push   %esi
40000c81:	53                   	push   %ebx
40000c82:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c86:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c8a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000c8e:	85 c0                	test   %eax,%eax
40000c90:	74 29                	je     40000cbb <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000c92:	89 f2                	mov    %esi,%edx
40000c94:	83 e8 01             	sub    $0x1,%eax
40000c97:	74 1f                	je     40000cb8 <strlcpy+0x38>
40000c99:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000c9c:	eb 0f                	jmp    40000cad <strlcpy+0x2d>
40000c9e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000ca0:	83 c2 01             	add    $0x1,%edx
40000ca3:	83 c1 01             	add    $0x1,%ecx
40000ca6:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000ca9:	39 da                	cmp    %ebx,%edx
40000cab:	74 07                	je     40000cb4 <strlcpy+0x34>
40000cad:	0f b6 01             	movzbl (%ecx),%eax
40000cb0:	84 c0                	test   %al,%al
40000cb2:	75 ec                	jne    40000ca0 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000cb4:	89 d0                	mov    %edx,%eax
40000cb6:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000cb8:	c6 02 00             	movb   $0x0,(%edx)
}
40000cbb:	5b                   	pop    %ebx
40000cbc:	5e                   	pop    %esi
40000cbd:	c3                   	ret
40000cbe:	66 90                	xchg   %ax,%ax

40000cc0 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000cc0:	53                   	push   %ebx
40000cc1:	8b 54 24 08          	mov    0x8(%esp),%edx
40000cc5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000cc9:	0f b6 02             	movzbl (%edx),%eax
40000ccc:	84 c0                	test   %al,%al
40000cce:	75 18                	jne    40000ce8 <strcmp+0x28>
40000cd0:	eb 30                	jmp    40000d02 <strcmp+0x42>
40000cd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000cd8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000cdc:	83 c2 01             	add    $0x1,%edx
40000cdf:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000ce2:	84 c0                	test   %al,%al
40000ce4:	74 12                	je     40000cf8 <strcmp+0x38>
40000ce6:	89 d9                	mov    %ebx,%ecx
40000ce8:	0f b6 19             	movzbl (%ecx),%ebx
40000ceb:	38 c3                	cmp    %al,%bl
40000ced:	74 e9                	je     40000cd8 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000cef:	29 d8                	sub    %ebx,%eax
}
40000cf1:	5b                   	pop    %ebx
40000cf2:	c3                   	ret
40000cf3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000cf8:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000cfc:	31 c0                	xor    %eax,%eax
40000cfe:	29 d8                	sub    %ebx,%eax
}
40000d00:	5b                   	pop    %ebx
40000d01:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000d02:	0f b6 19             	movzbl (%ecx),%ebx
40000d05:	31 c0                	xor    %eax,%eax
40000d07:	eb e6                	jmp    40000cef <strcmp+0x2f>
40000d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000d10 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000d10:	53                   	push   %ebx
40000d11:	8b 54 24 10          	mov    0x10(%esp),%edx
40000d15:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d19:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000d1d:	85 d2                	test   %edx,%edx
40000d1f:	75 16                	jne    40000d37 <strncmp+0x27>
40000d21:	eb 2d                	jmp    40000d50 <strncmp+0x40>
40000d23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d28:	3a 19                	cmp    (%ecx),%bl
40000d2a:	75 12                	jne    40000d3e <strncmp+0x2e>
        n--, p++, q++;
40000d2c:	83 c0 01             	add    $0x1,%eax
40000d2f:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000d32:	83 ea 01             	sub    $0x1,%edx
40000d35:	74 19                	je     40000d50 <strncmp+0x40>
40000d37:	0f b6 18             	movzbl (%eax),%ebx
40000d3a:	84 db                	test   %bl,%bl
40000d3c:	75 ea                	jne    40000d28 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d3e:	0f b6 00             	movzbl (%eax),%eax
40000d41:	0f b6 11             	movzbl (%ecx),%edx
}
40000d44:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d45:	29 d0                	sub    %edx,%eax
}
40000d47:	c3                   	ret
40000d48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d4f:	00 
        return 0;
40000d50:	31 c0                	xor    %eax,%eax
}
40000d52:	5b                   	pop    %ebx
40000d53:	c3                   	ret
40000d54:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d5b:	00 
40000d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000d60 <strchr>:

char *strchr(const char *s, char c)
{
40000d60:	8b 44 24 04          	mov    0x4(%esp),%eax
40000d64:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000d69:	0f b6 10             	movzbl (%eax),%edx
40000d6c:	84 d2                	test   %dl,%dl
40000d6e:	75 13                	jne    40000d83 <strchr+0x23>
40000d70:	eb 1e                	jmp    40000d90 <strchr+0x30>
40000d72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d78:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d7c:	83 c0 01             	add    $0x1,%eax
40000d7f:	84 d2                	test   %dl,%dl
40000d81:	74 0d                	je     40000d90 <strchr+0x30>
        if (*s == c)
40000d83:	38 d1                	cmp    %dl,%cl
40000d85:	75 f1                	jne    40000d78 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000d87:	c3                   	ret
40000d88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d8f:	00 
    return 0;
40000d90:	31 c0                	xor    %eax,%eax
}
40000d92:	c3                   	ret
40000d93:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d9a:	00 
40000d9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000da0 <strfind>:

char *strfind(const char *s, char c)
{
40000da0:	53                   	push   %ebx
40000da1:	8b 44 24 08          	mov    0x8(%esp),%eax
40000da5:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000da9:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000dac:	38 d3                	cmp    %dl,%bl
40000dae:	74 1f                	je     40000dcf <strfind+0x2f>
40000db0:	89 d1                	mov    %edx,%ecx
40000db2:	84 db                	test   %bl,%bl
40000db4:	75 0e                	jne    40000dc4 <strfind+0x24>
40000db6:	eb 17                	jmp    40000dcf <strfind+0x2f>
40000db8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dbf:	00 
40000dc0:	84 d2                	test   %dl,%dl
40000dc2:	74 0b                	je     40000dcf <strfind+0x2f>
    for (; *s; s++)
40000dc4:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000dc8:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000dcb:	38 ca                	cmp    %cl,%dl
40000dcd:	75 f1                	jne    40000dc0 <strfind+0x20>
            break;
    return (char *) s;
}
40000dcf:	5b                   	pop    %ebx
40000dd0:	c3                   	ret
40000dd1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000dd8:	00 
40000dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000de0 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000de0:	55                   	push   %ebp
40000de1:	57                   	push   %edi
40000de2:	56                   	push   %esi
40000de3:	53                   	push   %ebx
40000de4:	8b 54 24 14          	mov    0x14(%esp),%edx
40000de8:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000dec:	0f b6 02             	movzbl (%edx),%eax
40000def:	3c 20                	cmp    $0x20,%al
40000df1:	75 10                	jne    40000e03 <strtol+0x23>
40000df3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000df8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000dfc:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000dff:	3c 20                	cmp    $0x20,%al
40000e01:	74 f5                	je     40000df8 <strtol+0x18>
40000e03:	3c 09                	cmp    $0x9,%al
40000e05:	74 f1                	je     40000df8 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000e07:	3c 2b                	cmp    $0x2b,%al
40000e09:	0f 84 b1 00 00 00    	je     40000ec0 <strtol+0xe0>
    int neg = 0;
40000e0f:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000e11:	3c 2d                	cmp    $0x2d,%al
40000e13:	0f 84 97 00 00 00    	je     40000eb0 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000e19:	0f b6 02             	movzbl (%edx),%eax
40000e1c:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000e23:	ff 
40000e24:	75 1d                	jne    40000e43 <strtol+0x63>
40000e26:	3c 30                	cmp    $0x30,%al
40000e28:	0f 84 a2 00 00 00    	je     40000ed0 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000e2e:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000e33:	19 c0                	sbb    %eax,%eax
40000e35:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000e39:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000e3e:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000e43:	31 c9                	xor    %ecx,%ecx
40000e45:	eb 1c                	jmp    40000e63 <strtol+0x83>
40000e47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e4e:	00 
40000e4f:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000e50:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000e53:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e57:	7d 2a                	jge    40000e83 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000e59:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000e5e:	83 c2 01             	add    $0x1,%edx
40000e61:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000e63:	0f be 02             	movsbl (%edx),%eax
40000e66:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000e69:	89 eb                	mov    %ebp,%ebx
40000e6b:	80 fb 09             	cmp    $0x9,%bl
40000e6e:	76 e0                	jbe    40000e50 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000e70:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000e73:	89 eb                	mov    %ebp,%ebx
40000e75:	80 fb 19             	cmp    $0x19,%bl
40000e78:	77 26                	ja     40000ea0 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000e7a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000e7d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e81:	7c d6                	jl     40000e59 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000e83:	85 f6                	test   %esi,%esi
40000e85:	74 02                	je     40000e89 <strtol+0xa9>
        *endptr = (char *) s;
40000e87:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000e89:	89 c8                	mov    %ecx,%eax
}
40000e8b:	5b                   	pop    %ebx
40000e8c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000e8d:	f7 d8                	neg    %eax
40000e8f:	85 ff                	test   %edi,%edi
}
40000e91:	5f                   	pop    %edi
40000e92:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000e93:	0f 45 c8             	cmovne %eax,%ecx
}
40000e96:	89 c8                	mov    %ecx,%eax
40000e98:	c3                   	ret
40000e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000ea0:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000ea3:	89 eb                	mov    %ebp,%ebx
40000ea5:	80 fb 19             	cmp    $0x19,%bl
40000ea8:	77 d9                	ja     40000e83 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000eaa:	83 e8 37             	sub    $0x37,%eax
40000ead:	eb a4                	jmp    40000e53 <strtol+0x73>
40000eaf:	90                   	nop
        s++, neg = 1;
40000eb0:	83 c2 01             	add    $0x1,%edx
40000eb3:	bf 01 00 00 00       	mov    $0x1,%edi
40000eb8:	e9 5c ff ff ff       	jmp    40000e19 <strtol+0x39>
40000ebd:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000ec0:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000ec3:	31 ff                	xor    %edi,%edi
40000ec5:	e9 4f ff ff ff       	jmp    40000e19 <strtol+0x39>
40000eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000ed0:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000ed4:	74 25                	je     40000efb <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000ed6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000eda:	85 c0                	test   %eax,%eax
40000edc:	74 0d                	je     40000eeb <strtol+0x10b>
40000ede:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000ee5:	00 
40000ee6:	e9 58 ff ff ff       	jmp    40000e43 <strtol+0x63>
        s++, base = 8;
40000eeb:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000ef2:	00 
40000ef3:	83 c2 01             	add    $0x1,%edx
40000ef6:	e9 48 ff ff ff       	jmp    40000e43 <strtol+0x63>
        s += 2, base = 16;
40000efb:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000f02:	00 
40000f03:	83 c2 02             	add    $0x2,%edx
40000f06:	e9 38 ff ff ff       	jmp    40000e43 <strtol+0x63>
40000f0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f10 <memset>:

void *memset(void *v, int c, size_t n)
{
40000f10:	57                   	push   %edi
40000f11:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000f15:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000f19:	85 c9                	test   %ecx,%ecx
40000f1b:	74 19                	je     40000f36 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000f1d:	89 f8                	mov    %edi,%eax
40000f1f:	09 c8                	or     %ecx,%eax
40000f21:	a8 03                	test   $0x3,%al
40000f23:	75 1b                	jne    40000f40 <memset+0x30>
        c &= 0xFF;
40000f25:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000f2a:	c1 e9 02             	shr    $0x2,%ecx
40000f2d:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000f33:	fc                   	cld
40000f34:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000f36:	89 f8                	mov    %edi,%eax
40000f38:	5f                   	pop    %edi
40000f39:	c3                   	ret
40000f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000f40:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f44:	fc                   	cld
40000f45:	f3 aa                	rep stos %al,%es:(%edi)
}
40000f47:	89 f8                	mov    %edi,%eax
40000f49:	5f                   	pop    %edi
40000f4a:	c3                   	ret
40000f4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f50 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000f50:	57                   	push   %edi
40000f51:	56                   	push   %esi
40000f52:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f56:	8b 74 24 10          	mov    0x10(%esp),%esi
40000f5a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000f5e:	39 c6                	cmp    %eax,%esi
40000f60:	73 26                	jae    40000f88 <memmove+0x38>
40000f62:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000f65:	39 d0                	cmp    %edx,%eax
40000f67:	73 1f                	jae    40000f88 <memmove+0x38>
        s += n;
        d += n;
40000f69:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f6c:	89 fe                	mov    %edi,%esi
40000f6e:	09 ce                	or     %ecx,%esi
40000f70:	09 d6                	or     %edx,%esi
40000f72:	83 e6 03             	and    $0x3,%esi
40000f75:	74 39                	je     40000fb0 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000f77:	83 ef 01             	sub    $0x1,%edi
40000f7a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000f7d:	fd                   	std
40000f7e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000f80:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000f81:	5e                   	pop    %esi
40000f82:	5f                   	pop    %edi
40000f83:	c3                   	ret
40000f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f88:	89 c2                	mov    %eax,%edx
40000f8a:	09 ca                	or     %ecx,%edx
40000f8c:	09 f2                	or     %esi,%edx
40000f8e:	83 e2 03             	and    $0x3,%edx
40000f91:	74 0d                	je     40000fa0 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40000f93:	89 c7                	mov    %eax,%edi
40000f95:	fc                   	cld
40000f96:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40000f98:	5e                   	pop    %esi
40000f99:	5f                   	pop    %edi
40000f9a:	c3                   	ret
40000f9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40000fa0:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40000fa3:	89 c7                	mov    %eax,%edi
40000fa5:	fc                   	cld
40000fa6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000fa8:	eb ee                	jmp    40000f98 <memmove+0x48>
40000faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40000fb0:	83 ef 04             	sub    $0x4,%edi
40000fb3:	8d 72 fc             	lea    -0x4(%edx),%esi
40000fb6:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40000fb9:	fd                   	std
40000fba:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000fbc:	eb c2                	jmp    40000f80 <memmove+0x30>
40000fbe:	66 90                	xchg   %ax,%ax

40000fc0 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40000fc0:	eb 8e                	jmp    40000f50 <memmove>
40000fc2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fc9:	00 
40000fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000fd0 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40000fd0:	56                   	push   %esi
40000fd1:	53                   	push   %ebx
40000fd2:	8b 74 24 14          	mov    0x14(%esp),%esi
40000fd6:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000fda:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
40000fde:	85 f6                	test   %esi,%esi
40000fe0:	74 2e                	je     40001010 <memcmp+0x40>
40000fe2:	01 c6                	add    %eax,%esi
40000fe4:	eb 14                	jmp    40000ffa <memcmp+0x2a>
40000fe6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fed:	00 
40000fee:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40000ff0:	83 c0 01             	add    $0x1,%eax
40000ff3:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40000ff6:	39 f0                	cmp    %esi,%eax
40000ff8:	74 16                	je     40001010 <memcmp+0x40>
        if (*s1 != *s2)
40000ffa:	0f b6 08             	movzbl (%eax),%ecx
40000ffd:	0f b6 1a             	movzbl (%edx),%ebx
40001000:	38 d9                	cmp    %bl,%cl
40001002:	74 ec                	je     40000ff0 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40001004:	0f b6 c1             	movzbl %cl,%eax
40001007:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40001009:	5b                   	pop    %ebx
4000100a:	5e                   	pop    %esi
4000100b:	c3                   	ret
4000100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
40001010:	31 c0                	xor    %eax,%eax
}
40001012:	5b                   	pop    %ebx
40001013:	5e                   	pop    %esi
40001014:	c3                   	ret
40001015:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000101c:	00 
4000101d:	8d 76 00             	lea    0x0(%esi),%esi

40001020 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40001020:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
40001024:	8b 54 24 0c          	mov    0xc(%esp),%edx
40001028:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
4000102a:	39 d0                	cmp    %edx,%eax
4000102c:	73 1a                	jae    40001048 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000102e:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
40001033:	eb 0a                	jmp    4000103f <memchr+0x1f>
40001035:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
40001038:	83 c0 01             	add    $0x1,%eax
4000103b:	39 c2                	cmp    %eax,%edx
4000103d:	74 09                	je     40001048 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
4000103f:	38 08                	cmp    %cl,(%eax)
40001041:	75 f5                	jne    40001038 <memchr+0x18>
            return (void *) s;
    return NULL;
}
40001043:	c3                   	ret
40001044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
40001048:	31 c0                	xor    %eax,%eax
}
4000104a:	c3                   	ret
4000104b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001050 <memzero>:

void *memzero(void *v, size_t n)
{
40001050:	57                   	push   %edi
40001051:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40001055:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40001059:	85 c9                	test   %ecx,%ecx
4000105b:	74 0f                	je     4000106c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
4000105d:	89 f8                	mov    %edi,%eax
4000105f:	09 c8                	or     %ecx,%eax
40001061:	83 e0 03             	and    $0x3,%eax
40001064:	75 0a                	jne    40001070 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40001066:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40001069:	fc                   	cld
4000106a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
4000106c:	89 f8                	mov    %edi,%eax
4000106e:	5f                   	pop    %edi
4000106f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001070:	31 c0                	xor    %eax,%eax
40001072:	fc                   	cld
40001073:	f3 aa                	rep stos %al,%es:(%edi)
}
40001075:	89 f8                	mov    %edi,%eax
40001077:	5f                   	pop    %edi
40001078:	c3                   	ret
40001079:	66 90                	xchg   %ax,%ax
4000107b:	66 90                	xchg   %ax,%ax
4000107d:	66 90                	xchg   %ax,%ax
4000107f:	90                   	nop

40001080 <smallfile>:
{
40001080:	55                   	push   %ebp
40001081:	57                   	push   %edi
40001082:	56                   	push   %esi
40001083:	e8 23 1b 00 00       	call   40002bab <__x86.get_pc_thunk.si>
40001088:	81 c6 6c 5f 00 00    	add    $0x5f6c,%esi
4000108e:	53                   	push   %ebx
4000108f:	83 ec 28             	sub    $0x28,%esp
    printf("=====small file test=====\n");
40001092:	8d 86 48 c0 ff ff    	lea    -0x3fb8(%esi),%eax
40001098:	89 74 24 14          	mov    %esi,0x14(%esp)
4000109c:	89 f3                	mov    %esi,%ebx
4000109e:	50                   	push   %eax
4000109f:	e8 ac f2 ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
400010a4:	8d 9e 63 c0 ff ff    	lea    -0x3f9d(%esi),%ebx
400010aa:	b8 03 00 00 00       	mov    $0x3,%eax
400010af:	b9 02 02 00 00       	mov    $0x202,%ecx
400010b4:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
400010b8:	cd 30                	int    $0x30
    return errno ? -1 : fd;
400010ba:	83 c4 10             	add    $0x10,%esp
    if (fd >= 0) {
400010bd:	85 c0                	test   %eax,%eax
400010bf:	0f 85 9b 00 00 00    	jne    40001160 <smallfile+0xe0>
400010c5:	89 df                	mov    %ebx,%edi
400010c7:	85 db                	test   %ebx,%ebx
400010c9:	0f 88 91 00 00 00    	js     40001160 <smallfile+0xe0>
        printf("create small succeeded; ok, fd: %d\n", fd);
400010cf:	83 ec 08             	sub    $0x8,%esp
400010d2:	8d 86 00 cc ff ff    	lea    -0x3400(%esi),%eax
    for (i = 0; i < 100; i++) {
400010d8:	31 ed                	xor    %ebp,%ebp
        printf("create small succeeded; ok, fd: %d\n", fd);
400010da:	53                   	push   %ebx
400010db:	89 f3                	mov    %esi,%ebx
400010dd:	50                   	push   %eax
400010de:	e8 6d f2 ff ff       	call   40000350 <printf>
400010e3:	83 c4 10             	add    $0x10,%esp
400010e6:	8d 86 86 c0 ff ff    	lea    -0x3f7a(%esi),%eax
400010ec:	89 04 24             	mov    %eax,(%esp)
    asm volatile ("int %2"
400010ef:	8d 86 91 c0 ff ff    	lea    -0x3f6f(%esi),%eax
400010f5:	89 44 24 04          	mov    %eax,0x4(%esp)
400010f9:	eb 27                	jmp    40001122 <smallfile+0xa2>
400010fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001100:	85 c0                	test   %eax,%eax
40001102:	75 36                	jne    4000113a <smallfile+0xba>
40001104:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40001108:	b8 06 00 00 00       	mov    $0x6,%eax
4000110d:	89 fb                	mov    %edi,%ebx
4000110f:	cd 30                	int    $0x30
        if (write(fd, "bbbbbbbbbb", 10) != 10) {
40001111:	83 fb 0a             	cmp    $0xa,%ebx
40001114:	75 6a                	jne    40001180 <smallfile+0x100>
40001116:	85 c0                	test   %eax,%eax
40001118:	75 66                	jne    40001180 <smallfile+0x100>
    for (i = 0; i < 100; i++) {
4000111a:	83 c5 01             	add    $0x1,%ebp
4000111d:	83 fd 64             	cmp    $0x64,%ebp
40001120:	74 7d                	je     4000119f <smallfile+0x11f>
40001122:	be 0a 00 00 00       	mov    $0xa,%esi
40001127:	8b 0c 24             	mov    (%esp),%ecx
4000112a:	b8 06 00 00 00       	mov    $0x6,%eax
4000112f:	89 fb                	mov    %edi,%ebx
40001131:	89 f2                	mov    %esi,%edx
40001133:	cd 30                	int    $0x30
        if (write(fd, "aaaaaaaaaa", 10) != 10) {
40001135:	83 fb 0a             	cmp    $0xa,%ebx
40001138:	74 c6                	je     40001100 <smallfile+0x80>
            printf("error: write aa %d new file failed\n", i);
4000113a:	83 ec 08             	sub    $0x8,%esp
4000113d:	55                   	push   %ebp
4000113e:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001142:	8d 83 24 cc ff ff    	lea    -0x33dc(%ebx),%eax
40001148:	50                   	push   %eax
40001149:	e8 02 f2 ff ff       	call   40000350 <printf>
            exit();
4000114e:	83 c4 10             	add    $0x10,%esp
}
40001151:	83 c4 1c             	add    $0x1c,%esp
40001154:	5b                   	pop    %ebx
40001155:	5e                   	pop    %esi
40001156:	5f                   	pop    %edi
40001157:	5d                   	pop    %ebp
40001158:	c3                   	ret
40001159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf("error: create small failed!\n");
40001160:	83 ec 0c             	sub    $0xc,%esp
40001163:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001167:	8d 83 69 c0 ff ff    	lea    -0x3f97(%ebx),%eax
4000116d:	50                   	push   %eax
4000116e:	e8 dd f1 ff ff       	call   40000350 <printf>
        exit();
40001173:	83 c4 10             	add    $0x10,%esp
}
40001176:	83 c4 1c             	add    $0x1c,%esp
40001179:	5b                   	pop    %ebx
4000117a:	5e                   	pop    %esi
4000117b:	5f                   	pop    %edi
4000117c:	5d                   	pop    %ebp
4000117d:	c3                   	ret
4000117e:	66 90                	xchg   %ax,%ax
            printf("error: write bb %d new file failed\n", i);
40001180:	83 ec 08             	sub    $0x8,%esp
40001183:	55                   	push   %ebp
40001184:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001188:	8d 83 48 cc ff ff    	lea    -0x33b8(%ebx),%eax
4000118e:	50                   	push   %eax
4000118f:	e8 bc f1 ff ff       	call   40000350 <printf>
            exit();
40001194:	83 c4 10             	add    $0x10,%esp
}
40001197:	83 c4 1c             	add    $0x1c,%esp
4000119a:	5b                   	pop    %ebx
4000119b:	5e                   	pop    %esi
4000119c:	5f                   	pop    %edi
4000119d:	5d                   	pop    %ebp
4000119e:	c3                   	ret
    printf("writes ok\n");
4000119f:	83 ec 0c             	sub    $0xc,%esp
    asm volatile ("int %2"
400011a2:	bd 04 00 00 00       	mov    $0x4,%ebp
400011a7:	8b 54 24 14          	mov    0x14(%esp),%edx
400011ab:	8d 82 9c c0 ff ff    	lea    -0x3f64(%edx),%eax
400011b1:	89 d3                	mov    %edx,%ebx
400011b3:	50                   	push   %eax
400011b4:	89 54 24 18          	mov    %edx,0x18(%esp)
400011b8:	e8 93 f1 ff ff       	call   40000350 <printf>
400011bd:	89 e8                	mov    %ebp,%eax
400011bf:	89 fb                	mov    %edi,%ebx
400011c1:	cd 30                	int    $0x30
    asm volatile ("int %2"
400011c3:	b8 03 00 00 00       	mov    $0x3,%eax
400011c8:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
400011cc:	31 c9                	xor    %ecx,%ecx
400011ce:	cd 30                	int    $0x30
400011d0:	89 df                	mov    %ebx,%edi
    if (fd >= 0) {
400011d2:	83 c4 10             	add    $0x10,%esp
400011d5:	85 db                	test   %ebx,%ebx
400011d7:	0f 88 81 00 00 00    	js     4000125e <smallfile+0x1de>
400011dd:	85 c0                	test   %eax,%eax
400011df:	75 7d                	jne    4000125e <smallfile+0x1de>
        printf("open small succeeded ok\n");
400011e1:	83 ec 0c             	sub    $0xc,%esp
400011e4:	8b 5c 24 14          	mov    0x14(%esp),%ebx
400011e8:	8d 83 a7 c0 ff ff    	lea    -0x3f59(%ebx),%eax
400011ee:	50                   	push   %eax
400011ef:	e8 5c f1 ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
400011f4:	8d 8b 4c 00 00 00    	lea    0x4c(%ebx),%ecx
400011fa:	b8 05 00 00 00       	mov    $0x5,%eax
400011ff:	89 fb                	mov    %edi,%ebx
40001201:	ba d0 07 00 00       	mov    $0x7d0,%edx
40001206:	cd 30                	int    $0x30
    if (i == 2000) {
40001208:	83 c4 10             	add    $0x10,%esp
4000120b:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
40001211:	75 66                	jne    40001279 <smallfile+0x1f9>
40001213:	85 c0                	test   %eax,%eax
40001215:	75 62                	jne    40001279 <smallfile+0x1f9>
        printf("read succeeded ok\n");
40001217:	83 ec 0c             	sub    $0xc,%esp
4000121a:	8b 5c 24 14          	mov    0x14(%esp),%ebx
4000121e:	8d 83 db c0 ff ff    	lea    -0x3f25(%ebx),%eax
40001224:	50                   	push   %eax
40001225:	89 5c 24 18          	mov    %ebx,0x18(%esp)
40001229:	e8 22 f1 ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
4000122e:	89 e8                	mov    %ebp,%eax
40001230:	89 fb                	mov    %edi,%ebx
40001232:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001234:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40001238:	89 f0                	mov    %esi,%eax
4000123a:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000123c:	83 c4 10             	add    $0x10,%esp
4000123f:	85 c0                	test   %eax,%eax
40001241:	75 51                	jne    40001294 <smallfile+0x214>
    printf("=====small file test ok=====\n\n");
40001243:	83 ec 0c             	sub    $0xc,%esp
40001246:	8b 5c 24 14          	mov    0x14(%esp),%ebx
4000124a:	8d 83 6c cc ff ff    	lea    -0x3394(%ebx),%eax
40001250:	50                   	push   %eax
40001251:	e8 fa f0 ff ff       	call   40000350 <printf>
40001256:	83 c4 10             	add    $0x10,%esp
40001259:	e9 f3 fe ff ff       	jmp    40001151 <smallfile+0xd1>
        printf("error: open small failed!\n");
4000125e:	83 ec 0c             	sub    $0xc,%esp
40001261:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001265:	8d 83 c0 c0 ff ff    	lea    -0x3f40(%ebx),%eax
4000126b:	50                   	push   %eax
4000126c:	e8 df f0 ff ff       	call   40000350 <printf>
        exit();
40001271:	83 c4 10             	add    $0x10,%esp
40001274:	e9 d8 fe ff ff       	jmp    40001151 <smallfile+0xd1>
        printf("read failed\n");
40001279:	83 ec 0c             	sub    $0xc,%esp
4000127c:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001280:	8d 83 09 c8 ff ff    	lea    -0x37f7(%ebx),%eax
40001286:	50                   	push   %eax
40001287:	e8 c4 f0 ff ff       	call   40000350 <printf>
        exit();
4000128c:	83 c4 10             	add    $0x10,%esp
4000128f:	e9 bd fe ff ff       	jmp    40001151 <smallfile+0xd1>
        printf("unlink small failed\n");
40001294:	83 ec 0c             	sub    $0xc,%esp
40001297:	8b 5c 24 14          	mov    0x14(%esp),%ebx
4000129b:	8d 83 ee c0 ff ff    	lea    -0x3f12(%ebx),%eax
400012a1:	50                   	push   %eax
400012a2:	e8 a9 f0 ff ff       	call   40000350 <printf>
        exit();
400012a7:	83 c4 10             	add    $0x10,%esp
400012aa:	e9 a2 fe ff ff       	jmp    40001151 <smallfile+0xd1>
400012af:	90                   	nop

400012b0 <bigfile1>:
{
400012b0:	55                   	push   %ebp
400012b1:	e8 fd 18 00 00       	call   40002bb3 <__x86.get_pc_thunk.bp>
400012b6:	81 c5 3e 5d 00 00    	add    $0x5d3e,%ebp
400012bc:	57                   	push   %edi
400012bd:	56                   	push   %esi
400012be:	53                   	push   %ebx
400012bf:	83 ec 28             	sub    $0x28,%esp
    printf("=====big files test=====\n");
400012c2:	8d 85 03 c1 ff ff    	lea    -0x3efd(%ebp),%eax
400012c8:	89 eb                	mov    %ebp,%ebx
400012ca:	50                   	push   %eax
400012cb:	e8 80 f0 ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
400012d0:	8d 9d 88 c1 ff ff    	lea    -0x3e78(%ebp),%ebx
400012d6:	b8 03 00 00 00       	mov    $0x3,%eax
400012db:	b9 02 02 00 00       	mov    $0x202,%ecx
400012e0:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
400012e4:	cd 30                	int    $0x30
    if (fd < 0) {
400012e6:	83 c4 10             	add    $0x10,%esp
400012e9:	85 db                	test   %ebx,%ebx
400012eb:	78 6b                	js     40001358 <bigfile1+0xa8>
400012ed:	8d 8d 4c 00 00 00    	lea    0x4c(%ebp),%ecx
    for (i = 0; i < MAXFILE; i++) {
400012f3:	31 ff                	xor    %edi,%edi
    asm volatile ("int %2"
400012f5:	ba 00 02 00 00       	mov    $0x200,%edx
400012fa:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    if (fd < 0) {
400012fe:	85 c0                	test   %eax,%eax
40001300:	75 56                	jne    40001358 <bigfile1+0xa8>
40001302:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40001306:	89 de                	mov    %ebx,%esi
40001308:	eb 19                	jmp    40001323 <bigfile1+0x73>
4000130a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if (write(fd, buf, 512) != 512) {
40001310:	81 fb 00 02 00 00    	cmp    $0x200,%ebx
40001316:	75 1e                	jne    40001336 <bigfile1+0x86>
    for (i = 0; i < MAXFILE; i++) {
40001318:	83 c7 01             	add    $0x1,%edi
4000131b:	81 ff 8c 00 00 00    	cmp    $0x8c,%edi
40001321:	74 51                	je     40001374 <bigfile1+0xc4>
        ((int *) buf)[0] = i;
40001323:	89 bd 4c 00 00 00    	mov    %edi,0x4c(%ebp)
40001329:	b8 06 00 00 00       	mov    $0x6,%eax
4000132e:	89 f3                	mov    %esi,%ebx
40001330:	cd 30                	int    $0x30
        if (write(fd, buf, 512) != 512) {
40001332:	85 c0                	test   %eax,%eax
40001334:	74 da                	je     40001310 <bigfile1+0x60>
            printf("error: write big file failed\n", i);
40001336:	83 ec 08             	sub    $0x8,%esp
40001339:	8d 85 38 c1 ff ff    	lea    -0x3ec8(%ebp),%eax
4000133f:	89 eb                	mov    %ebp,%ebx
40001341:	57                   	push   %edi
40001342:	50                   	push   %eax
40001343:	e8 08 f0 ff ff       	call   40000350 <printf>
            exit();
40001348:	83 c4 10             	add    $0x10,%esp
}
4000134b:	83 c4 1c             	add    $0x1c,%esp
4000134e:	5b                   	pop    %ebx
4000134f:	5e                   	pop    %esi
40001350:	5f                   	pop    %edi
40001351:	5d                   	pop    %ebp
40001352:	c3                   	ret
40001353:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf("error: create big failed!\n");
40001358:	83 ec 0c             	sub    $0xc,%esp
4000135b:	8d 85 1d c1 ff ff    	lea    -0x3ee3(%ebp),%eax
40001361:	89 eb                	mov    %ebp,%ebx
40001363:	50                   	push   %eax
40001364:	e8 e7 ef ff ff       	call   40000350 <printf>
        exit();
40001369:	83 c4 10             	add    $0x10,%esp
}
4000136c:	83 c4 1c             	add    $0x1c,%esp
4000136f:	5b                   	pop    %ebx
40001370:	5e                   	pop    %esi
40001371:	5f                   	pop    %edi
40001372:	5d                   	pop    %ebp
40001373:	c3                   	ret
    asm volatile ("int %2"
40001374:	b8 04 00 00 00       	mov    $0x4,%eax
40001379:	89 f3                	mov    %esi,%ebx
4000137b:	cd 30                	int    $0x30
    asm volatile ("int %2"
4000137d:	b8 03 00 00 00       	mov    $0x3,%eax
40001382:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001386:	31 c9                	xor    %ecx,%ecx
40001388:	cd 30                	int    $0x30
4000138a:	89 de                	mov    %ebx,%esi
    if (fd < 0) {
4000138c:	85 db                	test   %ebx,%ebx
4000138e:	0f 88 97 00 00 00    	js     4000142b <bigfile1+0x17b>
40001394:	85 c0                	test   %eax,%eax
40001396:	0f 85 8f 00 00 00    	jne    4000142b <bigfile1+0x17b>
    asm volatile ("int %2"
4000139c:	8b 4c 24 08          	mov    0x8(%esp),%ecx
400013a0:	b8 05 00 00 00       	mov    $0x5,%eax
400013a5:	cd 30                	int    $0x30
400013a7:	89 da                	mov    %ebx,%edx
400013a9:	89 c7                	mov    %eax,%edi
    return errno ? -1 : ret;
400013ab:	85 c0                	test   %eax,%eax
400013ad:	74 35                	je     400013e4 <bigfile1+0x134>
400013af:	e9 90 00 00 00       	jmp    40001444 <bigfile1+0x194>
400013b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        } else if (i != 512) {
400013b8:	81 fa 00 02 00 00    	cmp    $0x200,%edx
400013be:	0f 85 85 00 00 00    	jne    40001449 <bigfile1+0x199>
        if (((int *) buf)[0] != n) {
400013c4:	8b 85 4c 00 00 00    	mov    0x4c(%ebp),%eax
400013ca:	39 f8                	cmp    %edi,%eax
400013cc:	0f 85 91 00 00 00    	jne    40001463 <bigfile1+0x1b3>
        n++;
400013d2:	83 c7 01             	add    $0x1,%edi
    asm volatile ("int %2"
400013d5:	b8 05 00 00 00       	mov    $0x5,%eax
400013da:	89 f3                	mov    %esi,%ebx
400013dc:	cd 30                	int    $0x30
400013de:	89 da                	mov    %ebx,%edx
    return errno ? -1 : ret;
400013e0:	85 c0                	test   %eax,%eax
400013e2:	75 60                	jne    40001444 <bigfile1+0x194>
400013e4:	89 d0                	mov    %edx,%eax
        if (i == 0) {
400013e6:	85 d2                	test   %edx,%edx
400013e8:	75 ce                	jne    400013b8 <bigfile1+0x108>
            if (n == MAXFILE - 1) {
400013ea:	81 ff 8b 00 00 00    	cmp    $0x8b,%edi
400013f0:	0f 84 88 00 00 00    	je     4000147e <bigfile1+0x1ce>
    asm volatile ("int %2"
400013f6:	b8 04 00 00 00       	mov    $0x4,%eax
400013fb:	89 f3                	mov    %esi,%ebx
400013fd:	cd 30                	int    $0x30
    asm volatile ("int %2"
400013ff:	b8 0a 00 00 00       	mov    $0xa,%eax
40001404:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001408:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000140a:	85 c0                	test   %eax,%eax
4000140c:	0f 85 8a 00 00 00    	jne    4000149c <bigfile1+0x1ec>
    printf("=====big files ok=====\n\n");
40001412:	83 ec 0c             	sub    $0xc,%esp
40001415:	8d 85 9c c1 ff ff    	lea    -0x3e64(%ebp),%eax
4000141b:	89 eb                	mov    %ebp,%ebx
4000141d:	50                   	push   %eax
4000141e:	e8 2d ef ff ff       	call   40000350 <printf>
40001423:	83 c4 10             	add    $0x10,%esp
40001426:	e9 20 ff ff ff       	jmp    4000134b <bigfile1+0x9b>
        printf("error: open big failed!\n");
4000142b:	83 ec 0c             	sub    $0xc,%esp
4000142e:	8d 85 56 c1 ff ff    	lea    -0x3eaa(%ebp),%eax
40001434:	89 eb                	mov    %ebp,%ebx
40001436:	50                   	push   %eax
40001437:	e8 14 ef ff ff       	call   40000350 <printf>
        exit();
4000143c:	83 c4 10             	add    $0x10,%esp
4000143f:	e9 07 ff ff ff       	jmp    4000134b <bigfile1+0x9b>
    return errno ? -1 : ret;
40001444:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
            printf("read failed %d\n", i);
40001449:	83 ec 08             	sub    $0x8,%esp
4000144c:	89 eb                	mov    %ebp,%ebx
4000144e:	50                   	push   %eax
4000144f:	8d 85 8c c1 ff ff    	lea    -0x3e74(%ebp),%eax
40001455:	50                   	push   %eax
40001456:	e8 f5 ee ff ff       	call   40000350 <printf>
            exit();
4000145b:	83 c4 10             	add    $0x10,%esp
4000145e:	e9 e8 fe ff ff       	jmp    4000134b <bigfile1+0x9b>
            printf("read content of block %d is %d\n", n, ((int *) buf)[0]);
40001463:	83 ec 04             	sub    $0x4,%esp
40001466:	89 eb                	mov    %ebp,%ebx
40001468:	50                   	push   %eax
40001469:	8d 85 8c cc ff ff    	lea    -0x3374(%ebp),%eax
4000146f:	57                   	push   %edi
40001470:	50                   	push   %eax
40001471:	e8 da ee ff ff       	call   40000350 <printf>
            exit();
40001476:	83 c4 10             	add    $0x10,%esp
40001479:	e9 cd fe ff ff       	jmp    4000134b <bigfile1+0x9b>
                printf("read only %d blocks from big", n);
4000147e:	83 ec 08             	sub    $0x8,%esp
40001481:	8d 85 6f c1 ff ff    	lea    -0x3e91(%ebp),%eax
40001487:	89 eb                	mov    %ebp,%ebx
40001489:	68 8b 00 00 00       	push   $0x8b
4000148e:	50                   	push   %eax
4000148f:	e8 bc ee ff ff       	call   40000350 <printf>
                exit();
40001494:	83 c4 10             	add    $0x10,%esp
40001497:	e9 af fe ff ff       	jmp    4000134b <bigfile1+0x9b>
        printf("unlink big failed\n");
4000149c:	83 ec 0c             	sub    $0xc,%esp
4000149f:	8d 85 b5 c1 ff ff    	lea    -0x3e4b(%ebp),%eax
400014a5:	89 eb                	mov    %ebp,%ebx
400014a7:	50                   	push   %eax
400014a8:	e8 a3 ee ff ff       	call   40000350 <printf>
        exit();
400014ad:	83 c4 10             	add    $0x10,%esp
400014b0:	e9 96 fe ff ff       	jmp    4000134b <bigfile1+0x9b>
400014b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400014bc:	00 
400014bd:	8d 76 00             	lea    0x0(%esi),%esi

400014c0 <createtest>:
{
400014c0:	55                   	push   %ebp
    asm volatile ("int %2"
400014c1:	bd 03 00 00 00       	mov    $0x3,%ebp
400014c6:	57                   	push   %edi
400014c7:	e8 e3 16 00 00       	call   40002baf <__x86.get_pc_thunk.di>
400014cc:	81 c7 28 5b 00 00    	add    $0x5b28,%edi
400014d2:	56                   	push   %esi
    name[2] = '\0';
400014d3:	be 30 00 00 00       	mov    $0x30,%esi
{
400014d8:	53                   	push   %ebx
400014d9:	83 ec 28             	sub    $0x28,%esp
    printf("=====many creates, followed by unlink test=====\n");
400014dc:	8d 87 ac cc ff ff    	lea    -0x3354(%edi),%eax
400014e2:	89 fb                	mov    %edi,%ebx
400014e4:	50                   	push   %eax
400014e5:	e8 66 ee ff ff       	call   40000350 <printf>
    name[2] = '\0';
400014ea:	83 c4 10             	add    $0x10,%esp
400014ed:	8d 05 36 00 00 00    	lea    0x36,%eax
    name[0] = 'a';
400014f3:	c6 87 36 00 00 00 61 	movb   $0x61,0x36(%edi)
    name[2] = '\0';
400014fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
400014fe:	8d 97 36 00 00 00    	lea    0x36(%edi),%edx
40001504:	b9 02 02 00 00       	mov    $0x202,%ecx
40001509:	c6 87 38 00 00 00 00 	movb   $0x0,0x38(%edi)
40001510:	89 54 24 08          	mov    %edx,0x8(%esp)
40001514:	89 f2                	mov    %esi,%edx
40001516:	89 c6                	mov    %eax,%esi
40001518:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000151f:	00 
        name[1] = '0' + i;
40001520:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
40001524:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001528:	89 e8                	mov    %ebp,%eax
4000152a:	cd 30                	int    $0x30
    return errno ? -1 : fd;
4000152c:	85 c0                	test   %eax,%eax
4000152e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40001533:	0f 45 d8             	cmovne %eax,%ebx
    asm volatile ("int %2"
40001536:	b8 04 00 00 00       	mov    $0x4,%eax
4000153b:	cd 30                	int    $0x30
    for (i = 0; i < 52; i++) {
4000153d:	83 c2 01             	add    $0x1,%edx
40001540:	80 fa 64             	cmp    $0x64,%dl
40001543:	75 db                	jne    40001520 <createtest+0x60>
    name[2] = '\0';
40001545:	be 30 00 00 00       	mov    $0x30,%esi
    name[0] = 'a';
4000154a:	c6 87 36 00 00 00 61 	movb   $0x61,0x36(%edi)
40001551:	8b 54 24 08          	mov    0x8(%esp),%edx
    asm volatile ("int %2"
40001555:	bd 0a 00 00 00       	mov    $0xa,%ebp
    name[2] = '\0';
4000155a:	c6 87 38 00 00 00 00 	movb   $0x0,0x38(%edi)
40001561:	89 f1                	mov    %esi,%ecx
40001563:	8b 74 24 0c          	mov    0xc(%esp),%esi
40001567:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000156e:	00 
4000156f:	90                   	nop
        name[1] = '0' + i;
40001570:	88 4c 3e 01          	mov    %cl,0x1(%esi,%edi,1)
40001574:	89 e8                	mov    %ebp,%eax
40001576:	89 d3                	mov    %edx,%ebx
40001578:	cd 30                	int    $0x30
    for (i = 0; i < 52; i++) {
4000157a:	83 c1 01             	add    $0x1,%ecx
4000157d:	80 f9 64             	cmp    $0x64,%cl
40001580:	75 ee                	jne    40001570 <createtest+0xb0>
    printf("=====many creates, followed by unlink; ok=====\n\n");
40001582:	83 ec 0c             	sub    $0xc,%esp
40001585:	8d 87 e0 cc ff ff    	lea    -0x3320(%edi),%eax
4000158b:	89 fb                	mov    %edi,%ebx
4000158d:	50                   	push   %eax
4000158e:	e8 bd ed ff ff       	call   40000350 <printf>
}
40001593:	83 c4 2c             	add    $0x2c,%esp
40001596:	5b                   	pop    %ebx
40001597:	5e                   	pop    %esi
40001598:	5f                   	pop    %edi
40001599:	5d                   	pop    %ebp
4000159a:	c3                   	ret
4000159b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

400015a0 <rmdot>:
{
400015a0:	57                   	push   %edi
400015a1:	56                   	push   %esi
400015a2:	e8 04 16 00 00       	call   40002bab <__x86.get_pc_thunk.si>
400015a7:	81 c6 4d 5a 00 00    	add    $0x5a4d,%esi
400015ad:	53                   	push   %ebx
    printf("=====rmdot test=====\n");
400015ae:	83 ec 0c             	sub    $0xc,%esp
400015b1:	8d 86 c8 c1 ff ff    	lea    -0x3e38(%esi),%eax
400015b7:	89 f3                	mov    %esi,%ebx
400015b9:	50                   	push   %eax
400015ba:	e8 91 ed ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
400015bf:	8d 96 de c1 ff ff    	lea    -0x3e22(%esi),%edx
400015c5:	b8 07 00 00 00       	mov    $0x7,%eax
400015ca:	89 d3                	mov    %edx,%ebx
400015cc:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400015ce:	83 c4 10             	add    $0x10,%esp
400015d1:	85 c0                	test   %eax,%eax
400015d3:	75 3b                	jne    40001610 <rmdot+0x70>
    asm volatile ("int %2"
400015d5:	b9 08 00 00 00       	mov    $0x8,%ecx
400015da:	89 d3                	mov    %edx,%ebx
400015dc:	89 c8                	mov    %ecx,%eax
400015de:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400015e0:	85 c0                	test   %eax,%eax
400015e2:	75 4c                	jne    40001630 <rmdot+0x90>
    asm volatile ("int %2"
400015e4:	bf 0a 00 00 00       	mov    $0xa,%edi
400015e9:	8d 9e 14 c5 ff ff    	lea    -0x3aec(%esi),%ebx
400015ef:	89 f8                	mov    %edi,%eax
400015f1:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400015f3:	85 c0                	test   %eax,%eax
400015f5:	75 59                	jne    40001650 <rmdot+0xb0>
        printf("rm . worked!\n");
400015f7:	83 ec 0c             	sub    $0xc,%esp
400015fa:	8d 86 09 c2 ff ff    	lea    -0x3df7(%esi),%eax
40001600:	89 f3                	mov    %esi,%ebx
40001602:	50                   	push   %eax
40001603:	e8 48 ed ff ff       	call   40000350 <printf>
        exit();
40001608:	83 c4 10             	add    $0x10,%esp
}
4000160b:	5b                   	pop    %ebx
4000160c:	5e                   	pop    %esi
4000160d:	5f                   	pop    %edi
4000160e:	c3                   	ret
4000160f:	90                   	nop
        printf("mkdir dots failed\n");
40001610:	83 ec 0c             	sub    $0xc,%esp
40001613:	8d 86 e3 c1 ff ff    	lea    -0x3e1d(%esi),%eax
40001619:	89 f3                	mov    %esi,%ebx
4000161b:	50                   	push   %eax
4000161c:	e8 2f ed ff ff       	call   40000350 <printf>
        exit();
40001621:	83 c4 10             	add    $0x10,%esp
40001624:	eb e5                	jmp    4000160b <rmdot+0x6b>
40001626:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000162d:	00 
4000162e:	66 90                	xchg   %ax,%ax
        printf("chdir dots failed\n");
40001630:	83 ec 0c             	sub    $0xc,%esp
40001633:	8d 86 f6 c1 ff ff    	lea    -0x3e0a(%esi),%eax
40001639:	89 f3                	mov    %esi,%ebx
4000163b:	50                   	push   %eax
4000163c:	e8 0f ed ff ff       	call   40000350 <printf>
        exit();
40001641:	83 c4 10             	add    $0x10,%esp
40001644:	eb c5                	jmp    4000160b <rmdot+0x6b>
40001646:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000164d:	00 
4000164e:	66 90                	xchg   %ax,%ax
    asm volatile ("int %2"
40001650:	8d 9e 13 c5 ff ff    	lea    -0x3aed(%esi),%ebx
40001656:	89 f8                	mov    %edi,%eax
40001658:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000165a:	85 c0                	test   %eax,%eax
4000165c:	75 16                	jne    40001674 <rmdot+0xd4>
        printf("rm .. worked!\n");
4000165e:	83 ec 0c             	sub    $0xc,%esp
40001661:	8d 86 17 c2 ff ff    	lea    -0x3de9(%esi),%eax
40001667:	89 f3                	mov    %esi,%ebx
40001669:	50                   	push   %eax
4000166a:	e8 e1 ec ff ff       	call   40000350 <printf>
        exit();
4000166f:	83 c4 10             	add    $0x10,%esp
40001672:	eb 97                	jmp    4000160b <rmdot+0x6b>
    asm volatile ("int %2"
40001674:	8d 9e 26 c2 ff ff    	lea    -0x3dda(%esi),%ebx
4000167a:	89 c8                	mov    %ecx,%eax
4000167c:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000167e:	85 c0                	test   %eax,%eax
40001680:	75 27                	jne    400016a9 <rmdot+0x109>
    asm volatile ("int %2"
40001682:	8d 9e 28 c2 ff ff    	lea    -0x3dd8(%esi),%ebx
40001688:	89 f8                	mov    %edi,%eax
4000168a:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000168c:	85 c0                	test   %eax,%eax
4000168e:	75 32                	jne    400016c2 <rmdot+0x122>
        printf("unlink dots/. worked!\n");
40001690:	83 ec 0c             	sub    $0xc,%esp
40001693:	8d 86 41 c2 ff ff    	lea    -0x3dbf(%esi),%eax
40001699:	89 f3                	mov    %esi,%ebx
4000169b:	50                   	push   %eax
4000169c:	e8 af ec ff ff       	call   40000350 <printf>
        exit();
400016a1:	83 c4 10             	add    $0x10,%esp
400016a4:	e9 62 ff ff ff       	jmp    4000160b <rmdot+0x6b>
        printf("chdir '/' failed\n");
400016a9:	83 ec 0c             	sub    $0xc,%esp
400016ac:	8d 86 2f c2 ff ff    	lea    -0x3dd1(%esi),%eax
400016b2:	89 f3                	mov    %esi,%ebx
400016b4:	50                   	push   %eax
400016b5:	e8 96 ec ff ff       	call   40000350 <printf>
        exit();
400016ba:	83 c4 10             	add    $0x10,%esp
400016bd:	e9 49 ff ff ff       	jmp    4000160b <rmdot+0x6b>
    asm volatile ("int %2"
400016c2:	8d 9e 58 c2 ff ff    	lea    -0x3da8(%esi),%ebx
400016c8:	89 f8                	mov    %edi,%eax
400016ca:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400016cc:	85 c0                	test   %eax,%eax
400016ce:	75 19                	jne    400016e9 <rmdot+0x149>
        printf("unlink dots/.. worked!\n");
400016d0:	83 ec 0c             	sub    $0xc,%esp
400016d3:	8d 86 60 c2 ff ff    	lea    -0x3da0(%esi),%eax
400016d9:	89 f3                	mov    %esi,%ebx
400016db:	50                   	push   %eax
400016dc:	e8 6f ec ff ff       	call   40000350 <printf>
        exit();
400016e1:	83 c4 10             	add    $0x10,%esp
400016e4:	e9 22 ff ff ff       	jmp    4000160b <rmdot+0x6b>
    asm volatile ("int %2"
400016e9:	89 f8                	mov    %edi,%eax
400016eb:	89 d3                	mov    %edx,%ebx
400016ed:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400016ef:	85 c0                	test   %eax,%eax
400016f1:	75 19                	jne    4000170c <rmdot+0x16c>
    printf("=====rmdot ok=====\n\n");
400016f3:	83 ec 0c             	sub    $0xc,%esp
400016f6:	8d 86 78 c2 ff ff    	lea    -0x3d88(%esi),%eax
400016fc:	89 f3                	mov    %esi,%ebx
400016fe:	50                   	push   %eax
400016ff:	e8 4c ec ff ff       	call   40000350 <printf>
40001704:	83 c4 10             	add    $0x10,%esp
40001707:	e9 ff fe ff ff       	jmp    4000160b <rmdot+0x6b>
        printf("unlink dots failed!\n");
4000170c:	83 ec 0c             	sub    $0xc,%esp
4000170f:	8d 86 8d c2 ff ff    	lea    -0x3d73(%esi),%eax
40001715:	89 f3                	mov    %esi,%ebx
40001717:	50                   	push   %eax
40001718:	e8 33 ec ff ff       	call   40000350 <printf>
        exit();
4000171d:	83 c4 10             	add    $0x10,%esp
40001720:	e9 e6 fe ff ff       	jmp    4000160b <rmdot+0x6b>
40001725:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000172c:	00 
4000172d:	8d 76 00             	lea    0x0(%esi),%esi

40001730 <fourteen>:
{
40001730:	55                   	push   %ebp
40001731:	57                   	push   %edi
40001732:	56                   	push   %esi
40001733:	e8 73 14 00 00       	call   40002bab <__x86.get_pc_thunk.si>
40001738:	81 c6 bc 58 00 00    	add    $0x58bc,%esi
4000173e:	53                   	push   %ebx
4000173f:	83 ec 28             	sub    $0x28,%esp
    printf("=====fourteen test=====\n");
40001742:	8d 86 a2 c2 ff ff    	lea    -0x3d5e(%esi),%eax
40001748:	89 f3                	mov    %esi,%ebx
4000174a:	50                   	push   %eax
4000174b:	e8 00 ec ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
40001750:	ba 07 00 00 00       	mov    $0x7,%edx
40001755:	8d 9e e7 c2 ff ff    	lea    -0x3d19(%esi),%ebx
4000175b:	89 d0                	mov    %edx,%eax
4000175d:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000175f:	83 c4 10             	add    $0x10,%esp
40001762:	85 c0                	test   %eax,%eax
40001764:	0f 85 ee 00 00 00    	jne    40001858 <fourteen+0x128>
    asm volatile ("int %2"
4000176a:	8d 9e 14 cd ff ff    	lea    -0x32ec(%esi),%ebx
40001770:	89 d0                	mov    %edx,%eax
40001772:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40001776:	cd 30                	int    $0x30
40001778:	89 c5                	mov    %eax,%ebp
    return errno ? -1 : 0;
4000177a:	85 c0                	test   %eax,%eax
4000177c:	0f 85 f6 00 00 00    	jne    40001878 <fourteen+0x148>
    asm volatile ("int %2"
40001782:	bf 03 00 00 00       	mov    $0x3,%edi
40001787:	8d 9e 34 cd ff ff    	lea    -0x32cc(%esi),%ebx
4000178d:	b9 00 02 00 00       	mov    $0x200,%ecx
40001792:	89 f8                	mov    %edi,%eax
40001794:	cd 30                	int    $0x30
    if (fd < 0) {
40001796:	85 db                	test   %ebx,%ebx
40001798:	78 56                	js     400017f0 <fourteen+0xc0>
4000179a:	85 c0                	test   %eax,%eax
4000179c:	75 52                	jne    400017f0 <fourteen+0xc0>
    asm volatile ("int %2"
4000179e:	b8 04 00 00 00       	mov    $0x4,%eax
400017a3:	cd 30                	int    $0x30
    asm volatile ("int %2"
400017a5:	8d 9e d4 cd ff ff    	lea    -0x322c(%esi),%ebx
400017ab:	89 f8                	mov    %edi,%eax
400017ad:	89 e9                	mov    %ebp,%ecx
400017af:	cd 30                	int    $0x30
    if (fd < 0) {
400017b1:	85 db                	test   %ebx,%ebx
400017b3:	78 5b                	js     40001810 <fourteen+0xe0>
400017b5:	85 c0                	test   %eax,%eax
400017b7:	75 57                	jne    40001810 <fourteen+0xe0>
    asm volatile ("int %2"
400017b9:	b8 04 00 00 00       	mov    $0x4,%eax
400017be:	cd 30                	int    $0x30
    asm volatile ("int %2"
400017c0:	8d 9e d8 c2 ff ff    	lea    -0x3d28(%esi),%ebx
400017c6:	89 d0                	mov    %edx,%eax
400017c8:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400017ca:	85 c0                	test   %eax,%eax
400017cc:	75 62                	jne    40001830 <fourteen+0x100>
        printf("mkdir 12345678901234/12345678901234 succeeded!\n");
400017ce:	83 ec 0c             	sub    $0xc,%esp
400017d1:	8d 86 40 ce ff ff    	lea    -0x31c0(%esi),%eax
400017d7:	89 f3                	mov    %esi,%ebx
400017d9:	50                   	push   %eax
400017da:	e8 71 eb ff ff       	call   40000350 <printf>
        exit();
400017df:	83 c4 10             	add    $0x10,%esp
}
400017e2:	83 c4 1c             	add    $0x1c,%esp
400017e5:	5b                   	pop    %ebx
400017e6:	5e                   	pop    %esi
400017e7:	5f                   	pop    %edi
400017e8:	5d                   	pop    %ebp
400017e9:	c3                   	ret
400017ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf
400017f0:	83 ec 0c             	sub    $0xc,%esp
400017f3:	8d 86 94 cd ff ff    	lea    -0x326c(%esi),%eax
400017f9:	89 f3                	mov    %esi,%ebx
400017fb:	50                   	push   %eax
400017fc:	e8 4f eb ff ff       	call   40000350 <printf>
        exit();
40001801:	83 c4 10             	add    $0x10,%esp
}
40001804:	83 c4 1c             	add    $0x1c,%esp
40001807:	5b                   	pop    %ebx
40001808:	5e                   	pop    %esi
40001809:	5f                   	pop    %edi
4000180a:	5d                   	pop    %ebp
4000180b:	c3                   	ret
4000180c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf
40001810:	83 ec 0c             	sub    $0xc,%esp
40001813:	8d 86 04 ce ff ff    	lea    -0x31fc(%esi),%eax
40001819:	89 f3                	mov    %esi,%ebx
4000181b:	50                   	push   %eax
4000181c:	e8 2f eb ff ff       	call   40000350 <printf>
        exit();
40001821:	83 c4 10             	add    $0x10,%esp
}
40001824:	83 c4 1c             	add    $0x1c,%esp
40001827:	5b                   	pop    %ebx
40001828:	5e                   	pop    %esi
40001829:	5f                   	pop    %edi
4000182a:	5d                   	pop    %ebp
4000182b:	c3                   	ret
4000182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    asm volatile ("int %2"
40001830:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001834:	89 d0                	mov    %edx,%eax
40001836:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001838:	85 c0                	test   %eax,%eax
4000183a:	75 55                	jne    40001891 <fourteen+0x161>
        printf("mkdir 12345678901234/123456789012345 succeeded!\n");
4000183c:	83 ec 0c             	sub    $0xc,%esp
4000183f:	8d 86 70 ce ff ff    	lea    -0x3190(%esi),%eax
40001845:	89 f3                	mov    %esi,%ebx
40001847:	50                   	push   %eax
40001848:	e8 03 eb ff ff       	call   40000350 <printf>
        exit();
4000184d:	83 c4 10             	add    $0x10,%esp
40001850:	eb 90                	jmp    400017e2 <fourteen+0xb2>
40001852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printf("mkdir 12345678901234 failed\n");
40001858:	83 ec 0c             	sub    $0xc,%esp
4000185b:	8d 86 bb c2 ff ff    	lea    -0x3d45(%esi),%eax
40001861:	89 f3                	mov    %esi,%ebx
40001863:	50                   	push   %eax
40001864:	e8 e7 ea ff ff       	call   40000350 <printf>
        exit();
40001869:	83 c4 10             	add    $0x10,%esp
4000186c:	e9 71 ff ff ff       	jmp    400017e2 <fourteen+0xb2>
40001871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf("mkdir 12345678901234/123456789012345 failed\n");
40001878:	83 ec 0c             	sub    $0xc,%esp
4000187b:	8d 86 64 cd ff ff    	lea    -0x329c(%esi),%eax
40001881:	89 f3                	mov    %esi,%ebx
40001883:	50                   	push   %eax
40001884:	e8 c7 ea ff ff       	call   40000350 <printf>
        exit();
40001889:	83 c4 10             	add    $0x10,%esp
4000188c:	e9 51 ff ff ff       	jmp    400017e2 <fourteen+0xb2>
    printf("=====fourteen ok=====\n\n");
40001891:	83 ec 0c             	sub    $0xc,%esp
40001894:	8d 86 f6 c2 ff ff    	lea    -0x3d0a(%esi),%eax
4000189a:	89 f3                	mov    %esi,%ebx
4000189c:	50                   	push   %eax
4000189d:	e8 ae ea ff ff       	call   40000350 <printf>
400018a2:	83 c4 10             	add    $0x10,%esp
400018a5:	e9 38 ff ff ff       	jmp    400017e2 <fourteen+0xb2>
400018aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

400018b0 <bigfile2>:
{
400018b0:	55                   	push   %ebp
400018b1:	57                   	push   %edi
400018b2:	56                   	push   %esi
400018b3:	e8 f3 12 00 00       	call   40002bab <__x86.get_pc_thunk.si>
400018b8:	81 c6 3c 57 00 00    	add    $0x573c,%esi
400018be:	53                   	push   %ebx
400018bf:	83 ec 28             	sub    $0x28,%esp
    printf("=====bigfile test=====\n");
400018c2:	8d 86 0e c3 ff ff    	lea    -0x3cf2(%esi),%eax
400018c8:	89 f3                	mov    %esi,%ebx
400018ca:	50                   	push   %eax
400018cb:	e8 80 ea ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
400018d0:	8d 9e 34 c3 ff ff    	lea    -0x3ccc(%esi),%ebx
400018d6:	b8 0a 00 00 00       	mov    $0xa,%eax
400018db:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
400018df:	89 df                	mov    %ebx,%edi
400018e1:	cd 30                	int    $0x30
    asm volatile ("int %2"
400018e3:	b8 03 00 00 00       	mov    $0x3,%eax
400018e8:	b9 02 02 00 00       	mov    $0x202,%ecx
400018ed:	89 fb                	mov    %edi,%ebx
400018ef:	cd 30                	int    $0x30
    return errno ? -1 : fd;
400018f1:	83 c4 10             	add    $0x10,%esp
    if (fd < 0) {
400018f4:	85 c0                	test   %eax,%eax
400018f6:	0f 85 44 01 00 00    	jne    40001a40 <bigfile2+0x190>
    for (i = 0; i < 20; i++) {
400018fc:	31 ff                	xor    %edi,%edi
400018fe:	8d ae 4c 00 00 00    	lea    0x4c(%esi),%ebp
    if (fd < 0) {
40001904:	85 db                	test   %ebx,%ebx
40001906:	0f 88 34 01 00 00    	js     40001a40 <bigfile2+0x190>
4000190c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
        memset(buf, i, 600);
40001910:	83 ec 04             	sub    $0x4,%esp
40001913:	89 f3                	mov    %esi,%ebx
40001915:	68 58 02 00 00       	push   $0x258
4000191a:	57                   	push   %edi
4000191b:	55                   	push   %ebp
4000191c:	e8 ef f5 ff ff       	call   40000f10 <memset>
    asm volatile ("int %2"
40001921:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001925:	b8 06 00 00 00       	mov    $0x6,%eax
4000192a:	89 e9                	mov    %ebp,%ecx
4000192c:	ba 58 02 00 00       	mov    $0x258,%edx
40001931:	cd 30                	int    $0x30
        if (write(fd, buf, 600) != 600) {
40001933:	83 c4 10             	add    $0x10,%esp
40001936:	81 fb 58 02 00 00    	cmp    $0x258,%ebx
4000193c:	0f 85 de 00 00 00    	jne    40001a20 <bigfile2+0x170>
40001942:	85 c0                	test   %eax,%eax
40001944:	0f 85 d6 00 00 00    	jne    40001a20 <bigfile2+0x170>
    for (i = 0; i < 20; i++) {
4000194a:	83 c7 01             	add    $0x1,%edi
4000194d:	83 ff 14             	cmp    $0x14,%edi
40001950:	75 be                	jne    40001910 <bigfile2+0x60>
    asm volatile ("int %2"
40001952:	8b 54 24 04          	mov    0x4(%esp),%edx
40001956:	b8 04 00 00 00       	mov    $0x4,%eax
4000195b:	89 d3                	mov    %edx,%ebx
4000195d:	cd 30                	int    $0x30
    asm volatile ("int %2"
4000195f:	b8 03 00 00 00       	mov    $0x3,%eax
40001964:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001968:	31 c9                	xor    %ecx,%ecx
4000196a:	cd 30                	int    $0x30
4000196c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    if (fd < 0) {
40001970:	85 db                	test   %ebx,%ebx
40001972:	0f 88 e8 00 00 00    	js     40001a60 <bigfile2+0x1b0>
40001978:	85 c0                	test   %eax,%eax
4000197a:	0f 85 e0 00 00 00    	jne    40001a60 <bigfile2+0x1b0>
    asm volatile ("int %2"
40001980:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001984:	b8 05 00 00 00       	mov    $0x5,%eax
40001989:	ba 2c 01 00 00       	mov    $0x12c,%edx
4000198e:	89 e9                	mov    %ebp,%ecx
40001990:	cd 30                	int    $0x30
40001992:	89 da                	mov    %ebx,%edx
40001994:	89 c1                	mov    %eax,%ecx
    return errno ? -1 : ret;
40001996:	85 c0                	test   %eax,%eax
40001998:	75 68                	jne    40001a02 <bigfile2+0x152>
        if (buf[0] != i / 2 || buf[299] != i / 2) {
4000199a:	8d 05 4c 00 00 00    	lea    0x4c,%eax
    asm volatile ("int %2"
400019a0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    for (i = 0;; i++) {
400019a4:	31 ff                	xor    %edi,%edi
400019a6:	89 e9                	mov    %ebp,%ecx
400019a8:	89 c5                	mov    %eax,%ebp
400019aa:	eb 52                	jmp    400019fe <bigfile2+0x14e>
400019ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (cc == 0)
400019b0:	0f 84 e0 00 00 00    	je     40001a96 <bigfile2+0x1e6>
        if (cc != 300) {
400019b6:	81 fa 2c 01 00 00    	cmp    $0x12c,%edx
400019bc:	0f 85 04 01 00 00    	jne    40001ac6 <bigfile2+0x216>
        if (buf[0] != i / 2 || buf[299] != i / 2) {
400019c2:	89 fb                	mov    %edi,%ebx
400019c4:	0f be 04 2e          	movsbl (%esi,%ebp,1),%eax
400019c8:	d1 fb                	sar    $1,%ebx
400019ca:	39 d8                	cmp    %ebx,%eax
400019cc:	0f 85 ae 00 00 00    	jne    40001a80 <bigfile2+0x1d0>
400019d2:	0f be 9c 2e 2b 01 00 	movsbl 0x12b(%esi,%ebp,1),%ebx
400019d9:	00 
400019da:	39 d8                	cmp    %ebx,%eax
400019dc:	0f 85 9e 00 00 00    	jne    40001a80 <bigfile2+0x1d0>
        total += cc;
400019e2:	81 44 24 08 2c 01 00 	addl   $0x12c,0x8(%esp)
400019e9:	00 
400019ea:	8b 5c 24 04          	mov    0x4(%esp),%ebx
    for (i = 0;; i++) {
400019ee:	83 c7 01             	add    $0x1,%edi
400019f1:	b8 05 00 00 00       	mov    $0x5,%eax
400019f6:	cd 30                	int    $0x30
400019f8:	89 da                	mov    %ebx,%edx
    return errno ? -1 : ret;
400019fa:	85 c0                	test   %eax,%eax
400019fc:	75 04                	jne    40001a02 <bigfile2+0x152>
        if (cc < 0) {
400019fe:	85 d2                	test   %edx,%edx
40001a00:	79 ae                	jns    400019b0 <bigfile2+0x100>
            printf("read bigfile failed\n");
40001a02:	83 ec 0c             	sub    $0xc,%esp
40001a05:	8d 86 67 c3 ff ff    	lea    -0x3c99(%esi),%eax
40001a0b:	89 f3                	mov    %esi,%ebx
40001a0d:	50                   	push   %eax
40001a0e:	e8 3d e9 ff ff       	call   40000350 <printf>
            exit();
40001a13:	83 c4 10             	add    $0x10,%esp
40001a16:	eb 1c                	jmp    40001a34 <bigfile2+0x184>
40001a18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001a1f:	00 
            printf("write bigfile failed\n");
40001a20:	83 ec 0c             	sub    $0xc,%esp
40001a23:	8d 86 3c c3 ff ff    	lea    -0x3cc4(%esi),%eax
40001a29:	89 f3                	mov    %esi,%ebx
40001a2b:	50                   	push   %eax
40001a2c:	e8 1f e9 ff ff       	call   40000350 <printf>
            exit();
40001a31:	83 c4 10             	add    $0x10,%esp
}
40001a34:	83 c4 1c             	add    $0x1c,%esp
40001a37:	5b                   	pop    %ebx
40001a38:	5e                   	pop    %esi
40001a39:	5f                   	pop    %edi
40001a3a:	5d                   	pop    %ebp
40001a3b:	c3                   	ret
40001a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("cannot create bigfile");
40001a40:	83 ec 0c             	sub    $0xc,%esp
40001a43:	8d 86 26 c3 ff ff    	lea    -0x3cda(%esi),%eax
40001a49:	89 f3                	mov    %esi,%ebx
40001a4b:	50                   	push   %eax
40001a4c:	e8 ff e8 ff ff       	call   40000350 <printf>
        exit();
40001a51:	83 c4 10             	add    $0x10,%esp
}
40001a54:	83 c4 1c             	add    $0x1c,%esp
40001a57:	5b                   	pop    %ebx
40001a58:	5e                   	pop    %esi
40001a59:	5f                   	pop    %edi
40001a5a:	5d                   	pop    %ebp
40001a5b:	c3                   	ret
40001a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("cannot open bigfile\n");
40001a60:	83 ec 0c             	sub    $0xc,%esp
40001a63:	8d 86 52 c3 ff ff    	lea    -0x3cae(%esi),%eax
40001a69:	89 f3                	mov    %esi,%ebx
40001a6b:	50                   	push   %eax
40001a6c:	e8 df e8 ff ff       	call   40000350 <printf>
        exit();
40001a71:	83 c4 10             	add    $0x10,%esp
40001a74:	eb be                	jmp    40001a34 <bigfile2+0x184>
40001a76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001a7d:	00 
40001a7e:	66 90                	xchg   %ax,%ax
            printf("read bigfile wrong data\n");
40001a80:	83 ec 0c             	sub    $0xc,%esp
40001a83:	8d 86 90 c3 ff ff    	lea    -0x3c70(%esi),%eax
40001a89:	89 f3                	mov    %esi,%ebx
40001a8b:	50                   	push   %eax
40001a8c:	e8 bf e8 ff ff       	call   40000350 <printf>
            exit();
40001a91:	83 c4 10             	add    $0x10,%esp
40001a94:	eb 9e                	jmp    40001a34 <bigfile2+0x184>
    asm volatile ("int %2"
40001a96:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40001a9a:	8b 5c 24 04          	mov    0x4(%esp),%ebx
40001a9e:	b8 04 00 00 00       	mov    $0x4,%eax
40001aa3:	cd 30                	int    $0x30
    if (total != 20 * 600) {
40001aa5:	81 f9 e0 2e 00 00    	cmp    $0x2ee0,%ecx
40001aab:	74 32                	je     40001adf <bigfile2+0x22f>
        printf("read bigfile wrong total\n");
40001aad:	83 ec 0c             	sub    $0xc,%esp
40001ab0:	8d 86 a9 c3 ff ff    	lea    -0x3c57(%esi),%eax
40001ab6:	89 f3                	mov    %esi,%ebx
40001ab8:	50                   	push   %eax
40001ab9:	e8 92 e8 ff ff       	call   40000350 <printf>
        exit();
40001abe:	83 c4 10             	add    $0x10,%esp
40001ac1:	e9 6e ff ff ff       	jmp    40001a34 <bigfile2+0x184>
            printf("short read bigfile\n");
40001ac6:	83 ec 0c             	sub    $0xc,%esp
40001ac9:	8d 86 7c c3 ff ff    	lea    -0x3c84(%esi),%eax
40001acf:	89 f3                	mov    %esi,%ebx
40001ad1:	50                   	push   %eax
40001ad2:	e8 79 e8 ff ff       	call   40000350 <printf>
            exit();
40001ad7:	83 c4 10             	add    $0x10,%esp
40001ada:	e9 55 ff ff ff       	jmp    40001a34 <bigfile2+0x184>
    asm volatile ("int %2"
40001adf:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40001ae3:	b8 0a 00 00 00       	mov    $0xa,%eax
40001ae8:	cd 30                	int    $0x30
    printf("=====bigfile test ok=====\n\n");
40001aea:	83 ec 0c             	sub    $0xc,%esp
40001aed:	8d 86 c3 c3 ff ff    	lea    -0x3c3d(%esi),%eax
40001af3:	89 f3                	mov    %esi,%ebx
40001af5:	50                   	push   %eax
40001af6:	e8 55 e8 ff ff       	call   40000350 <printf>
40001afb:	83 c4 10             	add    $0x10,%esp
40001afe:	e9 31 ff ff ff       	jmp    40001a34 <bigfile2+0x184>
40001b03:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001b0a:	00 
40001b0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001b10 <subdir>:
{
40001b10:	55                   	push   %ebp
40001b11:	57                   	push   %edi
40001b12:	56                   	push   %esi
40001b13:	e8 93 10 00 00       	call   40002bab <__x86.get_pc_thunk.si>
40001b18:	81 c6 dc 54 00 00    	add    $0x54dc,%esi
40001b1e:	53                   	push   %ebx
40001b1f:	83 ec 38             	sub    $0x38,%esp
    printf("=====subdir test=====\n");
40001b22:	8d 86 df c3 ff ff    	lea    -0x3c21(%esi),%eax
40001b28:	89 f3                	mov    %esi,%ebx
40001b2a:	8d ae 71 c4 ff ff    	lea    -0x3b8f(%esi),%ebp
40001b30:	50                   	push   %eax
40001b31:	e8 1a e8 ff ff       	call   40000350 <printf>
40001b36:	b8 0a 00 00 00       	mov    $0xa,%eax
40001b3b:	89 eb                	mov    %ebp,%ebx
40001b3d:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001b3f:	8d 9e f4 c4 ff ff    	lea    -0x3b0c(%esi),%ebx
40001b45:	b8 07 00 00 00       	mov    $0x7,%eax
40001b4a:	89 5c 24 18          	mov    %ebx,0x18(%esp)
40001b4e:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001b50:	83 c4 10             	add    $0x10,%esp
40001b53:	85 c0                	test   %eax,%eax
40001b55:	0f 85 85 00 00 00    	jne    40001be0 <subdir+0xd0>
    asm volatile ("int %2"
40001b5b:	8d 9e 2c c4 ff ff    	lea    -0x3bd4(%esi),%ebx
40001b61:	b8 03 00 00 00       	mov    $0x3,%eax
40001b66:	b9 02 02 00 00       	mov    $0x202,%ecx
40001b6b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40001b6f:	cd 30                	int    $0x30
40001b71:	89 df                	mov    %ebx,%edi
    if (fd < 0) {
40001b73:	85 c0                	test   %eax,%eax
40001b75:	75 49                	jne    40001bc0 <subdir+0xb0>
40001b77:	85 db                	test   %ebx,%ebx
40001b79:	78 45                	js     40001bc0 <subdir+0xb0>
    asm volatile ("int %2"
40001b7b:	ba 02 00 00 00       	mov    $0x2,%edx
40001b80:	b8 06 00 00 00       	mov    $0x6,%eax
40001b85:	89 e9                	mov    %ebp,%ecx
40001b87:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001b89:	bd 04 00 00 00       	mov    $0x4,%ebp
40001b8e:	89 fb                	mov    %edi,%ebx
40001b90:	89 e8                	mov    %ebp,%eax
40001b92:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001b94:	b8 0a 00 00 00       	mov    $0xa,%eax
40001b99:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001b9d:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001b9f:	85 c0                	test   %eax,%eax
40001ba1:	75 5d                	jne    40001c00 <subdir+0xf0>
        printf("unlink dd (non-empty dir) succeeded!\n");
40001ba3:	83 ec 0c             	sub    $0xc,%esp
40001ba6:	8d 86 a4 ce ff ff    	lea    -0x315c(%esi),%eax
40001bac:	89 f3                	mov    %esi,%ebx
40001bae:	50                   	push   %eax
40001baf:	e8 9c e7 ff ff       	call   40000350 <printf>
        exit();
40001bb4:	83 c4 10             	add    $0x10,%esp
}
40001bb7:	83 c4 2c             	add    $0x2c,%esp
40001bba:	5b                   	pop    %ebx
40001bbb:	5e                   	pop    %esi
40001bbc:	5f                   	pop    %edi
40001bbd:	5d                   	pop    %ebp
40001bbe:	c3                   	ret
40001bbf:	90                   	nop
        printf("create dd/ff failed\n");
40001bc0:	83 ec 0c             	sub    $0xc,%esp
40001bc3:	8d 86 0e c4 ff ff    	lea    -0x3bf2(%esi),%eax
40001bc9:	89 f3                	mov    %esi,%ebx
40001bcb:	50                   	push   %eax
40001bcc:	e8 7f e7 ff ff       	call   40000350 <printf>
        exit();
40001bd1:	83 c4 10             	add    $0x10,%esp
}
40001bd4:	83 c4 2c             	add    $0x2c,%esp
40001bd7:	5b                   	pop    %ebx
40001bd8:	5e                   	pop    %esi
40001bd9:	5f                   	pop    %edi
40001bda:	5d                   	pop    %ebp
40001bdb:	c3                   	ret
40001bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("subdir mkdir dd failed\n");
40001be0:	83 ec 0c             	sub    $0xc,%esp
40001be3:	8d 86 f6 c3 ff ff    	lea    -0x3c0a(%esi),%eax
40001be9:	89 f3                	mov    %esi,%ebx
40001beb:	50                   	push   %eax
40001bec:	e8 5f e7 ff ff       	call   40000350 <printf>
        exit();
40001bf1:	83 c4 10             	add    $0x10,%esp
40001bf4:	eb c1                	jmp    40001bb7 <subdir+0xa7>
40001bf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001bfd:	00 
40001bfe:	66 90                	xchg   %ax,%ax
    asm volatile ("int %2"
40001c00:	8d 9e 23 c4 ff ff    	lea    -0x3bdd(%esi),%ebx
40001c06:	b8 07 00 00 00       	mov    $0x7,%eax
40001c0b:	89 5c 24 18          	mov    %ebx,0x18(%esp)
40001c0f:	cd 30                	int    $0x30
40001c11:	89 44 24 10          	mov    %eax,0x10(%esp)
    return errno ? -1 : 0;
40001c15:	85 c0                	test   %eax,%eax
40001c17:	0f 85 e0 02 00 00    	jne    40001efd <subdir+0x3ed>
    asm volatile ("int %2"
40001c1d:	8d 9e 29 c4 ff ff    	lea    -0x3bd7(%esi),%ebx
40001c23:	b8 03 00 00 00       	mov    $0x3,%eax
40001c28:	b9 02 02 00 00       	mov    $0x202,%ecx
40001c2d:	89 5c 24 14          	mov    %ebx,0x14(%esp)
40001c31:	cd 30                	int    $0x30
40001c33:	89 df                	mov    %ebx,%edi
    if (fd < 0) {
40001c35:	85 db                	test   %ebx,%ebx
40001c37:	0f 88 5c 02 00 00    	js     40001e99 <subdir+0x389>
40001c3d:	85 c0                	test   %eax,%eax
40001c3f:	0f 85 54 02 00 00    	jne    40001e99 <subdir+0x389>
    asm volatile ("int %2"
40001c45:	8d 8e 65 c4 ff ff    	lea    -0x3b9b(%esi),%ecx
40001c4b:	b8 06 00 00 00       	mov    $0x6,%eax
40001c50:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001c52:	89 e8                	mov    %ebp,%eax
40001c54:	89 fb                	mov    %edi,%ebx
40001c56:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001c58:	b8 03 00 00 00       	mov    $0x3,%eax
40001c5d:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40001c61:	8d 9e 68 c4 ff ff    	lea    -0x3b98(%esi),%ebx
40001c67:	cd 30                	int    $0x30
40001c69:	89 dd                	mov    %ebx,%ebp
    if (fd < 0) {
40001c6b:	85 db                	test   %ebx,%ebx
40001c6d:	0f 88 3f 02 00 00    	js     40001eb2 <subdir+0x3a2>
40001c73:	85 c0                	test   %eax,%eax
40001c75:	0f 85 37 02 00 00    	jne    40001eb2 <subdir+0x3a2>
    asm volatile ("int %2"
40001c7b:	8d be 4c 00 00 00    	lea    0x4c(%esi),%edi
40001c81:	b8 05 00 00 00       	mov    $0x5,%eax
40001c86:	ba 00 20 00 00       	mov    $0x2000,%edx
40001c8b:	89 f9                	mov    %edi,%ecx
40001c8d:	cd 30                	int    $0x30
    if (cc != 2 || buf[0] != 'f') {
40001c8f:	83 fb 02             	cmp    $0x2,%ebx
40001c92:	0f 85 e8 01 00 00    	jne    40001e80 <subdir+0x370>
40001c98:	85 c0                	test   %eax,%eax
40001c9a:	0f 85 e0 01 00 00    	jne    40001e80 <subdir+0x370>
40001ca0:	80 be 4c 00 00 00 66 	cmpb   $0x66,0x4c(%esi)
40001ca7:	0f 85 d3 01 00 00    	jne    40001e80 <subdir+0x370>
    asm volatile ("int %2"
40001cad:	b8 04 00 00 00       	mov    $0x4,%eax
40001cb2:	89 eb                	mov    %ebp,%ebx
40001cb4:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001cb6:	8d 8e a8 c4 ff ff    	lea    -0x3b58(%esi),%ecx
40001cbc:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001cc0:	b8 09 00 00 00       	mov    $0x9,%eax
40001cc5:	89 4c 24 10          	mov    %ecx,0x10(%esp)
40001cc9:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001ccb:	85 c0                	test   %eax,%eax
40001ccd:	0f 85 c0 02 00 00    	jne    40001f93 <subdir+0x483>
    asm volatile ("int %2"
40001cd3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001cd7:	b8 0a 00 00 00       	mov    $0xa,%eax
40001cdc:	cd 30                	int    $0x30
40001cde:	89 c1                	mov    %eax,%ecx
    return errno ? -1 : 0;
40001ce0:	85 c0                	test   %eax,%eax
40001ce2:	0f 85 42 03 00 00    	jne    4000202a <subdir+0x51a>
    asm volatile ("int %2"
40001ce8:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001cec:	b8 03 00 00 00       	mov    $0x3,%eax
40001cf1:	cd 30                	int    $0x30
    if (open("dd/dd/ff", O_RDONLY) >= 0) {
40001cf3:	85 db                	test   %ebx,%ebx
40001cf5:	78 08                	js     40001cff <subdir+0x1ef>
40001cf7:	85 c0                	test   %eax,%eax
40001cf9:	0f 84 cc 01 00 00    	je     40001ecb <subdir+0x3bb>
    asm volatile ("int %2"
40001cff:	ba 08 00 00 00       	mov    $0x8,%edx
40001d04:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001d08:	89 d0                	mov    %edx,%eax
40001d0a:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001d0c:	85 c0                	test   %eax,%eax
40001d0e:	0f 85 48 03 00 00    	jne    4000205c <subdir+0x54c>
    asm volatile ("int %2"
40001d14:	8d 9e cb c4 ff ff    	lea    -0x3b35(%esi),%ebx
40001d1a:	89 d0                	mov    %edx,%eax
40001d1c:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001d1e:	85 c0                	test   %eax,%eax
40001d20:	0f 85 1d 03 00 00    	jne    40002043 <subdir+0x533>
    asm volatile ("int %2"
40001d26:	8d 9e e8 c4 ff ff    	lea    -0x3b18(%esi),%ebx
40001d2c:	89 d0                	mov    %edx,%eax
40001d2e:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001d30:	85 c0                	test   %eax,%eax
40001d32:	0f 85 0b 03 00 00    	jne    40002043 <subdir+0x533>
    asm volatile ("int %2"
40001d38:	8d 9e 11 c5 ff ff    	lea    -0x3aef(%esi),%ebx
40001d3e:	89 d0                	mov    %edx,%eax
40001d40:	cd 30                	int    $0x30
40001d42:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    return errno ? -1 : 0;
40001d46:	89 c1                	mov    %eax,%ecx
40001d48:	85 c0                	test   %eax,%eax
40001d4a:	0f 85 25 03 00 00    	jne    40002075 <subdir+0x565>
    asm volatile ("int %2"
40001d50:	8b 5c 24 10          	mov    0x10(%esp),%ebx
40001d54:	b8 03 00 00 00       	mov    $0x3,%eax
40001d59:	cd 30                	int    $0x30
40001d5b:	89 dd                	mov    %ebx,%ebp
    if (fd < 0) {
40001d5d:	85 db                	test   %ebx,%ebx
40001d5f:	0f 88 b1 01 00 00    	js     40001f16 <subdir+0x406>
40001d65:	85 c0                	test   %eax,%eax
40001d67:	0f 85 a9 01 00 00    	jne    40001f16 <subdir+0x406>
    asm volatile ("int %2"
40001d6d:	b8 05 00 00 00       	mov    $0x5,%eax
40001d72:	ba 00 20 00 00       	mov    $0x2000,%edx
40001d77:	89 f9                	mov    %edi,%ecx
40001d79:	cd 30                	int    $0x30
    if (read(fd, buf, sizeof(buf)) != 2) {
40001d7b:	83 fb 02             	cmp    $0x2,%ebx
40001d7e:	0f 85 60 01 00 00    	jne    40001ee4 <subdir+0x3d4>
40001d84:	85 c0                	test   %eax,%eax
40001d86:	0f 85 58 01 00 00    	jne    40001ee4 <subdir+0x3d4>
    asm volatile ("int %2"
40001d8c:	b8 04 00 00 00       	mov    $0x4,%eax
40001d91:	89 eb                	mov    %ebp,%ebx
40001d93:	cd 30                	int    $0x30
    asm volatile ("int %2"
40001d95:	b8 03 00 00 00       	mov    $0x3,%eax
40001d9a:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40001d9e:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
40001da2:	cd 30                	int    $0x30
    if (open("dd/dd/ff", O_RDONLY) >= 0) {
40001da4:	85 db                	test   %ebx,%ebx
40001da6:	78 08                	js     40001db0 <subdir+0x2a0>
40001da8:	85 c0                	test   %eax,%eax
40001daa:	0f 84 7f 01 00 00    	je     40001f2f <subdir+0x41f>
40001db0:	8d ae 5c c5 ff ff    	lea    -0x3aa4(%esi),%ebp
40001db6:	b8 03 00 00 00       	mov    $0x3,%eax
40001dbb:	b9 02 02 00 00       	mov    $0x202,%ecx
40001dc0:	89 eb                	mov    %ebp,%ebx
40001dc2:	cd 30                	int    $0x30
    if (open("dd/ff/ff", O_CREATE | O_RDWR) >= 0) {
40001dc4:	85 db                	test   %ebx,%ebx
40001dc6:	78 08                	js     40001dd0 <subdir+0x2c0>
40001dc8:	85 c0                	test   %eax,%eax
40001dca:	0f 84 78 01 00 00    	je     40001f48 <subdir+0x438>
40001dd0:	8d be 81 c5 ff ff    	lea    -0x3a7f(%esi),%edi
40001dd6:	b8 03 00 00 00       	mov    $0x3,%eax
40001ddb:	b9 02 02 00 00       	mov    $0x202,%ecx
40001de0:	89 fb                	mov    %edi,%ebx
40001de2:	cd 30                	int    $0x30
    if (open("dd/xx/ff", O_CREATE | O_RDWR) >= 0) {
40001de4:	85 db                	test   %ebx,%ebx
40001de6:	78 08                	js     40001df0 <subdir+0x2e0>
40001de8:	85 c0                	test   %eax,%eax
40001dea:	0f 84 71 01 00 00    	je     40001f61 <subdir+0x451>
40001df0:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001df4:	b8 03 00 00 00       	mov    $0x3,%eax
40001df9:	b9 00 02 00 00       	mov    $0x200,%ecx
40001dfe:	cd 30                	int    $0x30
    if (open("dd", O_CREATE) >= 0) {
40001e00:	85 db                	test   %ebx,%ebx
40001e02:	78 08                	js     40001e0c <subdir+0x2fc>
40001e04:	85 c0                	test   %eax,%eax
40001e06:	0f 84 6e 01 00 00    	je     40001f7a <subdir+0x46a>
40001e0c:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001e10:	b8 03 00 00 00       	mov    $0x3,%eax
40001e15:	b9 02 00 00 00       	mov    $0x2,%ecx
40001e1a:	cd 30                	int    $0x30
    if (open("dd", O_RDWR) >= 0) {
40001e1c:	85 db                	test   %ebx,%ebx
40001e1e:	78 08                	js     40001e28 <subdir+0x318>
40001e20:	85 c0                	test   %eax,%eax
40001e22:	0f 84 a7 01 00 00    	je     40001fcf <subdir+0x4bf>
40001e28:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40001e2c:	b8 03 00 00 00       	mov    $0x3,%eax
40001e31:	b9 01 00 00 00       	mov    $0x1,%ecx
40001e36:	cd 30                	int    $0x30
    if (open("dd", O_WRONLY) >= 0) {
40001e38:	85 db                	test   %ebx,%ebx
40001e3a:	78 08                	js     40001e44 <subdir+0x334>
40001e3c:	85 c0                	test   %eax,%eax
40001e3e:	0f 84 a4 01 00 00    	je     40001fe8 <subdir+0x4d8>
    asm volatile ("int %2"
40001e44:	ba 09 00 00 00       	mov    $0x9,%edx
40001e49:	8d 8e f0 c5 ff ff    	lea    -0x3a10(%esi),%ecx
40001e4f:	89 eb                	mov    %ebp,%ebx
40001e51:	89 d0                	mov    %edx,%eax
40001e53:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001e55:	85 c0                	test   %eax,%eax
40001e57:	0f 85 4f 01 00 00    	jne    40001fac <subdir+0x49c>
        printf("link dd/ff/ff dd/dd/xx succeeded!\n");
40001e5d:	83 ec 0c             	sub    $0xc,%esp
40001e60:	8d 86 3c cf ff ff    	lea    -0x30c4(%esi),%eax
40001e66:	89 f3                	mov    %esi,%ebx
40001e68:	50                   	push   %eax
40001e69:	e8 e2 e4 ff ff       	call   40000350 <printf>
        exit();
40001e6e:	83 c4 10             	add    $0x10,%esp
40001e71:	e9 41 fd ff ff       	jmp    40001bb7 <subdir+0xa7>
40001e76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40001e7d:	00 
40001e7e:	66 90                	xchg   %ax,%ax
        printf("dd/dd/../ff wrong content\n");
40001e80:	83 ec 0c             	sub    $0xc,%esp
40001e83:	8d 86 8d c4 ff ff    	lea    -0x3b73(%esi),%eax
40001e89:	89 f3                	mov    %esi,%ebx
40001e8b:	50                   	push   %eax
40001e8c:	e8 bf e4 ff ff       	call   40000350 <printf>
        exit();
40001e91:	83 c4 10             	add    $0x10,%esp
40001e94:	e9 1e fd ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("create dd/dd/ff failed\n");
40001e99:	83 ec 0c             	sub    $0xc,%esp
40001e9c:	8d 86 4d c4 ff ff    	lea    -0x3bb3(%esi),%eax
40001ea2:	89 f3                	mov    %esi,%ebx
40001ea4:	50                   	push   %eax
40001ea5:	e8 a6 e4 ff ff       	call   40000350 <printf>
        exit();
40001eaa:	83 c4 10             	add    $0x10,%esp
40001ead:	e9 05 fd ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("open dd/dd/../ff failed\n");
40001eb2:	83 ec 0c             	sub    $0xc,%esp
40001eb5:	8d 86 74 c4 ff ff    	lea    -0x3b8c(%esi),%eax
40001ebb:	89 f3                	mov    %esi,%ebx
40001ebd:	50                   	push   %eax
40001ebe:	e8 8d e4 ff ff       	call   40000350 <printf>
        exit();
40001ec3:	83 c4 10             	add    $0x10,%esp
40001ec6:	e9 ec fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("open (unlinked) dd/dd/ff succeeded\n");
40001ecb:	83 ec 0c             	sub    $0xc,%esp
40001ece:	8d 86 f0 ce ff ff    	lea    -0x3110(%esi),%eax
40001ed4:	89 f3                	mov    %esi,%ebx
40001ed6:	50                   	push   %eax
40001ed7:	e8 74 e4 ff ff       	call   40000350 <printf>
        exit();
40001edc:	83 c4 10             	add    $0x10,%esp
40001edf:	e9 d3 fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("read dd/dd/ffff wrong len\n");
40001ee4:	83 ec 0c             	sub    $0xc,%esp
40001ee7:	8d 86 41 c5 ff ff    	lea    -0x3abf(%esi),%eax
40001eed:	89 f3                	mov    %esi,%ebx
40001eef:	50                   	push   %eax
40001ef0:	e8 5b e4 ff ff       	call   40000350 <printf>
        exit();
40001ef5:	83 c4 10             	add    $0x10,%esp
40001ef8:	e9 ba fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("subdir mkdir dd/dd failed\n");
40001efd:	83 ec 0c             	sub    $0xc,%esp
40001f00:	8d 86 32 c4 ff ff    	lea    -0x3bce(%esi),%eax
40001f06:	89 f3                	mov    %esi,%ebx
40001f08:	50                   	push   %eax
40001f09:	e8 42 e4 ff ff       	call   40000350 <printf>
        exit();
40001f0e:	83 c4 10             	add    $0x10,%esp
40001f11:	e9 a1 fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("open dd/dd/ffff failed\n");
40001f16:	83 ec 0c             	sub    $0xc,%esp
40001f19:	8d 86 29 c5 ff ff    	lea    -0x3ad7(%esi),%eax
40001f1f:	89 f3                	mov    %esi,%ebx
40001f21:	50                   	push   %eax
40001f22:	e8 29 e4 ff ff       	call   40000350 <printf>
        exit();
40001f27:	83 c4 10             	add    $0x10,%esp
40001f2a:	e9 88 fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("open (unlinked) dd/dd/ff succeeded!\n");
40001f2f:	83 ec 0c             	sub    $0xc,%esp
40001f32:	8d 86 14 cf ff ff    	lea    -0x30ec(%esi),%eax
40001f38:	89 f3                	mov    %esi,%ebx
40001f3a:	50                   	push   %eax
40001f3b:	e8 10 e4 ff ff       	call   40000350 <printf>
        exit();
40001f40:	83 c4 10             	add    $0x10,%esp
40001f43:	e9 6f fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("create dd/ff/ff succeeded!\n");
40001f48:	83 ec 0c             	sub    $0xc,%esp
40001f4b:	8d 86 65 c5 ff ff    	lea    -0x3a9b(%esi),%eax
40001f51:	89 f3                	mov    %esi,%ebx
40001f53:	50                   	push   %eax
40001f54:	e8 f7 e3 ff ff       	call   40000350 <printf>
        exit();
40001f59:	83 c4 10             	add    $0x10,%esp
40001f5c:	e9 56 fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("create dd/xx/ff succeeded!\n");
40001f61:	83 ec 0c             	sub    $0xc,%esp
40001f64:	8d 86 8a c5 ff ff    	lea    -0x3a76(%esi),%eax
40001f6a:	89 f3                	mov    %esi,%ebx
40001f6c:	50                   	push   %eax
40001f6d:	e8 de e3 ff ff       	call   40000350 <printf>
        exit();
40001f72:	83 c4 10             	add    $0x10,%esp
40001f75:	e9 3d fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("create dd succeeded!\n");
40001f7a:	83 ec 0c             	sub    $0xc,%esp
40001f7d:	8d 86 a6 c5 ff ff    	lea    -0x3a5a(%esi),%eax
40001f83:	89 f3                	mov    %esi,%ebx
40001f85:	50                   	push   %eax
40001f86:	e8 c5 e3 ff ff       	call   40000350 <printf>
        exit();
40001f8b:	83 c4 10             	add    $0x10,%esp
40001f8e:	e9 24 fc ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("link dd/dd/ff dd/dd/ffff failed\n");
40001f93:	83 ec 0c             	sub    $0xc,%esp
40001f96:	8d 86 cc ce ff ff    	lea    -0x3134(%esi),%eax
40001f9c:	89 f3                	mov    %esi,%ebx
40001f9e:	50                   	push   %eax
40001f9f:	e8 ac e3 ff ff       	call   40000350 <printf>
        exit();
40001fa4:	83 c4 10             	add    $0x10,%esp
40001fa7:	e9 0b fc ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
40001fac:	89 d0                	mov    %edx,%eax
40001fae:	89 fb                	mov    %edi,%ebx
40001fb0:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40001fb2:	85 c0                	test   %eax,%eax
40001fb4:	75 4b                	jne    40002001 <subdir+0x4f1>
        printf("link dd/xx/ff dd/dd/xx succeeded!\n");
40001fb6:	83 ec 0c             	sub    $0xc,%esp
40001fb9:	8d 86 60 cf ff ff    	lea    -0x30a0(%esi),%eax
40001fbf:	89 f3                	mov    %esi,%ebx
40001fc1:	50                   	push   %eax
40001fc2:	e8 89 e3 ff ff       	call   40000350 <printf>
        exit();
40001fc7:	83 c4 10             	add    $0x10,%esp
40001fca:	e9 e8 fb ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("open dd rdwr succeeded!\n");
40001fcf:	83 ec 0c             	sub    $0xc,%esp
40001fd2:	8d 86 bc c5 ff ff    	lea    -0x3a44(%esi),%eax
40001fd8:	89 f3                	mov    %esi,%ebx
40001fda:	50                   	push   %eax
40001fdb:	e8 70 e3 ff ff       	call   40000350 <printf>
        exit();
40001fe0:	83 c4 10             	add    $0x10,%esp
40001fe3:	e9 cf fb ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("open dd wronly succeeded!\n");
40001fe8:	83 ec 0c             	sub    $0xc,%esp
40001feb:	8d 86 d5 c5 ff ff    	lea    -0x3a2b(%esi),%eax
40001ff1:	89 f3                	mov    %esi,%ebx
40001ff3:	50                   	push   %eax
40001ff4:	e8 57 e3 ff ff       	call   40000350 <printf>
        exit();
40001ff9:	83 c4 10             	add    $0x10,%esp
40001ffc:	e9 b6 fb ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
40002001:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40002005:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40002009:	89 d0                	mov    %edx,%eax
4000200b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000200d:	85 c0                	test   %eax,%eax
4000200f:	75 7d                	jne    4000208e <subdir+0x57e>
        printf("link dd/ff dd/dd/ffff succeeded!\n");
40002011:	83 ec 0c             	sub    $0xc,%esp
40002014:	8d 86 84 cf ff ff    	lea    -0x307c(%esi),%eax
4000201a:	89 f3                	mov    %esi,%ebx
4000201c:	50                   	push   %eax
4000201d:	e8 2e e3 ff ff       	call   40000350 <printf>
        exit();
40002022:	83 c4 10             	add    $0x10,%esp
40002025:	e9 8d fb ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("unlink dd/dd/ff failed\n");
4000202a:	83 ec 0c             	sub    $0xc,%esp
4000202d:	8d 86 b3 c4 ff ff    	lea    -0x3b4d(%esi),%eax
40002033:	89 f3                	mov    %esi,%ebx
40002035:	50                   	push   %eax
40002036:	e8 15 e3 ff ff       	call   40000350 <printf>
        exit();
4000203b:	83 c4 10             	add    $0x10,%esp
4000203e:	e9 74 fb ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("chdir dd/../../dd failed\n");
40002043:	83 ec 0c             	sub    $0xc,%esp
40002046:	8d 86 f7 c4 ff ff    	lea    -0x3b09(%esi),%eax
4000204c:	89 f3                	mov    %esi,%ebx
4000204e:	50                   	push   %eax
4000204f:	e8 fc e2 ff ff       	call   40000350 <printf>
        exit();
40002054:	83 c4 10             	add    $0x10,%esp
40002057:	e9 5b fb ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("chdir dd failed\n");
4000205c:	83 ec 0c             	sub    $0xc,%esp
4000205f:	8d 86 d7 c4 ff ff    	lea    -0x3b29(%esi),%eax
40002065:	89 f3                	mov    %esi,%ebx
40002067:	50                   	push   %eax
40002068:	e8 e3 e2 ff ff       	call   40000350 <printf>
        exit();
4000206d:	83 c4 10             	add    $0x10,%esp
40002070:	e9 42 fb ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("chdir ./.. failed\n");
40002075:	83 ec 0c             	sub    $0xc,%esp
40002078:	8d 86 16 c5 ff ff    	lea    -0x3aea(%esi),%eax
4000207e:	89 f3                	mov    %esi,%ebx
40002080:	50                   	push   %eax
40002081:	e8 ca e2 ff ff       	call   40000350 <printf>
        exit();
40002086:	83 c4 10             	add    $0x10,%esp
40002089:	e9 29 fb ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
4000208e:	ba 07 00 00 00       	mov    $0x7,%edx
40002093:	89 eb                	mov    %ebp,%ebx
40002095:	89 d0                	mov    %edx,%eax
40002097:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002099:	85 c0                	test   %eax,%eax
4000209b:	75 19                	jne    400020b6 <subdir+0x5a6>
        printf("mkdir dd/ff/ff succeeded!\n");
4000209d:	83 ec 0c             	sub    $0xc,%esp
400020a0:	8d 86 f9 c5 ff ff    	lea    -0x3a07(%esi),%eax
400020a6:	89 f3                	mov    %esi,%ebx
400020a8:	50                   	push   %eax
400020a9:	e8 a2 e2 ff ff       	call   40000350 <printf>
        exit();
400020ae:	83 c4 10             	add    $0x10,%esp
400020b1:	e9 01 fb ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
400020b6:	89 d0                	mov    %edx,%eax
400020b8:	89 fb                	mov    %edi,%ebx
400020ba:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400020bc:	85 c0                	test   %eax,%eax
400020be:	75 19                	jne    400020d9 <subdir+0x5c9>
        printf("mkdir dd/xx/ff succeeded!\n");
400020c0:	83 ec 0c             	sub    $0xc,%esp
400020c3:	8d 86 14 c6 ff ff    	lea    -0x39ec(%esi),%eax
400020c9:	89 f3                	mov    %esi,%ebx
400020cb:	50                   	push   %eax
400020cc:	e8 7f e2 ff ff       	call   40000350 <printf>
        exit();
400020d1:	83 c4 10             	add    $0x10,%esp
400020d4:	e9 de fa ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
400020d9:	8b 5c 24 10          	mov    0x10(%esp),%ebx
400020dd:	89 d0                	mov    %edx,%eax
400020df:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400020e1:	85 c0                	test   %eax,%eax
400020e3:	75 19                	jne    400020fe <subdir+0x5ee>
        printf("mkdir dd/dd/ffff succeeded!\n");
400020e5:	83 ec 0c             	sub    $0xc,%esp
400020e8:	8d 86 2f c6 ff ff    	lea    -0x39d1(%esi),%eax
400020ee:	89 f3                	mov    %esi,%ebx
400020f0:	50                   	push   %eax
400020f1:	e8 5a e2 ff ff       	call   40000350 <printf>
        exit();
400020f6:	83 c4 10             	add    $0x10,%esp
400020f9:	e9 b9 fa ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
400020fe:	ba 0a 00 00 00       	mov    $0xa,%edx
40002103:	89 fb                	mov    %edi,%ebx
40002105:	89 d0                	mov    %edx,%eax
40002107:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002109:	85 c0                	test   %eax,%eax
4000210b:	75 19                	jne    40002126 <subdir+0x616>
        printf("unlink dd/xx/ff succeeded!\n");
4000210d:	83 ec 0c             	sub    $0xc,%esp
40002110:	8d 86 4c c6 ff ff    	lea    -0x39b4(%esi),%eax
40002116:	89 f3                	mov    %esi,%ebx
40002118:	50                   	push   %eax
40002119:	e8 32 e2 ff ff       	call   40000350 <printf>
        exit();
4000211e:	83 c4 10             	add    $0x10,%esp
40002121:	e9 91 fa ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
40002126:	89 d0                	mov    %edx,%eax
40002128:	89 eb                	mov    %ebp,%ebx
4000212a:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000212c:	85 c0                	test   %eax,%eax
4000212e:	75 19                	jne    40002149 <subdir+0x639>
        printf("unlink dd/ff/ff succeeded!\n");
40002130:	83 ec 0c             	sub    $0xc,%esp
40002133:	8d 86 68 c6 ff ff    	lea    -0x3998(%esi),%eax
40002139:	89 f3                	mov    %esi,%ebx
4000213b:	50                   	push   %eax
4000213c:	e8 0f e2 ff ff       	call   40000350 <printf>
        exit();
40002141:	83 c4 10             	add    $0x10,%esp
40002144:	e9 6e fa ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
40002149:	ba 08 00 00 00       	mov    $0x8,%edx
4000214e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40002152:	89 d0                	mov    %edx,%eax
40002154:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002156:	85 c0                	test   %eax,%eax
40002158:	75 19                	jne    40002173 <subdir+0x663>
        printf("chdir dd/ff succeeded!\n");
4000215a:	83 ec 0c             	sub    $0xc,%esp
4000215d:	8d 86 84 c6 ff ff    	lea    -0x397c(%esi),%eax
40002163:	89 f3                	mov    %esi,%ebx
40002165:	50                   	push   %eax
40002166:	e8 e5 e1 ff ff       	call   40000350 <printf>
        exit();
4000216b:	83 c4 10             	add    $0x10,%esp
4000216e:	e9 44 fa ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
40002173:	8d 9e f3 c5 ff ff    	lea    -0x3a0d(%esi),%ebx
40002179:	89 d0                	mov    %edx,%eax
4000217b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000217d:	85 c0                	test   %eax,%eax
4000217f:	75 19                	jne    4000219a <subdir+0x68a>
        printf("chdir dd/xx succeeded!\n");
40002181:	83 ec 0c             	sub    $0xc,%esp
40002184:	8d 86 9c c6 ff ff    	lea    -0x3964(%esi),%eax
4000218a:	89 f3                	mov    %esi,%ebx
4000218c:	50                   	push   %eax
4000218d:	e8 be e1 ff ff       	call   40000350 <printf>
        exit();
40002192:	83 c4 10             	add    $0x10,%esp
40002195:	e9 1d fa ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
4000219a:	ba 0a 00 00 00       	mov    $0xa,%edx
4000219f:	8b 5c 24 10          	mov    0x10(%esp),%ebx
400021a3:	89 d0                	mov    %edx,%eax
400021a5:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400021a7:	85 c0                	test   %eax,%eax
400021a9:	0f 85 7b fe ff ff    	jne    4000202a <subdir+0x51a>
    asm volatile ("int %2"
400021af:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
400021b3:	89 d0                	mov    %edx,%eax
400021b5:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400021b7:	85 c0                	test   %eax,%eax
400021b9:	75 25                	jne    400021e0 <subdir+0x6d0>
    asm volatile ("int %2"
400021bb:	8b 5c 24 08          	mov    0x8(%esp),%ebx
400021bf:	89 d0                	mov    %edx,%eax
400021c1:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400021c3:	85 c0                	test   %eax,%eax
400021c5:	75 32                	jne    400021f9 <subdir+0x6e9>
        printf("unlink non-empty dd succeeded!\n");
400021c7:	83 ec 0c             	sub    $0xc,%esp
400021ca:	8d 86 a8 cf ff ff    	lea    -0x3058(%esi),%eax
400021d0:	89 f3                	mov    %esi,%ebx
400021d2:	50                   	push   %eax
400021d3:	e8 78 e1 ff ff       	call   40000350 <printf>
        exit();
400021d8:	83 c4 10             	add    $0x10,%esp
400021db:	e9 d7 f9 ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("unlink dd/ff failed\n");
400021e0:	83 ec 0c             	sub    $0xc,%esp
400021e3:	8d 86 b4 c6 ff ff    	lea    -0x394c(%esi),%eax
400021e9:	89 f3                	mov    %esi,%ebx
400021eb:	50                   	push   %eax
400021ec:	e8 5f e1 ff ff       	call   40000350 <printf>
        exit();
400021f1:	83 c4 10             	add    $0x10,%esp
400021f4:	e9 be f9 ff ff       	jmp    40001bb7 <subdir+0xa7>
    asm volatile ("int %2"
400021f9:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400021fd:	89 d0                	mov    %edx,%eax
400021ff:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002201:	85 c0                	test   %eax,%eax
40002203:	75 25                	jne    4000222a <subdir+0x71a>
    asm volatile ("int %2"
40002205:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40002209:	89 d0                	mov    %edx,%eax
4000220b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000220d:	85 c0                	test   %eax,%eax
4000220f:	75 32                	jne    40002243 <subdir+0x733>
    printf("=====subdir ok=====\n\n");
40002211:	83 ec 0c             	sub    $0xc,%esp
40002214:	8d 86 de c6 ff ff    	lea    -0x3922(%esi),%eax
4000221a:	89 f3                	mov    %esi,%ebx
4000221c:	50                   	push   %eax
4000221d:	e8 2e e1 ff ff       	call   40000350 <printf>
40002222:	83 c4 10             	add    $0x10,%esp
40002225:	e9 8d f9 ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("unlink dd/dd failed\n");
4000222a:	83 ec 0c             	sub    $0xc,%esp
4000222d:	8d 86 c9 c6 ff ff    	lea    -0x3937(%esi),%eax
40002233:	89 f3                	mov    %esi,%ebx
40002235:	50                   	push   %eax
40002236:	e8 15 e1 ff ff       	call   40000350 <printf>
        exit();
4000223b:	83 c4 10             	add    $0x10,%esp
4000223e:	e9 74 f9 ff ff       	jmp    40001bb7 <subdir+0xa7>
        printf("unlink dd failed\n");
40002243:	83 ec 0c             	sub    $0xc,%esp
40002246:	8d 86 f4 c6 ff ff    	lea    -0x390c(%esi),%eax
4000224c:	89 f3                	mov    %esi,%ebx
4000224e:	50                   	push   %eax
4000224f:	e8 fc e0 ff ff       	call   40000350 <printf>
        exit();
40002254:	83 c4 10             	add    $0x10,%esp
40002257:	e9 5b f9 ff ff       	jmp    40001bb7 <subdir+0xa7>
4000225c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40002260 <linktest>:
{
40002260:	55                   	push   %ebp
    asm volatile ("int %2"
40002261:	bd 0a 00 00 00       	mov    $0xa,%ebp
40002266:	57                   	push   %edi
40002267:	56                   	push   %esi
40002268:	e8 3e 09 00 00       	call   40002bab <__x86.get_pc_thunk.si>
4000226d:	81 c6 87 4d 00 00    	add    $0x4d87,%esi
40002273:	53                   	push   %ebx
40002274:	83 ec 28             	sub    $0x28,%esp
    printf("=====linktest=====\n");
40002277:	8d 86 06 c7 ff ff    	lea    -0x38fa(%esi),%eax
4000227d:	89 f3                	mov    %esi,%ebx
4000227f:	8d be 1a c7 ff ff    	lea    -0x38e6(%esi),%edi
40002285:	50                   	push   %eax
40002286:	e8 c5 e0 ff ff       	call   40000350 <printf>
4000228b:	89 e8                	mov    %ebp,%eax
4000228d:	89 fb                	mov    %edi,%ebx
4000228f:	cd 30                	int    $0x30
40002291:	8d 9e 1e c7 ff ff    	lea    -0x38e2(%esi),%ebx
40002297:	89 e8                	mov    %ebp,%eax
40002299:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
4000229d:	cd 30                	int    $0x30
    asm volatile ("int %2"
4000229f:	b9 02 02 00 00       	mov    $0x202,%ecx
400022a4:	b8 03 00 00 00       	mov    $0x3,%eax
400022a9:	89 fb                	mov    %edi,%ebx
400022ab:	cd 30                	int    $0x30
400022ad:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    if (fd < 0) {
400022b1:	83 c4 10             	add    $0x10,%esp
400022b4:	85 db                	test   %ebx,%ebx
400022b6:	0f 88 04 01 00 00    	js     400023c0 <linktest+0x160>
400022bc:	85 c0                	test   %eax,%eax
400022be:	0f 85 fc 00 00 00    	jne    400023c0 <linktest+0x160>
    asm volatile ("int %2"
400022c4:	8b 5c 24 08          	mov    0x8(%esp),%ebx
400022c8:	b8 06 00 00 00       	mov    $0x6,%eax
400022cd:	8d 8e 35 c7 ff ff    	lea    -0x38cb(%esi),%ecx
400022d3:	ba 05 00 00 00       	mov    $0x5,%edx
400022d8:	cd 30                	int    $0x30
    if (write(fd, "hello", 5) != 5) {
400022da:	83 fb 05             	cmp    $0x5,%ebx
400022dd:	0f 85 bd 00 00 00    	jne    400023a0 <linktest+0x140>
400022e3:	85 c0                	test   %eax,%eax
400022e5:	0f 85 b5 00 00 00    	jne    400023a0 <linktest+0x140>
    asm volatile ("int %2"
400022eb:	8b 5c 24 08          	mov    0x8(%esp),%ebx
400022ef:	b8 04 00 00 00       	mov    $0x4,%eax
400022f4:	cd 30                	int    $0x30
    asm volatile ("int %2"
400022f6:	b8 09 00 00 00       	mov    $0x9,%eax
400022fb:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
400022ff:	89 fb                	mov    %edi,%ebx
40002301:	cd 30                	int    $0x30
40002303:	89 c1                	mov    %eax,%ecx
    return errno ? -1 : 0;
40002305:	85 c0                	test   %eax,%eax
40002307:	0f 85 2c 01 00 00    	jne    40002439 <linktest+0x1d9>
    asm volatile ("int %2"
4000230d:	89 e8                	mov    %ebp,%eax
4000230f:	89 fb                	mov    %edi,%ebx
40002311:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002313:	b8 03 00 00 00       	mov    $0x3,%eax
40002318:	89 fb                	mov    %edi,%ebx
4000231a:	cd 30                	int    $0x30
    if (open("lf1", 0) >= 0) {
4000231c:	85 db                	test   %ebx,%ebx
4000231e:	78 08                	js     40002328 <linktest+0xc8>
40002320:	85 c0                	test   %eax,%eax
40002322:	0f 84 b8 00 00 00    	je     400023e0 <linktest+0x180>
40002328:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
4000232c:	b8 03 00 00 00       	mov    $0x3,%eax
40002331:	31 c9                	xor    %ecx,%ecx
40002333:	cd 30                	int    $0x30
40002335:	89 dd                	mov    %ebx,%ebp
    if (fd < 0) {
40002337:	85 db                	test   %ebx,%ebx
40002339:	0f 88 c1 00 00 00    	js     40002400 <linktest+0x1a0>
4000233f:	85 c0                	test   %eax,%eax
40002341:	0f 85 b9 00 00 00    	jne    40002400 <linktest+0x1a0>
    asm volatile ("int %2"
40002347:	b8 05 00 00 00       	mov    $0x5,%eax
4000234c:	8d 8e 4c 00 00 00    	lea    0x4c(%esi),%ecx
40002352:	ba 00 20 00 00       	mov    $0x2000,%edx
40002357:	cd 30                	int    $0x30
    if (read(fd, buf, sizeof(buf)) != 5) {
40002359:	83 fb 05             	cmp    $0x5,%ebx
4000235c:	0f 85 be 00 00 00    	jne    40002420 <linktest+0x1c0>
40002362:	85 c0                	test   %eax,%eax
40002364:	0f 85 b6 00 00 00    	jne    40002420 <linktest+0x1c0>
    asm volatile ("int %2"
4000236a:	b8 04 00 00 00       	mov    $0x4,%eax
4000236f:	89 eb                	mov    %ebp,%ebx
40002371:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002373:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40002377:	ba 09 00 00 00       	mov    $0x9,%edx
4000237c:	89 d0                	mov    %edx,%eax
4000237e:	89 d9                	mov    %ebx,%ecx
40002380:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002382:	85 c0                	test   %eax,%eax
40002384:	0f 85 c8 00 00 00    	jne    40002452 <linktest+0x1f2>
        printf("link lf2 lf2 succeeded! oops\n");
4000238a:	83 ec 0c             	sub    $0xc,%esp
4000238d:	8d 86 84 c7 ff ff    	lea    -0x387c(%esi),%eax
40002393:	89 f3                	mov    %esi,%ebx
40002395:	50                   	push   %eax
40002396:	e8 b5 df ff ff       	call   40000350 <printf>
        exit();
4000239b:	83 c4 10             	add    $0x10,%esp
4000239e:	eb 14                	jmp    400023b4 <linktest+0x154>
        printf("write lf1 failed\n");
400023a0:	83 ec 0c             	sub    $0xc,%esp
400023a3:	8d 86 3b c7 ff ff    	lea    -0x38c5(%esi),%eax
400023a9:	89 f3                	mov    %esi,%ebx
400023ab:	50                   	push   %eax
400023ac:	e8 9f df ff ff       	call   40000350 <printf>
        exit();
400023b1:	83 c4 10             	add    $0x10,%esp
}
400023b4:	83 c4 1c             	add    $0x1c,%esp
400023b7:	5b                   	pop    %ebx
400023b8:	5e                   	pop    %esi
400023b9:	5f                   	pop    %edi
400023ba:	5d                   	pop    %ebp
400023bb:	c3                   	ret
400023bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("create lf1 failed\n");
400023c0:	83 ec 0c             	sub    $0xc,%esp
400023c3:	8d 86 22 c7 ff ff    	lea    -0x38de(%esi),%eax
400023c9:	89 f3                	mov    %esi,%ebx
400023cb:	50                   	push   %eax
400023cc:	e8 7f df ff ff       	call   40000350 <printf>
        exit();
400023d1:	83 c4 10             	add    $0x10,%esp
}
400023d4:	83 c4 1c             	add    $0x1c,%esp
400023d7:	5b                   	pop    %ebx
400023d8:	5e                   	pop    %esi
400023d9:	5f                   	pop    %edi
400023da:	5d                   	pop    %ebp
400023db:	c3                   	ret
400023dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("unlinked lf1 but it is still there!\n");
400023e0:	83 ec 0c             	sub    $0xc,%esp
400023e3:	8d 86 c8 cf ff ff    	lea    -0x3038(%esi),%eax
400023e9:	89 f3                	mov    %esi,%ebx
400023eb:	50                   	push   %eax
400023ec:	e8 5f df ff ff       	call   40000350 <printf>
        exit();
400023f1:	83 c4 10             	add    $0x10,%esp
400023f4:	eb be                	jmp    400023b4 <linktest+0x154>
400023f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400023fd:	00 
400023fe:	66 90                	xchg   %ax,%ax
        printf("open lf2 failed\n");
40002400:	83 ec 0c             	sub    $0xc,%esp
40002403:	8d 86 62 c7 ff ff    	lea    -0x389e(%esi),%eax
40002409:	89 f3                	mov    %esi,%ebx
4000240b:	50                   	push   %eax
4000240c:	e8 3f df ff ff       	call   40000350 <printf>
        exit();
40002411:	83 c4 10             	add    $0x10,%esp
40002414:	eb 9e                	jmp    400023b4 <linktest+0x154>
40002416:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000241d:	00 
4000241e:	66 90                	xchg   %ax,%ax
        printf("read lf2 failed\n");
40002420:	83 ec 0c             	sub    $0xc,%esp
40002423:	8d 86 73 c7 ff ff    	lea    -0x388d(%esi),%eax
40002429:	89 f3                	mov    %esi,%ebx
4000242b:	50                   	push   %eax
4000242c:	e8 1f df ff ff       	call   40000350 <printf>
        exit();
40002431:	83 c4 10             	add    $0x10,%esp
40002434:	e9 7b ff ff ff       	jmp    400023b4 <linktest+0x154>
        printf("link lf1 lf2 failed\n");
40002439:	83 ec 0c             	sub    $0xc,%esp
4000243c:	8d 86 4d c7 ff ff    	lea    -0x38b3(%esi),%eax
40002442:	89 f3                	mov    %esi,%ebx
40002444:	50                   	push   %eax
40002445:	e8 06 df ff ff       	call   40000350 <printf>
        exit();
4000244a:	83 c4 10             	add    $0x10,%esp
4000244d:	e9 62 ff ff ff       	jmp    400023b4 <linktest+0x154>
    asm volatile ("int %2"
40002452:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40002456:	b8 0a 00 00 00       	mov    $0xa,%eax
4000245b:	cd 30                	int    $0x30
    asm volatile ("int %2"
4000245d:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40002461:	89 d0                	mov    %edx,%eax
40002463:	89 f9                	mov    %edi,%ecx
40002465:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002467:	85 c0                	test   %eax,%eax
40002469:	75 19                	jne    40002484 <linktest+0x224>
        printf("link non-existant succeeded! oops\n");
4000246b:	83 ec 0c             	sub    $0xc,%esp
4000246e:	8d 86 f0 cf ff ff    	lea    -0x3010(%esi),%eax
40002474:	89 f3                	mov    %esi,%ebx
40002476:	50                   	push   %eax
40002477:	e8 d4 de ff ff       	call   40000350 <printf>
        exit();
4000247c:	83 c4 10             	add    $0x10,%esp
4000247f:	e9 30 ff ff ff       	jmp    400023b4 <linktest+0x154>
    asm volatile ("int %2"
40002484:	8d 9e 14 c5 ff ff    	lea    -0x3aec(%esi),%ebx
4000248a:	89 d0                	mov    %edx,%eax
4000248c:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000248e:	85 c0                	test   %eax,%eax
40002490:	75 19                	jne    400024ab <linktest+0x24b>
        printf("link . lf1 succeeded! oops\n");
40002492:	83 ec 0c             	sub    $0xc,%esp
40002495:	8d 86 a2 c7 ff ff    	lea    -0x385e(%esi),%eax
4000249b:	89 f3                	mov    %esi,%ebx
4000249d:	50                   	push   %eax
4000249e:	e8 ad de ff ff       	call   40000350 <printf>
        exit();
400024a3:	83 c4 10             	add    $0x10,%esp
400024a6:	e9 09 ff ff ff       	jmp    400023b4 <linktest+0x154>
    printf("=====linktest ok=====\n\n");
400024ab:	83 ec 0c             	sub    $0xc,%esp
400024ae:	8d 86 be c7 ff ff    	lea    -0x3842(%esi),%eax
400024b4:	89 f3                	mov    %esi,%ebx
400024b6:	50                   	push   %eax
400024b7:	e8 94 de ff ff       	call   40000350 <printf>
400024bc:	83 c4 10             	add    $0x10,%esp
400024bf:	e9 f0 fe ff ff       	jmp    400023b4 <linktest+0x154>
400024c4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400024cb:	00 
400024cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

400024d0 <unlinkread>:
{
400024d0:	55                   	push   %ebp
400024d1:	57                   	push   %edi
400024d2:	56                   	push   %esi
400024d3:	e8 d3 06 00 00       	call   40002bab <__x86.get_pc_thunk.si>
400024d8:	81 c6 1c 4b 00 00    	add    $0x4b1c,%esi
400024de:	53                   	push   %ebx
400024df:	83 ec 28             	sub    $0x28,%esp
    printf("=====unlinkread test=====\n");
400024e2:	8d 86 d6 c7 ff ff    	lea    -0x382a(%esi),%eax
400024e8:	89 f3                	mov    %esi,%ebx
    asm volatile ("int %2"
400024ea:	8d be f1 c7 ff ff    	lea    -0x380f(%esi),%edi
400024f0:	50                   	push   %eax
400024f1:	e8 5a de ff ff       	call   40000350 <printf>
400024f6:	b8 03 00 00 00       	mov    $0x3,%eax
400024fb:	89 fb                	mov    %edi,%ebx
400024fd:	b9 02 02 00 00       	mov    $0x202,%ecx
40002502:	cd 30                	int    $0x30
    if (fd < 0) {
40002504:	83 c4 10             	add    $0x10,%esp
40002507:	85 db                	test   %ebx,%ebx
40002509:	0f 88 21 01 00 00    	js     40002630 <unlinkread+0x160>
4000250f:	85 c0                	test   %eax,%eax
40002511:	0f 85 19 01 00 00    	jne    40002630 <unlinkread+0x160>
40002517:	89 dd                	mov    %ebx,%ebp
    asm volatile ("int %2"
40002519:	8d 8e 35 c7 ff ff    	lea    -0x38cb(%esi),%ecx
4000251f:	b8 06 00 00 00       	mov    $0x6,%eax
40002524:	ba 05 00 00 00       	mov    $0x5,%edx
40002529:	cd 30                	int    $0x30
    asm volatile ("int %2"
4000252b:	b8 04 00 00 00       	mov    $0x4,%eax
40002530:	89 eb                	mov    %ebp,%ebx
40002532:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002534:	b9 02 00 00 00       	mov    $0x2,%ecx
40002539:	b8 03 00 00 00       	mov    $0x3,%eax
4000253e:	89 fb                	mov    %edi,%ebx
40002540:	cd 30                	int    $0x30
40002542:	89 dd                	mov    %ebx,%ebp
    if (fd < 0) {
40002544:	85 db                	test   %ebx,%ebx
40002546:	0f 88 04 01 00 00    	js     40002650 <unlinkread+0x180>
4000254c:	85 c0                	test   %eax,%eax
4000254e:	0f 85 fc 00 00 00    	jne    40002650 <unlinkread+0x180>
    asm volatile ("int %2"
40002554:	b8 0a 00 00 00       	mov    $0xa,%eax
40002559:	89 fb                	mov    %edi,%ebx
4000255b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000255d:	85 c0                	test   %eax,%eax
4000255f:	0f 85 4b 01 00 00    	jne    400026b0 <unlinkread+0x1e0>
    asm volatile ("int %2"
40002565:	b8 03 00 00 00       	mov    $0x3,%eax
4000256a:	89 fb                	mov    %edi,%ebx
4000256c:	b9 02 02 00 00       	mov    $0x202,%ecx
40002571:	cd 30                	int    $0x30
    return errno ? -1 : fd;
40002573:	85 c0                	test   %eax,%eax
40002575:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    asm volatile ("int %2"
4000257a:	8d 8e 48 c8 ff ff    	lea    -0x37b8(%esi),%ecx
40002580:	ba 03 00 00 00       	mov    $0x3,%edx
    return errno ? -1 : fd;
40002585:	0f 44 c3             	cmove  %ebx,%eax
40002588:	89 c3                	mov    %eax,%ebx
    asm volatile ("int %2"
4000258a:	b8 06 00 00 00       	mov    $0x6,%eax
4000258f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
40002593:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002595:	b8 04 00 00 00       	mov    $0x4,%eax
4000259a:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
4000259e:	cd 30                	int    $0x30
    asm volatile ("int %2"
400025a0:	ba 00 20 00 00       	mov    $0x2000,%edx
400025a5:	8d 8e 4c 00 00 00    	lea    0x4c(%esi),%ecx
400025ab:	b8 05 00 00 00       	mov    $0x5,%eax
400025b0:	89 eb                	mov    %ebp,%ebx
400025b2:	cd 30                	int    $0x30
    if (read(fd, buf, sizeof(buf)) != 5) {
400025b4:	83 fb 05             	cmp    $0x5,%ebx
400025b7:	75 57                	jne    40002610 <unlinkread+0x140>
400025b9:	85 c0                	test   %eax,%eax
400025bb:	75 53                	jne    40002610 <unlinkread+0x140>
    if (buf[0] != 'h') {
400025bd:	80 be 4c 00 00 00 68 	cmpb   $0x68,0x4c(%esi)
400025c4:	0f 85 a6 00 00 00    	jne    40002670 <unlinkread+0x1a0>
    asm volatile ("int %2"
400025ca:	ba 0a 00 00 00       	mov    $0xa,%edx
400025cf:	b8 06 00 00 00       	mov    $0x6,%eax
400025d4:	89 eb                	mov    %ebp,%ebx
400025d6:	cd 30                	int    $0x30
    if (write(fd, buf, 10) != 10) {
400025d8:	83 fb 0a             	cmp    $0xa,%ebx
400025db:	0f 85 af 00 00 00    	jne    40002690 <unlinkread+0x1c0>
400025e1:	85 c0                	test   %eax,%eax
400025e3:	0f 85 a7 00 00 00    	jne    40002690 <unlinkread+0x1c0>
    asm volatile ("int %2"
400025e9:	b8 04 00 00 00       	mov    $0x4,%eax
400025ee:	89 eb                	mov    %ebp,%ebx
400025f0:	cd 30                	int    $0x30
    asm volatile ("int %2"
400025f2:	89 d0                	mov    %edx,%eax
400025f4:	89 fb                	mov    %edi,%ebx
400025f6:	cd 30                	int    $0x30
    printf("=====unlinkread ok=====\n\n");
400025f8:	83 ec 0c             	sub    $0xc,%esp
400025fb:	8d 86 93 c8 ff ff    	lea    -0x376d(%esi),%eax
40002601:	89 f3                	mov    %esi,%ebx
40002603:	50                   	push   %eax
40002604:	e8 47 dd ff ff       	call   40000350 <printf>
40002609:	83 c4 10             	add    $0x10,%esp
4000260c:	eb 16                	jmp    40002624 <unlinkread+0x154>
4000260e:	66 90                	xchg   %ax,%ax
        printf("unlinkread read failed");
40002610:	83 ec 0c             	sub    $0xc,%esp
40002613:	8d 86 4c c8 ff ff    	lea    -0x37b4(%esi),%eax
40002619:	89 f3                	mov    %esi,%ebx
4000261b:	50                   	push   %eax
4000261c:	e8 2f dd ff ff       	call   40000350 <printf>
        exit();
40002621:	83 c4 10             	add    $0x10,%esp
}
40002624:	83 c4 1c             	add    $0x1c,%esp
40002627:	5b                   	pop    %ebx
40002628:	5e                   	pop    %esi
40002629:	5f                   	pop    %edi
4000262a:	5d                   	pop    %ebp
4000262b:	c3                   	ret
4000262c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("create unlinkread failed\n");
40002630:	83 ec 0c             	sub    $0xc,%esp
40002633:	8d 86 fc c7 ff ff    	lea    -0x3804(%esi),%eax
40002639:	89 f3                	mov    %esi,%ebx
4000263b:	50                   	push   %eax
4000263c:	e8 0f dd ff ff       	call   40000350 <printf>
        exit();
40002641:	83 c4 10             	add    $0x10,%esp
}
40002644:	83 c4 1c             	add    $0x1c,%esp
40002647:	5b                   	pop    %ebx
40002648:	5e                   	pop    %esi
40002649:	5f                   	pop    %edi
4000264a:	5d                   	pop    %ebp
4000264b:	c3                   	ret
4000264c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("open unlinkread failed\n");
40002650:	83 ec 0c             	sub    $0xc,%esp
40002653:	8d 86 16 c8 ff ff    	lea    -0x37ea(%esi),%eax
40002659:	89 f3                	mov    %esi,%ebx
4000265b:	50                   	push   %eax
4000265c:	e8 ef dc ff ff       	call   40000350 <printf>
        exit();
40002661:	83 c4 10             	add    $0x10,%esp
}
40002664:	83 c4 1c             	add    $0x1c,%esp
40002667:	5b                   	pop    %ebx
40002668:	5e                   	pop    %esi
40002669:	5f                   	pop    %edi
4000266a:	5d                   	pop    %ebp
4000266b:	c3                   	ret
4000266c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("unlinkread wrong data\n");
40002670:	83 ec 0c             	sub    $0xc,%esp
40002673:	8d 86 63 c8 ff ff    	lea    -0x379d(%esi),%eax
40002679:	89 f3                	mov    %esi,%ebx
4000267b:	50                   	push   %eax
4000267c:	e8 cf dc ff ff       	call   40000350 <printf>
        exit();
40002681:	83 c4 10             	add    $0x10,%esp
40002684:	eb 9e                	jmp    40002624 <unlinkread+0x154>
40002686:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000268d:	00 
4000268e:	66 90                	xchg   %ax,%ax
        printf("unlinkread write failed\n");
40002690:	83 ec 0c             	sub    $0xc,%esp
40002693:	8d 86 7a c8 ff ff    	lea    -0x3786(%esi),%eax
40002699:	89 f3                	mov    %esi,%ebx
4000269b:	50                   	push   %eax
4000269c:	e8 af dc ff ff       	call   40000350 <printf>
        exit();
400026a1:	83 c4 10             	add    $0x10,%esp
}
400026a4:	83 c4 1c             	add    $0x1c,%esp
400026a7:	5b                   	pop    %ebx
400026a8:	5e                   	pop    %esi
400026a9:	5f                   	pop    %edi
400026aa:	5d                   	pop    %ebp
400026ab:	c3                   	ret
400026ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf("unlink unlinkread failed\n");
400026b0:	83 ec 0c             	sub    $0xc,%esp
400026b3:	8d 86 2e c8 ff ff    	lea    -0x37d2(%esi),%eax
400026b9:	89 f3                	mov    %esi,%ebx
400026bb:	50                   	push   %eax
400026bc:	e8 8f dc ff ff       	call   40000350 <printf>
        exit();
400026c1:	83 c4 10             	add    $0x10,%esp
400026c4:	e9 5b ff ff ff       	jmp    40002624 <unlinkread+0x154>
400026c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

400026d0 <dirfile>:
{
400026d0:	55                   	push   %ebp
400026d1:	57                   	push   %edi
    asm volatile ("int %2"
400026d2:	bf 03 00 00 00       	mov    $0x3,%edi
400026d7:	56                   	push   %esi
400026d8:	e8 ce 04 00 00       	call   40002bab <__x86.get_pc_thunk.si>
400026dd:	81 c6 17 49 00 00    	add    $0x4917,%esi
400026e3:	53                   	push   %ebx
400026e4:	83 ec 18             	sub    $0x18,%esp
    printf("=====dir vs file=====\n");
400026e7:	8d 86 ad c8 ff ff    	lea    -0x3753(%esi),%eax
400026ed:	89 f3                	mov    %esi,%ebx
400026ef:	50                   	push   %eax
400026f0:	e8 5b dc ff ff       	call   40000350 <printf>
400026f5:	8d 96 c4 c8 ff ff    	lea    -0x373c(%esi),%edx
400026fb:	b9 00 02 00 00       	mov    $0x200,%ecx
40002700:	89 f8                	mov    %edi,%eax
40002702:	89 d3                	mov    %edx,%ebx
40002704:	cd 30                	int    $0x30
    return errno ? -1 : fd;
40002706:	83 c4 10             	add    $0x10,%esp
    if (fd < 0) {
40002709:	85 c0                	test   %eax,%eax
4000270b:	75 3b                	jne    40002748 <dirfile+0x78>
4000270d:	85 db                	test   %ebx,%ebx
4000270f:	78 37                	js     40002748 <dirfile+0x78>
    asm volatile ("int %2"
40002711:	b8 04 00 00 00       	mov    $0x4,%eax
40002716:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002718:	b8 08 00 00 00       	mov    $0x8,%eax
4000271d:	89 d3                	mov    %edx,%ebx
4000271f:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002721:	85 c0                	test   %eax,%eax
40002723:	75 43                	jne    40002768 <dirfile+0x98>
        printf("chdir dirfile succeeded!\n");
40002725:	83 ec 0c             	sub    $0xc,%esp
40002728:	8d 86 e3 c8 ff ff    	lea    -0x371d(%esi),%eax
4000272e:	89 f3                	mov    %esi,%ebx
40002730:	50                   	push   %eax
40002731:	e8 1a dc ff ff       	call   40000350 <printf>
        exit();
40002736:	83 c4 10             	add    $0x10,%esp
}
40002739:	83 c4 0c             	add    $0xc,%esp
4000273c:	5b                   	pop    %ebx
4000273d:	5e                   	pop    %esi
4000273e:	5f                   	pop    %edi
4000273f:	5d                   	pop    %ebp
40002740:	c3                   	ret
40002741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf("create dirfile failed\n");
40002748:	83 ec 0c             	sub    $0xc,%esp
4000274b:	8d 86 cc c8 ff ff    	lea    -0x3734(%esi),%eax
40002751:	89 f3                	mov    %esi,%ebx
40002753:	50                   	push   %eax
40002754:	e8 f7 db ff ff       	call   40000350 <printf>
        exit();
40002759:	83 c4 10             	add    $0x10,%esp
}
4000275c:	83 c4 0c             	add    $0xc,%esp
4000275f:	5b                   	pop    %ebx
40002760:	5e                   	pop    %esi
40002761:	5f                   	pop    %edi
40002762:	5d                   	pop    %ebp
40002763:	c3                   	ret
40002764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    asm volatile ("int %2"
40002768:	8d ae fd c8 ff ff    	lea    -0x3703(%esi),%ebp
4000276e:	31 c9                	xor    %ecx,%ecx
40002770:	89 f8                	mov    %edi,%eax
40002772:	89 eb                	mov    %ebp,%ebx
40002774:	cd 30                	int    $0x30
    if (fd >= 0) {
40002776:	85 db                	test   %ebx,%ebx
40002778:	78 04                	js     4000277e <dirfile+0xae>
4000277a:	85 c0                	test   %eax,%eax
4000277c:	74 39                	je     400027b7 <dirfile+0xe7>
4000277e:	b8 03 00 00 00       	mov    $0x3,%eax
40002783:	b9 00 02 00 00       	mov    $0x200,%ecx
40002788:	89 eb                	mov    %ebp,%ebx
4000278a:	cd 30                	int    $0x30
    if (fd >= 0) {
4000278c:	85 db                	test   %ebx,%ebx
4000278e:	78 04                	js     40002794 <dirfile+0xc4>
40002790:	85 c0                	test   %eax,%eax
40002792:	74 23                	je     400027b7 <dirfile+0xe7>
    asm volatile ("int %2"
40002794:	b8 07 00 00 00       	mov    $0x7,%eax
40002799:	89 eb                	mov    %ebp,%ebx
4000279b:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000279d:	85 c0                	test   %eax,%eax
4000279f:	75 2f                	jne    400027d0 <dirfile+0x100>
        printf("mkdir dirfile/xx succeeded!\n");
400027a1:	83 ec 0c             	sub    $0xc,%esp
400027a4:	8d 86 26 c9 ff ff    	lea    -0x36da(%esi),%eax
400027aa:	89 f3                	mov    %esi,%ebx
400027ac:	50                   	push   %eax
400027ad:	e8 9e db ff ff       	call   40000350 <printf>
        exit();
400027b2:	83 c4 10             	add    $0x10,%esp
400027b5:	eb 82                	jmp    40002739 <dirfile+0x69>
        printf("create dirfile/xx succeeded!\n");
400027b7:	83 ec 0c             	sub    $0xc,%esp
400027ba:	8d 86 08 c9 ff ff    	lea    -0x36f8(%esi),%eax
400027c0:	89 f3                	mov    %esi,%ebx
400027c2:	50                   	push   %eax
400027c3:	e8 88 db ff ff       	call   40000350 <printf>
        exit();
400027c8:	83 c4 10             	add    $0x10,%esp
400027cb:	e9 69 ff ff ff       	jmp    40002739 <dirfile+0x69>
    asm volatile ("int %2"
400027d0:	bf 0a 00 00 00       	mov    $0xa,%edi
400027d5:	89 eb                	mov    %ebp,%ebx
400027d7:	89 f8                	mov    %edi,%eax
400027d9:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400027db:	85 c0                	test   %eax,%eax
400027dd:	75 19                	jne    400027f8 <dirfile+0x128>
        printf("unlink dirfile/xx succeeded!\n");
400027df:	83 ec 0c             	sub    $0xc,%esp
400027e2:	8d 86 43 c9 ff ff    	lea    -0x36bd(%esi),%eax
400027e8:	89 f3                	mov    %esi,%ebx
400027ea:	50                   	push   %eax
400027eb:	e8 60 db ff ff       	call   40000350 <printf>
        exit();
400027f0:	83 c4 10             	add    $0x10,%esp
400027f3:	e9 41 ff ff ff       	jmp    40002739 <dirfile+0x69>
    asm volatile ("int %2"
400027f8:	b8 09 00 00 00       	mov    $0x9,%eax
400027fd:	8d 9e 61 c9 ff ff    	lea    -0x369f(%esi),%ebx
40002803:	89 e9                	mov    %ebp,%ecx
40002805:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002807:	85 c0                	test   %eax,%eax
40002809:	75 19                	jne    40002824 <dirfile+0x154>
        printf("link to dirfile/xx succeeded!\n");
4000280b:	83 ec 0c             	sub    $0xc,%esp
4000280e:	8d 86 14 d0 ff ff    	lea    -0x2fec(%esi),%eax
40002814:	89 f3                	mov    %esi,%ebx
40002816:	50                   	push   %eax
40002817:	e8 34 db ff ff       	call   40000350 <printf>
        exit();
4000281c:	83 c4 10             	add    $0x10,%esp
4000281f:	e9 15 ff ff ff       	jmp    40002739 <dirfile+0x69>
    asm volatile ("int %2"
40002824:	89 f8                	mov    %edi,%eax
40002826:	89 d3                	mov    %edx,%ebx
40002828:	cd 30                	int    $0x30
    return errno ? -1 : 0;
4000282a:	85 c0                	test   %eax,%eax
4000282c:	0f 85 8e 00 00 00    	jne    400028c0 <dirfile+0x1f0>
    asm volatile ("int %2"
40002832:	8d 96 14 c5 ff ff    	lea    -0x3aec(%esi),%edx
40002838:	b8 03 00 00 00       	mov    $0x3,%eax
4000283d:	b9 02 00 00 00       	mov    $0x2,%ecx
40002842:	89 d3                	mov    %edx,%ebx
40002844:	cd 30                	int    $0x30
    if (fd >= 0) {
40002846:	85 db                	test   %ebx,%ebx
40002848:	78 08                	js     40002852 <dirfile+0x182>
4000284a:	85 c0                	test   %eax,%eax
4000284c:	0f 84 87 00 00 00    	je     400028d9 <dirfile+0x209>
40002852:	b8 03 00 00 00       	mov    $0x3,%eax
40002857:	31 c9                	xor    %ecx,%ecx
40002859:	89 d3                	mov    %edx,%ebx
4000285b:	cd 30                	int    $0x30
    return errno ? -1 : fd;
4000285d:	85 c0                	test   %eax,%eax
4000285f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    asm volatile ("int %2"
40002864:	8d 8e f7 c5 ff ff    	lea    -0x3a09(%esi),%ecx
4000286a:	ba 01 00 00 00       	mov    $0x1,%edx
    return errno ? -1 : fd;
4000286f:	0f 44 c3             	cmove  %ebx,%eax
40002872:	89 c7                	mov    %eax,%edi
    asm volatile ("int %2"
40002874:	b8 06 00 00 00       	mov    $0x6,%eax
40002879:	89 fb                	mov    %edi,%ebx
4000287b:	cd 30                	int    $0x30
    return errno ? -1 : ret;
4000287d:	85 c0                	test   %eax,%eax
4000287f:	75 04                	jne    40002885 <dirfile+0x1b5>
    if (write(fd, "x", 1) > 0) {
40002881:	85 db                	test   %ebx,%ebx
40002883:	7f 22                	jg     400028a7 <dirfile+0x1d7>
    asm volatile ("int %2"
40002885:	b8 04 00 00 00       	mov    $0x4,%eax
4000288a:	89 fb                	mov    %edi,%ebx
4000288c:	cd 30                	int    $0x30
    printf("=====dir vs file OK=====\n\n");
4000288e:	83 ec 0c             	sub    $0xc,%esp
40002891:	8d 86 94 c9 ff ff    	lea    -0x366c(%esi),%eax
40002897:	89 f3                	mov    %esi,%ebx
40002899:	50                   	push   %eax
4000289a:	e8 b1 da ff ff       	call   40000350 <printf>
4000289f:	83 c4 10             	add    $0x10,%esp
400028a2:	e9 92 fe ff ff       	jmp    40002739 <dirfile+0x69>
        printf("write . succeeded!\n");
400028a7:	83 ec 0c             	sub    $0xc,%esp
400028aa:	8d 86 80 c9 ff ff    	lea    -0x3680(%esi),%eax
400028b0:	89 f3                	mov    %esi,%ebx
400028b2:	50                   	push   %eax
400028b3:	e8 98 da ff ff       	call   40000350 <printf>
        exit();
400028b8:	83 c4 10             	add    $0x10,%esp
400028bb:	e9 79 fe ff ff       	jmp    40002739 <dirfile+0x69>
        printf("unlink dirfile failed!\n");
400028c0:	83 ec 0c             	sub    $0xc,%esp
400028c3:	8d 86 68 c9 ff ff    	lea    -0x3698(%esi),%eax
400028c9:	89 f3                	mov    %esi,%ebx
400028cb:	50                   	push   %eax
400028cc:	e8 7f da ff ff       	call   40000350 <printf>
        exit();
400028d1:	83 c4 10             	add    $0x10,%esp
400028d4:	e9 60 fe ff ff       	jmp    40002739 <dirfile+0x69>
        printf("open . for writing succeeded!\n");
400028d9:	83 ec 0c             	sub    $0xc,%esp
400028dc:	8d 86 34 d0 ff ff    	lea    -0x2fcc(%esi),%eax
400028e2:	89 f3                	mov    %esi,%ebx
400028e4:	50                   	push   %eax
400028e5:	e8 66 da ff ff       	call   40000350 <printf>
        exit();
400028ea:	83 c4 10             	add    $0x10,%esp
400028ed:	e9 47 fe ff ff       	jmp    40002739 <dirfile+0x69>
400028f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400028f9:	00 
400028fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40002900 <iref>:
{
40002900:	55                   	push   %ebp
    printf("=====empty file name=====\n");
40002901:	bd 33 00 00 00       	mov    $0x33,%ebp
{
40002906:	57                   	push   %edi
40002907:	e8 a3 02 00 00       	call   40002baf <__x86.get_pc_thunk.di>
4000290c:	81 c7 e8 46 00 00    	add    $0x46e8,%edi
40002912:	56                   	push   %esi
40002913:	53                   	push   %ebx
40002914:	83 ec 28             	sub    $0x28,%esp
    printf("=====empty file name=====\n");
40002917:	8d 87 af c9 ff ff    	lea    -0x3651(%edi),%eax
4000291d:	89 fb                	mov    %edi,%ebx
4000291f:	50                   	push   %eax
40002920:	e8 2b da ff ff       	call   40000350 <printf>
40002925:	83 c4 10             	add    $0x10,%esp
40002928:	8d 87 ca c9 ff ff    	lea    -0x3636(%edi),%eax
    asm volatile ("int %2"
4000292e:	8d 97 ae c9 ff ff    	lea    -0x3652(%edi),%edx
40002934:	89 44 24 08          	mov    %eax,0x8(%esp)
    asm volatile ("int %2"
40002938:	8d 87 61 c9 ff ff    	lea    -0x369f(%edi),%eax
4000293e:	89 44 24 0c          	mov    %eax,0xc(%esp)
40002942:	eb 78                	jmp    400029bc <iref+0xbc>
40002944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    asm volatile ("int %2"
40002948:	8b 5c 24 08          	mov    0x8(%esp),%ebx
4000294c:	b8 08 00 00 00       	mov    $0x8,%eax
40002951:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002953:	85 c0                	test   %eax,%eax
40002955:	0f 85 c5 00 00 00    	jne    40002a20 <iref+0x120>
    asm volatile ("int %2"
4000295b:	89 c8                	mov    %ecx,%eax
4000295d:	89 d3                	mov    %edx,%ebx
4000295f:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002961:	b8 09 00 00 00       	mov    $0x9,%eax
40002966:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
4000296a:	89 d1                	mov    %edx,%ecx
4000296c:	cd 30                	int    $0x30
    asm volatile ("int %2"
4000296e:	b8 03 00 00 00       	mov    $0x3,%eax
40002973:	b9 00 02 00 00       	mov    $0x200,%ecx
40002978:	89 d3                	mov    %edx,%ebx
4000297a:	cd 30                	int    $0x30
        if (fd >= 0)
4000297c:	85 db                	test   %ebx,%ebx
4000297e:	78 0b                	js     4000298b <iref+0x8b>
40002980:	85 c0                	test   %eax,%eax
40002982:	75 07                	jne    4000298b <iref+0x8b>
    asm volatile ("int %2"
40002984:	b8 04 00 00 00       	mov    $0x4,%eax
40002989:	cd 30                	int    $0x30
    asm volatile ("int %2"
4000298b:	8d b7 f6 c5 ff ff    	lea    -0x3a0a(%edi),%esi
40002991:	b8 03 00 00 00       	mov    $0x3,%eax
40002996:	b9 00 02 00 00       	mov    $0x200,%ecx
4000299b:	89 f3                	mov    %esi,%ebx
4000299d:	cd 30                	int    $0x30
        if (fd >= 0)
4000299f:	85 db                	test   %ebx,%ebx
400029a1:	78 0b                	js     400029ae <iref+0xae>
400029a3:	85 c0                	test   %eax,%eax
400029a5:	75 07                	jne    400029ae <iref+0xae>
    asm volatile ("int %2"
400029a7:	b8 04 00 00 00       	mov    $0x4,%eax
400029ac:	cd 30                	int    $0x30
    asm volatile ("int %2"
400029ae:	b8 0a 00 00 00       	mov    $0xa,%eax
400029b3:	89 f3                	mov    %esi,%ebx
400029b5:	cd 30                	int    $0x30
    for (i = 0; i < 50 + 1; i++) {
400029b7:	83 ed 01             	sub    $0x1,%ebp
400029ba:	74 34                	je     400029f0 <iref+0xf0>
    asm volatile ("int %2"
400029bc:	b9 07 00 00 00       	mov    $0x7,%ecx
400029c1:	8b 5c 24 08          	mov    0x8(%esp),%ebx
400029c5:	89 c8                	mov    %ecx,%eax
400029c7:	cd 30                	int    $0x30
    return errno ? -1 : 0;
400029c9:	85 c0                	test   %eax,%eax
400029cb:	0f 84 77 ff ff ff    	je     40002948 <iref+0x48>
            printf("mkdir irefd failed\n");
400029d1:	83 ec 0c             	sub    $0xc,%esp
400029d4:	8d 87 d0 c9 ff ff    	lea    -0x3630(%edi),%eax
400029da:	89 fb                	mov    %edi,%ebx
400029dc:	50                   	push   %eax
400029dd:	e8 6e d9 ff ff       	call   40000350 <printf>
            exit();
400029e2:	83 c4 10             	add    $0x10,%esp
}
400029e5:	83 c4 1c             	add    $0x1c,%esp
400029e8:	5b                   	pop    %ebx
400029e9:	5e                   	pop    %esi
400029ea:	5f                   	pop    %edi
400029eb:	5d                   	pop    %ebp
400029ec:	c3                   	ret
400029ed:	8d 76 00             	lea    0x0(%esi),%esi
    asm volatile ("int %2"
400029f0:	b8 08 00 00 00       	mov    $0x8,%eax
400029f5:	8d 9f 26 c2 ff ff    	lea    -0x3dda(%edi),%ebx
400029fb:	cd 30                	int    $0x30
    printf("=====empty file name OK=====\n\n");
400029fd:	83 ec 0c             	sub    $0xc,%esp
40002a00:	8d 87 54 d0 ff ff    	lea    -0x2fac(%edi),%eax
40002a06:	89 fb                	mov    %edi,%ebx
40002a08:	50                   	push   %eax
40002a09:	e8 42 d9 ff ff       	call   40000350 <printf>
40002a0e:	83 c4 10             	add    $0x10,%esp
}
40002a11:	83 c4 1c             	add    $0x1c,%esp
40002a14:	5b                   	pop    %ebx
40002a15:	5e                   	pop    %esi
40002a16:	5f                   	pop    %edi
40002a17:	5d                   	pop    %ebp
40002a18:	c3                   	ret
40002a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printf("chdir irefd failed\n");
40002a20:	83 ec 0c             	sub    $0xc,%esp
40002a23:	8d 87 e4 c9 ff ff    	lea    -0x361c(%edi),%eax
40002a29:	89 fb                	mov    %edi,%ebx
40002a2b:	50                   	push   %eax
40002a2c:	e8 1f d9 ff ff       	call   40000350 <printf>
            exit();
40002a31:	83 c4 10             	add    $0x10,%esp
}
40002a34:	83 c4 1c             	add    $0x1c,%esp
40002a37:	5b                   	pop    %ebx
40002a38:	5e                   	pop    %esi
40002a39:	5f                   	pop    %edi
40002a3a:	5d                   	pop    %ebp
40002a3b:	c3                   	ret
40002a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40002a40 <bigdir>:
{
40002a40:	55                   	push   %ebp
40002a41:	57                   	push   %edi
40002a42:	56                   	push   %esi
40002a43:	e8 63 01 00 00       	call   40002bab <__x86.get_pc_thunk.si>
40002a48:	81 c6 ac 45 00 00    	add    $0x45ac,%esi
40002a4e:	53                   	push   %ebx
40002a4f:	83 ec 28             	sub    $0x28,%esp
    printf("=====bigdir test=====\n");
40002a52:	8d 86 f8 c9 ff ff    	lea    -0x3608(%esi),%eax
40002a58:	89 f3                	mov    %esi,%ebx
40002a5a:	50                   	push   %eax
40002a5b:	e8 f0 d8 ff ff       	call   40000350 <printf>
    asm volatile ("int %2"
40002a60:	8d 9e 0f ca ff ff    	lea    -0x35f1(%esi),%ebx
40002a66:	b8 0a 00 00 00       	mov    $0xa,%eax
40002a6b:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
40002a6f:	cd 30                	int    $0x30
    asm volatile ("int %2"
40002a71:	b8 03 00 00 00       	mov    $0x3,%eax
40002a76:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40002a7a:	b9 00 02 00 00       	mov    $0x200,%ecx
40002a7f:	cd 30                	int    $0x30
    if (fd < 0) {
40002a81:	83 c4 10             	add    $0x10,%esp
40002a84:	85 db                	test   %ebx,%ebx
40002a86:	0f 88 7c 00 00 00    	js     40002b08 <bigdir+0xc8>
40002a8c:	85 c0                	test   %eax,%eax
40002a8e:	75 78                	jne    40002b08 <bigdir+0xc8>
    asm volatile ("int %2"
40002a90:	b8 04 00 00 00       	mov    $0x4,%eax
40002a95:	cd 30                	int    $0x30
40002a97:	31 ed                	xor    %ebp,%ebp
    asm volatile ("int %2"
40002a99:	8b 54 24 0c          	mov    0xc(%esp),%edx
40002a9d:	8d 3d 2c 00 00 00    	lea    0x2c,%edi
40002aa3:	8d 8e 2c 00 00 00    	lea    0x2c(%esi),%ecx
40002aa9:	eb 10                	jmp    40002abb <bigdir+0x7b>
40002aab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    for (i = 0; i < 500; i++) {
40002ab0:	83 c5 01             	add    $0x1,%ebp
40002ab3:	81 fd f4 01 00 00    	cmp    $0x1f4,%ebp
40002ab9:	74 69                	je     40002b24 <bigdir+0xe4>
        namel[1] = '0' + (i / 64);
40002abb:	89 e8                	mov    %ebp,%eax
        namel[0] = 'x';
40002abd:	c6 04 37 78          	movb   $0x78,(%edi,%esi,1)
40002ac1:	89 d3                	mov    %edx,%ebx
        namel[1] = '0' + (i / 64);
40002ac3:	c1 f8 06             	sar    $0x6,%eax
        namel[3] = '\0';
40002ac6:	c6 44 37 03 00       	movb   $0x0,0x3(%edi,%esi,1)
        namel[1] = '0' + (i / 64);
40002acb:	83 c0 30             	add    $0x30,%eax
40002ace:	88 44 37 01          	mov    %al,0x1(%edi,%esi,1)
        namel[2] = '0' + (i % 64);
40002ad2:	89 e8                	mov    %ebp,%eax
40002ad4:	83 e0 3f             	and    $0x3f,%eax
40002ad7:	83 c0 30             	add    $0x30,%eax
40002ada:	88 44 37 02          	mov    %al,0x2(%edi,%esi,1)
40002ade:	b8 09 00 00 00       	mov    $0x9,%eax
40002ae3:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002ae5:	85 c0                	test   %eax,%eax
40002ae7:	74 c7                	je     40002ab0 <bigdir+0x70>
            printf("bigdir link failed\n");
40002ae9:	83 ec 0c             	sub    $0xc,%esp
40002aec:	8d 86 28 ca ff ff    	lea    -0x35d8(%esi),%eax
40002af2:	89 f3                	mov    %esi,%ebx
40002af4:	50                   	push   %eax
40002af5:	e8 56 d8 ff ff       	call   40000350 <printf>
            exit();
40002afa:	83 c4 10             	add    $0x10,%esp
}
40002afd:	83 c4 1c             	add    $0x1c,%esp
40002b00:	5b                   	pop    %ebx
40002b01:	5e                   	pop    %esi
40002b02:	5f                   	pop    %edi
40002b03:	5d                   	pop    %ebp
40002b04:	c3                   	ret
40002b05:	8d 76 00             	lea    0x0(%esi),%esi
        printf("bigdir create failed\n");
40002b08:	83 ec 0c             	sub    $0xc,%esp
40002b0b:	8d 86 12 ca ff ff    	lea    -0x35ee(%esi),%eax
40002b11:	89 f3                	mov    %esi,%ebx
40002b13:	50                   	push   %eax
40002b14:	e8 37 d8 ff ff       	call   40000350 <printf>
        exit();
40002b19:	83 c4 10             	add    $0x10,%esp
}
40002b1c:	83 c4 1c             	add    $0x1c,%esp
40002b1f:	5b                   	pop    %ebx
40002b20:	5e                   	pop    %esi
40002b21:	5f                   	pop    %edi
40002b22:	5d                   	pop    %ebp
40002b23:	c3                   	ret
40002b24:	89 c2                	mov    %eax,%edx
    asm volatile ("int %2"
40002b26:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40002b2a:	b8 0a 00 00 00       	mov    $0xa,%eax
40002b2f:	cd 30                	int    $0x30
40002b31:	bd 0a 00 00 00       	mov    $0xa,%ebp
40002b36:	eb 13                	jmp    40002b4b <bigdir+0x10b>
40002b38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002b3f:	00 
    for (i = 0; i < 500; i++) {
40002b40:	83 c2 01             	add    $0x1,%edx
40002b43:	81 fa f4 01 00 00    	cmp    $0x1f4,%edx
40002b49:	74 47                	je     40002b92 <bigdir+0x152>
        namel[1] = '0' + (i / 64);
40002b4b:	89 d0                	mov    %edx,%eax
        namel[0] = 'x';
40002b4d:	c6 04 37 78          	movb   $0x78,(%edi,%esi,1)
40002b51:	89 cb                	mov    %ecx,%ebx
        namel[1] = '0' + (i / 64);
40002b53:	c1 f8 06             	sar    $0x6,%eax
        namel[3] = '\0';
40002b56:	c6 44 37 03 00       	movb   $0x0,0x3(%edi,%esi,1)
        namel[1] = '0' + (i / 64);
40002b5b:	83 c0 30             	add    $0x30,%eax
40002b5e:	88 44 37 01          	mov    %al,0x1(%edi,%esi,1)
        namel[2] = '0' + (i % 64);
40002b62:	89 d0                	mov    %edx,%eax
40002b64:	83 e0 3f             	and    $0x3f,%eax
40002b67:	83 c0 30             	add    $0x30,%eax
40002b6a:	88 44 37 02          	mov    %al,0x2(%edi,%esi,1)
40002b6e:	89 e8                	mov    %ebp,%eax
40002b70:	cd 30                	int    $0x30
    return errno ? -1 : 0;
40002b72:	85 c0                	test   %eax,%eax
40002b74:	74 ca                	je     40002b40 <bigdir+0x100>
            printf("bigdir unlink failed");
40002b76:	83 ec 0c             	sub    $0xc,%esp
40002b79:	8d 86 3c ca ff ff    	lea    -0x35c4(%esi),%eax
40002b7f:	89 f3                	mov    %esi,%ebx
40002b81:	50                   	push   %eax
40002b82:	e8 c9 d7 ff ff       	call   40000350 <printf>
            exit();
40002b87:	83 c4 10             	add    $0x10,%esp
}
40002b8a:	83 c4 1c             	add    $0x1c,%esp
40002b8d:	5b                   	pop    %ebx
40002b8e:	5e                   	pop    %esi
40002b8f:	5f                   	pop    %edi
40002b90:	5d                   	pop    %ebp
40002b91:	c3                   	ret
    printf("=====bigdir ok=====\n\n");
40002b92:	83 ec 0c             	sub    $0xc,%esp
40002b95:	8d 86 51 ca ff ff    	lea    -0x35af(%esi),%eax
40002b9b:	89 f3                	mov    %esi,%ebx
40002b9d:	50                   	push   %eax
40002b9e:	e8 ad d7 ff ff       	call   40000350 <printf>
40002ba3:	83 c4 10             	add    $0x10,%esp
40002ba6:	e9 52 ff ff ff       	jmp    40002afd <bigdir+0xbd>

40002bab <__x86.get_pc_thunk.si>:
40002bab:	8b 34 24             	mov    (%esp),%esi
40002bae:	c3                   	ret

40002baf <__x86.get_pc_thunk.di>:
40002baf:	8b 3c 24             	mov    (%esp),%edi
40002bb2:	c3                   	ret

40002bb3 <__x86.get_pc_thunk.bp>:
40002bb3:	8b 2c 24             	mov    (%esp),%ebp
40002bb6:	c3                   	ret
40002bb7:	66 90                	xchg   %ax,%ax
40002bb9:	66 90                	xchg   %ax,%ax
40002bbb:	66 90                	xchg   %ax,%ax
40002bbd:	66 90                	xchg   %ax,%ax
40002bbf:	90                   	nop

40002bc0 <__udivdi3>:
40002bc0:	f3 0f 1e fb          	endbr32
40002bc4:	55                   	push   %ebp
40002bc5:	89 e5                	mov    %esp,%ebp
40002bc7:	57                   	push   %edi
40002bc8:	56                   	push   %esi
40002bc9:	53                   	push   %ebx
40002bca:	83 ec 1c             	sub    $0x1c,%esp
40002bcd:	8b 7d 08             	mov    0x8(%ebp),%edi
40002bd0:	8b 45 14             	mov    0x14(%ebp),%eax
40002bd3:	8b 75 0c             	mov    0xc(%ebp),%esi
40002bd6:	8b 5d 10             	mov    0x10(%ebp),%ebx
40002bd9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
40002bdc:	85 c0                	test   %eax,%eax
40002bde:	75 20                	jne    40002c00 <__udivdi3+0x40>
40002be0:	39 de                	cmp    %ebx,%esi
40002be2:	73 54                	jae    40002c38 <__udivdi3+0x78>
40002be4:	89 f8                	mov    %edi,%eax
40002be6:	31 ff                	xor    %edi,%edi
40002be8:	89 f2                	mov    %esi,%edx
40002bea:	f7 f3                	div    %ebx
40002bec:	89 fa                	mov    %edi,%edx
40002bee:	83 c4 1c             	add    $0x1c,%esp
40002bf1:	5b                   	pop    %ebx
40002bf2:	5e                   	pop    %esi
40002bf3:	5f                   	pop    %edi
40002bf4:	5d                   	pop    %ebp
40002bf5:	c3                   	ret
40002bf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002bfd:	00 
40002bfe:	66 90                	xchg   %ax,%ax
40002c00:	39 c6                	cmp    %eax,%esi
40002c02:	73 14                	jae    40002c18 <__udivdi3+0x58>
40002c04:	31 ff                	xor    %edi,%edi
40002c06:	31 c0                	xor    %eax,%eax
40002c08:	89 fa                	mov    %edi,%edx
40002c0a:	83 c4 1c             	add    $0x1c,%esp
40002c0d:	5b                   	pop    %ebx
40002c0e:	5e                   	pop    %esi
40002c0f:	5f                   	pop    %edi
40002c10:	5d                   	pop    %ebp
40002c11:	c3                   	ret
40002c12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40002c18:	0f bd f8             	bsr    %eax,%edi
40002c1b:	83 f7 1f             	xor    $0x1f,%edi
40002c1e:	75 48                	jne    40002c68 <__udivdi3+0xa8>
40002c20:	39 f0                	cmp    %esi,%eax
40002c22:	72 07                	jb     40002c2b <__udivdi3+0x6b>
40002c24:	31 c0                	xor    %eax,%eax
40002c26:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
40002c29:	72 dd                	jb     40002c08 <__udivdi3+0x48>
40002c2b:	b8 01 00 00 00       	mov    $0x1,%eax
40002c30:	eb d6                	jmp    40002c08 <__udivdi3+0x48>
40002c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40002c38:	89 d9                	mov    %ebx,%ecx
40002c3a:	85 db                	test   %ebx,%ebx
40002c3c:	75 0b                	jne    40002c49 <__udivdi3+0x89>
40002c3e:	b8 01 00 00 00       	mov    $0x1,%eax
40002c43:	31 d2                	xor    %edx,%edx
40002c45:	f7 f3                	div    %ebx
40002c47:	89 c1                	mov    %eax,%ecx
40002c49:	31 d2                	xor    %edx,%edx
40002c4b:	89 f0                	mov    %esi,%eax
40002c4d:	f7 f1                	div    %ecx
40002c4f:	89 c6                	mov    %eax,%esi
40002c51:	8b 45 e4             	mov    -0x1c(%ebp),%eax
40002c54:	89 f7                	mov    %esi,%edi
40002c56:	f7 f1                	div    %ecx
40002c58:	89 fa                	mov    %edi,%edx
40002c5a:	83 c4 1c             	add    $0x1c,%esp
40002c5d:	5b                   	pop    %ebx
40002c5e:	5e                   	pop    %esi
40002c5f:	5f                   	pop    %edi
40002c60:	5d                   	pop    %ebp
40002c61:	c3                   	ret
40002c62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40002c68:	89 f9                	mov    %edi,%ecx
40002c6a:	ba 20 00 00 00       	mov    $0x20,%edx
40002c6f:	29 fa                	sub    %edi,%edx
40002c71:	d3 e0                	shl    %cl,%eax
40002c73:	89 45 e0             	mov    %eax,-0x20(%ebp)
40002c76:	89 d1                	mov    %edx,%ecx
40002c78:	89 d8                	mov    %ebx,%eax
40002c7a:	d3 e8                	shr    %cl,%eax
40002c7c:	89 c1                	mov    %eax,%ecx
40002c7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
40002c81:	09 c1                	or     %eax,%ecx
40002c83:	89 f0                	mov    %esi,%eax
40002c85:	89 4d e0             	mov    %ecx,-0x20(%ebp)
40002c88:	89 f9                	mov    %edi,%ecx
40002c8a:	d3 e3                	shl    %cl,%ebx
40002c8c:	89 d1                	mov    %edx,%ecx
40002c8e:	d3 e8                	shr    %cl,%eax
40002c90:	89 5d dc             	mov    %ebx,-0x24(%ebp)
40002c93:	89 f9                	mov    %edi,%ecx
40002c95:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
40002c98:	d3 e6                	shl    %cl,%esi
40002c9a:	89 d1                	mov    %edx,%ecx
40002c9c:	d3 eb                	shr    %cl,%ebx
40002c9e:	09 f3                	or     %esi,%ebx
40002ca0:	89 c6                	mov    %eax,%esi
40002ca2:	89 f2                	mov    %esi,%edx
40002ca4:	89 d8                	mov    %ebx,%eax
40002ca6:	f7 75 e0             	divl   -0x20(%ebp)
40002ca9:	89 d6                	mov    %edx,%esi
40002cab:	89 c3                	mov    %eax,%ebx
40002cad:	f7 65 dc             	mull   -0x24(%ebp)
40002cb0:	89 55 e0             	mov    %edx,-0x20(%ebp)
40002cb3:	39 d6                	cmp    %edx,%esi
40002cb5:	72 21                	jb     40002cd8 <__udivdi3+0x118>
40002cb7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
40002cba:	89 f9                	mov    %edi,%ecx
40002cbc:	d3 e2                	shl    %cl,%edx
40002cbe:	39 c2                	cmp    %eax,%edx
40002cc0:	73 07                	jae    40002cc9 <__udivdi3+0x109>
40002cc2:	8b 55 e0             	mov    -0x20(%ebp),%edx
40002cc5:	39 d6                	cmp    %edx,%esi
40002cc7:	74 0f                	je     40002cd8 <__udivdi3+0x118>
40002cc9:	89 d8                	mov    %ebx,%eax
40002ccb:	31 ff                	xor    %edi,%edi
40002ccd:	e9 36 ff ff ff       	jmp    40002c08 <__udivdi3+0x48>
40002cd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40002cd8:	8d 43 ff             	lea    -0x1(%ebx),%eax
40002cdb:	31 ff                	xor    %edi,%edi
40002cdd:	e9 26 ff ff ff       	jmp    40002c08 <__udivdi3+0x48>
40002ce2:	66 90                	xchg   %ax,%ax
40002ce4:	66 90                	xchg   %ax,%ax
40002ce6:	66 90                	xchg   %ax,%ax
40002ce8:	66 90                	xchg   %ax,%ax
40002cea:	66 90                	xchg   %ax,%ax
40002cec:	66 90                	xchg   %ax,%ax
40002cee:	66 90                	xchg   %ax,%ax

40002cf0 <__umoddi3>:
40002cf0:	f3 0f 1e fb          	endbr32
40002cf4:	55                   	push   %ebp
40002cf5:	89 e5                	mov    %esp,%ebp
40002cf7:	57                   	push   %edi
40002cf8:	56                   	push   %esi
40002cf9:	53                   	push   %ebx
40002cfa:	83 ec 2c             	sub    $0x2c,%esp
40002cfd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
40002d00:	8b 45 14             	mov    0x14(%ebp),%eax
40002d03:	8b 75 08             	mov    0x8(%ebp),%esi
40002d06:	8b 7d 10             	mov    0x10(%ebp),%edi
40002d09:	89 da                	mov    %ebx,%edx
40002d0b:	85 c0                	test   %eax,%eax
40002d0d:	75 19                	jne    40002d28 <__umoddi3+0x38>
40002d0f:	39 fb                	cmp    %edi,%ebx
40002d11:	73 5d                	jae    40002d70 <__umoddi3+0x80>
40002d13:	89 f0                	mov    %esi,%eax
40002d15:	f7 f7                	div    %edi
40002d17:	89 d0                	mov    %edx,%eax
40002d19:	31 d2                	xor    %edx,%edx
40002d1b:	83 c4 2c             	add    $0x2c,%esp
40002d1e:	5b                   	pop    %ebx
40002d1f:	5e                   	pop    %esi
40002d20:	5f                   	pop    %edi
40002d21:	5d                   	pop    %ebp
40002d22:	c3                   	ret
40002d23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40002d28:	89 75 e0             	mov    %esi,-0x20(%ebp)
40002d2b:	39 c3                	cmp    %eax,%ebx
40002d2d:	73 11                	jae    40002d40 <__umoddi3+0x50>
40002d2f:	89 f0                	mov    %esi,%eax
40002d31:	83 c4 2c             	add    $0x2c,%esp
40002d34:	5b                   	pop    %ebx
40002d35:	5e                   	pop    %esi
40002d36:	5f                   	pop    %edi
40002d37:	5d                   	pop    %ebp
40002d38:	c3                   	ret
40002d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40002d40:	0f bd c8             	bsr    %eax,%ecx
40002d43:	83 f1 1f             	xor    $0x1f,%ecx
40002d46:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
40002d49:	75 45                	jne    40002d90 <__umoddi3+0xa0>
40002d4b:	39 d8                	cmp    %ebx,%eax
40002d4d:	0f 82 d5 00 00 00    	jb     40002e28 <__umoddi3+0x138>
40002d53:	39 fe                	cmp    %edi,%esi
40002d55:	0f 83 cd 00 00 00    	jae    40002e28 <__umoddi3+0x138>
40002d5b:	8b 45 e0             	mov    -0x20(%ebp),%eax
40002d5e:	83 c4 2c             	add    $0x2c,%esp
40002d61:	5b                   	pop    %ebx
40002d62:	5e                   	pop    %esi
40002d63:	5f                   	pop    %edi
40002d64:	5d                   	pop    %ebp
40002d65:	c3                   	ret
40002d66:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40002d6d:	00 
40002d6e:	66 90                	xchg   %ax,%ax
40002d70:	89 f9                	mov    %edi,%ecx
40002d72:	85 ff                	test   %edi,%edi
40002d74:	75 0b                	jne    40002d81 <__umoddi3+0x91>
40002d76:	b8 01 00 00 00       	mov    $0x1,%eax
40002d7b:	31 d2                	xor    %edx,%edx
40002d7d:	f7 f7                	div    %edi
40002d7f:	89 c1                	mov    %eax,%ecx
40002d81:	89 d8                	mov    %ebx,%eax
40002d83:	31 d2                	xor    %edx,%edx
40002d85:	f7 f1                	div    %ecx
40002d87:	89 f0                	mov    %esi,%eax
40002d89:	f7 f1                	div    %ecx
40002d8b:	eb 8a                	jmp    40002d17 <__umoddi3+0x27>
40002d8d:	8d 76 00             	lea    0x0(%esi),%esi
40002d90:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
40002d93:	ba 20 00 00 00       	mov    $0x20,%edx
40002d98:	29 ca                	sub    %ecx,%edx
40002d9a:	d3 e0                	shl    %cl,%eax
40002d9c:	89 45 dc             	mov    %eax,-0x24(%ebp)
40002d9f:	89 d1                	mov    %edx,%ecx
40002da1:	89 f8                	mov    %edi,%eax
40002da3:	d3 e8                	shr    %cl,%eax
40002da5:	89 55 e0             	mov    %edx,-0x20(%ebp)
40002da8:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
40002dac:	89 c2                	mov    %eax,%edx
40002dae:	8b 45 dc             	mov    -0x24(%ebp),%eax
40002db1:	d3 e7                	shl    %cl,%edi
40002db3:	09 c2                	or     %eax,%edx
40002db5:	8b 45 e0             	mov    -0x20(%ebp),%eax
40002db8:	89 7d d8             	mov    %edi,-0x28(%ebp)
40002dbb:	89 f7                	mov    %esi,%edi
40002dbd:	89 55 dc             	mov    %edx,-0x24(%ebp)
40002dc0:	89 da                	mov    %ebx,%edx
40002dc2:	89 c1                	mov    %eax,%ecx
40002dc4:	d3 ea                	shr    %cl,%edx
40002dc6:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
40002dca:	d3 e3                	shl    %cl,%ebx
40002dcc:	89 c1                	mov    %eax,%ecx
40002dce:	d3 ef                	shr    %cl,%edi
40002dd0:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
40002dd4:	89 f8                	mov    %edi,%eax
40002dd6:	d3 e6                	shl    %cl,%esi
40002dd8:	09 d8                	or     %ebx,%eax
40002dda:	f7 75 dc             	divl   -0x24(%ebp)
40002ddd:	89 d3                	mov    %edx,%ebx
40002ddf:	89 75 d4             	mov    %esi,-0x2c(%ebp)
40002de2:	89 f7                	mov    %esi,%edi
40002de4:	f7 65 d8             	mull   -0x28(%ebp)
40002de7:	89 c6                	mov    %eax,%esi
40002de9:	89 d1                	mov    %edx,%ecx
40002deb:	39 d3                	cmp    %edx,%ebx
40002ded:	72 06                	jb     40002df5 <__umoddi3+0x105>
40002def:	75 0e                	jne    40002dff <__umoddi3+0x10f>
40002df1:	39 c7                	cmp    %eax,%edi
40002df3:	73 0a                	jae    40002dff <__umoddi3+0x10f>
40002df5:	2b 45 d8             	sub    -0x28(%ebp),%eax
40002df8:	1b 55 dc             	sbb    -0x24(%ebp),%edx
40002dfb:	89 d1                	mov    %edx,%ecx
40002dfd:	89 c6                	mov    %eax,%esi
40002dff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
40002e02:	8b 7d e4             	mov    -0x1c(%ebp),%edi
40002e05:	29 f0                	sub    %esi,%eax
40002e07:	19 cb                	sbb    %ecx,%ebx
40002e09:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
40002e0d:	89 da                	mov    %ebx,%edx
40002e0f:	d3 e2                	shl    %cl,%edx
40002e11:	89 f9                	mov    %edi,%ecx
40002e13:	d3 e8                	shr    %cl,%eax
40002e15:	d3 eb                	shr    %cl,%ebx
40002e17:	09 d0                	or     %edx,%eax
40002e19:	89 da                	mov    %ebx,%edx
40002e1b:	83 c4 2c             	add    $0x2c,%esp
40002e1e:	5b                   	pop    %ebx
40002e1f:	5e                   	pop    %esi
40002e20:	5f                   	pop    %edi
40002e21:	5d                   	pop    %ebp
40002e22:	c3                   	ret
40002e23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40002e28:	89 da                	mov    %ebx,%edx
40002e2a:	29 fe                	sub    %edi,%esi
40002e2c:	19 c2                	sbb    %eax,%edx
40002e2e:	89 75 e0             	mov    %esi,-0x20(%ebp)
40002e31:	e9 25 ff ff ff       	jmp    40002d5b <__umoddi3+0x6b>
