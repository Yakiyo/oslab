
obj/user/fork_test/fork_test:     file format elf32-i386


Disassembly of section .text:

40000000 <main>:
#include <x86.h>

uint32_t global_test = 0x12345678;

int main(int argc, char **argv)
{
40000000:	8d 4c 24 04          	lea    0x4(%esp),%ecx
40000004:	83 e4 f0             	and    $0xfffffff0,%esp
static gcc_inline pid_t sys_fork(void)
{
    int errno;
    pid_t pid;

    asm volatile ("int %2"
40000007:	ba 0c 00 00 00       	mov    $0xc,%edx
4000000c:	ff 71 fc             	push   -0x4(%ecx)
4000000f:	89 d0                	mov    %edx,%eax
40000011:	55                   	push   %ebp
40000012:	89 e5                	mov    %esp,%ebp
40000014:	56                   	push   %esi
40000015:	e8 1f 10 00 00       	call   40001039 <__x86.get_pc_thunk.si>
4000001a:	81 c6 da 3f 00 00    	add    $0x3fda,%esi
40000020:	53                   	push   %ebx
40000021:	51                   	push   %ecx
40000022:	83 ec 0c             	sub    $0xc,%esp
40000025:	cd 30                	int    $0x30
                  : "=a" (errno), "=b" (pid)
                  : "i" (T_SYSCALL),
                    "a" (SYS_fork)
                  : "cc", "memory");

    return errno ? -1 : pid;
40000027:	85 c0                	test   %eax,%eax
40000029:	75 33                	jne    4000005e <main+0x5e>
4000002b:	89 d9                	mov    %ebx,%ecx
    pid_t pid;

    pid = sys_fork();

    if (pid == 0) {
4000002d:	85 db                	test   %ebx,%ebx
4000002f:	75 30                	jne    40000061 <main+0x61>
    asm volatile ("int %2"
40000031:	89 d0                	mov    %edx,%eax
40000033:	cd 30                	int    $0x30
40000035:	89 da                	mov    %ebx,%edx
    return errno ? -1 : pid;
40000037:	85 c0                	test   %eax,%eax
40000039:	0f 85 80 00 00 00    	jne    400000bf <main+0xbf>
        pid = sys_fork();

        if (pid == 0) {
4000003f:	85 db                	test   %ebx,%ebx
40000041:	74 61                	je     400000a4 <main+0xa4>
            printf("This is grandchild, global = %p\n", global_test);
        } else {
            printf("Child forks %d, global = %p\n", pid, global_test);
40000043:	8d 86 48 e0 ff ff    	lea    -0x1fb8(%esi),%eax
40000049:	53                   	push   %ebx
4000004a:	89 f3                	mov    %esi,%ebx
4000004c:	ff b6 0c 00 00 00    	push   0xc(%esi)
40000052:	52                   	push   %edx
40000053:	50                   	push   %eax
40000054:	e8 b7 02 00 00       	call   40000310 <printf>
40000059:	83 c4 10             	add    $0x10,%esp
4000005c:	eb 39                	jmp    40000097 <main+0x97>
4000005e:	83 c9 ff             	or     $0xffffffff,%ecx
        }
    } else {
        printf("parent forks %d, global = %p\n", pid, global_test);
40000061:	50                   	push   %eax
40000062:	8d 86 65 e0 ff ff    	lea    -0x1f9b(%esi),%eax
40000068:	89 f3                	mov    %esi,%ebx
4000006a:	ff b6 0c 00 00 00    	push   0xc(%esi)
40000070:	51                   	push   %ecx
40000071:	50                   	push   %eax
40000072:	e8 99 02 00 00       	call   40000310 <printf>
        global_test = 0x5678;
        printf("parent global_test1 = %p\n", global_test);
40000077:	8d 86 83 e0 ff ff    	lea    -0x1f7d(%esi),%eax
        global_test = 0x5678;
4000007d:	c7 86 0c 00 00 00 78 	movl   $0x5678,0xc(%esi)
40000084:	56 00 00 
        printf("parent global_test1 = %p\n", global_test);
40000087:	5a                   	pop    %edx
40000088:	59                   	pop    %ecx
40000089:	68 78 56 00 00       	push   $0x5678
4000008e:	50                   	push   %eax
4000008f:	e8 7c 02 00 00       	call   40000310 <printf>
40000094:	83 c4 10             	add    $0x10,%esp
    }

    return 0;
}
40000097:	8d 65 f4             	lea    -0xc(%ebp),%esp
4000009a:	31 c0                	xor    %eax,%eax
4000009c:	59                   	pop    %ecx
4000009d:	5b                   	pop    %ebx
4000009e:	5e                   	pop    %esi
4000009f:	5d                   	pop    %ebp
400000a0:	8d 61 fc             	lea    -0x4(%ecx),%esp
400000a3:	c3                   	ret
            printf("This is grandchild, global = %p\n", global_test);
400000a4:	50                   	push   %eax
400000a5:	89 f3                	mov    %esi,%ebx
400000a7:	50                   	push   %eax
400000a8:	8d 86 f8 e1 ff ff    	lea    -0x1e08(%esi),%eax
400000ae:	ff b6 0c 00 00 00    	push   0xc(%esi)
400000b4:	50                   	push   %eax
400000b5:	e8 56 02 00 00       	call   40000310 <printf>
400000ba:	83 c4 10             	add    $0x10,%esp
400000bd:	eb d8                	jmp    40000097 <main+0x97>
400000bf:	83 ca ff             	or     $0xffffffff,%edx
400000c2:	e9 7c ff ff ff       	jmp    40000043 <main+0x43>

400000c7 <_start>:
_start:
	/*
	 * If there are arguments on the stack, then the current stack will not
	 * be aligned to a nice big power-of-two boundary.
	 */
	testl	$0x0fffffff, %esp
400000c7:	f7 c4 ff ff ff 0f    	test   $0xfffffff,%esp
	jnz	args_exist
400000cd:	75 04                	jne    400000d3 <args_exist>

400000cf <noargs>:

noargs:
	/* If no arguments are on the stack, push two dummy zero. */
	pushl	$0
400000cf:	6a 00                	push   $0x0
	pushl	$0
400000d1:	6a 00                	push   $0x0

400000d3 <args_exist>:

args_exist:
	/* Jump to the C part. */
	call	main
400000d3:	e8 28 ff ff ff       	call   40000000 <main>

	/* When returning, push the return value on the stack. */
	pushl	%eax
400000d8:	50                   	push   %eax
	/* Give the CPU to another process once main returns. */
	call	yield
400000d9:	e8 02 0a 00 00       	call   40000ae0 <yield>

400000de <spin>:
spin:
	jmp	spin
400000de:	eb fe                	jmp    400000de <spin>

400000e0 <debug>:
#include <proc.h>
#include <stdarg.h>
#include <stdio.h>

void debug(const char *file, int line, const char *fmt, ...)
{
400000e0:	53                   	push   %ebx
400000e1:	e8 c1 00 00 00       	call   400001a7 <__x86.get_pc_thunk.bx>
400000e6:	81 c3 0e 3f 00 00    	add    $0x3f0e,%ebx
400000ec:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[D] %s:%d: ", file, line);
400000ef:	ff 74 24 18          	push   0x18(%esp)
400000f3:	ff 74 24 18          	push   0x18(%esp)
400000f7:	8d 83 0c e0 ff ff    	lea    -0x1ff4(%ebx),%eax
400000fd:	50                   	push   %eax
400000fe:	e8 0d 02 00 00       	call   40000310 <printf>
    vcprintf(fmt, ap);
40000103:	58                   	pop    %eax
40000104:	5a                   	pop    %edx
40000105:	8d 44 24 24          	lea    0x24(%esp),%eax
40000109:	50                   	push   %eax
4000010a:	ff 74 24 24          	push   0x24(%esp)
4000010e:	e8 9d 01 00 00       	call   400002b0 <vcprintf>
    va_end(ap);
}
40000113:	83 c4 18             	add    $0x18,%esp
40000116:	5b                   	pop    %ebx
40000117:	c3                   	ret
40000118:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000011f:	00 

40000120 <warn>:

void warn(const char *file, int line, const char *fmt, ...)
{
40000120:	53                   	push   %ebx
40000121:	e8 81 00 00 00       	call   400001a7 <__x86.get_pc_thunk.bx>
40000126:	81 c3 ce 3e 00 00    	add    $0x3ece,%ebx
4000012c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[W] %s:%d: ", file, line);
4000012f:	ff 74 24 18          	push   0x18(%esp)
40000133:	ff 74 24 18          	push   0x18(%esp)
40000137:	8d 83 18 e0 ff ff    	lea    -0x1fe8(%ebx),%eax
4000013d:	50                   	push   %eax
4000013e:	e8 cd 01 00 00       	call   40000310 <printf>
    vcprintf(fmt, ap);
40000143:	58                   	pop    %eax
40000144:	5a                   	pop    %edx
40000145:	8d 44 24 24          	lea    0x24(%esp),%eax
40000149:	50                   	push   %eax
4000014a:	ff 74 24 24          	push   0x24(%esp)
4000014e:	e8 5d 01 00 00       	call   400002b0 <vcprintf>
    va_end(ap);
}
40000153:	83 c4 18             	add    $0x18,%esp
40000156:	5b                   	pop    %ebx
40000157:	c3                   	ret
40000158:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000015f:	00 

40000160 <panic>:

void panic(const char *file, int line, const char *fmt, ...)
{
40000160:	53                   	push   %ebx
40000161:	e8 41 00 00 00       	call   400001a7 <__x86.get_pc_thunk.bx>
40000166:	81 c3 8e 3e 00 00    	add    $0x3e8e,%ebx
4000016c:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    va_start(ap, fmt);
    printf("[P] %s:%d: ", file, line);
4000016f:	ff 74 24 18          	push   0x18(%esp)
40000173:	ff 74 24 18          	push   0x18(%esp)
40000177:	8d 83 24 e0 ff ff    	lea    -0x1fdc(%ebx),%eax
4000017d:	50                   	push   %eax
4000017e:	e8 8d 01 00 00       	call   40000310 <printf>
    vcprintf(fmt, ap);
40000183:	58                   	pop    %eax
40000184:	5a                   	pop    %edx
40000185:	8d 44 24 24          	lea    0x24(%esp),%eax
40000189:	50                   	push   %eax
4000018a:	ff 74 24 24          	push   0x24(%esp)
4000018e:	e8 1d 01 00 00       	call   400002b0 <vcprintf>
40000193:	83 c4 10             	add    $0x10,%esp
40000196:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000019d:	00 
4000019e:	66 90                	xchg   %ax,%ax
    va_end(ap);

    while (1)
        yield();
400001a0:	e8 3b 09 00 00       	call   40000ae0 <yield>
    while (1)
400001a5:	eb f9                	jmp    400001a0 <panic+0x40>

400001a7 <__x86.get_pc_thunk.bx>:
400001a7:	8b 1c 24             	mov    (%esp),%ebx
400001aa:	c3                   	ret
400001ab:	66 90                	xchg   %ax,%ax
400001ad:	66 90                	xchg   %ax,%ax
400001af:	90                   	nop

400001b0 <atoi>:
#include <stdlib.h>

int atoi(const char *buf, int *i)
{
400001b0:	55                   	push   %ebp
400001b1:	57                   	push   %edi
400001b2:	56                   	push   %esi
400001b3:	53                   	push   %ebx
    int loc = 0;
    int numstart = 0;
    int acc = 0;
    int negative = 0;
    if (buf[loc] == '+')
400001b4:	8b 44 24 14          	mov    0x14(%esp),%eax
400001b8:	0f b6 00             	movzbl (%eax),%eax
400001bb:	3c 2b                	cmp    $0x2b,%al
400001bd:	0f 84 8d 00 00 00    	je     40000250 <atoi+0xa0>
        loc++;
    else if (buf[loc] == '-') {
400001c3:	3c 2d                	cmp    $0x2d,%al
400001c5:	74 59                	je     40000220 <atoi+0x70>
        negative = 1;
        loc++;
    }
    numstart = loc;
    // no grab the numbers
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001c7:	8d 50 d0             	lea    -0x30(%eax),%edx
400001ca:	80 fa 09             	cmp    $0x9,%dl
400001cd:	77 71                	ja     40000240 <atoi+0x90>
    int negative = 0;
400001cf:	31 ff                	xor    %edi,%edi
    int loc = 0;
400001d1:	31 f6                	xor    %esi,%esi
        loc++;
400001d3:	89 f2                	mov    %esi,%edx
    int acc = 0;
400001d5:	31 c9                	xor    %ecx,%ecx
400001d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400001de:	00 
400001df:	90                   	nop
        acc = acc * 10 + (buf[loc] - '0');
400001e0:	83 e8 30             	sub    $0x30,%eax
400001e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
        loc++;
400001e6:	83 c2 01             	add    $0x1,%edx
        acc = acc * 10 + (buf[loc] - '0');
400001e9:	0f be c0             	movsbl %al,%eax
400001ec:	8d 0c 48             	lea    (%eax,%ecx,2),%ecx
    while ('0' <= buf[loc] && buf[loc] <= '9') {
400001ef:	8b 44 24 14          	mov    0x14(%esp),%eax
400001f3:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
400001f7:	8d 68 d0             	lea    -0x30(%eax),%ebp
400001fa:	89 eb                	mov    %ebp,%ebx
400001fc:	80 fb 09             	cmp    $0x9,%bl
400001ff:	76 df                	jbe    400001e0 <atoi+0x30>
    }
    if (numstart == loc) {
40000201:	39 f2                	cmp    %esi,%edx
40000203:	74 3b                	je     40000240 <atoi+0x90>
        // no numbers have actually been scanned
        return 0;
    }
    if (negative)
        acc = -acc;
40000205:	89 c8                	mov    %ecx,%eax
40000207:	f7 d8                	neg    %eax
40000209:	85 ff                	test   %edi,%edi
4000020b:	0f 45 c8             	cmovne %eax,%ecx
    *i = acc;
4000020e:	8b 44 24 18          	mov    0x18(%esp),%eax
40000212:	89 08                	mov    %ecx,(%eax)
    return loc;
}
40000214:	89 d0                	mov    %edx,%eax
40000216:	5b                   	pop    %ebx
40000217:	5e                   	pop    %esi
40000218:	5f                   	pop    %edi
40000219:	5d                   	pop    %ebp
4000021a:	c3                   	ret
4000021b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000220:	8b 44 24 14          	mov    0x14(%esp),%eax
        negative = 1;
40000224:	bf 01 00 00 00       	mov    $0x1,%edi
        loc++;
40000229:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000022e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
40000232:	8d 50 d0             	lea    -0x30(%eax),%edx
40000235:	80 fa 09             	cmp    $0x9,%dl
40000238:	76 99                	jbe    400001d3 <atoi+0x23>
4000023a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
40000240:	31 d2                	xor    %edx,%edx
}
40000242:	5b                   	pop    %ebx
40000243:	89 d0                	mov    %edx,%eax
40000245:	5e                   	pop    %esi
40000246:	5f                   	pop    %edi
40000247:	5d                   	pop    %ebp
40000248:	c3                   	ret
40000249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
40000250:	8b 44 24 14          	mov    0x14(%esp),%eax
    int negative = 0;
40000254:	31 ff                	xor    %edi,%edi
        loc++;
40000256:	be 01 00 00 00       	mov    $0x1,%esi
    while ('0' <= buf[loc] && buf[loc] <= '9') {
4000025b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
4000025f:	8d 50 d0             	lea    -0x30(%eax),%edx
40000262:	80 fa 09             	cmp    $0x9,%dl
40000265:	0f 86 68 ff ff ff    	jbe    400001d3 <atoi+0x23>
        return 0;
4000026b:	31 d2                	xor    %edx,%edx
4000026d:	eb d3                	jmp    40000242 <atoi+0x92>
4000026f:	90                   	nop

40000270 <putch>:
    int cnt;            // total bytes printed so far
    char buf[MAX_BUF];
};

static void putch(int ch, struct printbuf *b)
{
40000270:	53                   	push   %ebx
40000271:	8b 54 24 0c          	mov    0xc(%esp),%edx
    b->buf[b->idx++] = ch;
40000275:	0f b6 5c 24 08       	movzbl 0x8(%esp),%ebx
4000027a:	8b 02                	mov    (%edx),%eax
4000027c:	8d 48 01             	lea    0x1(%eax),%ecx
4000027f:	89 0a                	mov    %ecx,(%edx)
40000281:	88 5c 02 08          	mov    %bl,0x8(%edx,%eax,1)
    if (b->idx == MAX_BUF - 1) {
40000285:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
4000028b:	75 14                	jne    400002a1 <putch+0x31>
        b->buf[b->idx] = 0;
4000028d:	c6 82 07 02 00 00 00 	movb   $0x0,0x207(%edx)
        puts(b->buf, b->idx);
40000294:	8d 5a 08             	lea    0x8(%edx),%ebx
    asm volatile ("int %0"
40000297:	31 c0                	xor    %eax,%eax
40000299:	cd 30                	int    $0x30
        b->idx = 0;
4000029b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
    }
    b->cnt++;
400002a1:	83 42 04 01          	addl   $0x1,0x4(%edx)
}
400002a5:	5b                   	pop    %ebx
400002a6:	c3                   	ret
400002a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400002ae:	00 
400002af:	90                   	nop

400002b0 <vcprintf>:

int vcprintf(const char *fmt, va_list ap)
{
400002b0:	53                   	push   %ebx
400002b1:	e8 f1 fe ff ff       	call   400001a7 <__x86.get_pc_thunk.bx>
400002b6:	81 c3 3e 3d 00 00    	add    $0x3d3e,%ebx
400002bc:	81 ec 18 02 00 00    	sub    $0x218,%esp
    struct printbuf b;

    b.idx = 0;
400002c2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
400002c9:	00 
    b.cnt = 0;
400002ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400002d1:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
400002d2:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400002d9:	ff b4 24 24 02 00 00 	push   0x224(%esp)
400002e0:	8d 44 24 10          	lea    0x10(%esp),%eax
400002e4:	50                   	push   %eax
400002e5:	8d 83 7c c2 ff ff    	lea    -0x3d84(%ebx),%eax
400002eb:	50                   	push   %eax
400002ec:	e8 3f 01 00 00       	call   40000430 <vprintfmt>

    b.buf[b.idx] = 0;
400002f1:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400002f5:	8d 5c 24 20          	lea    0x20(%esp),%ebx
400002f9:	31 c0                	xor    %eax,%eax
400002fb:	c6 44 0c 20 00       	movb   $0x0,0x20(%esp,%ecx,1)
40000300:	cd 30                	int    $0x30
    puts(b.buf, b.idx);

    return b.cnt;
}
40000302:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000306:	81 c4 28 02 00 00    	add    $0x228,%esp
4000030c:	5b                   	pop    %ebx
4000030d:	c3                   	ret
4000030e:	66 90                	xchg   %ax,%ax

40000310 <printf>:

int printf(const char *fmt, ...)
{
40000310:	83 ec 14             	sub    $0x14,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
40000313:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000317:	50                   	push   %eax
40000318:	ff 74 24 1c          	push   0x1c(%esp)
4000031c:	e8 8f ff ff ff       	call   400002b0 <vcprintf>
    va_end(ap);

    return cnt;
}
40000321:	83 c4 1c             	add    $0x1c,%esp
40000324:	c3                   	ret
40000325:	66 90                	xchg   %ax,%ax
40000327:	66 90                	xchg   %ax,%ax
40000329:	66 90                	xchg   %ax,%ax
4000032b:	66 90                	xchg   %ax,%ax
4000032d:	66 90                	xchg   %ax,%ax
4000032f:	90                   	nop

40000330 <printnum>:
static void
printnum(void (*putch)(int, void *), void *putdat,
         unsigned long long num, unsigned base, int width, int padc)
{
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
40000330:	e8 86 07 00 00       	call   40000abb <__x86.get_pc_thunk.cx>
40000335:	81 c1 bf 3c 00 00    	add    $0x3cbf,%ecx
{
4000033b:	55                   	push   %ebp
4000033c:	57                   	push   %edi
4000033d:	89 d7                	mov    %edx,%edi
4000033f:	56                   	push   %esi
40000340:	89 c6                	mov    %eax,%esi
40000342:	53                   	push   %ebx
40000343:	83 ec 2c             	sub    $0x2c,%esp
40000346:	8b 44 24 40          	mov    0x40(%esp),%eax
4000034a:	8b 54 24 44          	mov    0x44(%esp),%edx
4000034e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
40000352:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
40000359:	00 
{
4000035a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
4000035e:	89 44 24 08          	mov    %eax,0x8(%esp)
40000362:	8b 44 24 48          	mov    0x48(%esp),%eax
40000366:	89 54 24 0c          	mov    %edx,0xc(%esp)
4000036a:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
4000036e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000372:	39 44 24 08          	cmp    %eax,0x8(%esp)
40000376:	89 44 24 10          	mov    %eax,0x10(%esp)
4000037a:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (--width > 0)
4000037e:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
40000381:	73 55                	jae    400003d8 <printnum+0xa8>
        while (--width > 0)
40000383:	83 fa 01             	cmp    $0x1,%edx
40000386:	7e 17                	jle    4000039f <printnum+0x6f>
40000388:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000038f:	00 
            putch(padc, putdat);
40000390:	83 ec 08             	sub    $0x8,%esp
40000393:	57                   	push   %edi
40000394:	55                   	push   %ebp
40000395:	ff d6                	call   *%esi
        while (--width > 0)
40000397:	83 c4 10             	add    $0x10,%esp
4000039a:	83 eb 01             	sub    $0x1,%ebx
4000039d:	75 f1                	jne    40000390 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
4000039f:	89 7c 24 44          	mov    %edi,0x44(%esp)
400003a3:	ff 74 24 14          	push   0x14(%esp)
400003a7:	ff 74 24 14          	push   0x14(%esp)
400003ab:	ff 74 24 14          	push   0x14(%esp)
400003af:	ff 74 24 14          	push   0x14(%esp)
400003b3:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
400003b7:	e8 b4 0d 00 00       	call   40001170 <__umoddi3>
400003bc:	0f be 84 03 30 e0 ff 	movsbl -0x1fd0(%ebx,%eax,1),%eax
400003c3:	ff 
400003c4:	89 44 24 50          	mov    %eax,0x50(%esp)
}
400003c8:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
400003cb:	89 f0                	mov    %esi,%eax
}
400003cd:	5b                   	pop    %ebx
400003ce:	5e                   	pop    %esi
400003cf:	5f                   	pop    %edi
400003d0:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
400003d1:	ff e0                	jmp    *%eax
400003d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
400003d8:	83 ec 0c             	sub    $0xc,%esp
400003db:	55                   	push   %ebp
400003dc:	53                   	push   %ebx
400003dd:	50                   	push   %eax
400003de:	83 ec 08             	sub    $0x8,%esp
400003e1:	ff 74 24 34          	push   0x34(%esp)
400003e5:	ff 74 24 34          	push   0x34(%esp)
400003e9:	ff 74 24 34          	push   0x34(%esp)
400003ed:	ff 74 24 34          	push   0x34(%esp)
400003f1:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400003f5:	e8 46 0c 00 00       	call   40001040 <__udivdi3>
400003fa:	83 c4 18             	add    $0x18,%esp
400003fd:	52                   	push   %edx
400003fe:	89 fa                	mov    %edi,%edx
40000400:	50                   	push   %eax
40000401:	89 f0                	mov    %esi,%eax
40000403:	e8 28 ff ff ff       	call   40000330 <printnum>
40000408:	83 c4 20             	add    $0x20,%esp
4000040b:	eb 92                	jmp    4000039f <printnum+0x6f>
4000040d:	8d 76 00             	lea    0x0(%esi),%esi

40000410 <sprintputch>:
    char *ebuf;
    int cnt;
};

static void sprintputch(int ch, struct sprintbuf *b)
{
40000410:	8b 44 24 08          	mov    0x8(%esp),%eax
    b->cnt++;
40000414:	83 40 08 01          	addl   $0x1,0x8(%eax)
    if (b->buf < b->ebuf)
40000418:	8b 10                	mov    (%eax),%edx
4000041a:	3b 50 04             	cmp    0x4(%eax),%edx
4000041d:	73 0b                	jae    4000042a <sprintputch+0x1a>
        *b->buf++ = ch;
4000041f:	8d 4a 01             	lea    0x1(%edx),%ecx
40000422:	89 08                	mov    %ecx,(%eax)
40000424:	8b 44 24 04          	mov    0x4(%esp),%eax
40000428:	88 02                	mov    %al,(%edx)
}
4000042a:	c3                   	ret
4000042b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000430 <vprintfmt>:
{
40000430:	e8 7e 06 00 00       	call   40000ab3 <__x86.get_pc_thunk.ax>
40000435:	05 bf 3b 00 00       	add    $0x3bbf,%eax
4000043a:	55                   	push   %ebp
4000043b:	57                   	push   %edi
4000043c:	56                   	push   %esi
4000043d:	53                   	push   %ebx
4000043e:	83 ec 2c             	sub    $0x2c,%esp
40000441:	8b 74 24 40          	mov    0x40(%esp),%esi
40000445:	8b 7c 24 44          	mov    0x44(%esp),%edi
40000449:	89 44 24 0c          	mov    %eax,0xc(%esp)
4000044d:	8b 6c 24 48          	mov    0x48(%esp),%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000451:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000455:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000458:	83 f8 25             	cmp    $0x25,%eax
4000045b:	75 19                	jne    40000476 <vprintfmt+0x46>
4000045d:	eb 29                	jmp    40000488 <vprintfmt+0x58>
4000045f:	90                   	nop
            putch(ch, putdat);
40000460:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
40000463:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
40000466:	57                   	push   %edi
40000467:	50                   	push   %eax
40000468:	ff d6                	call   *%esi
        while ((ch = *(unsigned char *) fmt++) != '%') {
4000046a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000046e:	83 c4 10             	add    $0x10,%esp
40000471:	83 f8 25             	cmp    $0x25,%eax
40000474:	74 12                	je     40000488 <vprintfmt+0x58>
            if (ch == '\0')
40000476:	85 c0                	test   %eax,%eax
40000478:	75 e6                	jne    40000460 <vprintfmt+0x30>
}
4000047a:	83 c4 2c             	add    $0x2c,%esp
4000047d:	5b                   	pop    %ebx
4000047e:	5e                   	pop    %esi
4000047f:	5f                   	pop    %edi
40000480:	5d                   	pop    %ebp
40000481:	c3                   	ret
40000482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
40000488:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        padc = ' ';
4000048d:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        altflag = 0;
40000492:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
        width = -1;
40000499:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400004a0:	ff 
        lflag = 0;
400004a1:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
400004a8:	00 
400004a9:	89 54 24 14          	mov    %edx,0x14(%esp)
400004ad:	89 74 24 40          	mov    %esi,0x40(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400004b1:	0f b6 0b             	movzbl (%ebx),%ecx
400004b4:	8d 6b 01             	lea    0x1(%ebx),%ebp
400004b7:	8d 41 dd             	lea    -0x23(%ecx),%eax
400004ba:	3c 55                	cmp    $0x55,%al
400004bc:	77 12                	ja     400004d0 <.L21>
400004be:	8b 54 24 0c          	mov    0xc(%esp),%edx
400004c2:	0f b6 c0             	movzbl %al,%eax
400004c5:	8b b4 82 a0 e0 ff ff 	mov    -0x1f60(%edx,%eax,4),%esi
400004cc:	01 d6                	add    %edx,%esi
400004ce:	ff e6                	jmp    *%esi

400004d0 <.L21>:
            putch('%', putdat);
400004d0:	8b 74 24 40          	mov    0x40(%esp),%esi
400004d4:	83 ec 08             	sub    $0x8,%esp
            for (fmt--; fmt[-1] != '%'; fmt--)
400004d7:	89 dd                	mov    %ebx,%ebp
            putch('%', putdat);
400004d9:	57                   	push   %edi
400004da:	6a 25                	push   $0x25
400004dc:	ff d6                	call   *%esi
            for (fmt--; fmt[-1] != '%'; fmt--)
400004de:	83 c4 10             	add    $0x10,%esp
400004e1:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
400004e5:	0f 84 66 ff ff ff    	je     40000451 <vprintfmt+0x21>
400004eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400004f0:	83 ed 01             	sub    $0x1,%ebp
400004f3:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
400004f7:	75 f7                	jne    400004f0 <.L21+0x20>
400004f9:	e9 53 ff ff ff       	jmp    40000451 <vprintfmt+0x21>
400004fe:	66 90                	xchg   %ax,%ax

40000500 <.L31>:
                ch = *fmt;
40000500:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
40000504:	8d 51 d0             	lea    -0x30(%ecx),%edx
        switch (ch = *(unsigned char *) fmt++) {
40000507:	89 eb                	mov    %ebp,%ebx
                precision = precision * 10 + ch - '0';
40000509:	89 54 24 14          	mov    %edx,0x14(%esp)
                if (ch < '0' || ch > '9')
4000050d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000510:	83 f9 09             	cmp    $0x9,%ecx
40000513:	77 28                	ja     4000053d <.L31+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
40000515:	8b 74 24 40          	mov    0x40(%esp),%esi
40000519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            for (precision = 0;; ++fmt) {
40000520:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
40000523:	8d 14 92             	lea    (%edx,%edx,4),%edx
40000526:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
                ch = *fmt;
4000052a:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
4000052d:	8d 48 d0             	lea    -0x30(%eax),%ecx
40000530:	83 f9 09             	cmp    $0x9,%ecx
40000533:	76 eb                	jbe    40000520 <.L31+0x20>
40000535:	89 54 24 14          	mov    %edx,0x14(%esp)
40000539:	89 74 24 40          	mov    %esi,0x40(%esp)
            if (width < 0)
4000053d:	8b 74 24 08          	mov    0x8(%esp),%esi
40000541:	85 f6                	test   %esi,%esi
40000543:	0f 89 68 ff ff ff    	jns    400004b1 <vprintfmt+0x81>
                width = precision, precision = -1;
40000549:	8b 44 24 14          	mov    0x14(%esp),%eax
4000054d:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
40000554:	ff 
40000555:	89 44 24 08          	mov    %eax,0x8(%esp)
40000559:	e9 53 ff ff ff       	jmp    400004b1 <vprintfmt+0x81>

4000055e <.L35>:
            altflag = 1;
4000055e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000565:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
40000567:	e9 45 ff ff ff       	jmp    400004b1 <vprintfmt+0x81>

4000056c <.L34>:
            putch(ch, putdat);
4000056c:	8b 74 24 40          	mov    0x40(%esp),%esi
40000570:	83 ec 08             	sub    $0x8,%esp
40000573:	57                   	push   %edi
40000574:	6a 25                	push   $0x25
40000576:	ff d6                	call   *%esi
            break;
40000578:	83 c4 10             	add    $0x10,%esp
4000057b:	e9 d1 fe ff ff       	jmp    40000451 <vprintfmt+0x21>

40000580 <.L33>:
            precision = va_arg(ap, int);
40000580:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
40000584:	89 eb                	mov    %ebp,%ebx
            precision = va_arg(ap, int);
40000586:	8b 00                	mov    (%eax),%eax
40000588:	89 44 24 14          	mov    %eax,0x14(%esp)
4000058c:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000590:	83 c0 04             	add    $0x4,%eax
40000593:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
40000597:	eb a4                	jmp    4000053d <.L31+0x3d>

40000599 <.L32>:
            if (width < 0)
40000599:	8b 4c 24 08          	mov    0x8(%esp),%ecx
4000059d:	31 c0                	xor    %eax,%eax
        switch (ch = *(unsigned char *) fmt++) {
4000059f:	89 eb                	mov    %ebp,%ebx
            if (width < 0)
400005a1:	85 c9                	test   %ecx,%ecx
400005a3:	0f 49 c1             	cmovns %ecx,%eax
400005a6:	89 44 24 08          	mov    %eax,0x8(%esp)
            goto reswitch;
400005aa:	e9 02 ff ff ff       	jmp    400004b1 <vprintfmt+0x81>

400005af <.L30>:
            putch(va_arg(ap, int), putdat);
400005af:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400005b3:	8b 74 24 40          	mov    0x40(%esp),%esi
400005b7:	83 ec 08             	sub    $0x8,%esp
400005ba:	57                   	push   %edi
400005bb:	8d 58 04             	lea    0x4(%eax),%ebx
400005be:	8b 44 24 58          	mov    0x58(%esp),%eax
400005c2:	ff 30                	push   (%eax)
400005c4:	ff d6                	call   *%esi
            break;
400005c6:	83 c4 10             	add    $0x10,%esp
            putch(va_arg(ap, int), putdat);
400005c9:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
            break;
400005cd:	e9 7f fe ff ff       	jmp    40000451 <vprintfmt+0x21>

400005d2 <.L24>:
    if (lflag >= 2)
400005d2:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
400005d7:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
400005db:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
400005df:	0f 8f d8 01 00 00    	jg     400007bd <.L25+0xe0>
        return va_arg(*ap, unsigned long);
400005e5:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
400005e9:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
400005ec:	31 db                	xor    %ebx,%ebx
400005ee:	ba 0a 00 00 00       	mov    $0xa,%edx
400005f3:	8b 09                	mov    (%ecx),%ecx
400005f5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400005f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            printnum(putch, putdat, num, base, width, padc);
40000600:	83 ec 0c             	sub    $0xc,%esp
40000603:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
40000608:	50                   	push   %eax
40000609:	89 f0                	mov    %esi,%eax
4000060b:	ff 74 24 18          	push   0x18(%esp)
4000060f:	52                   	push   %edx
40000610:	89 fa                	mov    %edi,%edx
40000612:	53                   	push   %ebx
40000613:	51                   	push   %ecx
40000614:	e8 17 fd ff ff       	call   40000330 <printnum>
            break;
40000619:	83 c4 20             	add    $0x20,%esp
4000061c:	e9 30 fe ff ff       	jmp    40000451 <vprintfmt+0x21>

40000621 <.L26>:
            putch('0', putdat);
40000621:	8b 74 24 40          	mov    0x40(%esp),%esi
40000625:	83 ec 08             	sub    $0x8,%esp
40000628:	57                   	push   %edi
40000629:	6a 30                	push   $0x30
4000062b:	ff d6                	call   *%esi
            putch('x', putdat);
4000062d:	59                   	pop    %ecx
4000062e:	5b                   	pop    %ebx
4000062f:	57                   	push   %edi
40000630:	6a 78                	push   $0x78
            num = (unsigned long long)
40000632:	31 db                	xor    %ebx,%ebx
            putch('x', putdat);
40000634:	ff d6                	call   *%esi
            num = (unsigned long long)
40000636:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
4000063a:	ba 10 00 00 00       	mov    $0x10,%edx
            num = (unsigned long long)
4000063f:	8b 08                	mov    (%eax),%ecx
            goto number;
40000641:	83 c4 10             	add    $0x10,%esp
                (uintptr_t) va_arg(ap, void *);
40000644:	83 c0 04             	add    $0x4,%eax
40000647:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto number;
4000064b:	eb b3                	jmp    40000600 <.L24+0x2e>

4000064d <.L22>:
    if (lflag >= 2)
4000064d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
40000652:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, unsigned long long);
40000656:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
4000065a:	0f 8f 6e 01 00 00    	jg     400007ce <.L25+0xf1>
        return va_arg(*ap, unsigned long);
40000660:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
            precision = va_arg(ap, int);
40000664:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
40000667:	31 db                	xor    %ebx,%ebx
40000669:	ba 10 00 00 00       	mov    $0x10,%edx
4000066e:	8b 09                	mov    (%ecx),%ecx
40000670:	89 44 24 4c          	mov    %eax,0x4c(%esp)
40000674:	eb 8a                	jmp    40000600 <.L24+0x2e>

40000676 <.L29>:
    if (lflag >= 2)
40000676:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
4000067b:	8b 74 24 40          	mov    0x40(%esp),%esi
        return va_arg(*ap, long long);
4000067f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
40000683:	0f 8f 5b 01 00 00    	jg     400007e4 <.L25+0x107>
        return va_arg(*ap, long);
40000689:	8b 00                	mov    (%eax),%eax
4000068b:	89 c3                	mov    %eax,%ebx
4000068d:	89 c1                	mov    %eax,%ecx
4000068f:	8b 44 24 4c          	mov    0x4c(%esp),%eax
40000693:	c1 fb 1f             	sar    $0x1f,%ebx
40000696:	83 c0 04             	add    $0x4,%eax
40000699:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            if ((long long) num < 0) {
4000069d:	85 db                	test   %ebx,%ebx
4000069f:	0f 88 68 01 00 00    	js     4000080d <.L19+0xc>
        return va_arg(*ap, unsigned long long);
400006a5:	ba 0a 00 00 00       	mov    $0xa,%edx
400006aa:	e9 51 ff ff ff       	jmp    40000600 <.L24+0x2e>

400006af <.L28>:
            lflag++;
400006af:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
400006b4:	89 eb                	mov    %ebp,%ebx
            goto reswitch;
400006b6:	e9 f6 fd ff ff       	jmp    400004b1 <vprintfmt+0x81>

400006bb <.L27>:
            putch('X', putdat);
400006bb:	8b 74 24 40          	mov    0x40(%esp),%esi
400006bf:	83 ec 08             	sub    $0x8,%esp
400006c2:	57                   	push   %edi
400006c3:	6a 58                	push   $0x58
400006c5:	ff d6                	call   *%esi
            putch('X', putdat);
400006c7:	58                   	pop    %eax
400006c8:	5a                   	pop    %edx
400006c9:	57                   	push   %edi
400006ca:	6a 58                	push   $0x58
400006cc:	ff d6                	call   *%esi
            putch('X', putdat);
400006ce:	59                   	pop    %ecx
400006cf:	5b                   	pop    %ebx
400006d0:	57                   	push   %edi
400006d1:	6a 58                	push   $0x58
400006d3:	ff d6                	call   *%esi
            break;
400006d5:	83 c4 10             	add    $0x10,%esp
400006d8:	e9 74 fd ff ff       	jmp    40000451 <vprintfmt+0x21>

400006dd <.L25>:
            if ((p = va_arg(ap, char *)) == NULL)
400006dd:	8b 44 24 4c          	mov    0x4c(%esp),%eax
            if (width > 0 && padc != '-')
400006e1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
            if ((p = va_arg(ap, char *)) == NULL)
400006e5:	8b 54 24 14          	mov    0x14(%esp),%edx
400006e9:	8b 74 24 40          	mov    0x40(%esp),%esi
400006ed:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
400006f0:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
            if ((p = va_arg(ap, char *)) == NULL)
400006f5:	89 44 24 14          	mov    %eax,0x14(%esp)
400006f9:	8b 44 24 4c          	mov    0x4c(%esp),%eax
400006fd:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
400006ff:	0f 95 c0             	setne  %al
40000702:	85 c9                	test   %ecx,%ecx
40000704:	0f 9f c1             	setg   %cl
            if ((p = va_arg(ap, char *)) == NULL)
40000707:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
4000070b:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
4000070d:	85 db                	test   %ebx,%ebx
4000070f:	0f 84 21 01 00 00    	je     40000836 <.L19+0x35>
            if (width > 0 && padc != '-')
40000715:	84 c0                	test   %al,%al
40000717:	0f 85 48 01 00 00    	jne    40000865 <.L19+0x64>
                 (ch = *p++) != '\0' && (precision < 0
4000071d:	89 d8                	mov    %ebx,%eax
4000071f:	8d 5b 01             	lea    0x1(%ebx),%ebx
40000722:	0f be 08             	movsbl (%eax),%ecx
40000725:	89 c8                	mov    %ecx,%eax
40000727:	85 c9                	test   %ecx,%ecx
40000729:	74 64                	je     4000078f <.L25+0xb2>
4000072b:	89 74 24 40          	mov    %esi,0x40(%esp)
4000072f:	89 d6                	mov    %edx,%esi
40000731:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000735:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000739:	eb 2a                	jmp    40000765 <.L25+0x88>
4000073b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
40000740:	83 e8 20             	sub    $0x20,%eax
40000743:	83 f8 5e             	cmp    $0x5e,%eax
40000746:	76 2d                	jbe    40000775 <.L25+0x98>
                    putch('?', putdat);
40000748:	83 ec 08             	sub    $0x8,%esp
4000074b:	57                   	push   %edi
4000074c:	6a 3f                	push   $0x3f
4000074e:	ff 54 24 50          	call   *0x50(%esp)
40000752:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0
40000755:	0f be 03             	movsbl (%ebx),%eax
40000758:	83 c3 01             	add    $0x1,%ebx
                                         || --precision >= 0); width--)
4000075b:	83 ed 01             	sub    $0x1,%ebp
                 (ch = *p++) != '\0' && (precision < 0
4000075e:	0f be c8             	movsbl %al,%ecx
40000761:	85 c9                	test   %ecx,%ecx
40000763:	74 1e                	je     40000783 <.L25+0xa6>
40000765:	85 f6                	test   %esi,%esi
40000767:	78 05                	js     4000076e <.L25+0x91>
                                         || --precision >= 0); width--)
40000769:	83 ee 01             	sub    $0x1,%esi
4000076c:	72 15                	jb     40000783 <.L25+0xa6>
                if (altflag && (ch < ' ' || ch > '~'))
4000076e:	8b 14 24             	mov    (%esp),%edx
40000771:	85 d2                	test   %edx,%edx
40000773:	75 cb                	jne    40000740 <.L25+0x63>
                    putch(ch, putdat);
40000775:	83 ec 08             	sub    $0x8,%esp
40000778:	57                   	push   %edi
40000779:	51                   	push   %ecx
4000077a:	ff 54 24 50          	call   *0x50(%esp)
4000077e:	83 c4 10             	add    $0x10,%esp
40000781:	eb d2                	jmp    40000755 <.L25+0x78>
40000783:	89 6c 24 08          	mov    %ebp,0x8(%esp)
40000787:	8b 74 24 40          	mov    0x40(%esp),%esi
4000078b:	8b 6c 24 48          	mov    0x48(%esp),%ebp
            for (; width > 0; width--)
4000078f:	8b 44 24 08          	mov    0x8(%esp),%eax
40000793:	85 c0                	test   %eax,%eax
40000795:	7e 19                	jle    400007b0 <.L25+0xd3>
40000797:	89 c3                	mov    %eax,%ebx
40000799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
                putch(' ', putdat);
400007a0:	83 ec 08             	sub    $0x8,%esp
400007a3:	57                   	push   %edi
400007a4:	6a 20                	push   $0x20
400007a6:	ff d6                	call   *%esi
            for (; width > 0; width--)
400007a8:	83 c4 10             	add    $0x10,%esp
400007ab:	83 eb 01             	sub    $0x1,%ebx
400007ae:	75 f0                	jne    400007a0 <.L25+0xc3>
            if ((p = va_arg(ap, char *)) == NULL)
400007b0:	8b 44 24 14          	mov    0x14(%esp),%eax
400007b4:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007b8:	e9 94 fc ff ff       	jmp    40000451 <vprintfmt+0x21>
        return va_arg(*ap, unsigned long long);
400007bd:	8b 08                	mov    (%eax),%ecx
400007bf:	8b 58 04             	mov    0x4(%eax),%ebx
400007c2:	83 c0 08             	add    $0x8,%eax
400007c5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007c9:	e9 d7 fe ff ff       	jmp    400006a5 <.L29+0x2f>
400007ce:	8b 08                	mov    (%eax),%ecx
400007d0:	8b 58 04             	mov    0x4(%eax),%ebx
400007d3:	83 c0 08             	add    $0x8,%eax
400007d6:	ba 10 00 00 00       	mov    $0x10,%edx
400007db:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007df:	e9 1c fe ff ff       	jmp    40000600 <.L24+0x2e>
        return va_arg(*ap, long long);
400007e4:	8b 08                	mov    (%eax),%ecx
400007e6:	8b 58 04             	mov    0x4(%eax),%ebx
400007e9:	83 c0 08             	add    $0x8,%eax
400007ec:	89 44 24 4c          	mov    %eax,0x4c(%esp)
400007f0:	e9 a8 fe ff ff       	jmp    4000069d <.L29+0x27>

400007f5 <.L63>:
        switch (ch = *(unsigned char *) fmt++) {
400007f5:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
400007fa:	89 eb                	mov    %ebp,%ebx
400007fc:	e9 b0 fc ff ff       	jmp    400004b1 <vprintfmt+0x81>

40000801 <.L19>:
            padc = '-';
40000801:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
40000806:	89 eb                	mov    %ebp,%ebx
40000808:	e9 a4 fc ff ff       	jmp    400004b1 <vprintfmt+0x81>
4000080d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
                putch('-', putdat);
40000811:	83 ec 08             	sub    $0x8,%esp
                num = -(long long) num;
40000814:	31 db                	xor    %ebx,%ebx
40000816:	89 4c 24 08          	mov    %ecx,0x8(%esp)
                putch('-', putdat);
4000081a:	57                   	push   %edi
4000081b:	6a 2d                	push   $0x2d
4000081d:	ff d6                	call   *%esi
                num = -(long long) num;
4000081f:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000823:	ba 0a 00 00 00       	mov    $0xa,%edx
40000828:	f7 d9                	neg    %ecx
4000082a:	1b 5c 24 14          	sbb    0x14(%esp),%ebx
4000082e:	83 c4 10             	add    $0x10,%esp
40000831:	e9 ca fd ff ff       	jmp    40000600 <.L24+0x2e>
            if (width > 0 && padc != '-')
40000836:	84 c0                	test   %al,%al
40000838:	0f 85 99 00 00 00    	jne    400008d7 <.L19+0xd6>
                 (ch = *p++) != '\0' && (precision < 0
4000083e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000842:	89 74 24 40          	mov    %esi,0x40(%esp)
40000846:	b9 28 00 00 00       	mov    $0x28,%ecx
4000084b:	89 d6                	mov    %edx,%esi
4000084d:	89 6c 24 48          	mov    %ebp,0x48(%esp)
40000851:	b8 28 00 00 00       	mov    $0x28,%eax
40000856:	8b 6c 24 08          	mov    0x8(%esp),%ebp
4000085a:	8d 9b 42 e0 ff ff    	lea    -0x1fbe(%ebx),%ebx
40000860:	e9 00 ff ff ff       	jmp    40000765 <.L25+0x88>
                for (width -= strnlen(p, precision); width > 0; width--)
40000865:	83 ec 08             	sub    $0x8,%esp
40000868:	52                   	push   %edx
40000869:	89 54 24 28          	mov    %edx,0x28(%esp)
4000086d:	ff 74 24 24          	push   0x24(%esp)
40000871:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000875:	e8 26 03 00 00       	call   40000ba0 <strnlen>
4000087a:	29 44 24 18          	sub    %eax,0x18(%esp)
4000087e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000882:	83 c4 10             	add    $0x10,%esp
40000885:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000889:	85 c9                	test   %ecx,%ecx
4000088b:	0f 8e 99 00 00 00    	jle    4000092a <.L19+0x129>
                    putch(padc, putdat);
40000891:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
40000896:	89 54 24 10          	mov    %edx,0x10(%esp)
4000089a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000089e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
400008a2:	83 ec 08             	sub    $0x8,%esp
400008a5:	57                   	push   %edi
400008a6:	53                   	push   %ebx
400008a7:	ff d6                	call   *%esi
                for (width -= strnlen(p, precision); width > 0; width--)
400008a9:	83 c4 10             	add    $0x10,%esp
400008ac:	83 ed 01             	sub    $0x1,%ebp
400008af:	75 f1                	jne    400008a2 <.L19+0xa1>
                 (ch = *p++) != '\0' && (precision < 0
400008b1:	8b 44 24 18          	mov    0x18(%esp),%eax
400008b5:	8b 54 24 10          	mov    0x10(%esp),%edx
400008b9:	89 6c 24 08          	mov    %ebp,0x8(%esp)
400008bd:	8b 6c 24 48          	mov    0x48(%esp),%ebp
400008c1:	8d 58 01             	lea    0x1(%eax),%ebx
400008c4:	0f be 00             	movsbl (%eax),%eax
400008c7:	0f be c8             	movsbl %al,%ecx
400008ca:	85 c9                	test   %ecx,%ecx
400008cc:	0f 85 59 fe ff ff    	jne    4000072b <.L25+0x4e>
400008d2:	e9 d9 fe ff ff       	jmp    400007b0 <.L25+0xd3>
                for (width -= strnlen(p, precision); width > 0; width--)
400008d7:	83 ec 08             	sub    $0x8,%esp
400008da:	52                   	push   %edx
400008db:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400008df:	8d 8b 41 e0 ff ff    	lea    -0x1fbf(%ebx),%ecx
400008e5:	89 54 24 28          	mov    %edx,0x28(%esp)
400008e9:	51                   	push   %ecx
400008ea:	89 4c 24 28          	mov    %ecx,0x28(%esp)
400008ee:	e8 ad 02 00 00       	call   40000ba0 <strnlen>
400008f3:	29 44 24 18          	sub    %eax,0x18(%esp)
400008f7:	8b 44 24 18          	mov    0x18(%esp),%eax
400008fb:	83 c4 10             	add    $0x10,%esp
400008fe:	8b 54 24 1c          	mov    0x1c(%esp),%edx
40000902:	85 c0                	test   %eax,%eax
40000904:	7f 8b                	jg     40000891 <.L19+0x90>
                 (ch = *p++) != '\0' && (precision < 0
40000906:	b9 28 00 00 00       	mov    $0x28,%ecx
4000090b:	b8 28 00 00 00       	mov    $0x28,%eax
40000910:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000914:	89 74 24 40          	mov    %esi,0x40(%esp)
40000918:	89 d6                	mov    %edx,%esi
4000091a:	89 6c 24 48          	mov    %ebp,0x48(%esp)
4000091e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
40000922:	83 c3 01             	add    $0x1,%ebx
40000925:	e9 3b fe ff ff       	jmp    40000765 <.L25+0x88>
4000092a:	8b 44 24 18          	mov    0x18(%esp),%eax
4000092e:	0f be 08             	movsbl (%eax),%ecx
40000931:	89 c8                	mov    %ecx,%eax
40000933:	85 c9                	test   %ecx,%ecx
40000935:	75 d9                	jne    40000910 <.L19+0x10f>
40000937:	e9 74 fe ff ff       	jmp    400007b0 <.L25+0xd3>
4000093c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000940 <printfmt>:
{
40000940:	83 ec 0c             	sub    $0xc,%esp
    vprintfmt(putch, putdat, fmt, ap);
40000943:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000947:	50                   	push   %eax
40000948:	ff 74 24 1c          	push   0x1c(%esp)
4000094c:	ff 74 24 1c          	push   0x1c(%esp)
40000950:	ff 74 24 1c          	push   0x1c(%esp)
40000954:	e8 d7 fa ff ff       	call   40000430 <vprintfmt>
}
40000959:	83 c4 1c             	add    $0x1c,%esp
4000095c:	c3                   	ret
4000095d:	8d 76 00             	lea    0x0(%esi),%esi

40000960 <vsprintf>:

int vsprintf(char *buf, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
40000960:	e8 4e 01 00 00       	call   40000ab3 <__x86.get_pc_thunk.ax>
40000965:	05 8f 36 00 00       	add    $0x368f,%eax
{
4000096a:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
4000096d:	8b 54 24 20          	mov    0x20(%esp),%edx
40000971:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000978:	ff 
40000979:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000980:	00 
40000981:	89 54 24 04          	mov    %edx,0x4(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000985:	ff 74 24 28          	push   0x28(%esp)
40000989:	ff 74 24 28          	push   0x28(%esp)
4000098d:	8d 80 1c c4 ff ff    	lea    -0x3be4(%eax),%eax
40000993:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000997:	52                   	push   %edx
40000998:	50                   	push   %eax
40000999:	e8 92 fa ff ff       	call   40000430 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
4000099e:	8b 44 24 14          	mov    0x14(%esp),%eax
400009a2:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
400009a5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400009a9:	83 c4 2c             	add    $0x2c,%esp
400009ac:	c3                   	ret
400009ad:	8d 76 00             	lea    0x0(%esi),%esi

400009b0 <sprintf>:
int sprintf(char *buf, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
400009b0:	e8 fe 00 00 00       	call   40000ab3 <__x86.get_pc_thunk.ax>
400009b5:	05 3f 36 00 00       	add    $0x363f,%eax
{
400009ba:	83 ec 1c             	sub    $0x1c,%esp
    struct sprintbuf b = { buf, (char *) (intptr_t) ~ 0, 0 };
400009bd:	8b 54 24 20          	mov    0x20(%esp),%edx
400009c1:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
400009c8:	ff 
400009c9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400009d0:	00 
400009d1:	89 54 24 04          	mov    %edx,0x4(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
400009d5:	8d 54 24 28          	lea    0x28(%esp),%edx
400009d9:	52                   	push   %edx
400009da:	ff 74 24 28          	push   0x28(%esp)
400009de:	8d 80 1c c4 ff ff    	lea    -0x3be4(%eax),%eax
400009e4:	8d 54 24 0c          	lea    0xc(%esp),%edx
400009e8:	52                   	push   %edx
400009e9:	50                   	push   %eax
400009ea:	e8 41 fa ff ff       	call   40000430 <vprintfmt>
    *b.buf = '\0';
400009ef:	8b 44 24 14          	mov    0x14(%esp),%eax
400009f3:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsprintf(buf, fmt, ap);
    va_end(ap);

    return rc;
}
400009f6:	8b 44 24 1c          	mov    0x1c(%esp),%eax
400009fa:	83 c4 2c             	add    $0x2c,%esp
400009fd:	c3                   	ret
400009fe:	66 90                	xchg   %ax,%ax

40000a00 <vsnprintf>:

int vsnprintf(char *buf, int n, const char *fmt, va_list ap)
{
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a00:	e8 b2 00 00 00       	call   40000ab7 <__x86.get_pc_thunk.dx>
40000a05:	81 c2 ef 35 00 00    	add    $0x35ef,%edx
{
40000a0b:	83 ec 1c             	sub    $0x1c,%esp
40000a0e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a12:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000a16:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a1d:	00 
40000a1e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000a22:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000a26:	89 44 24 08          	mov    %eax,0x8(%esp)

    // print the string to the buffer
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a2a:	ff 74 24 2c          	push   0x2c(%esp)
40000a2e:	ff 74 24 2c          	push   0x2c(%esp)
40000a32:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a36:	50                   	push   %eax
40000a37:	8d 82 1c c4 ff ff    	lea    -0x3be4(%edx),%eax
40000a3d:	50                   	push   %eax
40000a3e:	e8 ed f9 ff ff       	call   40000430 <vprintfmt>

    // null terminate the buffer
    *b.buf = '\0';
40000a43:	8b 44 24 14          	mov    0x14(%esp),%eax
40000a47:	c6 00 00             	movb   $0x0,(%eax)

    return b.cnt;
}
40000a4a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000a4e:	83 c4 2c             	add    $0x2c,%esp
40000a51:	c3                   	ret
40000a52:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000a59:	00 
40000a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000a60 <snprintf>:
int snprintf(char *buf, int n, const char *fmt, ...)
{
    va_list ap;
    int rc;

    va_start(ap, fmt);
40000a60:	e8 52 00 00 00       	call   40000ab7 <__x86.get_pc_thunk.dx>
40000a65:	81 c2 8f 35 00 00    	add    $0x358f,%edx
{
40000a6b:	83 ec 1c             	sub    $0x1c,%esp
40000a6e:	8b 44 24 20          	mov    0x20(%esp),%eax
    struct sprintbuf b = { buf, buf + n - 1, 0 };
40000a72:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000a76:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000a7d:	00 
40000a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000a82:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000a86:	89 44 24 08          	mov    %eax,0x8(%esp)
    vprintfmt((void *) sprintputch, &b, fmt, ap);
40000a8a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000a8e:	50                   	push   %eax
40000a8f:	ff 74 24 2c          	push   0x2c(%esp)
40000a93:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000a97:	50                   	push   %eax
40000a98:	8d 82 1c c4 ff ff    	lea    -0x3be4(%edx),%eax
40000a9e:	50                   	push   %eax
40000a9f:	e8 8c f9 ff ff       	call   40000430 <vprintfmt>
    *b.buf = '\0';
40000aa4:	8b 44 24 14          	mov    0x14(%esp),%eax
40000aa8:	c6 00 00             	movb   $0x0,(%eax)
    rc = vsnprintf(buf, n, fmt, ap);
    va_end(ap);

    return rc;
}
40000aab:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000aaf:	83 c4 2c             	add    $0x2c,%esp
40000ab2:	c3                   	ret

40000ab3 <__x86.get_pc_thunk.ax>:
40000ab3:	8b 04 24             	mov    (%esp),%eax
40000ab6:	c3                   	ret

40000ab7 <__x86.get_pc_thunk.dx>:
40000ab7:	8b 14 24             	mov    (%esp),%edx
40000aba:	c3                   	ret

40000abb <__x86.get_pc_thunk.cx>:
40000abb:	8b 0c 24             	mov    (%esp),%ecx
40000abe:	c3                   	ret
40000abf:	90                   	nop

40000ac0 <spawn>:
#include <proc.h>
#include <syscall.h>
#include <types.h>

pid_t spawn(uintptr_t exec, unsigned int quota)
{
40000ac0:	53                   	push   %ebx
    asm volatile ("int %2"
40000ac1:	b8 01 00 00 00       	mov    $0x1,%eax
40000ac6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
40000aca:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000ace:	cd 30                	int    $0x30
    return errno ? -1 : pid;
40000ad0:	85 c0                	test   %eax,%eax
40000ad2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
40000ad7:	0f 44 c3             	cmove  %ebx,%eax
    return sys_spawn(exec, quota);
}
40000ada:	5b                   	pop    %ebx
40000adb:	c3                   	ret
40000adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000ae0 <yield>:
    asm volatile ("int %0"
40000ae0:	b8 02 00 00 00       	mov    $0x2,%eax
40000ae5:	cd 30                	int    $0x30

void yield(void)
{
    sys_yield();
}
40000ae7:	c3                   	ret
40000ae8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000aef:	00 

40000af0 <produce>:
}

static gcc_inline void sys_produce(void)
{
    asm volatile ("int %0"
40000af0:	b8 0d 00 00 00       	mov    $0xd,%eax
40000af5:	cd 30                	int    $0x30

void produce(void)
{
    sys_produce();
}
40000af7:	c3                   	ret
40000af8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000aff:	00 

40000b00 <consume>:
                  : "cc", "memory");
}

static gcc_inline void sys_consume(void)
{
    asm volatile ("int %0"
40000b00:	b8 0e 00 00 00       	mov    $0xe,%eax
40000b05:	cd 30                	int    $0x30

void consume(void)
{
    sys_consume();
}
40000b07:	c3                   	ret
40000b08:	66 90                	xchg   %ax,%ax
40000b0a:	66 90                	xchg   %ax,%ax
40000b0c:	66 90                	xchg   %ax,%ax
40000b0e:	66 90                	xchg   %ax,%ax

40000b10 <spinlock_init>:
    return result;
}

void spinlock_init(spinlock_t *lk)
{
    *lk = 0;
40000b10:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b14:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
40000b1a:	c3                   	ret
40000b1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000b20 <spinlock_acquire>:

void spinlock_acquire(spinlock_t *lk)
{
40000b20:	8b 54 24 04          	mov    0x4(%esp),%edx
    asm volatile ("lock; xchgl %0, %1"
40000b24:	b8 01 00 00 00       	mov    $0x1,%eax
40000b29:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b2c:	85 c0                	test   %eax,%eax
40000b2e:	74 13                	je     40000b43 <spinlock_acquire+0x23>
    asm volatile ("lock; xchgl %0, %1"
40000b30:	b9 01 00 00 00       	mov    $0x1,%ecx
40000b35:	8d 76 00             	lea    0x0(%esi),%esi
        asm volatile ("pause");
40000b38:	f3 90                	pause
    asm volatile ("lock; xchgl %0, %1"
40000b3a:	89 c8                	mov    %ecx,%eax
40000b3c:	f0 87 02             	lock xchg %eax,(%edx)
    while (xchg(lk, 1) != 0)
40000b3f:	85 c0                	test   %eax,%eax
40000b41:	75 f5                	jne    40000b38 <spinlock_acquire+0x18>
}
40000b43:	c3                   	ret
40000b44:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b4b:	00 
40000b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000b50 <spinlock_release>:

// Release the lock.
void spinlock_release(spinlock_t *lk)
{
40000b50:	8b 54 24 04          	mov    0x4(%esp),%edx
}

// Check whether this cpu is holding the lock.
bool spinlock_holding(spinlock_t *lk)
{
    return *lk;
40000b54:	8b 02                	mov    (%edx),%eax
    if (spinlock_holding(lk) == FALSE)
40000b56:	84 c0                	test   %al,%al
40000b58:	74 05                	je     40000b5f <spinlock_release+0xf>
    asm volatile ("lock; xchgl %0, %1"
40000b5a:	31 c0                	xor    %eax,%eax
40000b5c:	f0 87 02             	lock xchg %eax,(%edx)
}
40000b5f:	c3                   	ret

40000b60 <spinlock_holding>:
    return *lk;
40000b60:	8b 44 24 04          	mov    0x4(%esp),%eax
40000b64:	8b 00                	mov    (%eax),%eax
}
40000b66:	c3                   	ret
40000b67:	66 90                	xchg   %ax,%ax
40000b69:	66 90                	xchg   %ax,%ax
40000b6b:	66 90                	xchg   %ax,%ax
40000b6d:	66 90                	xchg   %ax,%ax
40000b6f:	90                   	nop

40000b70 <strlen>:
#include <string.h>
#include <types.h>

int strlen(const char *s)
{
40000b70:	8b 54 24 04          	mov    0x4(%esp),%edx
    int n;

    for (n = 0; *s != '\0'; s++)
40000b74:	31 c0                	xor    %eax,%eax
40000b76:	80 3a 00             	cmpb   $0x0,(%edx)
40000b79:	74 15                	je     40000b90 <strlen+0x20>
40000b7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        n++;
40000b80:	83 c0 01             	add    $0x1,%eax
    for (n = 0; *s != '\0'; s++)
40000b83:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000b87:	75 f7                	jne    40000b80 <strlen+0x10>
40000b89:	c3                   	ret
40000b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return n;
}
40000b90:	c3                   	ret
40000b91:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000b98:	00 
40000b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000ba0 <strnlen>:

int strnlen(const char *s, size_t size)
{
40000ba0:	8b 54 24 08          	mov    0x8(%esp),%edx
40000ba4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000ba8:	31 c0                	xor    %eax,%eax
40000baa:	85 d2                	test   %edx,%edx
40000bac:	75 09                	jne    40000bb7 <strnlen+0x17>
40000bae:	c3                   	ret
40000baf:	90                   	nop
        n++;
40000bb0:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
40000bb3:	39 c2                	cmp    %eax,%edx
40000bb5:	74 09                	je     40000bc0 <strnlen+0x20>
40000bb7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000bbb:	75 f3                	jne    40000bb0 <strnlen+0x10>
40000bbd:	c3                   	ret
40000bbe:	66 90                	xchg   %ax,%ax
    return n;
}
40000bc0:	c3                   	ret
40000bc1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bc8:	00 
40000bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000bd0 <strcpy>:

char *strcpy(char *dst, const char *src)
{
40000bd0:	53                   	push   %ebx
40000bd1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    char *ret;

    ret = dst;
    while ((*dst++ = *src++) != '\0')
40000bd5:	31 c0                	xor    %eax,%eax
{
40000bd7:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000bdb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    while ((*dst++ = *src++) != '\0')
40000be0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
40000be4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
40000be7:	83 c0 01             	add    $0x1,%eax
40000bea:	84 d2                	test   %dl,%dl
40000bec:	75 f2                	jne    40000be0 <strcpy+0x10>
        /* do nothing */ ;
    return ret;
}
40000bee:	89 c8                	mov    %ecx,%eax
40000bf0:	5b                   	pop    %ebx
40000bf1:	c3                   	ret
40000bf2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000bf9:	00 
40000bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000c00 <strncpy>:

char *strncpy(char *dst, const char *src, size_t size)
{
40000c00:	56                   	push   %esi
40000c01:	53                   	push   %ebx
40000c02:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000c06:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c0a:	8b 54 24 10          	mov    0x10(%esp),%edx
    size_t i;
    char *ret;

    ret = dst;
    for (i = 0; i < size; i++) {
40000c0e:	85 db                	test   %ebx,%ebx
40000c10:	74 21                	je     40000c33 <strncpy+0x33>
40000c12:	01 f3                	add    %esi,%ebx
40000c14:	89 f0                	mov    %esi,%eax
40000c16:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c1d:	00 
40000c1e:	66 90                	xchg   %ax,%ax
        *dst++ = *src;
40000c20:	0f b6 0a             	movzbl (%edx),%ecx
40000c23:	83 c0 01             	add    $0x1,%eax
        // If strlen(src) < size, null-pad 'dst' out to 'size' chars
        if (*src != '\0')
            src++;
40000c26:	80 f9 01             	cmp    $0x1,%cl
        *dst++ = *src;
40000c29:	88 48 ff             	mov    %cl,-0x1(%eax)
            src++;
40000c2c:	83 da ff             	sbb    $0xffffffff,%edx
    for (i = 0; i < size; i++) {
40000c2f:	39 c3                	cmp    %eax,%ebx
40000c31:	75 ed                	jne    40000c20 <strncpy+0x20>
    }
    return ret;
}
40000c33:	89 f0                	mov    %esi,%eax
40000c35:	5b                   	pop    %ebx
40000c36:	5e                   	pop    %esi
40000c37:	c3                   	ret
40000c38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000c3f:	00 

40000c40 <strlcpy>:

size_t strlcpy(char *dst, const char *src, size_t size)
{
40000c40:	56                   	push   %esi
40000c41:	53                   	push   %ebx
40000c42:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c46:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000c4a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    char *dst_in;

    dst_in = dst;
    if (size > 0) {
40000c4e:	85 c0                	test   %eax,%eax
40000c50:	74 29                	je     40000c7b <strlcpy+0x3b>
        while (--size > 0 && *src != '\0')
40000c52:	89 f2                	mov    %esi,%edx
40000c54:	83 e8 01             	sub    $0x1,%eax
40000c57:	74 1f                	je     40000c78 <strlcpy+0x38>
40000c59:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
40000c5c:	eb 0f                	jmp    40000c6d <strlcpy+0x2d>
40000c5e:	66 90                	xchg   %ax,%ax
            *dst++ = *src++;
40000c60:	83 c2 01             	add    $0x1,%edx
40000c63:	83 c1 01             	add    $0x1,%ecx
40000c66:	88 42 ff             	mov    %al,-0x1(%edx)
        while (--size > 0 && *src != '\0')
40000c69:	39 da                	cmp    %ebx,%edx
40000c6b:	74 07                	je     40000c74 <strlcpy+0x34>
40000c6d:	0f b6 01             	movzbl (%ecx),%eax
40000c70:	84 c0                	test   %al,%al
40000c72:	75 ec                	jne    40000c60 <strlcpy+0x20>
        *dst = '\0';
    }
    return dst - dst_in;
40000c74:	89 d0                	mov    %edx,%eax
40000c76:	29 f0                	sub    %esi,%eax
        *dst = '\0';
40000c78:	c6 02 00             	movb   $0x0,(%edx)
}
40000c7b:	5b                   	pop    %ebx
40000c7c:	5e                   	pop    %esi
40000c7d:	c3                   	ret
40000c7e:	66 90                	xchg   %ax,%ax

40000c80 <strcmp>:

int strcmp(const char *p, const char *q)
{
40000c80:	53                   	push   %ebx
40000c81:	8b 54 24 08          	mov    0x8(%esp),%edx
40000c85:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
40000c89:	0f b6 02             	movzbl (%edx),%eax
40000c8c:	84 c0                	test   %al,%al
40000c8e:	75 18                	jne    40000ca8 <strcmp+0x28>
40000c90:	eb 30                	jmp    40000cc2 <strcmp+0x42>
40000c92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000c98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
40000c9c:	83 c2 01             	add    $0x1,%edx
40000c9f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
40000ca2:	84 c0                	test   %al,%al
40000ca4:	74 12                	je     40000cb8 <strcmp+0x38>
40000ca6:	89 d9                	mov    %ebx,%ecx
40000ca8:	0f b6 19             	movzbl (%ecx),%ebx
40000cab:	38 c3                	cmp    %al,%bl
40000cad:	74 e9                	je     40000c98 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000caf:	29 d8                	sub    %ebx,%eax
}
40000cb1:	5b                   	pop    %ebx
40000cb2:	c3                   	ret
40000cb3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000cb8:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
40000cbc:	31 c0                	xor    %eax,%eax
40000cbe:	29 d8                	sub    %ebx,%eax
}
40000cc0:	5b                   	pop    %ebx
40000cc1:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
40000cc2:	0f b6 19             	movzbl (%ecx),%ebx
40000cc5:	31 c0                	xor    %eax,%eax
40000cc7:	eb e6                	jmp    40000caf <strcmp+0x2f>
40000cc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000cd0 <strncmp>:

int strncmp(const char *p, const char *q, size_t n)
{
40000cd0:	53                   	push   %ebx
40000cd1:	8b 54 24 10          	mov    0x10(%esp),%edx
40000cd5:	8b 44 24 08          	mov    0x8(%esp),%eax
40000cd9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
40000cdd:	85 d2                	test   %edx,%edx
40000cdf:	75 16                	jne    40000cf7 <strncmp+0x27>
40000ce1:	eb 2d                	jmp    40000d10 <strncmp+0x40>
40000ce3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000ce8:	3a 19                	cmp    (%ecx),%bl
40000cea:	75 12                	jne    40000cfe <strncmp+0x2e>
        n--, p++, q++;
40000cec:	83 c0 01             	add    $0x1,%eax
40000cef:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
40000cf2:	83 ea 01             	sub    $0x1,%edx
40000cf5:	74 19                	je     40000d10 <strncmp+0x40>
40000cf7:	0f b6 18             	movzbl (%eax),%ebx
40000cfa:	84 db                	test   %bl,%bl
40000cfc:	75 ea                	jne    40000ce8 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000cfe:	0f b6 00             	movzbl (%eax),%eax
40000d01:	0f b6 11             	movzbl (%ecx),%edx
}
40000d04:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
40000d05:	29 d0                	sub    %edx,%eax
}
40000d07:	c3                   	ret
40000d08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d0f:	00 
        return 0;
40000d10:	31 c0                	xor    %eax,%eax
}
40000d12:	5b                   	pop    %ebx
40000d13:	c3                   	ret
40000d14:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d1b:	00 
40000d1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000d20 <strchr>:

char *strchr(const char *s, char c)
{
40000d20:	8b 44 24 04          	mov    0x4(%esp),%eax
40000d24:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
40000d29:	0f b6 10             	movzbl (%eax),%edx
40000d2c:	84 d2                	test   %dl,%dl
40000d2e:	75 13                	jne    40000d43 <strchr+0x23>
40000d30:	eb 1e                	jmp    40000d50 <strchr+0x30>
40000d32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000d38:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d3c:	83 c0 01             	add    $0x1,%eax
40000d3f:	84 d2                	test   %dl,%dl
40000d41:	74 0d                	je     40000d50 <strchr+0x30>
        if (*s == c)
40000d43:	38 d1                	cmp    %dl,%cl
40000d45:	75 f1                	jne    40000d38 <strchr+0x18>
            return (char *) s;
    return 0;
}
40000d47:	c3                   	ret
40000d48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d4f:	00 
    return 0;
40000d50:	31 c0                	xor    %eax,%eax
}
40000d52:	c3                   	ret
40000d53:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d5a:	00 
40000d5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000d60 <strfind>:

char *strfind(const char *s, char c)
{
40000d60:	53                   	push   %ebx
40000d61:	8b 44 24 08          	mov    0x8(%esp),%eax
40000d65:	8b 54 24 0c          	mov    0xc(%esp),%edx
    for (; *s; s++)
40000d69:	0f b6 18             	movzbl (%eax),%ebx
        if (*s == c)
40000d6c:	38 d3                	cmp    %dl,%bl
40000d6e:	74 1f                	je     40000d8f <strfind+0x2f>
40000d70:	89 d1                	mov    %edx,%ecx
40000d72:	84 db                	test   %bl,%bl
40000d74:	75 0e                	jne    40000d84 <strfind+0x24>
40000d76:	eb 17                	jmp    40000d8f <strfind+0x2f>
40000d78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d7f:	00 
40000d80:	84 d2                	test   %dl,%dl
40000d82:	74 0b                	je     40000d8f <strfind+0x2f>
    for (; *s; s++)
40000d84:	0f b6 50 01          	movzbl 0x1(%eax),%edx
40000d88:	83 c0 01             	add    $0x1,%eax
        if (*s == c)
40000d8b:	38 ca                	cmp    %cl,%dl
40000d8d:	75 f1                	jne    40000d80 <strfind+0x20>
            break;
    return (char *) s;
}
40000d8f:	5b                   	pop    %ebx
40000d90:	c3                   	ret
40000d91:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000d98:	00 
40000d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000da0 <strtol>:

long strtol(const char *s, char **endptr, int base)
{
40000da0:	55                   	push   %ebp
40000da1:	57                   	push   %edi
40000da2:	56                   	push   %esi
40000da3:	53                   	push   %ebx
40000da4:	8b 54 24 14          	mov    0x14(%esp),%edx
40000da8:	8b 74 24 18          	mov    0x18(%esp),%esi
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t')
40000dac:	0f b6 02             	movzbl (%edx),%eax
40000daf:	3c 20                	cmp    $0x20,%al
40000db1:	75 10                	jne    40000dc3 <strtol+0x23>
40000db3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
40000db8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        s++;
40000dbc:	83 c2 01             	add    $0x1,%edx
    while (*s == ' ' || *s == '\t')
40000dbf:	3c 20                	cmp    $0x20,%al
40000dc1:	74 f5                	je     40000db8 <strtol+0x18>
40000dc3:	3c 09                	cmp    $0x9,%al
40000dc5:	74 f1                	je     40000db8 <strtol+0x18>

    // plus/minus sign
    if (*s == '+')
40000dc7:	3c 2b                	cmp    $0x2b,%al
40000dc9:	0f 84 b1 00 00 00    	je     40000e80 <strtol+0xe0>
    int neg = 0;
40000dcf:	31 ff                	xor    %edi,%edi
        s++;
    else if (*s == '-')
40000dd1:	3c 2d                	cmp    $0x2d,%al
40000dd3:	0f 84 97 00 00 00    	je     40000e70 <strtol+0xd0>
        s++, neg = 1;

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000dd9:	0f b6 02             	movzbl (%edx),%eax
40000ddc:	f7 44 24 1c ef ff ff 	testl  $0xffffffef,0x1c(%esp)
40000de3:	ff 
40000de4:	75 1d                	jne    40000e03 <strtol+0x63>
40000de6:	3c 30                	cmp    $0x30,%al
40000de8:	0f 84 a2 00 00 00    	je     40000e90 <strtol+0xf0>
        s += 2, base = 16;
    else if (base == 0 && s[0] == '0')
40000dee:	83 7c 24 1c 01       	cmpl   $0x1,0x1c(%esp)
40000df3:	19 c0                	sbb    %eax,%eax
40000df5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
40000df9:	83 64 24 1c fa       	andl   $0xfffffffa,0x1c(%esp)
40000dfe:	83 44 24 1c 10       	addl   $0x10,0x1c(%esp)
40000e03:	31 c9                	xor    %ecx,%ecx
40000e05:	eb 1c                	jmp    40000e23 <strtol+0x83>
40000e07:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000e0e:	00 
40000e0f:	90                   	nop
    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9')
            dig = *s - '0';
40000e10:	83 e8 30             	sub    $0x30,%eax
            dig = *s - 'a' + 10;
        else if (*s >= 'A' && *s <= 'Z')
            dig = *s - 'A' + 10;
        else
            break;
        if (dig >= base)
40000e13:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e17:	7d 2a                	jge    40000e43 <strtol+0xa3>
            break;
        s++, val = (val * base) + dig;
40000e19:	0f af 4c 24 1c       	imul   0x1c(%esp),%ecx
40000e1e:	83 c2 01             	add    $0x1,%edx
40000e21:	01 c1                	add    %eax,%ecx
        if (*s >= '0' && *s <= '9')
40000e23:	0f be 02             	movsbl (%edx),%eax
40000e26:	8d 68 d0             	lea    -0x30(%eax),%ebp
40000e29:	89 eb                	mov    %ebp,%ebx
40000e2b:	80 fb 09             	cmp    $0x9,%bl
40000e2e:	76 e0                	jbe    40000e10 <strtol+0x70>
        else if (*s >= 'a' && *s <= 'z')
40000e30:	8d 68 9f             	lea    -0x61(%eax),%ebp
40000e33:	89 eb                	mov    %ebp,%ebx
40000e35:	80 fb 19             	cmp    $0x19,%bl
40000e38:	77 26                	ja     40000e60 <strtol+0xc0>
            dig = *s - 'a' + 10;
40000e3a:	83 e8 57             	sub    $0x57,%eax
        if (dig >= base)
40000e3d:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
40000e41:	7c d6                	jl     40000e19 <strtol+0x79>
        // we don't properly detect overflow!
    }

    if (endptr)
40000e43:	85 f6                	test   %esi,%esi
40000e45:	74 02                	je     40000e49 <strtol+0xa9>
        *endptr = (char *) s;
40000e47:	89 16                	mov    %edx,(%esi)
    return (neg ? -val : val);
40000e49:	89 c8                	mov    %ecx,%eax
}
40000e4b:	5b                   	pop    %ebx
40000e4c:	5e                   	pop    %esi
    return (neg ? -val : val);
40000e4d:	f7 d8                	neg    %eax
40000e4f:	85 ff                	test   %edi,%edi
}
40000e51:	5f                   	pop    %edi
40000e52:	5d                   	pop    %ebp
    return (neg ? -val : val);
40000e53:	0f 45 c8             	cmovne %eax,%ecx
}
40000e56:	89 c8                	mov    %ecx,%eax
40000e58:	c3                   	ret
40000e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if (*s >= 'A' && *s <= 'Z')
40000e60:	8d 68 bf             	lea    -0x41(%eax),%ebp
40000e63:	89 eb                	mov    %ebp,%ebx
40000e65:	80 fb 19             	cmp    $0x19,%bl
40000e68:	77 d9                	ja     40000e43 <strtol+0xa3>
            dig = *s - 'A' + 10;
40000e6a:	83 e8 37             	sub    $0x37,%eax
40000e6d:	eb a4                	jmp    40000e13 <strtol+0x73>
40000e6f:	90                   	nop
        s++, neg = 1;
40000e70:	83 c2 01             	add    $0x1,%edx
40000e73:	bf 01 00 00 00       	mov    $0x1,%edi
40000e78:	e9 5c ff ff ff       	jmp    40000dd9 <strtol+0x39>
40000e7d:	8d 76 00             	lea    0x0(%esi),%esi
        s++;
40000e80:	83 c2 01             	add    $0x1,%edx
    int neg = 0;
40000e83:	31 ff                	xor    %edi,%edi
40000e85:	e9 4f ff ff ff       	jmp    40000dd9 <strtol+0x39>
40000e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
40000e90:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
40000e94:	74 25                	je     40000ebb <strtol+0x11b>
    else if (base == 0 && s[0] == '0')
40000e96:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000e9a:	85 c0                	test   %eax,%eax
40000e9c:	74 0d                	je     40000eab <strtol+0x10b>
40000e9e:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000ea5:	00 
40000ea6:	e9 58 ff ff ff       	jmp    40000e03 <strtol+0x63>
        s++, base = 8;
40000eab:	c7 44 24 1c 08 00 00 	movl   $0x8,0x1c(%esp)
40000eb2:	00 
40000eb3:	83 c2 01             	add    $0x1,%edx
40000eb6:	e9 48 ff ff ff       	jmp    40000e03 <strtol+0x63>
        s += 2, base = 16;
40000ebb:	c7 44 24 1c 10 00 00 	movl   $0x10,0x1c(%esp)
40000ec2:	00 
40000ec3:	83 c2 02             	add    $0x2,%edx
40000ec6:	e9 38 ff ff ff       	jmp    40000e03 <strtol+0x63>
40000ecb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000ed0 <memset>:

void *memset(void *v, int c, size_t n)
{
40000ed0:	57                   	push   %edi
40000ed1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000ed5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40000ed9:	85 c9                	test   %ecx,%ecx
40000edb:	74 19                	je     40000ef6 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
40000edd:	89 f8                	mov    %edi,%eax
40000edf:	09 c8                	or     %ecx,%eax
40000ee1:	a8 03                	test   $0x3,%al
40000ee3:	75 1b                	jne    40000f00 <memset+0x30>
        c &= 0xFF;
40000ee5:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
40000eea:	c1 e9 02             	shr    $0x2,%ecx
40000eed:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
40000ef3:	fc                   	cld
40000ef4:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
40000ef6:	89 f8                	mov    %edi,%eax
40000ef8:	5f                   	pop    %edi
40000ef9:	c3                   	ret
40000efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
40000f00:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f04:	fc                   	cld
40000f05:	f3 aa                	rep stos %al,%es:(%edi)
}
40000f07:	89 f8                	mov    %edi,%eax
40000f09:	5f                   	pop    %edi
40000f0a:	c3                   	ret
40000f0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40000f10 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
40000f10:	57                   	push   %edi
40000f11:	56                   	push   %esi
40000f12:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f16:	8b 74 24 10          	mov    0x10(%esp),%esi
40000f1a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
40000f1e:	39 c6                	cmp    %eax,%esi
40000f20:	73 26                	jae    40000f48 <memmove+0x38>
40000f22:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40000f25:	39 d0                	cmp    %edx,%eax
40000f27:	73 1f                	jae    40000f48 <memmove+0x38>
        s += n;
        d += n;
40000f29:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f2c:	89 fe                	mov    %edi,%esi
40000f2e:	09 ce                	or     %ecx,%esi
40000f30:	09 d6                	or     %edx,%esi
40000f32:	83 e6 03             	and    $0x3,%esi
40000f35:	74 39                	je     40000f70 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
40000f37:	83 ef 01             	sub    $0x1,%edi
40000f3a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
40000f3d:	fd                   	std
40000f3e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
40000f40:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
40000f41:	5e                   	pop    %esi
40000f42:	5f                   	pop    %edi
40000f43:	c3                   	ret
40000f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
40000f48:	89 c2                	mov    %eax,%edx
40000f4a:	09 ca                	or     %ecx,%edx
40000f4c:	09 f2                	or     %esi,%edx
40000f4e:	83 e2 03             	and    $0x3,%edx
40000f51:	74 0d                	je     40000f60 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
40000f53:	89 c7                	mov    %eax,%edi
40000f55:	fc                   	cld
40000f56:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
40000f58:	5e                   	pop    %esi
40000f59:	5f                   	pop    %edi
40000f5a:	c3                   	ret
40000f5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
40000f60:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
40000f63:	89 c7                	mov    %eax,%edi
40000f65:	fc                   	cld
40000f66:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000f68:	eb ee                	jmp    40000f58 <memmove+0x48>
40000f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
40000f70:	83 ef 04             	sub    $0x4,%edi
40000f73:	8d 72 fc             	lea    -0x4(%edx),%esi
40000f76:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
40000f79:	fd                   	std
40000f7a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40000f7c:	eb c2                	jmp    40000f40 <memmove+0x30>
40000f7e:	66 90                	xchg   %ax,%ax

40000f80 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
40000f80:	eb 8e                	jmp    40000f10 <memmove>
40000f82:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000f89:	00 
40000f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000f90 <memcmp>:
}

int memcmp(const void *v1, const void *v2, size_t n)
{
40000f90:	56                   	push   %esi
40000f91:	53                   	push   %ebx
40000f92:	8b 74 24 14          	mov    0x14(%esp),%esi
40000f96:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000f9a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
40000f9e:	85 f6                	test   %esi,%esi
40000fa0:	74 2e                	je     40000fd0 <memcmp+0x40>
40000fa2:	01 c6                	add    %eax,%esi
40000fa4:	eb 14                	jmp    40000fba <memcmp+0x2a>
40000fa6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fad:	00 
40000fae:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
40000fb0:	83 c0 01             	add    $0x1,%eax
40000fb3:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
40000fb6:	39 f0                	cmp    %esi,%eax
40000fb8:	74 16                	je     40000fd0 <memcmp+0x40>
        if (*s1 != *s2)
40000fba:	0f b6 08             	movzbl (%eax),%ecx
40000fbd:	0f b6 1a             	movzbl (%edx),%ebx
40000fc0:	38 d9                	cmp    %bl,%cl
40000fc2:	74 ec                	je     40000fb0 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
40000fc4:	0f b6 c1             	movzbl %cl,%eax
40000fc7:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
40000fc9:	5b                   	pop    %ebx
40000fca:	5e                   	pop    %esi
40000fcb:	c3                   	ret
40000fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
40000fd0:	31 c0                	xor    %eax,%eax
}
40000fd2:	5b                   	pop    %ebx
40000fd3:	5e                   	pop    %esi
40000fd4:	c3                   	ret
40000fd5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
40000fdc:	00 
40000fdd:	8d 76 00             	lea    0x0(%esi),%esi

40000fe0 <memchr>:

void *memchr(const void *s, int c, size_t n)
{
40000fe0:	8b 44 24 04          	mov    0x4(%esp),%eax
    const void *ends = (const char *) s + n;
40000fe4:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000fe8:	01 c2                	add    %eax,%edx
    for (; s < ends; s++)
40000fea:	39 d0                	cmp    %edx,%eax
40000fec:	73 1a                	jae    40001008 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
40000fee:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
40000ff3:	eb 0a                	jmp    40000fff <memchr+0x1f>
40000ff5:	8d 76 00             	lea    0x0(%esi),%esi
    for (; s < ends; s++)
40000ff8:	83 c0 01             	add    $0x1,%eax
40000ffb:	39 c2                	cmp    %eax,%edx
40000ffd:	74 09                	je     40001008 <memchr+0x28>
        if (*(const unsigned char *) s == (unsigned char) c)
40000fff:	38 08                	cmp    %cl,(%eax)
40001001:	75 f5                	jne    40000ff8 <memchr+0x18>
            return (void *) s;
    return NULL;
}
40001003:	c3                   	ret
40001004:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return NULL;
40001008:	31 c0                	xor    %eax,%eax
}
4000100a:	c3                   	ret
4000100b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

40001010 <memzero>:

void *memzero(void *v, size_t n)
{
40001010:	57                   	push   %edi
40001011:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40001015:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
40001019:	85 c9                	test   %ecx,%ecx
4000101b:	74 0f                	je     4000102c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
4000101d:	89 f8                	mov    %edi,%eax
4000101f:	09 c8                	or     %ecx,%eax
40001021:	83 e0 03             	and    $0x3,%eax
40001024:	75 0a                	jne    40001030 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
40001026:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
40001029:	fc                   	cld
4000102a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
4000102c:	89 f8                	mov    %edi,%eax
4000102e:	5f                   	pop    %edi
4000102f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
40001030:	31 c0                	xor    %eax,%eax
40001032:	fc                   	cld
40001033:	f3 aa                	rep stos %al,%es:(%edi)
}
40001035:	89 f8                	mov    %edi,%eax
40001037:	5f                   	pop    %edi
40001038:	c3                   	ret

40001039 <__x86.get_pc_thunk.si>:
40001039:	8b 34 24             	mov    (%esp),%esi
4000103c:	c3                   	ret
4000103d:	66 90                	xchg   %ax,%ax
4000103f:	90                   	nop

40001040 <__udivdi3>:
40001040:	f3 0f 1e fb          	endbr32
40001044:	55                   	push   %ebp
40001045:	89 e5                	mov    %esp,%ebp
40001047:	57                   	push   %edi
40001048:	56                   	push   %esi
40001049:	53                   	push   %ebx
4000104a:	83 ec 1c             	sub    $0x1c,%esp
4000104d:	8b 7d 08             	mov    0x8(%ebp),%edi
40001050:	8b 45 14             	mov    0x14(%ebp),%eax
40001053:	8b 75 0c             	mov    0xc(%ebp),%esi
40001056:	8b 5d 10             	mov    0x10(%ebp),%ebx
40001059:	89 7d e4             	mov    %edi,-0x1c(%ebp)
4000105c:	85 c0                	test   %eax,%eax
4000105e:	75 20                	jne    40001080 <__udivdi3+0x40>
40001060:	39 de                	cmp    %ebx,%esi
40001062:	73 54                	jae    400010b8 <__udivdi3+0x78>
40001064:	89 f8                	mov    %edi,%eax
40001066:	31 ff                	xor    %edi,%edi
40001068:	89 f2                	mov    %esi,%edx
4000106a:	f7 f3                	div    %ebx
4000106c:	89 fa                	mov    %edi,%edx
4000106e:	83 c4 1c             	add    $0x1c,%esp
40001071:	5b                   	pop    %ebx
40001072:	5e                   	pop    %esi
40001073:	5f                   	pop    %edi
40001074:	5d                   	pop    %ebp
40001075:	c3                   	ret
40001076:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
4000107d:	00 
4000107e:	66 90                	xchg   %ax,%ax
40001080:	39 c6                	cmp    %eax,%esi
40001082:	73 14                	jae    40001098 <__udivdi3+0x58>
40001084:	31 ff                	xor    %edi,%edi
40001086:	31 c0                	xor    %eax,%eax
40001088:	89 fa                	mov    %edi,%edx
4000108a:	83 c4 1c             	add    $0x1c,%esp
4000108d:	5b                   	pop    %ebx
4000108e:	5e                   	pop    %esi
4000108f:	5f                   	pop    %edi
40001090:	5d                   	pop    %ebp
40001091:	c3                   	ret
40001092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001098:	0f bd f8             	bsr    %eax,%edi
4000109b:	83 f7 1f             	xor    $0x1f,%edi
4000109e:	75 48                	jne    400010e8 <__udivdi3+0xa8>
400010a0:	39 f0                	cmp    %esi,%eax
400010a2:	72 07                	jb     400010ab <__udivdi3+0x6b>
400010a4:	31 c0                	xor    %eax,%eax
400010a6:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
400010a9:	72 dd                	jb     40001088 <__udivdi3+0x48>
400010ab:	b8 01 00 00 00       	mov    $0x1,%eax
400010b0:	eb d6                	jmp    40001088 <__udivdi3+0x48>
400010b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400010b8:	89 d9                	mov    %ebx,%ecx
400010ba:	85 db                	test   %ebx,%ebx
400010bc:	75 0b                	jne    400010c9 <__udivdi3+0x89>
400010be:	b8 01 00 00 00       	mov    $0x1,%eax
400010c3:	31 d2                	xor    %edx,%edx
400010c5:	f7 f3                	div    %ebx
400010c7:	89 c1                	mov    %eax,%ecx
400010c9:	31 d2                	xor    %edx,%edx
400010cb:	89 f0                	mov    %esi,%eax
400010cd:	f7 f1                	div    %ecx
400010cf:	89 c6                	mov    %eax,%esi
400010d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
400010d4:	89 f7                	mov    %esi,%edi
400010d6:	f7 f1                	div    %ecx
400010d8:	89 fa                	mov    %edi,%edx
400010da:	83 c4 1c             	add    $0x1c,%esp
400010dd:	5b                   	pop    %ebx
400010de:	5e                   	pop    %esi
400010df:	5f                   	pop    %edi
400010e0:	5d                   	pop    %ebp
400010e1:	c3                   	ret
400010e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400010e8:	89 f9                	mov    %edi,%ecx
400010ea:	ba 20 00 00 00       	mov    $0x20,%edx
400010ef:	29 fa                	sub    %edi,%edx
400010f1:	d3 e0                	shl    %cl,%eax
400010f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
400010f6:	89 d1                	mov    %edx,%ecx
400010f8:	89 d8                	mov    %ebx,%eax
400010fa:	d3 e8                	shr    %cl,%eax
400010fc:	89 c1                	mov    %eax,%ecx
400010fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
40001101:	09 c1                	or     %eax,%ecx
40001103:	89 f0                	mov    %esi,%eax
40001105:	89 4d e0             	mov    %ecx,-0x20(%ebp)
40001108:	89 f9                	mov    %edi,%ecx
4000110a:	d3 e3                	shl    %cl,%ebx
4000110c:	89 d1                	mov    %edx,%ecx
4000110e:	d3 e8                	shr    %cl,%eax
40001110:	89 5d dc             	mov    %ebx,-0x24(%ebp)
40001113:	89 f9                	mov    %edi,%ecx
40001115:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
40001118:	d3 e6                	shl    %cl,%esi
4000111a:	89 d1                	mov    %edx,%ecx
4000111c:	d3 eb                	shr    %cl,%ebx
4000111e:	09 f3                	or     %esi,%ebx
40001120:	89 c6                	mov    %eax,%esi
40001122:	89 f2                	mov    %esi,%edx
40001124:	89 d8                	mov    %ebx,%eax
40001126:	f7 75 e0             	divl   -0x20(%ebp)
40001129:	89 d6                	mov    %edx,%esi
4000112b:	89 c3                	mov    %eax,%ebx
4000112d:	f7 65 dc             	mull   -0x24(%ebp)
40001130:	89 55 e0             	mov    %edx,-0x20(%ebp)
40001133:	39 d6                	cmp    %edx,%esi
40001135:	72 21                	jb     40001158 <__udivdi3+0x118>
40001137:	8b 55 e4             	mov    -0x1c(%ebp),%edx
4000113a:	89 f9                	mov    %edi,%ecx
4000113c:	d3 e2                	shl    %cl,%edx
4000113e:	39 c2                	cmp    %eax,%edx
40001140:	73 07                	jae    40001149 <__udivdi3+0x109>
40001142:	8b 55 e0             	mov    -0x20(%ebp),%edx
40001145:	39 d6                	cmp    %edx,%esi
40001147:	74 0f                	je     40001158 <__udivdi3+0x118>
40001149:	89 d8                	mov    %ebx,%eax
4000114b:	31 ff                	xor    %edi,%edi
4000114d:	e9 36 ff ff ff       	jmp    40001088 <__udivdi3+0x48>
40001152:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001158:	8d 43 ff             	lea    -0x1(%ebx),%eax
4000115b:	31 ff                	xor    %edi,%edi
4000115d:	e9 26 ff ff ff       	jmp    40001088 <__udivdi3+0x48>
40001162:	66 90                	xchg   %ax,%ax
40001164:	66 90                	xchg   %ax,%ax
40001166:	66 90                	xchg   %ax,%ax
40001168:	66 90                	xchg   %ax,%ax
4000116a:	66 90                	xchg   %ax,%ax
4000116c:	66 90                	xchg   %ax,%ax
4000116e:	66 90                	xchg   %ax,%ax

40001170 <__umoddi3>:
40001170:	f3 0f 1e fb          	endbr32
40001174:	55                   	push   %ebp
40001175:	89 e5                	mov    %esp,%ebp
40001177:	57                   	push   %edi
40001178:	56                   	push   %esi
40001179:	53                   	push   %ebx
4000117a:	83 ec 2c             	sub    $0x2c,%esp
4000117d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
40001180:	8b 45 14             	mov    0x14(%ebp),%eax
40001183:	8b 75 08             	mov    0x8(%ebp),%esi
40001186:	8b 7d 10             	mov    0x10(%ebp),%edi
40001189:	89 da                	mov    %ebx,%edx
4000118b:	85 c0                	test   %eax,%eax
4000118d:	75 19                	jne    400011a8 <__umoddi3+0x38>
4000118f:	39 fb                	cmp    %edi,%ebx
40001191:	73 5d                	jae    400011f0 <__umoddi3+0x80>
40001193:	89 f0                	mov    %esi,%eax
40001195:	f7 f7                	div    %edi
40001197:	89 d0                	mov    %edx,%eax
40001199:	31 d2                	xor    %edx,%edx
4000119b:	83 c4 2c             	add    $0x2c,%esp
4000119e:	5b                   	pop    %ebx
4000119f:	5e                   	pop    %esi
400011a0:	5f                   	pop    %edi
400011a1:	5d                   	pop    %ebp
400011a2:	c3                   	ret
400011a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400011a8:	89 75 e0             	mov    %esi,-0x20(%ebp)
400011ab:	39 c3                	cmp    %eax,%ebx
400011ad:	73 11                	jae    400011c0 <__umoddi3+0x50>
400011af:	89 f0                	mov    %esi,%eax
400011b1:	83 c4 2c             	add    $0x2c,%esp
400011b4:	5b                   	pop    %ebx
400011b5:	5e                   	pop    %esi
400011b6:	5f                   	pop    %edi
400011b7:	5d                   	pop    %ebp
400011b8:	c3                   	ret
400011b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400011c0:	0f bd c8             	bsr    %eax,%ecx
400011c3:	83 f1 1f             	xor    $0x1f,%ecx
400011c6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
400011c9:	75 45                	jne    40001210 <__umoddi3+0xa0>
400011cb:	39 d8                	cmp    %ebx,%eax
400011cd:	0f 82 d5 00 00 00    	jb     400012a8 <__umoddi3+0x138>
400011d3:	39 fe                	cmp    %edi,%esi
400011d5:	0f 83 cd 00 00 00    	jae    400012a8 <__umoddi3+0x138>
400011db:	8b 45 e0             	mov    -0x20(%ebp),%eax
400011de:	83 c4 2c             	add    $0x2c,%esp
400011e1:	5b                   	pop    %ebx
400011e2:	5e                   	pop    %esi
400011e3:	5f                   	pop    %edi
400011e4:	5d                   	pop    %ebp
400011e5:	c3                   	ret
400011e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
400011ed:	00 
400011ee:	66 90                	xchg   %ax,%ax
400011f0:	89 f9                	mov    %edi,%ecx
400011f2:	85 ff                	test   %edi,%edi
400011f4:	75 0b                	jne    40001201 <__umoddi3+0x91>
400011f6:	b8 01 00 00 00       	mov    $0x1,%eax
400011fb:	31 d2                	xor    %edx,%edx
400011fd:	f7 f7                	div    %edi
400011ff:	89 c1                	mov    %eax,%ecx
40001201:	89 d8                	mov    %ebx,%eax
40001203:	31 d2                	xor    %edx,%edx
40001205:	f7 f1                	div    %ecx
40001207:	89 f0                	mov    %esi,%eax
40001209:	f7 f1                	div    %ecx
4000120b:	eb 8a                	jmp    40001197 <__umoddi3+0x27>
4000120d:	8d 76 00             	lea    0x0(%esi),%esi
40001210:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
40001213:	ba 20 00 00 00       	mov    $0x20,%edx
40001218:	29 ca                	sub    %ecx,%edx
4000121a:	d3 e0                	shl    %cl,%eax
4000121c:	89 45 dc             	mov    %eax,-0x24(%ebp)
4000121f:	89 d1                	mov    %edx,%ecx
40001221:	89 f8                	mov    %edi,%eax
40001223:	d3 e8                	shr    %cl,%eax
40001225:	89 55 e0             	mov    %edx,-0x20(%ebp)
40001228:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
4000122c:	89 c2                	mov    %eax,%edx
4000122e:	8b 45 dc             	mov    -0x24(%ebp),%eax
40001231:	d3 e7                	shl    %cl,%edi
40001233:	09 c2                	or     %eax,%edx
40001235:	8b 45 e0             	mov    -0x20(%ebp),%eax
40001238:	89 7d d8             	mov    %edi,-0x28(%ebp)
4000123b:	89 f7                	mov    %esi,%edi
4000123d:	89 55 dc             	mov    %edx,-0x24(%ebp)
40001240:	89 da                	mov    %ebx,%edx
40001242:	89 c1                	mov    %eax,%ecx
40001244:	d3 ea                	shr    %cl,%edx
40001246:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
4000124a:	d3 e3                	shl    %cl,%ebx
4000124c:	89 c1                	mov    %eax,%ecx
4000124e:	d3 ef                	shr    %cl,%edi
40001250:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
40001254:	89 f8                	mov    %edi,%eax
40001256:	d3 e6                	shl    %cl,%esi
40001258:	09 d8                	or     %ebx,%eax
4000125a:	f7 75 dc             	divl   -0x24(%ebp)
4000125d:	89 d3                	mov    %edx,%ebx
4000125f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
40001262:	89 f7                	mov    %esi,%edi
40001264:	f7 65 d8             	mull   -0x28(%ebp)
40001267:	89 c6                	mov    %eax,%esi
40001269:	89 d1                	mov    %edx,%ecx
4000126b:	39 d3                	cmp    %edx,%ebx
4000126d:	72 06                	jb     40001275 <__umoddi3+0x105>
4000126f:	75 0e                	jne    4000127f <__umoddi3+0x10f>
40001271:	39 c7                	cmp    %eax,%edi
40001273:	73 0a                	jae    4000127f <__umoddi3+0x10f>
40001275:	2b 45 d8             	sub    -0x28(%ebp),%eax
40001278:	1b 55 dc             	sbb    -0x24(%ebp),%edx
4000127b:	89 d1                	mov    %edx,%ecx
4000127d:	89 c6                	mov    %eax,%esi
4000127f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
40001282:	8b 7d e4             	mov    -0x1c(%ebp),%edi
40001285:	29 f0                	sub    %esi,%eax
40001287:	19 cb                	sbb    %ecx,%ebx
40001289:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
4000128d:	89 da                	mov    %ebx,%edx
4000128f:	d3 e2                	shl    %cl,%edx
40001291:	89 f9                	mov    %edi,%ecx
40001293:	d3 e8                	shr    %cl,%eax
40001295:	d3 eb                	shr    %cl,%ebx
40001297:	09 d0                	or     %edx,%eax
40001299:	89 da                	mov    %ebx,%edx
4000129b:	83 c4 2c             	add    $0x2c,%esp
4000129e:	5b                   	pop    %ebx
4000129f:	5e                   	pop    %esi
400012a0:	5f                   	pop    %edi
400012a1:	5d                   	pop    %ebp
400012a2:	c3                   	ret
400012a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
400012a8:	89 da                	mov    %ebx,%edx
400012aa:	29 fe                	sub    %edi,%esi
400012ac:	19 c2                	sbb    %eax,%edx
400012ae:	89 75 e0             	mov    %esi,-0x20(%ebp)
400012b1:	e9 25 ff ff ff       	jmp    400011db <__umoddi3+0x6b>
