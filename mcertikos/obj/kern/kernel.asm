
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <pmmap_init.cold>:
  100000:	80 7c 24 2f 00       	cmpb   $0x0,0x2f(%esp)
  100005:	8b 7c 24 20          	mov    0x20(%esp),%edi
  100009:	74 06                	je     100011 <pmmap_init.cold+0x11>
  10000b:	89 bd 84 56 04 00    	mov    %edi,0x45684(%ebp)
    int sublist_nr;

    /*
     * Step 1: Merge overlapped entries in pmmap_list.
     */
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100011:	80 7c 24 14 00       	cmpb   $0x0,0x14(%esp)
  100016:	74 0a                	je     100022 <pmmap_init.cold+0x22>
  100018:	c7 85 88 56 04 00 80 	movl   $0x80,0x45688(%ebp)
  10001f:	00 00 00 
        KERN_PANIC("More than 128 E820 entries.\n");
  100022:	50                   	push   %eax
  100023:	8d 85 31 71 ff ff    	lea    -0x8ecf(%ebp),%eax
  100029:	89 eb                	mov    %ebp,%ebx
  10002b:	50                   	push   %eax
  10002c:	8d 85 4e 71 ff ff    	lea    -0x8eb2(%ebp),%eax
  100032:	6a 3c                	push   $0x3c
  100034:	50                   	push   %eax
  100035:	e8 a6 47 00 00       	call   1047e0 <debug_panic>
    free_slot->start = start;
  10003a:	31 d2                	xor    %edx,%edx
  10003c:	89 15 00 00 00 00    	mov    %edx,0x0
  100042:	0f 0b                	ud2
  100044:	66 90                	xchg   %ax,%ax
  100046:	66 90                	xchg   %ax,%ax
  100048:	66 90                	xchg   %ax,%ax
  10004a:	66 90                	xchg   %ax,%ax
  10004c:	66 90                	xchg   %ax,%ax
  10004e:	66 90                	xchg   %ax,%ax

00100050 <video_init>:
    unsigned pos;

    /* Get a pointer to the memory-mapped text display buffer. */
    cp = (uint16_t *) CGA_BUF;
    was = *cp;
    *cp = (uint16_t) 0xA55A;
  100050:	b9 5a a5 ff ff       	mov    $0xffffa55a,%ecx
{
  100055:	57                   	push   %edi
  100056:	56                   	push   %esi
  100057:	53                   	push   %ebx
    was = *cp;
  100058:	0f b7 15 00 80 0b 00 	movzwl 0xb8000,%edx
    *cp = (uint16_t) 0xA55A;
  10005f:	e8 3e 03 00 00       	call   1003a2 <__x86.get_pc_thunk.bx>
  100064:	81 c3 90 3f 01 00    	add    $0x13f90,%ebx
  10006a:	66 89 0d 00 80 0b 00 	mov    %cx,0xb8000
    if (*cp != 0xA55A) {
  100071:	0f b7 05 00 80 0b 00 	movzwl 0xb8000,%eax
  100078:	66 3d 5a a5          	cmp    $0xa55a,%ax
  10007c:	0f 84 96 00 00 00    	je     100118 <video_init+0xc8>
        cp = (uint16_t *) MONO_BUF;
        addr_6845 = MONO_BASE;
        dprintf("addr_6845:%x\n", addr_6845);
  100082:	83 ec 08             	sub    $0x8,%esp
  100085:	8d 83 0c 70 ff ff    	lea    -0x8ff4(%ebx),%eax
        cp = (uint16_t *) MONO_BUF;
  10008b:	bf 00 00 0b 00       	mov    $0xb0000,%edi
        addr_6845 = MONO_BASE;
  100090:	c7 83 18 50 04 00 b4 	movl   $0x3b4,0x45018(%ebx)
  100097:	03 00 00 
        dprintf("addr_6845:%x\n", addr_6845);
  10009a:	68 b4 03 00 00       	push   $0x3b4
  10009f:	50                   	push   %eax
  1000a0:	e8 ab 49 00 00       	call   104a50 <dprintf>
  1000a5:	83 c4 10             	add    $0x10,%esp
        addr_6845 = CGA_BASE;
        dprintf("addr_6845:%x\n", addr_6845);
    }

    /* Extract cursor location */
    outb(addr_6845, 14);
  1000a8:	83 ec 08             	sub    $0x8,%esp
  1000ab:	6a 0e                	push   $0xe
  1000ad:	ff b3 18 50 04 00    	push   0x45018(%ebx)
  1000b3:	e8 68 55 00 00       	call   105620 <outb>
    pos = inb(addr_6845 + 1) << 8;
  1000b8:	8b 83 18 50 04 00    	mov    0x45018(%ebx),%eax
  1000be:	83 c0 01             	add    $0x1,%eax
  1000c1:	89 04 24             	mov    %eax,(%esp)
  1000c4:	e8 27 55 00 00       	call   1055f0 <inb>
  1000c9:	0f b6 f0             	movzbl %al,%esi
    outb(addr_6845, 15);
  1000cc:	58                   	pop    %eax
  1000cd:	5a                   	pop    %edx
  1000ce:	6a 0f                	push   $0xf
  1000d0:	ff b3 18 50 04 00    	push   0x45018(%ebx)
    pos = inb(addr_6845 + 1) << 8;
  1000d6:	c1 e6 08             	shl    $0x8,%esi
    outb(addr_6845, 15);
  1000d9:	e8 42 55 00 00       	call   105620 <outb>
    pos |= inb(addr_6845 + 1);
  1000de:	8b 83 18 50 04 00    	mov    0x45018(%ebx),%eax
  1000e4:	83 c0 01             	add    $0x1,%eax
  1000e7:	89 04 24             	mov    %eax,(%esp)
  1000ea:	e8 01 55 00 00       	call   1055f0 <inb>

    terminal.crt_buf = (uint16_t *) cp;
    terminal.crt_pos = pos;
    terminal.active_console = 0;
}
  1000ef:	83 c4 10             	add    $0x10,%esp
    terminal.crt_buf = (uint16_t *) cp;
  1000f2:	89 bb 0c 50 04 00    	mov    %edi,0x4500c(%ebx)
    terminal.active_console = 0;
  1000f8:	c7 83 14 50 04 00 00 	movl   $0x0,0x45014(%ebx)
  1000ff:	00 00 00 
    pos |= inb(addr_6845 + 1);
  100102:	0f b6 c0             	movzbl %al,%eax
  100105:	09 f0                	or     %esi,%eax
    terminal.crt_pos = pos;
  100107:	66 89 83 10 50 04 00 	mov    %ax,0x45010(%ebx)
}
  10010e:	5b                   	pop    %ebx
  10010f:	5e                   	pop    %esi
  100110:	5f                   	pop    %edi
  100111:	c3                   	ret
  100112:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        dprintf("addr_6845:%x\n", addr_6845);
  100118:	83 ec 08             	sub    $0x8,%esp
  10011b:	8d 83 0c 70 ff ff    	lea    -0x8ff4(%ebx),%eax
    cp = (uint16_t *) CGA_BUF;
  100121:	bf 00 80 0b 00       	mov    $0xb8000,%edi
        *cp = was;
  100126:	66 89 15 00 80 0b 00 	mov    %dx,0xb8000
        dprintf("addr_6845:%x\n", addr_6845);
  10012d:	68 d4 03 00 00       	push   $0x3d4
  100132:	50                   	push   %eax
        addr_6845 = CGA_BASE;
  100133:	c7 83 18 50 04 00 d4 	movl   $0x3d4,0x45018(%ebx)
  10013a:	03 00 00 
        dprintf("addr_6845:%x\n", addr_6845);
  10013d:	e8 0e 49 00 00       	call   104a50 <dprintf>
  100142:	83 c4 10             	add    $0x10,%esp
  100145:	e9 5e ff ff ff       	jmp    1000a8 <video_init+0x58>
  10014a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100150 <video_putc>:

void video_putc(int c)
{
  100150:	56                   	push   %esi
  100151:	53                   	push   %ebx
  100152:	e8 4b 02 00 00       	call   1003a2 <__x86.get_pc_thunk.bx>
  100157:	81 c3 9d 3e 01 00    	add    $0x13e9d,%ebx
  10015d:	83 ec 04             	sub    $0x4,%esp
  100160:	8b 54 24 10          	mov    0x10(%esp),%edx
    // if no attribute given, then use black on white
    if (!(c & ~0xFF))
        c |= 0x0700;
  100164:	89 d0                	mov    %edx,%eax
  100166:	80 cc 07             	or     $0x7,%ah
  100169:	81 fa 00 01 00 00    	cmp    $0x100,%edx
  10016f:	0f 42 d0             	cmovb  %eax,%edx

    switch (c & 0xff) {
  100172:	0f b6 c2             	movzbl %dl,%eax
  100175:	83 f8 0a             	cmp    $0xa,%eax
  100178:	0f 84 9c 01 00 00    	je     10031a <video_putc+0x1ca>
  10017e:	0f 8f 4c 01 00 00    	jg     1002d0 <video_putc+0x180>
  100184:	83 f8 08             	cmp    $0x8,%eax
  100187:	0f 84 ae 00 00 00    	je     10023b <video_putc+0xeb>
  10018d:	83 f8 09             	cmp    $0x9,%eax
  100190:	0f 85 64 01 00 00    	jne    1002fa <video_putc+0x1aa>
        /* fallthru */
    case '\r':
        terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
        break;
    case '\t':
        video_putc(' ');
  100196:	83 ec 0c             	sub    $0xc,%esp
  100199:	6a 20                	push   $0x20
  10019b:	e8 b0 ff ff ff       	call   100150 <video_putc>
        video_putc(' ');
  1001a0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1001a7:	e8 a4 ff ff ff       	call   100150 <video_putc>
        video_putc(' ');
  1001ac:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1001b3:	e8 98 ff ff ff       	call   100150 <video_putc>
        video_putc(' ');
  1001b8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1001bf:	e8 8c ff ff ff       	call   100150 <video_putc>
        video_putc(' ');
  1001c4:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1001cb:	e8 80 ff ff ff       	call   100150 <video_putc>
    default:
        terminal.crt_buf[terminal.crt_pos++] = c;  /* write the character */
        break;
    }

    if (terminal.crt_pos >= CRT_SIZE) {
  1001d0:	0f b7 83 10 50 04 00 	movzwl 0x45010(%ebx),%eax
        break;
  1001d7:	83 c4 10             	add    $0x10,%esp
    if (terminal.crt_pos >= CRT_SIZE) {
  1001da:	66 3d cf 07          	cmp    $0x7cf,%ax
  1001de:	0f 87 8c 00 00 00    	ja     100270 <video_putc+0x120>
            terminal.crt_buf[i] = 0x0700 | ' ';
        terminal.crt_pos -= CRT_COLS;
    }

    /* move that little blinky thing */
    outb(addr_6845, 14);
  1001e4:	83 ec 08             	sub    $0x8,%esp
  1001e7:	6a 0e                	push   $0xe
  1001e9:	ff b3 18 50 04 00    	push   0x45018(%ebx)
  1001ef:	e8 2c 54 00 00       	call   105620 <outb>
    outb(addr_6845 + 1, terminal.crt_pos >> 8);
  1001f4:	58                   	pop    %eax
  1001f5:	0f b6 83 11 50 04 00 	movzbl 0x45011(%ebx),%eax
  1001fc:	5a                   	pop    %edx
  1001fd:	50                   	push   %eax
  1001fe:	8b 83 18 50 04 00    	mov    0x45018(%ebx),%eax
  100204:	83 c0 01             	add    $0x1,%eax
  100207:	50                   	push   %eax
  100208:	e8 13 54 00 00       	call   105620 <outb>
    outb(addr_6845, 15);
  10020d:	59                   	pop    %ecx
  10020e:	5e                   	pop    %esi
  10020f:	6a 0f                	push   $0xf
  100211:	ff b3 18 50 04 00    	push   0x45018(%ebx)
  100217:	e8 04 54 00 00       	call   105620 <outb>
    outb(addr_6845 + 1, terminal.crt_pos);
  10021c:	58                   	pop    %eax
  10021d:	0f b6 83 10 50 04 00 	movzbl 0x45010(%ebx),%eax
  100224:	5a                   	pop    %edx
  100225:	50                   	push   %eax
  100226:	8b 83 18 50 04 00    	mov    0x45018(%ebx),%eax
  10022c:	83 c0 01             	add    $0x1,%eax
  10022f:	50                   	push   %eax
  100230:	e8 eb 53 00 00       	call   105620 <outb>
}
  100235:	83 c4 14             	add    $0x14,%esp
  100238:	5b                   	pop    %ebx
  100239:	5e                   	pop    %esi
  10023a:	c3                   	ret
        if (terminal.crt_pos > 0) {
  10023b:	0f b7 83 10 50 04 00 	movzwl 0x45010(%ebx),%eax
  100242:	66 85 c0             	test   %ax,%ax
  100245:	74 9d                	je     1001e4 <video_putc+0x94>
            terminal.crt_pos--;
  100247:	83 e8 01             	sub    $0x1,%eax
            terminal.crt_buf[terminal.crt_pos] = (c & ~0xff) | ' ';
  10024a:	8b 8b 0c 50 04 00    	mov    0x4500c(%ebx),%ecx
  100250:	30 d2                	xor    %dl,%dl
  100252:	0f b7 f0             	movzwl %ax,%esi
  100255:	83 ca 20             	or     $0x20,%edx
            terminal.crt_pos--;
  100258:	66 89 83 10 50 04 00 	mov    %ax,0x45010(%ebx)
            terminal.crt_buf[terminal.crt_pos] = (c & ~0xff) | ' ';
  10025f:	66 89 14 71          	mov    %dx,(%ecx,%esi,2)
    if (terminal.crt_pos >= CRT_SIZE) {
  100263:	66 3d cf 07          	cmp    $0x7cf,%ax
  100267:	0f 86 77 ff ff ff    	jbe    1001e4 <video_putc+0x94>
  10026d:	8d 76 00             	lea    0x0(%esi),%esi
        memmove(terminal.crt_buf, terminal.crt_buf + CRT_COLS,
  100270:	8b 83 0c 50 04 00    	mov    0x4500c(%ebx),%eax
  100276:	83 ec 04             	sub    $0x4,%esp
  100279:	68 00 0f 00 00       	push   $0xf00
  10027e:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100284:	52                   	push   %edx
  100285:	50                   	push   %eax
  100286:	e8 d5 41 00 00       	call   104460 <memmove>
            terminal.crt_buf[i] = 0x0700 | ' ';
  10028b:	8b 93 0c 50 04 00    	mov    0x4500c(%ebx),%edx
  100291:	83 c4 10             	add    $0x10,%esp
  100294:	8d 82 00 0f 00 00    	lea    0xf00(%edx),%eax
  10029a:	81 c2 a0 0f 00 00    	add    $0xfa0,%edx
  1002a0:	b9 20 07 00 00       	mov    $0x720,%ecx
  1002a5:	be 20 07 00 00       	mov    $0x720,%esi
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  1002aa:	83 c0 04             	add    $0x4,%eax
            terminal.crt_buf[i] = 0x0700 | ' ';
  1002ad:	66 89 48 fc          	mov    %cx,-0x4(%eax)
  1002b1:	66 89 70 fe          	mov    %si,-0x2(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  1002b5:	39 c2                	cmp    %eax,%edx
  1002b7:	75 e7                	jne    1002a0 <video_putc+0x150>
        terminal.crt_pos -= CRT_COLS;
  1002b9:	66 83 ab 10 50 04 00 	subw   $0x50,0x45010(%ebx)
  1002c0:	50 
  1002c1:	e9 1e ff ff ff       	jmp    1001e4 <video_putc+0x94>
  1002c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1002cd:	00 
  1002ce:	66 90                	xchg   %ax,%ax
    switch (c & 0xff) {
  1002d0:	83 f8 0d             	cmp    $0xd,%eax
  1002d3:	75 25                	jne    1002fa <video_putc+0x1aa>
        if (terminal.crt_pos > 0) {
  1002d5:	0f b7 83 10 50 04 00 	movzwl 0x45010(%ebx),%eax
        terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
  1002dc:	0f b7 c0             	movzwl %ax,%eax
  1002df:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  1002e5:	c1 e8 16             	shr    $0x16,%eax
  1002e8:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1002eb:	c1 e0 04             	shl    $0x4,%eax
  1002ee:	66 89 83 10 50 04 00 	mov    %ax,0x45010(%ebx)
        break;
  1002f5:	e9 e0 fe ff ff       	jmp    1001da <video_putc+0x8a>
        terminal.crt_buf[terminal.crt_pos++] = c;  /* write the character */
  1002fa:	0f b7 8b 10 50 04 00 	movzwl 0x45010(%ebx),%ecx
  100301:	8b b3 0c 50 04 00    	mov    0x4500c(%ebx),%esi
  100307:	8d 41 01             	lea    0x1(%ecx),%eax
  10030a:	66 89 14 4e          	mov    %dx,(%esi,%ecx,2)
  10030e:	66 89 83 10 50 04 00 	mov    %ax,0x45010(%ebx)
        break;
  100315:	e9 c0 fe ff ff       	jmp    1001da <video_putc+0x8a>
        terminal.crt_pos += CRT_COLS;
  10031a:	0f b7 83 10 50 04 00 	movzwl 0x45010(%ebx),%eax
  100321:	83 c0 50             	add    $0x50,%eax
  100324:	eb b6                	jmp    1002dc <video_putc+0x18c>
  100326:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10032d:	00 
  10032e:	66 90                	xchg   %ax,%ax

00100330 <video_set_cursor>:

void video_set_cursor(int x, int y)
{
    terminal.crt_pos = x * CRT_COLS + y;
  100330:	e8 69 00 00 00       	call   10039e <__x86.get_pc_thunk.dx>
  100335:	81 c2 bf 3c 01 00    	add    $0x13cbf,%edx
{
  10033b:	8b 44 24 04          	mov    0x4(%esp),%eax
    terminal.crt_pos = x * CRT_COLS + y;
  10033f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100342:	c1 e0 04             	shl    $0x4,%eax
  100345:	66 03 44 24 08       	add    0x8(%esp),%ax
  10034a:	66 89 82 10 50 04 00 	mov    %ax,0x45010(%edx)
}
  100351:	c3                   	ret
  100352:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100359:	00 
  10035a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100360 <video_clear_screen>:

void video_clear_screen()
{
    int i;
    for (i = 0; i < CRT_SIZE; i++) {
  100360:	e8 35 00 00 00       	call   10039a <__x86.get_pc_thunk.ax>
  100365:	05 8f 3c 01 00       	add    $0x13c8f,%eax
  10036a:	8b 80 0c 50 04 00    	mov    0x4500c(%eax),%eax
  100370:	8d 90 a0 0f 00 00    	lea    0xfa0(%eax),%edx
  100376:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10037d:	00 
  10037e:	66 90                	xchg   %ax,%ax
        terminal.crt_buf[i] = ' ';
  100380:	b9 20 00 00 00       	mov    $0x20,%ecx
    for (i = 0; i < CRT_SIZE; i++) {
  100385:	83 c0 04             	add    $0x4,%eax
        terminal.crt_buf[i] = ' ';
  100388:	66 89 48 fc          	mov    %cx,-0x4(%eax)
  10038c:	b9 20 00 00 00       	mov    $0x20,%ecx
  100391:	66 89 48 fe          	mov    %cx,-0x2(%eax)
    for (i = 0; i < CRT_SIZE; i++) {
  100395:	39 d0                	cmp    %edx,%eax
  100397:	75 e7                	jne    100380 <video_clear_screen+0x20>
    }
}
  100399:	c3                   	ret

0010039a <__x86.get_pc_thunk.ax>:
  10039a:	8b 04 24             	mov    (%esp),%eax
  10039d:	c3                   	ret

0010039e <__x86.get_pc_thunk.dx>:
  10039e:	8b 14 24             	mov    (%esp),%edx
  1003a1:	c3                   	ret

001003a2 <__x86.get_pc_thunk.bx>:
  1003a2:	8b 1c 24             	mov    (%esp),%ebx
  1003a5:	c3                   	ret
  1003a6:	66 90                	xchg   %ax,%ax
  1003a8:	66 90                	xchg   %ax,%ax
  1003aa:	66 90                	xchg   %ax,%ax
  1003ac:	66 90                	xchg   %ax,%ax
  1003ae:	66 90                	xchg   %ax,%ax

001003b0 <cons_init>:
    char buf[CONSOLE_BUFFER_SIZE];
    uint32_t rpos, wpos;
} cons;

void cons_init()
{
  1003b0:	53                   	push   %ebx
  1003b1:	e8 ec ff ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1003b6:	81 c3 3e 3c 01 00    	add    $0x13c3e,%ebx
  1003bc:	83 ec 0c             	sub    $0xc,%esp
    memset(&cons, 0x0, sizeof(cons));
  1003bf:	68 08 02 00 00       	push   $0x208
  1003c4:	6a 00                	push   $0x0
  1003c6:	8d 83 2c 50 04 00    	lea    0x4502c(%ebx),%eax
  1003cc:	50                   	push   %eax
  1003cd:	e8 4e 40 00 00       	call   104420 <memset>
    serial_init();
  1003d2:	e8 19 04 00 00       	call   1007f0 <serial_init>
    video_init();
  1003d7:	e8 74 fc ff ff       	call   100050 <video_init>
    spinlock_init(&cons_lk);
  1003dc:	8d 83 34 52 04 00    	lea    0x45234(%ebx),%eax
  1003e2:	89 04 24             	mov    %eax,(%esp)
  1003e5:	e8 b6 5b 00 00       	call   105fa0 <spinlock_init>
}
  1003ea:	83 c4 18             	add    $0x18,%esp
  1003ed:	5b                   	pop    %ebx
  1003ee:	c3                   	ret
  1003ef:	90                   	nop

001003f0 <cons_intr>:

void cons_intr(int (*proc)(void))
{
  1003f0:	55                   	push   %ebp
  1003f1:	57                   	push   %edi
  1003f2:	56                   	push   %esi

    spinlock_acquire(&cons_lk);
    while ((c = (*proc)()) != -1) {
        if (c == 0)
            continue;
        cons.buf[cons.wpos++] = c;
  1003f3:	8d 35 2c 50 04 00    	lea    0x4502c,%esi
{
  1003f9:	53                   	push   %ebx
  1003fa:	e8 a3 ff ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1003ff:	81 c3 f5 3b 01 00    	add    $0x13bf5,%ebx
  100405:	83 ec 28             	sub    $0x28,%esp
  100408:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    spinlock_acquire(&cons_lk);
  10040c:	8d 83 34 52 04 00    	lea    0x45234(%ebx),%eax
        cons.buf[cons.wpos++] = c;
  100412:	8d 2c 33             	lea    (%ebx,%esi,1),%ebp
    spinlock_acquire(&cons_lk);
  100415:	89 44 24 18          	mov    %eax,0x18(%esp)
  100419:	50                   	push   %eax
  10041a:	e8 11 5c 00 00       	call   106030 <spinlock_acquire>
    while ((c = (*proc)()) != -1) {
  10041f:	83 c4 10             	add    $0x10,%esp
  100422:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100428:	ff d7                	call   *%edi
  10042a:	83 f8 ff             	cmp    $0xffffffff,%eax
  10042d:	74 33                	je     100462 <cons_intr+0x72>
        if (c == 0)
  10042f:	85 c0                	test   %eax,%eax
  100431:	74 f5                	je     100428 <cons_intr+0x38>
        cons.buf[cons.wpos++] = c;
  100433:	8b 8c 33 04 02 00 00 	mov    0x204(%ebx,%esi,1),%ecx
  10043a:	8d 51 01             	lea    0x1(%ecx),%edx
  10043d:	88 44 0d 00          	mov    %al,0x0(%ebp,%ecx,1)
  100441:	89 94 33 04 02 00 00 	mov    %edx,0x204(%ebx,%esi,1)
        if (cons.wpos == CONSOLE_BUFFER_SIZE)
  100448:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  10044e:	75 d8                	jne    100428 <cons_intr+0x38>
            cons.wpos = 0;
  100450:	c7 84 1e 04 02 00 00 	movl   $0x0,0x204(%esi,%ebx,1)
  100457:	00 00 00 00 
    while ((c = (*proc)()) != -1) {
  10045b:	ff d7                	call   *%edi
  10045d:	83 f8 ff             	cmp    $0xffffffff,%eax
  100460:	75 cd                	jne    10042f <cons_intr+0x3f>
    }
    spinlock_release(&cons_lk);
  100462:	83 ec 0c             	sub    $0xc,%esp
  100465:	ff 74 24 18          	push   0x18(%esp)
  100469:	e8 42 5c 00 00       	call   1060b0 <spinlock_release>
}
  10046e:	83 c4 2c             	add    $0x2c,%esp
  100471:	5b                   	pop    %ebx
  100472:	5e                   	pop    %esi
  100473:	5f                   	pop    %edi
  100474:	5d                   	pop    %ebp
  100475:	c3                   	ret
  100476:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10047d:	00 
  10047e:	66 90                	xchg   %ax,%ax

00100480 <cons_getc>:

char cons_getc(void)
{
  100480:	57                   	push   %edi
  100481:	56                   	push   %esi
  100482:	53                   	push   %ebx
  100483:	e8 1a ff ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100488:	81 c3 6c 3b 01 00    	add    $0x13b6c,%ebx
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10048e:	e8 5d 02 00 00       	call   1006f0 <serial_intr>
    keyboard_intr();
    spinlock_acquire(&cons_lk);
  100493:	8d b3 34 52 04 00    	lea    0x45234(%ebx),%esi
    keyboard_intr();
  100499:	e8 c2 05 00 00       	call   100a60 <keyboard_intr>
    spinlock_acquire(&cons_lk);
  10049e:	83 ec 0c             	sub    $0xc,%esp
  1004a1:	56                   	push   %esi
  1004a2:	e8 89 5b 00 00       	call   106030 <spinlock_acquire>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1004a7:	8b 83 2c 52 04 00    	mov    0x4522c(%ebx),%eax
  1004ad:	83 c4 10             	add    $0x10,%esp
  1004b0:	3b 83 30 52 04 00    	cmp    0x45230(%ebx),%eax
  1004b6:	74 38                	je     1004f0 <cons_getc+0x70>
        c = cons.buf[cons.rpos++];
  1004b8:	0f b6 bc 03 2c 50 04 	movzbl 0x4502c(%ebx,%eax,1),%edi
  1004bf:	00 
        if (cons.rpos == CONSOLE_BUFFER_SIZE)
            cons.rpos = 0;
  1004c0:	3d ff 01 00 00       	cmp    $0x1ff,%eax
        c = cons.buf[cons.rpos++];
  1004c5:	8d 50 01             	lea    0x1(%eax),%edx
            cons.rpos = 0;
  1004c8:	b8 00 00 00 00       	mov    $0x0,%eax
  1004cd:	0f 44 d0             	cmove  %eax,%edx
        spinlock_release(&cons_lk);
  1004d0:	83 ec 0c             	sub    $0xc,%esp
  1004d3:	56                   	push   %esi
  1004d4:	89 93 2c 52 04 00    	mov    %edx,0x4522c(%ebx)
  1004da:	e8 d1 5b 00 00       	call   1060b0 <spinlock_release>
        return c;
  1004df:	83 c4 10             	add    $0x10,%esp
    }
    spinlock_release(&cons_lk);
    return 0;
}
  1004e2:	89 f8                	mov    %edi,%eax
  1004e4:	5b                   	pop    %ebx
  1004e5:	5e                   	pop    %esi
  1004e6:	5f                   	pop    %edi
  1004e7:	c3                   	ret
  1004e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1004ef:	00 
    spinlock_release(&cons_lk);
  1004f0:	83 ec 0c             	sub    $0xc,%esp
    return 0;
  1004f3:	31 ff                	xor    %edi,%edi
    spinlock_release(&cons_lk);
  1004f5:	56                   	push   %esi
  1004f6:	e8 b5 5b 00 00       	call   1060b0 <spinlock_release>
    return 0;
  1004fb:	83 c4 10             	add    $0x10,%esp
}
  1004fe:	89 f8                	mov    %edi,%eax
  100500:	5b                   	pop    %ebx
  100501:	5e                   	pop    %esi
  100502:	5f                   	pop    %edi
  100503:	c3                   	ret
  100504:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10050b:	00 
  10050c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100510 <cons_putc>:

void cons_putc(char c)
{
  100510:	56                   	push   %esi
  100511:	53                   	push   %ebx
  100512:	e8 8b fe ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100517:	81 c3 dd 3a 01 00    	add    $0x13add,%ebx
  10051d:	83 ec 10             	sub    $0x10,%esp
    serial_putc(c);
  100520:	0f be 74 24 1c       	movsbl 0x1c(%esp),%esi
  100525:	56                   	push   %esi
  100526:	e8 05 02 00 00       	call   100730 <serial_putc>
    video_putc(c);
  10052b:	89 34 24             	mov    %esi,(%esp)
  10052e:	e8 1d fc ff ff       	call   100150 <video_putc>
}
  100533:	83 c4 14             	add    $0x14,%esp
  100536:	5b                   	pop    %ebx
  100537:	5e                   	pop    %esi
  100538:	c3                   	ret
  100539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100540 <getchar>:

char getchar(void)
{
  100540:	83 ec 0c             	sub    $0xc,%esp
    char c;

    while ((c = cons_getc()) == 0)
  100543:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  100548:	e8 33 ff ff ff       	call   100480 <cons_getc>
  10054d:	84 c0                	test   %al,%al
  10054f:	74 f7                	je     100548 <getchar+0x8>
        /* do nothing */ ;
    return c;
}
  100551:	83 c4 0c             	add    $0xc,%esp
  100554:	c3                   	ret
  100555:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10055c:	00 
  10055d:	8d 76 00             	lea    0x0(%esi),%esi

00100560 <putchar>:

void putchar(char c)
  100560:	56                   	push   %esi
  100561:	53                   	push   %ebx
  100562:	e8 3b fe ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100567:	81 c3 8d 3a 01 00    	add    $0x13a8d,%ebx
  10056d:	83 ec 10             	sub    $0x10,%esp
  100570:	0f be 74 24 1c       	movsbl 0x1c(%esp),%esi
  100575:	56                   	push   %esi
  100576:	e8 b5 01 00 00       	call   100730 <serial_putc>
  10057b:	89 34 24             	mov    %esi,(%esp)
  10057e:	e8 cd fb ff ff       	call   100150 <video_putc>
  100583:	83 c4 14             	add    $0x14,%esp
  100586:	5b                   	pop    %ebx
  100587:	5e                   	pop    %esi
  100588:	c3                   	ret
  100589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100590 <readline>:
{
    cons_putc(c);
}

char *readline(const char *prompt)
{
  100590:	55                   	push   %ebp
  100591:	57                   	push   %edi
  100592:	56                   	push   %esi
  100593:	53                   	push   %ebx
  100594:	e8 09 fe ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100599:	81 c3 5b 3a 01 00    	add    $0x13a5b,%ebx
  10059f:	83 ec 1c             	sub    $0x1c,%esp
  1005a2:	8b 44 24 30          	mov    0x30(%esp),%eax
    int i;
    char c;

    if (prompt != NULL)
  1005a6:	85 c0                	test   %eax,%eax
  1005a8:	74 13                	je     1005bd <readline+0x2d>
        dprintf("%s", prompt);
  1005aa:	83 ec 08             	sub    $0x8,%esp
  1005ad:	50                   	push   %eax
  1005ae:	8d 83 1a 70 ff ff    	lea    -0x8fe6(%ebx),%eax
  1005b4:	50                   	push   %eax
  1005b5:	e8 96 44 00 00       	call   104a50 <dprintf>
  1005ba:	83 c4 10             	add    $0x10,%esp
        } else if ((c == '\b' || c == '\x7f') && i > 0) {
            putchar('\b');
            i--;
        } else if (c >= ' ' && i < BUFLEN - 1) {
            putchar(c);
            linebuf[i++] = c;
  1005bd:	31 f6                	xor    %esi,%esi
  1005bf:	8d bb 4c 52 04 00    	lea    0x4524c(%ebx),%edi
  1005c5:	8d 76 00             	lea    0x0(%esi),%esi
    while ((c = cons_getc()) == 0)
  1005c8:	e8 b3 fe ff ff       	call   100480 <cons_getc>
  1005cd:	84 c0                	test   %al,%al
  1005cf:	74 f7                	je     1005c8 <readline+0x38>
        if (c < 0) {
  1005d1:	0f 88 a2 00 00 00    	js     100679 <readline+0xe9>
        } else if ((c == '\b' || c == '\x7f') && i > 0) {
  1005d7:	3c 08                	cmp    $0x8,%al
  1005d9:	0f 94 c2             	sete   %dl
  1005dc:	3c 7f                	cmp    $0x7f,%al
  1005de:	0f 94 c1             	sete   %cl
  1005e1:	08 ca                	or     %cl,%dl
  1005e3:	74 04                	je     1005e9 <readline+0x59>
  1005e5:	85 f6                	test   %esi,%esi
  1005e7:	7f 6f                	jg     100658 <readline+0xc8>
        } else if (c >= ' ' && i < BUFLEN - 1) {
  1005e9:	3c 1f                	cmp    $0x1f,%al
  1005eb:	7e 33                	jle    100620 <readline+0x90>
  1005ed:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
  1005f3:	7f 2b                	jg     100620 <readline+0x90>
    serial_putc(c);
  1005f5:	88 44 24 0f          	mov    %al,0xf(%esp)
  1005f9:	0f be e8             	movsbl %al,%ebp
  1005fc:	83 ec 0c             	sub    $0xc,%esp
  1005ff:	55                   	push   %ebp
  100600:	e8 2b 01 00 00       	call   100730 <serial_putc>
    video_putc(c);
  100605:	89 2c 24             	mov    %ebp,(%esp)
  100608:	e8 43 fb ff ff       	call   100150 <video_putc>
            linebuf[i++] = c;
  10060d:	0f b6 44 24 1f       	movzbl 0x1f(%esp),%eax
  100612:	83 c4 10             	add    $0x10,%esp
  100615:	88 04 37             	mov    %al,(%edi,%esi,1)
  100618:	83 c6 01             	add    $0x1,%esi
  10061b:	eb ab                	jmp    1005c8 <readline+0x38>
  10061d:	8d 76 00             	lea    0x0(%esi),%esi
        } else if (c == '\n' || c == '\r') {
  100620:	3c 0a                	cmp    $0xa,%al
  100622:	74 04                	je     100628 <readline+0x98>
  100624:	3c 0d                	cmp    $0xd,%al
  100626:	75 a0                	jne    1005c8 <readline+0x38>
    serial_putc(c);
  100628:	83 ec 0c             	sub    $0xc,%esp
  10062b:	6a 0a                	push   $0xa
  10062d:	e8 fe 00 00 00       	call   100730 <serial_putc>
    video_putc(c);
  100632:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100639:	e8 12 fb ff ff       	call   100150 <video_putc>
            putchar('\n');
            linebuf[i] = 0;
  10063e:	8d 83 4c 52 04 00    	lea    0x4524c(%ebx),%eax
            return linebuf;
  100644:	83 c4 10             	add    $0x10,%esp
            linebuf[i] = 0;
  100647:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
        }
    }
}
  10064b:	83 c4 1c             	add    $0x1c,%esp
  10064e:	5b                   	pop    %ebx
  10064f:	5e                   	pop    %esi
  100650:	5f                   	pop    %edi
  100651:	5d                   	pop    %ebp
  100652:	c3                   	ret
  100653:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    serial_putc(c);
  100658:	83 ec 0c             	sub    $0xc,%esp
            i--;
  10065b:	83 ee 01             	sub    $0x1,%esi
    serial_putc(c);
  10065e:	6a 08                	push   $0x8
  100660:	e8 cb 00 00 00       	call   100730 <serial_putc>
    video_putc(c);
  100665:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10066c:	e8 df fa ff ff       	call   100150 <video_putc>
            i--;
  100671:	83 c4 10             	add    $0x10,%esp
  100674:	e9 4f ff ff ff       	jmp    1005c8 <readline+0x38>
            dprintf("read error: %e\n", c);
  100679:	83 ec 08             	sub    $0x8,%esp
  10067c:	0f be c0             	movsbl %al,%eax
  10067f:	50                   	push   %eax
  100680:	8d 83 1d 70 ff ff    	lea    -0x8fe3(%ebx),%eax
  100686:	50                   	push   %eax
  100687:	e8 c4 43 00 00       	call   104a50 <dprintf>
            return NULL;
  10068c:	83 c4 10             	add    $0x10,%esp
  10068f:	31 c0                	xor    %eax,%eax
}
  100691:	83 c4 1c             	add    $0x1c,%esp
  100694:	5b                   	pop    %ebx
  100695:	5e                   	pop    %esi
  100696:	5f                   	pop    %edi
  100697:	5d                   	pop    %ebp
  100698:	c3                   	ret
  100699:	66 90                	xchg   %ax,%ax
  10069b:	66 90                	xchg   %ax,%ax
  10069d:	66 90                	xchg   %ax,%ax
  10069f:	90                   	nop

001006a0 <serial_proc_data>:
    inb(0x84);
    inb(0x84);
}

static int serial_proc_data(void)
{
  1006a0:	53                   	push   %ebx
  1006a1:	e8 fc fc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1006a6:	81 c3 4e 39 01 00    	add    $0x1394e,%ebx
  1006ac:	83 ec 14             	sub    $0x14,%esp
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA))
  1006af:	68 fd 03 00 00       	push   $0x3fd
  1006b4:	e8 37 4f 00 00       	call   1055f0 <inb>
  1006b9:	83 c4 10             	add    $0x10,%esp
  1006bc:	a8 01                	test   $0x1,%al
  1006be:	74 20                	je     1006e0 <serial_proc_data+0x40>
        return -1;
    return inb(COM1 + COM_RX);
  1006c0:	83 ec 0c             	sub    $0xc,%esp
  1006c3:	68 f8 03 00 00       	push   $0x3f8
  1006c8:	e8 23 4f 00 00       	call   1055f0 <inb>
  1006cd:	83 c4 10             	add    $0x10,%esp
  1006d0:	0f b6 c0             	movzbl %al,%eax
}
  1006d3:	83 c4 08             	add    $0x8,%esp
  1006d6:	5b                   	pop    %ebx
  1006d7:	c3                   	ret
  1006d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1006df:	00 
        return -1;
  1006e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e5:	eb ec                	jmp    1006d3 <serial_proc_data+0x33>
  1006e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1006ee:	00 
  1006ef:	90                   	nop

001006f0 <serial_intr>:

void serial_intr(void)
{
  1006f0:	53                   	push   %ebx
  1006f1:	e8 ac fc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1006f6:	81 c3 fe 38 01 00    	add    $0x138fe,%ebx
  1006fc:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists)
  1006ff:	80 bb 4c 56 04 00 00 	cmpb   $0x0,0x4564c(%ebx)
  100706:	75 08                	jne    100710 <serial_intr+0x20>
        cons_intr(serial_proc_data);
}
  100708:	83 c4 08             	add    $0x8,%esp
  10070b:	5b                   	pop    %ebx
  10070c:	c3                   	ret
  10070d:	8d 76 00             	lea    0x0(%esi),%esi
        cons_intr(serial_proc_data);
  100710:	83 ec 0c             	sub    $0xc,%esp
  100713:	8d 83 ac c6 fe ff    	lea    -0x13954(%ebx),%eax
  100719:	50                   	push   %eax
  10071a:	e8 d1 fc ff ff       	call   1003f0 <cons_intr>
}
  10071f:	83 c4 10             	add    $0x10,%esp
  100722:	83 c4 08             	add    $0x8,%esp
  100725:	5b                   	pop    %ebx
  100726:	c3                   	ret
  100727:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10072e:	00 
  10072f:	90                   	nop

00100730 <serial_putc>:
    } else
        return 0;
}

void serial_putc(char c)
{
  100730:	57                   	push   %edi
  100731:	56                   	push   %esi
    if (!serial_exists)
        return;

    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i++)
  100732:	31 f6                	xor    %esi,%esi
{
  100734:	53                   	push   %ebx
  100735:	8b 7c 24 10          	mov    0x10(%esp),%edi
  100739:	e8 64 fc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10073e:	81 c3 b6 38 01 00    	add    $0x138b6,%ebx
    if (!serial_exists)
  100744:	80 bb 4c 56 04 00 00 	cmpb   $0x0,0x4564c(%ebx)
  10074b:	75 42                	jne    10078f <serial_putc+0x5f>
  10074d:	eb 6e                	jmp    1007bd <serial_putc+0x8d>
  10074f:	90                   	nop
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i++)
  100750:	81 fe 00 32 00 00    	cmp    $0x3200,%esi
  100756:	74 4b                	je     1007a3 <serial_putc+0x73>
    inb(0x84);
  100758:	83 ec 0c             	sub    $0xc,%esp
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i++)
  10075b:	83 c6 01             	add    $0x1,%esi
    inb(0x84);
  10075e:	68 84 00 00 00       	push   $0x84
  100763:	e8 88 4e 00 00       	call   1055f0 <inb>
    inb(0x84);
  100768:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  10076f:	e8 7c 4e 00 00       	call   1055f0 <inb>
    inb(0x84);
  100774:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  10077b:	e8 70 4e 00 00       	call   1055f0 <inb>
    inb(0x84);
  100780:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  100787:	e8 64 4e 00 00       	call   1055f0 <inb>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i++)
  10078c:	83 c4 10             	add    $0x10,%esp
  10078f:	83 ec 0c             	sub    $0xc,%esp
  100792:	68 fd 03 00 00       	push   $0x3fd
  100797:	e8 54 4e 00 00       	call   1055f0 <inb>
  10079c:	83 c4 10             	add    $0x10,%esp
  10079f:	a8 20                	test   $0x20,%al
  1007a1:	74 ad                	je     100750 <serial_putc+0x20>
    if (c == nl) {
  1007a3:	89 f8                	mov    %edi,%eax
  1007a5:	3c 0a                	cmp    $0xa,%al
  1007a7:	74 1f                	je     1007c8 <serial_putc+0x98>
        delay();

    if (!serial_reformatnewline(c, COM1 + COM_TX))
        outb(COM1 + COM_TX, c);
  1007a9:	83 ec 08             	sub    $0x8,%esp
  1007ac:	0f b6 f8             	movzbl %al,%edi
  1007af:	57                   	push   %edi
  1007b0:	68 f8 03 00 00       	push   $0x3f8
  1007b5:	e8 66 4e 00 00       	call   105620 <outb>
  1007ba:	83 c4 10             	add    $0x10,%esp
}
  1007bd:	5b                   	pop    %ebx
  1007be:	5e                   	pop    %esi
  1007bf:	5f                   	pop    %edi
  1007c0:	c3                   	ret
  1007c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        outb(p, cr);
  1007c8:	83 ec 08             	sub    $0x8,%esp
  1007cb:	6a 0d                	push   $0xd
  1007cd:	68 f8 03 00 00       	push   $0x3f8
  1007d2:	e8 49 4e 00 00       	call   105620 <outb>
        outb(p, nl);
  1007d7:	58                   	pop    %eax
  1007d8:	5a                   	pop    %edx
  1007d9:	6a 0a                	push   $0xa
  1007db:	68 f8 03 00 00       	push   $0x3f8
  1007e0:	e8 3b 4e 00 00       	call   105620 <outb>
  1007e5:	83 c4 10             	add    $0x10,%esp
}
  1007e8:	5b                   	pop    %ebx
  1007e9:	5e                   	pop    %esi
  1007ea:	5f                   	pop    %edi
  1007eb:	c3                   	ret
  1007ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001007f0 <serial_init>:

void serial_init(void)
{
  1007f0:	53                   	push   %ebx
  1007f1:	e8 ac fb ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1007f6:	81 c3 fe 37 01 00    	add    $0x137fe,%ebx
  1007fc:	83 ec 10             	sub    $0x10,%esp
    /* turn off interrupt */
    outb(COM1 + COM_IER, 0);
  1007ff:	6a 00                	push   $0x0
  100801:	68 f9 03 00 00       	push   $0x3f9
  100806:	e8 15 4e 00 00       	call   105620 <outb>

    /* set DLAB */
    outb(COM1 + COM_LCR, COM_LCR_DLAB);
  10080b:	58                   	pop    %eax
  10080c:	5a                   	pop    %edx
  10080d:	68 80 00 00 00       	push   $0x80
  100812:	68 fb 03 00 00       	push   $0x3fb
  100817:	e8 04 4e 00 00       	call   105620 <outb>

    /* set baud rate */
    outb(COM1 + COM_DLL, 0x0001 & 0xff);
  10081c:	59                   	pop    %ecx
  10081d:	58                   	pop    %eax
  10081e:	6a 01                	push   $0x1
  100820:	68 f8 03 00 00       	push   $0x3f8
  100825:	e8 f6 4d 00 00       	call   105620 <outb>
    outb(COM1 + COM_DLM, 0x0001 >> 8);
  10082a:	58                   	pop    %eax
  10082b:	5a                   	pop    %edx
  10082c:	6a 00                	push   $0x0
  10082e:	68 f9 03 00 00       	push   $0x3f9
  100833:	e8 e8 4d 00 00       	call   105620 <outb>

    /* Set the line status. */
    outb(COM1 + COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
  100838:	59                   	pop    %ecx
  100839:	58                   	pop    %eax
  10083a:	6a 03                	push   $0x3
  10083c:	68 fb 03 00 00       	push   $0x3fb
  100841:	e8 da 4d 00 00       	call   105620 <outb>

    /* Enable the FIFO. */
    outb(COM1 + COM_FCR, 0xc7);
  100846:	58                   	pop    %eax
  100847:	5a                   	pop    %edx
  100848:	68 c7 00 00 00       	push   $0xc7
  10084d:	68 fa 03 00 00       	push   $0x3fa
  100852:	e8 c9 4d 00 00       	call   105620 <outb>

    /* Turn on DTR, RTS, and OUT2. */
    outb(COM1 + COM_MCR, 0x0b);
  100857:	59                   	pop    %ecx
  100858:	58                   	pop    %eax
  100859:	6a 0b                	push   $0xb
  10085b:	68 fc 03 00 00       	push   $0x3fc
  100860:	e8 bb 4d 00 00       	call   105620 <outb>

    // Clear any preexisting overrun indications and interrupts
    // Serial COM1 doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100865:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
  10086c:	e8 7f 4d 00 00       	call   1055f0 <inb>
    (void) inb(COM1 + COM_IIR);
  100871:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100878:	3c ff                	cmp    $0xff,%al
  10087a:	0f 95 83 4c 56 04 00 	setne  0x4564c(%ebx)
    (void) inb(COM1 + COM_IIR);
  100881:	e8 6a 4d 00 00       	call   1055f0 <inb>
    (void) inb(COM1 + COM_RX);
  100886:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
  10088d:	e8 5e 4d 00 00       	call   1055f0 <inb>
}
  100892:	83 c4 18             	add    $0x18,%esp
  100895:	5b                   	pop    %ebx
  100896:	c3                   	ret
  100897:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10089e:	00 
  10089f:	90                   	nop

001008a0 <serial_intenable>:

void serial_intenable(void)
{
  1008a0:	53                   	push   %ebx
  1008a1:	e8 fc fa ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1008a6:	81 c3 4e 37 01 00    	add    $0x1374e,%ebx
  1008ac:	83 ec 08             	sub    $0x8,%esp
    if (serial_exists) {
  1008af:	80 bb 4c 56 04 00 00 	cmpb   $0x0,0x4564c(%ebx)
  1008b6:	75 08                	jne    1008c0 <serial_intenable+0x20>
        outb(COM1 + COM_IER, 1);
        serial_intr();
    }
}
  1008b8:	83 c4 08             	add    $0x8,%esp
  1008bb:	5b                   	pop    %ebx
  1008bc:	c3                   	ret
  1008bd:	8d 76 00             	lea    0x0(%esi),%esi
        outb(COM1 + COM_IER, 1);
  1008c0:	83 ec 08             	sub    $0x8,%esp
  1008c3:	6a 01                	push   $0x1
  1008c5:	68 f9 03 00 00       	push   $0x3f9
  1008ca:	e8 51 4d 00 00       	call   105620 <outb>
    if (serial_exists)
  1008cf:	83 c4 10             	add    $0x10,%esp
  1008d2:	80 bb 4c 56 04 00 00 	cmpb   $0x0,0x4564c(%ebx)
  1008d9:	74 dd                	je     1008b8 <serial_intenable+0x18>
        cons_intr(serial_proc_data);
  1008db:	83 ec 0c             	sub    $0xc,%esp
  1008de:	8d 83 ac c6 fe ff    	lea    -0x13954(%ebx),%eax
  1008e4:	50                   	push   %eax
  1008e5:	e8 06 fb ff ff       	call   1003f0 <cons_intr>
}
  1008ea:	83 c4 10             	add    $0x10,%esp
}
  1008ed:	83 c4 08             	add    $0x8,%esp
  1008f0:	5b                   	pop    %ebx
  1008f1:	c3                   	ret
  1008f2:	66 90                	xchg   %ax,%ax
  1008f4:	66 90                	xchg   %ax,%ax
  1008f6:	66 90                	xchg   %ax,%ax
  1008f8:	66 90                	xchg   %ax,%ax
  1008fa:	66 90                	xchg   %ax,%ax
  1008fc:	66 90                	xchg   %ax,%ax
  1008fe:	66 90                	xchg   %ax,%ax

00100900 <kbd_proc_data>:
/*
 * Get data from the keyboard. If we finish a character, return it. Else 0.
 * Return -1 if no data.
 */
static int kbd_proc_data(void)
{
  100900:	56                   	push   %esi
  100901:	53                   	push   %ebx
  100902:	e8 9b fa ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100907:	81 c3 ed 36 01 00    	add    $0x136ed,%ebx
  10090d:	83 ec 10             	sub    $0x10,%esp
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0)
  100910:	6a 64                	push   $0x64
  100912:	e8 d9 4c 00 00       	call   1055f0 <inb>
  100917:	83 c4 10             	add    $0x10,%esp
  10091a:	a8 01                	test   $0x1,%al
  10091c:	0f 84 26 01 00 00    	je     100a48 <kbd_proc_data+0x148>
        return -1;

    data = inb(KBDATAP);
  100922:	83 ec 0c             	sub    $0xc,%esp
  100925:	6a 60                	push   $0x60
  100927:	e8 c4 4c 00 00       	call   1055f0 <inb>

    if (data == 0xE0) {
  10092c:	83 c4 10             	add    $0x10,%esp
  10092f:	3c e0                	cmp    $0xe0,%al
  100931:	0f 84 89 00 00 00    	je     1009c0 <kbd_proc_data+0xc0>
        // E0 escape character
        shift |= E0ESC;
  100937:	8b 8b 50 56 04 00    	mov    0x45650(%ebx),%ecx
        return 0;
    } else if (data & 0x80) {
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10093d:	89 ca                	mov    %ecx,%edx
  10093f:	83 e2 40             	and    $0x40,%edx
    } else if (data & 0x80) {
  100942:	84 c0                	test   %al,%al
  100944:	0f 88 8e 00 00 00    	js     1009d8 <kbd_proc_data+0xd8>
        shift &= ~(shiftcode[data] | E0ESC);
        return 0;
    } else if (shift & E0ESC) {
  10094a:	85 d2                	test   %edx,%edx
  10094c:	74 06                	je     100954 <kbd_proc_data+0x54>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10094e:	83 c8 80             	or     $0xffffff80,%eax
        shift &= ~E0ESC;
  100951:	83 e1 bf             	and    $0xffffffbf,%ecx
    }

    shift |= shiftcode[data];
  100954:	0f b6 c0             	movzbl %al,%eax
  100957:	0f b6 94 03 4c 7b ff 	movzbl -0x84b4(%ebx,%eax,1),%edx
  10095e:	ff 
  10095f:	09 ca                	or     %ecx,%edx
    shift ^= togglecode[data];
  100961:	0f b6 8c 03 4c 7a ff 	movzbl -0x85b4(%ebx,%eax,1),%ecx
  100968:	ff 
  100969:	31 ca                	xor    %ecx,%edx

    c = charcode[shift & (CTL | SHIFT)][data];
  10096b:	89 d1                	mov    %edx,%ecx
    shift ^= togglecode[data];
  10096d:	89 93 50 56 04 00    	mov    %edx,0x45650(%ebx)
    c = charcode[shift & (CTL | SHIFT)][data];
  100973:	83 e1 03             	and    $0x3,%ecx
  100976:	8b 8c 8b 8c ff ff ff 	mov    -0x74(%ebx,%ecx,4),%ecx
  10097d:	0f b6 34 01          	movzbl (%ecx,%eax,1),%esi
    if (shift & CAPSLOCK) {
  100981:	f6 c2 08             	test   $0x8,%dl
  100984:	75 22                	jne    1009a8 <kbd_proc_data+0xa8>
        else if ('A' <= c && c <= 'Z')
            c += 'a' - 'A';
    }
    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  100986:	f7 d2                	not    %edx
  100988:	83 e2 06             	and    $0x6,%edx
  10098b:	75 0c                	jne    100999 <kbd_proc_data+0x99>
  10098d:	81 fe e9 00 00 00    	cmp    $0xe9,%esi
  100993:	0f 84 87 00 00 00    	je     100a20 <kbd_proc_data+0x120>
        dprintf("Rebooting!\n");
        outb(0x92, 0x3);  // courtesy of Chris Frost
    }

    return c;
}
  100999:	83 c4 04             	add    $0x4,%esp
  10099c:	89 f0                	mov    %esi,%eax
  10099e:	5b                   	pop    %ebx
  10099f:	5e                   	pop    %esi
  1009a0:	c3                   	ret
  1009a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if ('a' <= c && c <= 'z')
  1009a8:	8d 46 9f             	lea    -0x61(%esi),%eax
  1009ab:	83 f8 19             	cmp    $0x19,%eax
  1009ae:	77 58                	ja     100a08 <kbd_proc_data+0x108>
            c += 'A' - 'a';
  1009b0:	83 ee 20             	sub    $0x20,%esi
}
  1009b3:	83 c4 04             	add    $0x4,%esp
  1009b6:	89 f0                	mov    %esi,%eax
  1009b8:	5b                   	pop    %ebx
  1009b9:	5e                   	pop    %esi
  1009ba:	c3                   	ret
  1009bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        shift |= E0ESC;
  1009c0:	83 8b 50 56 04 00 40 	orl    $0x40,0x45650(%ebx)
        return 0;
  1009c7:	31 f6                	xor    %esi,%esi
}
  1009c9:	83 c4 04             	add    $0x4,%esp
  1009cc:	89 f0                	mov    %esi,%eax
  1009ce:	5b                   	pop    %ebx
  1009cf:	5e                   	pop    %esi
  1009d0:	c3                   	ret
  1009d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        data = (shift & E0ESC ? data : data & 0x7F);
  1009d8:	89 c6                	mov    %eax,%esi
  1009da:	83 e6 7f             	and    $0x7f,%esi
  1009dd:	85 d2                	test   %edx,%edx
  1009df:	0f 44 c6             	cmove  %esi,%eax
        return 0;
  1009e2:	31 f6                	xor    %esi,%esi
        shift &= ~(shiftcode[data] | E0ESC);
  1009e4:	0f b6 c0             	movzbl %al,%eax
  1009e7:	0f b6 84 03 4c 7b ff 	movzbl -0x84b4(%ebx,%eax,1),%eax
  1009ee:	ff 
  1009ef:	83 c8 40             	or     $0x40,%eax
  1009f2:	0f b6 c0             	movzbl %al,%eax
  1009f5:	f7 d0                	not    %eax
  1009f7:	21 c8                	and    %ecx,%eax
  1009f9:	89 83 50 56 04 00    	mov    %eax,0x45650(%ebx)
        return 0;
  1009ff:	eb c8                	jmp    1009c9 <kbd_proc_data+0xc9>
  100a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        else if ('A' <= c && c <= 'Z')
  100a08:	8d 4e bf             	lea    -0x41(%esi),%ecx
            c += 'a' - 'A';
  100a0b:	8d 46 20             	lea    0x20(%esi),%eax
  100a0e:	83 f9 1a             	cmp    $0x1a,%ecx
  100a11:	0f 42 f0             	cmovb  %eax,%esi
  100a14:	e9 6d ff ff ff       	jmp    100986 <kbd_proc_data+0x86>
  100a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        dprintf("Rebooting!\n");
  100a20:	83 ec 0c             	sub    $0xc,%esp
  100a23:	8d 83 2d 70 ff ff    	lea    -0x8fd3(%ebx),%eax
  100a29:	50                   	push   %eax
  100a2a:	e8 21 40 00 00       	call   104a50 <dprintf>
        outb(0x92, 0x3);  // courtesy of Chris Frost
  100a2f:	58                   	pop    %eax
  100a30:	5a                   	pop    %edx
  100a31:	6a 03                	push   $0x3
  100a33:	68 92 00 00 00       	push   $0x92
  100a38:	e8 e3 4b 00 00       	call   105620 <outb>
  100a3d:	83 c4 10             	add    $0x10,%esp
  100a40:	e9 54 ff ff ff       	jmp    100999 <kbd_proc_data+0x99>
  100a45:	8d 76 00             	lea    0x0(%esi),%esi
        return -1;
  100a48:	be ff ff ff ff       	mov    $0xffffffff,%esi
  100a4d:	e9 47 ff ff ff       	jmp    100999 <kbd_proc_data+0x99>
  100a52:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100a59:	00 
  100a5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100a60 <keyboard_intr>:

void keyboard_intr(void)
{
  100a60:	53                   	push   %ebx
  100a61:	e8 3c f9 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100a66:	81 c3 8e 35 01 00    	add    $0x1358e,%ebx
  100a6c:	83 ec 14             	sub    $0x14,%esp
    cons_intr(kbd_proc_data);
  100a6f:	8d 83 0c c9 fe ff    	lea    -0x136f4(%ebx),%eax
  100a75:	50                   	push   %eax
  100a76:	e8 75 f9 ff ff       	call   1003f0 <cons_intr>
}
  100a7b:	83 c4 18             	add    $0x18,%esp
  100a7e:	5b                   	pop    %ebx
  100a7f:	c3                   	ret

00100a80 <devinit>:
void bufcache_init(void);
void inode_init(void);
void file_init(void);

void devinit(uintptr_t mbi_addr)
{
  100a80:	56                   	push   %esi
  100a81:	53                   	push   %ebx
  100a82:	e8 1b f9 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100a87:	81 c3 6d 35 01 00    	add    $0x1356d,%ebx
  100a8d:	83 ec 10             	sub    $0x10,%esp
  100a90:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    seg_init(0);
  100a94:	6a 00                	push   $0x0
  100a96:	e8 05 46 00 00       	call   1050a0 <seg_init>

    enable_sse();
  100a9b:	e8 e0 49 00 00       	call   105480 <enable_sse>

    cons_init();
  100aa0:	e8 0b f9 ff ff       	call   1003b0 <cons_init>

    debug_init();
  100aa5:	e8 36 3c 00 00       	call   1046e0 <debug_init>
    KERN_INFO("[BSP KERN] cons initialized.\n");
  100aaa:	8d 83 39 70 ff ff    	lea    -0x8fc7(%ebx),%eax
  100ab0:	89 04 24             	mov    %eax,(%esp)
  100ab3:	e8 88 3c 00 00       	call   104740 <debug_info>
    KERN_INFO("[BSP KERN] devinit mbi_addr: %d\n", mbi_addr);
  100ab8:	58                   	pop    %eax
  100ab9:	8d 83 4c 7c ff ff    	lea    -0x83b4(%ebx),%eax
  100abf:	5a                   	pop    %edx
  100ac0:	56                   	push   %esi
  100ac1:	50                   	push   %eax
  100ac2:	e8 79 3c 00 00       	call   104740 <debug_info>

    /* pcpu init codes */
    pcpu_init();
  100ac7:	e8 f4 59 00 00       	call   1064c0 <pcpu_init>
    KERN_INFO("[BSP KERN] PCPU initialized\n");
  100acc:	8d 83 57 70 ff ff    	lea    -0x8fa9(%ebx),%eax
  100ad2:	89 04 24             	mov    %eax,(%esp)
  100ad5:	e8 66 3c 00 00       	call   104740 <debug_info>

    tsc_init();
  100ada:	e8 e1 11 00 00       	call   101cc0 <tsc_init>
    KERN_INFO("[BSP KERN] TSC initialized\n");
  100adf:	8d 83 74 70 ff ff    	lea    -0x8f8c(%ebx),%eax
  100ae5:	89 04 24             	mov    %eax,(%esp)
  100ae8:	e8 53 3c 00 00       	call   104740 <debug_info>

    intr_init();
  100aed:	e8 0e 07 00 00       	call   101200 <intr_init>
    KERN_INFO("[BSP KERN] INTR initialized\n");
  100af2:	8d 83 90 70 ff ff    	lea    -0x8f70(%ebx),%eax
  100af8:	89 04 24             	mov    %eax,(%esp)
  100afb:	e8 40 3c 00 00       	call   104740 <debug_info>

    trap_init(0);
  100b00:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100b07:	e8 24 71 00 00       	call   107c30 <trap_init>

    pmmap_init(mbi_addr);
  100b0c:	89 34 24             	mov    %esi,(%esp)
  100b0f:	e8 5c 01 00 00       	call   100c70 <pmmap_init>

    bufcache_init();  // buffer cache
  100b14:	e8 57 72 00 00       	call   107d70 <bufcache_init>
    file_init();      // file table
  100b19:	e8 b2 86 00 00       	call   1091d0 <file_init>
    inode_init();     // inode cache
  100b1e:	e8 7d 7c 00 00       	call   1087a0 <inode_init>
    ide_init();
  100b23:	e8 b8 33 00 00       	call   103ee0 <ide_init>
    KERN_INFO("[BSP KERN] IDE disk driver initialized\n");
  100b28:	8d 83 70 7c ff ff    	lea    -0x8390(%ebx),%eax
  100b2e:	89 04 24             	mov    %eax,(%esp)
  100b31:	e8 0a 3c 00 00       	call   104740 <debug_info>
}
  100b36:	83 c4 14             	add    $0x14,%esp
  100b39:	5b                   	pop    %ebx
  100b3a:	5e                   	pop    %esi
  100b3b:	c3                   	ret
  100b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100b40 <devinit_ap>:

void devinit_ap(void)
{
  100b40:	56                   	push   %esi
  100b41:	53                   	push   %ebx
  100b42:	e8 5b f8 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  100b47:	81 c3 ad 34 01 00    	add    $0x134ad,%ebx
  100b4d:	83 ec 04             	sub    $0x4,%esp
    /* Figure out the current (booting) kernel stack) */
    struct kstack *ks = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  100b50:	e8 5b 48 00 00       	call   1053b0 <read_esp>

    KERN_ASSERT(ks != NULL);
  100b55:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  100b5a:	89 c6                	mov    %eax,%esi
  100b5c:	74 6a                	je     100bc8 <devinit_ap+0x88>
    KERN_ASSERT(1 <= ks->cpu_idx && ks->cpu_idx < 8);
  100b5e:	8b 86 1c 01 00 00    	mov    0x11c(%esi),%eax
  100b64:	8d 50 ff             	lea    -0x1(%eax),%edx
  100b67:	83 fa 06             	cmp    $0x6,%edx
  100b6a:	0f 87 89 00 00 00    	ja     100bf9 <devinit_ap+0xb9>

    /* kernel stack for this cpu initialized */
    seg_init(ks->cpu_idx);
  100b70:	83 ec 0c             	sub    $0xc,%esp
  100b73:	50                   	push   %eax
  100b74:	e8 27 45 00 00       	call   1050a0 <seg_init>

    pcpu_init();
  100b79:	e8 42 59 00 00       	call   1064c0 <pcpu_init>
    KERN_INFO("[AP%d KERN] PCPU initialized\n", ks->cpu_idx);
  100b7e:	58                   	pop    %eax
  100b7f:	8d 83 e8 70 ff ff    	lea    -0x8f18(%ebx),%eax
  100b85:	5a                   	pop    %edx
  100b86:	ff b6 1c 01 00 00    	push   0x11c(%esi)
  100b8c:	50                   	push   %eax
  100b8d:	e8 ae 3b 00 00       	call   104740 <debug_info>

    intr_init();
  100b92:	e8 69 06 00 00       	call   101200 <intr_init>
    KERN_INFO("[AP%d KERN] INTR initialized.\n", ks->cpu_idx);
  100b97:	59                   	pop    %ecx
  100b98:	58                   	pop    %eax
  100b99:	8d 83 bc 7c ff ff    	lea    -0x8344(%ebx),%eax
  100b9f:	ff b6 1c 01 00 00    	push   0x11c(%esi)
  100ba5:	50                   	push   %eax
  100ba6:	e8 95 3b 00 00       	call   104740 <debug_info>

    trap_init(ks->cpu_idx);
  100bab:	58                   	pop    %eax
  100bac:	ff b6 1c 01 00 00    	push   0x11c(%esi)
  100bb2:	e8 79 70 00 00       	call   107c30 <trap_init>

    paging_init_ap();
  100bb7:	e8 34 5f 00 00       	call   106af0 <paging_init_ap>
}
  100bbc:	83 c4 14             	add    $0x14,%esp
  100bbf:	5b                   	pop    %ebx
  100bc0:	5e                   	pop    %esi
  100bc1:	c3                   	ret
  100bc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    KERN_ASSERT(ks != NULL);
  100bc8:	8d 83 ad 70 ff ff    	lea    -0x8f53(%ebx),%eax
  100bce:	50                   	push   %eax
  100bcf:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  100bd5:	50                   	push   %eax
  100bd6:	8d 83 d5 70 ff ff    	lea    -0x8f2b(%ebx),%eax
  100bdc:	6a 3d                	push   $0x3d
  100bde:	50                   	push   %eax
  100bdf:	e8 fc 3b 00 00       	call   1047e0 <debug_panic>
    KERN_ASSERT(1 <= ks->cpu_idx && ks->cpu_idx < 8);
  100be4:	8b 86 1c 01 00 00    	mov    0x11c(%esi),%eax
    KERN_ASSERT(ks != NULL);
  100bea:	83 c4 10             	add    $0x10,%esp
    KERN_ASSERT(1 <= ks->cpu_idx && ks->cpu_idx < 8);
  100bed:	8d 50 ff             	lea    -0x1(%eax),%edx
  100bf0:	83 fa 06             	cmp    $0x6,%edx
  100bf3:	0f 86 77 ff ff ff    	jbe    100b70 <devinit_ap+0x30>
  100bf9:	8d 83 98 7c ff ff    	lea    -0x8368(%ebx),%eax
  100bff:	50                   	push   %eax
  100c00:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  100c06:	50                   	push   %eax
  100c07:	8d 83 d5 70 ff ff    	lea    -0x8f2b(%ebx),%eax
  100c0d:	6a 3e                	push   $0x3e
  100c0f:	50                   	push   %eax
  100c10:	e8 cb 3b 00 00       	call   1047e0 <debug_panic>
    seg_init(ks->cpu_idx);
  100c15:	8b 86 1c 01 00 00    	mov    0x11c(%esi),%eax
  100c1b:	83 c4 10             	add    $0x10,%esp
  100c1e:	e9 4d ff ff ff       	jmp    100b70 <devinit_ap+0x30>
  100c23:	66 90                	xchg   %ax,%ax
  100c25:	66 90                	xchg   %ax,%ax
  100c27:	66 90                	xchg   %ax,%ax
  100c29:	66 90                	xchg   %ax,%ax
  100c2b:	66 90                	xchg   %ax,%ax
  100c2d:	66 90                	xchg   %ax,%ax
  100c2f:	90                   	nop

00100c30 <pmmap_alloc_slot>:
    if (unlikely(pmmap_slots_next_free == 128))
  100c30:	e8 69 f7 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  100c35:	81 c2 bf 33 01 00    	add    $0x133bf,%edx
  100c3b:	8b 82 88 56 04 00    	mov    0x45688(%edx),%eax
  100c41:	3d 80 00 00 00       	cmp    $0x80,%eax
  100c46:	74 18                	je     100c60 <pmmap_alloc_slot+0x30>
    return &pmmap_slots[pmmap_slots_next_free++];
  100c48:	8d 48 01             	lea    0x1(%eax),%ecx
  100c4b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100c4e:	89 8a 88 56 04 00    	mov    %ecx,0x45688(%edx)
  100c54:	8d 84 82 8c 56 04 00 	lea    0x4568c(%edx,%eax,4),%eax
  100c5b:	c3                   	ret
  100c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return NULL;
  100c60:	31 c0                	xor    %eax,%eax
}
  100c62:	c3                   	ret
  100c63:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100c6a:	00 
  100c6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00100c70 <pmmap_init>:
                  (slot->type == MEM_NVS) ? "ACPI NVS" : "unknown");
    }
}

void pmmap_init(uintptr_t mbi_addr)
{
  100c70:	55                   	push   %ebp
  100c71:	e8 83 05 00 00       	call   1011f9 <__x86.get_pc_thunk.bp>
  100c76:	81 c5 7e 33 01 00    	add    $0x1337e,%ebp
  100c7c:	57                   	push   %edi
  100c7d:	56                   	push   %esi
  100c7e:	53                   	push   %ebx
  100c7f:	83 ec 58             	sub    $0x58,%esp
    KERN_INFO("\n");
  100c82:	8d 85 06 76 ff ff    	lea    -0x89fa(%ebp),%eax
{
  100c88:	8b 74 24 6c          	mov    0x6c(%esp),%esi
    KERN_INFO("\n");
  100c8c:	89 eb                	mov    %ebp,%ebx
  100c8e:	50                   	push   %eax
  100c8f:	e8 ac 3a 00 00       	call   104740 <debug_info>

    mboot_info_t *mbi = (mboot_info_t *) mbi_addr;
    mboot_mmap_t *p = (mboot_mmap_t *) mbi->mmap_addr;
  100c94:	8b 46 30             	mov    0x30(%esi),%eax
    SLIST_INIT(&pmmap_sublist[PMMAP_NVS]);

    /*
     * Copy memory map information from multiboot information mbi to pmmap.
     */
    while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100c97:	8b 76 2c             	mov    0x2c(%esi),%esi
    SLIST_INIT(&pmmap_list);
  100c9a:	c7 85 84 56 04 00 00 	movl   $0x0,0x45684(%ebp)
  100ca1:	00 00 00 
    SLIST_INIT(&pmmap_sublist[PMMAP_USABLE]);
  100ca4:	c7 85 74 56 04 00 00 	movl   $0x0,0x45674(%ebp)
  100cab:	00 00 00 
    while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100cae:	89 74 24 34          	mov    %esi,0x34(%esp)
  100cb2:	83 c4 10             	add    $0x10,%esp
    SLIST_INIT(&pmmap_sublist[PMMAP_RESV]);
  100cb5:	c7 85 78 56 04 00 00 	movl   $0x0,0x45678(%ebp)
  100cbc:	00 00 00 
    SLIST_INIT(&pmmap_sublist[PMMAP_ACPI]);
  100cbf:	c7 85 7c 56 04 00 00 	movl   $0x0,0x4567c(%ebp)
  100cc6:	00 00 00 
    SLIST_INIT(&pmmap_sublist[PMMAP_NVS]);
  100cc9:	c7 85 80 56 04 00 00 	movl   $0x0,0x45680(%ebp)
  100cd0:	00 00 00 
    while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100cd3:	85 f6                	test   %esi,%esi
  100cd5:	0f 84 4f 03 00 00    	je     10102a <pmmap_init+0x3ba>
  100cdb:	ba e8 ff ff ff       	mov    $0xffffffe8,%edx
  100ce0:	8d 58 18             	lea    0x18(%eax),%ebx
  100ce3:	31 ff                	xor    %edi,%edi
  100ce5:	c6 44 24 2f 00       	movb   $0x0,0x2f(%esp)
  100cea:	29 c2                	sub    %eax,%edx
  100cec:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  100cf0:	8b b5 88 56 04 00    	mov    0x45688(%ebp),%esi
  100cf6:	c6 44 24 14 00       	movb   $0x0,0x14(%esp)
  100cfb:	89 54 24 28          	mov    %edx,0x28(%esp)
  100cff:	89 7c 24 20          	mov    %edi,0x20(%esp)
  100d03:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        uintptr_t start, end;
        uint32_t type;

        if (p->base_addr_high != 0)  /* ignore address above 4G */
  100d08:	8b 78 08             	mov    0x8(%eax),%edi
  100d0b:	85 ff                	test   %edi,%edi
  100d0d:	0f 85 c5 00 00 00    	jne    100dd8 <pmmap_init+0x168>
            goto next;
        else
            start = p->base_addr_low;

        if (p->length_high != 0 || p->length_low >= 0xffffffff - start)
  100d13:	8b 58 10             	mov    0x10(%eax),%ebx
            start = p->base_addr_low;
  100d16:	8b 50 04             	mov    0x4(%eax),%edx
            end = 0xffffffff;
  100d19:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
        if (p->length_high != 0 || p->length_low >= 0xffffffff - start)
  100d1e:	85 db                	test   %ebx,%ebx
  100d20:	75 0f                	jne    100d31 <pmmap_init+0xc1>
        else
            end = start + p->length_low;
  100d22:	8b 78 0c             	mov    0xc(%eax),%edi
  100d25:	89 d3                	mov    %edx,%ebx
  100d27:	f7 d3                	not    %ebx
  100d29:	01 d7                	add    %edx,%edi
  100d2b:	39 58 0c             	cmp    %ebx,0xc(%eax)
  100d2e:	0f 42 cf             	cmovb  %edi,%ecx

        type = p->type;
  100d31:	8b 40 14             	mov    0x14(%eax),%eax
  100d34:	89 44 24 10          	mov    %eax,0x10(%esp)
    if (unlikely(pmmap_slots_next_free == 128))
  100d38:	81 fe 80 00 00 00    	cmp    $0x80,%esi
  100d3e:	0f 84 bc f2 ff ff    	je     100000 <pmmap_init.cold>
    return &pmmap_slots[pmmap_slots_next_free++];
  100d44:	8d 46 01             	lea    0x1(%esi),%eax
  100d47:	8d 1c b5 00 00 00 00 	lea    0x0(,%esi,4),%ebx
  100d4e:	89 44 24 14          	mov    %eax,0x14(%esp)
  100d52:	8d 04 33             	lea    (%ebx,%esi,1),%eax
  100d55:	c1 e0 02             	shl    $0x2,%eax
  100d58:	8d bc 05 8c 56 04 00 	lea    0x4568c(%ebp,%eax,1),%edi
    free_slot->end = end;
  100d5f:	8d 84 05 8c 56 04 00 	lea    0x4568c(%ebp,%eax,1),%eax
  100d66:	89 48 04             	mov    %ecx,0x4(%eax)
    free_slot->type = type;
  100d69:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    return &pmmap_slots[pmmap_slots_next_free++];
  100d6d:	89 7c 24 18          	mov    %edi,0x18(%esp)
    free_slot->type = type;
  100d71:	89 48 08             	mov    %ecx,0x8(%eax)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100d74:	8b 44 24 20          	mov    0x20(%esp),%eax
    free_slot->start = start;
  100d78:	89 17                	mov    %edx,(%edi)
    free_slot->end = end;
  100d7a:	8d 3d 8c 56 04 00    	lea    0x4568c,%edi
  100d80:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100d84:	85 c0                	test   %eax,%eax
  100d86:	74 25                	je     100dad <pmmap_init+0x13d>
    last_slot = NULL;
  100d88:	31 ff                	xor    %edi,%edi
  100d8a:	eb 13                	jmp    100d9f <pmmap_init+0x12f>
  100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100d90:	8b 48 0c             	mov    0xc(%eax),%ecx
  100d93:	89 c7                	mov    %eax,%edi
  100d95:	85 c9                	test   %ecx,%ecx
  100d97:	0f 84 33 02 00 00    	je     100fd0 <pmmap_init+0x360>
  100d9d:	89 c8                	mov    %ecx,%eax
        if (start < slot->start)
  100d9f:	3b 10                	cmp    (%eax),%edx
  100da1:	73 ed                	jae    100d90 <pmmap_init+0x120>
    if (last_slot == NULL) {
  100da3:	89 f8                	mov    %edi,%eax
  100da5:	85 ff                	test   %edi,%edi
  100da7:	0f 85 23 02 00 00    	jne    100fd0 <pmmap_init+0x360>
        SLIST_INSERT_HEAD(&pmmap_list, free_slot, next);
  100dad:	01 f3                	add    %esi,%ebx
  100daf:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  100db3:	c6 44 24 2f 01       	movb   $0x1,0x2f(%esp)
  100db8:	8d 44 9d 00          	lea    0x0(%ebp,%ebx,4),%eax
  100dbc:	8b 5c 24 20          	mov    0x20(%esp),%ebx
  100dc0:	89 5c 06 0c          	mov    %ebx,0xc(%esi,%eax,1)
  100dc4:	8b 44 24 18          	mov    0x18(%esp),%eax
    return &pmmap_slots[pmmap_slots_next_free++];
  100dc8:	8b 74 24 14          	mov    0x14(%esp),%esi
  100dcc:	c6 44 24 14 01       	movb   $0x1,0x14(%esp)
        SLIST_INSERT_HEAD(&pmmap_list, free_slot, next);
  100dd1:	89 44 24 20          	mov    %eax,0x20(%esp)
  100dd5:	8d 76 00             	lea    0x0(%esi),%esi

        pmmap_insert(start, end, type);

      next:
        p = (mboot_mmap_t *) (((uint32_t) p) + sizeof(mboot_mmap_t) /* p->size */);
  100dd8:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100ddc:	8b 7c 24 28          	mov    0x28(%esp),%edi
        p = (mboot_mmap_t *) (((uint32_t) p) + sizeof(mboot_mmap_t) /* p->size */);
  100de0:	89 d8                	mov    %ebx,%eax
    while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100de2:	83 c3 18             	add    $0x18,%ebx
  100de5:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
  100de8:	8b 7c 24 24          	mov    0x24(%esp),%edi
  100dec:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  100df0:	39 fa                	cmp    %edi,%edx
  100df2:	0f 82 10 ff ff ff    	jb     100d08 <pmmap_init+0x98>
  100df8:	80 7c 24 2f 00       	cmpb   $0x0,0x2f(%esp)
  100dfd:	8b 7c 24 20          	mov    0x20(%esp),%edi
  100e01:	0f 84 52 02 00 00    	je     101059 <pmmap_init+0x3e9>
  100e07:	80 7c 24 14 00       	cmpb   $0x0,0x14(%esp)
  100e0c:	89 bd 84 56 04 00    	mov    %edi,0x45684(%ebp)
  100e12:	74 06                	je     100e1a <pmmap_init+0x1aa>
  100e14:	89 b5 88 56 04 00    	mov    %esi,0x45688(%ebp)
    struct pmmap *last_slot[4] = { NULL, NULL, NULL, NULL };
  100e1a:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  100e21:	00 
  100e22:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
  100e29:	00 
  100e2a:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  100e31:	00 
  100e32:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
  100e39:	00 
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100e3a:	85 ff                	test   %edi,%edi
  100e3c:	0f 84 e8 01 00 00    	je     10102a <pmmap_init+0x3ba>
        if ((next_slot = SLIST_NEXT(slot, next)) == NULL)
  100e42:	8b 47 0c             	mov    0xc(%edi),%eax
  100e45:	85 c0                	test   %eax,%eax
  100e47:	74 29                	je     100e72 <pmmap_init+0x202>
  100e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        if (slot->start <= next_slot->start &&
  100e50:	8b 10                	mov    (%eax),%edx
  100e52:	3b 17                	cmp    (%edi),%edx
  100e54:	72 13                	jb     100e69 <pmmap_init+0x1f9>
            slot->end >= next_slot->start &&
  100e56:	8b 4f 04             	mov    0x4(%edi),%ecx
        if (slot->start <= next_slot->start &&
  100e59:	39 d1                	cmp    %edx,%ecx
  100e5b:	72 0c                	jb     100e69 <pmmap_init+0x1f9>
            slot->end >= next_slot->start &&
  100e5d:	8b 70 08             	mov    0x8(%eax),%esi
  100e60:	39 77 08             	cmp    %esi,0x8(%edi)
  100e63:	0f 84 36 01 00 00    	je     100f9f <pmmap_init+0x32f>
  100e69:	89 c7                	mov    %eax,%edi
        if ((next_slot = SLIST_NEXT(slot, next)) == NULL)
  100e6b:	8b 47 0c             	mov    0xc(%edi),%eax
  100e6e:	85 c0                	test   %eax,%eax
  100e70:	75 de                	jne    100e50 <pmmap_init+0x1e0>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100e72:	8b b5 84 56 04 00    	mov    0x45684(%ebp),%esi
            SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot, type_next);
  100e78:	8d bd 74 56 04 00    	lea    0x45674(%ebp),%edi
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100e7e:	85 f6                	test   %esi,%esi
  100e80:	75 2a                	jne    100eac <pmmap_init+0x23c>
  100e82:	e9 a3 01 00 00       	jmp    10102a <pmmap_init+0x3ba>
  100e87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100e8e:	00 
  100e8f:	90                   	nop
        if (last_slot[sublist_nr] != NULL)
  100e90:	8b 54 84 30          	mov    0x30(%esp,%eax,4),%edx
  100e94:	85 d2                	test   %edx,%edx
  100e96:	74 4d                	je     100ee5 <pmmap_init+0x275>
            SLIST_INSERT_AFTER(last_slot[sublist_nr], slot, type_next);
  100e98:	8b 4a 10             	mov    0x10(%edx),%ecx
        last_slot[sublist_nr] = slot;
  100e9b:	89 74 84 30          	mov    %esi,0x30(%esp,%eax,4)
            SLIST_INSERT_AFTER(last_slot[sublist_nr], slot, type_next);
  100e9f:	89 4e 10             	mov    %ecx,0x10(%esi)
  100ea2:	89 72 10             	mov    %esi,0x10(%edx)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100ea5:	8b 76 0c             	mov    0xc(%esi),%esi
  100ea8:	85 f6                	test   %esi,%esi
  100eaa:	74 4d                	je     100ef9 <pmmap_init+0x289>
        sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100eac:	8b 46 08             	mov    0x8(%esi),%eax
  100eaf:	83 e8 01             	sub    $0x1,%eax
  100eb2:	83 f8 03             	cmp    $0x3,%eax
  100eb5:	76 d9                	jbe    100e90 <pmmap_init+0x220>
        KERN_ASSERT(sublist_nr != -1);
  100eb7:	8d 85 5f 71 ff ff    	lea    -0x8ea1(%ebp),%eax
  100ebd:	89 eb                	mov    %ebp,%ebx
  100ebf:	50                   	push   %eax
  100ec0:	8d 85 b8 70 ff ff    	lea    -0x8f48(%ebp),%eax
  100ec6:	50                   	push   %eax
  100ec7:	8d 85 4e 71 ff ff    	lea    -0x8eb2(%ebp),%eax
  100ecd:	6a 6b                	push   $0x6b
  100ecf:	50                   	push   %eax
  100ed0:	e8 0b 39 00 00       	call   1047e0 <debug_panic>
  100ed5:	83 c4 10             	add    $0x10,%esp
        sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100ed8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
        if (last_slot[sublist_nr] != NULL)
  100edd:	8b 54 84 30          	mov    0x30(%esp,%eax,4),%edx
  100ee1:	85 d2                	test   %edx,%edx
  100ee3:	75 b3                	jne    100e98 <pmmap_init+0x228>
            SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot, type_next);
  100ee5:	8b 14 87             	mov    (%edi,%eax,4),%edx
        last_slot[sublist_nr] = slot;
  100ee8:	89 74 84 30          	mov    %esi,0x30(%esp,%eax,4)
            SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot, type_next);
  100eec:	89 34 87             	mov    %esi,(%edi,%eax,4)
  100eef:	89 56 10             	mov    %edx,0x10(%esi)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100ef2:	8b 76 0c             	mov    0xc(%esi),%esi
  100ef5:	85 f6                	test   %esi,%esi
  100ef7:	75 b3                	jne    100eac <pmmap_init+0x23c>
    if (last_slot[PMMAP_USABLE] != NULL)
  100ef9:	8b 44 24 30          	mov    0x30(%esp),%eax
  100efd:	85 c0                	test   %eax,%eax
  100eff:	74 09                	je     100f0a <pmmap_init+0x29a>
        max_usable_memory = last_slot[PMMAP_USABLE]->end;
  100f01:	8b 40 04             	mov    0x4(%eax),%eax
  100f04:	89 85 70 56 04 00    	mov    %eax,0x45670(%ebp)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100f0a:	8b b5 84 56 04 00    	mov    0x45684(%ebp),%esi
  100f10:	85 f6                	test   %esi,%esi
  100f12:	0f 84 12 01 00 00    	je     10102a <pmmap_init+0x3ba>
        KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  100f18:	8d 85 1e 71 ff ff    	lea    -0x8ee2(%ebp),%eax
  100f1e:	8d bd dc 7c ff ff    	lea    -0x8324(%ebp),%edi
  100f24:	89 44 24 10          	mov    %eax,0x10(%esp)
  100f28:	8d 85 28 71 ff ff    	lea    -0x8ed8(%ebp),%eax
  100f2e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100f32:	eb 4d                	jmp    100f81 <pmmap_init+0x311>
  100f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100f38:	8d 95 0e 71 ff ff    	lea    -0x8ef2(%ebp),%edx
  100f3e:	83 f8 01             	cmp    $0x1,%eax
  100f41:	74 12                	je     100f55 <pmmap_init+0x2e5>
  100f43:	83 f8 02             	cmp    $0x2,%eax
  100f46:	8d 95 06 71 ff ff    	lea    -0x8efa(%ebp),%edx
  100f4c:	8d 85 15 71 ff ff    	lea    -0x8eeb(%ebp),%eax
  100f52:	0f 44 d0             	cmove  %eax,%edx
  100f55:	8b 0e                	mov    (%esi),%ecx
  100f57:	8b 46 04             	mov    0x4(%esi),%eax
  100f5a:	39 c1                	cmp    %eax,%ecx
  100f5c:	74 0a                	je     100f68 <pmmap_init+0x2f8>
  100f5e:	31 db                	xor    %ebx,%ebx
  100f60:	83 f8 ff             	cmp    $0xffffffff,%eax
  100f63:	0f 95 c3             	setne  %bl
  100f66:	29 d8                	sub    %ebx,%eax
  100f68:	52                   	push   %edx
  100f69:	89 eb                	mov    %ebp,%ebx
  100f6b:	50                   	push   %eax
  100f6c:	51                   	push   %ecx
  100f6d:	57                   	push   %edi
  100f6e:	e8 cd 37 00 00       	call   104740 <debug_info>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100f73:	8b 76 0c             	mov    0xc(%esi),%esi
  100f76:	83 c4 10             	add    $0x10,%esp
  100f79:	85 f6                	test   %esi,%esi
  100f7b:	0f 84 7f 00 00 00    	je     101000 <pmmap_init+0x390>
        KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  100f81:	8b 46 08             	mov    0x8(%esi),%eax
  100f84:	83 f8 03             	cmp    $0x3,%eax
  100f87:	0f 84 c3 00 00 00    	je     101050 <pmmap_init+0x3e0>
  100f8d:	76 a9                	jbe    100f38 <pmmap_init+0x2c8>
  100f8f:	83 f8 04             	cmp    $0x4,%eax
  100f92:	8d 95 06 71 ff ff    	lea    -0x8efa(%ebp),%edx
  100f98:	0f 44 54 24 0c       	cmove  0xc(%esp),%edx
  100f9d:	eb b6                	jmp    100f55 <pmmap_init+0x2e5>
            slot->end = max(slot->end, next_slot->end);
  100f9f:	83 ec 08             	sub    $0x8,%esp
  100fa2:	ff 70 04             	push   0x4(%eax)
  100fa5:	89 eb                	mov    %ebp,%ebx
  100fa7:	51                   	push   %ecx
  100fa8:	e8 a3 43 00 00       	call   105350 <max>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100fad:	83 c4 10             	add    $0x10,%esp
            slot->end = max(slot->end, next_slot->end);
  100fb0:	89 47 04             	mov    %eax,0x4(%edi)
            SLIST_REMOVE_AFTER(slot, next);
  100fb3:	8b 47 0c             	mov    0xc(%edi),%eax
  100fb6:	8b 40 0c             	mov    0xc(%eax),%eax
  100fb9:	89 47 0c             	mov    %eax,0xc(%edi)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  100fbc:	85 c0                	test   %eax,%eax
  100fbe:	0f 84 ae fe ff ff    	je     100e72 <pmmap_init+0x202>
  100fc4:	89 c7                	mov    %eax,%edi
  100fc6:	e9 a0 fe ff ff       	jmp    100e6b <pmmap_init+0x1fb>
  100fcb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        SLIST_INSERT_AFTER(last_slot, free_slot, next);
  100fd0:	8b 48 0c             	mov    0xc(%eax),%ecx
  100fd3:	01 f3                	add    %esi,%ebx
  100fd5:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  100fd9:	8d 54 9d 00          	lea    0x0(%ebp,%ebx,4),%edx
  100fdd:	89 4c 16 0c          	mov    %ecx,0xc(%esi,%edx,1)
  100fe1:	8b 74 24 18          	mov    0x18(%esp),%esi
  100fe5:	89 70 0c             	mov    %esi,0xc(%eax)
    return &pmmap_slots[pmmap_slots_next_free++];
  100fe8:	8b 74 24 14          	mov    0x14(%esp),%esi
        SLIST_INSERT_AFTER(last_slot, free_slot, next);
  100fec:	c6 44 24 14 01       	movb   $0x1,0x14(%esp)
  100ff1:	e9 e2 fd ff ff       	jmp    100dd8 <pmmap_init+0x168>
  100ff6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100ffd:	00 
  100ffe:	66 90                	xchg   %ax,%ax
    pmmap_merge();
    pmmap_dump();

    /* count the number of pmmap entries */
    struct pmmap *slot;
    SLIST_FOREACH(slot, &pmmap_list, next) {
  101000:	8b 95 84 56 04 00    	mov    0x45684(%ebp),%edx
  101006:	85 d2                	test   %edx,%edx
  101008:	74 20                	je     10102a <pmmap_init+0x3ba>
  10100a:	8b 85 6c 56 04 00    	mov    0x4566c(%ebp),%eax
  101010:	83 c0 01             	add    $0x1,%eax
  101013:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101018:	8b 52 0c             	mov    0xc(%edx),%edx
  10101b:	89 c1                	mov    %eax,%ecx
  10101d:	83 c0 01             	add    $0x1,%eax
  101020:	85 d2                	test   %edx,%edx
  101022:	75 f4                	jne    101018 <pmmap_init+0x3a8>
  101024:	89 8d 6c 56 04 00    	mov    %ecx,0x4566c(%ebp)
        pmmap_nentries++;
    }

    /* Calculate the maximum page number */
    mem_npages = rounddown(max_usable_memory, PAGESIZE) / PAGESIZE;
  10102a:	83 ec 08             	sub    $0x8,%esp
  10102d:	89 eb                	mov    %ebp,%ebx
  10102f:	68 00 10 00 00       	push   $0x1000
  101034:	ff b5 70 56 04 00    	push   0x45670(%ebp)
  10103a:	e8 31 43 00 00       	call   105370 <rounddown>
}
  10103f:	83 c4 5c             	add    $0x5c,%esp
  101042:	5b                   	pop    %ebx
  101043:	5e                   	pop    %esi
  101044:	5f                   	pop    %edi
  101045:	5d                   	pop    %ebp
  101046:	c3                   	ret
  101047:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10104e:	00 
  10104f:	90                   	nop
        KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  101050:	8b 54 24 10          	mov    0x10(%esp),%edx
  101054:	e9 fc fe ff ff       	jmp    100f55 <pmmap_init+0x2e5>
  101059:	80 7c 24 14 00       	cmpb   $0x0,0x14(%esp)
  10105e:	74 ca                	je     10102a <pmmap_init+0x3ba>
  101060:	89 b5 88 56 04 00    	mov    %esi,0x45688(%ebp)
    SLIST_FOREACH(slot, &pmmap_list, next) {
  101066:	eb c2                	jmp    10102a <pmmap_init+0x3ba>
  101068:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10106f:	00 

00101070 <get_size>:

int get_size(void)
{
    return pmmap_nentries;
  101070:	e8 25 f3 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  101075:	05 7f 2f 01 00       	add    $0x12f7f,%eax
  10107a:	8b 80 6c 56 04 00    	mov    0x4566c(%eax),%eax
}
  101080:	c3                   	ret
  101081:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101088:	00 
  101089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101090 <get_mms>:

uint32_t get_mms(int idx)
{
  101090:	53                   	push   %ebx
  101091:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  101095:	e8 08 f3 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10109a:	81 c3 5a 2f 01 00    	add    $0x12f5a,%ebx
    int i = 0;
    struct pmmap *slot = NULL;

    SLIST_FOREACH(slot, &pmmap_list, next) {
  1010a0:	8b 83 84 56 04 00    	mov    0x45684(%ebx),%eax
  1010a6:	85 c0                	test   %eax,%eax
  1010a8:	74 1c                	je     1010c6 <get_mms+0x36>
    int i = 0;
  1010aa:	31 d2                	xor    %edx,%edx
        if (i == idx)
  1010ac:	85 c9                	test   %ecx,%ecx
  1010ae:	75 0c                	jne    1010bc <get_mms+0x2c>
  1010b0:	eb 1e                	jmp    1010d0 <get_mms+0x40>
  1010b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1010b8:	39 d1                	cmp    %edx,%ecx
  1010ba:	74 14                	je     1010d0 <get_mms+0x40>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  1010bc:	8b 40 0c             	mov    0xc(%eax),%eax
            break;
        i++;
  1010bf:	83 c2 01             	add    $0x1,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  1010c2:	85 c0                	test   %eax,%eax
  1010c4:	75 f2                	jne    1010b8 <get_mms+0x28>
    }

    if (slot == NULL || i == pmmap_nentries)
        return 0;
  1010c6:	31 c9                	xor    %ecx,%ecx

    return slot->start;
}
  1010c8:	89 c8                	mov    %ecx,%eax
  1010ca:	5b                   	pop    %ebx
  1010cb:	c3                   	ret
  1010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  1010d0:	31 c9                	xor    %ecx,%ecx
    if (slot == NULL || i == pmmap_nentries)
  1010d2:	39 93 6c 56 04 00    	cmp    %edx,0x4566c(%ebx)
  1010d8:	74 ee                	je     1010c8 <get_mms+0x38>
    return slot->start;
  1010da:	8b 08                	mov    (%eax),%ecx
}
  1010dc:	5b                   	pop    %ebx
  1010dd:	89 c8                	mov    %ecx,%eax
  1010df:	c3                   	ret

001010e0 <get_mml>:

uint32_t get_mml(int idx)
{
  1010e0:	53                   	push   %ebx
  1010e1:	8b 44 24 08          	mov    0x8(%esp),%eax
  1010e5:	e8 b8 f2 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1010ea:	81 c3 0a 2f 01 00    	add    $0x12f0a,%ebx
    int i = 0;
    struct pmmap *slot = NULL;

    SLIST_FOREACH(slot, &pmmap_list, next) {
  1010f0:	8b 93 84 56 04 00    	mov    0x45684(%ebx),%edx
  1010f6:	85 d2                	test   %edx,%edx
  1010f8:	74 1c                	je     101116 <get_mml+0x36>
    int i = 0;
  1010fa:	31 c9                	xor    %ecx,%ecx
        if (i == idx)
  1010fc:	85 c0                	test   %eax,%eax
  1010fe:	75 0c                	jne    10110c <get_mml+0x2c>
  101100:	eb 1e                	jmp    101120 <get_mml+0x40>
  101102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101108:	39 c8                	cmp    %ecx,%eax
  10110a:	74 14                	je     101120 <get_mml+0x40>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  10110c:	8b 52 0c             	mov    0xc(%edx),%edx
            break;
        i++;
  10110f:	83 c1 01             	add    $0x1,%ecx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  101112:	85 d2                	test   %edx,%edx
  101114:	75 f2                	jne    101108 <get_mml+0x28>
    }

    if (slot == NULL || i == pmmap_nentries)
        return 0;
  101116:	31 c0                	xor    %eax,%eax

    return slot->end - slot->start;
}
  101118:	5b                   	pop    %ebx
  101119:	c3                   	ret
  10111a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        return 0;
  101120:	31 c0                	xor    %eax,%eax
    if (slot == NULL || i == pmmap_nentries)
  101122:	39 8b 6c 56 04 00    	cmp    %ecx,0x4566c(%ebx)
  101128:	74 ee                	je     101118 <get_mml+0x38>
    return slot->end - slot->start;
  10112a:	8b 42 04             	mov    0x4(%edx),%eax
}
  10112d:	5b                   	pop    %ebx
    return slot->end - slot->start;
  10112e:	2b 02                	sub    (%edx),%eax
}
  101130:	c3                   	ret
  101131:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101138:	00 
  101139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101140 <is_usable>:

int is_usable(int idx)
{
  101140:	53                   	push   %ebx
  101141:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  101145:	e8 58 f2 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10114a:	81 c3 aa 2e 01 00    	add    $0x12eaa,%ebx
    int i = 0;
    struct pmmap *slot = NULL;

    SLIST_FOREACH(slot, &pmmap_list, next) {
  101150:	8b 83 84 56 04 00    	mov    0x45684(%ebx),%eax
  101156:	85 c0                	test   %eax,%eax
  101158:	74 1c                	je     101176 <is_usable+0x36>
    int i = 0;
  10115a:	31 d2                	xor    %edx,%edx
        if (i == idx)
  10115c:	85 c9                	test   %ecx,%ecx
  10115e:	75 0c                	jne    10116c <is_usable+0x2c>
  101160:	eb 1e                	jmp    101180 <is_usable+0x40>
  101162:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101168:	39 d1                	cmp    %edx,%ecx
  10116a:	74 14                	je     101180 <is_usable+0x40>
    SLIST_FOREACH(slot, &pmmap_list, next) {
  10116c:	8b 40 0c             	mov    0xc(%eax),%eax
            break;
        i++;
  10116f:	83 c2 01             	add    $0x1,%edx
    SLIST_FOREACH(slot, &pmmap_list, next) {
  101172:	85 c0                	test   %eax,%eax
  101174:	75 f2                	jne    101168 <is_usable+0x28>
    }

    if (slot == NULL || i == pmmap_nentries)
        return 0;
  101176:	31 c9                	xor    %ecx,%ecx

    return slot->type == MEM_RAM;
}
  101178:	89 c8                	mov    %ecx,%eax
  10117a:	5b                   	pop    %ebx
  10117b:	c3                   	ret
  10117c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  101180:	31 c9                	xor    %ecx,%ecx
    if (slot == NULL || i == pmmap_nentries)
  101182:	39 93 6c 56 04 00    	cmp    %edx,0x4566c(%ebx)
  101188:	74 ee                	je     101178 <is_usable+0x38>
    return slot->type == MEM_RAM;
  10118a:	31 c9                	xor    %ecx,%ecx
  10118c:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
}
  101190:	5b                   	pop    %ebx
    return slot->type == MEM_RAM;
  101191:	0f 94 c1             	sete   %cl
}
  101194:	89 c8                	mov    %ecx,%eax
  101196:	c3                   	ret
  101197:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10119e:	00 
  10119f:	90                   	nop

001011a0 <set_cr3>:

void set_cr3(unsigned int **pdir)
{
  1011a0:	53                   	push   %ebx
  1011a1:	e8 fc f1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1011a6:	81 c3 4e 2e 01 00    	add    $0x12e4e,%ebx
  1011ac:	83 ec 14             	sub    $0x14,%esp
    lcr3((uint32_t) pdir);
  1011af:	ff 74 24 1c          	push   0x1c(%esp)
  1011b3:	e8 08 44 00 00       	call   1055c0 <lcr3>
}
  1011b8:	83 c4 18             	add    $0x18,%esp
  1011bb:	5b                   	pop    %ebx
  1011bc:	c3                   	ret
  1011bd:	8d 76 00             	lea    0x0(%esi),%esi

001011c0 <enable_paging>:

void enable_paging(void)
{
  1011c0:	53                   	push   %ebx
  1011c1:	e8 dc f1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1011c6:	81 c3 2e 2e 01 00    	add    $0x12e2e,%ebx
  1011cc:	83 ec 08             	sub    $0x8,%esp
    /* enable global pages (Sec 4.10.2.4, Intel ASDM Vol3) */
    uint32_t cr4 = rcr4();
  1011cf:	e8 0c 44 00 00       	call   1055e0 <rcr4>
    cr4 |= CR4_PGE;
    lcr4(cr4);
  1011d4:	83 ec 0c             	sub    $0xc,%esp
    cr4 |= CR4_PGE;
  1011d7:	0c 80                	or     $0x80,%al
    lcr4(cr4);
  1011d9:	50                   	push   %eax
  1011da:	e8 f1 43 00 00       	call   1055d0 <lcr4>

    /* turn on paging */
    uint32_t cr0 = rcr0();
  1011df:	e8 bc 43 00 00       	call   1055a0 <rcr0>
    cr0 |= CR0_PE | CR0_PG | CR0_AM | CR0_WP | CR0_NE | CR0_MP;
    cr0 &= ~(CR0_EM | CR0_TS);
  1011e4:	83 e0 f3             	and    $0xfffffff3,%eax
  1011e7:	0d 23 00 05 80       	or     $0x80050023,%eax
    lcr0(cr0);
  1011ec:	89 04 24             	mov    %eax,(%esp)
  1011ef:	e8 9c 43 00 00       	call   105590 <lcr0>
}
  1011f4:	83 c4 18             	add    $0x18,%esp
  1011f7:	5b                   	pop    %ebx
  1011f8:	c3                   	ret

001011f9 <__x86.get_pc_thunk.bp>:
  1011f9:	8b 2c 24             	mov    (%esp),%ebp
  1011fc:	c3                   	ret
  1011fd:	66 90                	xchg   %ax,%ax
  1011ff:	90                   	nop

00101200 <intr_init>:
{
    asm volatile ("lidt %0" :: "m" (idt_pd));
}

void intr_init(void)
{
  101200:	55                   	push   %ebp
  101201:	57                   	push   %edi
  101202:	56                   	push   %esi
  101203:	53                   	push   %ebx
  101204:	e8 99 f1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101209:	81 c3 eb 2d 01 00    	add    $0x12deb,%ebx
  10120f:	83 ec 38             	sub    $0x38,%esp
    uint32_t dummy, edx;

    cpuid(0x00000001, &dummy, &dummy, &dummy, &edx);
  101212:	8d 44 24 28          	lea    0x28(%esp),%eax
  101216:	50                   	push   %eax
  101217:	8d 44 24 28          	lea    0x28(%esp),%eax
  10121b:	50                   	push   %eax
  10121c:	50                   	push   %eax
  10121d:	50                   	push   %eax
  10121e:	6a 01                	push   $0x1
  101220:	e8 9b 42 00 00       	call   1054c0 <cpuid>
    using_apic = (edx & CPUID_FEATURE_APIC) ? TRUE : FALSE;
  101225:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    KERN_ASSERT(using_apic == TRUE);
  101229:	83 c4 20             	add    $0x20,%esp
    using_apic = (edx & CPUID_FEATURE_APIC) ? TRUE : FALSE;
  10122c:	c1 e8 09             	shr    $0x9,%eax
  10122f:	83 e0 01             	and    $0x1,%eax
  101232:	88 83 8c 68 04 00    	mov    %al,0x4688c(%ebx)
    KERN_ASSERT(using_apic == TRUE);
  101238:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
  10123f:	3c 01                	cmp    $0x1,%al
  101241:	74 1f                	je     101262 <intr_init+0x62>
  101243:	8d 83 70 71 ff ff    	lea    -0x8e90(%ebx),%eax
  101249:	50                   	push   %eax
  10124a:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  101250:	50                   	push   %eax
  101251:	8d 83 83 71 ff ff    	lea    -0x8e7d(%ebx),%eax
  101257:	6a 63                	push   $0x63
  101259:	50                   	push   %eax
  10125a:	e8 81 35 00 00       	call   1047e0 <debug_panic>
  10125f:	83 c4 10             	add    $0x10,%esp

    if (pcpu_onboot())
  101262:	e8 99 28 00 00       	call   103b00 <pcpu_onboot>
  101267:	84 c0                	test   %al,%al
  101269:	75 25                	jne    101290 <intr_init+0x90>
            intr_init_idt();
        }
    }

    /* all processors */
    if (using_apic)
  10126b:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
  101272:	84 c0                	test   %al,%al
  101274:	0f 85 56 05 00 00    	jne    1017d0 <intr_init+0x5d0>
    asm volatile ("lidt %0" :: "m" (idt_pd));
  10127a:	0f 01 9b 0c 03 00 00 	lidtl  0x30c(%ebx)
    {
        lapic_init();
    }
    intr_install_idt();
}
  101281:	83 c4 2c             	add    $0x2c,%esp
  101284:	5b                   	pop    %ebx
  101285:	5e                   	pop    %esi
  101286:	5f                   	pop    %edi
  101287:	5d                   	pop    %ebp
  101288:	c3                   	ret
  101289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        pic_init();
  101290:	e8 5b 07 00 00       	call   1019f0 <pic_init>
        if (using_apic)
  101295:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
  10129c:	84 c0                	test   %al,%al
  10129e:	74 cb                	je     10126b <intr_init+0x6b>
            ioapic_init();
  1012a0:	e8 8b 18 00 00       	call   102b30 <ioapic_init>
        SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);
  1012a5:	c7 c0 4e 22 10 00    	mov    $0x10224e,%eax
  1012ab:	8d 35 8c 60 04 00    	lea    0x4608c,%esi
  1012b1:	8d 8b 8c 60 04 00    	lea    0x4608c(%ebx),%ecx
  1012b7:	89 c2                	mov    %eax,%edx
  1012b9:	89 44 24 08          	mov    %eax,0x8(%esp)
  1012bd:	89 c7                	mov    %eax,%edi
    for (i = 0; i < sizeof(idt) / sizeof(idt[0]); i++)
  1012bf:	31 c0                	xor    %eax,%eax
        SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);
  1012c1:	c1 ea 10             	shr    $0x10,%edx
  1012c4:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1012c8:	89 d5                	mov    %edx,%ebp
  1012ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1012d0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  1012d7:	66 89 3c c1          	mov    %di,(%ecx,%eax,8)
    for (i = 0; i < sizeof(idt) / sizeof(idt[0]); i++)
  1012db:	83 c0 01             	add    $0x1,%eax
        SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);
  1012de:	c7 84 13 8e 60 04 00 	movl   $0x8e000008,0x4608e(%ebx,%edx,1)
  1012e5:	08 00 00 8e 
  1012e9:	01 da                	add    %ebx,%edx
  1012eb:	66 89 6c 16 06       	mov    %bp,0x6(%esi,%edx,1)
    for (i = 0; i < sizeof(idt) / sizeof(idt[0]); i++)
  1012f0:	3d 00 01 00 00       	cmp    $0x100,%eax
  1012f5:	75 d9                	jne    1012d0 <intr_init+0xd0>
    SETGATE(idt[T_DIVIDE],                  0, CPU_GDT_KCODE, &Xdivide,         0);
  1012f7:	c7 c0 40 21 10 00    	mov    $0x102140,%eax
  1012fd:	8b 54 24 0c          	mov    0xc(%esp),%edx
  101301:	c7 83 8e 60 04 00 08 	movl   $0x8e000008,0x4608e(%ebx)
  101308:	00 00 8e 
    SETGATE(idt[T_FPERR],                   0, CPU_GDT_KCODE, &Xfperr,          0);
  10130b:	b9 08 00 00 00       	mov    $0x8,%ecx
    SETGATE(idt[T_DEBUG],                   0, CPU_GDT_KCODE, &Xdebug,          0);
  101310:	c7 83 96 60 04 00 08 	movl   $0x8e000008,0x46096(%ebx)
  101317:	00 00 8e 
    SETGATE(idt[T_FPERR],                   0, CPU_GDT_KCODE, &Xfperr,          0);
  10131a:	be 00 8e ff ff       	mov    $0xffff8e00,%esi
    SETGATE(idt[T_DIVIDE],                  0, CPU_GDT_KCODE, &Xdivide,         0);
  10131f:	66 89 83 8c 60 04 00 	mov    %ax,0x4608c(%ebx)
  101326:	c1 e8 10             	shr    $0x10,%eax
  101329:	66 89 83 92 60 04 00 	mov    %ax,0x46092(%ebx)
    SETGATE(idt[T_DEBUG],                   0, CPU_GDT_KCODE, &Xdebug,          0);
  101330:	c7 c0 4a 21 10 00    	mov    $0x10214a,%eax
    SETGATE(idt[T_NMI],                     0, CPU_GDT_KCODE, &Xnmi,            0);
  101336:	c7 83 9e 60 04 00 08 	movl   $0x8e000008,0x4609e(%ebx)
  10133d:	00 00 8e 
    SETGATE(idt[T_DEBUG],                   0, CPU_GDT_KCODE, &Xdebug,          0);
  101340:	66 89 83 94 60 04 00 	mov    %ax,0x46094(%ebx)
  101347:	c1 e8 10             	shr    $0x10,%eax
  10134a:	66 89 83 9a 60 04 00 	mov    %ax,0x4609a(%ebx)
    SETGATE(idt[T_NMI],                     0, CPU_GDT_KCODE, &Xnmi,            0);
  101351:	c7 c0 54 21 10 00    	mov    $0x102154,%eax
    SETGATE(idt[T_BRKPT],                   0, CPU_GDT_KCODE, &Xbrkpt,          3);
  101357:	c7 83 a6 60 04 00 08 	movl   $0xee000008,0x460a6(%ebx)
  10135e:	00 00 ee 
    SETGATE(idt[T_NMI],                     0, CPU_GDT_KCODE, &Xnmi,            0);
  101361:	66 89 83 9c 60 04 00 	mov    %ax,0x4609c(%ebx)
  101368:	c1 e8 10             	shr    $0x10,%eax
  10136b:	66 89 83 a2 60 04 00 	mov    %ax,0x460a2(%ebx)
    SETGATE(idt[T_BRKPT],                   0, CPU_GDT_KCODE, &Xbrkpt,          3);
  101372:	c7 c0 5e 21 10 00    	mov    $0x10215e,%eax
    SETGATE(idt[T_OFLOW],                   0, CPU_GDT_KCODE, &Xoflow,          3);
  101378:	c7 83 ae 60 04 00 08 	movl   $0xee000008,0x460ae(%ebx)
  10137f:	00 00 ee 
    SETGATE(idt[T_BRKPT],                   0, CPU_GDT_KCODE, &Xbrkpt,          3);
  101382:	66 89 83 a4 60 04 00 	mov    %ax,0x460a4(%ebx)
  101389:	c1 e8 10             	shr    $0x10,%eax
  10138c:	66 89 83 aa 60 04 00 	mov    %ax,0x460aa(%ebx)
    SETGATE(idt[T_OFLOW],                   0, CPU_GDT_KCODE, &Xoflow,          3);
  101393:	c7 c0 68 21 10 00    	mov    $0x102168,%eax
    SETGATE(idt[T_BOUND],                   0, CPU_GDT_KCODE, &Xbound,          0);
  101399:	c7 83 b6 60 04 00 08 	movl   $0x8e000008,0x460b6(%ebx)
  1013a0:	00 00 8e 
    SETGATE(idt[T_OFLOW],                   0, CPU_GDT_KCODE, &Xoflow,          3);
  1013a3:	66 89 83 ac 60 04 00 	mov    %ax,0x460ac(%ebx)
  1013aa:	c1 e8 10             	shr    $0x10,%eax
  1013ad:	66 89 83 b2 60 04 00 	mov    %ax,0x460b2(%ebx)
    SETGATE(idt[T_BOUND],                   0, CPU_GDT_KCODE, &Xbound,          0);
  1013b4:	c7 c0 72 21 10 00    	mov    $0x102172,%eax
    SETGATE(idt[T_ILLOP],                   0, CPU_GDT_KCODE, &Xillop,          0);
  1013ba:	c7 83 be 60 04 00 08 	movl   $0x8e000008,0x460be(%ebx)
  1013c1:	00 00 8e 
    SETGATE(idt[T_BOUND],                   0, CPU_GDT_KCODE, &Xbound,          0);
  1013c4:	66 89 83 b4 60 04 00 	mov    %ax,0x460b4(%ebx)
  1013cb:	c1 e8 10             	shr    $0x10,%eax
  1013ce:	66 89 83 ba 60 04 00 	mov    %ax,0x460ba(%ebx)
    SETGATE(idt[T_ILLOP],                   0, CPU_GDT_KCODE, &Xillop,          0);
  1013d5:	c7 c0 7c 21 10 00    	mov    $0x10217c,%eax
    SETGATE(idt[T_DEVICE],                  0, CPU_GDT_KCODE, &Xdevice,         0);
  1013db:	c7 83 c6 60 04 00 08 	movl   $0x8e000008,0x460c6(%ebx)
  1013e2:	00 00 8e 
    SETGATE(idt[T_ILLOP],                   0, CPU_GDT_KCODE, &Xillop,          0);
  1013e5:	66 89 83 bc 60 04 00 	mov    %ax,0x460bc(%ebx)
  1013ec:	c1 e8 10             	shr    $0x10,%eax
  1013ef:	66 89 83 c2 60 04 00 	mov    %ax,0x460c2(%ebx)
    SETGATE(idt[T_DEVICE],                  0, CPU_GDT_KCODE, &Xdevice,         0);
  1013f6:	c7 c0 86 21 10 00    	mov    $0x102186,%eax
  1013fc:	66 89 83 c4 60 04 00 	mov    %ax,0x460c4(%ebx)
  101403:	c1 e8 10             	shr    $0x10,%eax
  101406:	66 89 83 ca 60 04 00 	mov    %ax,0x460ca(%ebx)
    SETGATE(idt[T_DBLFLT],                  0, CPU_GDT_KCODE, &Xdblflt,         0);
  10140d:	c7 c0 90 21 10 00    	mov    $0x102190,%eax
    SETGATE(idt[T_FPERR],                   0, CPU_GDT_KCODE, &Xfperr,          0);
  101413:	66 89 8b 0e 61 04 00 	mov    %cx,0x4610e(%ebx)
    SETGATE(idt[T_DBLFLT],                  0, CPU_GDT_KCODE, &Xdblflt,         0);
  10141a:	66 89 83 cc 60 04 00 	mov    %ax,0x460cc(%ebx)
  101421:	c1 e8 10             	shr    $0x10,%eax
  101424:	66 89 83 d2 60 04 00 	mov    %ax,0x460d2(%ebx)
    SETGATE(idt[T_TSS],                     0, CPU_GDT_KCODE, &Xtss,            0);
  10142b:	c7 c0 a2 21 10 00    	mov    $0x1021a2,%eax
    SETGATE(idt[T_DBLFLT],                  0, CPU_GDT_KCODE, &Xdblflt,         0);
  101431:	c7 83 ce 60 04 00 08 	movl   $0x8e000008,0x460ce(%ebx)
  101438:	00 00 8e 
    SETGATE(idt[T_TSS],                     0, CPU_GDT_KCODE, &Xtss,            0);
  10143b:	66 89 83 dc 60 04 00 	mov    %ax,0x460dc(%ebx)
  101442:	c1 e8 10             	shr    $0x10,%eax
  101445:	66 89 83 e2 60 04 00 	mov    %ax,0x460e2(%ebx)
    SETGATE(idt[T_SEGNP],                   0, CPU_GDT_KCODE, &Xsegnp,          0);
  10144c:	c7 c0 aa 21 10 00    	mov    $0x1021aa,%eax
    SETGATE(idt[T_TSS],                     0, CPU_GDT_KCODE, &Xtss,            0);
  101452:	c7 83 de 60 04 00 08 	movl   $0x8e000008,0x460de(%ebx)
  101459:	00 00 8e 
    SETGATE(idt[T_SEGNP],                   0, CPU_GDT_KCODE, &Xsegnp,          0);
  10145c:	66 89 83 e4 60 04 00 	mov    %ax,0x460e4(%ebx)
  101463:	c1 e8 10             	shr    $0x10,%eax
  101466:	66 89 83 ea 60 04 00 	mov    %ax,0x460ea(%ebx)
    SETGATE(idt[T_STACK],                   0, CPU_GDT_KCODE, &Xstack,          0);
  10146d:	c7 c0 b2 21 10 00    	mov    $0x1021b2,%eax
    SETGATE(idt[T_SEGNP],                   0, CPU_GDT_KCODE, &Xsegnp,          0);
  101473:	c7 83 e6 60 04 00 08 	movl   $0x8e000008,0x460e6(%ebx)
  10147a:	00 00 8e 
    SETGATE(idt[T_STACK],                   0, CPU_GDT_KCODE, &Xstack,          0);
  10147d:	66 89 83 ec 60 04 00 	mov    %ax,0x460ec(%ebx)
  101484:	c1 e8 10             	shr    $0x10,%eax
  101487:	66 89 83 f2 60 04 00 	mov    %ax,0x460f2(%ebx)
    SETGATE(idt[T_GPFLT],                   0, CPU_GDT_KCODE, &Xgpflt,          0);
  10148e:	c7 c0 ba 21 10 00    	mov    $0x1021ba,%eax
    SETGATE(idt[T_STACK],                   0, CPU_GDT_KCODE, &Xstack,          0);
  101494:	c7 83 ee 60 04 00 08 	movl   $0x8e000008,0x460ee(%ebx)
  10149b:	00 00 8e 
    SETGATE(idt[T_GPFLT],                   0, CPU_GDT_KCODE, &Xgpflt,          0);
  10149e:	66 89 83 f4 60 04 00 	mov    %ax,0x460f4(%ebx)
  1014a5:	c1 e8 10             	shr    $0x10,%eax
  1014a8:	66 89 83 fa 60 04 00 	mov    %ax,0x460fa(%ebx)
    SETGATE(idt[T_PGFLT],                   0, CPU_GDT_KCODE, &Xpgflt,          0);
  1014af:	c7 c0 c2 21 10 00    	mov    $0x1021c2,%eax
    SETGATE(idt[T_GPFLT],                   0, CPU_GDT_KCODE, &Xgpflt,          0);
  1014b5:	c7 83 f6 60 04 00 08 	movl   $0x8e000008,0x460f6(%ebx)
  1014bc:	00 00 8e 
    SETGATE(idt[T_PGFLT],                   0, CPU_GDT_KCODE, &Xpgflt,          0);
  1014bf:	66 89 83 fc 60 04 00 	mov    %ax,0x460fc(%ebx)
  1014c6:	c1 e8 10             	shr    $0x10,%eax
  1014c9:	66 89 83 02 61 04 00 	mov    %ax,0x46102(%ebx)
    SETGATE(idt[T_FPERR],                   0, CPU_GDT_KCODE, &Xfperr,          0);
  1014d0:	c7 c0 d4 21 10 00    	mov    $0x1021d4,%eax
    SETGATE(idt[T_PGFLT],                   0, CPU_GDT_KCODE, &Xpgflt,          0);
  1014d6:	c7 83 fe 60 04 00 08 	movl   $0x8e000008,0x460fe(%ebx)
  1014dd:	00 00 8e 
    SETGATE(idt[T_FPERR],                   0, CPU_GDT_KCODE, &Xfperr,          0);
  1014e0:	66 89 83 0c 61 04 00 	mov    %ax,0x4610c(%ebx)
  1014e7:	c1 e8 10             	shr    $0x10,%eax
  1014ea:	66 89 83 12 61 04 00 	mov    %ax,0x46112(%ebx)
    SETGATE(idt[T_ALIGN],                   0, CPU_GDT_KCODE, &Xalign,          0);
  1014f1:	c7 c0 de 21 10 00    	mov    $0x1021de,%eax
    SETGATE(idt[T_FPERR],                   0, CPU_GDT_KCODE, &Xfperr,          0);
  1014f7:	66 89 b3 10 61 04 00 	mov    %si,0x46110(%ebx)
    SETGATE(idt[T_ALIGN],                   0, CPU_GDT_KCODE, &Xalign,          0);
  1014fe:	66 89 83 14 61 04 00 	mov    %ax,0x46114(%ebx)
  101505:	c1 e8 10             	shr    $0x10,%eax
  101508:	c7 83 16 61 04 00 08 	movl   $0x8e000008,0x46116(%ebx)
  10150f:	00 00 8e 
  101512:	66 89 83 1a 61 04 00 	mov    %ax,0x4611a(%ebx)
    SETGATE(idt[T_MCHK],                    0, CPU_GDT_KCODE, &Xmchk,           0);
  101519:	c7 c0 e2 21 10 00    	mov    $0x1021e2,%eax
  10151f:	c7 83 1e 61 04 00 08 	movl   $0x8e000008,0x4611e(%ebx)
  101526:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL13],     0, CPU_GDT_KCODE, &Xirq_serial1,    0);
  101529:	c7 c1 00 22 10 00    	mov    $0x102200,%ecx
    SETGATE(idt[T_MCHK],                    0, CPU_GDT_KCODE, &Xmchk,           0);
  10152f:	66 89 83 1c 61 04 00 	mov    %ax,0x4611c(%ebx)
  101536:	c1 e8 10             	shr    $0x10,%eax
  101539:	66 89 83 22 61 04 00 	mov    %ax,0x46122(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_TIMER],        0, CPU_GDT_KCODE, &Xirq_timer,      0);
  101540:	c7 c0 e8 21 10 00    	mov    $0x1021e8,%eax
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL13],     0, CPU_GDT_KCODE, &Xirq_serial1,    0);
  101546:	66 89 8b ac 61 04 00 	mov    %cx,0x461ac(%ebx)
  10154d:	c1 e9 10             	shr    $0x10,%ecx
    SETGATE(idt[T_IRQ0 + IRQ_TIMER],        0, CPU_GDT_KCODE, &Xirq_timer,      0);
  101550:	66 89 83 8c 61 04 00 	mov    %ax,0x4618c(%ebx)
  101557:	c1 e8 10             	shr    $0x10,%eax
  10155a:	66 89 83 92 61 04 00 	mov    %ax,0x46192(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_KBD],          0, CPU_GDT_KCODE, &Xirq_kbd,        0);
  101561:	c7 c0 ee 21 10 00    	mov    $0x1021ee,%eax
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL13],     0, CPU_GDT_KCODE, &Xirq_serial1,    0);
  101567:	66 89 8b b2 61 04 00 	mov    %cx,0x461b2(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_KBD],          0, CPU_GDT_KCODE, &Xirq_kbd,        0);
  10156e:	66 89 83 94 61 04 00 	mov    %ax,0x46194(%ebx)
  101575:	c1 e8 10             	shr    $0x10,%eax
  101578:	66 89 83 9a 61 04 00 	mov    %ax,0x4619a(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_SLAVE],        0, CPU_GDT_KCODE, &Xirq_slave,      0);
  10157f:	c7 c0 f4 21 10 00    	mov    $0x1021f4,%eax
    SETGATE(idt[T_IRQ0 + IRQ_TIMER],        0, CPU_GDT_KCODE, &Xirq_timer,      0);
  101585:	c7 83 8e 61 04 00 08 	movl   $0x8e000008,0x4618e(%ebx)
  10158c:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_SLAVE],        0, CPU_GDT_KCODE, &Xirq_slave,      0);
  10158f:	66 89 83 9c 61 04 00 	mov    %ax,0x4619c(%ebx)
  101596:	c1 e8 10             	shr    $0x10,%eax
  101599:	66 89 83 a2 61 04 00 	mov    %ax,0x461a2(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL24],     0, CPU_GDT_KCODE, &Xirq_serial2,    0);
  1015a0:	c7 c0 fa 21 10 00    	mov    $0x1021fa,%eax
    SETGATE(idt[T_IRQ0 + IRQ_KBD],          0, CPU_GDT_KCODE, &Xirq_kbd,        0);
  1015a6:	c7 83 96 61 04 00 08 	movl   $0x8e000008,0x46196(%ebx)
  1015ad:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL24],     0, CPU_GDT_KCODE, &Xirq_serial2,    0);
  1015b0:	66 89 83 a4 61 04 00 	mov    %ax,0x461a4(%ebx)
  1015b7:	c1 e8 10             	shr    $0x10,%eax
  1015ba:	66 89 83 aa 61 04 00 	mov    %ax,0x461aa(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL13],     0, CPU_GDT_KCODE, &Xirq_serial1,    0);
  1015c1:	8b 83 ae 61 04 00    	mov    0x461ae(%ebx),%eax
    SETGATE(idt[T_IRQ0 + IRQ_SLAVE],        0, CPU_GDT_KCODE, &Xirq_slave,      0);
  1015c7:	c7 83 9e 61 04 00 08 	movl   $0x8e000008,0x4619e(%ebx)
  1015ce:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL24],     0, CPU_GDT_KCODE, &Xirq_serial2,    0);
  1015d1:	c7 83 a6 61 04 00 08 	movl   $0x8e000008,0x461a6(%ebx)
  1015d8:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL13],     0, CPU_GDT_KCODE, &Xirq_serial1,    0);
  1015db:	25 00 00 e0 ff       	and    $0xffe00000,%eax
    SETGATE(idt[T_IRQ0 + IRQ_LPT2],         0, CPU_GDT_KCODE, &Xirq_lpt,        0);
  1015e0:	c7 83 b6 61 04 00 08 	movl   $0x8e000008,0x461b6(%ebx)
  1015e7:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_SERIAL13],     0, CPU_GDT_KCODE, &Xirq_serial1,    0);
  1015ea:	83 c8 08             	or     $0x8,%eax
  1015ed:	89 83 ae 61 04 00    	mov    %eax,0x461ae(%ebx)
  1015f3:	0f b7 83 b0 61 04 00 	movzwl 0x461b0(%ebx),%eax
  1015fa:	83 e0 1f             	and    $0x1f,%eax
  1015fd:	66 0d 00 8e          	or     $0x8e00,%ax
  101601:	66 89 83 b0 61 04 00 	mov    %ax,0x461b0(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_LPT2],         0, CPU_GDT_KCODE, &Xirq_lpt,        0);
  101608:	c7 c0 06 22 10 00    	mov    $0x102206,%eax
  10160e:	66 89 83 b4 61 04 00 	mov    %ax,0x461b4(%ebx)
  101615:	c1 e8 10             	shr    $0x10,%eax
  101618:	66 89 83 ba 61 04 00 	mov    %ax,0x461ba(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_FLOPPY],       0, CPU_GDT_KCODE, &Xirq_floppy,     0);
  10161f:	c7 c0 0c 22 10 00    	mov    $0x10220c,%eax
  101625:	66 89 83 bc 61 04 00 	mov    %ax,0x461bc(%ebx)
  10162c:	c1 e8 10             	shr    $0x10,%eax
    SETGATE(idt[T_IRQ0 + 11],               0, CPU_GDT_KCODE, &Xirq11,          0);
  10162f:	c7 c1 2a 22 10 00    	mov    $0x10222a,%ecx
    SETGATE(idt[T_IRQ0 + IRQ_FLOPPY],       0, CPU_GDT_KCODE, &Xirq_floppy,     0);
  101635:	66 89 83 c2 61 04 00 	mov    %ax,0x461c2(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_SPURIOUS],     0, CPU_GDT_KCODE, &Xirq_spurious,   0);
  10163c:	c7 c0 12 22 10 00    	mov    $0x102212,%eax
    SETGATE(idt[T_IRQ0 + 11],               0, CPU_GDT_KCODE, &Xirq11,          0);
  101642:	66 89 8b e4 61 04 00 	mov    %cx,0x461e4(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_SPURIOUS],     0, CPU_GDT_KCODE, &Xirq_spurious,   0);
  101649:	66 89 83 c4 61 04 00 	mov    %ax,0x461c4(%ebx)
  101650:	c1 e8 10             	shr    $0x10,%eax
  101653:	66 89 83 ca 61 04 00 	mov    %ax,0x461ca(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_RTC],          0, CPU_GDT_KCODE, &Xirq_rtc,        0);
  10165a:	c7 c0 18 22 10 00    	mov    $0x102218,%eax
    SETGATE(idt[T_IRQ0 + IRQ_FLOPPY],       0, CPU_GDT_KCODE, &Xirq_floppy,     0);
  101660:	c7 83 be 61 04 00 08 	movl   $0x8e000008,0x461be(%ebx)
  101667:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_RTC],          0, CPU_GDT_KCODE, &Xirq_rtc,        0);
  10166a:	66 89 83 cc 61 04 00 	mov    %ax,0x461cc(%ebx)
  101671:	c1 e8 10             	shr    $0x10,%eax
  101674:	66 89 83 d2 61 04 00 	mov    %ax,0x461d2(%ebx)
    SETGATE(idt[T_IRQ0 + 9],                0, CPU_GDT_KCODE, &Xirq9,           0);
  10167b:	c7 c0 1e 22 10 00    	mov    $0x10221e,%eax
    SETGATE(idt[T_IRQ0 + IRQ_SPURIOUS],     0, CPU_GDT_KCODE, &Xirq_spurious,   0);
  101681:	c7 83 c6 61 04 00 08 	movl   $0x8e000008,0x461c6(%ebx)
  101688:	00 00 8e 
    SETGATE(idt[T_IRQ0 + 9],                0, CPU_GDT_KCODE, &Xirq9,           0);
  10168b:	66 89 83 d4 61 04 00 	mov    %ax,0x461d4(%ebx)
  101692:	c1 e8 10             	shr    $0x10,%eax
  101695:	66 89 83 da 61 04 00 	mov    %ax,0x461da(%ebx)
    SETGATE(idt[T_IRQ0 + 10],               0, CPU_GDT_KCODE, &Xirq10,          0);
  10169c:	c7 c0 24 22 10 00    	mov    $0x102224,%eax
    SETGATE(idt[T_IRQ0 + IRQ_RTC],          0, CPU_GDT_KCODE, &Xirq_rtc,        0);
  1016a2:	c7 83 ce 61 04 00 08 	movl   $0x8e000008,0x461ce(%ebx)
  1016a9:	00 00 8e 
    SETGATE(idt[T_IRQ0 + 10],               0, CPU_GDT_KCODE, &Xirq10,          0);
  1016ac:	66 89 83 dc 61 04 00 	mov    %ax,0x461dc(%ebx)
  1016b3:	c1 e8 10             	shr    $0x10,%eax
  1016b6:	66 89 83 e2 61 04 00 	mov    %ax,0x461e2(%ebx)
    SETGATE(idt[T_IRQ0 + 11],               0, CPU_GDT_KCODE, &Xirq11,          0);
  1016bd:	8b 83 e6 61 04 00    	mov    0x461e6(%ebx),%eax
    SETGATE(idt[T_IRQ0 + 9],                0, CPU_GDT_KCODE, &Xirq9,           0);
  1016c3:	c7 83 d6 61 04 00 08 	movl   $0x8e000008,0x461d6(%ebx)
  1016ca:	00 00 8e 
    SETGATE(idt[T_IRQ0 + 10],               0, CPU_GDT_KCODE, &Xirq10,          0);
  1016cd:	c7 83 de 61 04 00 08 	movl   $0x8e000008,0x461de(%ebx)
  1016d4:	00 00 8e 
    SETGATE(idt[T_IRQ0 + 11],               0, CPU_GDT_KCODE, &Xirq11,          0);
  1016d7:	25 00 00 00 ff       	and    $0xff000000,%eax
  1016dc:	c1 e9 10             	shr    $0x10,%ecx
  1016df:	83 c8 08             	or     $0x8,%eax
  1016e2:	66 89 8b ea 61 04 00 	mov    %cx,0x461ea(%ebx)
  1016e9:	89 83 e6 61 04 00    	mov    %eax,0x461e6(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_MOUSE],        0, CPU_GDT_KCODE, &Xirq_mouse,      0);
  1016ef:	c7 c0 30 22 10 00    	mov    $0x102230,%eax
    SETGATE(idt[T_IRQ0 + 11],               0, CPU_GDT_KCODE, &Xirq11,          0);
  1016f5:	c6 83 e9 61 04 00 8e 	movb   $0x8e,0x461e9(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_MOUSE],        0, CPU_GDT_KCODE, &Xirq_mouse,      0);
  1016fc:	66 89 83 ec 61 04 00 	mov    %ax,0x461ec(%ebx)
  101703:	c1 e8 10             	shr    $0x10,%eax
  101706:	66 89 83 f2 61 04 00 	mov    %ax,0x461f2(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_COPROCESSOR],  0, CPU_GDT_KCODE, &Xirq_coproc,     0);
  10170d:	c7 c0 36 22 10 00    	mov    $0x102236,%eax
    SETGATE(idt[T_IRQ0 + IRQ_MOUSE],        0, CPU_GDT_KCODE, &Xirq_mouse,      0);
  101713:	c7 83 ee 61 04 00 08 	movl   $0x8e000008,0x461ee(%ebx)
  10171a:	00 00 8e 
    SETGATE(idt[T_IRQ0 + IRQ_COPROCESSOR],  0, CPU_GDT_KCODE, &Xirq_coproc,     0);
  10171d:	66 89 83 f4 61 04 00 	mov    %ax,0x461f4(%ebx)
  101724:	c1 e8 10             	shr    $0x10,%eax
  101727:	c7 83 f6 61 04 00 08 	movl   $0x8e000008,0x461f6(%ebx)
  10172e:	00 00 8e 
  101731:	66 89 83 fa 61 04 00 	mov    %ax,0x461fa(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_IDE1],         0, CPU_GDT_KCODE, &Xirq_ide1,       0);
  101738:	c7 c0 3c 22 10 00    	mov    $0x10223c,%eax
  10173e:	c7 83 fe 61 04 00 08 	movl   $0x8e000008,0x461fe(%ebx)
  101745:	00 00 8e 
  101748:	66 89 83 fc 61 04 00 	mov    %ax,0x461fc(%ebx)
  10174f:	c1 e8 10             	shr    $0x10,%eax
  101752:	66 89 83 02 62 04 00 	mov    %ax,0x46202(%ebx)
    SETGATE(idt[T_IRQ0 + IRQ_IDE2],         0, CPU_GDT_KCODE, &Xirq_ide2,       0);
  101759:	c7 c0 42 22 10 00    	mov    $0x102242,%eax
  10175f:	c7 83 06 62 04 00 08 	movl   $0x8e000008,0x46206(%ebx)
  101766:	00 00 8e 
  101769:	66 89 83 04 62 04 00 	mov    %ax,0x46204(%ebx)
  101770:	c1 e8 10             	shr    $0x10,%eax
  101773:	66 89 83 0a 62 04 00 	mov    %ax,0x4620a(%ebx)
    SETGATE(idt[T_SYSCALL], 0, CPU_GDT_KCODE, &Xsyscall, 3);
  10177a:	c7 c0 48 22 10 00    	mov    $0x102248,%eax
  101780:	c7 83 0e 62 04 00 08 	movl   $0xee000008,0x4620e(%ebx)
  101787:	00 00 ee 
  10178a:	66 89 83 0c 62 04 00 	mov    %ax,0x4620c(%ebx)
  101791:	c1 e8 10             	shr    $0x10,%eax
  101794:	66 89 83 12 62 04 00 	mov    %ax,0x46212(%ebx)
    SETGATE(idt[T_DEFAULT], 0, CPU_GDT_KCODE, &Xdefault, 0);
  10179b:	0f b7 44 24 08       	movzwl 0x8(%esp),%eax
  1017a0:	c7 83 7e 68 04 00 08 	movl   $0x8e000008,0x4687e(%ebx)
  1017a7:	00 00 8e 
  1017aa:	66 89 83 7c 68 04 00 	mov    %ax,0x4687c(%ebx)
    if (using_apic)
  1017b1:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
    SETGATE(idt[T_DEFAULT], 0, CPU_GDT_KCODE, &Xdefault, 0);
  1017b8:	66 89 93 82 68 04 00 	mov    %dx,0x46882(%ebx)
    if (using_apic)
  1017bf:	84 c0                	test   %al,%al
  1017c1:	0f 84 b3 fa ff ff    	je     10127a <intr_init+0x7a>
  1017c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1017ce:	00 
  1017cf:	90                   	nop
        lapic_init();
  1017d0:	e8 fb 0d 00 00       	call   1025d0 <lapic_init>
  1017d5:	e9 a0 fa ff ff       	jmp    10127a <intr_init+0x7a>
  1017da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001017e0 <intr_enable>:

void intr_enable(uint8_t irq, int cpunum)
{
  1017e0:	57                   	push   %edi
  1017e1:	56                   	push   %esi
  1017e2:	53                   	push   %ebx
  1017e3:	8b 7c 24 14          	mov    0x14(%esp),%edi
  1017e7:	e8 b6 eb ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1017ec:	81 c3 08 28 01 00    	add    $0x12808,%ebx
  1017f2:	8b 74 24 10          	mov    0x10(%esp),%esi
    KERN_ASSERT(cpunum == 0xff || (0 <= cpunum && cpunum < pcpu_ncpu()));
  1017f6:	81 ff ff 00 00 00    	cmp    $0xff,%edi
  1017fc:	74 62                	je     101860 <intr_enable+0x80>
  1017fe:	85 ff                	test   %edi,%edi
  101800:	78 0d                	js     10180f <intr_enable+0x2f>
  101802:	e8 b9 22 00 00       	call   103ac0 <pcpu_ncpu>
  101807:	39 c7                	cmp    %eax,%edi
  101809:	0f 82 81 00 00 00    	jb     101890 <intr_enable+0xb0>
  10180f:	8d 83 00 7d ff ff    	lea    -0x8300(%ebx),%eax
  101815:	50                   	push   %eax
  101816:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  10181c:	50                   	push   %eax
  10181d:	8d 83 83 71 ff ff    	lea    -0x8e7d(%ebx),%eax
  101823:	6a 7a                	push   $0x7a
  101825:	50                   	push   %eax
  101826:	e8 b5 2f 00 00       	call   1047e0 <debug_panic>

    if (irq >= 24)
  10182b:	89 f0                	mov    %esi,%eax
  10182d:	83 c4 10             	add    $0x10,%esp
  101830:	3c 17                	cmp    $0x17,%al
  101832:	77 22                	ja     101856 <intr_enable+0x76>
        return;

    if (using_apic == TRUE) {
  101834:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
  10183b:	3c 01                	cmp    $0x1,%al
  10183d:	74 62                	je     1018a1 <intr_enable+0xc1>
        ioapic_enable(irq, (cpunum == 0xff) ?  0xff : pcpu_cpu_lapicid(cpunum), 0, 0);
    } else {
        KERN_ASSERT(irq < 16);
  10183f:	89 f0                	mov    %esi,%eax
  101841:	3c 0f                	cmp    $0xf,%al
  101843:	77 73                	ja     1018b8 <intr_enable+0xd8>
        pic_enable(irq);
  101845:	89 f0                	mov    %esi,%eax
  101847:	83 ec 0c             	sub    $0xc,%esp
  10184a:	0f b6 f0             	movzbl %al,%esi
  10184d:	56                   	push   %esi
  10184e:	e8 dd 02 00 00       	call   101b30 <pic_enable>
  101853:	83 c4 10             	add    $0x10,%esp
    }
}
  101856:	5b                   	pop    %ebx
  101857:	5e                   	pop    %esi
  101858:	5f                   	pop    %edi
  101859:	c3                   	ret
  10185a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (irq >= 24)
  101860:	89 f0                	mov    %esi,%eax
  101862:	3c 17                	cmp    $0x17,%al
  101864:	77 f0                	ja     101856 <intr_enable+0x76>
    if (using_apic == TRUE) {
  101866:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
  10186d:	3c 01                	cmp    $0x1,%al
  10186f:	75 ce                	jne    10183f <intr_enable+0x5f>
        ioapic_enable(irq, (cpunum == 0xff) ?  0xff : pcpu_cpu_lapicid(cpunum), 0, 0);
  101871:	89 f0                	mov    %esi,%eax
  101873:	6a 00                	push   $0x0
  101875:	0f b6 f0             	movzbl %al,%esi
  101878:	6a 00                	push   $0x0
  10187a:	57                   	push   %edi
  10187b:	56                   	push   %esi
  10187c:	e8 ff 13 00 00       	call   102c80 <ioapic_enable>
  101881:	83 c4 10             	add    $0x10,%esp
}
  101884:	5b                   	pop    %ebx
  101885:	5e                   	pop    %esi
  101886:	5f                   	pop    %edi
  101887:	c3                   	ret
  101888:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10188f:	00 
    if (irq >= 24)
  101890:	89 f0                	mov    %esi,%eax
  101892:	3c 17                	cmp    $0x17,%al
  101894:	77 c0                	ja     101856 <intr_enable+0x76>
    if (using_apic == TRUE) {
  101896:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
  10189d:	3c 01                	cmp    $0x1,%al
  10189f:	75 9e                	jne    10183f <intr_enable+0x5f>
        ioapic_enable(irq, (cpunum == 0xff) ?  0xff : pcpu_cpu_lapicid(cpunum), 0, 0);
  1018a1:	83 ec 0c             	sub    $0xc,%esp
  1018a4:	57                   	push   %edi
  1018a5:	e8 a6 22 00 00       	call   103b50 <pcpu_cpu_lapicid>
  1018aa:	83 c4 10             	add    $0x10,%esp
  1018ad:	0f b6 f8             	movzbl %al,%edi
  1018b0:	eb bf                	jmp    101871 <intr_enable+0x91>
  1018b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        KERN_ASSERT(irq < 16);
  1018b8:	8d 83 93 71 ff ff    	lea    -0x8e6d(%ebx),%eax
  1018be:	50                   	push   %eax
  1018bf:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  1018c5:	50                   	push   %eax
  1018c6:	8d 83 83 71 ff ff    	lea    -0x8e7d(%ebx),%eax
  1018cc:	68 82 00 00 00       	push   $0x82
  1018d1:	50                   	push   %eax
  1018d2:	e8 09 2f 00 00       	call   1047e0 <debug_panic>
  1018d7:	83 c4 10             	add    $0x10,%esp
  1018da:	e9 66 ff ff ff       	jmp    101845 <intr_enable+0x65>
  1018df:	90                   	nop

001018e0 <intr_enable_lapicid>:

void intr_enable_lapicid(uint8_t irq, int lapic_id)
{
  1018e0:	56                   	push   %esi
  1018e1:	53                   	push   %ebx
  1018e2:	e8 bb ea ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1018e7:	81 c3 0d 27 01 00    	add    $0x1270d,%ebx
  1018ed:	83 ec 04             	sub    $0x4,%esp
  1018f0:	8b 44 24 10          	mov    0x10(%esp),%eax
    if (irq > 24)
  1018f4:	3c 18                	cmp    $0x18,%al
  1018f6:	77 1f                	ja     101917 <intr_enable_lapicid+0x37>
        return;

    if (using_apic == TRUE) {
  1018f8:	0f b6 93 8c 68 04 00 	movzbl 0x4688c(%ebx),%edx
        ioapic_enable(irq, (lapic_id == 0xff) ?  0xff : lapic_id, 0, 0);
  1018ff:	0f b6 f0             	movzbl %al,%esi
    if (using_apic == TRUE) {
  101902:	80 fa 01             	cmp    $0x1,%dl
  101905:	74 41                	je     101948 <intr_enable_lapicid+0x68>
    } else {
        KERN_ASSERT(irq < 16);
  101907:	3c 0f                	cmp    $0xf,%al
  101909:	77 15                	ja     101920 <intr_enable_lapicid+0x40>
        pic_enable(irq);
  10190b:	83 ec 0c             	sub    $0xc,%esp
  10190e:	56                   	push   %esi
  10190f:	e8 1c 02 00 00       	call   101b30 <pic_enable>
  101914:	83 c4 10             	add    $0x10,%esp
    }
}
  101917:	83 c4 04             	add    $0x4,%esp
  10191a:	5b                   	pop    %ebx
  10191b:	5e                   	pop    %esi
  10191c:	c3                   	ret
  10191d:	8d 76 00             	lea    0x0(%esi),%esi
        KERN_ASSERT(irq < 16);
  101920:	8d 83 93 71 ff ff    	lea    -0x8e6d(%ebx),%eax
  101926:	50                   	push   %eax
  101927:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  10192d:	50                   	push   %eax
  10192e:	8d 83 83 71 ff ff    	lea    -0x8e7d(%ebx),%eax
  101934:	68 8f 00 00 00       	push   $0x8f
  101939:	50                   	push   %eax
  10193a:	e8 a1 2e 00 00       	call   1047e0 <debug_panic>
  10193f:	83 c4 10             	add    $0x10,%esp
  101942:	eb c7                	jmp    10190b <intr_enable_lapicid+0x2b>
  101944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ioapic_enable(irq, (lapic_id == 0xff) ?  0xff : lapic_id, 0, 0);
  101948:	6a 00                	push   $0x0
  10194a:	6a 00                	push   $0x0
  10194c:	0f b6 44 24 1c       	movzbl 0x1c(%esp),%eax
  101951:	50                   	push   %eax
  101952:	56                   	push   %esi
  101953:	e8 28 13 00 00       	call   102c80 <ioapic_enable>
  101958:	83 c4 10             	add    $0x10,%esp
}
  10195b:	83 c4 04             	add    $0x4,%esp
  10195e:	5b                   	pop    %ebx
  10195f:	5e                   	pop    %esi
  101960:	c3                   	ret
  101961:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101968:	00 
  101969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101970 <intr_eoi>:

void intr_eoi(void)
{
  101970:	53                   	push   %ebx
  101971:	e8 2c ea ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101976:	81 c3 7e 26 01 00    	add    $0x1267e,%ebx
  10197c:	83 ec 08             	sub    $0x8,%esp
    if (using_apic == TRUE)
  10197f:	0f b6 83 8c 68 04 00 	movzbl 0x4688c(%ebx),%eax
  101986:	3c 01                	cmp    $0x1,%al
  101988:	74 0e                	je     101998 <intr_eoi+0x28>
        lapic_eoi();
    else
        pic_eoi();
  10198a:	e8 f1 01 00 00       	call   101b80 <pic_eoi>
}
  10198f:	83 c4 08             	add    $0x8,%esp
  101992:	5b                   	pop    %ebx
  101993:	c3                   	ret
  101994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        lapic_eoi();
  101998:	e8 23 0f 00 00       	call   1028c0 <lapic_eoi>
}
  10199d:	83 c4 08             	add    $0x8,%esp
  1019a0:	5b                   	pop    %ebx
  1019a1:	c3                   	ret
  1019a2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1019a9:	00 
  1019aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001019b0 <intr_local_enable>:

void intr_local_enable(void)
{
  1019b0:	53                   	push   %ebx
  1019b1:	e8 ec e9 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1019b6:	81 c3 3e 26 01 00    	add    $0x1263e,%ebx
  1019bc:	83 ec 08             	sub    $0x8,%esp
    sti();
  1019bf:	e8 2c 3a 00 00       	call   1053f0 <sti>
}
  1019c4:	83 c4 08             	add    $0x8,%esp
  1019c7:	5b                   	pop    %ebx
  1019c8:	c3                   	ret
  1019c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001019d0 <intr_local_disable>:

void intr_local_disable(void)
{
  1019d0:	53                   	push   %ebx
  1019d1:	e8 cc e9 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1019d6:	81 c3 1e 26 01 00    	add    $0x1261e,%ebx
  1019dc:	83 ec 08             	sub    $0x8,%esp
    cli();
  1019df:	e8 fc 39 00 00       	call   1053e0 <cli>
}
  1019e4:	83 c4 08             	add    $0x8,%esp
  1019e7:	5b                   	pop    %ebx
  1019e8:	c3                   	ret
  1019e9:	66 90                	xchg   %ax,%ax
  1019eb:	66 90                	xchg   %ax,%ax
  1019ed:	66 90                	xchg   %ax,%ax
  1019ef:	90                   	nop

001019f0 <pic_init>:
static uint16_t irqmask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool pic_inited = FALSE;

/* Initialize the 8259A interrupt controllers. */
void pic_init(void)
{
  1019f0:	53                   	push   %ebx
  1019f1:	e8 ac e9 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1019f6:	81 c3 fe 25 01 00    	add    $0x125fe,%ebx
  1019fc:	83 ec 08             	sub    $0x8,%esp
    if (pic_inited == TRUE)  // only do once on bootstrap CPU
  1019ff:	80 bb 8d 68 04 00 01 	cmpb   $0x1,0x4688d(%ebx)
  101a06:	0f 84 df 00 00 00    	je     101aeb <pic_init+0xfb>
        return;
    pic_inited = TRUE;

    /* mask all interrupts */
    outb(IO_PIC1 + 1, 0xff);
  101a0c:	83 ec 08             	sub    $0x8,%esp
    pic_inited = TRUE;
  101a0f:	c6 83 8d 68 04 00 01 	movb   $0x1,0x4688d(%ebx)
    outb(IO_PIC1 + 1, 0xff);
  101a16:	68 ff 00 00 00       	push   $0xff
  101a1b:	6a 21                	push   $0x21
  101a1d:	e8 fe 3b 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, 0xff);
  101a22:	58                   	pop    %eax
  101a23:	5a                   	pop    %edx
  101a24:	68 ff 00 00 00       	push   $0xff
  101a29:	68 a1 00 00 00       	push   $0xa1
  101a2e:	e8 ed 3b 00 00       	call   105620 <outb>

    // ICW1:  0001g0hi
    //    g:  0 = edge triggering, 1 = level triggering
    //    h:  0 = cascaded PICs, 1 = master only
    //    i:  0 = no ICW4, 1 = ICW4 required
    outb(IO_PIC1, 0x11);
  101a33:	59                   	pop    %ecx
  101a34:	58                   	pop    %eax
  101a35:	6a 11                	push   $0x11
  101a37:	6a 20                	push   $0x20
  101a39:	e8 e2 3b 00 00       	call   105620 <outb>

    // ICW2:  Vector offset
    outb(IO_PIC1 + 1, T_IRQ0);
  101a3e:	58                   	pop    %eax
  101a3f:	5a                   	pop    %edx
  101a40:	6a 20                	push   $0x20
  101a42:	6a 21                	push   $0x21
  101a44:	e8 d7 3b 00 00       	call   105620 <outb>

    // ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
    //        3-bit No of IR line at which slave connects to master (slave PIC).
    outb(IO_PIC1 + 1, 1 << IRQ_SLAVE);
  101a49:	59                   	pop    %ecx
  101a4a:	58                   	pop    %eax
  101a4b:	6a 04                	push   $0x4
  101a4d:	6a 21                	push   $0x21
  101a4f:	e8 cc 3b 00 00       	call   105620 <outb>
    //    m:  0 = slave PIC, 1 = master PIC
    //        (ignored when b is 0, as the master/slave role
    //        can be hardwired).
    //    a:  1 = Automatic EOI mode
    //    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
    outb(IO_PIC1 + 1, 0x1);
  101a54:	58                   	pop    %eax
  101a55:	5a                   	pop    %edx
  101a56:	6a 01                	push   $0x1
  101a58:	6a 21                	push   $0x21
  101a5a:	e8 c1 3b 00 00       	call   105620 <outb>

    // Set up slave (8259A-2)
    outb(IO_PIC2, 0x11);            // ICW1
  101a5f:	59                   	pop    %ecx
  101a60:	58                   	pop    %eax
  101a61:	6a 11                	push   $0x11
  101a63:	68 a0 00 00 00       	push   $0xa0
  101a68:	e8 b3 3b 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, T_IRQ0 + 8);  // ICW2
  101a6d:	58                   	pop    %eax
  101a6e:	5a                   	pop    %edx
  101a6f:	6a 28                	push   $0x28
  101a71:	68 a1 00 00 00       	push   $0xa1
  101a76:	e8 a5 3b 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, IRQ_SLAVE);   // ICW3
  101a7b:	59                   	pop    %ecx
  101a7c:	58                   	pop    %eax
  101a7d:	6a 02                	push   $0x2
  101a7f:	68 a1 00 00 00       	push   $0xa1
  101a84:	e8 97 3b 00 00       	call   105620 <outb>
    // NB Automatic EOI mode doesn't tend to work on the slave.
    // Linux source code says it's "to be investigated".
    outb(IO_PIC2 + 1, 0x01);        // ICW4
  101a89:	58                   	pop    %eax
  101a8a:	5a                   	pop    %edx
  101a8b:	6a 01                	push   $0x1
  101a8d:	68 a1 00 00 00       	push   $0xa1
  101a92:	e8 89 3b 00 00       	call   105620 <outb>

    // OCW3:  0ef01prs
    //   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
    //    p:  0 = no polling, 1 = polling mode
    //   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
    outb(IO_PIC1, 0x68);  /* clear specific mask */
  101a97:	59                   	pop    %ecx
  101a98:	58                   	pop    %eax
  101a99:	6a 68                	push   $0x68
  101a9b:	6a 20                	push   $0x20
  101a9d:	e8 7e 3b 00 00       	call   105620 <outb>
    outb(IO_PIC1, 0x0a);  /* read IRR by default */
  101aa2:	58                   	pop    %eax
  101aa3:	5a                   	pop    %edx
  101aa4:	6a 0a                	push   $0xa
  101aa6:	6a 20                	push   $0x20
  101aa8:	e8 73 3b 00 00       	call   105620 <outb>

    outb(IO_PIC2, 0x68);  /* OCW3 */
  101aad:	59                   	pop    %ecx
  101aae:	58                   	pop    %eax
  101aaf:	6a 68                	push   $0x68
  101ab1:	68 a0 00 00 00       	push   $0xa0
  101ab6:	e8 65 3b 00 00       	call   105620 <outb>
    outb(IO_PIC2, 0x0a);  /* OCW3 */
  101abb:	58                   	pop    %eax
  101abc:	5a                   	pop    %edx
  101abd:	6a 0a                	push   $0xa
  101abf:	68 a0 00 00 00       	push   $0xa0
  101ac4:	e8 57 3b 00 00       	call   105620 <outb>

    // mask all interrupts
    outb(IO_PIC1 + 1, 0xFF);
  101ac9:	59                   	pop    %ecx
  101aca:	58                   	pop    %eax
  101acb:	68 ff 00 00 00       	push   $0xff
  101ad0:	6a 21                	push   $0x21
  101ad2:	e8 49 3b 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, 0xFF);
  101ad7:	58                   	pop    %eax
  101ad8:	5a                   	pop    %edx
  101ad9:	68 ff 00 00 00       	push   $0xff
  101ade:	68 a1 00 00 00       	push   $0xa1
  101ae3:	e8 38 3b 00 00       	call   105620 <outb>
  101ae8:	83 c4 10             	add    $0x10,%esp
}
  101aeb:	83 c4 08             	add    $0x8,%esp
  101aee:	5b                   	pop    %ebx
  101aef:	c3                   	ret

00101af0 <pic_setmask>:

void pic_setmask(uint16_t mask)
{
  101af0:	56                   	push   %esi
  101af1:	53                   	push   %ebx
  101af2:	e8 ab e8 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101af7:	81 c3 fd 24 01 00    	add    $0x124fd,%ebx
  101afd:	83 ec 0c             	sub    $0xc,%esp
  101b00:	8b 74 24 18          	mov    0x18(%esp),%esi
    irqmask = mask;
    outb(IO_PIC1 + 1, (char) mask);
  101b04:	89 f0                	mov    %esi,%eax
  101b06:	0f b6 c0             	movzbl %al,%eax
    irqmask = mask;
  101b09:	66 89 b3 12 03 00 00 	mov    %si,0x312(%ebx)
    outb(IO_PIC1 + 1, (char) mask);
  101b10:	50                   	push   %eax
  101b11:	6a 21                	push   $0x21
  101b13:	e8 08 3b 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, (char) (mask >> 8));
  101b18:	58                   	pop    %eax
  101b19:	89 f0                	mov    %esi,%eax
  101b1b:	5a                   	pop    %edx
  101b1c:	0f b6 f4             	movzbl %ah,%esi
  101b1f:	56                   	push   %esi
  101b20:	68 a1 00 00 00       	push   $0xa1
  101b25:	e8 f6 3a 00 00       	call   105620 <outb>
}
  101b2a:	83 c4 14             	add    $0x14,%esp
  101b2d:	5b                   	pop    %ebx
  101b2e:	5e                   	pop    %esi
  101b2f:	c3                   	ret

00101b30 <pic_enable>:

void pic_enable(int irq)
{
  101b30:	56                   	push   %esi
  101b31:	53                   	push   %ebx
  101b32:	e8 6b e8 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101b37:	81 c3 bd 24 01 00    	add    $0x124bd,%ebx
  101b3d:	83 ec 0c             	sub    $0xc,%esp
    pic_setmask(irqmask & ~(1 << irq));
  101b40:	8b 44 24 18          	mov    0x18(%esp),%eax
  101b44:	0f b7 b3 12 03 00 00 	movzwl 0x312(%ebx),%esi
  101b4b:	0f b3 c6             	btr    %eax,%esi
    outb(IO_PIC1 + 1, (char) mask);
  101b4e:	89 f0                	mov    %esi,%eax
    irqmask = mask;
  101b50:	66 89 b3 12 03 00 00 	mov    %si,0x312(%ebx)
    outb(IO_PIC1 + 1, (char) mask);
  101b57:	0f b6 c0             	movzbl %al,%eax
  101b5a:	50                   	push   %eax
  101b5b:	6a 21                	push   $0x21
  101b5d:	e8 be 3a 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, (char) (mask >> 8));
  101b62:	58                   	pop    %eax
  101b63:	89 f0                	mov    %esi,%eax
  101b65:	5a                   	pop    %edx
  101b66:	0f b6 f4             	movzbl %ah,%esi
  101b69:	56                   	push   %esi
  101b6a:	68 a1 00 00 00       	push   $0xa1
  101b6f:	e8 ac 3a 00 00       	call   105620 <outb>
}
  101b74:	83 c4 14             	add    $0x14,%esp
  101b77:	5b                   	pop    %ebx
  101b78:	5e                   	pop    %esi
  101b79:	c3                   	ret
  101b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00101b80 <pic_eoi>:

void pic_eoi(void)
{
  101b80:	53                   	push   %ebx
  101b81:	e8 1c e8 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101b86:	81 c3 6e 24 01 00    	add    $0x1246e,%ebx
  101b8c:	83 ec 10             	sub    $0x10,%esp
    // OCW2: rse00xxx
    //   r: rotate
    //   s: specific
    //   e: end-of-interrupt
    // xxx: specific interrupt line
    outb(IO_PIC1, 0x20);
  101b8f:	6a 20                	push   $0x20
  101b91:	6a 20                	push   $0x20
  101b93:	e8 88 3a 00 00       	call   105620 <outb>
    outb(IO_PIC2, 0x20);
  101b98:	58                   	pop    %eax
  101b99:	5a                   	pop    %edx
  101b9a:	6a 20                	push   $0x20
  101b9c:	68 a0 00 00 00       	push   $0xa0
  101ba1:	e8 7a 3a 00 00       	call   105620 <outb>
}
  101ba6:	83 c4 18             	add    $0x18,%esp
  101ba9:	5b                   	pop    %ebx
  101baa:	c3                   	ret
  101bab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00101bb0 <pic_reset>:

void pic_reset(void)
{
  101bb0:	53                   	push   %ebx
  101bb1:	e8 ec e7 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101bb6:	81 c3 3e 24 01 00    	add    $0x1243e,%ebx
  101bbc:	83 ec 10             	sub    $0x10,%esp
    // mask all interrupts
    outb(IO_PIC1 + 1, 0x00);
  101bbf:	6a 00                	push   $0x0
  101bc1:	6a 21                	push   $0x21
  101bc3:	e8 58 3a 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, 0x00);
  101bc8:	58                   	pop    %eax
  101bc9:	5a                   	pop    %edx
  101bca:	6a 00                	push   $0x0
  101bcc:	68 a1 00 00 00       	push   $0xa1
  101bd1:	e8 4a 3a 00 00       	call   105620 <outb>

    // ICW1:  0001g0hi
    //    g:  0 = edge triggering, 1 = level triggering
    //    h:  0 = cascaded PICs, 1 = master only
    //    i:  0 = no ICW4, 1 = ICW4 required
    outb(IO_PIC1, 0x11);
  101bd6:	59                   	pop    %ecx
  101bd7:	58                   	pop    %eax
  101bd8:	6a 11                	push   $0x11
  101bda:	6a 20                	push   $0x20
  101bdc:	e8 3f 3a 00 00       	call   105620 <outb>

    // ICW2:  Vector offset
    outb(IO_PIC1 + 1, T_IRQ0);
  101be1:	58                   	pop    %eax
  101be2:	5a                   	pop    %edx
  101be3:	6a 20                	push   $0x20
  101be5:	6a 21                	push   $0x21
  101be7:	e8 34 3a 00 00       	call   105620 <outb>

    // ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
    //        3-bit No of IR line at which slave connects to master(slave PIC).
    outb(IO_PIC1 + 1, 1 << IRQ_SLAVE);
  101bec:	59                   	pop    %ecx
  101bed:	58                   	pop    %eax
  101bee:	6a 04                	push   $0x4
  101bf0:	6a 21                	push   $0x21
  101bf2:	e8 29 3a 00 00       	call   105620 <outb>
    //    m:  0 = slave PIC, 1 = master PIC
    //        (ignored when b is 0, as the master/slave role
    //        can be hardwired).
    //    a:  1 = Automatic EOI mode
    //    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
    outb(IO_PIC1 + 1, 0x3);
  101bf7:	58                   	pop    %eax
  101bf8:	5a                   	pop    %edx
  101bf9:	6a 03                	push   $0x3
  101bfb:	6a 21                	push   $0x21
  101bfd:	e8 1e 3a 00 00       	call   105620 <outb>

    // Set up slave (8259A-2)
    outb(IO_PIC2, 0x11);            // ICW1
  101c02:	59                   	pop    %ecx
  101c03:	58                   	pop    %eax
  101c04:	6a 11                	push   $0x11
  101c06:	68 a0 00 00 00       	push   $0xa0
  101c0b:	e8 10 3a 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, T_IRQ0 + 8);  // ICW2
  101c10:	58                   	pop    %eax
  101c11:	5a                   	pop    %edx
  101c12:	6a 28                	push   $0x28
  101c14:	68 a1 00 00 00       	push   $0xa1
  101c19:	e8 02 3a 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, IRQ_SLAVE);   // ICW3
  101c1e:	59                   	pop    %ecx
  101c1f:	58                   	pop    %eax
  101c20:	6a 02                	push   $0x2
  101c22:	68 a1 00 00 00       	push   $0xa1
  101c27:	e8 f4 39 00 00       	call   105620 <outb>
    // NB Automatic EOI mode doesn't tend to work on the slave.
    // Linux source code says it's "to be investigated".
    outb(IO_PIC2 + 1, 0x01);        // ICW4
  101c2c:	58                   	pop    %eax
  101c2d:	5a                   	pop    %edx
  101c2e:	6a 01                	push   $0x1
  101c30:	68 a1 00 00 00       	push   $0xa1
  101c35:	e8 e6 39 00 00       	call   105620 <outb>

    // OCW3:  0ef01prs
    //   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
    //    p:  0 = no polling, 1 = polling mode
    //   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
    outb(IO_PIC1, 0x68);  /* clear specific mask */
  101c3a:	59                   	pop    %ecx
  101c3b:	58                   	pop    %eax
  101c3c:	6a 68                	push   $0x68
  101c3e:	6a 20                	push   $0x20
  101c40:	e8 db 39 00 00       	call   105620 <outb>
    outb(IO_PIC1, 0x0a);  /* read IRR by default */
  101c45:	58                   	pop    %eax
  101c46:	5a                   	pop    %edx
  101c47:	6a 0a                	push   $0xa
  101c49:	6a 20                	push   $0x20
  101c4b:	e8 d0 39 00 00       	call   105620 <outb>

    outb(IO_PIC2, 0x68);  /* OCW3 */
  101c50:	59                   	pop    %ecx
  101c51:	58                   	pop    %eax
  101c52:	6a 68                	push   $0x68
  101c54:	68 a0 00 00 00       	push   $0xa0
  101c59:	e8 c2 39 00 00       	call   105620 <outb>
    outb(IO_PIC2, 0x0a);  /* OCW3 */
  101c5e:	58                   	pop    %eax
  101c5f:	5a                   	pop    %edx
  101c60:	6a 0a                	push   $0xa
  101c62:	68 a0 00 00 00       	push   $0xa0
  101c67:	e8 b4 39 00 00       	call   105620 <outb>
}
  101c6c:	83 c4 18             	add    $0x18,%esp
  101c6f:	5b                   	pop    %ebx
  101c70:	c3                   	ret
  101c71:	66 90                	xchg   %ax,%ax
  101c73:	66 90                	xchg   %ax,%ax
  101c75:	66 90                	xchg   %ax,%ax
  101c77:	66 90                	xchg   %ax,%ax
  101c79:	66 90                	xchg   %ax,%ax
  101c7b:	66 90                	xchg   %ax,%ax
  101c7d:	66 90                	xchg   %ax,%ax
  101c7f:	90                   	nop

00101c80 <timer_hw_init>:
#define TIMER_16BIT   0x30  /* r/w counter 16 bits, LSB first */

// Initialize the programmable interval timer.

void timer_hw_init(void)
{
  101c80:	53                   	push   %ebx
  101c81:	e8 1c e7 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101c86:	81 c3 6e 23 01 00    	add    $0x1236e,%ebx
  101c8c:	83 ec 10             	sub    $0x10,%esp
    outb(PIT_CONTROL, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  101c8f:	6a 34                	push   $0x34
  101c91:	6a 43                	push   $0x43
  101c93:	e8 88 39 00 00       	call   105620 <outb>
    outb(PIT_CHANNEL0, LOW8(LATCH));
  101c98:	58                   	pop    %eax
  101c99:	5a                   	pop    %edx
  101c9a:	68 9c 00 00 00       	push   $0x9c
  101c9f:	6a 40                	push   $0x40
  101ca1:	e8 7a 39 00 00       	call   105620 <outb>
    outb(PIT_CHANNEL0, HIGH8(LATCH));
  101ca6:	59                   	pop    %ecx
  101ca7:	58                   	pop    %eax
  101ca8:	6a 2e                	push   $0x2e
  101caa:	6a 40                	push   $0x40
  101cac:	e8 6f 39 00 00       	call   105620 <outb>
}
  101cb1:	83 c4 18             	add    $0x18,%esp
  101cb4:	5b                   	pop    %ebx
  101cb5:	c3                   	ret
  101cb6:	66 90                	xchg   %ax,%ax
  101cb8:	66 90                	xchg   %ax,%ax
  101cba:	66 90                	xchg   %ax,%ax
  101cbc:	66 90                	xchg   %ax,%ax
  101cbe:	66 90                	xchg   %ax,%ax

00101cc0 <tsc_init>:
    delta = t2 - t1;
    return delta / ms;
}

int tsc_init(void)
{
  101cc0:	55                   	push   %ebp
  101cc1:	57                   	push   %edi
  101cc2:	56                   	push   %esi
  101cc3:	53                   	push   %ebx
  101cc4:	e8 d9 e6 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  101cc9:	81 c3 2b 23 01 00    	add    $0x1232b,%ebx
  101ccf:	83 ec 4c             	sub    $0x4c,%esp
    uint64_t ret;
    int i;

    timer_hw_init();
  101cd2:	e8 a9 ff ff ff       	call   101c80 <timer_hw_init>

    tsc_per_ms = 0;
  101cd7:	c7 83 94 68 04 00 00 	movl   $0x0,0x46894(%ebx)
  101cde:	00 00 00 
  101ce1:	c7 83 98 68 04 00 00 	movl   $0x0,0x46898(%ebx)
  101ce8:	00 00 00 

    if (detect_kvm())
  101ceb:	e8 e0 24 00 00       	call   1041d0 <detect_kvm>
  101cf0:	85 c0                	test   %eax,%eax
  101cf2:	0f 85 c6 02 00 00    	jne    101fbe <tsc_init+0x2fe>
  101cf8:	8d 83 5c 7d ff ff    	lea    -0x82a4(%ebx),%eax

    /*
     * XXX: If TSC calibration fails frequently, try to increase the
     *      upper bound of loop condition, e.g. alternating 3 to 10.
     */
    for (i = 0; i < 10; i++) {
  101cfe:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  101d05:	00 
  101d06:	89 44 24 38          	mov    %eax,0x38(%esp)
  101d0a:	8d 83 9c 71 ff ff    	lea    -0x8e64(%ebx),%eax
  101d10:	89 44 24 2c          	mov    %eax,0x2c(%esp)
        ret = tsc_calibrate(CAL_LATCH, CAL_MS, CAL_PIT_LOOPS);
        if (ret != ~(uint64_t) 0x0)
            break;
        KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i + 1);
  101d14:	8d 83 c4 71 ff ff    	lea    -0x8e3c(%ebx),%eax
  101d1a:	89 44 24 3c          	mov    %eax,0x3c(%esp)
  101d1e:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  101d22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  101d28:	83 ec 0c             	sub    $0xc,%esp
  101d2b:	6a 61                	push   $0x61
  101d2d:	8b 5c 24 24          	mov    0x24(%esp),%ebx
  101d31:	e8 ba 38 00 00       	call   1055f0 <inb>
  101d36:	5e                   	pop    %esi
  101d37:	5f                   	pop    %edi
    tscmin = ~(uint64_t) 0x0;
  101d38:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  101d3d:	25 fc 00 00 00       	and    $0xfc,%eax
  101d42:	83 c8 01             	or     $0x1,%eax
  101d45:	50                   	push   %eax
  101d46:	6a 61                	push   $0x61
  101d48:	e8 d3 38 00 00       	call   105620 <outb>
    outb(0x43, 0xb0);
  101d4d:	5d                   	pop    %ebp
  101d4e:	58                   	pop    %eax
  101d4f:	68 b0 00 00 00       	push   $0xb0
  101d54:	6a 43                	push   $0x43
    pitcnt = 0;
  101d56:	31 ed                	xor    %ebp,%ebp
    outb(0x43, 0xb0);
  101d58:	e8 c3 38 00 00       	call   105620 <outb>
    outb(0x42, latch & 0xff);
  101d5d:	58                   	pop    %eax
  101d5e:	5a                   	pop    %edx
  101d5f:	68 9b 00 00 00       	push   $0x9b
  101d64:	6a 42                	push   $0x42
  101d66:	e8 b5 38 00 00       	call   105620 <outb>
    outb(0x42, latch >> 8);
  101d6b:	59                   	pop    %ecx
  101d6c:	5e                   	pop    %esi
  101d6d:	6a 2e                	push   $0x2e
  101d6f:	6a 42                	push   $0x42
    tscmin = ~(uint64_t) 0x0;
  101d71:	be ff ff ff ff       	mov    $0xffffffff,%esi
    outb(0x42, latch >> 8);
  101d76:	e8 a5 38 00 00       	call   105620 <outb>
    tsc = t1 = t2 = rdtsc();
  101d7b:	e8 f0 36 00 00       	call   105470 <rdtsc>
  101d80:	89 44 24 40          	mov    %eax,0x40(%esp)
  101d84:	89 54 24 44          	mov    %edx,0x44(%esp)
    while ((inb(0x61) & 0x20) == 0) {
  101d88:	83 c4 10             	add    $0x10,%esp
    tsc = t1 = t2 = rdtsc();
  101d8b:	89 44 24 18          	mov    %eax,0x18(%esp)
  101d8f:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    tscmax = 0;
  101d93:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  101d9a:	00 
  101d9b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  101da2:	00 
    while ((inb(0x61) & 0x20) == 0) {
  101da3:	eb 63                	jmp    101e08 <tsc_init+0x148>
  101da5:	8d 76 00             	lea    0x0(%esi),%esi
        t2 = rdtsc();
  101da8:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  101dac:	e8 bf 36 00 00       	call   105470 <rdtsc>
        delta = t2 - tsc;
  101db1:	89 c1                	mov    %eax,%ecx
  101db3:	89 d3                	mov    %edx,%ebx
  101db5:	2b 4c 24 18          	sub    0x18(%esp),%ecx
  101db9:	1b 5c 24 1c          	sbb    0x1c(%esp),%ebx
  101dbd:	89 44 24 20          	mov    %eax,0x20(%esp)
        if (delta < tscmin)
  101dc1:	39 f1                	cmp    %esi,%ecx
  101dc3:	89 d8                	mov    %ebx,%eax
  101dc5:	19 f8                	sbb    %edi,%eax
        delta = t2 - tsc;
  101dc7:	89 54 24 24          	mov    %edx,0x24(%esp)
        if (delta > tscmax)
  101dcb:	8b 44 24 08          	mov    0x8(%esp),%eax
  101dcf:	8b 54 24 0c          	mov    0xc(%esp),%edx
        if (delta < tscmin)
  101dd3:	0f 42 f1             	cmovb  %ecx,%esi
  101dd6:	0f 42 fb             	cmovb  %ebx,%edi
        if (delta > tscmax)
  101dd9:	39 c8                	cmp    %ecx,%eax
  101ddb:	89 d0                	mov    %edx,%eax
        tsc = t2;
  101ddd:	8b 54 24 24          	mov    0x24(%esp),%edx
        if (delta > tscmax)
  101de1:	19 d8                	sbb    %ebx,%eax
  101de3:	8b 44 24 08          	mov    0x8(%esp),%eax
        tsc = t2;
  101de7:	89 54 24 1c          	mov    %edx,0x1c(%esp)
        if (delta > tscmax)
  101deb:	0f 42 c1             	cmovb  %ecx,%eax
  101dee:	89 44 24 08          	mov    %eax,0x8(%esp)
  101df2:	89 d8                	mov    %ebx,%eax
  101df4:	0f 43 44 24 0c       	cmovae 0xc(%esp),%eax
        pitcnt++;
  101df9:	83 c5 01             	add    $0x1,%ebp
        if (delta > tscmax)
  101dfc:	89 44 24 0c          	mov    %eax,0xc(%esp)
        tsc = t2;
  101e00:	8b 44 24 20          	mov    0x20(%esp),%eax
  101e04:	89 44 24 18          	mov    %eax,0x18(%esp)
    while ((inb(0x61) & 0x20) == 0) {
  101e08:	83 ec 0c             	sub    $0xc,%esp
  101e0b:	6a 61                	push   $0x61
  101e0d:	8b 5c 24 24          	mov    0x24(%esp),%ebx
  101e11:	e8 da 37 00 00       	call   1055f0 <inb>
  101e16:	83 c4 10             	add    $0x10,%esp
  101e19:	a8 20                	test   $0x20,%al
  101e1b:	74 8b                	je     101da8 <tsc_init+0xe8>
    KERN_DEBUG("pitcnt=%u, tscmin=%llu, tscmax=%llu\n",
  101e1d:	ff 74 24 0c          	push   0xc(%esp)
  101e21:	ff 74 24 0c          	push   0xc(%esp)
  101e25:	57                   	push   %edi
  101e26:	56                   	push   %esi
  101e27:	55                   	push   %ebp
  101e28:	ff 74 24 4c          	push   0x4c(%esp)
  101e2c:	6a 39                	push   $0x39
  101e2e:	ff 74 24 48          	push   0x48(%esp)
  101e32:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  101e36:	e8 45 29 00 00       	call   104780 <debug_normal>
    if (pitcnt < loopmin || tscmax > 10 * tscmin)
  101e3b:	83 c4 20             	add    $0x20,%esp
  101e3e:	81 fd e7 03 00 00    	cmp    $0x3e7,%ebp
  101e44:	0f 8e f6 00 00 00    	jle    101f40 <tsc_init+0x280>
  101e4a:	89 f0                	mov    %esi,%eax
  101e4c:	89 fa                	mov    %edi,%edx
  101e4e:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  101e52:	c1 e0 02             	shl    $0x2,%eax
  101e55:	0f a4 f2 02          	shld   $0x2,%esi,%edx
  101e59:	01 f0                	add    %esi,%eax
  101e5b:	11 fa                	adc    %edi,%edx
  101e5d:	8b 7c 24 08          	mov    0x8(%esp),%edi
  101e61:	0f a4 c2 01          	shld   $0x1,%eax,%edx
  101e65:	01 c0                	add    %eax,%eax
  101e67:	39 f8                	cmp    %edi,%eax
  101e69:	89 d0                	mov    %edx,%eax
  101e6b:	19 e8                	sbb    %ebp,%eax
  101e6d:	0f 82 cd 00 00 00    	jb     101f40 <tsc_init+0x280>
    delta = t2 - t1;
  101e73:	8b 74 24 18          	mov    0x18(%esp),%esi
  101e77:	2b 74 24 30          	sub    0x30(%esp),%esi
    return delta / ms;
  101e7b:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    delta = t2 - t1;
  101e80:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    return delta / ms;
  101e84:	89 f5                	mov    %esi,%ebp
    delta = t2 - t1;
  101e86:	1b 7c 24 34          	sbb    0x34(%esp),%edi
    return delta / ms;
  101e8a:	01 fd                	add    %edi,%ebp
  101e8c:	83 d5 00             	adc    $0x0,%ebp
  101e8f:	89 e8                	mov    %ebp,%eax
  101e91:	f7 e1                	mul    %ecx
  101e93:	89 d0                	mov    %edx,%eax
  101e95:	83 e2 fc             	and    $0xfffffffc,%edx
  101e98:	c1 e8 02             	shr    $0x2,%eax
  101e9b:	01 c2                	add    %eax,%edx
  101e9d:	29 d5                	sub    %edx,%ebp
  101e9f:	29 ee                	sub    %ebp,%esi
  101ea1:	83 df 00             	sbb    $0x0,%edi
  101ea4:	89 74 24 08          	mov    %esi,0x8(%esp)
  101ea8:	69 44 24 08 cc cc cc 	imul   $0xcccccccc,0x8(%esp),%eax
  101eaf:	cc 

        timer_hw_init();
        return 1;
    } else {
        tsc_per_ms = ret;
        KERN_DEBUG("TSC freq = %u.%03u MHz.\n",tsc_per_ms / 1000, tsc_per_ms % 1000);
  101eb0:	83 ec 10             	sub    $0x10,%esp
    return delta / ms;
  101eb3:	89 fa                	mov    %edi,%edx
  101eb5:	69 ff cd cc cc cc    	imul   $0xcccccccd,%edi,%edi
  101ebb:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  101ebf:	01 c7                	add    %eax,%edi
  101ec1:	8b 44 24 18          	mov    0x18(%esp),%eax
        KERN_DEBUG("TSC freq = %u.%03u MHz.\n",tsc_per_ms / 1000, tsc_per_ms % 1000);
  101ec5:	6a 00                	push   $0x0
  101ec7:	68 e8 03 00 00       	push   $0x3e8
    return delta / ms;
  101ecc:	f7 e1                	mul    %ecx
  101ece:	01 fa                	add    %edi,%edx
  101ed0:	0f ac d0 01          	shrd   $0x1,%edx,%eax
  101ed4:	d1 ea                	shr    $1,%edx
        tsc_per_ms = ret;
  101ed6:	89 83 94 68 04 00    	mov    %eax,0x46894(%ebx)
  101edc:	89 93 98 68 04 00    	mov    %edx,0x46898(%ebx)
        KERN_DEBUG("TSC freq = %u.%03u MHz.\n",tsc_per_ms / 1000, tsc_per_ms % 1000);
  101ee2:	8b 83 94 68 04 00    	mov    0x46894(%ebx),%eax
  101ee8:	8b 93 98 68 04 00    	mov    0x46898(%ebx),%edx
  101eee:	8b b3 94 68 04 00    	mov    0x46894(%ebx),%esi
  101ef4:	8b bb 98 68 04 00    	mov    0x46898(%ebx),%edi
  101efa:	52                   	push   %edx
  101efb:	50                   	push   %eax
  101efc:	e8 2f 81 00 00       	call   10a030 <__umoddi3>
  101f01:	83 c4 1c             	add    $0x1c,%esp
  101f04:	52                   	push   %edx
  101f05:	50                   	push   %eax
  101f06:	83 ec 04             	sub    $0x4,%esp
  101f09:	6a 00                	push   $0x0
  101f0b:	68 e8 03 00 00       	push   $0x3e8
  101f10:	57                   	push   %edi
  101f11:	56                   	push   %esi
  101f12:	e8 e9 7f 00 00       	call   109f00 <__udivdi3>
  101f17:	83 c4 14             	add    $0x14,%esp
  101f1a:	52                   	push   %edx
  101f1b:	50                   	push   %eax
  101f1c:	8d 83 ab 71 ff ff    	lea    -0x8e55(%ebx),%eax
  101f22:	50                   	push   %eax
  101f23:	6a 68                	push   $0x68
  101f25:	ff 74 24 48          	push   0x48(%esp)
  101f29:	e8 52 28 00 00       	call   104780 <debug_normal>

        timer_hw_init();
  101f2e:	83 c4 20             	add    $0x20,%esp
  101f31:	e8 4a fd ff ff       	call   101c80 <timer_hw_init>
        return 0;
    }
}
  101f36:	83 c4 4c             	add    $0x4c,%esp
		return (0);
  101f39:	31 c0                	xor    %eax,%eax
}
  101f3b:	5b                   	pop    %ebx
  101f3c:	5e                   	pop    %esi
  101f3d:	5f                   	pop    %edi
  101f3e:	5d                   	pop    %ebp
  101f3f:	c3                   	ret
        KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i + 1);
  101f40:	83 44 24 28 01       	addl   $0x1,0x28(%esp)
  101f45:	8b 7c 24 28          	mov    0x28(%esp),%edi
  101f49:	57                   	push   %edi
  101f4a:	ff 74 24 40          	push   0x40(%esp)
  101f4e:	6a 5c                	push   $0x5c
  101f50:	ff 74 24 38          	push   0x38(%esp)
  101f54:	8b 5c 24 24          	mov    0x24(%esp),%ebx
  101f58:	e8 23 28 00 00       	call   104780 <debug_normal>
    for (i = 0; i < 10; i++) {
  101f5d:	83 c4 10             	add    $0x10,%esp
  101f60:	83 ff 0a             	cmp    $0xa,%edi
  101f63:	0f 85 bf fd ff ff    	jne    101d28 <tsc_init+0x68>
        KERN_DEBUG("TSC calibration failed.\n");
  101f69:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  101f6d:	83 ec 04             	sub    $0x4,%esp
  101f70:	8d 83 e2 71 ff ff    	lea    -0x8e1e(%ebx),%eax
  101f76:	50                   	push   %eax
  101f77:	6a 60                	push   $0x60
  101f79:	8b 7c 24 38          	mov    0x38(%esp),%edi
  101f7d:	57                   	push   %edi
  101f7e:	e8 fd 27 00 00       	call   104780 <debug_normal>
        KERN_DEBUG("Assume TSC freq = 1 GHz.\n");
  101f83:	83 c4 0c             	add    $0xc,%esp
  101f86:	8d 83 fb 71 ff ff    	lea    -0x8e05(%ebx),%eax
  101f8c:	50                   	push   %eax
  101f8d:	6a 61                	push   $0x61
  101f8f:	57                   	push   %edi
  101f90:	e8 eb 27 00 00       	call   104780 <debug_normal>
        tsc_per_ms = 1000000;
  101f95:	c7 83 94 68 04 00 40 	movl   $0xf4240,0x46894(%ebx)
  101f9c:	42 0f 00 
  101f9f:	c7 83 98 68 04 00 00 	movl   $0x0,0x46898(%ebx)
  101fa6:	00 00 00 
        timer_hw_init();
  101fa9:	e8 d2 fc ff ff       	call   101c80 <timer_hw_init>
        return 1;
  101fae:	83 c4 10             	add    $0x10,%esp
  101fb1:	b8 01 00 00 00       	mov    $0x1,%eax
}
  101fb6:	83 c4 4c             	add    $0x4c,%esp
  101fb9:	5b                   	pop    %ebx
  101fba:	5e                   	pop    %esi
  101fbb:	5f                   	pop    %edi
  101fbc:	5d                   	pop    %ebp
  101fbd:	c3                   	ret
		tsc_per_ms = kvm_get_tsc_hz() / 1000llu;
  101fbe:	e8 4d 23 00 00       	call   104310 <kvm_get_tsc_hz>
  101fc3:	6a 00                	push   $0x0
  101fc5:	68 e8 03 00 00       	push   $0x3e8
  101fca:	52                   	push   %edx
  101fcb:	50                   	push   %eax
  101fcc:	e8 2f 7f 00 00       	call   109f00 <__udivdi3>
		KERN_INFO ("TSC read from KVM: %u.%03u MHz.\n",
  101fd1:	6a 00                	push   $0x0
		tsc_per_ms = kvm_get_tsc_hz() / 1000llu;
  101fd3:	89 83 94 68 04 00    	mov    %eax,0x46894(%ebx)
  101fd9:	89 93 98 68 04 00    	mov    %edx,0x46898(%ebx)
		KERN_INFO ("TSC read from KVM: %u.%03u MHz.\n",
  101fdf:	8b 83 94 68 04 00    	mov    0x46894(%ebx),%eax
  101fe5:	8b 93 98 68 04 00    	mov    0x46898(%ebx),%edx
  101feb:	68 e8 03 00 00       	push   $0x3e8
  101ff0:	8b b3 94 68 04 00    	mov    0x46894(%ebx),%esi
  101ff6:	8b bb 98 68 04 00    	mov    0x46898(%ebx),%edi
  101ffc:	52                   	push   %edx
  101ffd:	50                   	push   %eax
  101ffe:	e8 2d 80 00 00       	call   10a030 <__umoddi3>
  102003:	83 c4 14             	add    $0x14,%esp
  102006:	52                   	push   %edx
  102007:	50                   	push   %eax
  102008:	83 ec 0c             	sub    $0xc,%esp
  10200b:	6a 00                	push   $0x0
  10200d:	68 e8 03 00 00       	push   $0x3e8
  102012:	57                   	push   %edi
  102013:	56                   	push   %esi
  102014:	e8 e7 7e 00 00       	call   109f00 <__udivdi3>
  102019:	83 c4 1c             	add    $0x1c,%esp
  10201c:	52                   	push   %edx
  10201d:	50                   	push   %eax
  10201e:	8d 83 38 7d ff ff    	lea    -0x82c8(%ebx),%eax
  102024:	50                   	push   %eax
  102025:	e8 16 27 00 00       	call   104740 <debug_info>
		return (0);
  10202a:	83 c4 20             	add    $0x20,%esp
  10202d:	e9 04 ff ff ff       	jmp    101f36 <tsc_init+0x276>
  102032:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102039:	00 
  10203a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102040 <delay>:

/*
 * Wait for ms millisecond.
 */
void delay(uint32_t ms)
{
  102040:	55                   	push   %ebp
  102041:	e8 b3 f1 ff ff       	call   1011f9 <__x86.get_pc_thunk.bp>
  102046:	81 c5 ae 1f 01 00    	add    $0x11fae,%ebp
  10204c:	57                   	push   %edi
  10204d:	56                   	push   %esi
  10204e:	53                   	push   %ebx
  10204f:	83 ec 1c             	sub    $0x1c,%esp
  102052:	8b 44 24 30          	mov    0x30(%esp),%eax
    volatile uint64_t ticks = tsc_per_ms * ms;
  102056:	8b b5 94 68 04 00    	mov    0x46894(%ebp),%esi
    volatile uint64_t start = rdtsc();
  10205c:	89 eb                	mov    %ebp,%ebx
    volatile uint64_t ticks = tsc_per_ms * ms;
  10205e:	8b 8d 98 68 04 00    	mov    0x46898(%ebp),%ecx
  102064:	0f af c8             	imul   %eax,%ecx
  102067:	f7 e6                	mul    %esi
  102069:	01 ca                	add    %ecx,%edx
  10206b:	89 04 24             	mov    %eax,(%esp)
  10206e:	89 54 24 04          	mov    %edx,0x4(%esp)
    volatile uint64_t start = rdtsc();
  102072:	e8 f9 33 00 00       	call   105470 <rdtsc>
  102077:	89 44 24 08          	mov    %eax,0x8(%esp)
  10207b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    while (rdtsc() < start + ticks);
  10207f:	90                   	nop
  102080:	89 eb                	mov    %ebp,%ebx
  102082:	e8 e9 33 00 00       	call   105470 <rdtsc>
  102087:	89 c3                	mov    %eax,%ebx
  102089:	89 d1                	mov    %edx,%ecx
  10208b:	8b 44 24 08          	mov    0x8(%esp),%eax
  10208f:	8b 54 24 0c          	mov    0xc(%esp),%edx
  102093:	8b 34 24             	mov    (%esp),%esi
  102096:	8b 7c 24 04          	mov    0x4(%esp),%edi
  10209a:	01 f0                	add    %esi,%eax
  10209c:	11 fa                	adc    %edi,%edx
  10209e:	39 c3                	cmp    %eax,%ebx
  1020a0:	19 d1                	sbb    %edx,%ecx
  1020a2:	72 dc                	jb     102080 <delay+0x40>
}
  1020a4:	83 c4 1c             	add    $0x1c,%esp
  1020a7:	5b                   	pop    %ebx
  1020a8:	5e                   	pop    %esi
  1020a9:	5f                   	pop    %edi
  1020aa:	5d                   	pop    %ebp
  1020ab:	c3                   	ret
  1020ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001020b0 <udelay>:

/*
 * Wait for us microsecond.
 */
void udelay(uint32_t us)
{
  1020b0:	55                   	push   %ebp
  1020b1:	e8 43 f1 ff ff       	call   1011f9 <__x86.get_pc_thunk.bp>
  1020b6:	81 c5 3e 1f 01 00    	add    $0x11f3e,%ebp
  1020bc:	57                   	push   %edi
  1020bd:	56                   	push   %esi
  1020be:	53                   	push   %ebx
  1020bf:	83 ec 1c             	sub    $0x1c,%esp
    volatile uint64_t ticks = tsc_per_ms / 1000 * us;
  1020c2:	8b 85 94 68 04 00    	mov    0x46894(%ebp),%eax
  1020c8:	8b 95 98 68 04 00    	mov    0x46898(%ebp),%edx
  1020ce:	89 eb                	mov    %ebp,%ebx
{
  1020d0:	8b 74 24 30          	mov    0x30(%esp),%esi
    volatile uint64_t ticks = tsc_per_ms / 1000 * us;
  1020d4:	6a 00                	push   $0x0
  1020d6:	68 e8 03 00 00       	push   $0x3e8
  1020db:	52                   	push   %edx
  1020dc:	50                   	push   %eax
  1020dd:	e8 1e 7e 00 00       	call   109f00 <__udivdi3>
  1020e2:	83 c4 10             	add    $0x10,%esp
  1020e5:	89 d1                	mov    %edx,%ecx
  1020e7:	f7 e6                	mul    %esi
  1020e9:	0f af ce             	imul   %esi,%ecx
  1020ec:	89 04 24             	mov    %eax,(%esp)
  1020ef:	01 ca                	add    %ecx,%edx
  1020f1:	89 54 24 04          	mov    %edx,0x4(%esp)
    volatile uint64_t start = rdtsc();
  1020f5:	e8 76 33 00 00       	call   105470 <rdtsc>
  1020fa:	89 44 24 08          	mov    %eax,0x8(%esp)
  1020fe:	89 54 24 0c          	mov    %edx,0xc(%esp)
    while (rdtsc() < start + ticks);
  102102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102108:	89 eb                	mov    %ebp,%ebx
  10210a:	e8 61 33 00 00       	call   105470 <rdtsc>
  10210f:	89 c3                	mov    %eax,%ebx
  102111:	89 d1                	mov    %edx,%ecx
  102113:	8b 44 24 08          	mov    0x8(%esp),%eax
  102117:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10211b:	8b 34 24             	mov    (%esp),%esi
  10211e:	8b 7c 24 04          	mov    0x4(%esp),%edi
  102122:	01 f0                	add    %esi,%eax
  102124:	11 fa                	adc    %edi,%edx
  102126:	39 c3                	cmp    %eax,%ebx
  102128:	19 d1                	sbb    %edx,%ecx
  10212a:	72 dc                	jb     102108 <udelay+0x58>
}
  10212c:	83 c4 1c             	add    $0x1c,%esp
  10212f:	5b                   	pop    %ebx
  102130:	5e                   	pop    %esi
  102131:	5f                   	pop    %edi
  102132:	5d                   	pop    %ebp
  102133:	c3                   	ret
  102134:	66 90                	xchg   %ax,%ax
  102136:	66 90                	xchg   %ax,%ax
  102138:	66 90                	xchg   %ax,%ax
  10213a:	66 90                	xchg   %ax,%ax
  10213c:	66 90                	xchg   %ax,%ax
  10213e:	66 90                	xchg   %ax,%ax

00102140 <Xdivide>:
	jmp	_alltraps

.text

/* exceptions  */
TRAPHANDLER_NOEC(Xdivide,	T_DIVIDE)
  102140:	6a 00                	push   $0x0
  102142:	6a 00                	push   $0x0
  102144:	e9 17 01 00 00       	jmp    102260 <_alltraps>
  102149:	90                   	nop

0010214a <Xdebug>:
TRAPHANDLER_NOEC(Xdebug,	T_DEBUG)
  10214a:	6a 00                	push   $0x0
  10214c:	6a 01                	push   $0x1
  10214e:	e9 0d 01 00 00       	jmp    102260 <_alltraps>
  102153:	90                   	nop

00102154 <Xnmi>:
TRAPHANDLER_NOEC(Xnmi,		T_NMI)
  102154:	6a 00                	push   $0x0
  102156:	6a 02                	push   $0x2
  102158:	e9 03 01 00 00       	jmp    102260 <_alltraps>
  10215d:	90                   	nop

0010215e <Xbrkpt>:
TRAPHANDLER_NOEC(Xbrkpt,	T_BRKPT)
  10215e:	6a 00                	push   $0x0
  102160:	6a 03                	push   $0x3
  102162:	e9 f9 00 00 00       	jmp    102260 <_alltraps>
  102167:	90                   	nop

00102168 <Xoflow>:
TRAPHANDLER_NOEC(Xoflow,	T_OFLOW)
  102168:	6a 00                	push   $0x0
  10216a:	6a 04                	push   $0x4
  10216c:	e9 ef 00 00 00       	jmp    102260 <_alltraps>
  102171:	90                   	nop

00102172 <Xbound>:
TRAPHANDLER_NOEC(Xbound,	T_BOUND)
  102172:	6a 00                	push   $0x0
  102174:	6a 05                	push   $0x5
  102176:	e9 e5 00 00 00       	jmp    102260 <_alltraps>
  10217b:	90                   	nop

0010217c <Xillop>:
TRAPHANDLER_NOEC(Xillop,	T_ILLOP)
  10217c:	6a 00                	push   $0x0
  10217e:	6a 06                	push   $0x6
  102180:	e9 db 00 00 00       	jmp    102260 <_alltraps>
  102185:	90                   	nop

00102186 <Xdevice>:
TRAPHANDLER_NOEC(Xdevice,	T_DEVICE)
  102186:	6a 00                	push   $0x0
  102188:	6a 07                	push   $0x7
  10218a:	e9 d1 00 00 00       	jmp    102260 <_alltraps>
  10218f:	90                   	nop

00102190 <Xdblflt>:
TRAPHANDLER     (Xdblflt,	T_DBLFLT)
  102190:	6a 08                	push   $0x8
  102192:	e9 c9 00 00 00       	jmp    102260 <_alltraps>
  102197:	90                   	nop

00102198 <Xcoproc>:
TRAPHANDLER_NOEC(Xcoproc,	T_COPROC)
  102198:	6a 00                	push   $0x0
  10219a:	6a 09                	push   $0x9
  10219c:	e9 bf 00 00 00       	jmp    102260 <_alltraps>
  1021a1:	90                   	nop

001021a2 <Xtss>:
TRAPHANDLER     (Xtss,		T_TSS)
  1021a2:	6a 0a                	push   $0xa
  1021a4:	e9 b7 00 00 00       	jmp    102260 <_alltraps>
  1021a9:	90                   	nop

001021aa <Xsegnp>:
TRAPHANDLER     (Xsegnp,	T_SEGNP)
  1021aa:	6a 0b                	push   $0xb
  1021ac:	e9 af 00 00 00       	jmp    102260 <_alltraps>
  1021b1:	90                   	nop

001021b2 <Xstack>:
TRAPHANDLER     (Xstack,	T_STACK)
  1021b2:	6a 0c                	push   $0xc
  1021b4:	e9 a7 00 00 00       	jmp    102260 <_alltraps>
  1021b9:	90                   	nop

001021ba <Xgpflt>:
TRAPHANDLER     (Xgpflt,	T_GPFLT)
  1021ba:	6a 0d                	push   $0xd
  1021bc:	e9 9f 00 00 00       	jmp    102260 <_alltraps>
  1021c1:	90                   	nop

001021c2 <Xpgflt>:
TRAPHANDLER     (Xpgflt,	T_PGFLT)
  1021c2:	6a 0e                	push   $0xe
  1021c4:	e9 97 00 00 00       	jmp    102260 <_alltraps>
  1021c9:	90                   	nop

001021ca <Xres>:
TRAPHANDLER_NOEC(Xres,		T_RES)
  1021ca:	6a 00                	push   $0x0
  1021cc:	6a 0f                	push   $0xf
  1021ce:	e9 8d 00 00 00       	jmp    102260 <_alltraps>
  1021d3:	90                   	nop

001021d4 <Xfperr>:
TRAPHANDLER_NOEC(Xfperr,	T_FPERR)
  1021d4:	6a 00                	push   $0x0
  1021d6:	6a 10                	push   $0x10
  1021d8:	e9 83 00 00 00       	jmp    102260 <_alltraps>
  1021dd:	90                   	nop

001021de <Xalign>:
TRAPHANDLER     (Xalign,	T_ALIGN)
  1021de:	6a 11                	push   $0x11
  1021e0:	eb 7e                	jmp    102260 <_alltraps>

001021e2 <Xmchk>:
TRAPHANDLER_NOEC(Xmchk,		T_MCHK)
  1021e2:	6a 00                	push   $0x0
  1021e4:	6a 12                	push   $0x12
  1021e6:	eb 78                	jmp    102260 <_alltraps>

001021e8 <Xirq_timer>:

/* ISA interrupts  */
TRAPHANDLER_NOEC(Xirq_timer,	T_IRQ0 + IRQ_TIMER)
  1021e8:	6a 00                	push   $0x0
  1021ea:	6a 20                	push   $0x20
  1021ec:	eb 72                	jmp    102260 <_alltraps>

001021ee <Xirq_kbd>:
TRAPHANDLER_NOEC(Xirq_kbd,	T_IRQ0 + IRQ_KBD)
  1021ee:	6a 00                	push   $0x0
  1021f0:	6a 21                	push   $0x21
  1021f2:	eb 6c                	jmp    102260 <_alltraps>

001021f4 <Xirq_slave>:
TRAPHANDLER_NOEC(Xirq_slave,	T_IRQ0 + IRQ_SLAVE)
  1021f4:	6a 00                	push   $0x0
  1021f6:	6a 22                	push   $0x22
  1021f8:	eb 66                	jmp    102260 <_alltraps>

001021fa <Xirq_serial2>:
TRAPHANDLER_NOEC(Xirq_serial2,	T_IRQ0 + IRQ_SERIAL24)
  1021fa:	6a 00                	push   $0x0
  1021fc:	6a 23                	push   $0x23
  1021fe:	eb 60                	jmp    102260 <_alltraps>

00102200 <Xirq_serial1>:
TRAPHANDLER_NOEC(Xirq_serial1,	T_IRQ0 + IRQ_SERIAL13)
  102200:	6a 00                	push   $0x0
  102202:	6a 24                	push   $0x24
  102204:	eb 5a                	jmp    102260 <_alltraps>

00102206 <Xirq_lpt>:
TRAPHANDLER_NOEC(Xirq_lpt,	T_IRQ0 + IRQ_LPT2)
  102206:	6a 00                	push   $0x0
  102208:	6a 25                	push   $0x25
  10220a:	eb 54                	jmp    102260 <_alltraps>

0010220c <Xirq_floppy>:
TRAPHANDLER_NOEC(Xirq_floppy,	T_IRQ0 + IRQ_FLOPPY)
  10220c:	6a 00                	push   $0x0
  10220e:	6a 26                	push   $0x26
  102210:	eb 4e                	jmp    102260 <_alltraps>

00102212 <Xirq_spurious>:
TRAPHANDLER_NOEC(Xirq_spurious,	T_IRQ0 + IRQ_SPURIOUS)
  102212:	6a 00                	push   $0x0
  102214:	6a 27                	push   $0x27
  102216:	eb 48                	jmp    102260 <_alltraps>

00102218 <Xirq_rtc>:
TRAPHANDLER_NOEC(Xirq_rtc,	T_IRQ0 + IRQ_RTC)
  102218:	6a 00                	push   $0x0
  10221a:	6a 28                	push   $0x28
  10221c:	eb 42                	jmp    102260 <_alltraps>

0010221e <Xirq9>:
TRAPHANDLER_NOEC(Xirq9,		T_IRQ0 + 9)
  10221e:	6a 00                	push   $0x0
  102220:	6a 29                	push   $0x29
  102222:	eb 3c                	jmp    102260 <_alltraps>

00102224 <Xirq10>:
TRAPHANDLER_NOEC(Xirq10,	T_IRQ0 + 10)
  102224:	6a 00                	push   $0x0
  102226:	6a 2a                	push   $0x2a
  102228:	eb 36                	jmp    102260 <_alltraps>

0010222a <Xirq11>:
TRAPHANDLER_NOEC(Xirq11,	T_IRQ0 + 11)
  10222a:	6a 00                	push   $0x0
  10222c:	6a 2b                	push   $0x2b
  10222e:	eb 30                	jmp    102260 <_alltraps>

00102230 <Xirq_mouse>:
TRAPHANDLER_NOEC(Xirq_mouse,	T_IRQ0 + IRQ_MOUSE)
  102230:	6a 00                	push   $0x0
  102232:	6a 2c                	push   $0x2c
  102234:	eb 2a                	jmp    102260 <_alltraps>

00102236 <Xirq_coproc>:
TRAPHANDLER_NOEC(Xirq_coproc,	T_IRQ0 + IRQ_COPROCESSOR)
  102236:	6a 00                	push   $0x0
  102238:	6a 2d                	push   $0x2d
  10223a:	eb 24                	jmp    102260 <_alltraps>

0010223c <Xirq_ide1>:
TRAPHANDLER_NOEC(Xirq_ide1,	T_IRQ0 + IRQ_IDE1)
  10223c:	6a 00                	push   $0x0
  10223e:	6a 2e                	push   $0x2e
  102240:	eb 1e                	jmp    102260 <_alltraps>

00102242 <Xirq_ide2>:
TRAPHANDLER_NOEC(Xirq_ide2,	T_IRQ0 + IRQ_IDE2)
  102242:	6a 00                	push   $0x0
  102244:	6a 2f                	push   $0x2f
  102246:	eb 18                	jmp    102260 <_alltraps>

00102248 <Xsyscall>:

/* syscall */
TRAPHANDLER_NOEC(Xsyscall,	T_SYSCALL)
  102248:	6a 00                	push   $0x0
  10224a:	6a 30                	push   $0x30
  10224c:	eb 12                	jmp    102260 <_alltraps>

0010224e <Xdefault>:

/* default ? */
TRAPHANDLER     (Xdefault,	T_DEFAULT)
  10224e:	68 fe 00 00 00       	push   $0xfe
  102253:	eb 0b                	jmp    102260 <_alltraps>
  102255:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10225c:	00 
  10225d:	8d 76 00             	lea    0x0(%esi),%esi

00102260 <_alltraps>:

	.globl _alltraps
	.type _alltraps, @function
	.p2align 4, 0x90	/* 16-byte alignment, nop filled */
_alltraps:
	cli			# make sure there is no nested trap
  102260:	fa                   	cli
	cld
  102261:	fc                   	cld

	pushl	%ds		# build context
  102262:	1e                   	push   %ds
	pushl	%es
  102263:	06                   	push   %es
	pushal
  102264:	60                   	pusha

	movl	$CPU_GDT_KDATA, %eax	# load kernel's data segment
  102265:	b8 10 00 00 00       	mov    $0x10,%eax
	movw	%ax, %ds
  10226a:	8e d8                	mov    %eax,%ds
	movw	%ax, %es
  10226c:	8e c0                	mov    %eax,%es

	pushl	%esp		# pass pointer to this trapframe
  10226e:	54                   	push   %esp

	call	trap		# and call trap (does not return)
  10226f:	e8 6c 57 00 00       	call   1079e0 <trap>

1:	hlt			# should never get here; just spin...
  102274:	f4                   	hlt
  102275:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10227c:	00 
  10227d:	8d 76 00             	lea    0x0(%esi),%esi

00102280 <trap_return>:
//
	.globl trap_return
	.type trap_return, @function
	.p2align 4, 0x90	/* 16-byte alignment, nop filled */
trap_return:
	movl	4(%esp), %esp	// reset stack pointer to point to trap frame
  102280:	8b 64 24 04          	mov    0x4(%esp),%esp
	popal			// restore general-purpose registers except esp
  102284:	61                   	popa
	popl	%es		// restore data segment registers
  102285:	07                   	pop    %es
	popl	%ds
  102286:	1f                   	pop    %ds
	addl	$8, %esp	// skip tf_trapno and tf_errcode
  102287:	83 c4 08             	add    $0x8,%esp
	iret			// return from trap handler
  10228a:	cf                   	iret
  10228b:	66 90                	xchg   %ax,%ax
  10228d:	66 90                	xchg   %ax,%ax
  10228f:	90                   	nop

00102290 <acpi_probe_rsdp>:

    return NULL;
}

acpi_rsdp_t *acpi_probe_rsdp(void)
{
  102290:	57                   	push   %edi
  102291:	56                   	push   %esi
  102292:	53                   	push   %ebx
    uint8_t *bda;
    uint32_t p;
    acpi_rsdp_t *rsdp;

    bda = (uint8_t *) 0x400;
    if ((p = ((bda[0x0F] << 8) | bda[0x0E]) << 4)) {
  102293:	0f b6 05 0f 04 00 00 	movzbl 0x40f,%eax
  10229a:	0f b6 15 0e 04 00 00 	movzbl 0x40e,%edx
  1022a1:	c1 e0 08             	shl    $0x8,%eax
  1022a4:	09 d0                	or     %edx,%eax
  1022a6:	c1 e0 04             	shl    $0x4,%eax
  1022a9:	74 4d                	je     1022f8 <acpi_probe_rsdp+0x68>
        if (*(uint32_t *) p == ACPI_RSDP_SIG1 &&
  1022ab:	81 38 52 53 44 20    	cmpl   $0x20445352,(%eax)
    e = addr + length;
  1022b1:	8d 88 00 04 00 00    	lea    0x400(%eax),%ecx
        if (*(uint32_t *) p == ACPI_RSDP_SIG1 &&
  1022b7:	74 16                	je     1022cf <acpi_probe_rsdp+0x3f>
  1022b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for (p = addr; p < e; p += 16) {
  1022c0:	83 c0 10             	add    $0x10,%eax
  1022c3:	39 c8                	cmp    %ecx,%eax
  1022c5:	73 31                	jae    1022f8 <acpi_probe_rsdp+0x68>
        if (*(uint32_t *) p == ACPI_RSDP_SIG1 &&
  1022c7:	81 38 52 53 44 20    	cmpl   $0x20445352,(%eax)
  1022cd:	75 f1                	jne    1022c0 <acpi_probe_rsdp+0x30>
  1022cf:	81 78 04 50 54 52 20 	cmpl   $0x20525450,0x4(%eax)
  1022d6:	75 e8                	jne    1022c0 <acpi_probe_rsdp+0x30>
  1022d8:	89 c2                	mov    %eax,%edx
    sum = 0;
  1022da:	31 db                	xor    %ebx,%ebx
  1022dc:	8d 70 14             	lea    0x14(%eax),%esi
  1022df:	90                   	nop
        sum += addr[i];
  1022e0:	0f b6 3a             	movzbl (%edx),%edi
    for (i = 0; i < len; i++) {
  1022e3:	83 c2 01             	add    $0x1,%edx
        sum += addr[i];
  1022e6:	01 fb                	add    %edi,%ebx
    for (i = 0; i < len; i++) {
  1022e8:	39 f2                	cmp    %esi,%edx
  1022ea:	75 f4                	jne    1022e0 <acpi_probe_rsdp+0x50>
            *(uint32_t *) (p + 4) == ACPI_RSDP_SIG2 &&
  1022ec:	84 db                	test   %bl,%bl
  1022ee:	75 d0                	jne    1022c0 <acpi_probe_rsdp+0x30>
        if ((rsdp = acpi_probe_rsdp_aux((uint8_t *) p, 1024)))
            return rsdp;
    }

    return acpi_probe_rsdp_aux((uint8_t *) 0xE0000, 0x1FFFF);
}
  1022f0:	5b                   	pop    %ebx
  1022f1:	5e                   	pop    %esi
  1022f2:	5f                   	pop    %edi
  1022f3:	c3                   	ret
  1022f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1022f8:	b8 00 00 0e 00       	mov    $0xe0000,%eax
  1022fd:	eb 0b                	jmp    10230a <acpi_probe_rsdp+0x7a>
  1022ff:	90                   	nop
    for (p = addr; p < e; p += 16) {
  102300:	83 c0 10             	add    $0x10,%eax
  102303:	3d 00 00 10 00       	cmp    $0x100000,%eax
  102308:	74 38                	je     102342 <acpi_probe_rsdp+0xb2>
        if (*(uint32_t *) p == ACPI_RSDP_SIG1 &&
  10230a:	81 38 52 53 44 20    	cmpl   $0x20445352,(%eax)
  102310:	75 ee                	jne    102300 <acpi_probe_rsdp+0x70>
  102312:	81 78 04 50 54 52 20 	cmpl   $0x20525450,0x4(%eax)
  102319:	75 e5                	jne    102300 <acpi_probe_rsdp+0x70>
  10231b:	89 c2                	mov    %eax,%edx
    sum = 0;
  10231d:	31 c9                	xor    %ecx,%ecx
  10231f:	8d 70 14             	lea    0x14(%eax),%esi
  102322:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        sum += addr[i];
  102328:	0f b6 1a             	movzbl (%edx),%ebx
    for (i = 0; i < len; i++) {
  10232b:	83 c2 01             	add    $0x1,%edx
        sum += addr[i];
  10232e:	01 d9                	add    %ebx,%ecx
    for (i = 0; i < len; i++) {
  102330:	39 d6                	cmp    %edx,%esi
  102332:	75 f4                	jne    102328 <acpi_probe_rsdp+0x98>
            *(uint32_t *) (p + 4) == ACPI_RSDP_SIG2 &&
  102334:	84 c9                	test   %cl,%cl
  102336:	74 b8                	je     1022f0 <acpi_probe_rsdp+0x60>
    for (p = addr; p < e; p += 16) {
  102338:	83 c0 10             	add    $0x10,%eax
  10233b:	3d 00 00 10 00       	cmp    $0x100000,%eax
  102340:	75 c8                	jne    10230a <acpi_probe_rsdp+0x7a>
}
  102342:	5b                   	pop    %ebx
    return NULL;
  102343:	31 c0                	xor    %eax,%eax
}
  102345:	5e                   	pop    %esi
  102346:	5f                   	pop    %edi
  102347:	c3                   	ret
  102348:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10234f:	00 

00102350 <acpi_probe_rsdt>:

acpi_rsdt_t *acpi_probe_rsdt(acpi_rsdp_t *rsdp)
{
  102350:	56                   	push   %esi
  102351:	53                   	push   %ebx
  102352:	e8 4b e0 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  102357:	81 c3 9d 1c 01 00    	add    $0x11c9d,%ebx
  10235d:	83 ec 04             	sub    $0x4,%esp
  102360:	8b 74 24 10          	mov    0x10(%esp),%esi
    KERN_ASSERT(rsdp != NULL);
  102364:	85 f6                	test   %esi,%esi
  102366:	74 50                	je     1023b8 <acpi_probe_rsdt+0x68>

    acpi_rsdt_t *rsdt = (acpi_rsdt_t *) (rsdp->rsdt_addr);
  102368:	8b 5e 10             	mov    0x10(%esi),%ebx
  10236b:	89 d8                	mov    %ebx,%eax
    if (rsdt == NULL)
  10236d:	85 db                	test   %ebx,%ebx
  10236f:	74 2a                	je     10239b <acpi_probe_rsdt+0x4b>
        return NULL;
    if (rsdt->sig == ACPI_RSDT_SIG && sum((uint8_t *) rsdt, rsdt->length) == 0) {
  102371:	81 3b 52 53 44 54    	cmpl   $0x54445352,(%ebx)
  102377:	75 2f                	jne    1023a8 <acpi_probe_rsdt+0x58>
  102379:	8b 73 04             	mov    0x4(%ebx),%esi
    for (i = 0; i < len; i++) {
  10237c:	85 f6                	test   %esi,%esi
  10237e:	7e 1b                	jle    10239b <acpi_probe_rsdt+0x4b>
  102380:	01 de                	add    %ebx,%esi
    sum = 0;
  102382:	31 d2                	xor    %edx,%edx
  102384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        sum += addr[i];
  102388:	0f b6 08             	movzbl (%eax),%ecx
    for (i = 0; i < len; i++) {
  10238b:	83 c0 01             	add    $0x1,%eax
        sum += addr[i];
  10238e:	01 ca                	add    %ecx,%edx
    for (i = 0; i < len; i++) {
  102390:	39 c6                	cmp    %eax,%esi
  102392:	75 f4                	jne    102388 <acpi_probe_rsdt+0x38>
        return NULL;
  102394:	31 c0                	xor    %eax,%eax
  102396:	84 d2                	test   %dl,%dl
  102398:	0f 45 d8             	cmovne %eax,%ebx
        return rsdt;
    }

    return NULL;
}
  10239b:	83 c4 04             	add    $0x4,%esp
  10239e:	89 d8                	mov    %ebx,%eax
  1023a0:	5b                   	pop    %ebx
  1023a1:	5e                   	pop    %esi
  1023a2:	c3                   	ret
  1023a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        return NULL;
  1023a8:	31 db                	xor    %ebx,%ebx
}
  1023aa:	83 c4 04             	add    $0x4,%esp
  1023ad:	89 d8                	mov    %ebx,%eax
  1023af:	5b                   	pop    %ebx
  1023b0:	5e                   	pop    %esi
  1023b1:	c3                   	ret
  1023b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    KERN_ASSERT(rsdp != NULL);
  1023b8:	8d 83 15 72 ff ff    	lea    -0x8deb(%ebx),%eax
  1023be:	50                   	push   %eax
  1023bf:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  1023c5:	50                   	push   %eax
  1023c6:	8d 83 22 72 ff ff    	lea    -0x8dde(%ebx),%eax
  1023cc:	6a 34                	push   $0x34
  1023ce:	50                   	push   %eax
  1023cf:	e8 0c 24 00 00       	call   1047e0 <debug_panic>
  1023d4:	83 c4 10             	add    $0x10,%esp
  1023d7:	eb 8f                	jmp    102368 <acpi_probe_rsdt+0x18>
  1023d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001023e0 <acpi_probe_rsdt_ent>:

acpi_sdt_hdr_t *acpi_probe_rsdt_ent(acpi_rsdt_t *rsdt, const uint32_t sig)
{
  1023e0:	55                   	push   %ebp
  1023e1:	57                   	push   %edi
  1023e2:	56                   	push   %esi
  1023e3:	53                   	push   %ebx
  1023e4:	e8 b9 df ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1023e9:	81 c3 0b 1c 01 00    	add    $0x11c0b,%ebx
  1023ef:	83 ec 1c             	sub    $0x1c,%esp
  1023f2:	8b 7c 24 30          	mov    0x30(%esp),%edi
    KERN_ASSERT(rsdt != NULL);
  1023f6:	85 ff                	test   %edi,%edi
  1023f8:	74 62                	je     10245c <acpi_probe_rsdt_ent+0x7c>

    uint8_t *p = (uint8_t *) &rsdt->ent[0];
  1023fa:	8d 57 24             	lea    0x24(%edi),%edx
    uint8_t *e = (uint8_t *) rsdt + rsdt->length;
  1023fd:	03 7f 04             	add    0x4(%edi),%edi

    int i;
    for (i = 0; p < e; i++) {
  102400:	39 fa                	cmp    %edi,%edx
  102402:	73 4c                	jae    102450 <acpi_probe_rsdt_ent+0x70>
  102404:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  102408:	eb 0d                	jmp    102417 <acpi_probe_rsdt_ent+0x37>
  10240a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102410:	83 c2 04             	add    $0x4,%edx
  102413:	39 fa                	cmp    %edi,%edx
  102415:	73 39                	jae    102450 <acpi_probe_rsdt_ent+0x70>
        acpi_sdt_hdr_t *hdr = (acpi_sdt_hdr_t *) (rsdt->ent[i]);
  102417:	8b 02                	mov    (%edx),%eax
  102419:	89 c5                	mov    %eax,%ebp
        if (hdr->sig == sig && sum((uint8_t *) hdr, hdr->length) == 0) {
  10241b:	39 18                	cmp    %ebx,(%eax)
  10241d:	75 f1                	jne    102410 <acpi_probe_rsdt_ent+0x30>
  10241f:	8b 70 04             	mov    0x4(%eax),%esi
    for (i = 0; i < len; i++) {
  102422:	85 f6                	test   %esi,%esi
  102424:	7e 1e                	jle    102444 <acpi_probe_rsdt_ent+0x64>
    sum = 0;
  102426:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  10242a:	01 c6                	add    %eax,%esi
  10242c:	31 c9                	xor    %ecx,%ecx
  10242e:	66 90                	xchg   %ax,%ax
        sum += addr[i];
  102430:	0f b6 38             	movzbl (%eax),%edi
    for (i = 0; i < len; i++) {
  102433:	83 c0 01             	add    $0x1,%eax
        sum += addr[i];
  102436:	01 f9                	add    %edi,%ecx
    for (i = 0; i < len; i++) {
  102438:	39 c6                	cmp    %eax,%esi
  10243a:	75 f4                	jne    102430 <acpi_probe_rsdt_ent+0x50>
        if (hdr->sig == sig && sum((uint8_t *) hdr, hdr->length) == 0) {
  10243c:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  102440:	84 c9                	test   %cl,%cl
  102442:	75 cc                	jne    102410 <acpi_probe_rsdt_ent+0x30>
        }
        p = (uint8_t *) &rsdt->ent[i + 1];
    }

    return NULL;
}
  102444:	83 c4 1c             	add    $0x1c,%esp
  102447:	89 e8                	mov    %ebp,%eax
  102449:	5b                   	pop    %ebx
  10244a:	5e                   	pop    %esi
  10244b:	5f                   	pop    %edi
  10244c:	5d                   	pop    %ebp
  10244d:	c3                   	ret
  10244e:	66 90                	xchg   %ax,%ax
  102450:	83 c4 1c             	add    $0x1c,%esp
    return NULL;
  102453:	31 ed                	xor    %ebp,%ebp
}
  102455:	5b                   	pop    %ebx
  102456:	89 e8                	mov    %ebp,%eax
  102458:	5e                   	pop    %esi
  102459:	5f                   	pop    %edi
  10245a:	5d                   	pop    %ebp
  10245b:	c3                   	ret
    KERN_ASSERT(rsdt != NULL);
  10245c:	8d 83 32 72 ff ff    	lea    -0x8dce(%ebx),%eax
  102462:	50                   	push   %eax
  102463:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  102469:	50                   	push   %eax
  10246a:	8d 83 22 72 ff ff    	lea    -0x8dde(%ebx),%eax
  102470:	6a 42                	push   $0x42
  102472:	50                   	push   %eax
  102473:	e8 68 23 00 00       	call   1047e0 <debug_panic>
  102478:	83 c4 10             	add    $0x10,%esp
  10247b:	e9 7a ff ff ff       	jmp    1023fa <acpi_probe_rsdt_ent+0x1a>

00102480 <acpi_probe_xsdt>:

acpi_xsdt_t *acpi_probe_xsdt(acpi_rsdp_t *rsdp)
{
  102480:	56                   	push   %esi
  102481:	53                   	push   %ebx
  102482:	e8 1b df ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  102487:	81 c3 6d 1b 01 00    	add    $0x11b6d,%ebx
  10248d:	83 ec 04             	sub    $0x4,%esp
  102490:	8b 74 24 10          	mov    0x10(%esp),%esi
    KERN_ASSERT(rsdp != NULL);
  102494:	85 f6                	test   %esi,%esi
  102496:	74 50                	je     1024e8 <acpi_probe_xsdt+0x68>

    acpi_xsdt_t *xsdt = (acpi_xsdt_t *) (uintptr_t) rsdp->xsdt_addr;
  102498:	8b 5e 18             	mov    0x18(%esi),%ebx
  10249b:	89 d8                	mov    %ebx,%eax
    if (xsdt == NULL)
  10249d:	85 db                	test   %ebx,%ebx
  10249f:	74 2a                	je     1024cb <acpi_probe_xsdt+0x4b>
        return NULL;
    if (xsdt->sig == ACPI_XSDT_SIG && sum((uint8_t *) xsdt, xsdt->length) == 0) {
  1024a1:	81 3b 58 53 44 54    	cmpl   $0x54445358,(%ebx)
  1024a7:	75 2f                	jne    1024d8 <acpi_probe_xsdt+0x58>
  1024a9:	8b 73 04             	mov    0x4(%ebx),%esi
    for (i = 0; i < len; i++) {
  1024ac:	85 f6                	test   %esi,%esi
  1024ae:	7e 1b                	jle    1024cb <acpi_probe_xsdt+0x4b>
  1024b0:	01 de                	add    %ebx,%esi
    sum = 0;
  1024b2:	31 d2                	xor    %edx,%edx
  1024b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        sum += addr[i];
  1024b8:	0f b6 08             	movzbl (%eax),%ecx
    for (i = 0; i < len; i++) {
  1024bb:	83 c0 01             	add    $0x1,%eax
        sum += addr[i];
  1024be:	01 ca                	add    %ecx,%edx
    for (i = 0; i < len; i++) {
  1024c0:	39 c6                	cmp    %eax,%esi
  1024c2:	75 f4                	jne    1024b8 <acpi_probe_xsdt+0x38>
        return NULL;
  1024c4:	31 c0                	xor    %eax,%eax
  1024c6:	84 d2                	test   %dl,%dl
  1024c8:	0f 45 d8             	cmovne %eax,%ebx
        return xsdt;
    }

    return NULL;
}
  1024cb:	83 c4 04             	add    $0x4,%esp
  1024ce:	89 d8                	mov    %ebx,%eax
  1024d0:	5b                   	pop    %ebx
  1024d1:	5e                   	pop    %esi
  1024d2:	c3                   	ret
  1024d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        return NULL;
  1024d8:	31 db                	xor    %ebx,%ebx
}
  1024da:	83 c4 04             	add    $0x4,%esp
  1024dd:	89 d8                	mov    %ebx,%eax
  1024df:	5b                   	pop    %ebx
  1024e0:	5e                   	pop    %esi
  1024e1:	c3                   	ret
  1024e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    KERN_ASSERT(rsdp != NULL);
  1024e8:	8d 83 15 72 ff ff    	lea    -0x8deb(%ebx),%eax
  1024ee:	50                   	push   %eax
  1024ef:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  1024f5:	50                   	push   %eax
  1024f6:	8d 83 22 72 ff ff    	lea    -0x8dde(%ebx),%eax
  1024fc:	6a 55                	push   $0x55
  1024fe:	50                   	push   %eax
  1024ff:	e8 dc 22 00 00       	call   1047e0 <debug_panic>
  102504:	83 c4 10             	add    $0x10,%esp
  102507:	eb 8f                	jmp    102498 <acpi_probe_xsdt+0x18>
  102509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102510 <acpi_probe_xsdt_ent>:

acpi_sdt_hdr_t *acpi_probe_xsdt_ent(acpi_xsdt_t *xsdt, const uint32_t sig)
{
  102510:	55                   	push   %ebp
  102511:	57                   	push   %edi
  102512:	56                   	push   %esi
  102513:	53                   	push   %ebx
  102514:	e8 89 de ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  102519:	81 c3 db 1a 01 00    	add    $0x11adb,%ebx
  10251f:	83 ec 1c             	sub    $0x1c,%esp
  102522:	8b 7c 24 30          	mov    0x30(%esp),%edi
    KERN_ASSERT(xsdt != NULL);
  102526:	85 ff                	test   %edi,%edi
  102528:	74 62                	je     10258c <acpi_probe_xsdt_ent+0x7c>

    uint8_t *p = (uint8_t *) &xsdt->ent[0];
  10252a:	8d 57 24             	lea    0x24(%edi),%edx
    uint8_t *e = (uint8_t *) xsdt + xsdt->length;
  10252d:	03 7f 04             	add    0x4(%edi),%edi

    int i;
    for (i = 0; p < e; i++) {
  102530:	39 fa                	cmp    %edi,%edx
  102532:	73 4c                	jae    102580 <acpi_probe_xsdt_ent+0x70>
  102534:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  102538:	eb 0d                	jmp    102547 <acpi_probe_xsdt_ent+0x37>
  10253a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102540:	83 c2 08             	add    $0x8,%edx
  102543:	39 fa                	cmp    %edi,%edx
  102545:	73 39                	jae    102580 <acpi_probe_xsdt_ent+0x70>
        acpi_sdt_hdr_t *hdr = (acpi_sdt_hdr_t *) (uintptr_t) xsdt->ent[i];
  102547:	8b 02                	mov    (%edx),%eax
  102549:	89 c5                	mov    %eax,%ebp
        if (hdr->sig == sig && sum((uint8_t *) hdr, hdr->length) == 0) {
  10254b:	39 18                	cmp    %ebx,(%eax)
  10254d:	75 f1                	jne    102540 <acpi_probe_xsdt_ent+0x30>
  10254f:	8b 70 04             	mov    0x4(%eax),%esi
    for (i = 0; i < len; i++) {
  102552:	85 f6                	test   %esi,%esi
  102554:	7e 1e                	jle    102574 <acpi_probe_xsdt_ent+0x64>
    sum = 0;
  102556:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  10255a:	01 c6                	add    %eax,%esi
  10255c:	31 c9                	xor    %ecx,%ecx
  10255e:	66 90                	xchg   %ax,%ax
        sum += addr[i];
  102560:	0f b6 38             	movzbl (%eax),%edi
    for (i = 0; i < len; i++) {
  102563:	83 c0 01             	add    $0x1,%eax
        sum += addr[i];
  102566:	01 f9                	add    %edi,%ecx
    for (i = 0; i < len; i++) {
  102568:	39 c6                	cmp    %eax,%esi
  10256a:	75 f4                	jne    102560 <acpi_probe_xsdt_ent+0x50>
        if (hdr->sig == sig && sum((uint8_t *) hdr, hdr->length) == 0) {
  10256c:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  102570:	84 c9                	test   %cl,%cl
  102572:	75 cc                	jne    102540 <acpi_probe_xsdt_ent+0x30>
        }
        p = (uint8_t *) &xsdt->ent[i + 1];
    }

    return NULL;
}
  102574:	83 c4 1c             	add    $0x1c,%esp
  102577:	89 e8                	mov    %ebp,%eax
  102579:	5b                   	pop    %ebx
  10257a:	5e                   	pop    %esi
  10257b:	5f                   	pop    %edi
  10257c:	5d                   	pop    %ebp
  10257d:	c3                   	ret
  10257e:	66 90                	xchg   %ax,%ax
  102580:	83 c4 1c             	add    $0x1c,%esp
    return NULL;
  102583:	31 ed                	xor    %ebp,%ebp
}
  102585:	5b                   	pop    %ebx
  102586:	89 e8                	mov    %ebp,%eax
  102588:	5e                   	pop    %esi
  102589:	5f                   	pop    %edi
  10258a:	5d                   	pop    %ebp
  10258b:	c3                   	ret
    KERN_ASSERT(xsdt != NULL);
  10258c:	8d 83 3f 72 ff ff    	lea    -0x8dc1(%ebx),%eax
  102592:	50                   	push   %eax
  102593:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  102599:	50                   	push   %eax
  10259a:	8d 83 22 72 ff ff    	lea    -0x8dde(%ebx),%eax
  1025a0:	6a 63                	push   $0x63
  1025a2:	50                   	push   %eax
  1025a3:	e8 38 22 00 00       	call   1047e0 <debug_panic>
  1025a8:	83 c4 10             	add    $0x10,%esp
  1025ab:	e9 7a ff ff ff       	jmp    10252a <acpi_probe_xsdt_ent+0x1a>

001025b0 <lapic_register>:
{
}

void lapic_register(uintptr_t lapic_addr)
{
    lapic = (lapic_t *) lapic_addr;
  1025b0:	e8 e5 dd ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  1025b5:	05 3f 1a 01 00       	add    $0x11a3f,%eax
  1025ba:	8b 54 24 04          	mov    0x4(%esp),%edx
  1025be:	89 90 9c 68 04 00    	mov    %edx,0x4689c(%eax)
}
  1025c4:	c3                   	ret
  1025c5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1025cc:	00 
  1025cd:	8d 76 00             	lea    0x0(%esi),%esi

001025d0 <lapic_init>:

/*
 * Initialize local APIC.
 */
void lapic_init()
{
  1025d0:	55                   	push   %ebp
  1025d1:	57                   	push   %edi
  1025d2:	56                   	push   %esi
  1025d3:	53                   	push   %ebx
  1025d4:	e8 c9 dd ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1025d9:	81 c3 1b 1a 01 00    	add    $0x11a1b,%ebx
  1025df:	83 ec 2c             	sub    $0x2c,%esp
    if (!lapic)
  1025e2:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
  1025e8:	8d 93 55 72 ff ff    	lea    -0x8dab(%ebx),%edx
  1025ee:	89 54 24 10          	mov    %edx,0x10(%esp)
  1025f2:	85 c0                	test   %eax,%eax
  1025f4:	0f 84 9b 02 00 00    	je     102895 <lapic_init+0x2c5>
    lapic[index] = value;
  1025fa:	c7 80 f0 00 00 00 27 	movl   $0x127,0xf0(%eax)
  102601:	01 00 00 
    lapic[LAPIC_ID];
  102604:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  102607:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
  10260e:	00 00 00 
    lapic[LAPIC_ID];
  102611:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  102614:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
  10261b:	00 02 00 
    lapic[LAPIC_ID];
  10261e:	8b 50 20             	mov    0x20(%eax),%edx
    int i;
    for (i = 0; i < 5; i++) {
        lapic_ticks_per_ms = lapic_calibrate_timer(CAL_LATCH, CAL_MS, CAL_PIT_LOOPS);
        if (lapic_ticks_per_ms != ~(uint32_t) 0x0)
            break;
        KERN_DEBUG("[%d] Retry to calibrate internal timer of LAPIC.\n", i);
  102621:	8d 93 84 7d ff ff    	lea    -0x827c(%ebx),%edx
    for (i = 0; i < 5; i++) {
  102627:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  10262e:	00 
        KERN_DEBUG("[%d] Retry to calibrate internal timer of LAPIC.\n", i);
  10262f:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    lapic[index] = value;
  102633:	c7 80 80 03 00 00 ff 	movl   $0xffffffff,0x380(%eax)
  10263a:	ff ff ff 
    outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  10263d:	83 ec 0c             	sub    $0xc,%esp
    lapic[LAPIC_ID];
  102640:	8b 40 20             	mov    0x20(%eax),%eax
    outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  102643:	6a 61                	push   $0x61
  102645:	e8 a6 2f 00 00       	call   1055f0 <inb>
  10264a:	5a                   	pop    %edx
  10264b:	59                   	pop    %ecx
  10264c:	25 fc 00 00 00       	and    $0xfc,%eax
  102651:	83 c8 01             	or     $0x1,%eax
  102654:	50                   	push   %eax
  102655:	6a 61                	push   $0x61
  102657:	e8 c4 2f 00 00       	call   105620 <outb>
    outb(0x43, 0xb0);
  10265c:	5e                   	pop    %esi
  10265d:	5f                   	pop    %edi
  10265e:	68 b0 00 00 00       	push   $0xb0
  102663:	6a 43                	push   $0x43
    timermin = ~(uint32_t) 0x0;
  102665:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    outb(0x43, 0xb0);
  10266a:	e8 b1 2f 00 00       	call   105620 <outb>
    outb(0x42, latch & 0xff);
  10266f:	5d                   	pop    %ebp
  102670:	58                   	pop    %eax
  102671:	68 9b 00 00 00       	push   $0x9b
  102676:	6a 42                	push   $0x42
    timermax = 0;
  102678:	31 ed                	xor    %ebp,%ebp
    outb(0x42, latch & 0xff);
  10267a:	e8 a1 2f 00 00       	call   105620 <outb>
    outb(0x42, latch >> 8);
  10267f:	58                   	pop    %eax
  102680:	5a                   	pop    %edx
  102681:	6a 2e                	push   $0x2e
  102683:	6a 42                	push   $0x42
  102685:	e8 96 2f 00 00       	call   105620 <outb>
    return lapic[index];
  10268a:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
    while ((inb(0x61) & 0x20) == 0) {
  102690:	83 c4 10             	add    $0x10,%esp
    pitcnt = 0;
  102693:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  10269a:	00 
    return lapic[index];
  10269b:	8b 80 90 03 00 00    	mov    0x390(%eax),%eax
    while ((inb(0x61) & 0x20) == 0) {
  1026a1:	89 44 24 18          	mov    %eax,0x18(%esp)
    timer = timer1 = timer2 = lapic_read(LAPIC_TCCR);
  1026a5:	89 c6                	mov    %eax,%esi
  1026a7:	89 e8                	mov    %ebp,%eax
  1026a9:	89 fd                	mov    %edi,%ebp
  1026ab:	89 c7                	mov    %eax,%edi
    while ((inb(0x61) & 0x20) == 0) {
  1026ad:	eb 20                	jmp    1026cf <lapic_init+0xff>
  1026af:	90                   	nop
    return lapic[index];
  1026b0:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
  1026b6:	8b 80 90 03 00 00    	mov    0x390(%eax),%eax
        delta = timer - timer2;
  1026bc:	29 c6                	sub    %eax,%esi
        if (delta < timermin)
  1026be:	39 f5                	cmp    %esi,%ebp
  1026c0:	0f 47 ee             	cmova  %esi,%ebp
        if (delta > timermax)
  1026c3:	39 f7                	cmp    %esi,%edi
  1026c5:	0f 42 fe             	cmovb  %esi,%edi
        pitcnt++;
  1026c8:	83 44 24 0c 01       	addl   $0x1,0xc(%esp)
        timer = timer2;
  1026cd:	89 c6                	mov    %eax,%esi
    while ((inb(0x61) & 0x20) == 0) {
  1026cf:	83 ec 0c             	sub    $0xc,%esp
  1026d2:	6a 61                	push   $0x61
  1026d4:	e8 17 2f 00 00       	call   1055f0 <inb>
  1026d9:	83 c4 10             	add    $0x10,%esp
  1026dc:	a8 20                	test   $0x20,%al
  1026de:	74 d0                	je     1026b0 <lapic_init+0xe0>
    if (pitcnt < loopmin || timermax > 10 * timermin)
  1026e0:	81 7c 24 0c e7 03 00 	cmpl   $0x3e7,0xc(%esp)
  1026e7:	00 
  1026e8:	89 fa                	mov    %edi,%edx
  1026ea:	8b 44 24 18          	mov    0x18(%esp),%eax
  1026ee:	89 ef                	mov    %ebp,%edi
  1026f0:	0f 8e 3a 01 00 00    	jle    102830 <lapic_init+0x260>
  1026f6:	8d 0c bf             	lea    (%edi,%edi,4),%ecx
  1026f9:	01 c9                	add    %ecx,%ecx
  1026fb:	39 d1                	cmp    %edx,%ecx
  1026fd:	0f 82 2d 01 00 00    	jb     102830 <lapic_init+0x260>
    delta = timer1 - timer2;
  102703:	29 f0                	sub    %esi,%eax
    return delta / ms;
  102705:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    if (lapic_ticks_per_ms == ~(uint32_t) 0x0) {
        KERN_WARN("Failed to calibrate internal timer of LAPIC.\n");
        KERN_DEBUG("Assume LAPIC timer freq = 0.5 GHz.\n");
        lapic_ticks_per_ms = 500000;
    } else
        KERN_DEBUG("LAPIC timer freq = %llu Hz.\n",
  10270a:	83 ec 0c             	sub    $0xc,%esp
    return delta / ms;
  10270d:	f7 e2                	mul    %edx
        KERN_DEBUG("LAPIC timer freq = %llu Hz.\n",
  10270f:	b8 e8 03 00 00       	mov    $0x3e8,%eax
    return delta / ms;
  102714:	c1 ea 03             	shr    $0x3,%edx
  102717:	89 d6                	mov    %edx,%esi
        KERN_DEBUG("LAPIC timer freq = %llu Hz.\n",
  102719:	f7 e2                	mul    %edx
  10271b:	52                   	push   %edx
  10271c:	50                   	push   %eax
  10271d:	8d 83 66 72 ff ff    	lea    -0x8d9a(%ebx),%eax
  102723:	50                   	push   %eax
  102724:	6a 7d                	push   $0x7d
  102726:	ff 74 24 2c          	push   0x2c(%esp)
  10272a:	e8 51 20 00 00       	call   104780 <debug_normal>
                   (uint64_t) lapic_ticks_per_ms * 1000);

    uint32_t ticr = lapic_ticks_per_ms * 1000 / LAPIC_TIMER_INTR_FREQ;
  10272f:	69 d6 e8 03 00 00    	imul   $0x3e8,%esi,%edx
  102735:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
  10273a:	83 c4 20             	add    $0x20,%esp
  10273d:	f7 e2                	mul    %edx
  10273f:	c1 ea 06             	shr    $0x6,%edx
  102742:	89 d6                	mov    %edx,%esi
    KERN_DEBUG("Set LAPIC TICR = %x.\n", ticr);
  102744:	8d 83 83 72 ff ff    	lea    -0x8d7d(%ebx),%eax
  10274a:	56                   	push   %esi
  10274b:	50                   	push   %eax
  10274c:	68 81 00 00 00       	push   $0x81
  102751:	ff 74 24 1c          	push   0x1c(%esp)
  102755:	e8 26 20 00 00       	call   104780 <debug_normal>
    lapic[index] = value;
  10275a:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
    lapic_write(LAPIC_LINT0, LAPIC_LINT_MASKED);
    lapic_write(LAPIC_LINT1, LAPIC_LINT_MASKED);

    // Disable performance counter overflow interrupts
    // on machines that provide that interrupt entry.
    if (((lapic_read(LAPIC_VER) >> 16) & 0xFF) >= 4)
  102760:	83 c4 10             	add    $0x10,%esp
    lapic[index] = value;
  102763:	89 b0 80 03 00 00    	mov    %esi,0x380(%eax)
    lapic[LAPIC_ID];
  102769:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  10276c:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
  102773:	00 01 00 
    lapic[LAPIC_ID];
  102776:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  102779:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
  102780:	00 01 00 
    lapic[LAPIC_ID];
  102783:	8b 50 20             	mov    0x20(%eax),%edx
    return lapic[index];
  102786:	8b 50 30             	mov    0x30(%eax),%edx
    if (((lapic_read(LAPIC_VER) >> 16) & 0xFF) >= 4)
  102789:	81 e2 00 00 fc 00    	and    $0xfc0000,%edx
  10278f:	74 0d                	je     10279e <lapic_init+0x1ce>
    lapic[index] = value;
  102791:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
  102798:	00 01 00 
    lapic[LAPIC_ID];
  10279b:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  10279e:	c7 80 e0 00 00 00 00 	movl   $0xf0000000,0xe0(%eax)
  1027a5:	00 00 f0 
    lapic[LAPIC_ID];
  1027a8:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  1027ab:	c7 80 d0 00 00 00 00 	movl   $0x0,0xd0(%eax)
  1027b2:	00 00 00 
    lapic[LAPIC_ID];
  1027b5:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  1027b8:	c7 80 70 03 00 00 32 	movl   $0x32,0x370(%eax)
  1027bf:	00 00 00 
    lapic[LAPIC_ID];
  1027c2:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  1027c5:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
  1027cc:	00 00 00 
    lapic[LAPIC_ID];
  1027cf:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  1027d2:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
  1027d9:	00 00 00 
    lapic[LAPIC_ID];
  1027dc:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  1027df:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
  1027e6:	00 00 00 
    lapic[LAPIC_ID];
  1027e9:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  1027ec:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
  1027f3:	00 00 00 
    lapic[LAPIC_ID];
  1027f6:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  1027f9:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
  102800:	85 08 00 
    lapic[LAPIC_ID];
  102803:	8b 50 20             	mov    0x20(%eax),%edx

    // Send an Init Level De-Assert to synchronise arbitration ID's.
    lapic_write(LAPIC_ICRHI, 0);
    lapic_write(LAPIC_ICRLO,
                LAPIC_ICRLO_BCAST | LAPIC_ICRLO_INIT | LAPIC_ICRLO_LEVEL);
    while (lapic_read(LAPIC_ICRLO) & LAPIC_ICRLO_DELIVS);
  102806:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10280d:	00 
  10280e:	66 90                	xchg   %ax,%ax
    return lapic[index];
  102810:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
    while (lapic_read(LAPIC_ICRLO) & LAPIC_ICRLO_DELIVS);
  102816:	80 e6 10             	and    $0x10,%dh
  102819:	75 f5                	jne    102810 <lapic_init+0x240>
    lapic[index] = value;
  10281b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
  102822:	00 00 00 
    lapic[LAPIC_ID];
  102825:	8b 40 20             	mov    0x20(%eax),%eax

    // Enable interrupts on the APIC (but not on the processor).
    lapic_write(LAPIC_TPR, 0);
}
  102828:	83 c4 2c             	add    $0x2c,%esp
  10282b:	5b                   	pop    %ebx
  10282c:	5e                   	pop    %esi
  10282d:	5f                   	pop    %edi
  10282e:	5d                   	pop    %ebp
  10282f:	c3                   	ret
        KERN_DEBUG("[%d] Retry to calibrate internal timer of LAPIC.\n", i);
  102830:	8b 7c 24 14          	mov    0x14(%esp),%edi
  102834:	57                   	push   %edi
  102835:	ff 74 24 20          	push   0x20(%esp)
  102839:	6a 75                	push   $0x75
  10283b:	ff 74 24 1c          	push   0x1c(%esp)
  10283f:	e8 3c 1f 00 00       	call   104780 <debug_normal>
    for (i = 0; i < 5; i++) {
  102844:	89 f8                	mov    %edi,%eax
  102846:	83 c0 01             	add    $0x1,%eax
  102849:	89 44 24 24          	mov    %eax,0x24(%esp)
  10284d:	83 c4 10             	add    $0x10,%esp
  102850:	83 f8 05             	cmp    $0x5,%eax
  102853:	74 0b                	je     102860 <lapic_init+0x290>
    lapic[index] = value;
  102855:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
  10285b:	e9 d3 fd ff ff       	jmp    102633 <lapic_init+0x63>
        KERN_WARN("Failed to calibrate internal timer of LAPIC.\n");
  102860:	83 ec 04             	sub    $0x4,%esp
  102863:	8d 83 b8 7d ff ff    	lea    -0x8248(%ebx),%eax
  102869:	be 20 a1 07 00       	mov    $0x7a120,%esi
  10286e:	50                   	push   %eax
  10286f:	6a 79                	push   $0x79
  102871:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
  102875:	57                   	push   %edi
  102876:	e8 75 20 00 00       	call   1048f0 <debug_warn>
        KERN_DEBUG("Assume LAPIC timer freq = 0.5 GHz.\n");
  10287b:	83 c4 0c             	add    $0xc,%esp
  10287e:	8d 83 e8 7d ff ff    	lea    -0x8218(%ebx),%eax
  102884:	50                   	push   %eax
  102885:	6a 7a                	push   $0x7a
  102887:	57                   	push   %edi
  102888:	e8 f3 1e 00 00       	call   104780 <debug_normal>
        lapic_ticks_per_ms = 500000;
  10288d:	83 c4 10             	add    $0x10,%esp
  102890:	e9 af fe ff ff       	jmp    102744 <lapic_init+0x174>
        KERN_PANIC("NO LAPIC");
  102895:	83 ec 04             	sub    $0x4,%esp
  102898:	8d 83 4c 72 ff ff    	lea    -0x8db4(%ebx),%eax
  10289e:	50                   	push   %eax
  10289f:	6a 62                	push   $0x62
  1028a1:	ff 74 24 1c          	push   0x1c(%esp)
  1028a5:	e8 36 1f 00 00       	call   1047e0 <debug_panic>
    lapic[index] = value;
  1028aa:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
  1028b0:	83 c4 10             	add    $0x10,%esp
  1028b3:	e9 42 fd ff ff       	jmp    1025fa <lapic_init+0x2a>
  1028b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1028bf:	00 

001028c0 <lapic_eoi>:
/*
 * Acknowledge the end of interrupts.
 */
void lapic_eoi(void)
{
    if (lapic)
  1028c0:	e8 d5 da ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  1028c5:	05 2f 17 01 00       	add    $0x1172f,%eax
  1028ca:	8b 80 9c 68 04 00    	mov    0x4689c(%eax),%eax
  1028d0:	85 c0                	test   %eax,%eax
  1028d2:	74 0d                	je     1028e1 <lapic_eoi+0x21>
    lapic[index] = value;
  1028d4:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
  1028db:	00 00 00 
    lapic[LAPIC_ID];
  1028de:	8b 40 20             	mov    0x20(%eax),%eax
        lapic_write(LAPIC_EOI, 0);
}
  1028e1:	c3                   	ret
  1028e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1028e9:	00 
  1028ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001028f0 <lapic_startcpu>:
/*
 * Start additional processor running bootstrap code at addr.
 * See Appendix B of MultiProcessor Specification.
 */
void lapic_startcpu(lapicid_t apicid, uintptr_t addr)
{
  1028f0:	57                   	push   %edi
  1028f1:	56                   	push   %esi
  1028f2:	53                   	push   %ebx
  1028f3:	8b 74 24 14          	mov    0x14(%esp),%esi
  1028f7:	e8 a6 da ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1028fc:	81 c3 f8 16 01 00    	add    $0x116f8,%ebx
  102902:	8b 7c 24 10          	mov    0x10(%esp),%edi
    uint16_t *wrv;

    // "The BSP must initialize CMOS shutdown code to 0AH
    // and the warm reset vector (DWORD based at 40:67) to point at
    // the AP startup code prior to the [universal startup algorithm]."
    outb(IO_RTC, 0xF);                      // offset 0xF is shutdown code
  102906:	83 ec 08             	sub    $0x8,%esp
    lapic[index] = value;
  102909:	c1 e7 18             	shl    $0x18,%edi
    outb(IO_RTC, 0xF);                      // offset 0xF is shutdown code
  10290c:	6a 0f                	push   $0xf
  10290e:	6a 70                	push   $0x70
  102910:	e8 0b 2d 00 00       	call   105620 <outb>
    outb(IO_RTC + 1, 0x0A);
  102915:	58                   	pop    %eax
  102916:	5a                   	pop    %edx
  102917:	6a 0a                	push   $0xa
  102919:	6a 71                	push   $0x71
  10291b:	e8 00 2d 00 00       	call   105620 <outb>
    wrv = (uint16_t *) (0x40 << 4 | 0x67);  // Warm reset vector
    wrv[0] = 0;
    wrv[1] = addr >> 4;
  102920:	89 f0                	mov    %esi,%eax
    // when it is in the halted state due to an INIT. So the second
    // should be ignored, but it is part of the official Intel algorithm.
    // Bochs complains about the second one. Too bad for Bochs.
    for (i = 0; i < 2; i++) {
        lapic_write(LAPIC_ICRHI, apicid << 24);
        lapic_write(LAPIC_ICRLO, LAPIC_ICRLO_STARTUP | (addr >> 12));
  102922:	c1 ee 0c             	shr    $0xc,%esi
        microdelay(200);
    }
}
  102925:	83 c4 10             	add    $0x10,%esp
    wrv[1] = addr >> 4;
  102928:	c1 e8 04             	shr    $0x4,%eax
        lapic_write(LAPIC_ICRLO, LAPIC_ICRLO_STARTUP | (addr >> 12));
  10292b:	81 ce 00 06 00 00    	or     $0x600,%esi
    wrv[0] = 0;
  102931:	31 c9                	xor    %ecx,%ecx
    wrv[1] = addr >> 4;
  102933:	66 a3 69 04 00 00    	mov    %ax,0x469
    lapic[index] = value;
  102939:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
    wrv[0] = 0;
  10293f:	66 89 0d 67 04 00 00 	mov    %cx,0x467
    lapic[index] = value;
  102946:	89 b8 10 03 00 00    	mov    %edi,0x310(%eax)
    lapic[LAPIC_ID];
  10294c:	8b 48 20             	mov    0x20(%eax),%ecx
    lapic[index] = value;
  10294f:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
  102956:	c5 00 00 
    lapic[LAPIC_ID];
  102959:	8b 48 20             	mov    0x20(%eax),%ecx
    lapic[index] = value;
  10295c:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
  102963:	85 00 00 
    lapic[LAPIC_ID];
  102966:	8b 48 20             	mov    0x20(%eax),%ecx
    lapic[index] = value;
  102969:	89 b8 10 03 00 00    	mov    %edi,0x310(%eax)
    lapic[LAPIC_ID];
  10296f:	8b 48 20             	mov    0x20(%eax),%ecx
    lapic[index] = value;
  102972:	89 b0 00 03 00 00    	mov    %esi,0x300(%eax)
    lapic[LAPIC_ID];
  102978:	8b 48 20             	mov    0x20(%eax),%ecx
    lapic[index] = value;
  10297b:	89 b8 10 03 00 00    	mov    %edi,0x310(%eax)
    lapic[LAPIC_ID];
  102981:	8b 50 20             	mov    0x20(%eax),%edx
    lapic[index] = value;
  102984:	89 b0 00 03 00 00    	mov    %esi,0x300(%eax)
}
  10298a:	5b                   	pop    %ebx
    lapic[LAPIC_ID];
  10298b:	8b 40 20             	mov    0x20(%eax),%eax
}
  10298e:	5e                   	pop    %esi
  10298f:	5f                   	pop    %edi
  102990:	c3                   	ret
  102991:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102998:	00 
  102999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001029a0 <lapic_read_debug>:
    return lapic[index];
  1029a0:	e8 f5 d9 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  1029a5:	05 4f 16 01 00       	add    $0x1164f,%eax
  1029aa:	8b 54 24 04          	mov    0x4(%esp),%edx
  1029ae:	8b 80 9c 68 04 00    	mov    0x4689c(%eax),%eax
  1029b4:	8d 04 90             	lea    (%eax,%edx,4),%eax
  1029b7:	8b 00                	mov    (%eax),%eax

uint32_t lapic_read_debug(int index)
{
    return lapic_read(index);
}
  1029b9:	c3                   	ret
  1029ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001029c0 <lapic_send_ipi>:
/*
 * Send an IPI.
 */
void lapic_send_ipi(lapicid_t apicid, uint8_t vector,
                    uint32_t deliver_mode, uint32_t shorthand_mode)
{
  1029c0:	55                   	push   %ebp
  1029c1:	57                   	push   %edi
  1029c2:	56                   	push   %esi
  1029c3:	53                   	push   %ebx
  1029c4:	e8 d9 d9 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1029c9:	81 c3 2b 16 01 00    	add    $0x1162b,%ebx
  1029cf:	83 ec 0c             	sub    $0xc,%esp
    KERN_ASSERT(deliver_mode != LAPIC_ICRLO_INIT &&
  1029d2:	8b 44 24 28          	mov    0x28(%esp),%eax
{
  1029d6:	8b 6c 24 20          	mov    0x20(%esp),%ebp
  1029da:	8b 74 24 24          	mov    0x24(%esp),%esi
  1029de:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    KERN_ASSERT(deliver_mode != LAPIC_ICRLO_INIT &&
  1029e2:	2d 00 05 00 00       	sub    $0x500,%eax
  1029e7:	a9 ff fe ff ff       	test   $0xfffffeff,%eax
  1029ec:	74 5a                	je     102a48 <lapic_send_ipi+0x88>
                deliver_mode != LAPIC_ICRLO_STARTUP);
    KERN_ASSERT(vector >= T_IPI0);
  1029ee:	89 f0                	mov    %esi,%eax
  1029f0:	3c 3e                	cmp    $0x3e,%al
  1029f2:	77 11                	ja     102a05 <lapic_send_ipi+0x45>
  1029f4:	eb 7a                	jmp    102a70 <lapic_send_ipi+0xb0>
  1029f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1029fd:	00 
  1029fe:	66 90                	xchg   %ax,%ax

    while (lapic_read(LAPIC_ICRLO) & LAPIC_ICRLO_DELIVS)
        pause();
  102a00:	e8 2b 2a 00 00       	call   105430 <pause>
    return lapic[index];
  102a05:	8b 83 9c 68 04 00    	mov    0x4689c(%ebx),%eax
  102a0b:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
    while (lapic_read(LAPIC_ICRLO) & LAPIC_ICRLO_DELIVS)
  102a11:	80 e6 10             	and    $0x10,%dh
  102a14:	75 ea                	jne    102a00 <lapic_send_ipi+0x40>

    if (shorthand_mode == LAPIC_ICRLO_NOBCAST)
  102a16:	85 ff                	test   %edi,%edi
  102a18:	75 0c                	jne    102a26 <lapic_send_ipi+0x66>
    lapic[index] = value;
  102a1a:	c1 e5 18             	shl    $0x18,%ebp
  102a1d:	89 a8 10 03 00 00    	mov    %ebp,0x310(%eax)
    lapic[LAPIC_ID];
  102a23:	8b 50 20             	mov    0x20(%eax),%edx
        lapic_write(LAPIC_ICRHI,
                    (apicid << LAPIC_ICRHI_DEST_SHIFT) & LAPIC_ICRHI_DEST_MASK);

    lapic_write(LAPIC_ICRLO,
                shorthand_mode |  /* LAPIC_ICRLO_LEVEL | */
                deliver_mode | (vector & LAPIC_ICRLO_VECTOR));
  102a26:	89 f1                	mov    %esi,%ecx
  102a28:	0f b6 f1             	movzbl %cl,%esi
  102a2b:	09 fe                	or     %edi,%esi
  102a2d:	0b 74 24 28          	or     0x28(%esp),%esi
    lapic[index] = value;
  102a31:	89 b0 00 03 00 00    	mov    %esi,0x300(%eax)
    lapic[LAPIC_ID];
  102a37:	8b 40 20             	mov    0x20(%eax),%eax
}
  102a3a:	83 c4 0c             	add    $0xc,%esp
  102a3d:	5b                   	pop    %ebx
  102a3e:	5e                   	pop    %esi
  102a3f:	5f                   	pop    %edi
  102a40:	5d                   	pop    %ebp
  102a41:	c3                   	ret
  102a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    KERN_ASSERT(deliver_mode != LAPIC_ICRLO_INIT &&
  102a48:	8d 83 0c 7e ff ff    	lea    -0x81f4(%ebx),%eax
  102a4e:	50                   	push   %eax
  102a4f:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  102a55:	50                   	push   %eax
  102a56:	8d 83 55 72 ff ff    	lea    -0x8dab(%ebx),%eax
  102a5c:	68 e4 00 00 00       	push   $0xe4
  102a61:	50                   	push   %eax
  102a62:	e8 79 1d 00 00       	call   1047e0 <debug_panic>
    KERN_ASSERT(vector >= T_IPI0);
  102a67:	89 f0                	mov    %esi,%eax
    KERN_ASSERT(deliver_mode != LAPIC_ICRLO_INIT &&
  102a69:	83 c4 10             	add    $0x10,%esp
    KERN_ASSERT(vector >= T_IPI0);
  102a6c:	3c 3e                	cmp    $0x3e,%al
  102a6e:	77 95                	ja     102a05 <lapic_send_ipi+0x45>
  102a70:	8d 83 99 72 ff ff    	lea    -0x8d67(%ebx),%eax
  102a76:	50                   	push   %eax
  102a77:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  102a7d:	50                   	push   %eax
  102a7e:	8d 83 55 72 ff ff    	lea    -0x8dab(%ebx),%eax
  102a84:	68 e6 00 00 00       	push   $0xe6
  102a89:	50                   	push   %eax
  102a8a:	e8 51 1d 00 00       	call   1047e0 <debug_panic>
  102a8f:	83 c4 10             	add    $0x10,%esp
    return lapic[index];
  102a92:	e9 6e ff ff ff       	jmp    102a05 <lapic_send_ipi+0x45>
  102a97:	66 90                	xchg   %ax,%ax
  102a99:	66 90                	xchg   %ax,%ax
  102a9b:	66 90                	xchg   %ax,%ax
  102a9d:	66 90                	xchg   %ax,%ax
  102a9f:	90                   	nop

00102aa0 <ioapic_register>:
    base->reg = reg;
    base->data = data;
}

void ioapic_register(uintptr_t addr, lapicid_t id, int g)
{
  102aa0:	53                   	push   %ebx
  102aa1:	e8 fc d8 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  102aa6:	81 c3 4e 15 01 00    	add    $0x1154e,%ebx
  102aac:	83 ec 08             	sub    $0x8,%esp
  102aaf:	8b 54 24 14          	mov    0x14(%esp),%edx
    if (ioapic_num >= MAX_IOAPIC) {
  102ab3:	8b 83 ac 68 04 00    	mov    0x468ac(%ebx),%eax
  102ab9:	83 f8 0f             	cmp    $0xf,%eax
  102abc:	7f 4a                	jg     102b08 <ioapic_register+0x68>
        KERN_WARN("CertiKOS cannot manipulate more than %d IOAPICs.\n", MAX_IOAPIC);
        return;
    }

    ioapics[ioapic_num] = (ioapic_t *) addr;
  102abe:	8b 83 ac 68 04 00    	mov    0x468ac(%ebx),%eax
  102ac4:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102ac8:	89 8c 83 2c 69 04 00 	mov    %ecx,0x4692c(%ebx,%eax,4)
    ioapicid[ioapic_num] = id;
  102acf:	8b 83 ac 68 04 00    	mov    0x468ac(%ebx),%eax
    gsi[ioapic_num] = g;
  102ad5:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    ioapicid[ioapic_num] = id;
  102ad9:	88 94 03 0c 69 04 00 	mov    %dl,0x4690c(%ebx,%eax,1)
    gsi[ioapic_num] = g;
  102ae0:	8b 93 ac 68 04 00    	mov    0x468ac(%ebx),%edx
  102ae6:	8d 83 cc 68 04 00    	lea    0x468cc(%ebx),%eax
  102aec:	89 0c 90             	mov    %ecx,(%eax,%edx,4)

    ioapic_num++;
  102aef:	8b 83 ac 68 04 00    	mov    0x468ac(%ebx),%eax
  102af5:	83 c0 01             	add    $0x1,%eax
  102af8:	89 83 ac 68 04 00    	mov    %eax,0x468ac(%ebx)
}
  102afe:	83 c4 08             	add    $0x8,%esp
  102b01:	5b                   	pop    %ebx
  102b02:	c3                   	ret
  102b03:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        KERN_WARN("CertiKOS cannot manipulate more than %d IOAPICs.\n", MAX_IOAPIC);
  102b08:	8d 83 54 7e ff ff    	lea    -0x81ac(%ebx),%eax
  102b0e:	6a 10                	push   $0x10
  102b10:	50                   	push   %eax
  102b11:	8d 83 aa 72 ff ff    	lea    -0x8d56(%ebx),%eax
  102b17:	6a 1f                	push   $0x1f
  102b19:	50                   	push   %eax
  102b1a:	e8 d1 1d 00 00       	call   1048f0 <debug_warn>
        return;
  102b1f:	83 c4 10             	add    $0x10,%esp
}
  102b22:	83 c4 08             	add    $0x8,%esp
  102b25:	5b                   	pop    %ebx
  102b26:	c3                   	ret
  102b27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102b2e:	00 
  102b2f:	90                   	nop

00102b30 <ioapic_init>:

void ioapic_init(void)
{
    int i;
    for (i = 0; i < ioapic_num; i++) {
  102b30:	e8 ae 02 00 00       	call   102de3 <__x86.get_pc_thunk.cx>
  102b35:	81 c1 bf 14 01 00    	add    $0x114bf,%ecx
{
  102b3b:	55                   	push   %ebp
  102b3c:	57                   	push   %edi
  102b3d:	56                   	push   %esi
  102b3e:	53                   	push   %ebx
  102b3f:	83 ec 1c             	sub    $0x1c,%esp
    for (i = 0; i < ioapic_num; i++) {
  102b42:	8b 81 ac 68 04 00    	mov    0x468ac(%ecx),%eax
  102b48:	89 0c 24             	mov    %ecx,(%esp)
  102b4b:	85 c0                	test   %eax,%eax
  102b4d:	0f 8e ec 00 00 00    	jle    102c3f <ioapic_init+0x10f>
  102b53:	89 c8                	mov    %ecx,%eax
  102b55:	31 ff                	xor    %edi,%edi
  102b57:	8d 89 0c 69 04 00    	lea    0x4690c(%ecx),%ecx
        volatile ioapic_t *ioapic = ioapics[i];
        KERN_ASSERT(ioapic != NULL);
  102b5d:	8d 98 bc 72 ff ff    	lea    -0x8d44(%eax),%ebx
  102b63:	8d 80 b8 70 ff ff    	lea    -0x8f48(%eax),%eax
  102b69:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  102b6d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        volatile ioapic_t *ioapic = ioapics[i];
  102b78:	8b 04 24             	mov    (%esp),%eax
  102b7b:	8b b4 b8 2c 69 04 00 	mov    0x4692c(%eax,%edi,4),%esi
        KERN_ASSERT(ioapic != NULL);
  102b82:	85 f6                	test   %esi,%esi
  102b84:	0f 84 c6 00 00 00    	je     102c50 <ioapic_init+0x120>
    base->reg = reg;
  102b8a:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    return base->data;
  102b90:	8b 46 10             	mov    0x10(%esi),%eax

        lapicid_t id = ioapic_read(ioapic, IOAPIC_ID) >> 24;
        if (id == 0) {
  102b93:	c1 e8 18             	shr    $0x18,%eax
  102b96:	75 14                	jne    102bac <ioapic_init+0x7c>
            // I/O APIC ID not initialized yet - have to do it ourselves.
            ioapic_write(ioapic, IOAPIC_ID, ioapicid[i] << 24);
  102b98:	0f b6 04 39          	movzbl (%ecx,%edi,1),%eax
    base->reg = reg;
  102b9c:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
            ioapic_write(ioapic, IOAPIC_ID, ioapicid[i] << 24);
  102ba2:	c1 e0 18             	shl    $0x18,%eax
    base->data = data;
  102ba5:	89 46 10             	mov    %eax,0x10(%esi)
            id = ioapicid[i];
  102ba8:	0f b6 04 39          	movzbl (%ecx,%edi,1),%eax
        }

        if (id != ioapicid[i])
  102bac:	0f b6 14 39          	movzbl (%ecx,%edi,1),%edx
  102bb0:	38 c2                	cmp    %al,%dl
  102bb2:	74 30                	je     102be4 <ioapic_init+0xb4>
            KERN_WARN("ioapic_init: id %d != ioapicid %d\n", id, ioapicid[i]);
  102bb4:	0f b6 14 39          	movzbl (%ecx,%edi,1),%edx
  102bb8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  102bbc:	0f b6 c0             	movzbl %al,%eax
  102bbf:	83 ec 0c             	sub    $0xc,%esp
  102bc2:	52                   	push   %edx
  102bc3:	50                   	push   %eax
  102bc4:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  102bc8:	8d 83 88 7e ff ff    	lea    -0x8178(%ebx),%eax
  102bce:	50                   	push   %eax
  102bcf:	8d 83 aa 72 ff ff    	lea    -0x8d56(%ebx),%eax
  102bd5:	6a 39                	push   $0x39
  102bd7:	50                   	push   %eax
  102bd8:	e8 13 1d 00 00       	call   1048f0 <debug_warn>
  102bdd:	8b 4c 24 24          	mov    0x24(%esp),%ecx
  102be1:	83 c4 20             	add    $0x20,%esp
    base->reg = reg;
  102be4:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
    return base->data;
  102bea:	8b 6e 10             	mov    0x10(%esi),%ebp
        int maxintr = (ioapic_read(ioapic, IOAPIC_VER) >> 16) & 0xFF;

        // Mark all interrupts edge-triggered, active high, disabled,
        // and not routed to any CPUs.
        int j;
        for (j = 0; j <= maxintr; j++) {
  102bed:	89 7c 24 04          	mov    %edi,0x4(%esp)
        int maxintr = (ioapic_read(ioapic, IOAPIC_VER) >> 16) & 0xFF;
  102bf1:	c1 ed 10             	shr    $0x10,%ebp
  102bf4:	89 e8                	mov    %ebp,%eax
  102bf6:	0f b6 e8             	movzbl %al,%ebp
        for (j = 0; j <= maxintr; j++) {
  102bf9:	31 c0                	xor    %eax,%eax
  102bfb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
            ioapic_write(ioapic, IOAPIC_TABLE + 2 * j,
  102c00:	8d 14 00             	lea    (%eax,%eax,1),%edx
  102c03:	8d 58 20             	lea    0x20(%eax),%ebx
        for (j = 0; j <= maxintr; j++) {
  102c06:	83 c0 01             	add    $0x1,%eax
  102c09:	8d 7a 10             	lea    0x10(%edx),%edi
  102c0c:	81 cb 00 00 01 00    	or     $0x10000,%ebx
    base->reg = reg;
  102c12:	83 c2 11             	add    $0x11,%edx
  102c15:	89 3e                	mov    %edi,(%esi)
    base->data = data;
  102c17:	89 5e 10             	mov    %ebx,0x10(%esi)
    base->reg = reg;
  102c1a:	89 16                	mov    %edx,(%esi)
    base->data = data;
  102c1c:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
        for (j = 0; j <= maxintr; j++) {
  102c23:	39 c5                	cmp    %eax,%ebp
  102c25:	7d d9                	jge    102c00 <ioapic_init+0xd0>
    for (i = 0; i < ioapic_num; i++) {
  102c27:	8b 04 24             	mov    (%esp),%eax
  102c2a:	8b 7c 24 04          	mov    0x4(%esp),%edi
  102c2e:	8b 80 ac 68 04 00    	mov    0x468ac(%eax),%eax
  102c34:	83 c7 01             	add    $0x1,%edi
  102c37:	39 f8                	cmp    %edi,%eax
  102c39:	0f 8f 39 ff ff ff    	jg     102b78 <ioapic_init+0x48>
                         IOAPIC_INT_DISABLED | (T_IRQ0 + j));
            ioapic_write(ioapic, IOAPIC_TABLE + 2 * j + 1, 0);
        }
    }
}
  102c3f:	83 c4 1c             	add    $0x1c,%esp
  102c42:	5b                   	pop    %ebx
  102c43:	5e                   	pop    %esi
  102c44:	5f                   	pop    %edi
  102c45:	5d                   	pop    %ebp
  102c46:	c3                   	ret
  102c47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102c4e:	00 
  102c4f:	90                   	nop
  102c50:	89 4c 24 04          	mov    %ecx,0x4(%esp)
        KERN_ASSERT(ioapic != NULL);
  102c54:	ff 74 24 08          	push   0x8(%esp)
  102c58:	ff 74 24 10          	push   0x10(%esp)
  102c5c:	6a 2f                	push   $0x2f
  102c5e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  102c62:	8d 83 aa 72 ff ff    	lea    -0x8d56(%ebx),%eax
  102c68:	50                   	push   %eax
  102c69:	e8 72 1b 00 00       	call   1047e0 <debug_panic>
  102c6e:	83 c4 10             	add    $0x10,%esp
  102c71:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  102c75:	e9 10 ff ff ff       	jmp    102b8a <ioapic_init+0x5a>
  102c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102c80 <ioapic_enable>:

void ioapic_enable(uint8_t irq, lapicid_t apicid, bool trigger_mode, bool polarity)
{
  102c80:	55                   	push   %ebp
  102c81:	57                   	push   %edi
  102c82:	56                   	push   %esi
  102c83:	53                   	push   %ebx
  102c84:	e8 19 d7 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  102c89:	81 c3 6b 13 01 00    	add    $0x1136b,%ebx
  102c8f:	83 ec 2c             	sub    $0x2c,%esp
  102c92:	8b 44 24 44          	mov    0x44(%esp),%eax
  102c96:	8b 4c 24 40          	mov    0x40(%esp),%ecx
  102c9a:	8b 7c 24 4c          	mov    0x4c(%esp),%edi
  102c9e:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ca2:	8b 44 24 48          	mov    0x48(%esp),%eax
  102ca6:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
  102caa:	89 44 24 14          	mov    %eax,0x14(%esp)
    // Mark interrupt edge-triggered, active high,
    // enabled, and routed to the given APIC ID,
    int i;
    for (i = 0; i < ioapic_num; i++) {
  102cae:	8b 83 ac 68 04 00    	mov    0x468ac(%ebx),%eax
  102cb4:	85 c0                	test   %eax,%eax
  102cb6:	0f 8e dc 00 00 00    	jle    102d98 <ioapic_enable+0x118>
            break;
        }
    }

    if (i == ioapic_num)
        KERN_PANIC("Cannot enable IRQ %d on IOAPIC.\n", irq);
  102cbc:	0f b6 c9             	movzbl %cl,%ecx
  102cbf:	89 7c 24 18          	mov    %edi,0x18(%esp)
    for (i = 0; i < ioapic_num; i++) {
  102cc3:	31 c0                	xor    %eax,%eax
  102cc5:	8d b3 cc 68 04 00    	lea    0x468cc(%ebx),%esi
  102ccb:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  102ccf:	90                   	nop
        ioapic_t *ioapic = ioapics[i];
  102cd0:	8b 94 83 2c 69 04 00 	mov    0x4692c(%ebx,%eax,4),%edx
        if (irq >= gsi[i] && irq <= gsi[i] + maxintr) {
  102cd7:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    base->reg = reg;
  102cdb:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
    return base->data;
  102ce1:	8b 7a 10             	mov    0x10(%edx),%edi
        if (irq >= gsi[i] && irq <= gsi[i] + maxintr) {
  102ce4:	8b 2c 86             	mov    (%esi,%eax,4),%ebp
  102ce7:	39 cd                	cmp    %ecx,%ebp
  102ce9:	7f 15                	jg     102d00 <ioapic_enable+0x80>
        int maxintr = (ioapic_read(ioapic, IOAPIC_VER) >> 16) & 0xFF;
  102ceb:	c1 ef 10             	shr    $0x10,%edi
        if (irq >= gsi[i] && irq <= gsi[i] + maxintr) {
  102cee:	8b 2c 86             	mov    (%esi,%eax,4),%ebp
        int maxintr = (ioapic_read(ioapic, IOAPIC_VER) >> 16) & 0xFF;
  102cf1:	89 f9                	mov    %edi,%ecx
  102cf3:	0f b6 f9             	movzbl %cl,%edi
        if (irq >= gsi[i] && irq <= gsi[i] + maxintr) {
  102cf6:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  102cfa:	01 ef                	add    %ebp,%edi
  102cfc:	39 cf                	cmp    %ecx,%edi
  102cfe:	7d 20                	jge    102d20 <ioapic_enable+0xa0>
    for (i = 0; i < ioapic_num; i++) {
  102d00:	8b 93 ac 68 04 00    	mov    0x468ac(%ebx),%edx
  102d06:	83 c0 01             	add    $0x1,%eax
  102d09:	39 c2                	cmp    %eax,%edx
  102d0b:	7f c3                	jg     102cd0 <ioapic_enable+0x50>
    if (i == ioapic_num)
  102d0d:	8b 93 ac 68 04 00    	mov    0x468ac(%ebx),%edx
  102d13:	39 c2                	cmp    %eax,%edx
  102d15:	74 5b                	je     102d72 <ioapic_enable+0xf2>
}
  102d17:	83 c4 2c             	add    $0x2c,%esp
  102d1a:	5b                   	pop    %ebx
  102d1b:	5e                   	pop    %esi
  102d1c:	5f                   	pop    %edi
  102d1d:	5d                   	pop    %ebp
  102d1e:	c3                   	ret
  102d1f:	90                   	nop
                         ((trigger_mode << 15) | (polarity << 13) | (T_IRQ0 + irq)));
  102d20:	8b 7c 24 18          	mov    0x18(%esp),%edi
  102d24:	0f b6 6c 24 14       	movzbl 0x14(%esp),%ebp
  102d29:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102d2d:	89 fa                	mov    %edi,%edx
  102d2f:	c1 e5 0f             	shl    $0xf,%ebp
  102d32:	0f b6 fa             	movzbl %dl,%edi
                         IOAPIC_TABLE + 2 * (irq - gsi[i]),
  102d35:	89 ca                	mov    %ecx,%edx
                         ((trigger_mode << 15) | (polarity << 13) | (T_IRQ0 + irq)));
  102d37:	c1 e7 0d             	shl    $0xd,%edi
  102d3a:	09 ef                	or     %ebp,%edi
  102d3c:	8d 69 20             	lea    0x20(%ecx),%ebp
  102d3f:	09 fd                	or     %edi,%ebp
                         IOAPIC_TABLE + 2 * (irq - gsi[i]),
  102d41:	8b 3c 86             	mov    (%esi,%eax,4),%edi
  102d44:	29 fa                	sub    %edi,%edx
            ioapic_write(ioapic,
  102d46:	8d 7c 12 10          	lea    0x10(%edx,%edx,1),%edi
    base->reg = reg;
  102d4a:	8b 54 24 0c          	mov    0xc(%esp),%edx
  102d4e:	89 3a                	mov    %edi,(%edx)
            ioapic_write(ioapic,
  102d50:	8b 7c 24 10          	mov    0x10(%esp),%edi
    base->data = data;
  102d54:	89 6a 10             	mov    %ebp,0x10(%edx)
                         IOAPIC_TABLE + 2 * (irq - gsi[i]) + 1,
  102d57:	8b 34 86             	mov    (%esi,%eax,4),%esi
            ioapic_write(ioapic,
  102d5a:	c1 e7 18             	shl    $0x18,%edi
                         IOAPIC_TABLE + 2 * (irq - gsi[i]) + 1,
  102d5d:	29 f1                	sub    %esi,%ecx
            ioapic_write(ioapic,
  102d5f:	8d 4c 09 11          	lea    0x11(%ecx,%ecx,1),%ecx
    base->reg = reg;
  102d63:	89 0a                	mov    %ecx,(%edx)
    base->data = data;
  102d65:	89 7a 10             	mov    %edi,0x10(%edx)
    if (i == ioapic_num)
  102d68:	8b 93 ac 68 04 00    	mov    0x468ac(%ebx),%edx
  102d6e:	39 c2                	cmp    %eax,%edx
  102d70:	75 a5                	jne    102d17 <ioapic_enable+0x97>
        KERN_PANIC("Cannot enable IRQ %d on IOAPIC.\n", irq);
  102d72:	0f b6 44 24 1c       	movzbl 0x1c(%esp),%eax
  102d77:	50                   	push   %eax
  102d78:	8d 83 ac 7e ff ff    	lea    -0x8154(%ebx),%eax
  102d7e:	50                   	push   %eax
  102d7f:	8d 83 aa 72 ff ff    	lea    -0x8d56(%ebx),%eax
  102d85:	6a 5d                	push   $0x5d
  102d87:	50                   	push   %eax
  102d88:	e8 53 1a 00 00       	call   1047e0 <debug_panic>
  102d8d:	83 c4 10             	add    $0x10,%esp
}
  102d90:	83 c4 2c             	add    $0x2c,%esp
  102d93:	5b                   	pop    %ebx
  102d94:	5e                   	pop    %esi
  102d95:	5f                   	pop    %edi
  102d96:	5d                   	pop    %ebp
  102d97:	c3                   	ret
    for (i = 0; i < ioapic_num; i++) {
  102d98:	31 c0                	xor    %eax,%eax
  102d9a:	e9 6e ff ff ff       	jmp    102d0d <ioapic_enable+0x8d>
  102d9f:	90                   	nop

00102da0 <ioapic_number>:

int ioapic_number(void)
{
    return ioapic_num;
  102da0:	e8 f5 d5 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  102da5:	05 4f 12 01 00       	add    $0x1124f,%eax
  102daa:	8b 80 ac 68 04 00    	mov    0x468ac(%eax),%eax
}
  102db0:	c3                   	ret
  102db1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102db8:	00 
  102db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00102dc0 <ioapic_get>:

ioapic_t *ioapic_get(uint32_t idx)
{
    if (idx >= ioapic_num)
  102dc0:	e8 d5 d5 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  102dc5:	05 2f 12 01 00       	add    $0x1122f,%eax
{
  102dca:	8b 54 24 04          	mov    0x4(%esp),%edx
    if (idx >= ioapic_num)
  102dce:	8b 88 ac 68 04 00    	mov    0x468ac(%eax),%ecx
  102dd4:	39 ca                	cmp    %ecx,%edx
  102dd6:	73 08                	jae    102de0 <ioapic_get+0x20>
        return NULL;
    return ioapics[idx];
  102dd8:	8b 84 90 2c 69 04 00 	mov    0x4692c(%eax,%edx,4),%eax
  102ddf:	c3                   	ret
        return NULL;
  102de0:	31 c0                	xor    %eax,%eax
}
  102de2:	c3                   	ret

00102de3 <__x86.get_pc_thunk.cx>:
  102de3:	8b 0c 24             	mov    (%esp),%ecx
  102de6:	c3                   	ret
  102de7:	66 90                	xchg   %ax,%ax
  102de9:	66 90                	xchg   %ax,%ax
  102deb:	66 90                	xchg   %ax,%ax
  102ded:	66 90                	xchg   %ax,%ax
  102def:	90                   	nop

00102df0 <mpsearch1>:
    return sum;
}

/* Look for an MP structure in the len bytes at addr. */
static struct mp *mpsearch1(uint8_t *addr, int len)
{
  102df0:	55                   	push   %ebp
    uint8_t *e, *p;

    e = addr + len;
  102df1:	8d 2c 10             	lea    (%eax,%edx,1),%ebp
{
  102df4:	57                   	push   %edi
  102df5:	56                   	push   %esi
  102df6:	e8 aa 0d 00 00       	call   103ba5 <__x86.get_pc_thunk.si>
  102dfb:	81 c6 f9 11 01 00    	add    $0x111f9,%esi
  102e01:	53                   	push   %ebx
  102e02:	83 ec 1c             	sub    $0x1c,%esp
  102e05:	89 74 24 0c          	mov    %esi,0xc(%esp)
    for (p = addr; p < e; p += sizeof(struct mp))
  102e09:	39 e8                	cmp    %ebp,%eax
  102e0b:	73 5b                	jae    102e68 <mpsearch1+0x78>
  102e0d:	89 c7                	mov    %eax,%edi
  102e0f:	8d b6 cb 72 ff ff    	lea    -0x8d35(%esi),%esi
  102e15:	eb 0f                	jmp    102e26 <mpsearch1+0x36>
  102e17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102e1e:	00 
  102e1f:	90                   	nop
  102e20:	89 df                	mov    %ebx,%edi
  102e22:	39 eb                	cmp    %ebp,%ebx
  102e24:	73 42                	jae    102e68 <mpsearch1+0x78>
        if (memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  102e26:	83 ec 04             	sub    $0x4,%esp
  102e29:	6a 04                	push   $0x4
  102e2b:	56                   	push   %esi
  102e2c:	57                   	push   %edi
  102e2d:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  102e31:	e8 ea 17 00 00       	call   104620 <memcmp>
  102e36:	83 c4 10             	add    $0x10,%esp
  102e39:	8d 5f 10             	lea    0x10(%edi),%ebx
  102e3c:	85 c0                	test   %eax,%eax
  102e3e:	75 e0                	jne    102e20 <mpsearch1+0x30>
  102e40:	89 fa                	mov    %edi,%edx
  102e42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        sum += addr[i];
  102e48:	0f b6 0a             	movzbl (%edx),%ecx
    for (i = 0; i < len; i++)
  102e4b:	83 c2 01             	add    $0x1,%edx
        sum += addr[i];
  102e4e:	01 c8                	add    %ecx,%eax
    for (i = 0; i < len; i++)
  102e50:	39 da                	cmp    %ebx,%edx
  102e52:	75 f4                	jne    102e48 <mpsearch1+0x58>
        if (memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  102e54:	84 c0                	test   %al,%al
  102e56:	75 c8                	jne    102e20 <mpsearch1+0x30>
            return (struct mp *) p;
    return 0;
}
  102e58:	83 c4 1c             	add    $0x1c,%esp
            return (struct mp *) p;
  102e5b:	89 f8                	mov    %edi,%eax
}
  102e5d:	5b                   	pop    %ebx
  102e5e:	5e                   	pop    %esi
  102e5f:	5f                   	pop    %edi
  102e60:	5d                   	pop    %ebp
  102e61:	c3                   	ret
  102e62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102e68:	83 c4 1c             	add    $0x1c,%esp
    return 0;
  102e6b:	31 c0                	xor    %eax,%eax
}
  102e6d:	5b                   	pop    %ebx
  102e6e:	5e                   	pop    %esi
  102e6f:	5f                   	pop    %edi
  102e70:	5d                   	pop    %ebp
  102e71:	c3                   	ret
  102e72:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102e79:	00 
  102e7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00102e80 <pcpu_mp_init>:

/*
 * Multiple processors initialization method using ACPI
 */
bool pcpu_mp_init(void)
{
  102e80:	55                   	push   %ebp
  102e81:	57                   	push   %edi
  102e82:	56                   	push   %esi
  102e83:	53                   	push   %ebx
  102e84:	e8 19 d5 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  102e89:	81 c3 6b 11 01 00    	add    $0x1116b,%ebx
  102e8f:	83 ec 2c             	sub    $0x2c,%esp
    acpi_xsdt_t *xsdt;
    acpi_madt_t *madt;
    uint32_t ap_idx = 1;
    bool found_bsp = FALSE;

    if (mp_inited == TRUE)
  102e92:	80 bb 6d 69 04 00 01 	cmpb   $0x1,0x4696d(%ebx)
  102e99:	0f 84 92 01 00 00    	je     103031 <pcpu_mp_init+0x1b1>
        return TRUE;

    KERN_INFO("\n");
  102e9f:	83 ec 0c             	sub    $0xc,%esp
  102ea2:	8d 83 06 76 ff ff    	lea    -0x89fa(%ebx),%eax
  102ea8:	50                   	push   %eax
  102ea9:	e8 92 18 00 00       	call   104740 <debug_info>

    if ((rsdp = acpi_probe_rsdp()) == NULL) {
  102eae:	e8 dd f3 ff ff       	call   102290 <acpi_probe_rsdp>
  102eb3:	83 c4 10             	add    $0x10,%esp
  102eb6:	89 c6                	mov    %eax,%esi
  102eb8:	85 c0                	test   %eax,%eax
  102eba:	0f 84 50 02 00 00    	je     103110 <pcpu_mp_init+0x290>
        KERN_DEBUG("Not found RSDP.\n");
        goto fallback;
    }

    xsdt = NULL;
    if ((xsdt = acpi_probe_xsdt(rsdp)) == NULL &&
  102ec0:	83 ec 0c             	sub    $0xc,%esp
  102ec3:	50                   	push   %eax
  102ec4:	e8 b7 f5 ff ff       	call   102480 <acpi_probe_xsdt>
  102ec9:	83 c4 10             	add    $0x10,%esp
  102ecc:	85 c0                	test   %eax,%eax
  102ece:	0f 84 dc 01 00 00    	je     1030b0 <pcpu_mp_init+0x230>
        goto fallback;
    }

    if ((madt =
         (xsdt != NULL) ?
         (acpi_madt_t *) acpi_probe_xsdt_ent(xsdt, ACPI_MADT_SIG) :
  102ed4:	83 ec 08             	sub    $0x8,%esp
  102ed7:	68 41 50 49 43       	push   $0x43495041
  102edc:	50                   	push   %eax
  102edd:	e8 2e f6 ff ff       	call   102510 <acpi_probe_xsdt_ent>
  102ee2:	83 c4 10             	add    $0x10,%esp
  102ee5:	89 c7                	mov    %eax,%edi
    if ((madt =
  102ee7:	85 ff                	test   %edi,%edi
  102ee9:	0f 84 61 04 00 00    	je     103350 <pcpu_mp_init+0x4d0>
        KERN_DEBUG("Not found MADT.\n");
        goto fallback;
    }

    ismp = TRUE;
    lapic_register(madt->lapic_addr);
  102eef:	83 ec 0c             	sub    $0xc,%esp
  102ef2:	ff 77 24             	push   0x24(%edi)
    ncpu = 0;

    p = (uint8_t *) madt->ent;
  102ef5:	8d 6f 2c             	lea    0x2c(%edi),%ebp
    ismp = TRUE;
  102ef8:	c6 83 6c 69 04 00 01 	movb   $0x1,0x4696c(%ebx)
    lapic_register(madt->lapic_addr);
  102eff:	e8 ac f6 ff ff       	call   1025b0 <lapic_register>
    e = (uint8_t *) madt + madt->length;
  102f04:	8b 77 04             	mov    0x4(%edi),%esi

    while (p < e) {
  102f07:	83 c4 10             	add    $0x10,%esp
    ncpu = 0;
  102f0a:	c7 83 70 69 04 00 00 	movl   $0x0,0x46970(%ebx)
  102f11:	00 00 00 
    e = (uint8_t *) madt + madt->length;
  102f14:	01 fe                	add    %edi,%esi
    while (p < e) {
  102f16:	39 f5                	cmp    %esi,%ebp
  102f18:	0f 83 e6 00 00 00    	jae    103004 <pcpu_mp_init+0x184>

            if (!(lapic_ent->flags & ACPI_APIC_ENABLED)) {
                break;
            }

            KERN_INFO("\tCPU%d: APIC id = %x, ", ncpu, lapic_ent->lapic_id);
  102f1e:	8d 83 05 73 ff ff    	lea    -0x8cfb(%ebx),%eax
    bool found_bsp = FALSE;
  102f24:	31 c9                	xor    %ecx,%ecx

            ioapic_register(ioapic_ent->ioapic_addr, ioapic_ent->ioapic_id,
                            ioapic_ent->gsi);
            break;
        default:
            KERN_INFO("\tUnhandled ACPI entry (type=%x)\n", hdr->type);
  102f26:	89 7c 24 18          	mov    %edi,0x18(%esp)
  102f2a:	89 ef                	mov    %ebp,%edi
            KERN_INFO("\tCPU%d: APIC id = %x, ", ncpu, lapic_ent->lapic_id);
  102f2c:	89 44 24 14          	mov    %eax,0x14(%esp)
            KERN_INFO("\tUnhandled ACPI entry (type=%x)\n", hdr->type);
  102f30:	8d 83 14 7f ff ff    	lea    -0x80ec(%ebx),%eax
  102f36:	89 cd                	mov    %ecx,%ebp
    uint32_t ap_idx = 1;
  102f38:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
  102f3f:	00 
            KERN_INFO("\tUnhandled ACPI entry (type=%x)\n", hdr->type);
  102f40:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f44:	eb 30                	jmp    102f76 <pcpu_mp_init+0xf6>
  102f46:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  102f4d:	00 
  102f4e:	66 90                	xchg   %ax,%ax
        switch (hdr->type) {
  102f50:	3c 01                	cmp    $0x1,%al
  102f52:	0f 84 e8 00 00 00    	je     103040 <pcpu_mp_init+0x1c0>
            KERN_INFO("\tUnhandled ACPI entry (type=%x)\n", hdr->type);
  102f58:	83 ec 08             	sub    $0x8,%esp
  102f5b:	50                   	push   %eax
  102f5c:	ff 74 24 18          	push   0x18(%esp)
  102f60:	e8 db 17 00 00       	call   104740 <debug_info>
            break;
  102f65:	83 c4 10             	add    $0x10,%esp
        }

        p += hdr->length;
  102f68:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  102f6c:	01 c7                	add    %eax,%edi
    while (p < e) {
  102f6e:	39 f7                	cmp    %esi,%edi
  102f70:	0f 83 8a 00 00 00    	jae    103000 <pcpu_mp_init+0x180>
        switch (hdr->type) {
  102f76:	0f b6 07             	movzbl (%edi),%eax
  102f79:	84 c0                	test   %al,%al
  102f7b:	75 d3                	jne    102f50 <pcpu_mp_init+0xd0>
            if (!(lapic_ent->flags & ACPI_APIC_ENABLED)) {
  102f7d:	f6 47 04 01          	testb  $0x1,0x4(%edi)
  102f81:	74 e5                	je     102f68 <pcpu_mp_init+0xe8>
            KERN_INFO("\tCPU%d: APIC id = %x, ", ncpu, lapic_ent->lapic_id);
  102f83:	0f b6 47 03          	movzbl 0x3(%edi),%eax
  102f87:	83 ec 04             	sub    $0x4,%esp
  102f8a:	50                   	push   %eax
  102f8b:	ff b3 70 69 04 00    	push   0x46970(%ebx)
  102f91:	ff 74 24 20          	push   0x20(%esp)
  102f95:	e8 a6 17 00 00       	call   104740 <debug_info>
            if (!found_bsp) {
  102f9a:	89 e8                	mov    %ebp,%eax
  102f9c:	83 c4 10             	add    $0x10,%esp
  102f9f:	84 c0                	test   %al,%al
  102fa1:	0f 84 d1 00 00 00    	je     103078 <pcpu_mp_init+0x1f8>
                KERN_INFO("AP\n");
  102fa7:	83 ec 0c             	sub    $0xc,%esp
  102faa:	8d 83 21 73 ff ff    	lea    -0x8cdf(%ebx),%eax
  102fb0:	50                   	push   %eax
  102fb1:	e8 8a 17 00 00       	call   104740 <debug_info>
    if (idx >= NUM_CPUS)
  102fb6:	8b 44 24 20          	mov    0x20(%esp),%eax
  102fba:	83 c4 10             	add    $0x10,%esp
  102fbd:	83 f8 07             	cmp    $0x7,%eax
  102fc0:	77 1b                	ja     102fdd <pcpu_mp_init+0x15d>
    struct pcpuinfo *info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(idx);
  102fc2:	83 ec 0c             	sub    $0xc,%esp
                pcpu_mp_init_cpu(ap_idx, lapic_ent->lapic_id, FALSE);
  102fc5:	0f b6 6f 03          	movzbl 0x3(%edi),%ebp
    struct pcpuinfo *info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(idx);
  102fc9:	50                   	push   %eax
  102fca:	e8 b1 34 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    info->lapicid = lapic_id;
  102fcf:	89 e9                	mov    %ebp,%ecx
    info->bsp = is_bsp;
  102fd1:	83 c4 10             	add    $0x10,%esp
    info->lapicid = lapic_id;
  102fd4:	0f b6 e9             	movzbl %cl,%ebp
    info->bsp = is_bsp;
  102fd7:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    info->lapicid = lapic_id;
  102fdb:	89 28                	mov    %ebp,(%eax)
                ap_idx++;
  102fdd:	83 44 24 10 01       	addl   $0x1,0x10(%esp)
        p += hdr->length;
  102fe2:	0f b6 47 01          	movzbl 0x1(%edi),%eax
            ncpu++;
  102fe6:	83 83 70 69 04 00 01 	addl   $0x1,0x46970(%ebx)
            break;
  102fed:	bd 01 00 00 00       	mov    $0x1,%ebp
        p += hdr->length;
  102ff2:	01 c7                	add    %eax,%edi
    while (p < e) {
  102ff4:	39 f7                	cmp    %esi,%edi
  102ff6:	0f 82 7a ff ff ff    	jb     102f76 <pcpu_mp_init+0xf6>
  102ffc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103000:	8b 7c 24 18          	mov    0x18(%esp),%edi
    /*
     * Force NMI and 8259 signals to APIC when PIC mode
     * is not implemented.
     *
     */
    if ((madt->flags & APIC_MADT_PCAT_COMPAT) == 0) {
  103004:	f6 47 28 01          	testb  $0x1,0x28(%edi)
  103008:	0f 84 d2 00 00 00    	je     1030e0 <pcpu_mp_init+0x260>
    }

    /*
     * Copy AP boot code to 0x8000.
     */
    memmove((uint8_t *) 0x8000,
  10300e:	83 ec 04             	sub    $0x4,%esp
  103011:	ff b3 dc ff ff ff    	push   -0x24(%ebx)
  103017:	ff b3 f0 ff ff ff    	push   -0x10(%ebx)
  10301d:	68 00 80 00 00       	push   $0x8000
  103022:	e8 39 14 00 00       	call   104460 <memmove>
            _binary___obj_kern_init_boot_ap_start,
            (size_t) _binary___obj_kern_init_boot_ap_size);

    mp_inited = TRUE;
  103027:	c6 83 6d 69 04 00 01 	movb   $0x1,0x4696d(%ebx)
    return TRUE;
  10302e:	83 c4 10             	add    $0x10,%esp
        ismp = 0;
        ncpu = 1;
        return FALSE;
    } else
        return TRUE;
}
  103031:	83 c4 2c             	add    $0x2c,%esp
        return TRUE;
  103034:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103039:	5b                   	pop    %ebx
  10303a:	5e                   	pop    %esi
  10303b:	5f                   	pop    %edi
  10303c:	5d                   	pop    %ebp
  10303d:	c3                   	ret
  10303e:	66 90                	xchg   %ax,%ax
            KERN_INFO("\tIOAPIC: APIC id = %x, base = %x\n",
  103040:	83 ec 04             	sub    $0x4,%esp
  103043:	ff 77 04             	push   0x4(%edi)
  103046:	0f b6 47 02          	movzbl 0x2(%edi),%eax
  10304a:	50                   	push   %eax
  10304b:	8d 83 f0 7e ff ff    	lea    -0x8110(%ebx),%eax
  103051:	50                   	push   %eax
  103052:	e8 e9 16 00 00       	call   104740 <debug_info>
            ioapic_register(ioapic_ent->ioapic_addr, ioapic_ent->ioapic_id,
  103057:	83 c4 0c             	add    $0xc,%esp
  10305a:	ff 77 08             	push   0x8(%edi)
  10305d:	0f b6 47 02          	movzbl 0x2(%edi),%eax
  103061:	50                   	push   %eax
  103062:	ff 77 04             	push   0x4(%edi)
  103065:	e8 36 fa ff ff       	call   102aa0 <ioapic_register>
            break;
  10306a:	83 c4 10             	add    $0x10,%esp
  10306d:	e9 f6 fe ff ff       	jmp    102f68 <pcpu_mp_init+0xe8>
  103072:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                KERN_INFO("BSP\n");
  103078:	83 ec 0c             	sub    $0xc,%esp
  10307b:	8d 83 1c 73 ff ff    	lea    -0x8ce4(%ebx),%eax
  103081:	50                   	push   %eax
  103082:	e8 b9 16 00 00       	call   104740 <debug_info>
                pcpu_mp_init_cpu(0, lapic_ent->lapic_id, TRUE);
  103087:	0f b6 6f 03          	movzbl 0x3(%edi),%ebp
    struct pcpuinfo *info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(idx);
  10308b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  103092:	e8 e9 33 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    info->bsp = is_bsp;
  103097:	83 c4 10             	add    $0x10,%esp
    info->lapicid = lapic_id;
  10309a:	89 e9                	mov    %ebp,%ecx
    info->bsp = is_bsp;
  10309c:	c6 40 04 01          	movb   $0x1,0x4(%eax)
    info->lapicid = lapic_id;
  1030a0:	0f b6 e9             	movzbl %cl,%ebp
  1030a3:	89 28                	mov    %ebp,(%eax)
    info->bsp = is_bsp;
  1030a5:	e9 38 ff ff ff       	jmp    102fe2 <pcpu_mp_init+0x162>
  1030aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        (rsdt = acpi_probe_rsdt(rsdp)) == NULL) {
  1030b0:	83 ec 0c             	sub    $0xc,%esp
  1030b3:	56                   	push   %esi
  1030b4:	e8 97 f2 ff ff       	call   102350 <acpi_probe_rsdt>
    if ((xsdt = acpi_probe_xsdt(rsdp)) == NULL &&
  1030b9:	83 c4 10             	add    $0x10,%esp
  1030bc:	85 c0                	test   %eax,%eax
  1030be:	0f 84 d3 03 00 00    	je     103497 <pcpu_mp_init+0x617>
         (acpi_madt_t *) acpi_probe_rsdt_ent(rsdt, ACPI_MADT_SIG)) == NULL) {
  1030c4:	83 ec 08             	sub    $0x8,%esp
  1030c7:	68 41 50 49 43       	push   $0x43495041
  1030cc:	50                   	push   %eax
  1030cd:	e8 0e f3 ff ff       	call   1023e0 <acpi_probe_rsdt_ent>
  1030d2:	83 c4 10             	add    $0x10,%esp
  1030d5:	89 c7                	mov    %eax,%edi
  1030d7:	e9 0b fe ff ff       	jmp    102ee7 <pcpu_mp_init+0x67>
  1030dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        outb(0x22, 0x70);
  1030e0:	83 ec 08             	sub    $0x8,%esp
  1030e3:	6a 70                	push   $0x70
  1030e5:	6a 22                	push   $0x22
  1030e7:	e8 34 25 00 00       	call   105620 <outb>
        outb(0x23, inb(0x23) | 1);
  1030ec:	c7 04 24 23 00 00 00 	movl   $0x23,(%esp)
  1030f3:	e8 f8 24 00 00       	call   1055f0 <inb>
  1030f8:	5e                   	pop    %esi
  1030f9:	5f                   	pop    %edi
  1030fa:	83 c8 01             	or     $0x1,%eax
  1030fd:	0f b6 c0             	movzbl %al,%eax
  103100:	50                   	push   %eax
  103101:	6a 23                	push   $0x23
  103103:	e8 18 25 00 00       	call   105620 <outb>
  103108:	83 c4 10             	add    $0x10,%esp
  10310b:	e9 fe fe ff ff       	jmp    10300e <pcpu_mp_init+0x18e>
        KERN_DEBUG("Not found RSDP.\n");
  103110:	83 ec 04             	sub    $0x4,%esp
  103113:	8d 83 d0 72 ff ff    	lea    -0x8d30(%ebx),%eax
  103119:	50                   	push   %eax
  10311a:	68 4f 01 00 00       	push   $0x14f
        KERN_DEBUG("Not found MADT.\n");
  10311f:	8d 83 e1 72 ff ff    	lea    -0x8d1f(%ebx),%eax
  103125:	89 44 24 18          	mov    %eax,0x18(%esp)
  103129:	50                   	push   %eax
  10312a:	e8 51 16 00 00       	call   104780 <debug_normal>
        goto fallback;
  10312f:	83 c4 10             	add    $0x10,%esp
    KERN_DEBUG("Use the fallback multiprocessor initialization.\n");
  103132:	8d 83 38 7f ff ff    	lea    -0x80c8(%ebx),%eax
  103138:	83 ec 04             	sub    $0x4,%esp
  10313b:	50                   	push   %eax
  10313c:	68 ac 01 00 00       	push   $0x1ac
  103141:	ff 74 24 18          	push   0x18(%esp)
  103145:	e8 36 16 00 00       	call   104780 <debug_normal>
    if (mp_inited == TRUE)
  10314a:	83 c4 10             	add    $0x10,%esp
  10314d:	80 bb 6d 69 04 00 01 	cmpb   $0x1,0x4696d(%ebx)
  103154:	0f 84 d7 fe ff ff    	je     103031 <pcpu_mp_init+0x1b1>
    if ((p = ((bda[0x0F] << 8) | bda[0x0E]) << 4)) {
  10315a:	0f b6 05 0f 04 00 00 	movzbl 0x40f,%eax
  103161:	0f b6 15 0e 04 00 00 	movzbl 0x40e,%edx
  103168:	c1 e0 08             	shl    $0x8,%eax
  10316b:	09 d0                	or     %edx,%eax
  10316d:	c1 e0 04             	shl    $0x4,%eax
  103170:	75 1b                	jne    10318d <pcpu_mp_init+0x30d>
        p = ((bda[0x14] << 8) | bda[0x13]) * 1024;
  103172:	0f b6 05 14 04 00 00 	movzbl 0x414,%eax
  103179:	0f b6 15 13 04 00 00 	movzbl 0x413,%edx
  103180:	c1 e0 08             	shl    $0x8,%eax
  103183:	09 d0                	or     %edx,%eax
  103185:	c1 e0 0a             	shl    $0xa,%eax
        if ((mp = mpsearch1((uint8_t *) p - 1024, 1024)))
  103188:	2d 00 04 00 00       	sub    $0x400,%eax
        if ((mp = mpsearch1((uint8_t *) p, 1024)))
  10318d:	ba 00 04 00 00       	mov    $0x400,%edx
  103192:	e8 59 fc ff ff       	call   102df0 <mpsearch1>
  103197:	89 c7                	mov    %eax,%edi
  103199:	85 c0                	test   %eax,%eax
  10319b:	0f 84 3f 02 00 00    	je     1033e0 <pcpu_mp_init+0x560>
    if ((mp = mpsearch()) == 0 || mp->physaddr == 0)
  1031a1:	8b 77 04             	mov    0x4(%edi),%esi
  1031a4:	85 f6                	test   %esi,%esi
  1031a6:	0f 84 f4 00 00 00    	je     1032a0 <pcpu_mp_init+0x420>
    if (memcmp(conf, "PCMP", 4) != 0)
  1031ac:	83 ec 04             	sub    $0x4,%esp
  1031af:	8d 83 25 73 ff ff    	lea    -0x8cdb(%ebx),%eax
  1031b5:	6a 04                	push   $0x4
  1031b7:	50                   	push   %eax
  1031b8:	56                   	push   %esi
  1031b9:	e8 62 14 00 00       	call   104620 <memcmp>
  1031be:	83 c4 10             	add    $0x10,%esp
  1031c1:	89 c2                	mov    %eax,%edx
  1031c3:	85 c0                	test   %eax,%eax
  1031c5:	0f 85 d5 00 00 00    	jne    1032a0 <pcpu_mp_init+0x420>
    if (conf->version != 1 && conf->version != 4)
  1031cb:	0f b6 46 06          	movzbl 0x6(%esi),%eax
  1031cf:	3c 01                	cmp    $0x1,%al
  1031d1:	74 08                	je     1031db <pcpu_mp_init+0x35b>
  1031d3:	3c 04                	cmp    $0x4,%al
  1031d5:	0f 85 c5 00 00 00    	jne    1032a0 <pcpu_mp_init+0x420>
    if (sum((uint8_t *) conf, conf->length) != 0)
  1031db:	0f b7 6e 04          	movzwl 0x4(%esi),%ebp
    for (i = 0; i < len; i++)
  1031df:	66 85 ed             	test   %bp,%bp
  1031e2:	74 20                	je     103204 <pcpu_mp_init+0x384>
  1031e4:	89 f0                	mov    %esi,%eax
  1031e6:	01 f5                	add    %esi,%ebp
  1031e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1031ef:	00 
        sum += addr[i];
  1031f0:	0f b6 08             	movzbl (%eax),%ecx
    for (i = 0; i < len; i++)
  1031f3:	83 c0 01             	add    $0x1,%eax
        sum += addr[i];
  1031f6:	01 ca                	add    %ecx,%edx
    for (i = 0; i < len; i++)
  1031f8:	39 e8                	cmp    %ebp,%eax
  1031fa:	75 f4                	jne    1031f0 <pcpu_mp_init+0x370>
    if (sum((uint8_t *) conf, conf->length) != 0)
  1031fc:	84 d2                	test   %dl,%dl
  1031fe:	0f 85 9c 00 00 00    	jne    1032a0 <pcpu_mp_init+0x420>
    lapic_register((uintptr_t) conf->lapicaddr);
  103204:	83 ec 0c             	sub    $0xc,%esp
  103207:	ff 76 24             	push   0x24(%esi)
    for (p = (uint8_t *) (conf + 1), e = (uint8_t *) conf + conf->length; p < e;) {
  10320a:	8d 6e 2c             	lea    0x2c(%esi),%ebp
    ismp = 1;
  10320d:	c6 83 6c 69 04 00 01 	movb   $0x1,0x4696c(%ebx)
    ncpu = 0;
  103214:	c7 83 70 69 04 00 00 	movl   $0x0,0x46970(%ebx)
  10321b:	00 00 00 
    lapic_register((uintptr_t) conf->lapicaddr);
  10321e:	e8 8d f3 ff ff       	call   1025b0 <lapic_register>
    for (p = (uint8_t *) (conf + 1), e = (uint8_t *) conf + conf->length; p < e;) {
  103223:	0f b7 46 04          	movzwl 0x4(%esi),%eax
  103227:	83 c4 10             	add    $0x10,%esp
    uint32_t ap_idx = 1;
  10322a:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  103231:	00 
    for (p = (uint8_t *) (conf + 1), e = (uint8_t *) conf + conf->length; p < e;) {
  103232:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
            KERN_INFO("\tIOAPIC: APIC id = %x, base = %x\n",
  103235:	8d 83 f0 7e ff ff    	lea    -0x8110(%ebx),%eax
  10323b:	89 44 24 10          	mov    %eax,0x10(%esp)
            KERN_WARN("mpinit: unknown config type %x\n", *p);
  10323f:	8d 83 6c 7f ff ff    	lea    -0x8094(%ebx),%eax
    for (p = (uint8_t *) (conf + 1), e = (uint8_t *) conf + conf->length; p < e;) {
  103245:	39 cd                	cmp    %ecx,%ebp
  103247:	0f 83 c7 00 00 00    	jae    103314 <pcpu_mp_init+0x494>
  10324d:	89 7c 24 18          	mov    %edi,0x18(%esp)
  103251:	89 ce                	mov    %ecx,%esi
  103253:	89 44 24 14          	mov    %eax,0x14(%esp)
  103257:	eb 1a                	jmp    103273 <pcpu_mp_init+0x3f3>
  103259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        switch (*p) {
  103260:	84 d2                	test   %dl,%dl
  103262:	0f 84 90 00 00 00    	je     1032f8 <pcpu_mp_init+0x478>
            p += 8;
  103268:	83 c5 08             	add    $0x8,%ebp
    for (p = (uint8_t *) (conf + 1), e = (uint8_t *) conf + conf->length; p < e;) {
  10326b:	39 f5                	cmp    %esi,%ebp
  10326d:	0f 83 9d 00 00 00    	jae    103310 <pcpu_mp_init+0x490>
        switch (*p) {
  103273:	0f b6 55 00          	movzbl 0x0(%ebp),%edx
  103277:	80 fa 02             	cmp    $0x2,%dl
  10327a:	74 44                	je     1032c0 <pcpu_mp_init+0x440>
  10327c:	76 e2                	jbe    103260 <pcpu_mp_init+0x3e0>
  10327e:	8d 4a fd             	lea    -0x3(%edx),%ecx
  103281:	80 f9 01             	cmp    $0x1,%cl
  103284:	76 e2                	jbe    103268 <pcpu_mp_init+0x3e8>
            KERN_WARN("mpinit: unknown config type %x\n", *p);
  103286:	52                   	push   %edx
  103287:	ff 74 24 18          	push   0x18(%esp)
  10328b:	68 28 01 00 00       	push   $0x128
  103290:	ff 74 24 18          	push   0x18(%esp)
  103294:	e8 57 16 00 00       	call   1048f0 <debug_warn>
  103299:	83 c4 10             	add    $0x10,%esp
  10329c:	eb cd                	jmp    10326b <pcpu_mp_init+0x3eb>
  10329e:	66 90                	xchg   %ax,%ax
        ismp = 0;
  1032a0:	c6 83 6c 69 04 00 00 	movb   $0x0,0x4696c(%ebx)
        return FALSE;
  1032a7:	31 c0                	xor    %eax,%eax
        ncpu = 1;
  1032a9:	c7 83 70 69 04 00 01 	movl   $0x1,0x46970(%ebx)
  1032b0:	00 00 00 
}
  1032b3:	83 c4 2c             	add    $0x2c,%esp
  1032b6:	5b                   	pop    %ebx
  1032b7:	5e                   	pop    %esi
  1032b8:	5f                   	pop    %edi
  1032b9:	5d                   	pop    %ebp
  1032ba:	c3                   	ret
  1032bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
            KERN_INFO("\tIOAPIC: APIC id = %x, base = %x\n",
  1032c0:	83 ec 04             	sub    $0x4,%esp
  1032c3:	ff 75 04             	push   0x4(%ebp)
  1032c6:	0f b6 55 01          	movzbl 0x1(%ebp),%edx
            p += sizeof(struct mpioapic);
  1032ca:	8d 7d 08             	lea    0x8(%ebp),%edi
            KERN_INFO("\tIOAPIC: APIC id = %x, base = %x\n",
  1032cd:	52                   	push   %edx
  1032ce:	ff 74 24 1c          	push   0x1c(%esp)
  1032d2:	e8 69 14 00 00       	call   104740 <debug_info>
            ioapic_register((uintptr_t) mpio->addr, mpio->apicno, 0);
  1032d7:	83 c4 0c             	add    $0xc,%esp
  1032da:	6a 00                	push   $0x0
  1032dc:	0f b6 55 01          	movzbl 0x1(%ebp),%edx
  1032e0:	52                   	push   %edx
  1032e1:	ff 75 04             	push   0x4(%ebp)
            p += sizeof(struct mpioapic);
  1032e4:	89 fd                	mov    %edi,%ebp
            ioapic_register((uintptr_t) mpio->addr, mpio->apicno, 0);
  1032e6:	e8 b5 f7 ff ff       	call   102aa0 <ioapic_register>
            continue;
  1032eb:	83 c4 10             	add    $0x10,%esp
  1032ee:	e9 78 ff ff ff       	jmp    10326b <pcpu_mp_init+0x3eb>
  1032f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
            p += sizeof(struct mpproc);
  1032f8:	8d 7d 14             	lea    0x14(%ebp),%edi
            if (!(proc->flags & MPENAB))
  1032fb:	f6 45 03 01          	testb  $0x1,0x3(%ebp)
  1032ff:	75 67                	jne    103368 <pcpu_mp_init+0x4e8>
            p += sizeof(struct mpproc);
  103301:	89 fd                	mov    %edi,%ebp
  103303:	e9 63 ff ff ff       	jmp    10326b <pcpu_mp_init+0x3eb>
  103308:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10330f:	00 
  103310:	8b 7c 24 18          	mov    0x18(%esp),%edi
    if (mp->imcrp) {
  103314:	80 7f 0c 00          	cmpb   $0x0,0xc(%edi)
  103318:	0f 85 49 01 00 00    	jne    103467 <pcpu_mp_init+0x5e7>
    memcpy((uint8_t *) 0x8000,
  10331e:	83 ec 04             	sub    $0x4,%esp
  103321:	ff b3 dc ff ff ff    	push   -0x24(%ebx)
  103327:	ff b3 f0 ff ff ff    	push   -0x10(%ebx)
  10332d:	68 00 80 00 00       	push   $0x8000
  103332:	e8 99 11 00 00       	call   1044d0 <memcpy>
    mp_inited = TRUE;
  103337:	c6 83 6d 69 04 00 01 	movb   $0x1,0x4696d(%ebx)
  10333e:	83 c4 10             	add    $0x10,%esp
  103341:	e9 eb fc ff ff       	jmp    103031 <pcpu_mp_init+0x1b1>
  103346:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10334d:	00 
  10334e:	66 90                	xchg   %ax,%ax
        KERN_DEBUG("Not found MADT.\n");
  103350:	83 ec 04             	sub    $0x4,%esp
  103353:	8d 83 f4 72 ff ff    	lea    -0x8d0c(%ebx),%eax
  103359:	50                   	push   %eax
  10335a:	68 5e 01 00 00       	push   $0x15e
  10335f:	e9 bb fd ff ff       	jmp    10311f <pcpu_mp_init+0x29f>
  103364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
            KERN_INFO("\tCPU%d: APIC id = %x, ", ncpu, proc->apicid);
  103368:	0f b6 4d 01          	movzbl 0x1(%ebp),%ecx
  10336c:	83 ec 04             	sub    $0x4,%esp
  10336f:	51                   	push   %ecx
  103370:	8d 8b 05 73 ff ff    	lea    -0x8cfb(%ebx),%ecx
  103376:	ff b3 70 69 04 00    	push   0x46970(%ebx)
  10337c:	51                   	push   %ecx
  10337d:	e8 be 13 00 00       	call   104740 <debug_info>
            if (proc->flags & MPBOOT) {
  103382:	83 c4 10             	add    $0x10,%esp
  103385:	f6 45 03 02          	testb  $0x2,0x3(%ebp)
  103389:	0f 85 a6 00 00 00    	jne    103435 <pcpu_mp_init+0x5b5>
                KERN_INFO("AP.\n");
  10338f:	83 ec 0c             	sub    $0xc,%esp
  103392:	8d 8b 30 73 ff ff    	lea    -0x8cd0(%ebx),%ecx
  103398:	51                   	push   %ecx
  103399:	e8 a2 13 00 00       	call   104740 <debug_info>
    if (idx >= NUM_CPUS)
  10339e:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  1033a2:	83 c4 10             	add    $0x10,%esp
  1033a5:	83 f8 07             	cmp    $0x7,%eax
  1033a8:	77 1b                	ja     1033c5 <pcpu_mp_init+0x545>
    struct pcpuinfo *info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(idx);
  1033aa:	83 ec 0c             	sub    $0xc,%esp
                pcpu_mp_init_cpu(ap_idx, proc->apicid, FALSE);
  1033ad:	0f b6 6d 01          	movzbl 0x1(%ebp),%ebp
    struct pcpuinfo *info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(idx);
  1033b1:	50                   	push   %eax
  1033b2:	e8 c9 30 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    info->lapicid = lapic_id;
  1033b7:	89 e9                	mov    %ebp,%ecx
    info->bsp = is_bsp;
  1033b9:	83 c4 10             	add    $0x10,%esp
    info->lapicid = lapic_id;
  1033bc:	0f b6 d1             	movzbl %cl,%edx
    info->bsp = is_bsp;
  1033bf:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    info->lapicid = lapic_id;
  1033c3:	89 10                	mov    %edx,(%eax)
                ap_idx++;
  1033c5:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
            ncpu++;
  1033ca:	83 83 70 69 04 00 01 	addl   $0x1,0x46970(%ebx)
            p += sizeof(struct mpproc);
  1033d1:	89 fd                	mov    %edi,%ebp
            continue;
  1033d3:	e9 93 fe ff ff       	jmp    10326b <pcpu_mp_init+0x3eb>
  1033d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1033df:	00 
            break;
  1033e0:	bf 00 00 0f 00       	mov    $0xf0000,%edi
  1033e5:	8d b3 cb 72 ff ff    	lea    -0x8d35(%ebx),%esi
  1033eb:	eb 11                	jmp    1033fe <pcpu_mp_init+0x57e>
  1033ed:	8d 76 00             	lea    0x0(%esi),%esi
    for (p = addr; p < e; p += sizeof(struct mp))
  1033f0:	89 ef                	mov    %ebp,%edi
  1033f2:	81 fd 00 00 10 00    	cmp    $0x100000,%ebp
  1033f8:	0f 84 a2 fe ff ff    	je     1032a0 <pcpu_mp_init+0x420>
        if (memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  1033fe:	83 ec 04             	sub    $0x4,%esp
  103401:	8d 6f 10             	lea    0x10(%edi),%ebp
  103404:	6a 04                	push   $0x4
  103406:	56                   	push   %esi
  103407:	57                   	push   %edi
  103408:	e8 13 12 00 00       	call   104620 <memcmp>
  10340d:	83 c4 10             	add    $0x10,%esp
  103410:	85 c0                	test   %eax,%eax
  103412:	75 dc                	jne    1033f0 <pcpu_mp_init+0x570>
  103414:	89 fa                	mov    %edi,%edx
  103416:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10341d:	00 
  10341e:	66 90                	xchg   %ax,%ax
        sum += addr[i];
  103420:	0f b6 0a             	movzbl (%edx),%ecx
    for (i = 0; i < len; i++)
  103423:	83 c2 01             	add    $0x1,%edx
        sum += addr[i];
  103426:	01 c8                	add    %ecx,%eax
    for (i = 0; i < len; i++)
  103428:	39 ea                	cmp    %ebp,%edx
  10342a:	75 f4                	jne    103420 <pcpu_mp_init+0x5a0>
        if (memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
  10342c:	84 c0                	test   %al,%al
  10342e:	75 c0                	jne    1033f0 <pcpu_mp_init+0x570>
  103430:	e9 6c fd ff ff       	jmp    1031a1 <pcpu_mp_init+0x321>
                KERN_INFO("BSP.\n");
  103435:	83 ec 0c             	sub    $0xc,%esp
  103438:	8d 8b 2a 73 ff ff    	lea    -0x8cd6(%ebx),%ecx
  10343e:	51                   	push   %ecx
  10343f:	e8 fc 12 00 00       	call   104740 <debug_info>
                pcpu_mp_init_cpu(0, proc->apicid, TRUE);
  103444:	0f b6 6d 01          	movzbl 0x1(%ebp),%ebp
    struct pcpuinfo *info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(idx);
  103448:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10344f:	e8 2c 30 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    info->bsp = is_bsp;
  103454:	83 c4 10             	add    $0x10,%esp
    info->lapicid = lapic_id;
  103457:	89 e9                	mov    %ebp,%ecx
    info->bsp = is_bsp;
  103459:	c6 40 04 01          	movb   $0x1,0x4(%eax)
    info->lapicid = lapic_id;
  10345d:	0f b6 d1             	movzbl %cl,%edx
  103460:	89 10                	mov    %edx,(%eax)
    info->bsp = is_bsp;
  103462:	e9 63 ff ff ff       	jmp    1033ca <pcpu_mp_init+0x54a>
        outb(0x22, 0x70);
  103467:	83 ec 08             	sub    $0x8,%esp
  10346a:	6a 70                	push   $0x70
  10346c:	6a 22                	push   $0x22
  10346e:	e8 ad 21 00 00       	call   105620 <outb>
        outb(0x23, inb(0x23) | 1);
  103473:	c7 04 24 23 00 00 00 	movl   $0x23,(%esp)
  10347a:	e8 71 21 00 00       	call   1055f0 <inb>
  10347f:	5a                   	pop    %edx
  103480:	59                   	pop    %ecx
  103481:	83 c8 01             	or     $0x1,%eax
  103484:	0f b6 c0             	movzbl %al,%eax
  103487:	50                   	push   %eax
  103488:	6a 23                	push   $0x23
  10348a:	e8 91 21 00 00       	call   105620 <outb>
  10348f:	83 c4 10             	add    $0x10,%esp
  103492:	e9 87 fe ff ff       	jmp    10331e <pcpu_mp_init+0x49e>
        KERN_DEBUG("Not found either RSDT or XSDT.\n");
  103497:	83 ec 04             	sub    $0x4,%esp
  10349a:	8d 83 d0 7e ff ff    	lea    -0x8130(%ebx),%eax
  1034a0:	50                   	push   %eax
  1034a1:	68 56 01 00 00       	push   $0x156
  1034a6:	e9 74 fc ff ff       	jmp    10311f <pcpu_mp_init+0x29f>
  1034ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001034b0 <pcpu_boot_ap>:

int pcpu_boot_ap(uint32_t cpu_idx, void (*f)(void), uintptr_t stack_addr)
{
  1034b0:	57                   	push   %edi
  1034b1:	56                   	push   %esi
  1034b2:	53                   	push   %ebx
  1034b3:	8b 74 24 10          	mov    0x10(%esp),%esi
  1034b7:	e8 e6 ce ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1034bc:	81 c3 38 0b 01 00    	add    $0x10b38,%ebx
  1034c2:	8b 7c 24 14          	mov    0x14(%esp),%edi
    KERN_ASSERT(cpu_idx > 0 && cpu_idx < pcpu_ncpu());
  1034c6:	85 f6                	test   %esi,%esi
  1034c8:	74 6e                	je     103538 <pcpu_boot_ap+0x88>
  1034ca:	3b b3 70 69 04 00    	cmp    0x46970(%ebx),%esi
  1034d0:	73 66                	jae    103538 <pcpu_boot_ap+0x88>
    KERN_ASSERT(get_pcpu_inited_info(cpu_idx) == TRUE);
  1034d2:	83 ec 0c             	sub    $0xc,%esp
  1034d5:	56                   	push   %esi
  1034d6:	e8 c5 2f 00 00       	call   1064a0 <get_pcpu_inited_info>
  1034db:	83 c4 10             	add    $0x10,%esp
  1034de:	3c 01                	cmp    $0x1,%al
  1034e0:	74 22                	je     103504 <pcpu_boot_ap+0x54>
  1034e2:	8d 83 b4 7f ff ff    	lea    -0x804c(%ebx),%eax
  1034e8:	50                   	push   %eax
  1034e9:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  1034ef:	50                   	push   %eax
  1034f0:	8d 83 e1 72 ff ff    	lea    -0x8d1f(%ebx),%eax
  1034f6:	68 b8 01 00 00       	push   $0x1b8
  1034fb:	50                   	push   %eax
  1034fc:	e8 df 12 00 00       	call   1047e0 <debug_panic>
  103501:	83 c4 10             	add    $0x10,%esp
    KERN_ASSERT(f != NULL);
  103504:	85 ff                	test   %edi,%edi
  103506:	0f 84 54 01 00 00    	je     103660 <pcpu_boot_ap+0x1b0>
    return ismp;
}

bool pcpu_onboot(void)
{
    int cpu_idx = get_pcpu_idx();
  10350c:	e8 2f 2e 00 00       	call   106340 <get_pcpu_idx>
    struct pcpuinfo *arch_info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  103511:	83 ec 0c             	sub    $0xc,%esp
  103514:	50                   	push   %eax
  103515:	e8 66 2f 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    return (mp_inited == TRUE) ? arch_info->bsp : (get_pcpu_idx() == 0);
  10351a:	83 c4 10             	add    $0x10,%esp
  10351d:	80 bb 6d 69 04 00 01 	cmpb   $0x1,0x4696d(%ebx)
  103524:	75 3a                	jne    103560 <pcpu_boot_ap+0xb0>
    if (pcpu_onboot() == FALSE)
  103526:	80 78 04 00          	cmpb   $0x0,0x4(%eax)
  10352a:	75 3d                	jne    103569 <pcpu_boot_ap+0xb9>
}
  10352c:	5b                   	pop    %ebx
        return 1;
  10352d:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103532:	5e                   	pop    %esi
  103533:	5f                   	pop    %edi
  103534:	c3                   	ret
  103535:	8d 76 00             	lea    0x0(%esi),%esi
    KERN_ASSERT(cpu_idx > 0 && cpu_idx < pcpu_ncpu());
  103538:	8d 83 8c 7f ff ff    	lea    -0x8074(%ebx),%eax
  10353e:	50                   	push   %eax
  10353f:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  103545:	50                   	push   %eax
  103546:	8d 83 e1 72 ff ff    	lea    -0x8d1f(%ebx),%eax
  10354c:	68 b7 01 00 00       	push   $0x1b7
  103551:	50                   	push   %eax
  103552:	e8 89 12 00 00       	call   1047e0 <debug_panic>
  103557:	83 c4 10             	add    $0x10,%esp
  10355a:	e9 73 ff ff ff       	jmp    1034d2 <pcpu_boot_ap+0x22>
  10355f:	90                   	nop
    return (mp_inited == TRUE) ? arch_info->bsp : (get_pcpu_idx() == 0);
  103560:	e8 db 2d 00 00       	call   106340 <get_pcpu_idx>
    if (pcpu_onboot() == FALSE)
  103565:	85 c0                	test   %eax,%eax
  103567:	75 c3                	jne    10352c <pcpu_boot_ap+0x7c>
    if (get_pcpu_boot_info(cpu_idx) == TRUE)
  103569:	83 ec 0c             	sub    $0xc,%esp
  10356c:	56                   	push   %esi
  10356d:	e8 7e 2e 00 00       	call   1063f0 <get_pcpu_boot_info>
  103572:	83 c4 10             	add    $0x10,%esp
  103575:	3c 01                	cmp    $0x1,%al
  103577:	74 7c                	je     1035f5 <pcpu_boot_ap+0x145>
    *(uintptr_t *) (boot - 4) = stack_addr + PAGE_SIZE;
  103579:	8b 44 24 18          	mov    0x18(%esp),%eax
}

lapicid_t pcpu_cpu_lapicid(int cpu_idx)
{
    struct pcpuinfo *arch_info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  10357d:	83 ec 0c             	sub    $0xc,%esp
    *(uintptr_t *) (boot - 8) = (uintptr_t) f;
  103580:	89 3d f8 7f 00 00    	mov    %edi,0x7ff8
    *(uintptr_t *) (boot - 4) = stack_addr + PAGE_SIZE;
  103586:	05 00 10 00 00       	add    $0x1000,%eax
  10358b:	a3 fc 7f 00 00       	mov    %eax,0x7ffc
    *(uintptr_t *) (boot - 12) = (uintptr_t) kern_init_ap;
  103590:	c7 c0 b0 65 10 00    	mov    $0x1065b0,%eax
  103596:	a3 f4 7f 00 00       	mov    %eax,0x7ff4
    struct pcpuinfo *arch_info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  10359b:	56                   	push   %esi
  10359c:	e8 df 2e 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    KERN_ASSERT(0 <= cpu_idx && cpu_idx < ncpu);
  1035a1:	83 c4 10             	add    $0x10,%esp
    struct pcpuinfo *arch_info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  1035a4:	89 c7                	mov    %eax,%edi
    KERN_ASSERT(0 <= cpu_idx && cpu_idx < ncpu);
  1035a6:	85 f6                	test   %esi,%esi
  1035a8:	0f 88 82 00 00 00    	js     103630 <pcpu_boot_ap+0x180>
  1035ae:	3b b3 70 69 04 00    	cmp    0x46970(%ebx),%esi
  1035b4:	73 7a                	jae    103630 <pcpu_boot_ap+0x180>
    lapic_startcpu(pcpu_cpu_lapicid(cpu_idx), (uintptr_t) boot);
  1035b6:	83 ec 08             	sub    $0x8,%esp
  1035b9:	68 00 80 00 00       	push   $0x8000
  1035be:	0f b6 07             	movzbl (%edi),%eax
  1035c1:	50                   	push   %eax
  1035c2:	e8 29 f3 ff ff       	call   1028f0 <lapic_startcpu>
    while (get_pcpu_boot_info(cpu_idx) == FALSE)
  1035c7:	83 c4 10             	add    $0x10,%esp
  1035ca:	eb 09                	jmp    1035d5 <pcpu_boot_ap+0x125>
  1035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        pause();
  1035d0:	e8 5b 1e 00 00       	call   105430 <pause>
    while (get_pcpu_boot_info(cpu_idx) == FALSE)
  1035d5:	83 ec 0c             	sub    $0xc,%esp
  1035d8:	56                   	push   %esi
  1035d9:	e8 12 2e 00 00       	call   1063f0 <get_pcpu_boot_info>
  1035de:	83 c4 10             	add    $0x10,%esp
  1035e1:	84 c0                	test   %al,%al
  1035e3:	74 eb                	je     1035d0 <pcpu_boot_ap+0x120>
    KERN_ASSERT(get_pcpu_boot_info(cpu_idx) == TRUE);
  1035e5:	83 ec 0c             	sub    $0xc,%esp
  1035e8:	56                   	push   %esi
  1035e9:	e8 02 2e 00 00       	call   1063f0 <get_pcpu_boot_info>
  1035ee:	83 c4 10             	add    $0x10,%esp
  1035f1:	3c 01                	cmp    $0x1,%al
  1035f3:	75 0b                	jne    103600 <pcpu_boot_ap+0x150>
        return 0;
  1035f5:	31 c0                	xor    %eax,%eax
}
  1035f7:	5b                   	pop    %ebx
  1035f8:	5e                   	pop    %esi
  1035f9:	5f                   	pop    %edi
  1035fa:	c3                   	ret
  1035fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    KERN_ASSERT(get_pcpu_boot_info(cpu_idx) == TRUE);
  103600:	8d 83 fc 7f ff ff    	lea    -0x8004(%ebx),%eax
  103606:	50                   	push   %eax
  103607:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  10360d:	50                   	push   %eax
  10360e:	8d 83 e1 72 ff ff    	lea    -0x8d1f(%ebx),%eax
  103614:	68 cd 01 00 00       	push   $0x1cd
  103619:	50                   	push   %eax
  10361a:	e8 c1 11 00 00       	call   1047e0 <debug_panic>
  10361f:	83 c4 10             	add    $0x10,%esp
        return 0;
  103622:	31 c0                	xor    %eax,%eax
  103624:	eb d1                	jmp    1035f7 <pcpu_boot_ap+0x147>
  103626:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10362d:	00 
  10362e:	66 90                	xchg   %ax,%ax
    KERN_ASSERT(0 <= cpu_idx && cpu_idx < ncpu);
  103630:	8d 83 dc 7f ff ff    	lea    -0x8024(%ebx),%eax
  103636:	50                   	push   %eax
  103637:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  10363d:	50                   	push   %eax
  10363e:	8d 83 e1 72 ff ff    	lea    -0x8d1f(%ebx),%eax
  103644:	68 ea 01 00 00       	push   $0x1ea
  103649:	50                   	push   %eax
  10364a:	e8 91 11 00 00       	call   1047e0 <debug_panic>
  10364f:	83 c4 10             	add    $0x10,%esp
  103652:	e9 5f ff ff ff       	jmp    1035b6 <pcpu_boot_ap+0x106>
  103657:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10365e:	00 
  10365f:	90                   	nop
    KERN_ASSERT(f != NULL);
  103660:	8d 83 35 73 ff ff    	lea    -0x8ccb(%ebx),%eax
  103666:	50                   	push   %eax
  103667:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  10366d:	50                   	push   %eax
  10366e:	8d 83 e1 72 ff ff    	lea    -0x8d1f(%ebx),%eax
  103674:	68 b9 01 00 00       	push   $0x1b9
  103679:	50                   	push   %eax
  10367a:	e8 61 11 00 00       	call   1047e0 <debug_panic>
  10367f:	83 c4 10             	add    $0x10,%esp
  103682:	e9 85 fe ff ff       	jmp    10350c <pcpu_boot_ap+0x5c>
  103687:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10368e:	00 
  10368f:	90                   	nop

00103690 <pcpu_init_cpu>:
{
  103690:	55                   	push   %ebp
  103691:	e8 63 db ff ff       	call   1011f9 <__x86.get_pc_thunk.bp>
  103696:	81 c5 5e 09 01 00    	add    $0x1095e,%ebp
  10369c:	57                   	push   %edi
  10369d:	56                   	push   %esi
  10369e:	53                   	push   %ebx
  10369f:	83 ec 4c             	sub    $0x4c,%esp
    int cpu_idx = get_pcpu_idx();
  1036a2:	89 eb                	mov    %ebp,%ebx
  1036a4:	e8 97 2c 00 00       	call   106340 <get_pcpu_idx>
    struct pcpuinfo *cpuinfo = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  1036a9:	83 ec 0c             	sub    $0xc,%esp
  1036ac:	50                   	push   %eax
  1036ad:	e8 ce 2d 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    uint32_t *regs[4] = { &eax, &ebx, &ecx, &edx };
  1036b2:	8d 7c 24 3c          	lea    0x3c(%esp),%edi
  1036b6:	8d 4c 24 34          	lea    0x34(%esp),%ecx
  1036ba:	8d 5c 24 38          	lea    0x38(%esp),%ebx
    struct pcpuinfo *cpuinfo = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  1036be:	89 c6                	mov    %eax,%esi
    uint32_t *regs[4] = { &eax, &ebx, &ecx, &edx };
  1036c0:	8d 44 24 30          	lea    0x30(%esp),%eax
  1036c4:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  1036c8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1036cc:	89 44 24 40          	mov    %eax,0x40(%esp)
  1036d0:	89 4c 24 44          	mov    %ecx,0x44(%esp)
  1036d4:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  1036d8:	89 5c 24 48          	mov    %ebx,0x48(%esp)
  1036dc:	89 7c 24 4c          	mov    %edi,0x4c(%esp)
    cpuid(0x0, &eax, &ebx, &ecx, &edx);
  1036e0:	89 3c 24             	mov    %edi,(%esp)
  1036e3:	53                   	push   %ebx
  1036e4:	89 eb                	mov    %ebp,%ebx
  1036e6:	51                   	push   %ecx
  1036e7:	50                   	push   %eax
  1036e8:	6a 00                	push   $0x0
  1036ea:	e8 d1 1d 00 00       	call   1054c0 <cpuid>
    cpuinfo->cpuid_high = eax;
  1036ef:	8b 44 24 40          	mov    0x40(%esp),%eax
    cpuinfo->vendor[12] = '\0';
  1036f3:	c6 46 18 00          	movb   $0x0,0x18(%esi)
    cpuinfo->cpuid_high = eax;
  1036f7:	89 46 08             	mov    %eax,0x8(%esi)
    ((uint32_t *) cpuinfo->vendor)[0] = ebx;
  1036fa:	8b 44 24 44          	mov    0x44(%esp),%eax
  1036fe:	89 46 0c             	mov    %eax,0xc(%esi)
    ((uint32_t *) cpuinfo->vendor)[1] = edx;
  103701:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  103705:	89 46 10             	mov    %eax,0x10(%esi)
    ((uint32_t *) cpuinfo->vendor)[2] = ecx;
  103708:	8b 44 24 48          	mov    0x48(%esp),%eax
  10370c:	89 46 14             	mov    %eax,0x14(%esi)
    if (strncmp(cpuinfo->vendor, "GenuineIntel", 20) == 0)
  10370f:	8d 46 0c             	lea    0xc(%esi),%eax
  103712:	89 44 24 30          	mov    %eax,0x30(%esp)
  103716:	89 c1                	mov    %eax,%ecx
  103718:	83 c4 1c             	add    $0x1c,%esp
  10371b:	8d 85 74 73 ff ff    	lea    -0x8c8c(%ebp),%eax
  103721:	6a 14                	push   $0x14
  103723:	50                   	push   %eax
  103724:	51                   	push   %ecx
  103725:	e8 b6 0d 00 00       	call   1044e0 <strncmp>
  10372a:	83 c4 10             	add    $0x10,%esp
  10372d:	89 c2                	mov    %eax,%edx
  10372f:	b8 01 00 00 00       	mov    $0x1,%eax
  103734:	85 d2                	test   %edx,%edx
  103736:	0f 85 f4 02 00 00    	jne    103a30 <pcpu_init_cpu+0x3a0>
    cpuid(0x1, &eax, &ebx, &ecx, &edx);
  10373c:	83 ec 0c             	sub    $0xc,%esp
        cpuinfo->cpu_vendor = INTEL;
  10373f:	89 46 20             	mov    %eax,0x20(%esi)
    cpuid(0x1, &eax, &ebx, &ecx, &edx);
  103742:	89 eb                	mov    %ebp,%ebx
  103744:	57                   	push   %edi
  103745:	ff 74 24 18          	push   0x18(%esp)
  103749:	ff 74 24 18          	push   0x18(%esp)
  10374d:	ff 74 24 18          	push   0x18(%esp)
  103751:	6a 01                	push   $0x1
  103753:	e8 68 1d 00 00       	call   1054c0 <cpuid>
    cpuinfo->family = (eax >> 8) & 0xf;
  103758:	8b 44 24 40          	mov    0x40(%esp),%eax
  10375c:	89 c2                	mov    %eax,%edx
  10375e:	c1 ea 08             	shr    $0x8,%edx
  103761:	83 e2 0f             	and    $0xf,%edx
  103764:	88 56 24             	mov    %dl,0x24(%esi)
    cpuinfo->model = (eax >> 4) & 0xf;
  103767:	89 c2                	mov    %eax,%edx
  103769:	c0 ea 04             	shr    $0x4,%dl
  10376c:	88 56 25             	mov    %dl,0x25(%esi)
    cpuinfo->step = eax & 0xf;
  10376f:	89 c2                	mov    %eax,%edx
  103771:	83 e2 0f             	and    $0xf,%edx
  103774:	88 56 26             	mov    %dl,0x26(%esi)
    cpuinfo->ext_family = (eax >> 20) & 0xff;
  103777:	89 c2                	mov    %eax,%edx
    cpuinfo->ext_model = (eax >> 16) & 0xff;
  103779:	c1 e8 10             	shr    $0x10,%eax
  10377c:	88 46 28             	mov    %al,0x28(%esi)
    cpuinfo->brand_idx = ebx & 0xff;
  10377f:	8b 44 24 44          	mov    0x44(%esp),%eax
    cpuinfo->ext_family = (eax >> 20) & 0xff;
  103783:	c1 ea 14             	shr    $0x14,%edx
  103786:	88 56 27             	mov    %dl,0x27(%esi)
    cpuinfo->brand_idx = ebx & 0xff;
  103789:	89 46 29             	mov    %eax,0x29(%esi)
    cpuinfo->feature1 = ecx;
  10378c:	8b 44 24 48          	mov    0x48(%esp),%eax
  103790:	89 46 30             	mov    %eax,0x30(%esi)
    cpuinfo->feature2 = edx;
  103793:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    switch (cpuinfo->cpu_vendor) {
  103797:	83 c4 20             	add    $0x20,%esp
    cpuinfo->feature2 = edx;
  10379a:	89 46 34             	mov    %eax,0x34(%esi)
    switch (cpuinfo->cpu_vendor) {
  10379d:	8b 46 20             	mov    0x20(%esi),%eax
  1037a0:	83 f8 01             	cmp    $0x1,%eax
  1037a3:	0f 84 6f 01 00 00    	je     103918 <pcpu_init_cpu+0x288>
  1037a9:	83 f8 02             	cmp    $0x2,%eax
  1037ac:	0f 85 4e 01 00 00    	jne    103900 <pcpu_init_cpu+0x270>
        cpuid(0x80000005, &eax, &ebx, &ecx, &edx);
  1037b2:	83 ec 0c             	sub    $0xc,%esp
  1037b5:	57                   	push   %edi
  1037b6:	ff 74 24 18          	push   0x18(%esp)
  1037ba:	ff 74 24 18          	push   0x18(%esp)
  1037be:	ff 74 24 18          	push   0x18(%esp)
  1037c2:	68 05 00 00 80       	push   $0x80000005
  1037c7:	e8 f4 1c 00 00       	call   1054c0 <cpuid>
        cpuinfo->l1_cache_size = (ecx & 0xff000000) >> 24;
  1037cc:	8b 44 24 48          	mov    0x48(%esp),%eax
        break;
  1037d0:	83 c4 20             	add    $0x20,%esp
        cpuinfo->l1_cache_size = (ecx & 0xff000000) >> 24;
  1037d3:	89 c2                	mov    %eax,%edx
        cpuinfo->l1_cache_line_size = (ecx & 0x000000ff);
  1037d5:	25 ff 00 00 00       	and    $0xff,%eax
        cpuinfo->l1_cache_size = (ecx & 0xff000000) >> 24;
  1037da:	c1 ea 18             	shr    $0x18,%edx
        cpuinfo->l1_cache_line_size = (ecx & 0x000000ff);
  1037dd:	89 46 3c             	mov    %eax,0x3c(%esi)
        cpuinfo->l1_cache_size = (ecx & 0xff000000) >> 24;
  1037e0:	89 56 38             	mov    %edx,0x38(%esi)
    cpuid(0x80000000, &eax, &ebx, &ecx, &edx);
  1037e3:	83 ec 0c             	sub    $0xc,%esp
  1037e6:	89 eb                	mov    %ebp,%ebx
  1037e8:	57                   	push   %edi
  1037e9:	ff 74 24 18          	push   0x18(%esp)
  1037ed:	ff 74 24 18          	push   0x18(%esp)
  1037f1:	ff 74 24 18          	push   0x18(%esp)
  1037f5:	68 00 00 00 80       	push   $0x80000000
  1037fa:	e8 c1 1c 00 00       	call   1054c0 <cpuid>
    cpuinfo->cpuid_exthigh = eax;
  1037ff:	8b 44 24 40          	mov    0x40(%esp),%eax
    pcpu_print_cpuinfo(get_pcpu_idx(), cpuinfo);
  103803:	83 c4 20             	add    $0x20,%esp
    cpuinfo->cpuid_exthigh = eax;
  103806:	89 46 40             	mov    %eax,0x40(%esi)
    pcpu_print_cpuinfo(get_pcpu_idx(), cpuinfo);
  103809:	e8 32 2b 00 00       	call   106340 <get_pcpu_idx>
    KERN_INFO("CPU%d: %s, FAMILY %d(%d), MODEL %d(%d), STEP %d, "
  10380e:	8b 56 30             	mov    0x30(%esi),%edx
  103811:	8d 8d 3f 73 ff ff    	lea    -0x8cc1(%ebp),%ecx
  103817:	8b 7e 38             	mov    0x38(%esi),%edi
    pcpu_print_cpuinfo(get_pcpu_idx(), cpuinfo);
  10381a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    KERN_INFO("CPU%d: %s, FAMILY %d(%d), MODEL %d(%d), STEP %d, "
  10381e:	8d 85 07 76 ff ff    	lea    -0x89f9(%ebp),%eax
  103824:	f7 c2 00 00 80 00    	test   $0x800000,%edx
  10382a:	89 3c 24             	mov    %edi,(%esp)
  10382d:	0f 44 c8             	cmove  %eax,%ecx
  103830:	f7 c2 00 00 10 00    	test   $0x100000,%edx
  103836:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  10383a:	8d 8d 48 73 ff ff    	lea    -0x8cb8(%ebp),%ecx
  103840:	89 cf                	mov    %ecx,%edi
  103842:	8d 8d 50 73 ff ff    	lea    -0x8cb0(%ebp),%ecx
  103848:	0f 44 f8             	cmove  %eax,%edi
  10384b:	f7 c2 00 00 08 00    	test   $0x80000,%edx
  103851:	0f 44 c8             	cmove  %eax,%ecx
  103854:	f6 c6 02             	test   $0x2,%dh
  103857:	89 7c 24 14          	mov    %edi,0x14(%esp)
  10385b:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  10385f:	8d 8d 58 73 ff ff    	lea    -0x8ca8(%ebp),%ecx
  103865:	89 cb                	mov    %ecx,%ebx
  103867:	8d 8d 60 73 ff ff    	lea    -0x8ca0(%ebp),%ecx
  10386d:	0f 44 d8             	cmove  %eax,%ebx
  103870:	89 cf                	mov    %ecx,%edi
  103872:	8b 4e 34             	mov    0x34(%esi),%ecx
  103875:	f6 c2 01             	test   $0x1,%dl
  103878:	0f 44 f8             	cmove  %eax,%edi
  10387b:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  10387f:	f7 c1 00 00 00 04    	test   $0x4000000,%ecx
  103885:	8d 9d 67 73 ff ff    	lea    -0x8c99(%ebp),%ebx
  10388b:	0f 44 d8             	cmove  %eax,%ebx
  10388e:	f7 c1 00 00 00 02    	test   $0x2000000,%ecx
  103894:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  103898:	8d 9d 6e 73 ff ff    	lea    -0x8c92(%ebp),%ebx
  10389e:	0f 45 c3             	cmovne %ebx,%eax
  1038a1:	83 ec 04             	sub    $0x4,%esp
  1038a4:	ff 76 3c             	push   0x3c(%esi)
  1038a7:	89 eb                	mov    %ebp,%ebx
  1038a9:	ff 74 24 08          	push   0x8(%esp)
  1038ad:	ff 74 24 24          	push   0x24(%esp)
  1038b1:	ff 74 24 24          	push   0x24(%esp)
  1038b5:	ff 74 24 20          	push   0x20(%esp)
  1038b9:	ff 74 24 20          	push   0x20(%esp)
  1038bd:	57                   	push   %edi
  1038be:	ff 74 24 24          	push   0x24(%esp)
  1038c2:	50                   	push   %eax
  1038c3:	51                   	push   %ecx
  1038c4:	52                   	push   %edx
  1038c5:	0f b6 46 26          	movzbl 0x26(%esi),%eax
  1038c9:	50                   	push   %eax
  1038ca:	0f b6 46 28          	movzbl 0x28(%esi),%eax
  1038ce:	50                   	push   %eax
  1038cf:	0f b6 46 25          	movzbl 0x25(%esi),%eax
  1038d3:	50                   	push   %eax
  1038d4:	0f b6 46 27          	movzbl 0x27(%esi),%eax
  1038d8:	50                   	push   %eax
  1038d9:	0f b6 46 24          	movzbl 0x24(%esi),%eax
  1038dd:	50                   	push   %eax
  1038de:	8d 85 20 80 ff ff    	lea    -0x7fe0(%ebp),%eax
  1038e4:	ff 74 24 54          	push   0x54(%esp)
  1038e8:	ff 74 24 64          	push   0x64(%esp)
  1038ec:	50                   	push   %eax
  1038ed:	e8 4e 0e 00 00       	call   104740 <debug_info>
}
  1038f2:	81 c4 9c 00 00 00    	add    $0x9c,%esp
  1038f8:	5b                   	pop    %ebx
  1038f9:	5e                   	pop    %esi
  1038fa:	5f                   	pop    %edi
  1038fb:	5d                   	pop    %ebp
  1038fc:	c3                   	ret
  1038fd:	8d 76 00             	lea    0x0(%esi),%esi
        cpuinfo->l1_cache_size = 0;
  103900:	c7 46 38 00 00 00 00 	movl   $0x0,0x38(%esi)
        cpuinfo->l1_cache_line_size = 0;
  103907:	c7 46 3c 00 00 00 00 	movl   $0x0,0x3c(%esi)
        break;
  10390e:	e9 d0 fe ff ff       	jmp    1037e3 <pcpu_init_cpu+0x153>
  103913:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        cpuid(0x00000002, &eax, &ebx, &ecx, &edx);
  103918:	83 ec 0c             	sub    $0xc,%esp
  10391b:	57                   	push   %edi
  10391c:	ff 74 24 18          	push   0x18(%esp)
  103920:	ff 74 24 18          	push   0x18(%esp)
  103924:	ff 74 24 18          	push   0x18(%esp)
  103928:	6a 02                	push   $0x2
  10392a:	e8 91 1b 00 00       	call   1054c0 <cpuid>
        i = eax & 0x000000ff;
  10392f:	0f b6 44 24 40       	movzbl 0x40(%esp),%eax
        while (i--)
  103934:	83 c4 20             	add    $0x20,%esp
  103937:	85 c0                	test   %eax,%eax
  103939:	74 32                	je     10396d <pcpu_init_cpu+0x2dd>
  10393b:	89 74 24 0c          	mov    %esi,0xc(%esp)
  10393f:	89 c6                	mov    %eax,%esi
  103941:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            cpuid(0x00000002, &eax, &ebx, &ecx, &edx);
  103948:	83 ec 0c             	sub    $0xc,%esp
  10394b:	89 eb                	mov    %ebp,%ebx
  10394d:	57                   	push   %edi
  10394e:	ff 74 24 18          	push   0x18(%esp)
  103952:	ff 74 24 18          	push   0x18(%esp)
  103956:	ff 74 24 18          	push   0x18(%esp)
  10395a:	6a 02                	push   $0x2
  10395c:	e8 5f 1b 00 00       	call   1054c0 <cpuid>
        while (i--)
  103961:	83 c4 20             	add    $0x20,%esp
  103964:	83 ee 01             	sub    $0x1,%esi
  103967:	75 df                	jne    103948 <pcpu_init_cpu+0x2b8>
  103969:	8b 74 24 0c          	mov    0xc(%esp),%esi
        for (i = 0; i < 4; i++) {
  10396d:	8d 44 24 30          	lea    0x30(%esp),%eax
  103971:	89 7c 24 18          	mov    %edi,0x18(%esp)
  103975:	8d 8d 6c 84 ff ff    	lea    -0x7b94(%ebp),%ecx
  10397b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10397f:	8d 44 24 40          	lea    0x40(%esp),%eax
  103983:	89 44 24 14          	mov    %eax,0x14(%esp)
            for (j = 0; j < 4; j++) {
  103987:	8b 44 24 0c          	mov    0xc(%esp),%eax
  10398b:	8b 00                	mov    (%eax),%eax
  10398d:	8d 78 04             	lea    0x4(%eax),%edi
                cpuinfo->l1_cache_size = intel_cache_info[desc[j]][0];
  103990:	0f b6 10             	movzbl (%eax),%edx
            for (j = 0; j < 4; j++) {
  103993:	83 c0 01             	add    $0x1,%eax
                cpuinfo->l1_cache_size = intel_cache_info[desc[j]][0];
  103996:	8b 14 d1             	mov    (%ecx,%edx,8),%edx
  103999:	89 56 38             	mov    %edx,0x38(%esi)
                cpuinfo->l1_cache_line_size = intel_cache_info[desc[j]][1];
  10399c:	0f b6 58 ff          	movzbl -0x1(%eax),%ebx
  1039a0:	8b 5c d9 04          	mov    0x4(%ecx,%ebx,8),%ebx
  1039a4:	89 5e 3c             	mov    %ebx,0x3c(%esi)
            for (j = 0; j < 4; j++) {
  1039a7:	39 f8                	cmp    %edi,%eax
  1039a9:	75 e5                	jne    103990 <pcpu_init_cpu+0x300>
        for (i = 0; i < 4; i++) {
  1039ab:	83 44 24 0c 04       	addl   $0x4,0xc(%esp)
  1039b0:	8b 7c 24 14          	mov    0x14(%esp),%edi
  1039b4:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1039b8:	39 f8                	cmp    %edi,%eax
  1039ba:	75 cb                	jne    103987 <pcpu_init_cpu+0x2f7>
        if (cpuinfo->l1_cache_size && cpuinfo->l1_cache_line_size)
  1039bc:	8b 7c 24 18          	mov    0x18(%esp),%edi
  1039c0:	85 d2                	test   %edx,%edx
  1039c2:	0f 85 98 00 00 00    	jne    103a60 <pcpu_init_cpu+0x3d0>
  1039c8:	31 d2                	xor    %edx,%edx
  1039ca:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1039ce:	89 d6                	mov    %edx,%esi
            cpuid_subleaf(0x00000004, i, &eax, &ebx, &ecx, &edx);
  1039d0:	83 ec 08             	sub    $0x8,%esp
  1039d3:	89 eb                	mov    %ebp,%ebx
  1039d5:	57                   	push   %edi
  1039d6:	ff 74 24 14          	push   0x14(%esp)
  1039da:	ff 74 24 14          	push   0x14(%esp)
  1039de:	ff 74 24 14          	push   0x14(%esp)
  1039e2:	56                   	push   %esi
  1039e3:	6a 04                	push   $0x4
  1039e5:	e8 16 1b 00 00       	call   105500 <cpuid_subleaf>
            if ((eax & 0xf) == 1 && ((eax & 0xe0) >> 5) == 1)
  1039ea:	8b 44 24 40          	mov    0x40(%esp),%eax
  1039ee:	83 c4 20             	add    $0x20,%esp
  1039f1:	25 ef 00 00 00       	and    $0xef,%eax
  1039f6:	83 f8 21             	cmp    $0x21,%eax
  1039f9:	74 72                	je     103a6d <pcpu_init_cpu+0x3dd>
        for (i = 0; i < 3; i++) {
  1039fb:	83 c6 01             	add    $0x1,%esi
  1039fe:	83 fe 03             	cmp    $0x3,%esi
  103a01:	75 cd                	jne    1039d0 <pcpu_init_cpu+0x340>
  103a03:	8b 74 24 0c          	mov    0xc(%esp),%esi
            KERN_WARN("Cannot determine L1 cache size.\n");
  103a07:	8d 85 90 80 ff ff    	lea    -0x7f70(%ebp),%eax
  103a0d:	83 ec 04             	sub    $0x4,%esp
  103a10:	50                   	push   %eax
  103a11:	8d 85 e1 72 ff ff    	lea    -0x8d1f(%ebp),%eax
  103a17:	6a 7c                	push   $0x7c
  103a19:	50                   	push   %eax
  103a1a:	e8 d1 0e 00 00       	call   1048f0 <debug_warn>
            break;
  103a1f:	83 c4 10             	add    $0x10,%esp
  103a22:	e9 bc fd ff ff       	jmp    1037e3 <pcpu_init_cpu+0x153>
  103a27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103a2e:	00 
  103a2f:	90                   	nop
    else if (strncmp(cpuinfo->vendor, "AuthenticAMD", 20) == 0)
  103a30:	83 ec 04             	sub    $0x4,%esp
  103a33:	8d 85 81 73 ff ff    	lea    -0x8c7f(%ebp),%eax
  103a39:	6a 14                	push   $0x14
  103a3b:	50                   	push   %eax
  103a3c:	ff 74 24 1c          	push   0x1c(%esp)
  103a40:	e8 9b 0a 00 00       	call   1044e0 <strncmp>
  103a45:	83 c4 10             	add    $0x10,%esp
  103a48:	85 c0                	test   %eax,%eax
  103a4a:	0f 94 c0             	sete   %al
  103a4d:	0f b6 c0             	movzbl %al,%eax
  103a50:	01 c0                	add    %eax,%eax
  103a52:	e9 e5 fc ff ff       	jmp    10373c <pcpu_init_cpu+0xac>
  103a57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103a5e:	00 
  103a5f:	90                   	nop
        if (cpuinfo->l1_cache_size && cpuinfo->l1_cache_line_size)
  103a60:	85 db                	test   %ebx,%ebx
  103a62:	0f 85 7b fd ff ff    	jne    1037e3 <pcpu_init_cpu+0x153>
  103a68:	e9 5b ff ff ff       	jmp    1039c8 <pcpu_init_cpu+0x338>
            (((ebx & 0xffc00000) >> 22) + 1) *  /* ways */
  103a6d:	8b 5c 24 24          	mov    0x24(%esp),%ebx
            (ecx + 1) /                         /* sets */
  103a71:	8b 54 24 28          	mov    0x28(%esp),%edx
            (((ebx & 0xffc00000) >> 22) + 1) *  /* ways */
  103a75:	8b 74 24 0c          	mov    0xc(%esp),%esi
            (((ebx & 0x00000fff)) + 1) *        /* line size */
  103a79:	89 d8                	mov    %ebx,%eax
            (ecx + 1) /                         /* sets */
  103a7b:	83 c2 01             	add    $0x1,%edx
            (((ebx & 0x00000fff)) + 1) *        /* line size */
  103a7e:	25 ff 0f 00 00       	and    $0xfff,%eax
  103a83:	8d 48 01             	lea    0x1(%eax),%ecx
            (((ebx & 0xffc00000) >> 22) + 1) *  /* ways */
  103a86:	89 d8                	mov    %ebx,%eax
            (((ebx & 0x003ff000) >> 12) + 1) *  /* partitions */
  103a88:	c1 eb 0c             	shr    $0xc,%ebx
            (((ebx & 0xffc00000) >> 22) + 1) *  /* ways */
  103a8b:	c1 e8 16             	shr    $0x16,%eax
        cpuinfo->l1_cache_line_size = ((ebx & 0x00000fff)) + 1;
  103a8e:	89 4e 3c             	mov    %ecx,0x3c(%esi)
            (((ebx & 0xffc00000) >> 22) + 1) *  /* ways */
  103a91:	83 c0 01             	add    $0x1,%eax
            (((ebx & 0x00000fff)) + 1) *        /* line size */
  103a94:	0f af c1             	imul   %ecx,%eax
  103a97:	0f af c2             	imul   %edx,%eax
            (((ebx & 0x003ff000) >> 12) + 1) *  /* partitions */
  103a9a:	89 da                	mov    %ebx,%edx
  103a9c:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  103aa2:	83 c2 01             	add    $0x1,%edx
            (((ebx & 0x00000fff)) + 1) *        /* line size */
  103aa5:	0f af c2             	imul   %edx,%eax
            (ecx + 1) /                         /* sets */
  103aa8:	c1 e8 0a             	shr    $0xa,%eax
  103aab:	89 46 38             	mov    %eax,0x38(%esi)
        break;
  103aae:	e9 30 fd ff ff       	jmp    1037e3 <pcpu_init_cpu+0x153>
  103ab3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103aba:	00 
  103abb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00103ac0 <pcpu_ncpu>:
    return ncpu;
  103ac0:	e8 d5 c8 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  103ac5:	05 2f 05 01 00       	add    $0x1052f,%eax
  103aca:	8b 80 70 69 04 00    	mov    0x46970(%eax),%eax
}
  103ad0:	c3                   	ret
  103ad1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103ad8:	00 
  103ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00103ae0 <pcpu_is_smp>:
    return ismp;
  103ae0:	e8 b5 c8 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  103ae5:	05 0f 05 01 00       	add    $0x1050f,%eax
  103aea:	0f b6 80 6c 69 04 00 	movzbl 0x4696c(%eax),%eax
}
  103af1:	c3                   	ret
  103af2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103af9:	00 
  103afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103b00 <pcpu_onboot>:
{
  103b00:	53                   	push   %ebx
  103b01:	e8 9c c8 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103b06:	81 c3 ee 04 01 00    	add    $0x104ee,%ebx
  103b0c:	83 ec 08             	sub    $0x8,%esp
    int cpu_idx = get_pcpu_idx();
  103b0f:	e8 2c 28 00 00       	call   106340 <get_pcpu_idx>
    struct pcpuinfo *arch_info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  103b14:	83 ec 0c             	sub    $0xc,%esp
  103b17:	50                   	push   %eax
  103b18:	e8 63 29 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    return (mp_inited == TRUE) ? arch_info->bsp : (get_pcpu_idx() == 0);
  103b1d:	83 c4 10             	add    $0x10,%esp
  103b20:	80 bb 6d 69 04 00 01 	cmpb   $0x1,0x4696d(%ebx)
  103b27:	75 0f                	jne    103b38 <pcpu_onboot+0x38>
  103b29:	0f b6 40 04          	movzbl 0x4(%eax),%eax
}
  103b2d:	83 c4 08             	add    $0x8,%esp
  103b30:	5b                   	pop    %ebx
  103b31:	c3                   	ret
  103b32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return (mp_inited == TRUE) ? arch_info->bsp : (get_pcpu_idx() == 0);
  103b38:	e8 03 28 00 00       	call   106340 <get_pcpu_idx>
  103b3d:	85 c0                	test   %eax,%eax
  103b3f:	0f 94 c0             	sete   %al
}
  103b42:	83 c4 08             	add    $0x8,%esp
  103b45:	5b                   	pop    %ebx
  103b46:	c3                   	ret
  103b47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103b4e:	00 
  103b4f:	90                   	nop

00103b50 <pcpu_cpu_lapicid>:
{
  103b50:	57                   	push   %edi
  103b51:	56                   	push   %esi
  103b52:	53                   	push   %ebx
  103b53:	8b 7c 24 10          	mov    0x10(%esp),%edi
  103b57:	e8 46 c8 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103b5c:	81 c3 98 04 01 00    	add    $0x10498,%ebx
    struct pcpuinfo *arch_info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  103b62:	83 ec 0c             	sub    $0xc,%esp
  103b65:	57                   	push   %edi
  103b66:	e8 15 29 00 00       	call   106480 <get_pcpu_arch_info_pointer>
    KERN_ASSERT(0 <= cpu_idx && cpu_idx < ncpu);
  103b6b:	83 c4 10             	add    $0x10,%esp
    struct pcpuinfo *arch_info = (struct pcpuinfo *) get_pcpu_arch_info_pointer(cpu_idx);
  103b6e:	89 c6                	mov    %eax,%esi
    KERN_ASSERT(0 <= cpu_idx && cpu_idx < ncpu);
  103b70:	85 ff                	test   %edi,%edi
  103b72:	78 08                	js     103b7c <pcpu_cpu_lapicid+0x2c>
  103b74:	3b bb 70 69 04 00    	cmp    0x46970(%ebx),%edi
  103b7a:	72 22                	jb     103b9e <pcpu_cpu_lapicid+0x4e>
  103b7c:	8d 83 dc 7f ff ff    	lea    -0x8024(%ebx),%eax
  103b82:	50                   	push   %eax
  103b83:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  103b89:	50                   	push   %eax
  103b8a:	8d 83 e1 72 ff ff    	lea    -0x8d1f(%ebx),%eax
  103b90:	68 ea 01 00 00       	push   $0x1ea
  103b95:	50                   	push   %eax
  103b96:	e8 45 0c 00 00       	call   1047e0 <debug_panic>
  103b9b:	83 c4 10             	add    $0x10,%esp
    return arch_info->lapicid;
  103b9e:	0f b6 06             	movzbl (%esi),%eax
}
  103ba1:	5b                   	pop    %ebx
  103ba2:	5e                   	pop    %esi
  103ba3:	5f                   	pop    %edi
  103ba4:	c3                   	ret

00103ba5 <__x86.get_pc_thunk.si>:
  103ba5:	8b 34 24             	mov    (%esp),%esi
  103ba8:	c3                   	ret
  103ba9:	66 90                	xchg   %ax,%ax
  103bab:	66 90                	xchg   %ax,%ax
  103bad:	66 90                	xchg   %ax,%ax
  103baf:	90                   	nop

00103bb0 <ioapicinit>:
void ioapicinit(void)
{
    int32_t i, maxintr;
    int32_t id __attribute__((unused));

    ioapic = (volatile struct ioapic *) IOAPIC;
  103bb0:	e8 e5 c7 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  103bb5:	05 3f 04 01 00       	add    $0x1043f,%eax
{
  103bba:	53                   	push   %ebx
    return ioapic->data;
  103bbb:	ba 10 00 00 00       	mov    $0x10,%edx
    ioapic = (volatile struct ioapic *) IOAPIC;
  103bc0:	c7 80 74 69 04 00 00 	movl   $0xfec00000,0x46974(%eax)
  103bc7:	00 c0 fe 
    ioapic->reg = reg;
  103bca:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
  103bd1:	00 00 00 
    return ioapic->data;
  103bd4:	8b 1d 10 00 c0 fe    	mov    0xfec00010,%ebx
    ioapic->reg = reg;
  103bda:	c7 05 00 00 c0 fe 00 	movl   $0x0,0xfec00000
  103be1:	00 00 00 
    return ioapic->data;
  103be4:	a1 10 00 c0 fe       	mov    0xfec00010,%eax
    maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
    id = ioapicread(REG_ID) >> 24;

    // Mark all interrupts edge-triggered, active high, disabled,
    // and not routed to any CPUs.
    for (i = 0; i <= maxintr; i++) {
  103be9:	31 c0                	xor    %eax,%eax
    maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  103beb:	c1 eb 10             	shr    $0x10,%ebx
  103bee:	0f b6 db             	movzbl %bl,%ebx
    for (i = 0; i <= maxintr; i++) {
  103bf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        ioapicwrite(REG_TABLE + 2 * i, INT_DISABLED | (T_IRQ0 + i));
  103bf8:	8d 48 20             	lea    0x20(%eax),%ecx
    ioapic->reg = reg;
  103bfb:	89 15 00 00 c0 fe    	mov    %edx,0xfec00000
    for (i = 0; i <= maxintr; i++) {
  103c01:	83 c0 01             	add    $0x1,%eax
  103c04:	81 c9 00 00 01 00    	or     $0x10000,%ecx
    ioapic->data = data;
  103c0a:	89 0d 10 00 c0 fe    	mov    %ecx,0xfec00010
    ioapic->reg = reg;
  103c10:	8d 4a 01             	lea    0x1(%edx),%ecx
    for (i = 0; i <= maxintr; i++) {
  103c13:	83 c2 02             	add    $0x2,%edx
    ioapic->reg = reg;
  103c16:	89 0d 00 00 c0 fe    	mov    %ecx,0xfec00000
    ioapic->data = data;
  103c1c:	c7 05 10 00 c0 fe 00 	movl   $0x0,0xfec00010
  103c23:	00 00 00 
    for (i = 0; i <= maxintr; i++) {
  103c26:	39 c3                	cmp    %eax,%ebx
  103c28:	7d ce                	jge    103bf8 <ioapicinit+0x48>
        ioapicwrite(REG_TABLE + 2 * i + 1, 0);
    }
}
  103c2a:	5b                   	pop    %ebx
  103c2b:	c3                   	ret
  103c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103c30 <ioapicenable>:

void ioapicenable(int irq, int cpunum)
{
  103c30:	53                   	push   %ebx
  103c31:	8b 44 24 08          	mov    0x8(%esp),%eax
  103c35:	e8 68 c7 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103c3a:	81 c3 ba 03 01 00    	add    $0x103ba,%ebx
    // Mark interrupt edge-triggered, active high,
    // enabled, and routed to the given cpunum,
    // which happens to be that cpu's APIC ID.
    ioapicwrite(REG_TABLE + 2 * irq, T_IRQ0 + irq);
  103c40:	8d 48 20             	lea    0x20(%eax),%ecx
  103c43:	8d 54 00 10          	lea    0x10(%eax,%eax,1),%edx
    ioapic->reg = reg;
  103c47:	8b 83 74 69 04 00    	mov    0x46974(%ebx),%eax
  103c4d:	89 10                	mov    %edx,(%eax)
    ioapicwrite(REG_TABLE + 2 * irq + 1, cpunum << 24);
  103c4f:	83 c2 01             	add    $0x1,%edx
    ioapic->data = data;
  103c52:	89 48 10             	mov    %ecx,0x10(%eax)
    ioapicwrite(REG_TABLE + 2 * irq + 1, cpunum << 24);
  103c55:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    ioapic->reg = reg;
  103c59:	89 10                	mov    %edx,(%eax)
    ioapicwrite(REG_TABLE + 2 * irq + 1, cpunum << 24);
  103c5b:	c1 e1 18             	shl    $0x18,%ecx
    ioapic->data = data;
  103c5e:	89 48 10             	mov    %ecx,0x10(%eax)
}
  103c61:	5b                   	pop    %ebx
  103c62:	c3                   	ret
  103c63:	66 90                	xchg   %ax,%ax
  103c65:	66 90                	xchg   %ax,%ax
  103c67:	66 90                	xchg   %ax,%ax
  103c69:	66 90                	xchg   %ax,%ax
  103c6b:	66 90                	xchg   %ax,%ax
  103c6d:	66 90                	xchg   %ax,%ax
  103c6f:	90                   	nop

00103c70 <picenable>:
    outb(IO_PIC1 + 1, mask);
    outb(IO_PIC2 + 1, mask >> 8);
}

void picenable(int32_t irq)
{
  103c70:	56                   	push   %esi
  103c71:	53                   	push   %ebx
  103c72:	e8 2b c7 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103c77:	81 c3 7d 03 01 00    	add    $0x1037d,%ebx
  103c7d:	83 ec 0c             	sub    $0xc,%esp
    picsetmask(irqmask & ~(1 << irq));
  103c80:	8b 44 24 18          	mov    0x18(%esp),%eax
  103c84:	0f b7 b3 14 03 00 00 	movzwl 0x314(%ebx),%esi
  103c8b:	0f b3 c6             	btr    %eax,%esi
    outb(IO_PIC1 + 1, mask);
  103c8e:	89 f0                	mov    %esi,%eax
    irqmask = mask;
  103c90:	66 89 b3 14 03 00 00 	mov    %si,0x314(%ebx)
    outb(IO_PIC1 + 1, mask);
  103c97:	0f b6 c0             	movzbl %al,%eax
  103c9a:	50                   	push   %eax
  103c9b:	6a 21                	push   $0x21
  103c9d:	e8 7e 19 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, mask >> 8);
  103ca2:	58                   	pop    %eax
  103ca3:	89 f0                	mov    %esi,%eax
  103ca5:	5a                   	pop    %edx
  103ca6:	0f b6 f4             	movzbl %ah,%esi
  103ca9:	56                   	push   %esi
  103caa:	68 a1 00 00 00       	push   $0xa1
  103caf:	e8 6c 19 00 00       	call   105620 <outb>
}
  103cb4:	83 c4 14             	add    $0x14,%esp
  103cb7:	5b                   	pop    %ebx
  103cb8:	5e                   	pop    %esi
  103cb9:	c3                   	ret
  103cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103cc0 <picinit>:

// Initialize the 8259A interrupt controllers.
void picinit(void)
{
  103cc0:	56                   	push   %esi
  103cc1:	53                   	push   %ebx
  103cc2:	e8 db c6 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103cc7:	81 c3 2d 03 01 00    	add    $0x1032d,%ebx
  103ccd:	83 ec 0c             	sub    $0xc,%esp
    // mask all interrupts
    outb(IO_PIC1 + 1, 0xFF);
  103cd0:	68 ff 00 00 00       	push   $0xff
  103cd5:	6a 21                	push   $0x21
  103cd7:	e8 44 19 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, 0xFF);
  103cdc:	59                   	pop    %ecx
  103cdd:	5e                   	pop    %esi
  103cde:	68 ff 00 00 00       	push   $0xff
  103ce3:	68 a1 00 00 00       	push   $0xa1
  103ce8:	e8 33 19 00 00       	call   105620 <outb>

    // ICW1: 0001g0hi
    //    g: 0 = edge triggering, 1 = level triggering
    //    h: 0 = cascaded PICs, 1 = master only
    //    i: 0 = no ICW4, 1 = ICW4 required
    outb(IO_PIC1, 0x11);
  103ced:	58                   	pop    %eax
  103cee:	5a                   	pop    %edx
  103cef:	6a 11                	push   $0x11
  103cf1:	6a 20                	push   $0x20
  103cf3:	e8 28 19 00 00       	call   105620 <outb>

    // ICW2: Vector offset
    outb(IO_PIC1 + 1, T_IRQ0);
  103cf8:	59                   	pop    %ecx
  103cf9:	5e                   	pop    %esi
  103cfa:	6a 20                	push   $0x20
  103cfc:	6a 21                	push   $0x21
  103cfe:	e8 1d 19 00 00       	call   105620 <outb>

    // ICW3: (master PIC) bit mask of IR lines connected to slaves
    //       (slave PIC) 3-bit # of slave's connection to master
    outb(IO_PIC1 + 1, 1 << IRQ_SLAVE);
  103d03:	58                   	pop    %eax
  103d04:	5a                   	pop    %edx
  103d05:	6a 04                	push   $0x4
  103d07:	6a 21                	push   $0x21
  103d09:	e8 12 19 00 00       	call   105620 <outb>
    //    m: 0 = slave PIC, 1 = master PIC
    //       (ignored when b is 0, as the master/slave role
    //       can be hardwired).
    //    a: 1 = Automatic EOI mode
    //    p: 0 = MCS-80/85 mode, 1 = intel x86 mode
    outb(IO_PIC1 + 1, 0x3);
  103d0e:	59                   	pop    %ecx
  103d0f:	5e                   	pop    %esi
  103d10:	6a 03                	push   $0x3
  103d12:	6a 21                	push   $0x21
  103d14:	e8 07 19 00 00       	call   105620 <outb>

    // Set up slave (8259A-2)
    outb(IO_PIC2, 0x11);            // ICW1
  103d19:	58                   	pop    %eax
  103d1a:	5a                   	pop    %edx
  103d1b:	6a 11                	push   $0x11
  103d1d:	68 a0 00 00 00       	push   $0xa0
  103d22:	e8 f9 18 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, T_IRQ0 + 8);  // ICW2
  103d27:	59                   	pop    %ecx
  103d28:	5e                   	pop    %esi
  103d29:	6a 28                	push   $0x28
  103d2b:	68 a1 00 00 00       	push   $0xa1
  103d30:	e8 eb 18 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, IRQ_SLAVE);   // ICW3
  103d35:	58                   	pop    %eax
  103d36:	5a                   	pop    %edx
  103d37:	6a 02                	push   $0x2
  103d39:	68 a1 00 00 00       	push   $0xa1
  103d3e:	e8 dd 18 00 00       	call   105620 <outb>
    // NB Automatic EOI mode doesn't tend to work on the slave.
    // Linux source code says it's "to be investigated".
    outb(IO_PIC2 + 1, 0x3);         // ICW4
  103d43:	59                   	pop    %ecx
  103d44:	5e                   	pop    %esi
  103d45:	6a 03                	push   $0x3
  103d47:	68 a1 00 00 00       	push   $0xa1
  103d4c:	e8 cf 18 00 00       	call   105620 <outb>

    // OCW3: 0ef01prs
    //   ef: 0x = NOP, 10 = clear specific mask, 11 = set specific mask
    //    p: 0 = no polling, 1 = polling mode
    //   rs: 0x = NOP, 10 = read IRR, 11 = read ISR
    outb(IO_PIC1, 0x68);  // clear specific mask
  103d51:	58                   	pop    %eax
  103d52:	5a                   	pop    %edx
  103d53:	6a 68                	push   $0x68
  103d55:	6a 20                	push   $0x20
  103d57:	e8 c4 18 00 00       	call   105620 <outb>
    outb(IO_PIC1, 0x0a);  // read IRR by default
  103d5c:	59                   	pop    %ecx
  103d5d:	5e                   	pop    %esi
  103d5e:	6a 0a                	push   $0xa
  103d60:	6a 20                	push   $0x20
  103d62:	e8 b9 18 00 00       	call   105620 <outb>

    outb(IO_PIC2, 0x68);  // OCW3
  103d67:	58                   	pop    %eax
  103d68:	5a                   	pop    %edx
  103d69:	6a 68                	push   $0x68
  103d6b:	68 a0 00 00 00       	push   $0xa0
  103d70:	e8 ab 18 00 00       	call   105620 <outb>
    outb(IO_PIC2, 0x0a);  // OCW3
  103d75:	59                   	pop    %ecx
  103d76:	5e                   	pop    %esi
  103d77:	6a 0a                	push   $0xa
  103d79:	68 a0 00 00 00       	push   $0xa0
  103d7e:	e8 9d 18 00 00       	call   105620 <outb>

    if (irqmask != 0xFFFF)
  103d83:	0f b7 b3 14 03 00 00 	movzwl 0x314(%ebx),%esi
  103d8a:	83 c4 10             	add    $0x10,%esp
  103d8d:	66 83 fe ff          	cmp    $0xffff,%si
  103d91:	74 25                	je     103db8 <picinit+0xf8>
    outb(IO_PIC1 + 1, mask);
  103d93:	89 f0                	mov    %esi,%eax
  103d95:	83 ec 08             	sub    $0x8,%esp
  103d98:	0f b6 c0             	movzbl %al,%eax
  103d9b:	50                   	push   %eax
  103d9c:	6a 21                	push   $0x21
  103d9e:	e8 7d 18 00 00       	call   105620 <outb>
    outb(IO_PIC2 + 1, mask >> 8);
  103da3:	58                   	pop    %eax
  103da4:	89 f0                	mov    %esi,%eax
  103da6:	5a                   	pop    %edx
  103da7:	0f b6 f4             	movzbl %ah,%esi
  103daa:	56                   	push   %esi
  103dab:	68 a1 00 00 00       	push   $0xa1
  103db0:	e8 6b 18 00 00       	call   105620 <outb>
}
  103db5:	83 c4 10             	add    $0x10,%esp
        picsetmask(irqmask);
}
  103db8:	83 c4 04             	add    $0x4,%esp
  103dbb:	5b                   	pop    %ebx
  103dbc:	5e                   	pop    %esi
  103dbd:	c3                   	ret
  103dbe:	66 90                	xchg   %ax,%ax

00103dc0 <ide_start>:

/**
 * Start the request for b.  Caller must hold ide_lk.
 */
static void ide_start(struct buf *b)
{
  103dc0:	56                   	push   %esi
  103dc1:	89 c6                	mov    %eax,%esi
  103dc3:	53                   	push   %ebx
  103dc4:	e8 d9 c5 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103dc9:	81 c3 2b 02 01 00    	add    $0x1022b,%ebx
  103dcf:	83 ec 04             	sub    $0x4,%esp
    if (b == 0)
  103dd2:	85 c0                	test   %eax,%eax
  103dd4:	0f 84 e6 00 00 00    	je     103ec0 <ide_start+0x100>
  103dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while (((r = inb(0x1f7)) & (IDE_BSY | IDE_DRDY)) != IDE_DRDY);
  103de0:	83 ec 0c             	sub    $0xc,%esp
  103de3:	68 f7 01 00 00       	push   $0x1f7
  103de8:	e8 03 18 00 00       	call   1055f0 <inb>
  103ded:	83 c4 10             	add    $0x10,%esp
  103df0:	83 e0 c0             	and    $0xffffffc0,%eax
  103df3:	3c 40                	cmp    $0x40,%al
  103df5:	75 e9                	jne    103de0 <ide_start+0x20>
        KERN_PANIC("ide_start");

    ide_wait(0);
    outb(0x3f6, 0);  // generate interrupt
  103df7:	83 ec 08             	sub    $0x8,%esp
  103dfa:	6a 00                	push   $0x0
  103dfc:	68 f6 03 00 00       	push   $0x3f6
  103e01:	e8 1a 18 00 00       	call   105620 <outb>
    outb(0x1f2, 1);  // number of sectors
  103e06:	58                   	pop    %eax
  103e07:	5a                   	pop    %edx
  103e08:	6a 01                	push   $0x1
  103e0a:	68 f2 01 00 00       	push   $0x1f2
  103e0f:	e8 0c 18 00 00       	call   105620 <outb>
    outb(0x1f3, b->sector & 0xff);
  103e14:	59                   	pop    %ecx
  103e15:	58                   	pop    %eax
  103e16:	0f b6 46 08          	movzbl 0x8(%esi),%eax
  103e1a:	50                   	push   %eax
  103e1b:	68 f3 01 00 00       	push   $0x1f3
  103e20:	e8 fb 17 00 00       	call   105620 <outb>
    outb(0x1f4, (b->sector >> 8) & 0xff);
  103e25:	58                   	pop    %eax
  103e26:	0f b6 46 09          	movzbl 0x9(%esi),%eax
  103e2a:	5a                   	pop    %edx
  103e2b:	50                   	push   %eax
  103e2c:	68 f4 01 00 00       	push   $0x1f4
  103e31:	e8 ea 17 00 00       	call   105620 <outb>
    outb(0x1f5, (b->sector >> 16) & 0xff);
  103e36:	59                   	pop    %ecx
  103e37:	58                   	pop    %eax
  103e38:	0f b6 46 0a          	movzbl 0xa(%esi),%eax
  103e3c:	50                   	push   %eax
  103e3d:	68 f5 01 00 00       	push   $0x1f5
  103e42:	e8 d9 17 00 00       	call   105620 <outb>
    outb(0x1f6, 0xe0 | ((b->dev & 1) << 4) | ((b->sector >> 24) & 0x0f));
  103e47:	58                   	pop    %eax
  103e48:	0f b6 46 04          	movzbl 0x4(%esi),%eax
  103e4c:	5a                   	pop    %edx
  103e4d:	0f b6 56 0b          	movzbl 0xb(%esi),%edx
  103e51:	c1 e0 04             	shl    $0x4,%eax
  103e54:	83 e2 0f             	and    $0xf,%edx
  103e57:	83 e0 10             	and    $0x10,%eax
  103e5a:	09 d0                	or     %edx,%eax
  103e5c:	83 c8 e0             	or     $0xffffffe0,%eax
  103e5f:	0f b6 c0             	movzbl %al,%eax
  103e62:	50                   	push   %eax
  103e63:	68 f6 01 00 00       	push   $0x1f6
  103e68:	e8 b3 17 00 00       	call   105620 <outb>
    if (b->flags & B_DIRTY) {
  103e6d:	83 c4 10             	add    $0x10,%esp
  103e70:	f6 06 04             	testb  $0x4,(%esi)
  103e73:	74 33                	je     103ea8 <ide_start+0xe8>
        outb(0x1f7, IDE_CMD_WRITE);
  103e75:	83 ec 08             	sub    $0x8,%esp
        outsl(0x1f0, b->data, 512 / 4);
  103e78:	83 c6 18             	add    $0x18,%esi
        outb(0x1f7, IDE_CMD_WRITE);
  103e7b:	6a 30                	push   $0x30
  103e7d:	68 f7 01 00 00       	push   $0x1f7
  103e82:	e8 99 17 00 00       	call   105620 <outb>
        outsl(0x1f0, b->data, 512 / 4);
  103e87:	83 c4 0c             	add    $0xc,%esp
  103e8a:	68 80 00 00 00       	push   $0x80
  103e8f:	56                   	push   %esi
  103e90:	68 f0 01 00 00       	push   $0x1f0
  103e95:	e8 b6 17 00 00       	call   105650 <outsl>
  103e9a:	83 c4 10             	add    $0x10,%esp
    } else {
        outb(0x1f7, IDE_CMD_READ);
    }
}
  103e9d:	83 c4 04             	add    $0x4,%esp
  103ea0:	5b                   	pop    %ebx
  103ea1:	5e                   	pop    %esi
  103ea2:	c3                   	ret
  103ea3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        outb(0x1f7, IDE_CMD_READ);
  103ea8:	83 ec 08             	sub    $0x8,%esp
  103eab:	6a 20                	push   $0x20
  103ead:	68 f7 01 00 00       	push   $0x1f7
  103eb2:	e8 69 17 00 00       	call   105620 <outb>
  103eb7:	83 c4 10             	add    $0x10,%esp
}
  103eba:	83 c4 04             	add    $0x4,%esp
  103ebd:	5b                   	pop    %ebx
  103ebe:	5e                   	pop    %esi
  103ebf:	c3                   	ret
        KERN_PANIC("ide_start");
  103ec0:	83 ec 04             	sub    $0x4,%esp
  103ec3:	8d 83 8e 73 ff ff    	lea    -0x8c72(%ebx),%eax
  103ec9:	50                   	push   %eax
  103eca:	8d 83 98 73 ff ff    	lea    -0x8c68(%ebx),%eax
  103ed0:	6a 3e                	push   $0x3e
  103ed2:	50                   	push   %eax
  103ed3:	e8 08 09 00 00       	call   1047e0 <debug_panic>
  103ed8:	83 c4 10             	add    $0x10,%esp
  103edb:	e9 00 ff ff ff       	jmp    103de0 <ide_start+0x20>

00103ee0 <ide_init>:
{
  103ee0:	56                   	push   %esi
  103ee1:	53                   	push   %ebx
  103ee2:	e8 bb c4 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103ee7:	81 c3 0d 01 01 00    	add    $0x1010d,%ebx
  103eed:	83 ec 10             	sub    $0x10,%esp
    spinlock_init(&ide_lk);
  103ef0:	8d 83 80 69 04 00    	lea    0x46980(%ebx),%eax
  103ef6:	50                   	push   %eax
  103ef7:	e8 a4 20 00 00       	call   105fa0 <spinlock_init>
    picenable(IRQ_IDE1);
  103efc:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
  103f03:	e8 68 fd ff ff       	call   103c70 <picenable>
    ioapicenable(IRQ_IDE1, pcpu_ncpu() - 1);
  103f08:	e8 b3 fb ff ff       	call   103ac0 <pcpu_ncpu>
  103f0d:	5a                   	pop    %edx
  103f0e:	59                   	pop    %ecx
  103f0f:	83 e8 01             	sub    $0x1,%eax
  103f12:	50                   	push   %eax
  103f13:	6a 0e                	push   $0xe
  103f15:	e8 16 fd ff ff       	call   103c30 <ioapicenable>
    while (((r = inb(0x1f7)) & (IDE_BSY | IDE_DRDY)) != IDE_DRDY);
  103f1a:	83 c4 10             	add    $0x10,%esp
  103f1d:	8d 76 00             	lea    0x0(%esi),%esi
  103f20:	83 ec 0c             	sub    $0xc,%esp
  103f23:	68 f7 01 00 00       	push   $0x1f7
  103f28:	e8 c3 16 00 00       	call   1055f0 <inb>
  103f2d:	83 c4 10             	add    $0x10,%esp
  103f30:	83 e0 c0             	and    $0xffffffc0,%eax
  103f33:	3c 40                	cmp    $0x40,%al
  103f35:	75 e9                	jne    103f20 <ide_init+0x40>
    outb(0x1f6, 0xe0 | (1 << 4));
  103f37:	83 ec 08             	sub    $0x8,%esp
  103f3a:	be e8 03 00 00       	mov    $0x3e8,%esi
  103f3f:	68 f0 00 00 00       	push   $0xf0
  103f44:	68 f6 01 00 00       	push   $0x1f6
  103f49:	e8 d2 16 00 00       	call   105620 <outb>
  103f4e:	83 c4 10             	add    $0x10,%esp
  103f51:	eb 0a                	jmp    103f5d <ide_init+0x7d>
  103f53:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    for (i = 0; i < 1000; i++) {
  103f58:	83 ee 01             	sub    $0x1,%esi
  103f5b:	74 1e                	je     103f7b <ide_init+0x9b>
        if (inb(0x1f7) != 0) {
  103f5d:	83 ec 0c             	sub    $0xc,%esp
  103f60:	68 f7 01 00 00       	push   $0x1f7
  103f65:	e8 86 16 00 00       	call   1055f0 <inb>
  103f6a:	83 c4 10             	add    $0x10,%esp
  103f6d:	84 c0                	test   %al,%al
  103f6f:	74 e7                	je     103f58 <ide_init+0x78>
            havedisk1 = 1;
  103f71:	c7 83 78 69 04 00 01 	movl   $0x1,0x46978(%ebx)
  103f78:	00 00 00 
    outb(0x1f6, 0xe0 | (0 << 4));
  103f7b:	83 ec 08             	sub    $0x8,%esp
  103f7e:	68 e0 00 00 00       	push   $0xe0
  103f83:	68 f6 01 00 00       	push   $0x1f6
  103f88:	e8 93 16 00 00       	call   105620 <outb>
}
  103f8d:	83 c4 14             	add    $0x14,%esp
  103f90:	5b                   	pop    %ebx
  103f91:	5e                   	pop    %esi
  103f92:	c3                   	ret
  103f93:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  103f9a:	00 
  103f9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00103fa0 <ide_intr>:

/**
 * Interrupt handler.
 */
void ide_intr(void)
{
  103fa0:	57                   	push   %edi
  103fa1:	56                   	push   %esi
  103fa2:	53                   	push   %ebx
  103fa3:	e8 fa c3 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  103fa8:	81 c3 4c 00 01 00    	add    $0x1004c,%ebx
    struct buf *b;

    // First queued buffer is the active request.
    spinlock_acquire(&ide_lk);
  103fae:	83 ec 0c             	sub    $0xc,%esp
  103fb1:	8d b3 80 69 04 00    	lea    0x46980(%ebx),%esi
  103fb7:	56                   	push   %esi
  103fb8:	e8 73 20 00 00       	call   106030 <spinlock_acquire>
    if ((b = idequeue) == 0) {
  103fbd:	8b bb 7c 69 04 00    	mov    0x4697c(%ebx),%edi
  103fc3:	83 c4 10             	add    $0x10,%esp
  103fc6:	85 ff                	test   %edi,%edi
  103fc8:	0f 84 82 00 00 00    	je     104050 <ide_intr+0xb0>
        spinlock_release(&ide_lk);
        KERN_INFO("spurious IDE interrupt\n");
        return;
    }
    idequeue = b->qnext;
  103fce:	8b 47 14             	mov    0x14(%edi),%eax
  103fd1:	89 83 7c 69 04 00    	mov    %eax,0x4697c(%ebx)

    // Read data if needed.
    if (!(b->flags & B_DIRTY) && ide_wait(1) >= 0)
  103fd7:	8b 07                	mov    (%edi),%eax
  103fd9:	a8 04                	test   $0x4,%al
  103fdb:	74 33                	je     104010 <ide_intr+0x70>
        insl(0x1f0, b->data, 512 / 4);

    // Wake process waiting for this buf.
    b->flags |= B_VALID;
    b->flags &= ~B_DIRTY;
  103fdd:	83 e0 fb             	and    $0xfffffffb,%eax
    thread_wakeup(b);
  103fe0:	83 ec 0c             	sub    $0xc,%esp
    b->flags &= ~B_DIRTY;
  103fe3:	83 c8 02             	or     $0x2,%eax
  103fe6:	89 07                	mov    %eax,(%edi)
    thread_wakeup(b);
  103fe8:	57                   	push   %edi
  103fe9:	e8 62 31 00 00       	call   107150 <thread_wakeup>

    // Start disk on next buf in queue.
    if (idequeue != 0)
  103fee:	8b 83 7c 69 04 00    	mov    0x4697c(%ebx),%eax
  103ff4:	83 c4 10             	add    $0x10,%esp
  103ff7:	85 c0                	test   %eax,%eax
  103ff9:	74 05                	je     104000 <ide_intr+0x60>
        ide_start(idequeue);
  103ffb:	e8 c0 fd ff ff       	call   103dc0 <ide_start>

    spinlock_release(&ide_lk);
  104000:	83 ec 0c             	sub    $0xc,%esp
  104003:	56                   	push   %esi
  104004:	e8 a7 20 00 00       	call   1060b0 <spinlock_release>
  104009:	83 c4 10             	add    $0x10,%esp
}
  10400c:	5b                   	pop    %ebx
  10400d:	5e                   	pop    %esi
  10400e:	5f                   	pop    %edi
  10400f:	c3                   	ret
    while (((r = inb(0x1f7)) & (IDE_BSY | IDE_DRDY)) != IDE_DRDY);
  104010:	83 ec 0c             	sub    $0xc,%esp
  104013:	68 f7 01 00 00       	push   $0x1f7
  104018:	e8 d3 15 00 00       	call   1055f0 <inb>
  10401d:	83 c4 10             	add    $0x10,%esp
  104020:	89 c2                	mov    %eax,%edx
  104022:	83 e2 c0             	and    $0xffffffc0,%edx
  104025:	80 fa 40             	cmp    $0x40,%dl
  104028:	75 e6                	jne    104010 <ide_intr+0x70>
    if (checkerr && (r & (IDE_DF | IDE_ERR)) != 0)
  10402a:	a8 21                	test   $0x21,%al
  10402c:	75 3e                	jne    10406c <ide_intr+0xcc>
        insl(0x1f0, b->data, 512 / 4);
  10402e:	83 ec 04             	sub    $0x4,%esp
  104031:	8d 47 18             	lea    0x18(%edi),%eax
  104034:	68 80 00 00 00       	push   $0x80
  104039:	50                   	push   %eax
  10403a:	68 f0 01 00 00       	push   $0x1f0
  10403f:	e8 bc 15 00 00       	call   105600 <insl>
    b->flags |= B_VALID;
  104044:	8b 07                	mov    (%edi),%eax
  104046:	83 c4 10             	add    $0x10,%esp
  104049:	eb 92                	jmp    103fdd <ide_intr+0x3d>
  10404b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        spinlock_release(&ide_lk);
  104050:	83 ec 0c             	sub    $0xc,%esp
  104053:	56                   	push   %esi
  104054:	e8 57 20 00 00       	call   1060b0 <spinlock_release>
        KERN_INFO("spurious IDE interrupt\n");
  104059:	8d 83 ac 73 ff ff    	lea    -0x8c54(%ebx),%eax
  10405f:	89 04 24             	mov    %eax,(%esp)
  104062:	e8 d9 06 00 00       	call   104740 <debug_info>
        return;
  104067:	83 c4 10             	add    $0x10,%esp
  10406a:	eb a0                	jmp    10400c <ide_intr+0x6c>
    b->flags |= B_VALID;
  10406c:	8b 07                	mov    (%edi),%eax
  10406e:	e9 6a ff ff ff       	jmp    103fdd <ide_intr+0x3d>
  104073:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10407a:	00 
  10407b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00104080 <ide_rw>:
 * Sync buf with disk.
 * If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
 * Else if B_VALID is not set, read buf from disk, set B_VALID.
 */
void ide_rw(struct buf *b)
{
  104080:	57                   	push   %edi
  104081:	56                   	push   %esi
  104082:	53                   	push   %ebx
  104083:	8b 7c 24 10          	mov    0x10(%esp),%edi
  104087:	e8 16 c3 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10408c:	81 c3 68 ff 00 00    	add    $0xff68,%ebx
    struct buf **pp;

    if (!(b->flags & B_BUSY))
  104092:	8b 07                	mov    (%edi),%eax
  104094:	a8 01                	test   $0x1,%al
  104096:	0f 84 a4 00 00 00    	je     104140 <ide_rw+0xc0>
        KERN_PANIC("ide_rw: buf not busy");
    if ((b->flags & (B_VALID | B_DIRTY)) == B_VALID)
  10409c:	83 e0 06             	and    $0x6,%eax
  10409f:	83 f8 02             	cmp    $0x2,%eax
  1040a2:	0f 84 c1 00 00 00    	je     104169 <ide_rw+0xe9>
        KERN_PANIC("ide_rw: nothing to do");
    if (b->dev != 0 && !havedisk1)
  1040a8:	8b 57 04             	mov    0x4(%edi),%edx
  1040ab:	85 d2                	test   %edx,%edx
  1040ad:	74 0e                	je     1040bd <ide_rw+0x3d>
  1040af:	8b 83 78 69 04 00    	mov    0x46978(%ebx),%eax
  1040b5:	85 c0                	test   %eax,%eax
  1040b7:	0f 84 d3 00 00 00    	je     104190 <ide_rw+0x110>
        KERN_PANIC("ide_rw: ide disk 1 not present");

    spinlock_acquire(&ide_lk);
  1040bd:	83 ec 0c             	sub    $0xc,%esp
  1040c0:	8d b3 80 69 04 00    	lea    0x46980(%ebx),%esi
  1040c6:	56                   	push   %esi
  1040c7:	e8 64 1f 00 00       	call   106030 <spinlock_acquire>

    // Append b to idequeue.
    b->qnext = 0;
    for (pp = &idequeue; *pp; pp = &(*pp)->qnext)
  1040cc:	8b 83 7c 69 04 00    	mov    0x4697c(%ebx),%eax
    b->qnext = 0;
  1040d2:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
    for (pp = &idequeue; *pp; pp = &(*pp)->qnext)
  1040d9:	83 c4 10             	add    $0x10,%esp
  1040dc:	85 c0                	test   %eax,%eax
  1040de:	0f 84 dc 00 00 00    	je     1041c0 <ide_rw+0x140>
  1040e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1040e8:	89 c2                	mov    %eax,%edx
  1040ea:	8b 40 14             	mov    0x14(%eax),%eax
  1040ed:	85 c0                	test   %eax,%eax
  1040ef:	75 f7                	jne    1040e8 <ide_rw+0x68>
  1040f1:	83 c2 14             	add    $0x14,%edx
        ;
    *pp = b;
  1040f4:	89 3a                	mov    %edi,(%edx)

    // Start disk if necessary.
    if (idequeue == b)
  1040f6:	39 bb 7c 69 04 00    	cmp    %edi,0x4697c(%ebx)
  1040fc:	0f 84 ae 00 00 00    	je     1041b0 <ide_rw+0x130>
        ide_start(b);

    // Wait for request to finish.
    while ((b->flags & (B_VALID | B_DIRTY)) != B_VALID) {
  104102:	8b 07                	mov    (%edi),%eax
  104104:	83 e0 06             	and    $0x6,%eax
  104107:	83 f8 02             	cmp    $0x2,%eax
  10410a:	74 1b                	je     104127 <ide_rw+0xa7>
  10410c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        thread_sleep(b, &ide_lk);
  104110:	83 ec 08             	sub    $0x8,%esp
  104113:	56                   	push   %esi
  104114:	57                   	push   %edi
  104115:	e8 f6 2f 00 00       	call   107110 <thread_sleep>
    while ((b->flags & (B_VALID | B_DIRTY)) != B_VALID) {
  10411a:	8b 07                	mov    (%edi),%eax
  10411c:	83 c4 10             	add    $0x10,%esp
  10411f:	83 e0 06             	and    $0x6,%eax
  104122:	83 f8 02             	cmp    $0x2,%eax
  104125:	75 e9                	jne    104110 <ide_rw+0x90>
    }

    spinlock_release(&ide_lk);
  104127:	83 ec 0c             	sub    $0xc,%esp
  10412a:	56                   	push   %esi
  10412b:	e8 80 1f 00 00       	call   1060b0 <spinlock_release>
}
  104130:	83 c4 10             	add    $0x10,%esp
  104133:	5b                   	pop    %ebx
  104134:	5e                   	pop    %esi
  104135:	5f                   	pop    %edi
  104136:	c3                   	ret
  104137:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10413e:	00 
  10413f:	90                   	nop
        KERN_PANIC("ide_rw: buf not busy");
  104140:	83 ec 04             	sub    $0x4,%esp
  104143:	8d 83 c4 73 ff ff    	lea    -0x8c3c(%ebx),%eax
  104149:	50                   	push   %eax
  10414a:	8d 83 98 73 ff ff    	lea    -0x8c68(%ebx),%eax
  104150:	6a 79                	push   $0x79
  104152:	50                   	push   %eax
  104153:	e8 88 06 00 00       	call   1047e0 <debug_panic>
    if ((b->flags & (B_VALID | B_DIRTY)) == B_VALID)
  104158:	8b 07                	mov    (%edi),%eax
  10415a:	83 c4 10             	add    $0x10,%esp
  10415d:	83 e0 06             	and    $0x6,%eax
  104160:	83 f8 02             	cmp    $0x2,%eax
  104163:	0f 85 3f ff ff ff    	jne    1040a8 <ide_rw+0x28>
        KERN_PANIC("ide_rw: nothing to do");
  104169:	83 ec 04             	sub    $0x4,%esp
  10416c:	8d 83 d9 73 ff ff    	lea    -0x8c27(%ebx),%eax
  104172:	50                   	push   %eax
  104173:	8d 83 98 73 ff ff    	lea    -0x8c68(%ebx),%eax
  104179:	6a 7b                	push   $0x7b
  10417b:	50                   	push   %eax
  10417c:	e8 5f 06 00 00       	call   1047e0 <debug_panic>
  104181:	83 c4 10             	add    $0x10,%esp
  104184:	e9 1f ff ff ff       	jmp    1040a8 <ide_rw+0x28>
  104189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        KERN_PANIC("ide_rw: ide disk 1 not present");
  104190:	83 ec 04             	sub    $0x4,%esp
  104193:	8d 83 b4 80 ff ff    	lea    -0x7f4c(%ebx),%eax
  104199:	50                   	push   %eax
  10419a:	8d 83 98 73 ff ff    	lea    -0x8c68(%ebx),%eax
  1041a0:	6a 7d                	push   $0x7d
  1041a2:	50                   	push   %eax
  1041a3:	e8 38 06 00 00       	call   1047e0 <debug_panic>
  1041a8:	83 c4 10             	add    $0x10,%esp
  1041ab:	e9 0d ff ff ff       	jmp    1040bd <ide_rw+0x3d>
        ide_start(b);
  1041b0:	89 f8                	mov    %edi,%eax
  1041b2:	e8 09 fc ff ff       	call   103dc0 <ide_start>
  1041b7:	e9 46 ff ff ff       	jmp    104102 <ide_rw+0x82>
  1041bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (pp = &idequeue; *pp; pp = &(*pp)->qnext)
  1041c0:	8d 93 7c 69 04 00    	lea    0x4697c(%ebx),%edx
  1041c6:	e9 29 ff ff ff       	jmp    1040f4 <ide_rw+0x74>
  1041cb:	66 90                	xchg   %ax,%ax
  1041cd:	66 90                	xchg   %ax,%ax
  1041cf:	90                   	nop

001041d0 <detect_kvm>:
}

#define CPUID_FEATURE_HYPERVISOR	(1<<31) /* Running on a hypervisor */

int detect_kvm(void)
{
  1041d0:	57                   	push   %edi
	__asm __volatile("cpuid"
  1041d1:	b8 01 00 00 00       	mov    $0x1,%eax
  1041d6:	31 c9                	xor    %ecx,%ecx
{
  1041d8:	56                   	push   %esi
  1041d9:	e8 c7 f9 ff ff       	call   103ba5 <__x86.get_pc_thunk.si>
  1041de:	81 c6 16 fe 00 00    	add    $0xfe16,%esi
  1041e4:	53                   	push   %ebx
  1041e5:	83 ec 10             	sub    $0x10,%esp
	__asm __volatile("cpuid"
  1041e8:	0f a2                	cpuid
	uint32_t eax;

	if (cpu_has (CPUID_FEATURE_HYPERVISOR))
  1041ea:	83 e2 01             	and    $0x1,%edx
  1041ed:	75 11                	jne    104200 <detect_kvm+0x30>
		{
			return 1;
		}
	}
	return 0;
}
  1041ef:	83 c4 10             	add    $0x10,%esp
	return 0;
  1041f2:	31 c0                	xor    %eax,%eax
}
  1041f4:	5b                   	pop    %ebx
  1041f5:	5e                   	pop    %esi
  1041f6:	5f                   	pop    %edi
  1041f7:	c3                   	ret
  1041f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1041ff:	00 
		cpuid (CPUID_KVM_SIGNATURE, &eax, &hyper_vendor_id[0],
  104200:	83 ec 0c             	sub    $0xc,%esp
  104203:	89 f3                	mov    %esi,%ebx
  104205:	8d 44 24 18          	lea    0x18(%esp),%eax
  104209:	8d 7c 24 10          	lea    0x10(%esp),%edi
  10420d:	50                   	push   %eax
  10420e:	8d 44 24 18          	lea    0x18(%esp),%eax
  104212:	50                   	push   %eax
  104213:	57                   	push   %edi
  104214:	8d 44 24 18          	lea    0x18(%esp),%eax
  104218:	50                   	push   %eax
  104219:	68 00 00 00 40       	push   $0x40000000
  10421e:	e8 9d 12 00 00       	call   1054c0 <cpuid>
		if (!strncmp ("KVMKVMKVM", (const char *) hyper_vendor_id, 9))
  104223:	83 c4 1c             	add    $0x1c,%esp
  104226:	8d 86 ef 73 ff ff    	lea    -0x8c11(%esi),%eax
  10422c:	6a 09                	push   $0x9
  10422e:	57                   	push   %edi
  10422f:	50                   	push   %eax
  104230:	e8 ab 02 00 00       	call   1044e0 <strncmp>
  104235:	83 c4 10             	add    $0x10,%esp
  104238:	85 c0                	test   %eax,%eax
  10423a:	75 b3                	jne    1041ef <detect_kvm+0x1f>
}
  10423c:	83 c4 10             	add    $0x10,%esp
			return 1;
  10423f:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104244:	5b                   	pop    %ebx
  104245:	5e                   	pop    %esi
  104246:	5f                   	pop    %edi
  104247:	c3                   	ret
  104248:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10424f:	00 

00104250 <kvm_has_feature>:

int
kvm_has_feature(uint32_t feature)
{
  104250:	53                   	push   %ebx
  104251:	e8 4c c1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  104256:	81 c3 9e fd 00 00    	add    $0xfd9e,%ebx
  10425c:	83 ec 24             	sub    $0x24,%esp
	uint32_t eax, ebx, ecx, edx;
	eax = 0; edx = 0;
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  10425f:	8d 44 24 18          	lea    0x18(%esp),%eax
	eax = 0; edx = 0;
  104263:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  10426a:	00 
  10426b:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  104272:	00 
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  104273:	50                   	push   %eax
  104274:	8d 44 24 18          	lea    0x18(%esp),%eax
  104278:	50                   	push   %eax
  104279:	8d 44 24 18          	lea    0x18(%esp),%eax
  10427d:	50                   	push   %eax
  10427e:	8d 44 24 18          	lea    0x18(%esp),%eax
  104282:	50                   	push   %eax
  104283:	68 01 00 00 40       	push   $0x40000001
  104288:	e8 33 12 00 00       	call   1054c0 <cpuid>

	return ((eax & feature) != 0 ? 1 : 0);
  10428d:	8b 44 24 40          	mov    0x40(%esp),%eax
  104291:	23 44 24 20          	and    0x20(%esp),%eax
  104295:	85 c0                	test   %eax,%eax
  104297:	0f 95 c0             	setne  %al
}
  10429a:	83 c4 38             	add    $0x38,%esp
	return ((eax & feature) != 0 ? 1 : 0);
  10429d:	0f b6 c0             	movzbl %al,%eax
}
  1042a0:	5b                   	pop    %ebx
  1042a1:	c3                   	ret
  1042a2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1042a9:	00 
  1042aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001042b0 <kvm_enable_feature>:

int
kvm_enable_feature(uint32_t feature)
{
  1042b0:	53                   	push   %ebx
	uint32_t eax, ebx, ecx, edx;
	eax = 1 << feature; edx = 0;
  1042b1:	b8 01 00 00 00       	mov    $0x1,%eax
  1042b6:	e8 e7 c0 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1042bb:	81 c3 39 fd 00 00    	add    $0xfd39,%ebx
{
  1042c1:	83 ec 24             	sub    $0x24,%esp
	eax = 1 << feature; edx = 0;
  1042c4:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  1042c8:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  1042cf:	00 
  1042d0:	d3 e0                	shl    %cl,%eax
  1042d2:	89 44 24 0c          	mov    %eax,0xc(%esp)
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  1042d6:	8d 44 24 18          	lea    0x18(%esp),%eax
  1042da:	50                   	push   %eax
  1042db:	8d 44 24 18          	lea    0x18(%esp),%eax
  1042df:	50                   	push   %eax
  1042e0:	8d 44 24 18          	lea    0x18(%esp),%eax
  1042e4:	50                   	push   %eax
  1042e5:	8d 44 24 18          	lea    0x18(%esp),%eax
  1042e9:	50                   	push   %eax
  1042ea:	68 01 00 00 40       	push   $0x40000001
  1042ef:	e8 cc 11 00 00       	call   1054c0 <cpuid>

	return (ebx == 0 ? 1 : 0);
  1042f4:	8b 54 24 24          	mov    0x24(%esp),%edx
  1042f8:	31 c0                	xor    %eax,%eax
  1042fa:	85 d2                	test   %edx,%edx
  1042fc:	0f 94 c0             	sete   %al
}
  1042ff:	83 c4 38             	add    $0x38,%esp
  104302:	5b                   	pop    %ebx
  104303:	c3                   	ret
  104304:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10430b:	00 
  10430c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104310 <kvm_get_tsc_hz>:

uint64_t
kvm_get_tsc_hz(void)
{
  104310:	55                   	push   %ebp
  104311:	57                   	push   %edi
  104312:	56                   	push   %esi
  104313:	53                   	push   %ebx
  104314:	e8 89 c0 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  104319:	81 c3 db fc 00 00    	add    $0xfcdb,%ebx
  10431f:	83 ec 38             	sub    $0x38,%esp
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  104322:	8d 44 24 28          	lea    0x28(%esp),%eax
	eax = 0; edx = 0;
  104326:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  10432d:	00 
  10432e:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  104335:	00 
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  104336:	50                   	push   %eax
  104337:	8d 6c 24 28          	lea    0x28(%esp),%ebp
  10433b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  10433f:	55                   	push   %ebp
  104340:	8d 7c 24 28          	lea    0x28(%esp),%edi
  104344:	57                   	push   %edi
  104345:	8d 74 24 28          	lea    0x28(%esp),%esi
  104349:	56                   	push   %esi
  10434a:	68 01 00 00 40       	push   $0x40000001
  10434f:	e8 6c 11 00 00       	call   1054c0 <cpuid>
	uint64_t tsc_hz = 0llu;
	uint32_t msr_sys_time;

	if (kvm_has_feature(KVM_FEATURE_CLOCKSOURCE2))
  104354:	83 c4 20             	add    $0x20,%esp
  104357:	f6 44 24 10 03       	testb  $0x3,0x10(%esp)
  10435c:	75 42                	jne    1043a0 <kvm_get_tsc_hz+0x90>
	eax = 0; edx = 0;
  10435e:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  104365:	00 
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  104366:	83 ec 0c             	sub    $0xc,%esp
	eax = 0; edx = 0;
  104369:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  104370:	00 
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  104371:	8b 44 24 18          	mov    0x18(%esp),%eax
  104375:	50                   	push   %eax
  104376:	55                   	push   %ebp
  104377:	57                   	push   %edi
	{
		msr_sys_time = MSR_KVM_SYSTEM_TIME;
	}
	else
	{
		return (0llu);
  104378:	31 ff                	xor    %edi,%edi
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  10437a:	56                   	push   %esi
		return (0llu);
  10437b:	31 f6                	xor    %esi,%esi
	cpuid(CPUID_KVM_FEATURES, &eax, &ebx, &ecx, &edx);
  10437d:	68 01 00 00 40       	push   $0x40000001
  104382:	e8 39 11 00 00       	call   1054c0 <cpuid>
	return ((eax & feature) != 0 ? 1 : 0);
  104387:	83 c4 20             	add    $0x20,%esp

	/* disable update */
	wrmsr(msr_sys_time, (uint64_t) ((uint32_t) &pvclock));

	return tsc_hz;
}
  10438a:	89 f0                	mov    %esi,%eax
  10438c:	89 fa                	mov    %edi,%edx
  10438e:	83 c4 2c             	add    $0x2c,%esp
  104391:	5b                   	pop    %ebx
  104392:	5e                   	pop    %esi
  104393:	5f                   	pop    %edi
  104394:	5d                   	pop    %ebp
  104395:	c3                   	ret
  104396:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10439d:	00 
  10439e:	66 90                	xchg   %ax,%ax
	wrmsr(msr_sys_time, (uint64_t) ((uint32_t) &pvclock) | 0x1llu);
  1043a0:	8d ab 8c 69 04 00    	lea    0x4698c(%ebx),%ebp
  1043a6:	83 ec 04             	sub    $0x4,%esp
  1043a9:	31 d2                	xor    %edx,%edx
	tsc_hz = (uint64_t) pvclock.tsc_to_system_mul;
  1043ab:	31 ff                	xor    %edi,%edi
	wrmsr(msr_sys_time, (uint64_t) ((uint32_t) &pvclock) | 0x1llu);
  1043ad:	89 e8                	mov    %ebp,%eax
  1043af:	52                   	push   %edx
  1043b0:	83 c8 01             	or     $0x1,%eax
  1043b3:	50                   	push   %eax
  1043b4:	68 01 4d 56 4b       	push   $0x4b564d01
  1043b9:	e8 52 10 00 00       	call   105410 <wrmsr>
	wrmsr(msr_sys_time, (uint64_t) ((uint32_t) &pvclock));
  1043be:	83 c4 0c             	add    $0xc,%esp
  1043c1:	31 d2                	xor    %edx,%edx
	tsc_hz = (uint64_t) pvclock.tsc_to_system_mul;
  1043c3:	8b b3 a4 69 04 00    	mov    0x469a4(%ebx),%esi
	wrmsr(msr_sys_time, (uint64_t) ((uint32_t) &pvclock));
  1043c9:	52                   	push   %edx
  1043ca:	55                   	push   %ebp
  1043cb:	68 01 4d 56 4b       	push   $0x4b564d01
  1043d0:	e8 3b 10 00 00       	call   105410 <wrmsr>
	return tsc_hz;
  1043d5:	83 c4 10             	add    $0x10,%esp
}
  1043d8:	89 f0                	mov    %esi,%eax
  1043da:	89 fa                	mov    %edi,%edx
  1043dc:	83 c4 2c             	add    $0x2c,%esp
  1043df:	5b                   	pop    %ebx
  1043e0:	5e                   	pop    %esi
  1043e1:	5f                   	pop    %edi
  1043e2:	5d                   	pop    %ebp
  1043e3:	c3                   	ret
  1043e4:	66 90                	xchg   %ax,%ax
  1043e6:	66 90                	xchg   %ax,%ax
  1043e8:	66 90                	xchg   %ax,%ax
  1043ea:	66 90                	xchg   %ax,%ax
  1043ec:	66 90                	xchg   %ax,%ax
  1043ee:	66 90                	xchg   %ax,%ax

001043f0 <aesenc128>:

	return y;
}

uint128_t aesenc128 (uint128_t a, uint128_t round_key)
{
  1043f0:	83 ec 2c             	sub    $0x2c,%esp
	v2di _a = v2di_cast(a);
	v2di _round_key = v2di_cast(round_key);

	v2di _ret = __builtin_ia32_aesenc128(_a, _round_key);
  1043f3:	f3 0f 6f 44 24 34    	movdqu 0x34(%esp),%xmm0
  1043f9:	f3 0f 6f 4c 24 44    	movdqu 0x44(%esp),%xmm1
{
  1043ff:	8b 44 24 30          	mov    0x30(%esp),%eax
	v2di _ret = __builtin_ia32_aesenc128(_a, _round_key);
  104403:	66 0f 38 dc c1       	aesenc %xmm1,%xmm0

	uint128_t ret = uint128_cast(_ret);
	return ret;
  104408:	0f 29 00             	movaps %xmm0,(%eax)
}
  10440b:	83 c4 2c             	add    $0x2c,%esp
  10440e:	c2 04 00             	ret    $0x4
  104411:	66 90                	xchg   %ax,%ax
  104413:	66 90                	xchg   %ax,%ax
  104415:	66 90                	xchg   %ax,%ax
  104417:	66 90                	xchg   %ax,%ax
  104419:	66 90                	xchg   %ax,%ax
  10441b:	66 90                	xchg   %ax,%ax
  10441d:	66 90                	xchg   %ax,%ax
  10441f:	90                   	nop

00104420 <memset>:
#include "string.h"
#include "types.h"

void *memset(void *v, int c, size_t n)
{
  104420:	57                   	push   %edi
  104421:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  104425:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
  104429:	85 c9                	test   %ecx,%ecx
  10442b:	74 19                	je     104446 <memset+0x26>
        return v;
    if ((int) v % 4 == 0 && n % 4 == 0) {
  10442d:	89 f8                	mov    %edi,%eax
  10442f:	09 c8                	or     %ecx,%eax
  104431:	a8 03                	test   $0x3,%al
  104433:	75 1b                	jne    104450 <memset+0x30>
        c &= 0xFF;
  104435:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
        c = (c << 24) | (c << 16) | (c << 8) | c;
        asm volatile ("cld; rep stosl\n"
                      :: "D" (v), "a" (c), "c" (n / 4)
  10443a:	c1 e9 02             	shr    $0x2,%ecx
  10443d:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
        asm volatile ("cld; rep stosl\n"
  104443:	fc                   	cld
  104444:	f3 ab                	rep stos %eax,%es:(%edi)
    } else
        asm volatile ("cld; rep stosb\n"
                      :: "D" (v), "a" (c), "c" (n)
                      : "cc", "memory");
    return v;
}
  104446:	89 f8                	mov    %edi,%eax
  104448:	5f                   	pop    %edi
  104449:	c3                   	ret
  10444a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        asm volatile ("cld; rep stosb\n"
  104450:	8b 44 24 0c          	mov    0xc(%esp),%eax
  104454:	fc                   	cld
  104455:	f3 aa                	rep stos %al,%es:(%edi)
}
  104457:	89 f8                	mov    %edi,%eax
  104459:	5f                   	pop    %edi
  10445a:	c3                   	ret
  10445b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00104460 <memmove>:

void *memmove(void *dst, const void *src, size_t n)
{
  104460:	57                   	push   %edi
  104461:	56                   	push   %esi
  104462:	8b 44 24 0c          	mov    0xc(%esp),%eax
  104466:	8b 74 24 10          	mov    0x10(%esp),%esi
  10446a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
  10446e:	39 c6                	cmp    %eax,%esi
  104470:	73 26                	jae    104498 <memmove+0x38>
  104472:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  104475:	39 d0                	cmp    %edx,%eax
  104477:	73 1f                	jae    104498 <memmove+0x38>
        s += n;
        d += n;
  104479:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
  10447c:	89 fe                	mov    %edi,%esi
  10447e:	09 ce                	or     %ecx,%esi
  104480:	09 d6                	or     %edx,%esi
  104482:	83 e6 03             	and    $0x3,%esi
  104485:	74 39                	je     1044c0 <memmove+0x60>
            asm volatile ("std; rep movsl\n"
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
                          : "cc", "memory");
        else
            asm volatile ("std; rep movsb\n"
                          :: "D" (d - 1), "S" (s - 1), "c" (n)
  104487:	83 ef 01             	sub    $0x1,%edi
  10448a:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile ("std; rep movsb\n"
  10448d:	fd                   	std
  10448e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                          : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile ("cld" ::: "cc");
  104490:	fc                   	cld
            asm volatile ("cld; rep movsb\n"
                          :: "D" (d), "S" (s), "c" (n)
                          : "cc", "memory");
    }
    return dst;
}
  104491:	5e                   	pop    %esi
  104492:	5f                   	pop    %edi
  104493:	c3                   	ret
  104494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if ((int) s % 4 == 0 && (int) d % 4 == 0 && n % 4 == 0)
  104498:	89 c2                	mov    %eax,%edx
  10449a:	09 ca                	or     %ecx,%edx
  10449c:	09 f2                	or     %esi,%edx
  10449e:	83 e2 03             	and    $0x3,%edx
  1044a1:	74 0d                	je     1044b0 <memmove+0x50>
            asm volatile ("cld; rep movsb\n"
  1044a3:	89 c7                	mov    %eax,%edi
  1044a5:	fc                   	cld
  1044a6:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
}
  1044a8:	5e                   	pop    %esi
  1044a9:	5f                   	pop    %edi
  1044aa:	c3                   	ret
  1044ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                          :: "D" (d), "S" (s), "c" (n / 4)
  1044b0:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("cld; rep movsl\n"
  1044b3:	89 c7                	mov    %eax,%edi
  1044b5:	fc                   	cld
  1044b6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1044b8:	eb ee                	jmp    1044a8 <memmove+0x48>
  1044ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                          :: "D" (d - 4), "S" (s - 4), "c" (n / 4)
  1044c0:	83 ef 04             	sub    $0x4,%edi
  1044c3:	8d 72 fc             	lea    -0x4(%edx),%esi
  1044c6:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile ("std; rep movsl\n"
  1044c9:	fd                   	std
  1044ca:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1044cc:	eb c2                	jmp    104490 <memmove+0x30>
  1044ce:	66 90                	xchg   %ax,%ax

001044d0 <memcpy>:

void *memcpy(void *dst, const void *src, size_t n)
{
    return memmove(dst, src, n);
  1044d0:	eb 8e                	jmp    104460 <memmove>
  1044d2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1044d9:	00 
  1044da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001044e0 <strncmp>:
}

int strncmp(const char *p, const char *q, size_t n)
{
  1044e0:	53                   	push   %ebx
  1044e1:	8b 54 24 10          	mov    0x10(%esp),%edx
  1044e5:	8b 44 24 08          	mov    0x8(%esp),%eax
  1044e9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (n > 0 && *p && *p == *q)
  1044ed:	85 d2                	test   %edx,%edx
  1044ef:	75 16                	jne    104507 <strncmp+0x27>
  1044f1:	eb 2d                	jmp    104520 <strncmp+0x40>
  1044f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1044f8:	3a 19                	cmp    (%ecx),%bl
  1044fa:	75 12                	jne    10450e <strncmp+0x2e>
        n--, p++, q++;
  1044fc:	83 c0 01             	add    $0x1,%eax
  1044ff:	83 c1 01             	add    $0x1,%ecx
    while (n > 0 && *p && *p == *q)
  104502:	83 ea 01             	sub    $0x1,%edx
  104505:	74 19                	je     104520 <strncmp+0x40>
  104507:	0f b6 18             	movzbl (%eax),%ebx
  10450a:	84 db                	test   %bl,%bl
  10450c:	75 ea                	jne    1044f8 <strncmp+0x18>
    if (n == 0)
        return 0;
    else
        return (int) ((unsigned char) *p - (unsigned char) *q);
  10450e:	0f b6 00             	movzbl (%eax),%eax
  104511:	0f b6 11             	movzbl (%ecx),%edx
}
  104514:	5b                   	pop    %ebx
        return (int) ((unsigned char) *p - (unsigned char) *q);
  104515:	29 d0                	sub    %edx,%eax
}
  104517:	c3                   	ret
  104518:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10451f:	00 
        return 0;
  104520:	31 c0                	xor    %eax,%eax
}
  104522:	5b                   	pop    %ebx
  104523:	c3                   	ret
  104524:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10452b:	00 
  10452c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104530 <strnlen>:

int strnlen(const char *s, size_t size)
{
  104530:	8b 54 24 08          	mov    0x8(%esp),%edx
  104534:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    int n;

    for (n = 0; size > 0 && *s != '\0'; s++, size--)
  104538:	31 c0                	xor    %eax,%eax
  10453a:	85 d2                	test   %edx,%edx
  10453c:	75 09                	jne    104547 <strnlen+0x17>
  10453e:	c3                   	ret
  10453f:	90                   	nop
        n++;
  104540:	83 c0 01             	add    $0x1,%eax
    for (n = 0; size > 0 && *s != '\0'; s++, size--)
  104543:	39 c2                	cmp    %eax,%edx
  104545:	74 09                	je     104550 <strnlen+0x20>
  104547:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  10454b:	75 f3                	jne    104540 <strnlen+0x10>
  10454d:	c3                   	ret
  10454e:	66 90                	xchg   %ax,%ax
    return n;
}
  104550:	c3                   	ret
  104551:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104558:	00 
  104559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104560 <strcmp>:

int strcmp(const char *p, const char *q)
{
  104560:	53                   	push   %ebx
  104561:	8b 54 24 08          	mov    0x8(%esp),%edx
  104565:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    while (*p && *p == *q)
  104569:	0f b6 02             	movzbl (%edx),%eax
  10456c:	84 c0                	test   %al,%al
  10456e:	75 18                	jne    104588 <strcmp+0x28>
  104570:	eb 30                	jmp    1045a2 <strcmp+0x42>
  104572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104578:	0f b6 42 01          	movzbl 0x1(%edx),%eax
        p++, q++;
  10457c:	83 c2 01             	add    $0x1,%edx
  10457f:	8d 59 01             	lea    0x1(%ecx),%ebx
    while (*p && *p == *q)
  104582:	84 c0                	test   %al,%al
  104584:	74 12                	je     104598 <strcmp+0x38>
  104586:	89 d9                	mov    %ebx,%ecx
  104588:	0f b6 19             	movzbl (%ecx),%ebx
  10458b:	38 c3                	cmp    %al,%bl
  10458d:	74 e9                	je     104578 <strcmp+0x18>
    return (int) ((unsigned char) *p - (unsigned char) *q);
  10458f:	29 d8                	sub    %ebx,%eax
}
  104591:	5b                   	pop    %ebx
  104592:	c3                   	ret
  104593:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return (int) ((unsigned char) *p - (unsigned char) *q);
  104598:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  10459c:	31 c0                	xor    %eax,%eax
  10459e:	29 d8                	sub    %ebx,%eax
}
  1045a0:	5b                   	pop    %ebx
  1045a1:	c3                   	ret
    return (int) ((unsigned char) *p - (unsigned char) *q);
  1045a2:	0f b6 19             	movzbl (%ecx),%ebx
  1045a5:	31 c0                	xor    %eax,%eax
  1045a7:	eb e6                	jmp    10458f <strcmp+0x2f>
  1045a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001045b0 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *strchr(const char *s, char c)
{
  1045b0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1045b4:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
    for (; *s; s++)
  1045b9:	0f b6 10             	movzbl (%eax),%edx
  1045bc:	84 d2                	test   %dl,%dl
  1045be:	75 13                	jne    1045d3 <strchr+0x23>
  1045c0:	eb 1e                	jmp    1045e0 <strchr+0x30>
  1045c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1045c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  1045cc:	83 c0 01             	add    $0x1,%eax
  1045cf:	84 d2                	test   %dl,%dl
  1045d1:	74 0d                	je     1045e0 <strchr+0x30>
        if (*s == c)
  1045d3:	38 d1                	cmp    %dl,%cl
  1045d5:	75 f1                	jne    1045c8 <strchr+0x18>
            return (char *) s;
    return 0;
}
  1045d7:	c3                   	ret
  1045d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1045df:	00 
    return 0;
  1045e0:	31 c0                	xor    %eax,%eax
}
  1045e2:	c3                   	ret
  1045e3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1045ea:	00 
  1045eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001045f0 <memzero>:

void *memzero(void *v, size_t n)
{
  1045f0:	57                   	push   %edi
  1045f1:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  1045f5:	8b 7c 24 08          	mov    0x8(%esp),%edi
    if (n == 0)
  1045f9:	85 c9                	test   %ecx,%ecx
  1045fb:	74 0f                	je     10460c <memzero+0x1c>
    if ((int) v % 4 == 0 && n % 4 == 0) {
  1045fd:	89 f8                	mov    %edi,%eax
  1045ff:	09 c8                	or     %ecx,%eax
  104601:	83 e0 03             	and    $0x3,%eax
  104604:	75 0a                	jne    104610 <memzero+0x20>
                      :: "D" (v), "a" (c), "c" (n / 4)
  104606:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile ("cld; rep stosl\n"
  104609:	fc                   	cld
  10460a:	f3 ab                	rep stos %eax,%es:(%edi)
    return memset(v, 0, n);
}
  10460c:	89 f8                	mov    %edi,%eax
  10460e:	5f                   	pop    %edi
  10460f:	c3                   	ret
        asm volatile ("cld; rep stosb\n"
  104610:	31 c0                	xor    %eax,%eax
  104612:	fc                   	cld
  104613:	f3 aa                	rep stos %al,%es:(%edi)
}
  104615:	89 f8                	mov    %edi,%eax
  104617:	5f                   	pop    %edi
  104618:	c3                   	ret
  104619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104620 <memcmp>:

int memcmp(const void *v1, const void *v2, size_t n)
{
  104620:	56                   	push   %esi
  104621:	53                   	push   %ebx
  104622:	8b 74 24 14          	mov    0x14(%esp),%esi
  104626:	8b 44 24 0c          	mov    0xc(%esp),%eax
  10462a:	8b 54 24 10          	mov    0x10(%esp),%edx
    const uint8_t *s1 = (const uint8_t *) v1;
    const uint8_t *s2 = (const uint8_t *) v2;

    while (n-- > 0) {
  10462e:	85 f6                	test   %esi,%esi
  104630:	74 2e                	je     104660 <memcmp+0x40>
  104632:	01 c6                	add    %eax,%esi
  104634:	eb 14                	jmp    10464a <memcmp+0x2a>
  104636:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10463d:	00 
  10463e:	66 90                	xchg   %ax,%ax
        if (*s1 != *s2)
            return (int) *s1 - (int) *s2;
        s1++, s2++;
  104640:	83 c0 01             	add    $0x1,%eax
  104643:	83 c2 01             	add    $0x1,%edx
    while (n-- > 0) {
  104646:	39 f0                	cmp    %esi,%eax
  104648:	74 16                	je     104660 <memcmp+0x40>
        if (*s1 != *s2)
  10464a:	0f b6 08             	movzbl (%eax),%ecx
  10464d:	0f b6 1a             	movzbl (%edx),%ebx
  104650:	38 d9                	cmp    %bl,%cl
  104652:	74 ec                	je     104640 <memcmp+0x20>
            return (int) *s1 - (int) *s2;
  104654:	0f b6 c1             	movzbl %cl,%eax
  104657:	29 d8                	sub    %ebx,%eax
    }

    return 0;
}
  104659:	5b                   	pop    %ebx
  10465a:	5e                   	pop    %esi
  10465b:	c3                   	ret
  10465c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return 0;
  104660:	31 c0                	xor    %eax,%eax
}
  104662:	5b                   	pop    %ebx
  104663:	5e                   	pop    %esi
  104664:	c3                   	ret
  104665:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10466c:	00 
  10466d:	8d 76 00             	lea    0x0(%esi),%esi

00104670 <strncpy>:

char *strncpy(char *s, const char *t, int n)
{
  104670:	57                   	push   %edi
  104671:	56                   	push   %esi
  104672:	53                   	push   %ebx
  104673:	8b 7c 24 10          	mov    0x10(%esp),%edi
  104677:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  10467b:	8b 54 24 18          	mov    0x18(%esp),%edx
    char *os;

    os = s;
    while (n-- > 0 && (*s++ = *t++) != 0) {}
  10467f:	89 f8                	mov    %edi,%eax
  104681:	eb 15                	jmp    104698 <strncpy+0x28>
  104683:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  104688:	0f b6 19             	movzbl (%ecx),%ebx
  10468b:	83 c1 01             	add    $0x1,%ecx
  10468e:	83 c0 01             	add    $0x1,%eax
  104691:	88 58 ff             	mov    %bl,-0x1(%eax)
  104694:	84 db                	test   %bl,%bl
  104696:	74 18                	je     1046b0 <strncpy+0x40>
  104698:	89 d6                	mov    %edx,%esi
  10469a:	83 ea 01             	sub    $0x1,%edx
  10469d:	85 f6                	test   %esi,%esi
  10469f:	7f e7                	jg     104688 <strncpy+0x18>
    while (n-- > 0)
        *s++ = 0;
    return os;
}
  1046a1:	89 f8                	mov    %edi,%eax
  1046a3:	5b                   	pop    %ebx
  1046a4:	5e                   	pop    %esi
  1046a5:	5f                   	pop    %edi
  1046a6:	c3                   	ret
  1046a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1046ae:	00 
  1046af:	90                   	nop
    while (n-- > 0)
  1046b0:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
  1046b3:	83 e9 01             	sub    $0x1,%ecx
  1046b6:	85 d2                	test   %edx,%edx
  1046b8:	74 e7                	je     1046a1 <strncpy+0x31>
  1046ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        *s++ = 0;
  1046c0:	83 c0 01             	add    $0x1,%eax
  1046c3:	89 ca                	mov    %ecx,%edx
  1046c5:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
    while (n-- > 0)
  1046c9:	29 c2                	sub    %eax,%edx
  1046cb:	85 d2                	test   %edx,%edx
  1046cd:	7f f1                	jg     1046c0 <strncpy+0x50>
}
  1046cf:	89 f8                	mov    %edi,%eax
  1046d1:	5b                   	pop    %ebx
  1046d2:	5e                   	pop    %esi
  1046d3:	5f                   	pop    %edi
  1046d4:	c3                   	ret
  1046d5:	66 90                	xchg   %ax,%ax
  1046d7:	66 90                	xchg   %ax,%ax
  1046d9:	66 90                	xchg   %ax,%ax
  1046db:	66 90                	xchg   %ax,%ax
  1046dd:	66 90                	xchg   %ax,%ax
  1046df:	90                   	nop

001046e0 <debug_init>:
#include <lib/reentrant_lock.h>

static reentrantlock debug_lk;

void debug_init(void)
{
  1046e0:	53                   	push   %ebx
  1046e1:	e8 bc bc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1046e6:	81 c3 0e f9 00 00    	add    $0xf90e,%ebx
  1046ec:	83 ec 14             	sub    $0x14,%esp
    reentrantlock_init(&debug_lk);
  1046ef:	8d 83 ac 69 04 00    	lea    0x469ac(%ebx),%eax
  1046f5:	50                   	push   %eax
  1046f6:	e8 85 1a 00 00       	call   106180 <reentrantlock_init>
}
  1046fb:	83 c4 18             	add    $0x18,%esp
  1046fe:	5b                   	pop    %ebx
  1046ff:	c3                   	ret

00104700 <debug_lock>:

void debug_lock(void)
{
  104700:	53                   	push   %ebx
  104701:	e8 9c bc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  104706:	81 c3 ee f8 00 00    	add    $0xf8ee,%ebx
  10470c:	83 ec 14             	sub    $0x14,%esp
    reentrantlock_acquire(&debug_lk);
  10470f:	8d 83 ac 69 04 00    	lea    0x469ac(%ebx),%eax
  104715:	50                   	push   %eax
  104716:	e8 95 1a 00 00       	call   1061b0 <reentrantlock_acquire>
}
  10471b:	83 c4 18             	add    $0x18,%esp
  10471e:	5b                   	pop    %ebx
  10471f:	c3                   	ret

00104720 <debug_unlock>:

void debug_unlock(void)
{
  104720:	53                   	push   %ebx
  104721:	e8 7c bc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  104726:	81 c3 ce f8 00 00    	add    $0xf8ce,%ebx
  10472c:	83 ec 14             	sub    $0x14,%esp
    reentrantlock_release(&debug_lk);
  10472f:	8d 83 ac 69 04 00    	lea    0x469ac(%ebx),%eax
  104735:	50                   	push   %eax
  104736:	e8 25 1b 00 00       	call   106260 <reentrantlock_release>
}
  10473b:	83 c4 18             	add    $0x18,%esp
  10473e:	5b                   	pop    %ebx
  10473f:	c3                   	ret

00104740 <debug_info>:

extern int vdprintf(const char *fmt, va_list ap);

void debug_info(const char *fmt, ...)
{
  104740:	56                   	push   %esi
  104741:	53                   	push   %ebx
  104742:	e8 5b bc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  104747:	81 c3 ad f8 00 00    	add    $0xf8ad,%ebx
  10474d:	83 ec 10             	sub    $0x10,%esp
    reentrantlock_acquire(&debug_lk);
  104750:	8d b3 ac 69 04 00    	lea    0x469ac(%ebx),%esi
  104756:	56                   	push   %esi
  104757:	e8 54 1a 00 00       	call   1061b0 <reentrantlock_acquire>
#ifdef DEBUG_MSG
    debug_lock();
    va_list ap;
    va_start(ap, fmt);
  10475c:	8d 44 24 24          	lea    0x24(%esp),%eax
    vdprintf(fmt, ap);
  104760:	5a                   	pop    %edx
  104761:	59                   	pop    %ecx
  104762:	50                   	push   %eax
  104763:	ff 74 24 1c          	push   0x1c(%esp)
  104767:	e8 54 02 00 00       	call   1049c0 <vdprintf>
    reentrantlock_release(&debug_lk);
  10476c:	89 34 24             	mov    %esi,(%esp)
  10476f:	e8 ec 1a 00 00       	call   106260 <reentrantlock_release>
    va_end(ap);
    debug_unlock();
#endif
}
  104774:	83 c4 14             	add    $0x14,%esp
  104777:	5b                   	pop    %ebx
  104778:	5e                   	pop    %esi
  104779:	c3                   	ret
  10477a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104780 <debug_normal>:

#ifdef DEBUG_MSG

void debug_normal(const char *file, int line, const char *fmt, ...)
{
  104780:	56                   	push   %esi
  104781:	53                   	push   %ebx
  104782:	e8 1b bc ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  104787:	81 c3 6d f8 00 00    	add    $0xf86d,%ebx
  10478d:	83 ec 10             	sub    $0x10,%esp
    reentrantlock_acquire(&debug_lk);
  104790:	8d b3 ac 69 04 00    	lea    0x469ac(%ebx),%esi
  104796:	56                   	push   %esi
  104797:	e8 14 1a 00 00       	call   1061b0 <reentrantlock_acquire>
    debug_lock();
    dprintf("[D] %s:%d: ", file, line);
  10479c:	83 c4 0c             	add    $0xc,%esp
  10479f:	8d 83 f9 73 ff ff    	lea    -0x8c07(%ebx),%eax
  1047a5:	ff 74 24 18          	push   0x18(%esp)
  1047a9:	ff 74 24 18          	push   0x18(%esp)
  1047ad:	50                   	push   %eax
  1047ae:	e8 9d 02 00 00       	call   104a50 <dprintf>

    va_list ap;
    va_start(ap, fmt);
  1047b3:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    vdprintf(fmt, ap);
  1047b7:	5a                   	pop    %edx
  1047b8:	59                   	pop    %ecx
  1047b9:	50                   	push   %eax
  1047ba:	ff 74 24 24          	push   0x24(%esp)
  1047be:	e8 fd 01 00 00       	call   1049c0 <vdprintf>
    reentrantlock_release(&debug_lk);
  1047c3:	89 34 24             	mov    %esi,(%esp)
  1047c6:	e8 95 1a 00 00       	call   106260 <reentrantlock_release>
    va_end(ap);
    debug_unlock();
}
  1047cb:	83 c4 14             	add    $0x14,%esp
  1047ce:	5b                   	pop    %ebx
  1047cf:	5e                   	pop    %esi
  1047d0:	c3                   	ret
  1047d1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1047d8:	00 
  1047d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001047e0 <debug_panic>:
    for (; i < DEBUG_TRACEFRAMES; i++)
        eips[i] = 0;
}

gcc_noinline void debug_panic(const char *file, int line, const char *fmt, ...)
{
  1047e0:	55                   	push   %ebp
  1047e1:	57                   	push   %edi
  1047e2:	56                   	push   %esi
  1047e3:	53                   	push   %ebx
  1047e4:	e8 b9 bb ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1047e9:	81 c3 0b f8 00 00    	add    $0xf80b,%ebx
  1047ef:	83 ec 58             	sub    $0x58,%esp
    reentrantlock_acquire(&debug_lk);
  1047f2:	8d 83 ac 69 04 00    	lea    0x469ac(%ebx),%eax
  1047f8:	89 44 24 18          	mov    %eax,0x18(%esp)
  1047fc:	50                   	push   %eax
  1047fd:	e8 ae 19 00 00       	call   1061b0 <reentrantlock_acquire>
    int i;
    uintptr_t eips[DEBUG_TRACEFRAMES];
    va_list ap;

    debug_lock();
    dprintf("[P] %s:%d: ", file, line);
  104802:	83 c4 0c             	add    $0xc,%esp
  104805:	8d 83 05 74 ff ff    	lea    -0x8bfb(%ebx),%eax
  10480b:	ff 74 24 68          	push   0x68(%esp)
  10480f:	ff 74 24 68          	push   0x68(%esp)
  104813:	50                   	push   %eax
  104814:	e8 37 02 00 00       	call   104a50 <dprintf>

    va_start(ap, fmt);
  104819:	8d 44 24 7c          	lea    0x7c(%esp),%eax
    vdprintf(fmt, ap);
  10481d:	5a                   	pop    %edx
  10481e:	59                   	pop    %ecx
  10481f:	50                   	push   %eax
  104820:	ff 74 24 74          	push   0x74(%esp)
  104824:	e8 97 01 00 00       	call   1049c0 <vdprintf>
    va_end(ap);

    debug_trace(read_ebp(), eips);
  104829:	e8 92 0b 00 00       	call   1053c0 <read_ebp>
    for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  10482e:	83 c4 10             	add    $0x10,%esp
  104831:	31 c9                	xor    %ecx,%ecx
  104833:	8d 54 24 18          	lea    0x18(%esp),%edx
  104837:	85 c0                	test   %eax,%eax
  104839:	74 1e                	je     104859 <debug_panic+0x79>
  10483b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        eips[i] = frame[1];              /* saved %eip */
  104840:	8b 70 04             	mov    0x4(%eax),%esi
        frame = (uintptr_t *) frame[0];  /* saved %ebp */
  104843:	8b 00                	mov    (%eax),%eax
        eips[i] = frame[1];              /* saved %eip */
  104845:	89 34 8a             	mov    %esi,(%edx,%ecx,4)
    for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  104848:	83 c1 01             	add    $0x1,%ecx
  10484b:	83 f9 09             	cmp    $0x9,%ecx
  10484e:	7f 04                	jg     104854 <debug_panic+0x74>
  104850:	85 c0                	test   %eax,%eax
  104852:	75 ec                	jne    104840 <debug_panic+0x60>
    for (; i < DEBUG_TRACEFRAMES; i++)
  104854:	83 f9 0a             	cmp    $0xa,%ecx
  104857:	74 3b                	je     104894 <debug_panic+0xb4>
  104859:	8d 04 8a             	lea    (%edx,%ecx,4),%eax
  10485c:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  104860:	89 ce                	mov    %ecx,%esi
  104862:	29 c6                	sub    %eax,%esi
  104864:	83 e6 04             	and    $0x4,%esi
  104867:	74 17                	je     104880 <debug_panic+0xa0>
        eips[i] = 0;
  104869:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    for (; i < DEBUG_TRACEFRAMES; i++)
  10486f:	8d 7c 24 40          	lea    0x40(%esp),%edi
  104873:	83 c0 04             	add    $0x4,%eax
  104876:	39 f8                	cmp    %edi,%eax
  104878:	74 1a                	je     104894 <debug_panic+0xb4>
  10487a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        eips[i] = 0;
  104880:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    for (; i < DEBUG_TRACEFRAMES; i++)
  104886:	83 c0 08             	add    $0x8,%eax
        eips[i] = 0;
  104889:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
    for (; i < DEBUG_TRACEFRAMES; i++)
  104890:	39 c8                	cmp    %ecx,%eax
  104892:	75 ec                	jne    104880 <debug_panic+0xa0>
    for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  104894:	89 d5                	mov    %edx,%ebp
  104896:	8d 7c 24 40          	lea    0x40(%esp),%edi
        dprintf("\tfrom 0x%08x\n", eips[i]);
  10489a:	8d b3 11 74 ff ff    	lea    -0x8bef(%ebx),%esi
    for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1048a0:	8b 45 00             	mov    0x0(%ebp),%eax
  1048a3:	85 c0                	test   %eax,%eax
  1048a5:	74 14                	je     1048bb <debug_panic+0xdb>
        dprintf("\tfrom 0x%08x\n", eips[i]);
  1048a7:	83 ec 08             	sub    $0x8,%esp
    for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1048aa:	83 c5 04             	add    $0x4,%ebp
        dprintf("\tfrom 0x%08x\n", eips[i]);
  1048ad:	50                   	push   %eax
  1048ae:	56                   	push   %esi
  1048af:	e8 9c 01 00 00       	call   104a50 <dprintf>
    for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1048b4:	83 c4 10             	add    $0x10,%esp
  1048b7:	39 ef                	cmp    %ebp,%edi
  1048b9:	75 e5                	jne    1048a0 <debug_panic+0xc0>

    dprintf("Kernel Panic !!!\n");
  1048bb:	83 ec 0c             	sub    $0xc,%esp
  1048be:	8d 83 1f 74 ff ff    	lea    -0x8be1(%ebx),%eax
  1048c4:	50                   	push   %eax
  1048c5:	e8 86 01 00 00       	call   104a50 <dprintf>
    reentrantlock_release(&debug_lk);
  1048ca:	58                   	pop    %eax
  1048cb:	ff 74 24 18          	push   0x18(%esp)
  1048cf:	e8 8c 19 00 00       	call   106260 <reentrantlock_release>

    debug_unlock();
    halt();
  1048d4:	e8 47 0b 00 00       	call   105420 <halt>
}
  1048d9:	83 c4 5c             	add    $0x5c,%esp
  1048dc:	5b                   	pop    %ebx
  1048dd:	5e                   	pop    %esi
  1048de:	5f                   	pop    %edi
  1048df:	5d                   	pop    %ebp
  1048e0:	c3                   	ret
  1048e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1048e8:	00 
  1048e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001048f0 <debug_warn>:

void debug_warn(const char *file, int line, const char *fmt, ...)
{
  1048f0:	56                   	push   %esi
  1048f1:	53                   	push   %ebx
  1048f2:	e8 ab ba ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1048f7:	81 c3 fd f6 00 00    	add    $0xf6fd,%ebx
  1048fd:	83 ec 10             	sub    $0x10,%esp
    reentrantlock_acquire(&debug_lk);
  104900:	8d b3 ac 69 04 00    	lea    0x469ac(%ebx),%esi
  104906:	56                   	push   %esi
  104907:	e8 a4 18 00 00       	call   1061b0 <reentrantlock_acquire>
    debug_lock();
    dprintf("[W] %s:%d: ", file, line);
  10490c:	83 c4 0c             	add    $0xc,%esp
  10490f:	8d 83 31 74 ff ff    	lea    -0x8bcf(%ebx),%eax
  104915:	ff 74 24 18          	push   0x18(%esp)
  104919:	ff 74 24 18          	push   0x18(%esp)
  10491d:	50                   	push   %eax
  10491e:	e8 2d 01 00 00       	call   104a50 <dprintf>

    va_list ap;
    va_start(ap, fmt);
  104923:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    vdprintf(fmt, ap);
  104927:	5a                   	pop    %edx
  104928:	59                   	pop    %ecx
  104929:	50                   	push   %eax
  10492a:	ff 74 24 24          	push   0x24(%esp)
  10492e:	e8 8d 00 00 00       	call   1049c0 <vdprintf>
    reentrantlock_release(&debug_lk);
  104933:	89 34 24             	mov    %esi,(%esp)
  104936:	e8 25 19 00 00       	call   106260 <reentrantlock_release>
    va_end(ap);
    debug_unlock();
}
  10493b:	83 c4 14             	add    $0x14,%esp
  10493e:	5b                   	pop    %ebx
  10493f:	5e                   	pop    %esi
  104940:	c3                   	ret
  104941:	66 90                	xchg   %ax,%ax
  104943:	66 90                	xchg   %ax,%ax
  104945:	66 90                	xchg   %ax,%ax
  104947:	66 90                	xchg   %ax,%ax
  104949:	66 90                	xchg   %ax,%ax
  10494b:	66 90                	xchg   %ax,%ax
  10494d:	66 90                	xchg   %ax,%ax
  10494f:	90                   	nop

00104950 <putch>:
        str += 1;
    }
}

static void putch(int ch, struct dprintbuf *b)
{
  104950:	57                   	push   %edi
  104951:	56                   	push   %esi
  104952:	53                   	push   %ebx
  104953:	8b 74 24 14          	mov    0x14(%esp),%esi
  104957:	e8 46 ba ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10495c:	81 c3 98 f6 00 00    	add    $0xf698,%ebx
    b->buf[b->idx++] = ch;
  104962:	8b 54 24 10          	mov    0x10(%esp),%edx
  104966:	8b 0e                	mov    (%esi),%ecx
  104968:	8d 41 01             	lea    0x1(%ecx),%eax
  10496b:	89 06                	mov    %eax,(%esi)
  10496d:	88 54 0e 08          	mov    %dl,0x8(%esi,%ecx,1)
    if (b->idx == CONSOLE_BUFFER_SIZE - 1) {
  104971:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  104976:	74 08                	je     104980 <putch+0x30>
        b->buf[b->idx] = 0;
        cputs(b->buf);
        b->idx = 0;
    }
    b->cnt++;
  104978:	83 46 04 01          	addl   $0x1,0x4(%esi)
}
  10497c:	5b                   	pop    %ebx
  10497d:	5e                   	pop    %esi
  10497e:	5f                   	pop    %edi
  10497f:	c3                   	ret
    while (*str) {
  104980:	0f be 46 08          	movsbl 0x8(%esi),%eax
        b->buf[b->idx] = 0;
  104984:	c6 86 07 02 00 00 00 	movb   $0x0,0x207(%esi)
        cputs(b->buf);
  10498b:	8d 7e 08             	lea    0x8(%esi),%edi
    while (*str) {
  10498e:	84 c0                	test   %al,%al
  104990:	74 1c                	je     1049ae <putch+0x5e>
  104992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        cons_putc(*str);
  104998:	83 ec 0c             	sub    $0xc,%esp
        str += 1;
  10499b:	83 c7 01             	add    $0x1,%edi
        cons_putc(*str);
  10499e:	50                   	push   %eax
  10499f:	e8 6c bb ff ff       	call   100510 <cons_putc>
    while (*str) {
  1049a4:	0f be 07             	movsbl (%edi),%eax
  1049a7:	83 c4 10             	add    $0x10,%esp
  1049aa:	84 c0                	test   %al,%al
  1049ac:	75 ea                	jne    104998 <putch+0x48>
    b->cnt++;
  1049ae:	83 46 04 01          	addl   $0x1,0x4(%esi)
        b->idx = 0;
  1049b2:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
}
  1049b8:	5b                   	pop    %ebx
  1049b9:	5e                   	pop    %esi
  1049ba:	5f                   	pop    %edi
  1049bb:	c3                   	ret
  1049bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001049c0 <vdprintf>:

int vdprintf(const char *fmt, va_list ap)
{
  1049c0:	56                   	push   %esi
  1049c1:	53                   	push   %ebx
  1049c2:	e8 db b9 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1049c7:	81 c3 2d f6 00 00    	add    $0xf62d,%ebx
  1049cd:	81 ec 14 02 00 00    	sub    $0x214,%esp
    struct dprintbuf b;

    debug_lock();
  1049d3:	e8 28 fd ff ff       	call   104700 <debug_lock>
    b.idx = 0;
  1049d8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1049df:	00 
    b.cnt = 0;
  1049e0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1049e7:	00 
    vprintfmt((void *) putch, &b, fmt, ap);
  1049e8:	ff b4 24 24 02 00 00 	push   0x224(%esp)
  1049ef:	ff b4 24 24 02 00 00 	push   0x224(%esp)
  1049f6:	8d 44 24 10          	lea    0x10(%esp),%eax
  1049fa:	50                   	push   %eax
  1049fb:	8d 83 5c 09 ff ff    	lea    -0xf6a4(%ebx),%eax
  104a01:	50                   	push   %eax
  104a02:	e8 49 01 00 00       	call   104b50 <vprintfmt>

    b.buf[b.idx] = 0;
  104a07:	8b 44 24 18          	mov    0x18(%esp),%eax
  104a0b:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
    while (*str) {
  104a10:	0f be 44 24 20       	movsbl 0x20(%esp),%eax
  104a15:	83 c4 10             	add    $0x10,%esp
  104a18:	84 c0                	test   %al,%al
  104a1a:	74 1a                	je     104a36 <vdprintf+0x76>
  104a1c:	8d 74 24 10          	lea    0x10(%esp),%esi
        cons_putc(*str);
  104a20:	83 ec 0c             	sub    $0xc,%esp
        str += 1;
  104a23:	83 c6 01             	add    $0x1,%esi
        cons_putc(*str);
  104a26:	50                   	push   %eax
  104a27:	e8 e4 ba ff ff       	call   100510 <cons_putc>
    while (*str) {
  104a2c:	0f be 06             	movsbl (%esi),%eax
  104a2f:	83 c4 10             	add    $0x10,%esp
  104a32:	84 c0                	test   %al,%al
  104a34:	75 ea                	jne    104a20 <vdprintf+0x60>
    cputs(b.buf);
    debug_unlock();
  104a36:	e8 e5 fc ff ff       	call   104720 <debug_unlock>

    return b.cnt;
}
  104a3b:	8b 44 24 0c          	mov    0xc(%esp),%eax
  104a3f:	81 c4 14 02 00 00    	add    $0x214,%esp
  104a45:	5b                   	pop    %ebx
  104a46:	5e                   	pop    %esi
  104a47:	c3                   	ret
  104a48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104a4f:	00 

00104a50 <dprintf>:

int dprintf(const char *fmt, ...)
{
  104a50:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
  104a53:	8d 44 24 14          	lea    0x14(%esp),%eax
    cnt = vdprintf(fmt, ap);
  104a57:	83 ec 08             	sub    $0x8,%esp
  104a5a:	50                   	push   %eax
  104a5b:	ff 74 24 1c          	push   0x1c(%esp)
  104a5f:	e8 5c ff ff ff       	call   1049c0 <vdprintf>
    va_end(ap);

    return cnt;
}
  104a64:	83 c4 1c             	add    $0x1c,%esp
  104a67:	c3                   	ret
  104a68:	66 90                	xchg   %ax,%ax
  104a6a:	66 90                	xchg   %ax,%ax
  104a6c:	66 90                	xchg   %ax,%ax
  104a6e:	66 90                	xchg   %ax,%ax

00104a70 <printnum>:
 */
static void printnum(putch_t putch, void *putdat, unsigned long long num,
                     unsigned base, int width, int padc)
{
    /* first recursively print all preceding (more significant) digits */
    if (num >= base) {
  104a70:	e8 6e e3 ff ff       	call   102de3 <__x86.get_pc_thunk.cx>
  104a75:	81 c1 7f f5 00 00    	add    $0xf57f,%ecx
{
  104a7b:	55                   	push   %ebp
  104a7c:	57                   	push   %edi
  104a7d:	89 d7                	mov    %edx,%edi
  104a7f:	56                   	push   %esi
  104a80:	89 c6                	mov    %eax,%esi
  104a82:	53                   	push   %ebx
  104a83:	83 ec 2c             	sub    $0x2c,%esp
  104a86:	8b 44 24 40          	mov    0x40(%esp),%eax
  104a8a:	8b 54 24 44          	mov    0x44(%esp),%edx
  104a8e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    if (num >= base) {
  104a92:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  104a99:	00 
{
  104a9a:	8b 6c 24 50          	mov    0x50(%esp),%ebp
  104a9e:	89 44 24 08          	mov    %eax,0x8(%esp)
  104aa2:	8b 44 24 48          	mov    0x48(%esp),%eax
  104aa6:	89 54 24 0c          	mov    %edx,0xc(%esp)
  104aaa:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    if (num >= base) {
  104aae:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  104ab2:	39 44 24 08          	cmp    %eax,0x8(%esp)
  104ab6:	89 44 24 10          	mov    %eax,0x10(%esp)
  104aba:	1b 4c 24 14          	sbb    0x14(%esp),%ecx
        printnum(putch, putdat, num / base, base, width - 1, padc);
    } else {
        /* print any needed pad characters before first digit */
        while (--width > 0)
  104abe:	8d 5a ff             	lea    -0x1(%edx),%ebx
    if (num >= base) {
  104ac1:	73 55                	jae    104b18 <printnum+0xa8>
        while (--width > 0)
  104ac3:	83 fa 01             	cmp    $0x1,%edx
  104ac6:	7e 17                	jle    104adf <printnum+0x6f>
  104ac8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104acf:	00 
            putch(padc, putdat);
  104ad0:	83 ec 08             	sub    $0x8,%esp
  104ad3:	57                   	push   %edi
  104ad4:	55                   	push   %ebp
  104ad5:	ff d6                	call   *%esi
        while (--width > 0)
  104ad7:	83 c4 10             	add    $0x10,%esp
  104ada:	83 eb 01             	sub    $0x1,%ebx
  104add:	75 f1                	jne    104ad0 <printnum+0x60>
    }

    // then print this (the least significant) digit
    putch("0123456789abcdef"[num % base], putdat);
  104adf:	89 7c 24 44          	mov    %edi,0x44(%esp)
  104ae3:	ff 74 24 14          	push   0x14(%esp)
  104ae7:	ff 74 24 14          	push   0x14(%esp)
  104aeb:	ff 74 24 14          	push   0x14(%esp)
  104aef:	ff 74 24 14          	push   0x14(%esp)
  104af3:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
  104af7:	e8 34 55 00 00       	call   10a030 <__umoddi3>
  104afc:	0f be 84 03 3d 74 ff 	movsbl -0x8bc3(%ebx,%eax,1),%eax
  104b03:	ff 
  104b04:	89 44 24 50          	mov    %eax,0x50(%esp)
}
  104b08:	83 c4 3c             	add    $0x3c,%esp
    putch("0123456789abcdef"[num % base], putdat);
  104b0b:	89 f0                	mov    %esi,%eax
}
  104b0d:	5b                   	pop    %ebx
  104b0e:	5e                   	pop    %esi
  104b0f:	5f                   	pop    %edi
  104b10:	5d                   	pop    %ebp
    putch("0123456789abcdef"[num % base], putdat);
  104b11:	ff e0                	jmp    *%eax
  104b13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printnum(putch, putdat, num / base, base, width - 1, padc);
  104b18:	83 ec 0c             	sub    $0xc,%esp
  104b1b:	55                   	push   %ebp
  104b1c:	53                   	push   %ebx
  104b1d:	50                   	push   %eax
  104b1e:	83 ec 08             	sub    $0x8,%esp
  104b21:	ff 74 24 34          	push   0x34(%esp)
  104b25:	ff 74 24 34          	push   0x34(%esp)
  104b29:	ff 74 24 34          	push   0x34(%esp)
  104b2d:	ff 74 24 34          	push   0x34(%esp)
  104b31:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
  104b35:	e8 c6 53 00 00       	call   109f00 <__udivdi3>
  104b3a:	83 c4 18             	add    $0x18,%esp
  104b3d:	52                   	push   %edx
  104b3e:	89 fa                	mov    %edi,%edx
  104b40:	50                   	push   %eax
  104b41:	89 f0                	mov    %esi,%eax
  104b43:	e8 28 ff ff ff       	call   104a70 <printnum>
  104b48:	83 c4 20             	add    $0x20,%esp
  104b4b:	eb 92                	jmp    104adf <printnum+0x6f>
  104b4d:	8d 76 00             	lea    0x0(%esi),%esi

00104b50 <vprintfmt>:
    else
        return va_arg(*ap, int);
}

void vprintfmt(putch_t putch, void *putdat, const char *fmt, va_list ap)
{
  104b50:	e8 45 b8 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  104b55:	05 9f f4 00 00       	add    $0xf49f,%eax
  104b5a:	55                   	push   %ebp
  104b5b:	57                   	push   %edi
  104b5c:	56                   	push   %esi
  104b5d:	53                   	push   %ebx
  104b5e:	83 ec 2c             	sub    $0x2c,%esp
  104b61:	8b 6c 24 40          	mov    0x40(%esp),%ebp
  104b65:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104b69:	89 44 24 0c          	mov    %eax,0xc(%esp)
    unsigned long long num;
    int base, lflag, width, precision, altflag;
    char padc;

    while (1) {
        while ((ch = *(unsigned char *) fmt++) != '%') {
  104b6d:	8b 44 24 48          	mov    0x48(%esp),%eax
  104b71:	8d 58 01             	lea    0x1(%eax),%ebx
  104b74:	0f b6 00             	movzbl (%eax),%eax
  104b77:	83 f8 25             	cmp    $0x25,%eax
  104b7a:	75 1a                	jne    104b96 <vprintfmt+0x46>
  104b7c:	eb 2a                	jmp    104ba8 <vprintfmt+0x58>
  104b7e:	66 90                	xchg   %ax,%ax
            if (ch == '\0')
                return;
            putch(ch, putdat);
  104b80:	83 ec 08             	sub    $0x8,%esp
        while ((ch = *(unsigned char *) fmt++) != '%') {
  104b83:	83 c3 01             	add    $0x1,%ebx
            putch(ch, putdat);
  104b86:	57                   	push   %edi
  104b87:	50                   	push   %eax
  104b88:	ff d5                	call   *%ebp
        while ((ch = *(unsigned char *) fmt++) != '%') {
  104b8a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  104b8e:	83 c4 10             	add    $0x10,%esp
  104b91:	83 f8 25             	cmp    $0x25,%eax
  104b94:	74 12                	je     104ba8 <vprintfmt+0x58>
            if (ch == '\0')
  104b96:	85 c0                	test   %eax,%eax
  104b98:	75 e6                	jne    104b80 <vprintfmt+0x30>
            for (fmt--; fmt[-1] != '%'; fmt--)
                /* do nothing */ ;
            break;
        }
    }
}
  104b9a:	83 c4 2c             	add    $0x2c,%esp
  104b9d:	5b                   	pop    %ebx
  104b9e:	5e                   	pop    %esi
  104b9f:	5f                   	pop    %edi
  104ba0:	5d                   	pop    %ebp
  104ba1:	c3                   	ret
  104ba2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        precision = -1;
  104ba8:	be ff ff ff ff       	mov    $0xffffffff,%esi
        padc = ' ';
  104bad:	c6 44 24 10 20       	movb   $0x20,0x10(%esp)
        width = -1;
  104bb2:	ba ff ff ff ff       	mov    $0xffffffff,%edx
        altflag = 0;
  104bb7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  104bbe:	00 
        lflag = 0;
  104bbf:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  104bc6:	00 
  104bc7:	89 74 24 14          	mov    %esi,0x14(%esp)
  104bcb:	89 7c 24 44          	mov    %edi,0x44(%esp)
        switch (ch = *(unsigned char *) fmt++) {
  104bcf:	0f b6 0b             	movzbl (%ebx),%ecx
  104bd2:	8d 43 01             	lea    0x1(%ebx),%eax
  104bd5:	89 44 24 48          	mov    %eax,0x48(%esp)
  104bd9:	8d 41 dd             	lea    -0x23(%ecx),%eax
  104bdc:	3c 55                	cmp    $0x55,%al
  104bde:	77 18                	ja     104bf8 <.L19>
  104be0:	8b 74 24 0c          	mov    0xc(%esp),%esi
  104be4:	0f b6 c0             	movzbl %al,%eax
  104be7:	8b bc 86 64 8c ff ff 	mov    -0x739c(%esi,%eax,4),%edi
  104bee:	01 f7                	add    %esi,%edi
  104bf0:	ff e7                	jmp    *%edi
  104bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104bf8 <.L19>:
            putch('%', putdat);
  104bf8:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104bfc:	83 ec 08             	sub    $0x8,%esp
  104bff:	57                   	push   %edi
  104c00:	6a 25                	push   $0x25
  104c02:	ff d5                	call   *%ebp
            for (fmt--; fmt[-1] != '%'; fmt--)
  104c04:	83 c4 10             	add    $0x10,%esp
  104c07:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
  104c0b:	89 5c 24 48          	mov    %ebx,0x48(%esp)
  104c0f:	0f 84 58 ff ff ff    	je     104b6d <vprintfmt+0x1d>
  104c15:	89 d8                	mov    %ebx,%eax
  104c17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  104c1e:	00 
  104c1f:	90                   	nop
  104c20:	83 e8 01             	sub    $0x1,%eax
  104c23:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  104c27:	75 f7                	jne    104c20 <.L19+0x28>
  104c29:	89 44 24 48          	mov    %eax,0x48(%esp)
  104c2d:	e9 3b ff ff ff       	jmp    104b6d <vprintfmt+0x1d>
  104c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104c38 <.L28>:
                ch = *fmt;
  104c38:	0f be 43 01          	movsbl 0x1(%ebx),%eax
                precision = precision * 10 + ch - '0';
  104c3c:	8d 71 d0             	lea    -0x30(%ecx),%esi
        switch (ch = *(unsigned char *) fmt++) {
  104c3f:	8b 5c 24 48          	mov    0x48(%esp),%ebx
                precision = precision * 10 + ch - '0';
  104c43:	89 74 24 14          	mov    %esi,0x14(%esp)
                if (ch < '0' || ch > '9')
  104c47:	8d 48 d0             	lea    -0x30(%eax),%ecx
  104c4a:	83 f9 09             	cmp    $0x9,%ecx
  104c4d:	77 26                	ja     104c75 <.L28+0x3d>
        switch (ch = *(unsigned char *) fmt++) {
  104c4f:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104c53:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                precision = precision * 10 + ch - '0';
  104c58:	8d 0c b6             	lea    (%esi,%esi,4),%ecx
            for (precision = 0;; ++fmt) {
  104c5b:	83 c3 01             	add    $0x1,%ebx
                precision = precision * 10 + ch - '0';
  104c5e:	8d 74 48 d0          	lea    -0x30(%eax,%ecx,2),%esi
                ch = *fmt;
  104c62:	0f be 03             	movsbl (%ebx),%eax
                if (ch < '0' || ch > '9')
  104c65:	8d 48 d0             	lea    -0x30(%eax),%ecx
  104c68:	83 f9 09             	cmp    $0x9,%ecx
  104c6b:	76 eb                	jbe    104c58 <.L28+0x20>
  104c6d:	89 74 24 14          	mov    %esi,0x14(%esp)
  104c71:	89 7c 24 44          	mov    %edi,0x44(%esp)
            if (width < 0)
  104c75:	85 d2                	test   %edx,%edx
  104c77:	0f 89 52 ff ff ff    	jns    104bcf <vprintfmt+0x7f>
                width = precision, precision = -1;
  104c7d:	8b 54 24 14          	mov    0x14(%esp),%edx
  104c81:	c7 44 24 14 ff ff ff 	movl   $0xffffffff,0x14(%esp)
  104c88:	ff 
  104c89:	e9 41 ff ff ff       	jmp    104bcf <vprintfmt+0x7f>

00104c8e <.L24>:
            putch('0', putdat);
  104c8e:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104c92:	89 54 24 08          	mov    %edx,0x8(%esp)
  104c96:	83 ec 08             	sub    $0x8,%esp
  104c99:	57                   	push   %edi
  104c9a:	6a 30                	push   $0x30
  104c9c:	ff d5                	call   *%ebp
            putch('x', putdat);
  104c9e:	5b                   	pop    %ebx
  104c9f:	5e                   	pop    %esi
  104ca0:	57                   	push   %edi
  104ca1:	6a 78                	push   $0x78
            num = (unsigned long long) (uintptr_t) va_arg(ap, void *);
  104ca3:	31 f6                	xor    %esi,%esi
            putch('x', putdat);
  104ca5:	ff d5                	call   *%ebp
            num = (unsigned long long) (uintptr_t) va_arg(ap, void *);
  104ca7:	8b 44 24 5c          	mov    0x5c(%esp),%eax
            goto number;
  104cab:	8b 54 24 18          	mov    0x18(%esp),%edx
  104caf:	b9 10 00 00 00       	mov    $0x10,%ecx
            num = (unsigned long long) (uintptr_t) va_arg(ap, void *);
  104cb4:	8b 18                	mov    (%eax),%ebx
            goto number;
  104cb6:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long) (uintptr_t) va_arg(ap, void *);
  104cb9:	83 c0 04             	add    $0x4,%eax
  104cbc:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            printnum(putch, putdat, num, base, width, padc);
  104cc0:	83 ec 0c             	sub    $0xc,%esp
  104cc3:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
  104cc8:	50                   	push   %eax
  104cc9:	89 e8                	mov    %ebp,%eax
  104ccb:	52                   	push   %edx
  104ccc:	89 fa                	mov    %edi,%edx
  104cce:	51                   	push   %ecx
  104ccf:	56                   	push   %esi
  104cd0:	53                   	push   %ebx
  104cd1:	e8 9a fd ff ff       	call   104a70 <printnum>
            break;
  104cd6:	83 c4 20             	add    $0x20,%esp
  104cd9:	e9 8f fe ff ff       	jmp    104b6d <vprintfmt+0x1d>

00104cde <.L32>:
            altflag = 1;
  104cde:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  104ce5:	00 
        switch (ch = *(unsigned char *) fmt++) {
  104ce6:	8b 5c 24 48          	mov    0x48(%esp),%ebx
            goto reswitch;
  104cea:	e9 e0 fe ff ff       	jmp    104bcf <vprintfmt+0x7f>

00104cef <.L31>:
            putch(ch, putdat);
  104cef:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104cf3:	83 ec 08             	sub    $0x8,%esp
  104cf6:	57                   	push   %edi
  104cf7:	6a 25                	push   $0x25
  104cf9:	ff d5                	call   *%ebp
            break;
  104cfb:	83 c4 10             	add    $0x10,%esp
  104cfe:	e9 6a fe ff ff       	jmp    104b6d <vprintfmt+0x1d>

00104d03 <.L30>:
            precision = va_arg(ap, int);
  104d03:	8b 44 24 4c          	mov    0x4c(%esp),%eax
        switch (ch = *(unsigned char *) fmt++) {
  104d07:	8b 5c 24 48          	mov    0x48(%esp),%ebx
            precision = va_arg(ap, int);
  104d0b:	8b 00                	mov    (%eax),%eax
  104d0d:	89 44 24 14          	mov    %eax,0x14(%esp)
  104d11:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  104d15:	83 c0 04             	add    $0x4,%eax
  104d18:	89 44 24 4c          	mov    %eax,0x4c(%esp)
            goto process_precision;
  104d1c:	e9 54 ff ff ff       	jmp    104c75 <.L28+0x3d>

00104d21 <.L29>:
            if (width < 0)
  104d21:	31 c0                	xor    %eax,%eax
  104d23:	85 d2                	test   %edx,%edx
        switch (ch = *(unsigned char *) fmt++) {
  104d25:	8b 5c 24 48          	mov    0x48(%esp),%ebx
            if (width < 0)
  104d29:	0f 48 d0             	cmovs  %eax,%edx
            goto reswitch;
  104d2c:	e9 9e fe ff ff       	jmp    104bcf <vprintfmt+0x7f>

00104d31 <.L23>:
            if ((p = va_arg(ap, char *)) == NULL)
  104d31:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  104d35:	8b 74 24 14          	mov    0x14(%esp),%esi
  104d39:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104d3d:	83 c0 04             	add    $0x4,%eax
            if (width > 0 && padc != '-')
  104d40:	85 d2                	test   %edx,%edx
            if ((p = va_arg(ap, char *)) == NULL)
  104d42:	89 44 24 14          	mov    %eax,0x14(%esp)
  104d46:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  104d4a:	8b 18                	mov    (%eax),%ebx
            if (width > 0 && padc != '-')
  104d4c:	0f 9f c0             	setg   %al
  104d4f:	80 7c 24 10 2d       	cmpb   $0x2d,0x10(%esp)
  104d54:	0f 95 c1             	setne  %cl
            if ((p = va_arg(ap, char *)) == NULL)
  104d57:	89 5c 24 18          	mov    %ebx,0x18(%esp)
            if (width > 0 && padc != '-')
  104d5b:	21 c8                	and    %ecx,%eax
            if ((p = va_arg(ap, char *)) == NULL)
  104d5d:	85 db                	test   %ebx,%ebx
  104d5f:	0f 84 c8 01 00 00    	je     104f2d <.L17+0xe>
            if (width > 0 && padc != '-')
  104d65:	84 c0                	test   %al,%al
  104d67:	0f 85 eb 01 00 00    	jne    104f58 <.L17+0x39>
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104d6d:	89 d8                	mov    %ebx,%eax
  104d6f:	8d 5b 01             	lea    0x1(%ebx),%ebx
  104d72:	0f be 08             	movsbl (%eax),%ecx
  104d75:	89 c8                	mov    %ecx,%eax
  104d77:	85 c9                	test   %ecx,%ecx
  104d79:	0f 84 19 01 00 00    	je     104e98 <.L25+0x14>
  104d7f:	89 7c 24 44          	mov    %edi,0x44(%esp)
  104d83:	89 f7                	mov    %esi,%edi
  104d85:	89 de                	mov    %ebx,%esi
  104d87:	89 d3                	mov    %edx,%ebx
  104d89:	eb 2f                	jmp    104dba <.L23+0x89>
  104d8b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
                if (altflag && (ch < ' ' || ch > '~'))
  104d90:	83 e8 20             	sub    $0x20,%eax
  104d93:	83 f8 5e             	cmp    $0x5e,%eax
  104d96:	76 37                	jbe    104dcf <.L23+0x9e>
                    putch('?', putdat);
  104d98:	83 ec 08             	sub    $0x8,%esp
  104d9b:	ff 74 24 4c          	push   0x4c(%esp)
  104d9f:	6a 3f                	push   $0x3f
  104da1:	ff d5                	call   *%ebp
  104da3:	83 c4 10             	add    $0x10,%esp
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104da6:	0f be 06             	movsbl (%esi),%eax
  104da9:	83 c6 01             	add    $0x1,%esi
                 width--)
  104dac:	83 eb 01             	sub    $0x1,%ebx
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104daf:	0f be c8             	movsbl %al,%ecx
  104db2:	85 c9                	test   %ecx,%ecx
  104db4:	0f 84 d8 00 00 00    	je     104e92 <.L25+0xe>
  104dba:	85 ff                	test   %edi,%edi
  104dbc:	78 09                	js     104dc7 <.L23+0x96>
  104dbe:	83 ef 01             	sub    $0x1,%edi
  104dc1:	0f 82 cb 00 00 00    	jb     104e92 <.L25+0xe>
                if (altflag && (ch < ' ' || ch > '~'))
  104dc7:	8b 54 24 08          	mov    0x8(%esp),%edx
  104dcb:	85 d2                	test   %edx,%edx
  104dcd:	75 c1                	jne    104d90 <.L23+0x5f>
                    putch(ch, putdat);
  104dcf:	83 ec 08             	sub    $0x8,%esp
  104dd2:	ff 74 24 4c          	push   0x4c(%esp)
  104dd6:	51                   	push   %ecx
  104dd7:	ff d5                	call   *%ebp
  104dd9:	83 c4 10             	add    $0x10,%esp
  104ddc:	eb c8                	jmp    104da6 <.L23+0x75>

00104dde <.L22>:
    if (lflag >= 2)
  104dde:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
  104de3:	8b 7c 24 44          	mov    0x44(%esp),%edi
        return va_arg(*ap, unsigned long long);
  104de7:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
  104deb:	0f 8f cc 00 00 00    	jg     104ebd <.L25+0x39>
        return va_arg(*ap, unsigned long);
  104df1:	8b 74 24 4c          	mov    0x4c(%esp),%esi
            precision = va_arg(ap, int);
  104df5:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
  104df8:	b9 0a 00 00 00       	mov    $0xa,%ecx
  104dfd:	8b 1e                	mov    (%esi),%ebx
  104dff:	89 44 24 4c          	mov    %eax,0x4c(%esp)
  104e03:	31 f6                	xor    %esi,%esi
  104e05:	e9 b6 fe ff ff       	jmp    104cc0 <.L24+0x32>

00104e0a <.L20>:
    if (lflag >= 2)
  104e0a:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
  104e0f:	8b 7c 24 44          	mov    0x44(%esp),%edi
        return va_arg(*ap, unsigned long long);
  104e13:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
  104e17:	0f 8f ae 00 00 00    	jg     104ecb <.L25+0x47>
        return va_arg(*ap, unsigned long);
  104e1d:	8b 74 24 4c          	mov    0x4c(%esp),%esi
            precision = va_arg(ap, int);
  104e21:	83 c0 04             	add    $0x4,%eax
        return va_arg(*ap, unsigned long);
  104e24:	b9 10 00 00 00       	mov    $0x10,%ecx
  104e29:	8b 1e                	mov    (%esi),%ebx
  104e2b:	89 44 24 4c          	mov    %eax,0x4c(%esp)
  104e2f:	31 f6                	xor    %esi,%esi
  104e31:	e9 8a fe ff ff       	jmp    104cc0 <.L24+0x32>

00104e36 <.L27>:
            putch(va_arg(ap, int), putdat);
  104e36:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  104e3a:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104e3e:	83 ec 08             	sub    $0x8,%esp
  104e41:	57                   	push   %edi
  104e42:	8d 58 04             	lea    0x4(%eax),%ebx
  104e45:	8b 44 24 58          	mov    0x58(%esp),%eax
  104e49:	ff 30                	push   (%eax)
  104e4b:	ff d5                	call   *%ebp
            break;
  104e4d:	83 c4 10             	add    $0x10,%esp
            putch(va_arg(ap, int), putdat);
  104e50:	89 5c 24 4c          	mov    %ebx,0x4c(%esp)
            break;
  104e54:	e9 14 fd ff ff       	jmp    104b6d <vprintfmt+0x1d>

00104e59 <.L26>:
        return va_arg(*ap, long long);
  104e59:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (lflag >= 2)
  104e5d:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
  104e62:	8b 7c 24 44          	mov    0x44(%esp),%edi
        return va_arg(*ap, long long);
  104e66:	8b 18                	mov    (%eax),%ebx
    if (lflag >= 2)
  104e68:	7f 77                	jg     104ee1 <.L25+0x5d>
        return va_arg(*ap, long);
  104e6a:	83 c0 04             	add    $0x4,%eax
  104e6d:	89 de                	mov    %ebx,%esi
  104e6f:	89 44 24 4c          	mov    %eax,0x4c(%esp)
  104e73:	c1 fe 1f             	sar    $0x1f,%esi
            if ((long long) num < 0) {
  104e76:	85 f6                	test   %esi,%esi
  104e78:	78 73                	js     104eed <.L25+0x69>
        return va_arg(*ap, unsigned long long);
  104e7a:	b9 0a 00 00 00       	mov    $0xa,%ecx
  104e7f:	e9 3c fe ff ff       	jmp    104cc0 <.L24+0x32>

00104e84 <.L25>:
            lflag++;
  104e84:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
        switch (ch = *(unsigned char *) fmt++) {
  104e89:	8b 5c 24 48          	mov    0x48(%esp),%ebx
            goto reswitch;
  104e8d:	e9 3d fd ff ff       	jmp    104bcf <vprintfmt+0x7f>
  104e92:	8b 7c 24 44          	mov    0x44(%esp),%edi
  104e96:	89 da                	mov    %ebx,%edx
            for (; width > 0; width--)
  104e98:	85 d2                	test   %edx,%edx
  104e9a:	7e 14                	jle    104eb0 <.L25+0x2c>
  104e9c:	89 d3                	mov    %edx,%ebx
  104e9e:	66 90                	xchg   %ax,%ax
                putch(' ', putdat);
  104ea0:	83 ec 08             	sub    $0x8,%esp
  104ea3:	57                   	push   %edi
  104ea4:	6a 20                	push   $0x20
  104ea6:	ff d5                	call   *%ebp
            for (; width > 0; width--)
  104ea8:	83 c4 10             	add    $0x10,%esp
  104eab:	83 eb 01             	sub    $0x1,%ebx
  104eae:	75 f0                	jne    104ea0 <.L25+0x1c>
            if ((p = va_arg(ap, char *)) == NULL)
  104eb0:	8b 44 24 14          	mov    0x14(%esp),%eax
  104eb4:	89 44 24 4c          	mov    %eax,0x4c(%esp)
  104eb8:	e9 b0 fc ff ff       	jmp    104b6d <vprintfmt+0x1d>
        return va_arg(*ap, unsigned long long);
  104ebd:	8b 18                	mov    (%eax),%ebx
  104ebf:	8b 70 04             	mov    0x4(%eax),%esi
  104ec2:	83 c0 08             	add    $0x8,%eax
  104ec5:	89 44 24 4c          	mov    %eax,0x4c(%esp)
  104ec9:	eb af                	jmp    104e7a <.L26+0x21>
  104ecb:	8b 18                	mov    (%eax),%ebx
  104ecd:	8b 70 04             	mov    0x4(%eax),%esi
  104ed0:	83 c0 08             	add    $0x8,%eax
  104ed3:	b9 10 00 00 00       	mov    $0x10,%ecx
  104ed8:	89 44 24 4c          	mov    %eax,0x4c(%esp)
  104edc:	e9 df fd ff ff       	jmp    104cc0 <.L24+0x32>
        return va_arg(*ap, long long);
  104ee1:	8b 70 04             	mov    0x4(%eax),%esi
  104ee4:	83 c0 08             	add    $0x8,%eax
  104ee7:	89 44 24 4c          	mov    %eax,0x4c(%esp)
  104eeb:	eb 89                	jmp    104e76 <.L26+0x1d>
  104eed:	89 54 24 08          	mov    %edx,0x8(%esp)
                putch('-', putdat);
  104ef1:	83 ec 08             	sub    $0x8,%esp
  104ef4:	57                   	push   %edi
  104ef5:	6a 2d                	push   $0x2d
  104ef7:	ff d5                	call   *%ebp
                num = -(long long) num;
  104ef9:	f7 db                	neg    %ebx
  104efb:	b9 0a 00 00 00       	mov    $0xa,%ecx
  104f00:	83 d6 00             	adc    $0x0,%esi
  104f03:	8b 54 24 18          	mov    0x18(%esp),%edx
  104f07:	83 c4 10             	add    $0x10,%esp
  104f0a:	f7 de                	neg    %esi
  104f0c:	e9 af fd ff ff       	jmp    104cc0 <.L24+0x32>

00104f11 <.L60>:
        switch (ch = *(unsigned char *) fmt++) {
  104f11:	c6 44 24 10 30       	movb   $0x30,0x10(%esp)
  104f16:	8b 5c 24 48          	mov    0x48(%esp),%ebx
  104f1a:	e9 b0 fc ff ff       	jmp    104bcf <vprintfmt+0x7f>

00104f1f <.L17>:
            padc = '-';
  104f1f:	c6 44 24 10 2d       	movb   $0x2d,0x10(%esp)
        switch (ch = *(unsigned char *) fmt++) {
  104f24:	8b 5c 24 48          	mov    0x48(%esp),%ebx
  104f28:	e9 a2 fc ff ff       	jmp    104bcf <vprintfmt+0x7f>
            if (width > 0 && padc != '-')
  104f2d:	84 c0                	test   %al,%al
  104f2f:	0f 85 83 00 00 00    	jne    104fb8 <.L17+0x99>
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104f35:	8b 44 24 0c          	mov    0xc(%esp),%eax
  104f39:	89 7c 24 44          	mov    %edi,0x44(%esp)
  104f3d:	b9 28 00 00 00       	mov    $0x28,%ecx
  104f42:	89 f7                	mov    %esi,%edi
  104f44:	8d 98 4f 74 ff ff    	lea    -0x8bb1(%eax),%ebx
  104f4a:	b8 28 00 00 00       	mov    $0x28,%eax
  104f4f:	89 de                	mov    %ebx,%esi
  104f51:	89 d3                	mov    %edx,%ebx
  104f53:	e9 62 fe ff ff       	jmp    104dba <.L23+0x89>
  104f58:	89 54 24 1c          	mov    %edx,0x1c(%esp)
                for (width -= strnlen(p, precision); width > 0; width--)
  104f5c:	83 ec 08             	sub    $0x8,%esp
  104f5f:	56                   	push   %esi
  104f60:	ff 74 24 24          	push   0x24(%esp)
  104f64:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  104f68:	e8 c3 f5 ff ff       	call   104530 <strnlen>
  104f6d:	8b 54 24 2c          	mov    0x2c(%esp),%edx
  104f71:	83 c4 10             	add    $0x10,%esp
  104f74:	29 c2                	sub    %eax,%edx
  104f76:	85 d2                	test   %edx,%edx
  104f78:	0f 8e 83 00 00 00    	jle    105001 <.L17+0xe2>
                    putch(padc, putdat);
  104f7e:	0f be 5c 24 10       	movsbl 0x10(%esp),%ebx
  104f83:	89 74 24 10          	mov    %esi,0x10(%esp)
  104f87:	89 d6                	mov    %edx,%esi
  104f89:	83 ec 08             	sub    $0x8,%esp
  104f8c:	57                   	push   %edi
  104f8d:	53                   	push   %ebx
  104f8e:	ff d5                	call   *%ebp
                for (width -= strnlen(p, precision); width > 0; width--)
  104f90:	83 c4 10             	add    $0x10,%esp
  104f93:	83 ee 01             	sub    $0x1,%esi
  104f96:	75 f1                	jne    104f89 <.L17+0x6a>
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104f98:	8b 44 24 18          	mov    0x18(%esp),%eax
  104f9c:	89 f2                	mov    %esi,%edx
  104f9e:	8b 74 24 10          	mov    0x10(%esp),%esi
  104fa2:	8d 58 01             	lea    0x1(%eax),%ebx
  104fa5:	0f be 00             	movsbl (%eax),%eax
  104fa8:	0f be c8             	movsbl %al,%ecx
  104fab:	85 c9                	test   %ecx,%ecx
  104fad:	0f 85 cc fd ff ff    	jne    104d7f <.L23+0x4e>
  104fb3:	e9 f8 fe ff ff       	jmp    104eb0 <.L25+0x2c>
  104fb8:	89 54 24 1c          	mov    %edx,0x1c(%esp)
                for (width -= strnlen(p, precision); width > 0; width--)
  104fbc:	83 ec 08             	sub    $0x8,%esp
  104fbf:	56                   	push   %esi
  104fc0:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  104fc4:	8d 8b 4e 74 ff ff    	lea    -0x8bb2(%ebx),%ecx
  104fca:	51                   	push   %ecx
  104fcb:	89 4c 24 28          	mov    %ecx,0x28(%esp)
  104fcf:	e8 5c f5 ff ff       	call   104530 <strnlen>
  104fd4:	8b 54 24 2c          	mov    0x2c(%esp),%edx
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104fd8:	b9 28 00 00 00       	mov    $0x28,%ecx
                for (width -= strnlen(p, precision); width > 0; width--)
  104fdd:	83 c4 10             	add    $0x10,%esp
  104fe0:	29 c2                	sub    %eax,%edx
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104fe2:	b8 28 00 00 00       	mov    $0x28,%eax
                for (width -= strnlen(p, precision); width > 0; width--)
  104fe7:	85 d2                	test   %edx,%edx
  104fe9:	7f 93                	jg     104f7e <.L17+0x5f>
                 (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  104feb:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  104fef:	89 7c 24 44          	mov    %edi,0x44(%esp)
  104ff3:	89 f7                	mov    %esi,%edi
  104ff5:	83 c3 01             	add    $0x1,%ebx
  104ff8:	89 de                	mov    %ebx,%esi
  104ffa:	89 d3                	mov    %edx,%ebx
  104ffc:	e9 b9 fd ff ff       	jmp    104dba <.L23+0x89>
  105001:	8b 44 24 18          	mov    0x18(%esp),%eax
  105005:	0f be 08             	movsbl (%eax),%ecx
  105008:	89 c8                	mov    %ecx,%eax
  10500a:	85 c9                	test   %ecx,%ecx
  10500c:	75 dd                	jne    104feb <.L17+0xcc>
  10500e:	e9 9d fe ff ff       	jmp    104eb0 <.L25+0x2c>
  105013:	66 90                	xchg   %ax,%ax
  105015:	66 90                	xchg   %ax,%ax
  105017:	66 90                	xchg   %ax,%ax
  105019:	66 90                	xchg   %ax,%ax
  10501b:	66 90                	xchg   %ax,%ax
  10501d:	66 90                	xchg   %ax,%ax
  10501f:	90                   	nop

00105020 <kstack_switch>:
#include "seg.h"

#define offsetof(type, member) __builtin_offsetof(type, member)

void kstack_switch(uint32_t pid)
{
  105020:	56                   	push   %esi
  105021:	53                   	push   %ebx
  105022:	e8 7b b3 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105027:	81 c3 cd ef 00 00    	add    $0xefcd,%ebx
  10502d:	83 ec 04             	sub    $0x4,%esp
    int cpu_idx = get_pcpu_idx();
  105030:	e8 0b 13 00 00       	call   106340 <get_pcpu_idx>
    struct kstack *ks = (struct kstack *) get_pcpu_kstack_pointer(cpu_idx);
  105035:	83 ec 0c             	sub    $0xc,%esp
  105038:	50                   	push   %eax
  105039:	e8 62 13 00 00       	call   1063a0 <get_pcpu_kstack_pointer>

    /*
     * Switch to the new TSS.
     */
    ks->tss.ts_esp0 = (uint32_t) proc_kstack[pid].kstack_hi;
  10503e:	8b 74 24 20          	mov    0x20(%esp),%esi
  105042:	c7 c1 00 b0 15 00    	mov    $0x15b000,%ecx
  105048:	8d 56 01             	lea    0x1(%esi),%edx
  10504b:	c1 e2 0c             	shl    $0xc,%edx
  10504e:	8d 34 0a             	lea    (%edx,%ecx,1),%esi
    ks->tss.ts_ss0 = CPU_GDT_KDATA;
    ks->gdt[CPU_GDT_TSS >> 3] =
        SEGDESC16(STS_T32A, (uint32_t) &proc_kstack[pid].tss, sizeof(tss_t) - 1, 0);
  105051:	8d 94 0a 30 f0 ff ff 	lea    -0xfd0(%edx,%ecx,1),%edx
    ks->gdt[CPU_GDT_TSS >> 3] =
  105058:	b9 eb 00 00 00       	mov    $0xeb,%ecx
    ks->tss.ts_esp0 = (uint32_t) proc_kstack[pid].kstack_hi;
  10505d:	89 70 34             	mov    %esi,0x34(%eax)
    ks->tss.ts_ss0 = CPU_GDT_KDATA;
  105060:	be 10 00 00 00       	mov    $0x10,%esi
    ks->gdt[CPU_GDT_TSS >> 3] =
  105065:	66 89 48 28          	mov    %cx,0x28(%eax)
        SEGDESC16(STS_T32A, (uint32_t) &proc_kstack[pid].tss, sizeof(tss_t) - 1, 0);
  105069:	89 d1                	mov    %edx,%ecx
    ks->tss.ts_ss0 = CPU_GDT_KDATA;
  10506b:	66 89 70 38          	mov    %si,0x38(%eax)
        SEGDESC16(STS_T32A, (uint32_t) &proc_kstack[pid].tss, sizeof(tss_t) - 1, 0);
  10506f:	c1 e9 10             	shr    $0x10,%ecx
    ks->gdt[CPU_GDT_TSS >> 3] =
  105072:	be 89 40 00 00       	mov    $0x4089,%esi
  105077:	66 89 50 2a          	mov    %dx,0x2a(%eax)
        SEGDESC16(STS_T32A, (uint32_t) &proc_kstack[pid].tss, sizeof(tss_t) - 1, 0);
  10507b:	c1 ea 18             	shr    $0x18,%edx
    ks->gdt[CPU_GDT_TSS >> 3] =
  10507e:	66 89 70 2d          	mov    %si,0x2d(%eax)
  105082:	88 48 2c             	mov    %cl,0x2c(%eax)
  105085:	88 50 2f             	mov    %dl,0x2f(%eax)
    ks->gdt[CPU_GDT_TSS >> 3].sd_s = 0;
    ltr(CPU_GDT_TSS);
  105088:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
  10508f:	e8 ec 04 00 00       	call   105580 <ltr>
}
  105094:	83 c4 14             	add    $0x14,%esp
  105097:	5b                   	pop    %ebx
  105098:	5e                   	pop    %esi
  105099:	c3                   	ret
  10509a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001050a0 <seg_init>:

void seg_init(int cpu_idx)
{
  1050a0:	55                   	push   %ebp
  1050a1:	57                   	push   %edi
  1050a2:	56                   	push   %esi
  1050a3:	53                   	push   %ebx
  1050a4:	e8 f9 b2 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1050a9:	81 c3 4b ef 00 00    	add    $0xef4b,%ebx
  1050af:	83 ec 1c             	sub    $0x1c,%esp
  1050b2:	8b 7c 24 30          	mov    0x30(%esp),%edi
    /* clear BSS */
    if (cpu_idx == 0) {
  1050b6:	85 ff                	test   %edi,%edi
  1050b8:	0f 84 0a 01 00 00    	je     1051c8 <seg_init+0x128>
  1050be:	c7 c6 00 b0 19 00    	mov    $0x19b000,%esi
        memzero(edata, ((uint8_t *) &bsp_kstack[0]) - edata);
        memzero(((uint8_t *) &bsp_kstack[0]) + 4096, end - ((uint8_t *) &bsp_kstack[0]) - 4096);
    }

    /* setup GDT */
    bsp_kstack[cpu_idx].gdt[0] = SEGDESC_NULL;
  1050c4:	89 fa                	mov    %edi,%edx
  1050c6:	8d 4f 01             	lea    0x1(%edi),%ecx
  1050c9:	c1 e2 0c             	shl    $0xc,%edx
  1050cc:	c1 e1 0c             	shl    $0xc,%ecx
  1050cf:	8d 04 16             	lea    (%esi,%edx,1),%eax
    /* 0x20: user data */
    bsp_kstack[cpu_idx].gdt[CPU_GDT_UDATA >> 3] =
        SEGDESC32(STA_W, 0x00000000, 0xffffffff, 3);

    /* setup TSS */
    bsp_kstack[cpu_idx].tss.ts_esp0 = (uint32_t) bsp_kstack[cpu_idx].kstack_hi;
  1050d2:	8d 2c 0e             	lea    (%esi,%ecx,1),%ebp
    bsp_kstack[cpu_idx].gdt[0] = SEGDESC_NULL;
  1050d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1050db:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    bsp_kstack[cpu_idx].gdt[CPU_GDT_KCODE >> 3] =
  1050e2:	c7 44 16 08 ff ff 00 	movl   $0xffff,0x8(%esi,%edx,1)
  1050e9:	00 
    bsp_kstack[cpu_idx].gdt[CPU_GDT_KDATA >> 3] =
  1050ea:	c7 44 16 10 ff ff 00 	movl   $0xffff,0x10(%esi,%edx,1)
  1050f1:	00 
    bsp_kstack[cpu_idx].gdt[CPU_GDT_UCODE >> 3] =
  1050f2:	c7 44 16 18 ff ff 00 	movl   $0xffff,0x18(%esi,%edx,1)
  1050f9:	00 
    bsp_kstack[cpu_idx].gdt[CPU_GDT_UDATA >> 3] =
  1050fa:	c7 44 16 20 ff ff 00 	movl   $0xffff,0x20(%esi,%edx,1)
  105101:	00 
    bsp_kstack[cpu_idx].gdt[CPU_GDT_KCODE >> 3] =
  105102:	c7 44 16 0c 00 9a cf 	movl   $0xcf9a00,0xc(%esi,%edx,1)
  105109:	00 
    bsp_kstack[cpu_idx].gdt[CPU_GDT_KDATA >> 3] =
  10510a:	c7 44 16 14 00 92 cf 	movl   $0xcf9200,0x14(%esi,%edx,1)
  105111:	00 
    bsp_kstack[cpu_idx].gdt[CPU_GDT_UCODE >> 3] =
  105112:	c7 44 16 1c 00 fa cf 	movl   $0xcffa00,0x1c(%esi,%edx,1)
  105119:	00 
    bsp_kstack[cpu_idx].tss.ts_esp0 = (uint32_t) bsp_kstack[cpu_idx].kstack_hi;
  10511a:	89 68 34             	mov    %ebp,0x34(%eax)
    bsp_kstack[cpu_idx].tss.ts_ss0 = CPU_GDT_KDATA;
  10511d:	bd 10 00 00 00       	mov    $0x10,%ebp
  105122:	66 89 68 38          	mov    %bp,0x38(%eax)
    bsp_kstack[cpu_idx].gdt[CPU_GDT_TSS >> 3] =
        SEGDESC16(STS_T32A, (uint32_t) &bsp_kstack[cpu_idx].tss, sizeof(tss_t) - 1, 0);
  105126:	8d ac 0e 30 f0 ff ff 	lea    -0xfd0(%esi,%ecx,1),%ebp
    bsp_kstack[cpu_idx].gdt[CPU_GDT_UDATA >> 3] =
  10512d:	c7 44 16 24 00 f2 cf 	movl   $0xcff200,0x24(%esi,%edx,1)
  105134:	00 
    bsp_kstack[cpu_idx].gdt[CPU_GDT_TSS >> 3] =
  105135:	ba eb 00 00 00       	mov    $0xeb,%edx
  10513a:	66 89 50 28          	mov    %dx,0x28(%eax)
        SEGDESC16(STS_T32A, (uint32_t) &bsp_kstack[cpu_idx].tss, sizeof(tss_t) - 1, 0);
  10513e:	89 ea                	mov    %ebp,%edx
  105140:	c1 ea 10             	shr    $0x10,%edx
    bsp_kstack[cpu_idx].gdt[CPU_GDT_TSS >> 3] =
  105143:	66 89 68 2a          	mov    %bp,0x2a(%eax)
  105147:	88 50 2c             	mov    %dl,0x2c(%eax)
        SEGDESC16(STS_T32A, (uint32_t) &bsp_kstack[cpu_idx].tss, sizeof(tss_t) - 1, 0);
  10514a:	89 ea                	mov    %ebp,%edx
    bsp_kstack[cpu_idx].gdt[CPU_GDT_TSS >> 3] =
  10514c:	bd 89 40 00 00       	mov    $0x4089,%ebp
        SEGDESC16(STS_T32A, (uint32_t) &bsp_kstack[cpu_idx].tss, sizeof(tss_t) - 1, 0);
  105151:	c1 ea 18             	shr    $0x18,%edx
    bsp_kstack[cpu_idx].gdt[CPU_GDT_TSS >> 3] =
  105154:	66 89 68 2d          	mov    %bp,0x2d(%eax)
  105158:	88 50 2f             	mov    %dl,0x2f(%eax)
    bsp_kstack[cpu_idx].gdt[CPU_GDT_TSS >> 3].sd_s = 0;

    /* other fields */
    /* Set the KSTACK_MAGIC value when we initialize the kstack */
    bsp_kstack[cpu_idx].magic = KSTACK_MAGIC;
  10515b:	c7 80 20 01 00 00 32 	movl   $0x98765432,0x120(%eax)
  105162:	54 76 98 

    pseudodesc_t gdt_desc = {
  105165:	b8 2f 00 00 00       	mov    $0x2f,%eax
  10516a:	66 89 44 24 0a       	mov    %ax,0xa(%esp)
        .pd_lim   = sizeof(bsp_kstack[cpu_idx].gdt) - 1,
        .pd_base  = (uint32_t) bsp_kstack[cpu_idx].gdt
  10516f:	8d 84 0e 00 f0 ff ff 	lea    -0x1000(%esi,%ecx,1),%eax
  105176:	89 44 24 0c          	mov    %eax,0xc(%esp)
    };
    asm volatile ("lgdt %0" :: "m" (gdt_desc));
  10517a:	0f 01 54 24 0a       	lgdtl  0xa(%esp)
    asm volatile ("movw %%ax,%%gs" :: "a" (CPU_GDT_KDATA));
  10517f:	b8 10 00 00 00       	mov    $0x10,%eax
  105184:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax,%%fs" :: "a" (CPU_GDT_KDATA));
  105186:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax,%%es" :: "a" (CPU_GDT_KDATA));
  105188:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax,%%ds" :: "a" (CPU_GDT_KDATA));
  10518a:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax,%%ss" :: "a" (CPU_GDT_KDATA));
  10518c:	8e d0                	mov    %eax,%ss
    /* reload %cs */
    asm volatile ("ljmp %0,$1f\n 1:\n" :: "i" (CPU_GDT_KCODE));
  10518e:	ea 95 51 10 00 08 00 	ljmp   $0x8,$0x105195

    /*
     * Load a null LDT.
     */
    lldt(0);
  105195:	83 ec 0c             	sub    $0xc,%esp
  105198:	6a 00                	push   $0x0
  10519a:	e8 31 02 00 00       	call   1053d0 <lldt>

    /*
     * Load the bootstrap TSS.
     */
    ltr(CPU_GDT_TSS);
  10519f:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
  1051a6:	e8 d5 03 00 00       	call   105580 <ltr>

    /*
     * Load IDT.
     */
    extern pseudodesc_t idt_pd;
    asm volatile ("lidt %0" :: "m" (idt_pd));
  1051ab:	c7 c0 00 43 11 00    	mov    $0x114300,%eax
  1051b1:	0f 01 18             	lidtl  (%eax)

    /*
     * Initialize all TSS structures for processes.
     */
    if (cpu_idx == 0) {
  1051b4:	83 c4 10             	add    $0x10,%esp
  1051b7:	85 ff                	test   %edi,%edi
  1051b9:	74 55                	je     105210 <seg_init+0x170>
        memzero(&bsp_kstack[1], sizeof(struct kstack) * 7);
        memzero(proc_kstack, sizeof(struct kstack) * 64);
    }
}
  1051bb:	83 c4 1c             	add    $0x1c,%esp
  1051be:	5b                   	pop    %ebx
  1051bf:	5e                   	pop    %esi
  1051c0:	5f                   	pop    %edi
  1051c1:	5d                   	pop    %ebp
  1051c2:	c3                   	ret
  1051c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        memzero(edata, ((uint8_t *) &bsp_kstack[0]) - edata);
  1051c8:	c7 c6 00 b0 19 00    	mov    $0x19b000,%esi
  1051ce:	c7 c0 5c 81 15 00    	mov    $0x15815c,%eax
  1051d4:	83 ec 08             	sub    $0x8,%esp
  1051d7:	89 f2                	mov    %esi,%edx
  1051d9:	29 c2                	sub    %eax,%edx
  1051db:	52                   	push   %edx
  1051dc:	50                   	push   %eax
  1051dd:	e8 0e f4 ff ff       	call   1045f0 <memzero>
        memzero(((uint8_t *) &bsp_kstack[0]) + 4096, end - ((uint8_t *) &bsp_kstack[0]) - 4096);
  1051e2:	58                   	pop    %eax
  1051e3:	c7 c0 98 bf 62 00    	mov    $0x62bf98,%eax
  1051e9:	5a                   	pop    %edx
  1051ea:	29 f0                	sub    %esi,%eax
  1051ec:	2d 00 10 00 00       	sub    $0x1000,%eax
  1051f1:	50                   	push   %eax
  1051f2:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
  1051f8:	50                   	push   %eax
  1051f9:	e8 f2 f3 ff ff       	call   1045f0 <memzero>
  1051fe:	83 c4 10             	add    $0x10,%esp
  105201:	e9 be fe ff ff       	jmp    1050c4 <seg_init+0x24>
  105206:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10520d:	00 
  10520e:	66 90                	xchg   %ax,%ax
        memzero(&bsp_kstack[1], sizeof(struct kstack) * 7);
  105210:	83 ec 08             	sub    $0x8,%esp
  105213:	8d 86 00 10 00 00    	lea    0x1000(%esi),%eax
  105219:	68 00 70 00 00       	push   $0x7000
  10521e:	50                   	push   %eax
  10521f:	e8 cc f3 ff ff       	call   1045f0 <memzero>
        memzero(proc_kstack, sizeof(struct kstack) * 64);
  105224:	58                   	pop    %eax
  105225:	5a                   	pop    %edx
  105226:	68 00 00 04 00       	push   $0x40000
  10522b:	ff b3 e8 ff ff ff    	push   -0x18(%ebx)
  105231:	e8 ba f3 ff ff       	call   1045f0 <memzero>
  105236:	83 c4 10             	add    $0x10,%esp
}
  105239:	83 c4 1c             	add    $0x1c,%esp
  10523c:	5b                   	pop    %ebx
  10523d:	5e                   	pop    %esi
  10523e:	5f                   	pop    %edi
  10523f:	5d                   	pop    %ebp
  105240:	c3                   	ret
  105241:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105248:	00 
  105249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105250 <seg_init_proc>:

/* initialize the kernel stack for each process */
void seg_init_proc(int cpu_idx, int pid)
{
  105250:	55                   	push   %ebp
        SEGDESC32(STA_W, 0x00000000, 0xffffffff, 3);

    /* setup TSS */
    proc_kstack[pid].tss.ts_esp0 = (uint32_t) proc_kstack[pid].kstack_hi;
    proc_kstack[pid].tss.ts_ss0 = CPU_GDT_KDATA;
    proc_kstack[pid].tss.ts_iomb = offsetof(tss_t, ts_iopm);
  105251:	ba 68 00 00 00       	mov    $0x68,%edx
{
  105256:	57                   	push   %edi
  105257:	56                   	push   %esi
  105258:	53                   	push   %ebx
  105259:	e8 44 b1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10525e:	81 c3 96 ed 00 00    	add    $0xed96,%ebx
  105264:	83 ec 14             	sub    $0x14,%esp
  105267:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
    proc_kstack[pid].gdt[0] = SEGDESC_NULL;
  10526b:	89 e8                	mov    %ebp,%eax
  10526d:	83 c5 01             	add    $0x1,%ebp
  105270:	c7 c7 00 b0 15 00    	mov    $0x15b000,%edi
  105276:	c1 e0 0c             	shl    $0xc,%eax
  105279:	c1 e5 0c             	shl    $0xc,%ebp
  10527c:	8d 34 07             	lea    (%edi,%eax,1),%esi
  10527f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  105285:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
    proc_kstack[pid].gdt[CPU_GDT_KCODE >> 3] =
  10528c:	c7 44 07 08 ff ff 00 	movl   $0xffff,0x8(%edi,%eax,1)
  105293:	00 
  105294:	c7 44 38 0c 00 9a cf 	movl   $0xcf9a00,0xc(%eax,%edi,1)
  10529b:	00 
    proc_kstack[pid].gdt[CPU_GDT_KDATA >> 3] =
  10529c:	c7 44 07 10 ff ff 00 	movl   $0xffff,0x10(%edi,%eax,1)
  1052a3:	00 
  1052a4:	c7 44 38 14 00 92 cf 	movl   $0xcf9200,0x14(%eax,%edi,1)
  1052ab:	00 
    proc_kstack[pid].gdt[CPU_GDT_UCODE >> 3] =
  1052ac:	c7 44 07 18 ff ff 00 	movl   $0xffff,0x18(%edi,%eax,1)
  1052b3:	00 
  1052b4:	c7 44 38 1c 00 fa cf 	movl   $0xcffa00,0x1c(%eax,%edi,1)
  1052bb:	00 
    proc_kstack[pid].gdt[CPU_GDT_UDATA >> 3] =
  1052bc:	c7 44 07 20 ff ff 00 	movl   $0xffff,0x20(%edi,%eax,1)
  1052c3:	00 
  1052c4:	c7 44 38 24 00 f2 cf 	movl   $0xcff200,0x24(%eax,%edi,1)
  1052cb:	00 
    proc_kstack[pid].tss.ts_esp0 = (uint32_t) proc_kstack[pid].kstack_hi;
  1052cc:	8d 44 3d 00          	lea    0x0(%ebp,%edi,1),%eax
  1052d0:	89 46 34             	mov    %eax,0x34(%esi)
    proc_kstack[pid].tss.ts_ss0 = CPU_GDT_KDATA;
  1052d3:	b8 10 00 00 00       	mov    $0x10,%eax
  1052d8:	66 89 46 38          	mov    %ax,0x38(%esi)
    memzero (proc_kstack[pid].tss.ts_iopm, sizeof(uint8_t) * 128);
  1052dc:	8d 84 2f 98 f0 ff ff 	lea    -0xf68(%edi,%ebp,1),%eax
    proc_kstack[pid].tss.ts_iomb = offsetof(tss_t, ts_iopm);
  1052e3:	66 89 96 96 00 00 00 	mov    %dx,0x96(%esi)
    memzero (proc_kstack[pid].tss.ts_iopm, sizeof(uint8_t) * 128);
  1052ea:	68 80 00 00 00       	push   $0x80
  1052ef:	50                   	push   %eax
  1052f0:	e8 fb f2 ff ff       	call   1045f0 <memzero>
    proc_kstack[pid].tss.ts_iopm[128] = 0xff;

    proc_kstack[pid].gdt[CPU_GDT_TSS >> 3] =
  1052f5:	bb 89 40 00 00       	mov    $0x4089,%ebx
        SEGDESC16(STS_T32A, (uint32_t) &proc_kstack[pid].tss, sizeof(tss_t) - 1, 0);
  1052fa:	8d 84 2f 30 f0 ff ff 	lea    -0xfd0(%edi,%ebp,1),%eax
    proc_kstack[pid].gdt[CPU_GDT_TSS >> 3] =
  105301:	b9 eb 00 00 00       	mov    $0xeb,%ecx
  105306:	66 89 46 2a          	mov    %ax,0x2a(%esi)
        SEGDESC16(STS_T32A, (uint32_t) &proc_kstack[pid].tss, sizeof(tss_t) - 1, 0);
  10530a:	89 c2                	mov    %eax,%edx
  10530c:	c1 e8 18             	shr    $0x18,%eax
    proc_kstack[pid].gdt[CPU_GDT_TSS >> 3] =
  10530f:	88 46 2f             	mov    %al,0x2f(%esi)
    proc_kstack[pid].gdt[CPU_GDT_TSS >> 3].sd_s = 0;

    /* other fields */
    proc_kstack[pid].magic = KSTACK_MAGIC;
    proc_kstack[pid].cpu_idx = cpu_idx;
  105312:	8b 44 24 30          	mov    0x30(%esp),%eax
        SEGDESC16(STS_T32A, (uint32_t) &proc_kstack[pid].tss, sizeof(tss_t) - 1, 0);
  105316:	c1 ea 10             	shr    $0x10,%edx
    proc_kstack[pid].tss.ts_iopm[128] = 0xff;
  105319:	c6 86 18 01 00 00 ff 	movb   $0xff,0x118(%esi)
    proc_kstack[pid].gdt[CPU_GDT_TSS >> 3] =
  105320:	66 89 4e 28          	mov    %cx,0x28(%esi)
  105324:	88 56 2c             	mov    %dl,0x2c(%esi)
  105327:	66 89 5e 2d          	mov    %bx,0x2d(%esi)
    proc_kstack[pid].magic = KSTACK_MAGIC;
  10532b:	c7 86 20 01 00 00 32 	movl   $0x98765432,0x120(%esi)
  105332:	54 76 98 
    proc_kstack[pid].cpu_idx = cpu_idx;
  105335:	89 86 1c 01 00 00    	mov    %eax,0x11c(%esi)
}
  10533b:	83 c4 1c             	add    $0x1c,%esp
  10533e:	5b                   	pop    %ebx
  10533f:	5e                   	pop    %esi
  105340:	5f                   	pop    %edi
  105341:	5d                   	pop    %ebp
  105342:	c3                   	ret
  105343:	66 90                	xchg   %ax,%ax
  105345:	66 90                	xchg   %ax,%ax
  105347:	66 90                	xchg   %ax,%ax
  105349:	66 90                	xchg   %ax,%ax
  10534b:	66 90                	xchg   %ax,%ax
  10534d:	66 90                	xchg   %ax,%ax
  10534f:	90                   	nop

00105350 <max>:
#include "types.h"

uint32_t max(uint32_t a, uint32_t b)
{
  105350:	8b 44 24 08          	mov    0x8(%esp),%eax
    return (a > b) ? a : b;
  105354:	8b 54 24 04          	mov    0x4(%esp),%edx
  105358:	39 d0                	cmp    %edx,%eax
  10535a:	0f 42 c2             	cmovb  %edx,%eax
}
  10535d:	c3                   	ret
  10535e:	66 90                	xchg   %ax,%ax

00105360 <min>:

uint32_t min(uint32_t a, uint32_t b)
{
  105360:	8b 44 24 08          	mov    0x8(%esp),%eax
    return (a < b) ? a : b;
  105364:	8b 54 24 04          	mov    0x4(%esp),%edx
  105368:	39 d0                	cmp    %edx,%eax
  10536a:	0f 47 c2             	cmova  %edx,%eax
}
  10536d:	c3                   	ret
  10536e:	66 90                	xchg   %ax,%ax

00105370 <rounddown>:

uint32_t rounddown(uint32_t a, uint32_t n)
{
  105370:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    return a - a % n;
  105374:	31 d2                	xor    %edx,%edx
  105376:	89 c8                	mov    %ecx,%eax
  105378:	f7 74 24 08          	divl   0x8(%esp)
  10537c:	89 c8                	mov    %ecx,%eax
  10537e:	29 d0                	sub    %edx,%eax
}
  105380:	c3                   	ret
  105381:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105388:	00 
  105389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105390 <roundup>:

uint32_t roundup(uint32_t a, uint32_t n)
{
  105390:	53                   	push   %ebx
  105391:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    return a - a % n;
  105395:	31 d2                	xor    %edx,%edx
    return rounddown(a + n - 1, n);
  105397:	8d 4b ff             	lea    -0x1(%ebx),%ecx
  10539a:	03 4c 24 08          	add    0x8(%esp),%ecx
    return a - a % n;
  10539e:	89 c8                	mov    %ecx,%eax
  1053a0:	f7 f3                	div    %ebx
  1053a2:	89 c8                	mov    %ecx,%eax
}
  1053a4:	5b                   	pop    %ebx
    return a - a % n;
  1053a5:	29 d0                	sub    %edx,%eax
}
  1053a7:	c3                   	ret
  1053a8:	66 90                	xchg   %ax,%ax
  1053aa:	66 90                	xchg   %ax,%ax
  1053ac:	66 90                	xchg   %ax,%ax
  1053ae:	66 90                	xchg   %ax,%ax

001053b0 <read_esp>:
#include "x86.h"

gcc_inline uintptr_t read_esp(void)
{
    uint32_t esp;
    __asm __volatile ("movl %%esp,%0" : "=rm" (esp));
  1053b0:	89 e0                	mov    %esp,%eax
    return esp;
}
  1053b2:	c3                   	ret
  1053b3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1053ba:	00 
  1053bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001053c0 <read_ebp>:

gcc_inline uint32_t read_ebp(void)
{
    uint32_t ebp;
    __asm __volatile ("movl %%ebp,%0" : "=rm" (ebp));
  1053c0:	89 e8                	mov    %ebp,%eax
    return ebp;
}
  1053c2:	c3                   	ret
  1053c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1053ca:	00 
  1053cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001053d0 <lldt>:

gcc_inline void lldt(uint16_t sel)
{
    __asm __volatile ("lldt %0" :: "r" (sel));
  1053d0:	0f b7 44 24 04       	movzwl 0x4(%esp),%eax
  1053d5:	0f 00 d0             	lldt   %eax
}
  1053d8:	c3                   	ret
  1053d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001053e0 <cli>:

gcc_inline void cli(void)
{
    __asm __volatile ("cli" ::: "memory");
  1053e0:	fa                   	cli
}
  1053e1:	c3                   	ret
  1053e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1053e9:	00 
  1053ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001053f0 <sti>:

gcc_inline void sti(void)
{
    __asm __volatile ("sti; nop");
  1053f0:	fb                   	sti
  1053f1:	90                   	nop
}
  1053f2:	c3                   	ret
  1053f3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1053fa:	00 
  1053fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105400 <rdmsr>:

gcc_inline uint64_t rdmsr(uint32_t msr)
{
    uint64_t rv;
    __asm __volatile ("rdmsr"
  105400:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  105404:	0f 32                	rdmsr
                      : "=A" (rv)
                      : "c" (msr));
    return rv;
}
  105406:	c3                   	ret
  105407:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10540e:	00 
  10540f:	90                   	nop

00105410 <wrmsr>:

gcc_inline void wrmsr(uint32_t msr, uint64_t newval)
{
    __asm __volatile ("wrmsr" :: "A" (newval), "c" (msr));
  105410:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  105414:	8b 44 24 08          	mov    0x8(%esp),%eax
  105418:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10541c:	0f 30                	wrmsr
}
  10541e:	c3                   	ret
  10541f:	90                   	nop

00105420 <halt>:

gcc_inline void halt(void)
{
    __asm __volatile ("hlt");
  105420:	f4                   	hlt
}
  105421:	c3                   	ret
  105422:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105429:	00 
  10542a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105430 <pause>:

gcc_inline void pause(void)
{
    __asm __volatile ("pause" ::: "memory");
  105430:	f3 90                	pause
}
  105432:	c3                   	ret
  105433:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10543a:	00 
  10543b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105440 <xchg>:

gcc_inline uint32_t xchg(volatile uint32_t *addr, uint32_t newval)
{
  105440:	8b 54 24 04          	mov    0x4(%esp),%edx
    uint32_t result;

    __asm __volatile ("lock; xchgl %0, %1"
  105444:	8b 44 24 08          	mov    0x8(%esp),%eax
  105448:	f0 87 02             	lock xchg %eax,(%edx)
                      : "+m" (*addr), "=a" (result)
                      : "1" (newval)
                      : "cc");

    return result;
}
  10544b:	c3                   	ret
  10544c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105450 <cmpxchg>:

gcc_inline uint32_t cmpxchg(volatile uint32_t *addr, uint32_t oldval, uint32_t newval)
{
  105450:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    uint32_t result;

    __asm __volatile ("lock; cmpxchgl %2, %0"
  105454:	8b 44 24 08          	mov    0x8(%esp),%eax
  105458:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10545c:	f0 0f b1 11          	lock cmpxchg %edx,(%ecx)
                      : "+m" (*addr), "=a" (result)
                      : "r" (newval), "a" (oldval)
                      : "memory", "cc");

    return result;
}
  105460:	c3                   	ret
  105461:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105468:	00 
  105469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105470 <rdtsc>:

gcc_inline uint64_t rdtsc(void)
{
    uint64_t rv;

    __asm __volatile ("rdtsc" : "=A" (rv));
  105470:	0f 31                	rdtsc
    return (rv);
}
  105472:	c3                   	ret
  105473:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10547a:	00 
  10547b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105480 <enable_sse>:
{
    asm volatile ("fninit");
}

gcc_inline void enable_sse(void)
{
  105480:	56                   	push   %esi
  105481:	53                   	push   %ebx
    asm volatile ("fninit");
  105482:	db e3                	fninit
}

gcc_inline uint32_t rcr4(void)
{
    uint32_t cr4;
    __asm __volatile ("movl %%cr4,%0" : "=r" (cr4));
  105484:	0f 20 e6             	mov    %cr4,%esi
    __asm __volatile ("cpuid"
  105487:	b8 01 00 00 00       	mov    $0x1,%eax
  10548c:	0f a2                	cpuid
    cr4 = rcr4() | CR4_OSFXSR | CR4_OSXMMEXCPT;
  10548e:	89 f0                	mov    %esi,%eax
  105490:	81 ce 00 06 04 00    	or     $0x40600,%esi
  105496:	80 cc 06             	or     $0x6,%ah
  105499:	81 e1 00 00 00 04    	and    $0x4000000,%ecx
  10549f:	0f 44 f0             	cmove  %eax,%esi
    FENCE();
  1054a2:	0f ae f0             	mfence
    __asm __volatile ("movl %0,%%cr4" :: "r" (val));
  1054a5:	0f 22 e6             	mov    %esi,%cr4
    __asm __volatile ("movl %%cr0,%0" : "=r" (val));
  1054a8:	0f 20 c0             	mov    %cr0,%eax
    FENCE();
  1054ab:	0f ae f0             	mfence
    cr0 &= ~(CR0_EM | CR0_TS);
  1054ae:	83 e0 f3             	and    $0xfffffff3,%eax
  1054b1:	83 c8 02             	or     $0x2,%eax
    __asm __volatile ("movl %0,%%cr0" :: "r" (val));
  1054b4:	0f 22 c0             	mov    %eax,%cr0
    FENCE();
  1054b7:	0f ae f0             	mfence
}
  1054ba:	5b                   	pop    %ebx
  1054bb:	5e                   	pop    %esi
  1054bc:	c3                   	ret
  1054bd:	8d 76 00             	lea    0x0(%esi),%esi

001054c0 <cpuid>:
{
  1054c0:	55                   	push   %ebp
  1054c1:	57                   	push   %edi
  1054c2:	56                   	push   %esi
  1054c3:	53                   	push   %ebx
  1054c4:	8b 44 24 14          	mov    0x14(%esp),%eax
  1054c8:	8b 74 24 18          	mov    0x18(%esp),%esi
  1054cc:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
  1054d0:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    __asm __volatile ("cpuid"
  1054d4:	0f a2                	cpuid
    if (eaxp)
  1054d6:	85 f6                	test   %esi,%esi
  1054d8:	74 02                	je     1054dc <cpuid+0x1c>
        *eaxp = eax;
  1054da:	89 06                	mov    %eax,(%esi)
    if (ebxp)
  1054dc:	85 ff                	test   %edi,%edi
  1054de:	74 02                	je     1054e2 <cpuid+0x22>
        *ebxp = ebx;
  1054e0:	89 1f                	mov    %ebx,(%edi)
    if (ecxp)
  1054e2:	85 ed                	test   %ebp,%ebp
  1054e4:	74 03                	je     1054e9 <cpuid+0x29>
        *ecxp = ecx;
  1054e6:	89 4d 00             	mov    %ecx,0x0(%ebp)
    if (edxp)
  1054e9:	8b 44 24 24          	mov    0x24(%esp),%eax
  1054ed:	85 c0                	test   %eax,%eax
  1054ef:	74 06                	je     1054f7 <cpuid+0x37>
        *edxp = edx;
  1054f1:	8b 44 24 24          	mov    0x24(%esp),%eax
  1054f5:	89 10                	mov    %edx,(%eax)
}
  1054f7:	5b                   	pop    %ebx
  1054f8:	5e                   	pop    %esi
  1054f9:	5f                   	pop    %edi
  1054fa:	5d                   	pop    %ebp
  1054fb:	c3                   	ret
  1054fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105500 <cpuid_subleaf>:
{
  105500:	55                   	push   %ebp
  105501:	57                   	push   %edi
  105502:	56                   	push   %esi
  105503:	53                   	push   %ebx
  105504:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  105508:	8b 7c 24 20          	mov    0x20(%esp),%edi
  10550c:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    asm volatile ("cpuid"
  105510:	8b 44 24 14          	mov    0x14(%esp),%eax
  105514:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  105518:	0f a2                	cpuid
    if (eaxp)
  10551a:	85 f6                	test   %esi,%esi
  10551c:	74 02                	je     105520 <cpuid_subleaf+0x20>
        *eaxp = eax;
  10551e:	89 06                	mov    %eax,(%esi)
    if (ebxp)
  105520:	85 ff                	test   %edi,%edi
  105522:	74 02                	je     105526 <cpuid_subleaf+0x26>
        *ebxp = ebx;
  105524:	89 1f                	mov    %ebx,(%edi)
    if (ecxp)
  105526:	85 ed                	test   %ebp,%ebp
  105528:	74 03                	je     10552d <cpuid_subleaf+0x2d>
        *ecxp = ecx;
  10552a:	89 4d 00             	mov    %ecx,0x0(%ebp)
    if (edxp)
  10552d:	8b 44 24 28          	mov    0x28(%esp),%eax
  105531:	85 c0                	test   %eax,%eax
  105533:	74 06                	je     10553b <cpuid_subleaf+0x3b>
        *edxp = edx;
  105535:	8b 44 24 28          	mov    0x28(%esp),%eax
  105539:	89 10                	mov    %edx,(%eax)
}
  10553b:	5b                   	pop    %ebx
  10553c:	5e                   	pop    %esi
  10553d:	5f                   	pop    %edi
  10553e:	5d                   	pop    %ebp
  10553f:	c3                   	ret

00105540 <rcr3>:
    __asm __volatile ("movl %%cr3,%0" : "=r" (val));
  105540:	0f 20 d8             	mov    %cr3,%eax
}
  105543:	c3                   	ret
  105544:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10554b:	00 
  10554c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105550 <outl>:
    __asm __volatile ("outl %0,%w1" :: "a" (data), "d" (port));
  105550:	8b 54 24 04          	mov    0x4(%esp),%edx
  105554:	8b 44 24 08          	mov    0x8(%esp),%eax
  105558:	ef                   	out    %eax,(%dx)
}
  105559:	c3                   	ret
  10555a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105560 <inl>:
    __asm __volatile ("inl %w1,%0" : "=a" (data) : "d" (port));
  105560:	8b 54 24 04          	mov    0x4(%esp),%edx
  105564:	ed                   	in     (%dx),%eax
}
  105565:	c3                   	ret
  105566:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10556d:	00 
  10556e:	66 90                	xchg   %ax,%ax

00105570 <smp_wmb>:
}
  105570:	c3                   	ret
  105571:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105578:	00 
  105579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105580 <ltr>:
    __asm __volatile ("ltr %0" :: "r" (sel));
  105580:	0f b7 44 24 04       	movzwl 0x4(%esp),%eax
  105585:	0f 00 d8             	ltr    %eax
}
  105588:	c3                   	ret
  105589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105590 <lcr0>:
    __asm __volatile ("movl %0,%%cr0" :: "r" (val));
  105590:	8b 44 24 04          	mov    0x4(%esp),%eax
  105594:	0f 22 c0             	mov    %eax,%cr0
}
  105597:	c3                   	ret
  105598:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10559f:	00 

001055a0 <rcr0>:
    __asm __volatile ("movl %%cr0,%0" : "=r" (val));
  1055a0:	0f 20 c0             	mov    %cr0,%eax
}
  1055a3:	c3                   	ret
  1055a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055ab:	00 
  1055ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001055b0 <rcr2>:
    __asm __volatile ("movl %%cr2,%0" : "=r" (val));
  1055b0:	0f 20 d0             	mov    %cr2,%eax
}
  1055b3:	c3                   	ret
  1055b4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055bb:	00 
  1055bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001055c0 <lcr3>:
    __asm __volatile ("movl %0,%%cr3" :: "r" (val));
  1055c0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1055c4:	0f 22 d8             	mov    %eax,%cr3
}
  1055c7:	c3                   	ret
  1055c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055cf:	00 

001055d0 <lcr4>:
    __asm __volatile ("movl %0,%%cr4" :: "r" (val));
  1055d0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1055d4:	0f 22 e0             	mov    %eax,%cr4
}
  1055d7:	c3                   	ret
  1055d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055df:	00 

001055e0 <rcr4>:
    __asm __volatile ("movl %%cr4,%0" : "=r" (cr4));
  1055e0:	0f 20 e0             	mov    %cr4,%eax
    return cr4;
}
  1055e3:	c3                   	ret
  1055e4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055eb:	00 
  1055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001055f0 <inb>:

gcc_inline uint8_t inb(int port)
{
    uint8_t data;
    __asm __volatile ("inb %w1,%0"
  1055f0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1055f4:	ec                   	in     (%dx),%al
                      : "=a" (data)
                      : "d" (port));
    return data;
}
  1055f5:	c3                   	ret
  1055f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1055fd:	00 
  1055fe:	66 90                	xchg   %ax,%ax

00105600 <insl>:

gcc_inline void insl(int port, void *addr, int cnt)
{
  105600:	57                   	push   %edi
    __asm __volatile ("cld\n\trepne\n\tinsl"
  105601:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  105605:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  105609:	8b 54 24 08          	mov    0x8(%esp),%edx
  10560d:	fc                   	cld
  10560e:	f2 6d                	repnz insl (%dx),%es:(%edi)
                      : "=D" (addr), "=c" (cnt)
                      : "d" (port), "0" (addr), "1" (cnt)
                      : "memory", "cc");
}
  105610:	5f                   	pop    %edi
  105611:	c3                   	ret
  105612:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105619:	00 
  10561a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105620 <outb>:

gcc_inline void outb(int port, uint8_t data)
{
    __asm __volatile ("outb %0,%w1" :: "a" (data), "d" (port));
  105620:	8b 54 24 04          	mov    0x4(%esp),%edx
  105624:	0f b6 44 24 08       	movzbl 0x8(%esp),%eax
  105629:	ee                   	out    %al,(%dx)
}
  10562a:	c3                   	ret
  10562b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105630 <outsw>:

gcc_inline void outsw(int port, const void *addr, int cnt)
{
  105630:	56                   	push   %esi
    __asm __volatile ("cld\n\trepne\n\toutsw"
  105631:	8b 74 24 0c          	mov    0xc(%esp),%esi
  105635:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  105639:	8b 54 24 08          	mov    0x8(%esp),%edx
  10563d:	fc                   	cld
  10563e:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
                      : "=S" (addr), "=c" (cnt)
                      : "d" (port), "0" (addr), "1" (cnt)
                      : "cc");
}
  105641:	5e                   	pop    %esi
  105642:	c3                   	ret
  105643:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10564a:	00 
  10564b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105650 <outsl>:

gcc_inline void outsl(int port, const void *addr, int cnt)
{
  105650:	56                   	push   %esi
    __asm __volatile ("cld\n\trepne\n\toutsl"
  105651:	8b 74 24 0c          	mov    0xc(%esp),%esi
  105655:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  105659:	8b 54 24 08          	mov    0x8(%esp),%edx
  10565d:	fc                   	cld
  10565e:	f2 6f                	repnz outsl %ds:(%esi),(%dx)
                      : "=S" (addr), "=c" (cnt)
                      : "d" (port), "0" (addr), "1" (cnt)
                      : "cc");
}
  105660:	5e                   	pop    %esi
  105661:	c3                   	ret
  105662:	66 90                	xchg   %ax,%ax
  105664:	66 90                	xchg   %ax,%ax
  105666:	66 90                	xchg   %ax,%ax
  105668:	66 90                	xchg   %ax,%ax
  10566a:	66 90                	xchg   %ax,%ax
  10566c:	66 90                	xchg   %ax,%ax
  10566e:	66 90                	xchg   %ax,%ax

00105670 <mon_backtrace>:
int mon_backtrace(int argc, char **argv, struct Trapframe *tf)
{
    // TODO [Lab 1] (optional): print the chain of saved %ebp / return %eip
    // values on the kernel stack, starting from the current %ebp.
    return 0;
}
  105670:	31 c0                	xor    %eax,%eax
  105672:	c3                   	ret
  105673:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10567a:	00 
  10567b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00105680 <mon_help>:
{
  105680:	56                   	push   %esi
  105681:	53                   	push   %ebx
  105682:	e8 1b ad ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105687:	81 c3 6d e9 00 00    	add    $0xe96d,%ebx
  10568d:	83 ec 08             	sub    $0x8,%esp
        dprintf("%s - %s\n", commands[i].name, commands[i].desc);
  105690:	8d 83 55 74 ff ff    	lea    -0x8bab(%ebx),%eax
  105696:	8d b3 78 74 ff ff    	lea    -0x8b88(%ebx),%esi
  10569c:	50                   	push   %eax
  10569d:	8d 83 73 74 ff ff    	lea    -0x8b8d(%ebx),%eax
  1056a3:	50                   	push   %eax
  1056a4:	56                   	push   %esi
  1056a5:	e8 a6 f3 ff ff       	call   104a50 <dprintf>
  1056aa:	83 c4 0c             	add    $0xc,%esp
  1056ad:	8d 83 d4 80 ff ff    	lea    -0x7f2c(%ebx),%eax
  1056b3:	50                   	push   %eax
  1056b4:	8d 83 81 74 ff ff    	lea    -0x8b7f(%ebx),%eax
  1056ba:	50                   	push   %eax
  1056bb:	56                   	push   %esi
  1056bc:	e8 8f f3 ff ff       	call   104a50 <dprintf>
  1056c1:	83 c4 0c             	add    $0xc,%esp
  1056c4:	8d 83 fc 80 ff ff    	lea    -0x7f04(%ebx),%eax
  1056ca:	50                   	push   %eax
  1056cb:	8d 83 8a 74 ff ff    	lea    -0x8b76(%ebx),%eax
  1056d1:	50                   	push   %eax
  1056d2:	56                   	push   %esi
  1056d3:	e8 78 f3 ff ff       	call   104a50 <dprintf>
  1056d8:	83 c4 0c             	add    $0xc,%esp
  1056db:	8d 83 24 81 ff ff    	lea    -0x7edc(%ebx),%eax
  1056e1:	50                   	push   %eax
  1056e2:	8d 83 94 74 ff ff    	lea    -0x8b6c(%ebx),%eax
  1056e8:	50                   	push   %eax
  1056e9:	56                   	push   %esi
  1056ea:	e8 61 f3 ff ff       	call   104a50 <dprintf>
}
  1056ef:	83 c4 14             	add    $0x14,%esp
  1056f2:	31 c0                	xor    %eax,%eax
  1056f4:	5b                   	pop    %ebx
  1056f5:	5e                   	pop    %esi
  1056f6:	c3                   	ret
  1056f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1056fe:	00 
  1056ff:	90                   	nop

00105700 <mon_kerninfo>:
{
  105700:	57                   	push   %edi
  105701:	56                   	push   %esi
  105702:	53                   	push   %ebx
  105703:	e8 9a ac ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105708:	81 c3 ec e8 00 00    	add    $0xe8ec,%ebx
    dprintf("Special kernel symbols:\n");
  10570e:	83 ec 0c             	sub    $0xc,%esp
  105711:	8d 83 9e 74 ff ff    	lea    -0x8b62(%ebx),%eax
  105717:	50                   	push   %eax
  105718:	e8 33 f3 ff ff       	call   104a50 <dprintf>
    dprintf("  start  %08x\n", start);
  10571d:	c7 c7 e0 65 10 00    	mov    $0x1065e0,%edi
  105723:	58                   	pop    %eax
  105724:	8d 83 b7 74 ff ff    	lea    -0x8b49(%ebx),%eax
  10572a:	5a                   	pop    %edx
  10572b:	57                   	push   %edi
  10572c:	50                   	push   %eax
  10572d:	e8 1e f3 ff ff       	call   104a50 <dprintf>
    dprintf("  etext  %08x\n", etext);
  105732:	8d 83 c6 74 ff ff    	lea    -0x8b3a(%ebx),%eax
  105738:	59                   	pop    %ecx
  105739:	5e                   	pop    %esi
  10573a:	ff b3 ec ff ff ff    	push   -0x14(%ebx)
  105740:	50                   	push   %eax
  105741:	e8 0a f3 ff ff       	call   104a50 <dprintf>
    dprintf("  edata  %08x\n", edata);
  105746:	58                   	pop    %eax
  105747:	8d 83 d5 74 ff ff    	lea    -0x8b2b(%ebx),%eax
  10574d:	5a                   	pop    %edx
  10574e:	ff b3 e4 ff ff ff    	push   -0x1c(%ebx)
  105754:	50                   	push   %eax
  105755:	e8 f6 f2 ff ff       	call   104a50 <dprintf>
    dprintf("  end    %08x\n", end);
  10575a:	59                   	pop    %ecx
  10575b:	5e                   	pop    %esi
  10575c:	8d 83 e4 74 ff ff    	lea    -0x8b1c(%ebx),%eax
  105762:	c7 c6 98 bf 62 00    	mov    $0x62bf98,%esi
  105768:	56                   	push   %esi
            ROUNDUP(end - start, 1024) / 1024);
  105769:	29 fe                	sub    %edi,%esi
    dprintf("  end    %08x\n", end);
  10576b:	50                   	push   %eax
  10576c:	e8 df f2 ff ff       	call   104a50 <dprintf>
            ROUNDUP(end - start, 1024) / 1024);
  105771:	8d 86 ff 03 00 00    	lea    0x3ff(%esi),%eax
    dprintf("Kernel executable memory footprint: %dKB\n",
  105777:	5f                   	pop    %edi
  105778:	5a                   	pop    %edx
            ROUNDUP(end - start, 1024) / 1024);
  105779:	89 c1                	mov    %eax,%ecx
  10577b:	c1 f9 1f             	sar    $0x1f,%ecx
  10577e:	c1 e9 16             	shr    $0x16,%ecx
  105781:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  105784:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  10578a:	29 ca                	sub    %ecx,%edx
  10578c:	29 d0                	sub    %edx,%eax
    dprintf("Kernel executable memory footprint: %dKB\n",
  10578e:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  105794:	0f 48 c2             	cmovs  %edx,%eax
  105797:	c1 f8 0a             	sar    $0xa,%eax
  10579a:	50                   	push   %eax
  10579b:	8d 83 48 81 ff ff    	lea    -0x7eb8(%ebx),%eax
  1057a1:	50                   	push   %eax
  1057a2:	e8 a9 f2 ff ff       	call   104a50 <dprintf>
    return 0;
  1057a7:	83 c4 10             	add    $0x10,%esp
}
  1057aa:	31 c0                	xor    %eax,%eax
  1057ac:	5b                   	pop    %ebx
  1057ad:	5e                   	pop    %esi
  1057ae:	5f                   	pop    %edi
  1057af:	c3                   	ret

001057b0 <mon_start_user>:

int mon_start_user(int argc, char **argv, struct Trapframe *tf)
{
  1057b0:	57                   	push   %edi
  1057b1:	56                   	push   %esi
  1057b2:	53                   	push   %ebx
  1057b3:	e8 ea ab ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1057b8:	81 c3 3c e8 00 00    	add    $0xe83c,%ebx
    unsigned int idle_pid;
    idle_pid = proc_create(_binary___obj_user_idle_idle_start, 10000);
  1057be:	83 ec 08             	sub    $0x8,%esp
  1057c1:	68 10 27 00 00       	push   $0x2710
  1057c6:	ff b3 e0 ff ff ff    	push   -0x20(%ebx)
    KERN_DEBUG("process idle %d is created.\n", idle_pid);
  1057cc:	8d bb 10 75 ff ff    	lea    -0x8af0(%ebx),%edi
    idle_pid = proc_create(_binary___obj_user_idle_idle_start, 10000);
  1057d2:	e8 d9 19 00 00       	call   1071b0 <proc_create>
    KERN_DEBUG("process idle %d is created.\n", idle_pid);
  1057d7:	50                   	push   %eax
    idle_pid = proc_create(_binary___obj_user_idle_idle_start, 10000);
  1057d8:	89 c6                	mov    %eax,%esi
    KERN_DEBUG("process idle %d is created.\n", idle_pid);
  1057da:	8d 83 f3 74 ff ff    	lea    -0x8b0d(%ebx),%eax
  1057e0:	50                   	push   %eax
  1057e1:	6a 4c                	push   $0x4c
  1057e3:	57                   	push   %edi
  1057e4:	e8 97 ef ff ff       	call   104780 <debug_normal>

    KERN_INFO("Start user-space ... \n");
  1057e9:	83 c4 14             	add    $0x14,%esp
  1057ec:	8d 83 23 75 ff ff    	lea    -0x8add(%ebx),%eax
  1057f2:	50                   	push   %eax
  1057f3:	e8 48 ef ff ff       	call   104740 <debug_info>

    tqueue_remove(NUM_IDS, idle_pid);
  1057f8:	58                   	pop    %eax
  1057f9:	5a                   	pop    %edx
  1057fa:	56                   	push   %esi
  1057fb:	6a 40                	push   $0x40
  1057fd:	e8 4e 17 00 00       	call   106f50 <tqueue_remove>
    tcb_set_state(idle_pid, TSTATE_RUN);
  105802:	59                   	pop    %ecx
  105803:	58                   	pop    %eax
  105804:	6a 01                	push   $0x1
  105806:	56                   	push   %esi
  105807:	e8 24 14 00 00       	call   106c30 <tcb_set_state>
    set_curid(idle_pid);
  10580c:	89 34 24             	mov    %esi,(%esp)
  10580f:	e8 6c 17 00 00       	call   106f80 <set_curid>
    kctx_switch(0, idle_pid);
  105814:	58                   	pop    %eax
  105815:	5a                   	pop    %edx
  105816:	56                   	push   %esi
  105817:	6a 00                	push   $0x0
  105819:	e8 72 13 00 00       	call   106b90 <kctx_switch>

    KERN_PANIC("mon_start_user() should never reach here.\n");
  10581e:	83 c4 0c             	add    $0xc,%esp
  105821:	8d 83 74 81 ff ff    	lea    -0x7e8c(%ebx),%eax
  105827:	50                   	push   %eax
  105828:	6a 55                	push   $0x55
  10582a:	57                   	push   %edi
  10582b:	e8 b0 ef ff ff       	call   1047e0 <debug_panic>
    return 0;
  105830:	83 c4 10             	add    $0x10,%esp
}
  105833:	31 c0                	xor    %eax,%eax
  105835:	5b                   	pop    %ebx
  105836:	5e                   	pop    %esi
  105837:	5f                   	pop    %edi
  105838:	c3                   	ret
  105839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105840 <monitor>:
    dprintf("Unknown command '%s'\n", argv[0]);
    return 0;
}

void monitor(struct Trapframe *tf)
{
  105840:	55                   	push   %ebp
  105841:	57                   	push   %edi
  105842:	56                   	push   %esi
  105843:	53                   	push   %ebx
  105844:	e8 59 ab ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105849:	81 c3 ab e7 00 00    	add    $0xe7ab,%ebx
  10584f:	83 ec 78             	sub    $0x78,%esp
    char *buf;

    dprintf("\n****************************************\n\n");
  105852:	8d b3 a0 81 ff ff    	lea    -0x7e60(%ebx),%esi
  105858:	56                   	push   %esi
  105859:	e8 f2 f1 ff ff       	call   104a50 <dprintf>
    dprintf("Welcome to the mCertiKOS kernel monitor!\n");
  10585e:	8d 83 cc 81 ff ff    	lea    -0x7e34(%ebx),%eax
  105864:	89 04 24             	mov    %eax,(%esp)
  105867:	e8 e4 f1 ff ff       	call   104a50 <dprintf>
    dprintf("\n****************************************\n\n");
  10586c:	89 34 24             	mov    %esi,(%esp)
        while (*buf && strchr(WHITESPACE, *buf))
  10586f:	8d b3 3e 75 ff ff    	lea    -0x8ac2(%ebx),%esi
    dprintf("\n****************************************\n\n");
  105875:	e8 d6 f1 ff ff       	call   104a50 <dprintf>
    dprintf("Type 'help' for a list of commands.\n");
  10587a:	8d 83 f8 81 ff ff    	lea    -0x7e08(%ebx),%eax
  105880:	89 04 24             	mov    %eax,(%esp)
  105883:	e8 c8 f1 ff ff       	call   104a50 <dprintf>
  105888:	83 c4 10             	add    $0x10,%esp
  10588b:	8d 83 3a 75 ff ff    	lea    -0x8ac6(%ebx),%eax
  105891:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105895:	8d 83 ac ff ff ff    	lea    -0x54(%ebx),%eax
  10589b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10589f:	8d 05 ac ff ff ff    	lea    0xffffffac,%eax
  1058a5:	89 44 24 18          	mov    %eax,0x18(%esp)
  1058a9:	8d 44 24 20          	lea    0x20(%esp),%eax
  1058ad:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  1058b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    while (1) {
        buf = (char *) readline("$> ");
  1058b8:	83 ec 0c             	sub    $0xc,%esp
  1058bb:	ff 74 24 18          	push   0x18(%esp)
  1058bf:	e8 cc ac ff ff       	call   100590 <readline>
        if (buf != NULL)
  1058c4:	83 c4 10             	add    $0x10,%esp
        buf = (char *) readline("$> ");
  1058c7:	89 c5                	mov    %eax,%ebp
        if (buf != NULL)
  1058c9:	85 c0                	test   %eax,%eax
  1058cb:	74 eb                	je     1058b8 <monitor+0x78>
    argv[argc] = 0;
  1058cd:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
  1058d4:	00 
        while (*buf && strchr(WHITESPACE, *buf))
  1058d5:	0f be 00             	movsbl (%eax),%eax
  1058d8:	31 ff                	xor    %edi,%edi
  1058da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1058e0:	84 c0                	test   %al,%al
  1058e2:	75 5c                	jne    105940 <monitor+0x100>
  1058e4:	89 fa                	mov    %edi,%edx
    argv[argc] = 0;
  1058e6:	c7 44 94 20 00 00 00 	movl   $0x0,0x20(%esp,%edx,4)
  1058ed:	00 
    if (argc == 0)
  1058ee:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    for (i = 0; i < NCOMMANDS; i++) {
  1058f2:	31 ff                	xor    %edi,%edi
    if (argc == 0)
  1058f4:	85 d2                	test   %edx,%edx
  1058f6:	74 c0                	je     1058b8 <monitor+0x78>
  1058f8:	89 54 24 14          	mov    %edx,0x14(%esp)
        if (strcmp(argv[0], commands[i].name) == 0)
  1058fc:	83 ec 08             	sub    $0x8,%esp
  1058ff:	ff 75 00             	push   0x0(%ebp)
  105902:	ff 74 24 2c          	push   0x2c(%esp)
  105906:	e8 55 ec ff ff       	call   104560 <strcmp>
  10590b:	83 c4 10             	add    $0x10,%esp
  10590e:	8b 54 24 14          	mov    0x14(%esp),%edx
  105912:	85 c0                	test   %eax,%eax
  105914:	0f 84 b8 00 00 00    	je     1059d2 <monitor+0x192>
    for (i = 0; i < NCOMMANDS; i++) {
  10591a:	83 c7 01             	add    $0x1,%edi
  10591d:	83 c5 0c             	add    $0xc,%ebp
  105920:	83 ff 04             	cmp    $0x4,%edi
  105923:	75 d3                	jne    1058f8 <monitor+0xb8>
    dprintf("Unknown command '%s'\n", argv[0]);
  105925:	83 ec 08             	sub    $0x8,%esp
  105928:	8d 83 60 75 ff ff    	lea    -0x8aa0(%ebx),%eax
  10592e:	ff 74 24 28          	push   0x28(%esp)
  105932:	50                   	push   %eax
  105933:	e8 18 f1 ff ff       	call   104a50 <dprintf>
    return 0;
  105938:	83 c4 10             	add    $0x10,%esp
  10593b:	e9 78 ff ff ff       	jmp    1058b8 <monitor+0x78>
        while (*buf && strchr(WHITESPACE, *buf))
  105940:	83 ec 08             	sub    $0x8,%esp
  105943:	50                   	push   %eax
  105944:	56                   	push   %esi
  105945:	e8 66 ec ff ff       	call   1045b0 <strchr>
  10594a:	83 c4 10             	add    $0x10,%esp
  10594d:	85 c0                	test   %eax,%eax
  10594f:	74 0f                	je     105960 <monitor+0x120>
            *buf++ = 0;
  105951:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
        while (*buf && strchr(WHITESPACE, *buf))
  105955:	0f be 45 01          	movsbl 0x1(%ebp),%eax
            *buf++ = 0;
  105959:	83 c5 01             	add    $0x1,%ebp
  10595c:	eb 82                	jmp    1058e0 <monitor+0xa0>
  10595e:	66 90                	xchg   %ax,%ax
        if (*buf == 0)
  105960:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
  105964:	0f 84 7a ff ff ff    	je     1058e4 <monitor+0xa4>
        if (argc == MAXARGS - 1) {
  10596a:	83 ff 0f             	cmp    $0xf,%edi
  10596d:	74 4a                	je     1059b9 <monitor+0x179>
        argv[argc++] = buf;
  10596f:	89 6c bc 20          	mov    %ebp,0x20(%esp,%edi,4)
        while (*buf && !strchr(WHITESPACE, *buf))
  105973:	0f be 45 00          	movsbl 0x0(%ebp),%eax
        argv[argc++] = buf;
  105977:	8d 57 01             	lea    0x1(%edi),%edx
        while (*buf && !strchr(WHITESPACE, *buf))
  10597a:	84 c0                	test   %al,%al
  10597c:	0f 84 64 ff ff ff    	je     1058e6 <monitor+0xa6>
  105982:	89 d7                	mov    %edx,%edi
  105984:	eb 19                	jmp    10599f <monitor+0x15f>
  105986:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10598d:	00 
  10598e:	66 90                	xchg   %ax,%ax
  105990:	0f be 45 01          	movsbl 0x1(%ebp),%eax
            buf++;
  105994:	83 c5 01             	add    $0x1,%ebp
        while (*buf && !strchr(WHITESPACE, *buf))
  105997:	84 c0                	test   %al,%al
  105999:	0f 84 45 ff ff ff    	je     1058e4 <monitor+0xa4>
  10599f:	83 ec 08             	sub    $0x8,%esp
  1059a2:	50                   	push   %eax
  1059a3:	56                   	push   %esi
  1059a4:	e8 07 ec ff ff       	call   1045b0 <strchr>
  1059a9:	83 c4 10             	add    $0x10,%esp
  1059ac:	85 c0                	test   %eax,%eax
  1059ae:	74 e0                	je     105990 <monitor+0x150>
        while (*buf && strchr(WHITESPACE, *buf))
  1059b0:	0f be 45 00          	movsbl 0x0(%ebp),%eax
  1059b4:	e9 27 ff ff ff       	jmp    1058e0 <monitor+0xa0>
            dprintf("Too many arguments (max %d)\n", MAXARGS);
  1059b9:	83 ec 08             	sub    $0x8,%esp
  1059bc:	8d 83 43 75 ff ff    	lea    -0x8abd(%ebx),%eax
  1059c2:	6a 10                	push   $0x10
  1059c4:	50                   	push   %eax
  1059c5:	e8 86 f0 ff ff       	call   104a50 <dprintf>
            return 0;
  1059ca:	83 c4 10             	add    $0x10,%esp
  1059cd:	e9 e6 fe ff ff       	jmp    1058b8 <monitor+0x78>
            return commands[i].func(argc, argv, tf);
  1059d2:	83 ec 04             	sub    $0x4,%esp
  1059d5:	8d 04 7f             	lea    (%edi,%edi,2),%eax
  1059d8:	ff b4 24 84 00 00 00 	push   0x84(%esp)
  1059df:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  1059e2:	ff 74 24 24          	push   0x24(%esp)
  1059e6:	52                   	push   %edx
  1059e7:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  1059eb:	ff 54 01 08          	call   *0x8(%ecx,%eax,1)
            if (runcmd(buf, tf) < 0)
  1059ef:	83 c4 10             	add    $0x10,%esp
  1059f2:	85 c0                	test   %eax,%eax
  1059f4:	0f 89 be fe ff ff    	jns    1058b8 <monitor+0x78>
                break;
    }
}
  1059fa:	83 c4 6c             	add    $0x6c,%esp
  1059fd:	5b                   	pop    %ebx
  1059fe:	5e                   	pop    %esi
  1059ff:	5f                   	pop    %edi
  105a00:	5d                   	pop    %ebp
  105a01:	c3                   	ret
  105a02:	66 90                	xchg   %ax,%ax
  105a04:	66 90                	xchg   %ax,%ax
  105a06:	66 90                	xchg   %ax,%ax
  105a08:	66 90                	xchg   %ax,%ax
  105a0a:	66 90                	xchg   %ax,%ax
  105a0c:	66 90                	xchg   %ax,%ax
  105a0e:	66 90                	xchg   %ax,%ax

00105a10 <pt_copyin>:
extern unsigned int get_ptbl_entry_by_va(unsigned int pid,
                                         unsigned int vaddr);

size_t pt_copyin(uint32_t pmap_id, uintptr_t uva, void *kva, size_t len)
{
    if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  105a10:	e8 85 a9 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  105a15:	05 df e5 00 00       	add    $0xe5df,%eax
{
  105a1a:	55                   	push   %ebp
        return 0;
  105a1b:	31 c9                	xor    %ecx,%ecx
{
  105a1d:	57                   	push   %edi
  105a1e:	56                   	push   %esi
  105a1f:	53                   	push   %ebx
  105a20:	83 ec 1c             	sub    $0x1c,%esp
  105a23:	8b 7c 24 34          	mov    0x34(%esp),%edi
  105a27:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
  105a2b:	89 44 24 04          	mov    %eax,0x4(%esp)
    if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  105a2f:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  105a35:	0f 86 b9 00 00 00    	jbe    105af4 <pt_copyin+0xe4>
  105a3b:	8d 04 2f             	lea    (%edi,%ebp,1),%eax
  105a3e:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  105a43:	0f 87 ab 00 00 00    	ja     105af4 <pt_copyin+0xe4>

    if ((uintptr_t) kva + len > VM_USERHI)
  105a49:	8b 44 24 38          	mov    0x38(%esp),%eax
  105a4d:	01 e8                	add    %ebp,%eax
  105a4f:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  105a54:	0f 87 9a 00 00 00    	ja     105af4 <pt_copyin+0xe4>
        return 0;

    size_t copied = 0;

    while (len) {
  105a5a:	85 ed                	test   %ebp,%ebp
  105a5c:	0f 84 92 00 00 00    	je     105af4 <pt_copyin+0xe4>
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
        }

        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);

        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105a62:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  105a66:	8b 74 24 38          	mov    0x38(%esp),%esi
  105a6a:	eb 45                	jmp    105ab1 <pt_copyin+0xa1>
  105a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  105a70:	89 f9                	mov    %edi,%ecx
        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105a72:	ba 00 10 00 00       	mov    $0x1000,%edx
        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  105a77:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  105a7c:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105a82:	29 ca                	sub    %ecx,%edx
        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  105a84:	09 c8                	or     %ecx,%eax
        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105a86:	39 ea                	cmp    %ebp,%edx
  105a88:	0f 47 d5             	cmova  %ebp,%edx
            len : PAGESIZE - uva_pa % PAGESIZE;

        memcpy(kva, (void *) uva_pa, size);
  105a8b:	83 ec 04             	sub    $0x4,%esp
  105a8e:	52                   	push   %edx
  105a8f:	89 54 24 10          	mov    %edx,0x10(%esp)
  105a93:	50                   	push   %eax
  105a94:	56                   	push   %esi
  105a95:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  105a99:	e8 32 ea ff ff       	call   1044d0 <memcpy>

        len -= size;
        uva += size;
  105a9e:	8b 54 24 18          	mov    0x18(%esp),%edx
        kva += size;
        copied += size;
  105aa2:	01 54 24 1c          	add    %edx,0x1c(%esp)
    while (len) {
  105aa6:	83 c4 10             	add    $0x10,%esp
        uva += size;
  105aa9:	01 d7                	add    %edx,%edi
        kva += size;
  105aab:	01 d6                	add    %edx,%esi
    while (len) {
  105aad:	29 d5                	sub    %edx,%ebp
  105aaf:	74 3f                	je     105af0 <pt_copyin+0xe0>
        uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  105ab1:	83 ec 08             	sub    $0x8,%esp
  105ab4:	57                   	push   %edi
  105ab5:	ff 74 24 3c          	push   0x3c(%esp)
  105ab9:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  105abd:	e8 fe 0e 00 00       	call   1069c0 <get_ptbl_entry_by_va>
        if ((uva_pa & PTE_P) == 0) {
  105ac2:	83 c4 10             	add    $0x10,%esp
  105ac5:	a8 01                	test   $0x1,%al
  105ac7:	75 a7                	jne    105a70 <pt_copyin+0x60>
            alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  105ac9:	83 ec 04             	sub    $0x4,%esp
  105acc:	6a 07                	push   $0x7
  105ace:	57                   	push   %edi
  105acf:	ff 74 24 3c          	push   0x3c(%esp)
  105ad3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  105ad7:	e8 34 10 00 00       	call   106b10 <alloc_page>
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  105adc:	58                   	pop    %eax
  105add:	5a                   	pop    %edx
  105ade:	57                   	push   %edi
  105adf:	ff 74 24 3c          	push   0x3c(%esp)
  105ae3:	e8 d8 0e 00 00       	call   1069c0 <get_ptbl_entry_by_va>
  105ae8:	83 c4 10             	add    $0x10,%esp
  105aeb:	eb 83                	jmp    105a70 <pt_copyin+0x60>
  105aed:	8d 76 00             	lea    0x0(%esi),%esi
  105af0:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    }

    return copied;
}
  105af4:	83 c4 1c             	add    $0x1c,%esp
  105af7:	89 c8                	mov    %ecx,%eax
  105af9:	5b                   	pop    %ebx
  105afa:	5e                   	pop    %esi
  105afb:	5f                   	pop    %edi
  105afc:	5d                   	pop    %ebp
  105afd:	c3                   	ret
  105afe:	66 90                	xchg   %ax,%ax

00105b00 <pt_copyout>:

size_t pt_copyout(void *kva, uint32_t pmap_id, uintptr_t uva, size_t len)
{
    if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  105b00:	e8 95 a8 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  105b05:	05 ef e4 00 00       	add    $0xe4ef,%eax
{
  105b0a:	55                   	push   %ebp
        return 0;
  105b0b:	31 c9                	xor    %ecx,%ecx
{
  105b0d:	57                   	push   %edi
  105b0e:	56                   	push   %esi
  105b0f:	53                   	push   %ebx
  105b10:	83 ec 1c             	sub    $0x1c,%esp
  105b13:	8b 7c 24 38          	mov    0x38(%esp),%edi
  105b17:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
  105b1b:	89 44 24 04          	mov    %eax,0x4(%esp)
    if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  105b1f:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  105b25:	0f 86 b9 00 00 00    	jbe    105be4 <pt_copyout+0xe4>
  105b2b:	8d 04 2f             	lea    (%edi,%ebp,1),%eax
  105b2e:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  105b33:	0f 87 ab 00 00 00    	ja     105be4 <pt_copyout+0xe4>

    if ((uintptr_t) kva + len > VM_USERHI)
  105b39:	8b 44 24 30          	mov    0x30(%esp),%eax
  105b3d:	01 e8                	add    %ebp,%eax
  105b3f:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  105b44:	0f 87 9a 00 00 00    	ja     105be4 <pt_copyout+0xe4>
        return 0;

    size_t copied = 0;

    while (len) {
  105b4a:	85 ed                	test   %ebp,%ebp
  105b4c:	0f 84 92 00 00 00    	je     105be4 <pt_copyout+0xe4>
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
        }

        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);

        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105b52:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  105b56:	8b 74 24 30          	mov    0x30(%esp),%esi
  105b5a:	eb 45                	jmp    105ba1 <pt_copyout+0xa1>
  105b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  105b60:	89 f9                	mov    %edi,%ecx
        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105b62:	ba 00 10 00 00       	mov    $0x1000,%edx
        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  105b67:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  105b6c:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105b72:	29 ca                	sub    %ecx,%edx
        uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  105b74:	09 c8                	or     %ecx,%eax
        size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  105b76:	39 ea                	cmp    %ebp,%edx
  105b78:	0f 47 d5             	cmova  %ebp,%edx
            len : PAGESIZE - uva_pa % PAGESIZE;

        memcpy((void *) uva_pa, kva, size);
  105b7b:	83 ec 04             	sub    $0x4,%esp
  105b7e:	52                   	push   %edx
  105b7f:	89 54 24 10          	mov    %edx,0x10(%esp)
  105b83:	56                   	push   %esi
  105b84:	50                   	push   %eax
  105b85:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  105b89:	e8 42 e9 ff ff       	call   1044d0 <memcpy>

        len -= size;
        uva += size;
  105b8e:	8b 54 24 18          	mov    0x18(%esp),%edx
        kva += size;
        copied += size;
  105b92:	01 54 24 1c          	add    %edx,0x1c(%esp)
    while (len) {
  105b96:	83 c4 10             	add    $0x10,%esp
        uva += size;
  105b99:	01 d7                	add    %edx,%edi
        kva += size;
  105b9b:	01 d6                	add    %edx,%esi
    while (len) {
  105b9d:	29 d5                	sub    %edx,%ebp
  105b9f:	74 3f                	je     105be0 <pt_copyout+0xe0>
        uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  105ba1:	83 ec 08             	sub    $0x8,%esp
  105ba4:	57                   	push   %edi
  105ba5:	ff 74 24 40          	push   0x40(%esp)
  105ba9:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  105bad:	e8 0e 0e 00 00       	call   1069c0 <get_ptbl_entry_by_va>
        if ((uva_pa & PTE_P) == 0) {
  105bb2:	83 c4 10             	add    $0x10,%esp
  105bb5:	a8 01                	test   $0x1,%al
  105bb7:	75 a7                	jne    105b60 <pt_copyout+0x60>
            alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  105bb9:	83 ec 04             	sub    $0x4,%esp
  105bbc:	6a 07                	push   $0x7
  105bbe:	57                   	push   %edi
  105bbf:	ff 74 24 40          	push   0x40(%esp)
  105bc3:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  105bc7:	e8 44 0f 00 00       	call   106b10 <alloc_page>
            uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  105bcc:	58                   	pop    %eax
  105bcd:	5a                   	pop    %edx
  105bce:	57                   	push   %edi
  105bcf:	ff 74 24 40          	push   0x40(%esp)
  105bd3:	e8 e8 0d 00 00       	call   1069c0 <get_ptbl_entry_by_va>
  105bd8:	83 c4 10             	add    $0x10,%esp
  105bdb:	eb 83                	jmp    105b60 <pt_copyout+0x60>
  105bdd:	8d 76 00             	lea    0x0(%esi),%esi
  105be0:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    }

    return copied;
}
  105be4:	83 c4 1c             	add    $0x1c,%esp
  105be7:	89 c8                	mov    %ecx,%eax
  105be9:	5b                   	pop    %ebx
  105bea:	5e                   	pop    %esi
  105beb:	5f                   	pop    %edi
  105bec:	5d                   	pop    %ebp
  105bed:	c3                   	ret
  105bee:	66 90                	xchg   %ax,%ax

00105bf0 <pt_memset>:

size_t pt_memset(uint32_t pmap_id, uintptr_t va, char c, size_t len)
{
  105bf0:	55                   	push   %ebp
  105bf1:	57                   	push   %edi
  105bf2:	56                   	push   %esi
  105bf3:	53                   	push   %ebx
  105bf4:	e8 a9 a7 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105bf9:	81 c3 fb e3 00 00    	add    $0xe3fb,%ebx
  105bff:	83 ec 1c             	sub    $0x1c,%esp
  105c02:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  105c06:	8b 7c 24 34          	mov    0x34(%esp),%edi
  105c0a:	8b 44 24 38          	mov    0x38(%esp),%eax
    size_t set = 0;

    while (len) {
  105c0e:	85 f6                	test   %esi,%esi
  105c10:	0f 84 8a 00 00 00    	je     105ca0 <pt_memset+0xb0>
        pa = (pa & 0xfffff000) + (va % PAGESIZE);

        size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
            len : PAGESIZE - pa % PAGESIZE;

        memset((void *) pa, c, size);
  105c16:	0f be c0             	movsbl %al,%eax
    size_t set = 0;
  105c19:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  105c20:	00 
        memset((void *) pa, c, size);
  105c21:	89 44 24 0c          	mov    %eax,0xc(%esp)
  105c25:	eb 41                	jmp    105c68 <pt_memset+0x78>
  105c27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105c2e:	00 
  105c2f:	90                   	nop
        pa = (pa & 0xfffff000) + (va % PAGESIZE);
  105c30:	89 f9                	mov    %edi,%ecx
        size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  105c32:	ba 00 10 00 00       	mov    $0x1000,%edx
        pa = (pa & 0xfffff000) + (va % PAGESIZE);
  105c37:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  105c3c:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
        size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  105c42:	29 ca                	sub    %ecx,%edx
        pa = (pa & 0xfffff000) + (va % PAGESIZE);
  105c44:	09 c8                	or     %ecx,%eax
        size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  105c46:	39 f2                	cmp    %esi,%edx
  105c48:	0f 47 d6             	cmova  %esi,%edx
        memset((void *) pa, c, size);
  105c4b:	83 ec 04             	sub    $0x4,%esp
  105c4e:	52                   	push   %edx
        size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  105c4f:	89 d5                	mov    %edx,%ebp
        memset((void *) pa, c, size);
  105c51:	ff 74 24 14          	push   0x14(%esp)

        len -= size;
        va += size;
  105c55:	01 ef                	add    %ebp,%edi
        memset((void *) pa, c, size);
  105c57:	50                   	push   %eax
  105c58:	e8 c3 e7 ff ff       	call   104420 <memset>
        set += size;
  105c5d:	01 6c 24 18          	add    %ebp,0x18(%esp)
    while (len) {
  105c61:	83 c4 10             	add    $0x10,%esp
  105c64:	29 ee                	sub    %ebp,%esi
  105c66:	74 40                	je     105ca8 <pt_memset+0xb8>
        uintptr_t pa = get_ptbl_entry_by_va(pmap_id, va);
  105c68:	83 ec 08             	sub    $0x8,%esp
  105c6b:	57                   	push   %edi
  105c6c:	ff 74 24 3c          	push   0x3c(%esp)
  105c70:	e8 4b 0d 00 00       	call   1069c0 <get_ptbl_entry_by_va>
        if ((pa & PTE_P) == 0) {
  105c75:	83 c4 10             	add    $0x10,%esp
  105c78:	a8 01                	test   $0x1,%al
  105c7a:	75 b4                	jne    105c30 <pt_memset+0x40>
            alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
  105c7c:	83 ec 04             	sub    $0x4,%esp
  105c7f:	6a 07                	push   $0x7
  105c81:	57                   	push   %edi
  105c82:	ff 74 24 3c          	push   0x3c(%esp)
  105c86:	e8 85 0e 00 00       	call   106b10 <alloc_page>
            pa = get_ptbl_entry_by_va(pmap_id, va);
  105c8b:	58                   	pop    %eax
  105c8c:	5a                   	pop    %edx
  105c8d:	57                   	push   %edi
  105c8e:	ff 74 24 3c          	push   0x3c(%esp)
  105c92:	e8 29 0d 00 00       	call   1069c0 <get_ptbl_entry_by_va>
  105c97:	83 c4 10             	add    $0x10,%esp
  105c9a:	eb 94                	jmp    105c30 <pt_memset+0x40>
  105c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    size_t set = 0;
  105ca0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  105ca7:	00 
    }

    return set;
}
  105ca8:	8b 44 24 08          	mov    0x8(%esp),%eax
  105cac:	83 c4 1c             	add    $0x1c,%esp
  105caf:	5b                   	pop    %ebx
  105cb0:	5e                   	pop    %esi
  105cb1:	5f                   	pop    %edi
  105cb2:	5d                   	pop    %ebp
  105cb3:	c3                   	ret
  105cb4:	66 90                	xchg   %ax,%ax
  105cb6:	66 90                	xchg   %ax,%ax
  105cb8:	66 90                	xchg   %ax,%ax
  105cba:	66 90                	xchg   %ax,%ax
  105cbc:	66 90                	xchg   %ax,%ax
  105cbe:	66 90                	xchg   %ax,%ax

00105cc0 <elf_load>:

/*
 * Load elf execution file exe to the virtual address space pmap.
 */
void elf_load(void *exe_ptr, int pid)
{
  105cc0:	55                   	push   %ebp
  105cc1:	57                   	push   %edi
  105cc2:	56                   	push   %esi
  105cc3:	53                   	push   %ebx
  105cc4:	e8 d9 a6 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105cc9:	81 c3 2b e3 00 00    	add    $0xe32b,%ebx
  105ccf:	83 ec 2c             	sub    $0x2c,%esp
    char *strtab __attribute__((unused));
    uintptr_t exe = (uintptr_t) exe_ptr;

    eh = (elfhdr *) exe;

    KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  105cd2:	8b 44 24 40          	mov    0x40(%esp),%eax
{
  105cd6:	8b 6c 24 44          	mov    0x44(%esp),%ebp
    KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  105cda:	81 38 7f 45 4c 46    	cmpl   $0x464c457f,(%eax)
  105ce0:	74 1f                	je     105d01 <elf_load+0x41>
  105ce2:	8d 83 76 75 ff ff    	lea    -0x8a8a(%ebx),%eax
  105ce8:	50                   	push   %eax
  105ce9:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  105cef:	50                   	push   %eax
  105cf0:	8d 83 8f 75 ff ff    	lea    -0x8a71(%ebx),%eax
  105cf6:	6a 1e                	push   $0x1e
  105cf8:	50                   	push   %eax
  105cf9:	e8 e2 ea ff ff       	call   1047e0 <debug_panic>
  105cfe:	83 c4 10             	add    $0x10,%esp
    KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  105d01:	8b 44 24 40          	mov    0x40(%esp),%eax
  105d05:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  105d09:	66 85 c0             	test   %ax,%ax
  105d0c:	0f 84 b6 01 00 00    	je     105ec8 <elf_load+0x208>

    sh = (sechdr *) ((uintptr_t) eh + eh->e_shoff);
    esh = sh + eh->e_shnum;

    strtab = (char *) (exe + sh[eh->e_shstrndx].sh_offset);
    KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);
  105d12:	8b 4c 24 40          	mov    0x40(%esp),%ecx
  105d16:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105d19:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
  105d1c:	03 41 20             	add    0x20(%ecx),%eax
  105d1f:	83 78 04 03          	cmpl   $0x3,0x4(%eax)
  105d23:	74 1f                	je     105d44 <elf_load+0x84>
  105d25:	8d 83 40 82 ff ff    	lea    -0x7dc0(%ebx),%eax
  105d2b:	50                   	push   %eax
  105d2c:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  105d32:	50                   	push   %eax
  105d33:	8d 83 8f 75 ff ff    	lea    -0x8a71(%ebx),%eax
  105d39:	6a 25                	push   $0x25
  105d3b:	50                   	push   %eax
  105d3c:	e8 9f ea ff ff       	call   1047e0 <debug_panic>
  105d41:	83 c4 10             	add    $0x10,%esp

    ph = (proghdr *) ((uintptr_t) eh + eh->e_phoff);
  105d44:	8b 44 24 40          	mov    0x40(%esp),%eax
  105d48:	8b 50 1c             	mov    0x1c(%eax),%edx
  105d4b:	01 c2                	add    %eax,%edx
    eph = ph + eh->e_phnum;
  105d4d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  105d51:	c1 e0 05             	shl    $0x5,%eax
  105d54:	8d 0c 02             	lea    (%edx,%eax,1),%ecx

    for (; ph < eph; ph++) {
  105d57:	39 ca                	cmp    %ecx,%edx
  105d59:	0f 83 5c 01 00 00    	jae    105ebb <elf_load+0x1fb>
  105d5f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  105d63:	eb 12                	jmp    105d77 <elf_load+0xb7>
  105d65:	8d 76 00             	lea    0x0(%esi),%esi
  105d68:	8b 44 24 18          	mov    0x18(%esp),%eax
  105d6c:	83 c2 20             	add    $0x20,%edx
  105d6f:	39 c2                	cmp    %eax,%edx
  105d71:	0f 83 44 01 00 00    	jae    105ebb <elf_load+0x1fb>
        uintptr_t fa;
        uint32_t va, zva, eva, perm;

        if (ph->p_type != ELF_PROG_LOAD)
  105d77:	83 3a 01             	cmpl   $0x1,(%edx)
  105d7a:	75 ec                	jne    105d68 <elf_load+0xa8>
            continue;

        fa = (uintptr_t) eh + rounddown(ph->p_offset, PAGESIZE);
  105d7c:	83 ec 08             	sub    $0x8,%esp
  105d7f:	68 00 10 00 00       	push   $0x1000
  105d84:	ff 72 04             	push   0x4(%edx)
  105d87:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  105d8b:	e8 e0 f5 ff ff       	call   105370 <rounddown>
  105d90:	03 44 24 50          	add    0x50(%esp),%eax
        va = rounddown(ph->p_va, PAGESIZE);
  105d94:	5f                   	pop    %edi
        fa = (uintptr_t) eh + rounddown(ph->p_offset, PAGESIZE);
  105d95:	89 c6                	mov    %eax,%esi
        va = rounddown(ph->p_va, PAGESIZE);
  105d97:	58                   	pop    %eax
  105d98:	68 00 10 00 00       	push   $0x1000
  105d9d:	8b 54 24 18          	mov    0x18(%esp),%edx
  105da1:	ff 72 08             	push   0x8(%edx)
  105da4:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  105da8:	e8 c3 f5 ff ff       	call   105370 <rounddown>
        zva = ph->p_va + ph->p_filesz;
  105dad:	8b 54 24 1c          	mov    0x1c(%esp),%edx
        va = rounddown(ph->p_va, PAGESIZE);
  105db1:	89 c7                	mov    %eax,%edi
        zva = ph->p_va + ph->p_filesz;
  105db3:	8b 4a 10             	mov    0x10(%edx),%ecx
  105db6:	8b 42 08             	mov    0x8(%edx),%eax
  105db9:	01 c1                	add    %eax,%ecx
  105dbb:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
        eva = roundup(ph->p_va + ph->p_memsz, PAGESIZE);
  105dbf:	83 c4 08             	add    $0x8,%esp
  105dc2:	68 00 10 00 00       	push   $0x1000
  105dc7:	03 42 14             	add    0x14(%edx),%eax
  105dca:	89 54 24 20          	mov    %edx,0x20(%esp)
  105dce:	50                   	push   %eax
  105dcf:	e8 bc f5 ff ff       	call   105390 <roundup>

        perm = PTE_U | PTE_P;
        if (ph->p_flags & ELF_PROG_FLAG_WRITE)
  105dd4:	8b 54 24 24          	mov    0x24(%esp),%edx
        eva = roundup(ph->p_va + ph->p_memsz, PAGESIZE);
  105dd8:	89 44 24 20          	mov    %eax,0x20(%esp)
        if (ph->p_flags & ELF_PROG_FLAG_WRITE)
  105ddc:	83 c4 10             	add    $0x10,%esp
  105ddf:	8b 42 18             	mov    0x18(%edx),%eax
  105de2:	83 e0 02             	and    $0x2,%eax
        perm = PTE_U | PTE_P;
  105de5:	83 f8 01             	cmp    $0x1,%eax
            perm |= PTE_W;

        for (; va < eva; va += PAGESIZE, fa += PAGESIZE) {
  105de8:	8b 44 24 10          	mov    0x10(%esp),%eax
        perm = PTE_U | PTE_P;
  105dec:	19 c9                	sbb    %ecx,%ecx
  105dee:	83 e1 fe             	and    $0xfffffffe,%ecx
  105df1:	83 c1 07             	add    $0x7,%ecx
        for (; va < eva; va += PAGESIZE, fa += PAGESIZE) {
  105df4:	39 c7                	cmp    %eax,%edi
  105df6:	0f 83 6c ff ff ff    	jae    105d68 <elf_load+0xa8>
  105dfc:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  105e00:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  105e04:	eb 42                	jmp    105e48 <elf_load+0x188>
  105e06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105e0d:	00 
  105e0e:	66 90                	xchg   %ax,%ax
            alloc_page(pid, va, perm);

            if (va < rounddown(zva, PAGESIZE)) {
                /* copy a complete page */
                pt_copyout((void *) fa, pid, va, PAGESIZE);
            } else if (va < zva && ph->p_filesz) {
  105e10:	8b 44 24 0c          	mov    0xc(%esp),%eax
  105e14:	39 c7                	cmp    %eax,%edi
  105e16:	73 0b                	jae    105e23 <elf_load+0x163>
  105e18:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105e1c:	8b 40 10             	mov    0x10(%eax),%eax
  105e1f:	85 c0                	test   %eax,%eax
  105e21:	75 5d                	jne    105e80 <elf_load+0x1c0>
                /* copy a partial page */
                pt_memset(pid, va, 0, PAGESIZE);
                pt_copyout((void *) fa, pid, va, zva - va);
            } else {
                /* zero a page */
                pt_memset(pid, va, 0, PAGESIZE);
  105e23:	68 00 10 00 00       	push   $0x1000
  105e28:	6a 00                	push   $0x0
  105e2a:	57                   	push   %edi
  105e2b:	55                   	push   %ebp
  105e2c:	e8 bf fd ff ff       	call   105bf0 <pt_memset>
  105e31:	83 c4 10             	add    $0x10,%esp
        for (; va < eva; va += PAGESIZE, fa += PAGESIZE) {
  105e34:	8b 44 24 10          	mov    0x10(%esp),%eax
  105e38:	81 c7 00 10 00 00    	add    $0x1000,%edi
  105e3e:	81 c6 00 10 00 00    	add    $0x1000,%esi
  105e44:	39 c7                	cmp    %eax,%edi
  105e46:	73 60                	jae    105ea8 <elf_load+0x1e8>
            alloc_page(pid, va, perm);
  105e48:	83 ec 04             	sub    $0x4,%esp
  105e4b:	ff 74 24 18          	push   0x18(%esp)
  105e4f:	57                   	push   %edi
  105e50:	55                   	push   %ebp
  105e51:	e8 ba 0c 00 00       	call   106b10 <alloc_page>
            if (va < rounddown(zva, PAGESIZE)) {
  105e56:	5a                   	pop    %edx
  105e57:	59                   	pop    %ecx
  105e58:	68 00 10 00 00       	push   $0x1000
  105e5d:	ff 74 24 18          	push   0x18(%esp)
  105e61:	e8 0a f5 ff ff       	call   105370 <rounddown>
  105e66:	83 c4 10             	add    $0x10,%esp
  105e69:	39 c7                	cmp    %eax,%edi
  105e6b:	73 a3                	jae    105e10 <elf_load+0x150>
                pt_copyout((void *) fa, pid, va, PAGESIZE);
  105e6d:	68 00 10 00 00       	push   $0x1000
  105e72:	57                   	push   %edi
  105e73:	55                   	push   %ebp
  105e74:	56                   	push   %esi
  105e75:	e8 86 fc ff ff       	call   105b00 <pt_copyout>
  105e7a:	83 c4 10             	add    $0x10,%esp
  105e7d:	eb b5                	jmp    105e34 <elf_load+0x174>
  105e7f:	90                   	nop
                pt_memset(pid, va, 0, PAGESIZE);
  105e80:	68 00 10 00 00       	push   $0x1000
  105e85:	6a 00                	push   $0x0
  105e87:	57                   	push   %edi
  105e88:	55                   	push   %ebp
  105e89:	e8 62 fd ff ff       	call   105bf0 <pt_memset>
                pt_copyout((void *) fa, pid, va, zva - va);
  105e8e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105e92:	29 f8                	sub    %edi,%eax
  105e94:	50                   	push   %eax
  105e95:	57                   	push   %edi
  105e96:	55                   	push   %ebp
  105e97:	56                   	push   %esi
  105e98:	e8 63 fc ff ff       	call   105b00 <pt_copyout>
  105e9d:	83 c4 20             	add    $0x20,%esp
  105ea0:	eb 92                	jmp    105e34 <elf_load+0x174>
  105ea2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105ea8:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    for (; ph < eph; ph++) {
  105eac:	8b 44 24 18          	mov    0x18(%esp),%eax
  105eb0:	83 c2 20             	add    $0x20,%edx
  105eb3:	39 c2                	cmp    %eax,%edx
  105eb5:	0f 82 bc fe ff ff    	jb     105d77 <elf_load+0xb7>
            }
        }
    }
}
  105ebb:	83 c4 2c             	add    $0x2c,%esp
  105ebe:	5b                   	pop    %ebx
  105ebf:	5e                   	pop    %esi
  105ec0:	5f                   	pop    %edi
  105ec1:	5d                   	pop    %ebp
  105ec2:	c3                   	ret
  105ec3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  105ec8:	8d 83 20 82 ff ff    	lea    -0x7de0(%ebx),%eax
  105ece:	50                   	push   %eax
  105ecf:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  105ed5:	50                   	push   %eax
  105ed6:	8d 83 8f 75 ff ff    	lea    -0x8a71(%ebx),%eax
  105edc:	6a 1f                	push   $0x1f
  105ede:	50                   	push   %eax
  105edf:	e8 fc e8 ff ff       	call   1047e0 <debug_panic>
    strtab = (char *) (exe + sh[eh->e_shstrndx].sh_offset);
  105ee4:	8b 44 24 50          	mov    0x50(%esp),%eax
  105ee8:	83 c4 10             	add    $0x10,%esp
  105eeb:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  105eef:	e9 1e fe ff ff       	jmp    105d12 <elf_load+0x52>
  105ef4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105efb:	00 
  105efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105f00 <elf_entry>:

uintptr_t elf_entry(void *exe_ptr)
{
  105f00:	56                   	push   %esi
  105f01:	53                   	push   %ebx
  105f02:	e8 9b a4 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105f07:	81 c3 ed e0 00 00    	add    $0xe0ed,%ebx
  105f0d:	83 ec 04             	sub    $0x4,%esp
  105f10:	8b 74 24 10          	mov    0x10(%esp),%esi
    uintptr_t exe = (uintptr_t) exe_ptr;
    elfhdr *eh = (elfhdr *) exe;
    KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  105f14:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  105f1a:	74 1f                	je     105f3b <elf_entry+0x3b>
  105f1c:	8d 83 76 75 ff ff    	lea    -0x8a8a(%ebx),%eax
  105f22:	50                   	push   %eax
  105f23:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  105f29:	50                   	push   %eax
  105f2a:	8d 83 8f 75 ff ff    	lea    -0x8a71(%ebx),%eax
  105f30:	6a 50                	push   $0x50
  105f32:	50                   	push   %eax
  105f33:	e8 a8 e8 ff ff       	call   1047e0 <debug_panic>
  105f38:	83 c4 10             	add    $0x10,%esp
    return (uintptr_t) eh->e_entry;
  105f3b:	8b 46 18             	mov    0x18(%esi),%eax
}
  105f3e:	83 c4 04             	add    $0x4,%esp
  105f41:	5b                   	pop    %ebx
  105f42:	5e                   	pop    %esi
  105f43:	c3                   	ret
  105f44:	66 90                	xchg   %ax,%ax
  105f46:	66 90                	xchg   %ax,%ax
  105f48:	66 90                	xchg   %ax,%ax
  105f4a:	66 90                	xchg   %ax,%ax
  105f4c:	66 90                	xchg   %ax,%ax
  105f4e:	66 90                	xchg   %ax,%ax

00105f50 <get_kstack_pointer>:

struct kstack bsp_kstack[NUM_CPUS];
struct kstack proc_kstack[NUM_IDS];

uintptr_t *get_kstack_pointer(void)
{
  105f50:	53                   	push   %ebx
  105f51:	e8 4c a4 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105f56:	81 c3 9e e0 00 00    	add    $0xe09e,%ebx
  105f5c:	83 ec 08             	sub    $0x8,%esp
    return (uintptr_t *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  105f5f:	e8 4c f4 ff ff       	call   1053b0 <read_esp>
}
  105f64:	83 c4 08             	add    $0x8,%esp
    return (uintptr_t *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  105f67:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
  105f6c:	5b                   	pop    %ebx
  105f6d:	c3                   	ret
  105f6e:	66 90                	xchg   %ax,%ax

00105f70 <get_kstack_cpu_idx>:

int get_kstack_cpu_idx(void)
{
  105f70:	53                   	push   %ebx
  105f71:	e8 2c a4 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105f76:	81 c3 7e e0 00 00    	add    $0xe07e,%ebx
  105f7c:	83 ec 08             	sub    $0x8,%esp
    return (uintptr_t *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  105f7f:	e8 2c f4 ff ff       	call   1053b0 <read_esp>
  105f84:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    struct kstack *ks = (struct kstack *) get_kstack_pointer();
    return ks->cpu_idx;
  105f89:	8b 80 1c 01 00 00    	mov    0x11c(%eax),%eax
}
  105f8f:	83 c4 08             	add    $0x8,%esp
  105f92:	5b                   	pop    %ebx
  105f93:	c3                   	ret
  105f94:	66 90                	xchg   %ax,%ax
  105f96:	66 90                	xchg   %ax,%ax
  105f98:	66 90                	xchg   %ax,%ax
  105f9a:	66 90                	xchg   %ax,%ax
  105f9c:	66 90                	xchg   %ax,%ax
  105f9e:	66 90                	xchg   %ax,%ax

00105fa0 <spinlock_init>:
#include "spinlock.h"

extern volatile uint64_t tsc_per_ms;

void gcc_inline spinlock_init(spinlock_t *lk)
{
  105fa0:	8b 44 24 04          	mov    0x4(%esp),%eax
    lk->lock_holder = NUM_CPUS + 1;
  105fa4:	c7 00 09 00 00 00    	movl   $0x9,(%eax)
    lk->lock = 0;
  105faa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
  105fb1:	c3                   	ret
  105fb2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  105fb9:	00 
  105fba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105fc0 <spinlock_holding>:

bool gcc_inline spinlock_holding(spinlock_t *lk)
{
  105fc0:	57                   	push   %edi
  105fc1:	31 c0                	xor    %eax,%eax
  105fc3:	56                   	push   %esi
  105fc4:	53                   	push   %ebx
  105fc5:	8b 74 24 10          	mov    0x10(%esp),%esi
  105fc9:	e8 d4 a3 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  105fce:	81 c3 26 e0 00 00    	add    $0xe026,%ebx
    if (!lk->lock)
  105fd4:	8b 56 04             	mov    0x4(%esi),%edx
  105fd7:	85 d2                	test   %edx,%edx
  105fd9:	75 05                	jne    105fe0 <spinlock_holding+0x20>
        return FALSE;

    struct kstack *kstack = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
    KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
    return lk->lock_holder == kstack->cpu_idx;
}
  105fdb:	5b                   	pop    %ebx
  105fdc:	5e                   	pop    %esi
  105fdd:	5f                   	pop    %edi
  105fde:	c3                   	ret
  105fdf:	90                   	nop
    struct kstack *kstack = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  105fe0:	e8 cb f3 ff ff       	call   1053b0 <read_esp>
  105fe5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  105fea:	81 b8 20 01 00 00 32 	cmpl   $0x98765432,0x120(%eax)
  105ff1:	54 76 98 
    struct kstack *kstack = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  105ff4:	89 c7                	mov    %eax,%edi
    KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  105ff6:	74 1f                	je     106017 <spinlock_holding+0x57>
  105ff8:	8d 83 9e 75 ff ff    	lea    -0x8a62(%ebx),%eax
  105ffe:	50                   	push   %eax
  105fff:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  106005:	50                   	push   %eax
  106006:	8d 83 bc 75 ff ff    	lea    -0x8a44(%ebx),%eax
  10600c:	6a 16                	push   $0x16
  10600e:	50                   	push   %eax
  10600f:	e8 cc e7 ff ff       	call   1047e0 <debug_panic>
  106014:	83 c4 10             	add    $0x10,%esp
    return lk->lock_holder == kstack->cpu_idx;
  106017:	8b 87 1c 01 00 00    	mov    0x11c(%edi),%eax
  10601d:	39 06                	cmp    %eax,(%esi)
}
  10601f:	5b                   	pop    %ebx
    return lk->lock_holder == kstack->cpu_idx;
  106020:	0f 94 c0             	sete   %al
}
  106023:	5e                   	pop    %esi
  106024:	5f                   	pop    %edi
  106025:	c3                   	ret
  106026:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10602d:	00 
  10602e:	66 90                	xchg   %ax,%ax

00106030 <spinlock_acquire>:

    return spinlock_try_acquire_A(lk);
}
#else   /* DEBUG_LOCKHOLDING */
void gcc_inline spinlock_acquire(spinlock_t *lk)
{
  106030:	57                   	push   %edi
  106031:	56                   	push   %esi
  106032:	53                   	push   %ebx
  106033:	8b 7c 24 10          	mov    0x10(%esp),%edi
    while (xchg(&lk->lock, 1) != 0)
  106037:	e8 66 a3 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10603c:	81 c3 b8 df 00 00    	add    $0xdfb8,%ebx
  106042:	8d 77 04             	lea    0x4(%edi),%esi
  106045:	eb 0e                	jmp    106055 <spinlock_acquire+0x25>
  106047:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10604e:	00 
  10604f:	90                   	nop
        pause();
  106050:	e8 db f3 ff ff       	call   105430 <pause>
    while (xchg(&lk->lock, 1) != 0)
  106055:	83 ec 08             	sub    $0x8,%esp
  106058:	6a 01                	push   $0x1
  10605a:	56                   	push   %esi
  10605b:	e8 e0 f3 ff ff       	call   105440 <xchg>
  106060:	83 c4 10             	add    $0x10,%esp
  106063:	85 c0                	test   %eax,%eax
  106065:	75 e9                	jne    106050 <spinlock_acquire+0x20>
    struct kstack *kstack = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  106067:	e8 44 f3 ff ff       	call   1053b0 <read_esp>
  10606c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  106071:	81 b8 20 01 00 00 32 	cmpl   $0x98765432,0x120(%eax)
  106078:	54 76 98 
    struct kstack *kstack = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  10607b:	89 c6                	mov    %eax,%esi
    KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  10607d:	74 1f                	je     10609e <spinlock_acquire+0x6e>
  10607f:	8d 83 9e 75 ff ff    	lea    -0x8a62(%ebx),%eax
  106085:	50                   	push   %eax
  106086:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  10608c:	50                   	push   %eax
  10608d:	8d 83 bc 75 ff ff    	lea    -0x8a44(%ebx),%eax
  106093:	6a 2f                	push   $0x2f
  106095:	50                   	push   %eax
  106096:	e8 45 e7 ff ff       	call   1047e0 <debug_panic>
  10609b:	83 c4 10             	add    $0x10,%esp
    lk->lock_holder = kstack->cpu_idx;
  10609e:	8b 86 1c 01 00 00    	mov    0x11c(%esi),%eax
  1060a4:	89 07                	mov    %eax,(%edi)
    spinlock_acquire_A(lk);
}
  1060a6:	5b                   	pop    %ebx
  1060a7:	5e                   	pop    %esi
  1060a8:	5f                   	pop    %edi
  1060a9:	c3                   	ret
  1060aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001060b0 <spinlock_release>:

void gcc_inline spinlock_release(spinlock_t *lk)
{
  1060b0:	53                   	push   %ebx
  1060b1:	e8 ec a2 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1060b6:	81 c3 3e df 00 00    	add    $0xdf3e,%ebx
  1060bc:	83 ec 10             	sub    $0x10,%esp
  1060bf:	8b 44 24 18          	mov    0x18(%esp),%eax
    lk->lock_holder = NUM_CPUS + 1;
  1060c3:	c7 00 09 00 00 00    	movl   $0x9,(%eax)
    xchg(&lk->lock, 0);
  1060c9:	83 c0 04             	add    $0x4,%eax
  1060cc:	6a 00                	push   $0x0
  1060ce:	50                   	push   %eax
  1060cf:	e8 6c f3 ff ff       	call   105440 <xchg>
    spinlock_release_A(lk);
}
  1060d4:	83 c4 18             	add    $0x18,%esp
  1060d7:	5b                   	pop    %ebx
  1060d8:	c3                   	ret
  1060d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001060e0 <spinlock_try_acquire>:

int gcc_inline spinlock_try_acquire(spinlock_t *lk)
{
  1060e0:	55                   	push   %ebp
  1060e1:	57                   	push   %edi
  1060e2:	56                   	push   %esi
  1060e3:	53                   	push   %ebx
  1060e4:	e8 b9 a2 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1060e9:	81 c3 0b df 00 00    	add    $0xdf0b,%ebx
  1060ef:	83 ec 14             	sub    $0x14,%esp
  1060f2:	8b 7c 24 28          	mov    0x28(%esp),%edi
    uint32_t old_val = xchg(&lk->lock, 1);
  1060f6:	6a 01                	push   $0x1
  1060f8:	8d 47 04             	lea    0x4(%edi),%eax
  1060fb:	50                   	push   %eax
  1060fc:	e8 3f f3 ff ff       	call   105440 <xchg>
    if (old_val == 0) {
  106101:	83 c4 10             	add    $0x10,%esp
    uint32_t old_val = xchg(&lk->lock, 1);
  106104:	89 c6                	mov    %eax,%esi
    if (old_val == 0) {
  106106:	85 c0                	test   %eax,%eax
  106108:	74 0e                	je     106118 <spinlock_try_acquire+0x38>
    return spinlock_try_acquire_A(lk);
}
  10610a:	83 c4 0c             	add    $0xc,%esp
  10610d:	89 f0                	mov    %esi,%eax
  10610f:	5b                   	pop    %ebx
  106110:	5e                   	pop    %esi
  106111:	5f                   	pop    %edi
  106112:	5d                   	pop    %ebp
  106113:	c3                   	ret
  106114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        struct kstack *kstack = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  106118:	e8 93 f2 ff ff       	call   1053b0 <read_esp>
  10611d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
        KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  106122:	81 b8 20 01 00 00 32 	cmpl   $0x98765432,0x120(%eax)
  106129:	54 76 98 
        struct kstack *kstack = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  10612c:	89 c5                	mov    %eax,%ebp
        KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  10612e:	75 18                	jne    106148 <spinlock_try_acquire+0x68>
        lk->lock_holder = kstack->cpu_idx;
  106130:	8b 85 1c 01 00 00    	mov    0x11c(%ebp),%eax
  106136:	89 07                	mov    %eax,(%edi)
}
  106138:	83 c4 0c             	add    $0xc,%esp
  10613b:	89 f0                	mov    %esi,%eax
  10613d:	5b                   	pop    %ebx
  10613e:	5e                   	pop    %esi
  10613f:	5f                   	pop    %edi
  106140:	5d                   	pop    %ebp
  106141:	c3                   	ret
  106142:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  106148:	8d 83 9e 75 ff ff    	lea    -0x8a62(%ebx),%eax
  10614e:	50                   	push   %eax
  10614f:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  106155:	50                   	push   %eax
  106156:	8d 83 bc 75 ff ff    	lea    -0x8a44(%ebx),%eax
  10615c:	6a 39                	push   $0x39
  10615e:	50                   	push   %eax
  10615f:	e8 7c e6 ff ff       	call   1047e0 <debug_panic>
        lk->lock_holder = kstack->cpu_idx;
  106164:	8b 85 1c 01 00 00    	mov    0x11c(%ebp),%eax
        KERN_ASSERT(kstack->magic == KSTACK_MAGIC);
  10616a:	83 c4 10             	add    $0x10,%esp
        lk->lock_holder = kstack->cpu_idx;
  10616d:	89 07                	mov    %eax,(%edi)
  10616f:	eb c7                	jmp    106138 <spinlock_try_acquire+0x58>
  106171:	66 90                	xchg   %ax,%ax
  106173:	66 90                	xchg   %ax,%ax
  106175:	66 90                	xchg   %ax,%ax
  106177:	66 90                	xchg   %ax,%ax
  106179:	66 90                	xchg   %ax,%ax
  10617b:	66 90                	xchg   %ax,%ax
  10617d:	66 90                	xchg   %ax,%ax
  10617f:	90                   	nop

00106180 <reentrantlock_init>:
#include "reentrant_lock.h"

#define UNLOCKED    0xFFFFFFFF

void reentrantlock_init(reentrantlock *lk)
{
  106180:	8b 44 24 04          	mov    0x4(%esp),%eax
    lk->lock = UNLOCKED;
  106184:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    lk->count = 0u;
  10618a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
  106191:	c3                   	ret
  106192:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106199:	00 
  10619a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001061a0 <reentrantlock_holding>:

bool reentrantlock_holding(reentrantlock *lk)
{
    if (lk->count > 0u)
  1061a0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1061a4:	8b 40 04             	mov    0x4(%eax),%eax
  1061a7:	85 c0                	test   %eax,%eax
  1061a9:	0f 95 c0             	setne  %al
        return TRUE;
    else
        return FALSE;
}
  1061ac:	c3                   	ret
  1061ad:	8d 76 00             	lea    0x0(%esi),%esi

001061b0 <reentrantlock_acquire>:

void reentrantlock_acquire(reentrantlock *lk)
{
  1061b0:	57                   	push   %edi
  1061b1:	56                   	push   %esi
  1061b2:	53                   	push   %ebx
  1061b3:	8b 7c 24 10          	mov    0x10(%esp),%edi
  1061b7:	e8 e6 a1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1061bc:	81 c3 38 de 00 00    	add    $0xde38,%ebx
    uint32_t cpuid = get_kstack_cpu_idx();
  1061c2:	e8 a9 fd ff ff       	call   105f70 <get_kstack_cpu_idx>
  1061c7:	89 c6                	mov    %eax,%esi
  1061c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    uint32_t lv;

    do {
        lv = cmpxchg(&lk->lock, UNLOCKED, cpuid);
  1061d0:	83 ec 04             	sub    $0x4,%esp
  1061d3:	56                   	push   %esi
  1061d4:	6a ff                	push   $0xffffffff
  1061d6:	57                   	push   %edi
  1061d7:	e8 74 f2 ff ff       	call   105450 <cmpxchg>
    } while (lv != cpuid && lv != UNLOCKED);
  1061dc:	83 c4 10             	add    $0x10,%esp
  1061df:	39 c6                	cmp    %eax,%esi
  1061e1:	74 05                	je     1061e8 <reentrantlock_acquire+0x38>
  1061e3:	83 f8 ff             	cmp    $0xffffffff,%eax
  1061e6:	75 e8                	jne    1061d0 <reentrantlock_acquire+0x20>
    lk->count++;
  1061e8:	8b 47 04             	mov    0x4(%edi),%eax
  1061eb:	83 c0 01             	add    $0x1,%eax
  1061ee:	89 47 04             	mov    %eax,0x4(%edi)
}
  1061f1:	5b                   	pop    %ebx
  1061f2:	5e                   	pop    %esi
  1061f3:	5f                   	pop    %edi
  1061f4:	c3                   	ret
  1061f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1061fc:	00 
  1061fd:	8d 76 00             	lea    0x0(%esi),%esi

00106200 <reentrantlock_try_acquire>:

int reentrantlock_try_acquire(reentrantlock *lk)
{
  106200:	57                   	push   %edi
  106201:	56                   	push   %esi
  106202:	53                   	push   %ebx
  106203:	8b 7c 24 10          	mov    0x10(%esp),%edi
  106207:	e8 96 a1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10620c:	81 c3 e8 dd 00 00    	add    $0xdde8,%ebx
    uint32_t cpuid = get_kstack_cpu_idx();
  106212:	e8 59 fd ff ff       	call   105f70 <get_kstack_cpu_idx>
    uint32_t lv;

    lv = cmpxchg(&lk->lock, UNLOCKED, cpuid);
  106217:	83 ec 04             	sub    $0x4,%esp
  10621a:	50                   	push   %eax
    uint32_t cpuid = get_kstack_cpu_idx();
  10621b:	89 c6                	mov    %eax,%esi
    lv = cmpxchg(&lk->lock, UNLOCKED, cpuid);
  10621d:	6a ff                	push   $0xffffffff
  10621f:	57                   	push   %edi
  106220:	e8 2b f2 ff ff       	call   105450 <cmpxchg>

    if (lv == cpuid || lv == UNLOCKED) {
  106225:	83 c4 10             	add    $0x10,%esp
  106228:	39 c6                	cmp    %eax,%esi
  10622a:	74 14                	je     106240 <reentrantlock_try_acquire+0x40>
        lk->count++;
        return 1;
    } else
        return 0;
  10622c:	31 d2                	xor    %edx,%edx
    if (lv == cpuid || lv == UNLOCKED) {
  10622e:	83 f8 ff             	cmp    $0xffffffff,%eax
  106231:	74 0d                	je     106240 <reentrantlock_try_acquire+0x40>
}
  106233:	5b                   	pop    %ebx
  106234:	89 d0                	mov    %edx,%eax
  106236:	5e                   	pop    %esi
  106237:	5f                   	pop    %edi
  106238:	c3                   	ret
  106239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        lk->count++;
  106240:	8b 47 04             	mov    0x4(%edi),%eax
        return 1;
  106243:	ba 01 00 00 00       	mov    $0x1,%edx
        lk->count++;
  106248:	83 c0 01             	add    $0x1,%eax
  10624b:	89 47 04             	mov    %eax,0x4(%edi)
}
  10624e:	89 d0                	mov    %edx,%eax
  106250:	5b                   	pop    %ebx
  106251:	5e                   	pop    %esi
  106252:	5f                   	pop    %edi
  106253:	c3                   	ret
  106254:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10625b:	00 
  10625c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106260 <reentrantlock_release>:

void reentrantlock_release(reentrantlock *lk)
{
  106260:	53                   	push   %ebx
  106261:	e8 3c a1 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106266:	81 c3 8e dd 00 00    	add    $0xdd8e,%ebx
  10626c:	83 ec 08             	sub    $0x8,%esp
  10626f:	8b 44 24 10          	mov    0x10(%esp),%eax
    lk->count--;
  106273:	8b 50 04             	mov    0x4(%eax),%edx
  106276:	83 ea 01             	sub    $0x1,%edx
  106279:	89 50 04             	mov    %edx,0x4(%eax)
    if (lk->count == 0u) {
  10627c:	8b 50 04             	mov    0x4(%eax),%edx
  10627f:	85 d2                	test   %edx,%edx
  106281:	74 0d                	je     106290 <reentrantlock_release+0x30>
        xchg(&lk->lock, UNLOCKED);
    }
}
  106283:	83 c4 08             	add    $0x8,%esp
  106286:	5b                   	pop    %ebx
  106287:	c3                   	ret
  106288:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10628f:	00 
        xchg(&lk->lock, UNLOCKED);
  106290:	83 ec 08             	sub    $0x8,%esp
  106293:	6a ff                	push   $0xffffffff
  106295:	50                   	push   %eax
  106296:	e8 a5 f1 ff ff       	call   105440 <xchg>
  10629b:	83 c4 10             	add    $0x10,%esp
}
  10629e:	83 c4 08             	add    $0x8,%esp
  1062a1:	5b                   	pop    %ebx
  1062a2:	c3                   	ret
  1062a3:	66 90                	xchg   %ax,%ax
  1062a5:	66 90                	xchg   %ax,%ax
  1062a7:	66 90                	xchg   %ax,%ax
  1062a9:	66 90                	xchg   %ax,%ax
  1062ab:	66 90                	xchg   %ax,%ax
  1062ad:	66 90                	xchg   %ax,%ax
  1062af:	90                   	nop

001062b0 <pcpu_set_zero>:
struct pcpu pcpu[NUM_CPUS];

extern int get_kstack_cpu_idx(void);

void pcpu_set_zero()
{
  1062b0:	53                   	push   %ebx
  1062b1:	e8 ec a0 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1062b6:	81 c3 3e dd 00 00    	add    $0xdd3e,%ebx
  1062bc:	83 ec 10             	sub    $0x10,%esp
    memzero(pcpu, sizeof(struct pcpu) * NUM_CPUS);
  1062bf:	68 80 02 00 00       	push   $0x280
  1062c4:	8d 83 0c f0 08 00    	lea    0x8f00c(%ebx),%eax
  1062ca:	50                   	push   %eax
  1062cb:	e8 20 e3 ff ff       	call   1045f0 <memzero>
}
  1062d0:	83 c4 18             	add    $0x18,%esp
  1062d3:	5b                   	pop    %ebx
  1062d4:	c3                   	ret
  1062d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1062dc:	00 
  1062dd:	8d 76 00             	lea    0x0(%esi),%esi

001062e0 <pcpu_fields_init>:

void pcpu_fields_init(int cpu_idx)
{
    pcpu[cpu_idx].inited = TRUE;
  1062e0:	e8 fe ca ff ff       	call   102de3 <__x86.get_pc_thunk.cx>
  1062e5:	81 c1 0f dd 00 00    	add    $0xdd0f,%ecx
{
  1062eb:	8b 54 24 04          	mov    0x4(%esp),%edx
    pcpu[cpu_idx].inited = TRUE;
  1062ef:	8d 04 92             	lea    (%edx,%edx,4),%eax
  1062f2:	c1 e0 04             	shl    $0x4,%eax
  1062f5:	c6 84 01 0c f0 08 00 	movb   $0x1,0x8f00c(%ecx,%eax,1)
  1062fc:	01 
    pcpu[cpu_idx].cpu_idx = cpu_idx;
  1062fd:	89 94 01 58 f0 08 00 	mov    %edx,0x8f058(%ecx,%eax,1)
}
  106304:	c3                   	ret
  106305:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10630c:	00 
  10630d:	8d 76 00             	lea    0x0(%esi),%esi

00106310 <pcpu_cur>:

struct pcpu *pcpu_cur(void)
{
  106310:	53                   	push   %ebx
  106311:	e8 8c a0 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106316:	81 c3 de dc 00 00    	add    $0xdcde,%ebx
  10631c:	83 ec 08             	sub    $0x8,%esp
    int cpu_idx = get_kstack_cpu_idx();
  10631f:	e8 4c fc ff ff       	call   105f70 <get_kstack_cpu_idx>
    return &pcpu[cpu_idx];
}
  106324:	83 c4 08             	add    $0x8,%esp
    return &pcpu[cpu_idx];
  106327:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10632a:	c1 e0 04             	shl    $0x4,%eax
  10632d:	8d 84 03 0c f0 08 00 	lea    0x8f00c(%ebx,%eax,1),%eax
}
  106334:	5b                   	pop    %ebx
  106335:	c3                   	ret
  106336:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10633d:	00 
  10633e:	66 90                	xchg   %ax,%ax

00106340 <get_pcpu_idx>:

int get_pcpu_idx(void)
{
  106340:	53                   	push   %ebx
  106341:	e8 5c a0 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106346:	81 c3 ae dc 00 00    	add    $0xdcae,%ebx
  10634c:	83 ec 08             	sub    $0x8,%esp
    int cpu_idx = get_kstack_cpu_idx();
  10634f:	e8 1c fc ff ff       	call   105f70 <get_kstack_cpu_idx>
    return pcpu_cur()->cpu_idx;
  106354:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106357:	c1 e0 04             	shl    $0x4,%eax
  10635a:	8b 84 03 58 f0 08 00 	mov    0x8f058(%ebx,%eax,1),%eax
}
  106361:	83 c4 08             	add    $0x8,%esp
  106364:	5b                   	pop    %ebx
  106365:	c3                   	ret
  106366:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10636d:	00 
  10636e:	66 90                	xchg   %ax,%ax

00106370 <set_pcpu_idx>:

void set_pcpu_idx(int index, int cpu_idx)
{
    pcpu[index].cpu_idx = cpu_idx;
  106370:	e8 29 a0 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106375:	81 c2 7f dc 00 00    	add    $0xdc7f,%edx
{
  10637b:	8b 44 24 04          	mov    0x4(%esp),%eax
    pcpu[index].cpu_idx = cpu_idx;
  10637f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106383:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106386:	c1 e0 04             	shl    $0x4,%eax
  106389:	89 8c 02 58 f0 08 00 	mov    %ecx,0x8f058(%edx,%eax,1)
}
  106390:	c3                   	ret
  106391:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106398:	00 
  106399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001063a0 <get_pcpu_kstack_pointer>:

uintptr_t *get_pcpu_kstack_pointer(int cpu_idx)
{
    return pcpu[cpu_idx].kstack;
  1063a0:	e8 f9 9f ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  1063a5:	81 c2 4f dc 00 00    	add    $0xdc4f,%edx
{
  1063ab:	8b 44 24 04          	mov    0x4(%esp),%eax
    return pcpu[cpu_idx].kstack;
  1063af:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1063b2:	c1 e0 04             	shl    $0x4,%eax
  1063b5:	8b 84 02 10 f0 08 00 	mov    0x8f010(%edx,%eax,1),%eax
}
  1063bc:	c3                   	ret
  1063bd:	8d 76 00             	lea    0x0(%esi),%esi

001063c0 <set_pcpu_kstack_pointer>:

void set_pcpu_kstack_pointer(int cpu_idx, uintptr_t *ks)
{
    pcpu[cpu_idx].kstack = ks;
  1063c0:	e8 d9 9f ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  1063c5:	81 c2 2f dc 00 00    	add    $0xdc2f,%edx
{
  1063cb:	8b 44 24 04          	mov    0x4(%esp),%eax
    pcpu[cpu_idx].kstack = ks;
  1063cf:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1063d3:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1063d6:	c1 e0 04             	shl    $0x4,%eax
  1063d9:	89 8c 02 10 f0 08 00 	mov    %ecx,0x8f010(%edx,%eax,1)
}
  1063e0:	c3                   	ret
  1063e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1063e8:	00 
  1063e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001063f0 <get_pcpu_boot_info>:

volatile bool get_pcpu_boot_info(int cpu_idx)
{
    return pcpu[cpu_idx].booted;
  1063f0:	e8 a9 9f ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  1063f5:	81 c2 ff db 00 00    	add    $0xdbff,%edx
{
  1063fb:	8b 44 24 04          	mov    0x4(%esp),%eax
    return pcpu[cpu_idx].booted;
  1063ff:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106402:	c1 e0 04             	shl    $0x4,%eax
  106405:	8d 84 02 0c f0 08 00 	lea    0x8f00c(%edx,%eax,1),%eax
  10640c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
}
  106410:	c3                   	ret
  106411:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106418:	00 
  106419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106420 <set_pcpu_boot_info>:

void set_pcpu_boot_info(int cpu_idx, volatile bool boot_info)
{
    pcpu[cpu_idx].booted = boot_info;
  106420:	e8 be c9 ff ff       	call   102de3 <__x86.get_pc_thunk.cx>
  106425:	81 c1 cf db 00 00    	add    $0xdbcf,%ecx
{
  10642b:	83 ec 04             	sub    $0x4,%esp
  10642e:	8b 44 24 08          	mov    0x8(%esp),%eax
  106432:	8b 54 24 0c          	mov    0xc(%esp),%edx
    pcpu[cpu_idx].booted = boot_info;
  106436:	8d 04 80             	lea    (%eax,%eax,4),%eax
{
  106439:	88 14 24             	mov    %dl,(%esp)
    pcpu[cpu_idx].booted = boot_info;
  10643c:	0f b6 14 24          	movzbl (%esp),%edx
  106440:	c1 e0 04             	shl    $0x4,%eax
  106443:	8d 84 01 0c f0 08 00 	lea    0x8f00c(%ecx,%eax,1),%eax
  10644a:	88 50 01             	mov    %dl,0x1(%eax)
}
  10644d:	83 c4 04             	add    $0x4,%esp
  106450:	c3                   	ret
  106451:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106458:	00 
  106459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106460 <get_pcpu_cpu_vendor>:

cpu_vendor get_pcpu_cpu_vendor(int cpu_idx)
{
    return pcpu[cpu_idx].arch_info.cpu_vendor;
  106460:	e8 39 9f ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106465:	81 c2 8f db 00 00    	add    $0xdb8f,%edx
{
  10646b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return pcpu[cpu_idx].arch_info.cpu_vendor;
  10646f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106472:	c1 e0 04             	shl    $0x4,%eax
  106475:	8b 84 02 34 f0 08 00 	mov    0x8f034(%edx,%eax,1),%eax
}
  10647c:	c3                   	ret
  10647d:	8d 76 00             	lea    0x0(%esi),%esi

00106480 <get_pcpu_arch_info_pointer>:

uintptr_t *get_pcpu_arch_info_pointer(int cpu_idx)
{
    return (uintptr_t *) &pcpu[cpu_idx].arch_info;
  106480:	e8 19 9f ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106485:	81 c2 6f db 00 00    	add    $0xdb6f,%edx
{
  10648b:	8b 44 24 04          	mov    0x4(%esp),%eax
    return (uintptr_t *) &pcpu[cpu_idx].arch_info;
  10648f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  106492:	c1 e0 04             	shl    $0x4,%eax
  106495:	8d 84 02 14 f0 08 00 	lea    0x8f014(%edx,%eax,1),%eax
}
  10649c:	c3                   	ret
  10649d:	8d 76 00             	lea    0x0(%esi),%esi

001064a0 <get_pcpu_inited_info>:

bool get_pcpu_inited_info(int cpu_idx)
{
    return pcpu[cpu_idx].inited;
  1064a0:	e8 f9 9e ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  1064a5:	81 c2 4f db 00 00    	add    $0xdb4f,%edx
{
  1064ab:	8b 44 24 04          	mov    0x4(%esp),%eax
    return pcpu[cpu_idx].inited;
  1064af:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1064b2:	c1 e0 04             	shl    $0x4,%eax
  1064b5:	0f b6 84 02 0c f0 08 	movzbl 0x8f00c(%edx,%eax,1),%eax
  1064bc:	00 
}
  1064bd:	c3                   	ret
  1064be:	66 90                	xchg   %ax,%ax

001064c0 <pcpu_init>:
#include "import.h"

static bool pcpu_inited = FALSE;

void pcpu_init(void)
{
  1064c0:	55                   	push   %ebp
  1064c1:	57                   	push   %edi
  1064c2:	56                   	push   %esi
  1064c3:	53                   	push   %ebx
  1064c4:	e8 d9 9e ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1064c9:	81 c3 2b db 00 00    	add    $0xdb2b,%ebx
  1064cf:	83 ec 0c             	sub    $0xc,%esp
    struct kstack *ks = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  1064d2:	e8 d9 ee ff ff       	call   1053b0 <read_esp>
  1064d7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    int cpu_idx = ks->cpu_idx;
  1064dc:	8b b8 1c 01 00 00    	mov    0x11c(%eax),%edi
    struct kstack *ks = (struct kstack *) ROUNDDOWN(read_esp(), KSTACK_SIZE);
  1064e2:	89 c5                	mov    %eax,%ebp
    int i;

    if (cpu_idx == 0) {
  1064e4:	85 ff                	test   %edi,%edi
  1064e6:	75 33                	jne    10651b <pcpu_init+0x5b>
        if (pcpu_inited == TRUE)
  1064e8:	80 bb 8c f2 08 00 01 	cmpb   $0x1,0x8f28c(%ebx)
  1064ef:	74 4f                	je     106540 <pcpu_init+0x80>
            return;

        pcpu_set_zero();
  1064f1:	e8 ba fd ff ff       	call   1062b0 <pcpu_set_zero>

        /* Probe SMP. */
        pcpu_mp_init();

        for (i = 0; i < NUM_CPUS; i++) {
  1064f6:	31 f6                	xor    %esi,%esi
        pcpu_mp_init();
  1064f8:	e8 83 c9 ff ff       	call   102e80 <pcpu_mp_init>
        for (i = 0; i < NUM_CPUS; i++) {
  1064fd:	8d 76 00             	lea    0x0(%esi),%esi
            pcpu_fields_init(i);
  106500:	83 ec 0c             	sub    $0xc,%esp
  106503:	56                   	push   %esi
        for (i = 0; i < NUM_CPUS; i++) {
  106504:	83 c6 01             	add    $0x1,%esi
            pcpu_fields_init(i);
  106507:	e8 d4 fd ff ff       	call   1062e0 <pcpu_fields_init>
        for (i = 0; i < NUM_CPUS; i++) {
  10650c:	83 c4 10             	add    $0x10,%esp
  10650f:	83 fe 08             	cmp    $0x8,%esi
  106512:	75 ec                	jne    106500 <pcpu_init+0x40>
        }

        pcpu_inited = TRUE;
  106514:	c6 83 8c f2 08 00 01 	movb   $0x1,0x8f28c(%ebx)
    }

    set_pcpu_idx(cpu_idx, cpu_idx);
  10651b:	83 ec 08             	sub    $0x8,%esp
  10651e:	57                   	push   %edi
  10651f:	57                   	push   %edi
  106520:	e8 4b fe ff ff       	call   106370 <set_pcpu_idx>
    set_pcpu_kstack_pointer(cpu_idx, (uintptr_t *) ks);
  106525:	58                   	pop    %eax
  106526:	5a                   	pop    %edx
  106527:	55                   	push   %ebp
  106528:	57                   	push   %edi
  106529:	e8 92 fe ff ff       	call   1063c0 <set_pcpu_kstack_pointer>
    set_pcpu_boot_info(cpu_idx, TRUE);
  10652e:	59                   	pop    %ecx
  10652f:	5e                   	pop    %esi
  106530:	6a 01                	push   $0x1
  106532:	57                   	push   %edi
  106533:	e8 e8 fe ff ff       	call   106420 <set_pcpu_boot_info>
    pcpu_init_cpu();
  106538:	e8 53 d1 ff ff       	call   103690 <pcpu_init_cpu>
  10653d:	83 c4 10             	add    $0x10,%esp
}
  106540:	83 c4 0c             	add    $0xc,%esp
  106543:	5b                   	pop    %ebx
  106544:	5e                   	pop    %esi
  106545:	5f                   	pop    %edi
  106546:	5d                   	pop    %ebp
  106547:	c3                   	ret
  106548:	66 90                	xchg   %ax,%ax
  10654a:	66 90                	xchg   %ax,%ax
  10654c:	66 90                	xchg   %ax,%ax
  10654e:	66 90                	xchg   %ax,%ax

00106550 <kern_init>:
    monitor(NULL);
#endif
}

void kern_init(uintptr_t mbi_addr)
{
  106550:	56                   	push   %esi
  106551:	53                   	push   %ebx
  106552:	e8 4b 9e ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106557:	81 c3 9d da 00 00    	add    $0xda9d,%ebx
  10655d:	83 ec 10             	sub    $0x10,%esp
#if LAB == 1
    pmem_init(mbi_addr);
  106560:	ff 74 24 1c          	push   0x1c(%esp)
  106564:	e8 97 01 00 00       	call   106700 <pmem_init>
#endif
#else
    thread_init(mbi_addr);
#endif

    KERN_DEBUG("Kernel initialized.\n");
  106569:	8d b3 e5 75 ff ff    	lea    -0x8a1b(%ebx),%esi
  10656f:	83 c4 0c             	add    $0xc,%esp
  106572:	8d 83 d0 75 ff ff    	lea    -0x8a30(%ebx),%eax
  106578:	50                   	push   %eax
  106579:	68 90 00 00 00       	push   $0x90
  10657e:	56                   	push   %esi
  10657f:	e8 fc e1 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  106584:	83 c4 0c             	add    $0xc,%esp
  106587:	8d 83 f6 75 ff ff    	lea    -0x8a0a(%ebx),%eax
  10658d:	50                   	push   %eax
  10658e:	6a 76                	push   $0x76
  106590:	56                   	push   %esi
  106591:	e8 ea e1 ff ff       	call   104780 <debug_normal>
    monitor(NULL);
  106596:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10659d:	e8 9e f2 ff ff       	call   105840 <monitor>

    kern_main();
}
  1065a2:	83 c4 14             	add    $0x14,%esp
  1065a5:	5b                   	pop    %ebx
  1065a6:	5e                   	pop    %esi
  1065a7:	c3                   	ret
  1065a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1065af:	00 

001065b0 <kern_init_ap>:

void kern_init_ap(void (*f)(void))
{
  1065b0:	56                   	push   %esi
  1065b1:	53                   	push   %ebx
  1065b2:	e8 eb 9d ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1065b7:	81 c3 3d da 00 00    	add    $0xda3d,%ebx
  1065bd:	83 ec 04             	sub    $0x4,%esp
  1065c0:	8b 74 24 10          	mov    0x10(%esp),%esi
    devinit_ap();
  1065c4:	e8 77 a5 ff ff       	call   100b40 <devinit_ap>
    f();
}
  1065c9:	83 c4 04             	add    $0x4,%esp
    f();
  1065cc:	89 f0                	mov    %esi,%eax
}
  1065ce:	5b                   	pop    %ebx
  1065cf:	5e                   	pop    %esi
    f();
  1065d0:	ff e0                	jmp    *%eax
  1065d2:	66 90                	xchg   %ax,%ax
  1065d4:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  1065da:	00 00                	add    %al,(%eax)
  1065dc:	fb                   	sti
  1065dd:	4f                   	dec    %edi
  1065de:	52                   	push   %edx
  1065df:	e4                   	.byte 0xe4

001065e0 <start>:
	.long CHECKSUM

	/* this is the entry of the kernel */
	.globl start
start:
	cli
  1065e0:	fa                   	cli

	/* check whether the bootloader provide multiboot information */
	cmpl	$MULTIBOOT_BOOTLOADER_MAGIC, %eax
  1065e1:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
	jne	spin
  1065e6:	75 27                	jne    10660f <spin>
	movl	%ebx, multiboot_ptr
  1065e8:	89 1d 10 66 10 00    	mov    %ebx,0x106610

	/* tell BIOS to warmboot next time */
	movw	$0x1234, 0x472
  1065ee:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  1065f5:	34 12 

	/* clear EFLAGS */
	pushl	$0x2
  1065f7:	6a 02                	push   $0x2
	popfl
  1065f9:	9d                   	popf

	/* prepare the kernel stack */
	movl	$0x0, %ebp
  1065fa:	bd 00 00 00 00       	mov    $0x0,%ebp
	movl	$(bsp_kstack + 4096), %esp
  1065ff:	bc 00 c0 19 00       	mov    $0x19c000,%esp

	/* jump to the C code */
	push	multiboot_ptr
  106604:	ff 35 10 66 10 00    	push   0x106610
	call	kern_init
  10660a:	e8 41 ff ff ff       	call   106550 <kern_init>

0010660f <spin>:

	/* should not be here */
spin:
	hlt
  10660f:	f4                   	hlt

00106610 <multiboot_ptr>:
  106610:	00 00                	add    %al,(%eax)
  106612:	00 00                	add    %al,(%eax)
  106614:	66 90                	xchg   %ax,%ax
  106616:	66 90                	xchg   %ax,%ax
  106618:	66 90                	xchg   %ax,%ax
  10661a:	66 90                	xchg   %ax,%ax
  10661c:	66 90                	xchg   %ax,%ax
  10661e:	66 90                	xchg   %ax,%ax

00106620 <mem_spinlock_init>:
 * So it may have up to 2^20 physical pages,
 * with the page size being 4KB.
 */
static struct ATStruct AT[1 << 20];

void mem_spinlock_init(void) {
  106620:	53                   	push   %ebx
  106621:	e8 7c 9d ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106626:	81 c3 ce d9 00 00    	add    $0xd9ce,%ebx
  10662c:	83 ec 14             	sub    $0x14,%esp
    spinlock_init(&mem_lk);
  10662f:	8d 83 94 f2 08 00    	lea    0x8f294(%ebx),%eax
  106635:	50                   	push   %eax
  106636:	e8 65 f9 ff ff       	call   105fa0 <spinlock_init>
}
  10663b:	83 c4 18             	add    $0x18,%esp
  10663e:	5b                   	pop    %ebx
  10663f:	c3                   	ret

00106640 <mem_lock>:

void mem_lock(void) {
  106640:	53                   	push   %ebx
  106641:	e8 5c 9d ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106646:	81 c3 ae d9 00 00    	add    $0xd9ae,%ebx
  10664c:	83 ec 14             	sub    $0x14,%esp
    spinlock_acquire(&mem_lk);
  10664f:	8d 83 94 f2 08 00    	lea    0x8f294(%ebx),%eax
  106655:	50                   	push   %eax
  106656:	e8 d5 f9 ff ff       	call   106030 <spinlock_acquire>
}
  10665b:	83 c4 18             	add    $0x18,%esp
  10665e:	5b                   	pop    %ebx
  10665f:	c3                   	ret

00106660 <mem_unlock>:

void mem_unlock(void) {
  106660:	53                   	push   %ebx
  106661:	e8 3c 9d ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106666:	81 c3 8e d9 00 00    	add    $0xd98e,%ebx
  10666c:	83 ec 14             	sub    $0x14,%esp
    spinlock_release(&mem_lk);
  10666f:	8d 83 94 f2 08 00    	lea    0x8f294(%ebx),%eax
  106675:	50                   	push   %eax
  106676:	e8 35 fa ff ff       	call   1060b0 <spinlock_release>
}
  10667b:	83 c4 18             	add    $0x18,%esp
  10667e:	5b                   	pop    %ebx
  10667f:	c3                   	ret

00106680 <get_nps>:

// The getter function for NUM_PAGES.
unsigned int get_nps(void)
{
    return NUM_PAGES;
  106680:	e8 15 9d ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  106685:	05 6f d9 00 00       	add    $0xd96f,%eax
  10668a:	8b 80 90 f2 08 00    	mov    0x8f290(%eax),%eax
}
  106690:	c3                   	ret
  106691:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106698:	00 
  106699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001066a0 <set_nps>:

// The setter function for NUM_PAGES.
void set_nps(unsigned int nps)
{
    NUM_PAGES = nps;
  1066a0:	e8 f5 9c ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  1066a5:	05 4f d9 00 00       	add    $0xd94f,%eax
  1066aa:	8b 54 24 04          	mov    0x4(%esp),%edx
  1066ae:	89 90 90 f2 08 00    	mov    %edx,0x8f290(%eax)
}
  1066b4:	c3                   	ret
  1066b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066bc:	00 
  1066bd:	8d 76 00             	lea    0x0(%esi),%esi

001066c0 <at_is_norm>:
 */
unsigned int at_is_norm(unsigned int page_index)
{
    // TODO [Lab 1]
    return 0;
}
  1066c0:	31 c0                	xor    %eax,%eax
  1066c2:	c3                   	ret
  1066c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066ca:	00 
  1066cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001066d0 <at_set_perm>:
 * It also marks the page as unallocated.
 */
void at_set_perm(unsigned int page_index, unsigned int perm)
{
    // TODO [Lab 1]
}
  1066d0:	c3                   	ret
  1066d1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066d8:	00 
  1066d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001066e0 <at_is_allocated>:

/**
 * The getter function for the physical page allocation flag.
 * Returns 0 if the page is not allocated, otherwise returns 1.
 */
unsigned int at_is_allocated(unsigned int page_index)
  1066e0:	31 c0                	xor    %eax,%eax
  1066e2:	c3                   	ret
  1066e3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1066ea:	00 
  1066eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001066f0 <at_set_allocated>:

/**
 * The setter function for the physical page allocation flag.
 * Set the flag of the page with given index to the given value.
 */
void at_set_allocated(unsigned int page_index, unsigned int allocated)
  1066f0:	c3                   	ret
  1066f1:	66 90                	xchg   %ax,%ax
  1066f3:	66 90                	xchg   %ax,%ax
  1066f5:	66 90                	xchg   %ax,%ax
  1066f7:	66 90                	xchg   %ax,%ax
  1066f9:	66 90                	xchg   %ax,%ax
  1066fb:	66 90                	xchg   %ax,%ax
  1066fd:	66 90                	xchg   %ax,%ax
  1066ff:	90                   	nop

00106700 <pmem_init>:
 *    based on the information available in the physical memory map table.
 *    Review import.h in the current directory for the list of available
 *    getter and setter functions.
 */
void pmem_init(unsigned int mbi_addr)
{
  106700:	53                   	push   %ebx
  106701:	e8 9c 9c ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106706:	81 c3 ee d8 00 00    	add    $0xd8ee,%ebx
  10670c:	83 ec 14             	sub    $0x14,%esp

    // TODO [Lab 1]: Define your local variables here.

    // Calls the lower layer initialization primitive.
    // The parameter mbi_addr should not be used in the further code.
    devinit(mbi_addr);
  10670f:	ff 74 24 1c          	push   0x1c(%esp)
  106713:	e8 68 a3 ff ff       	call   100a80 <devinit>
    mem_spinlock_init();
  106718:	e8 03 ff ff ff       	call   106620 <mem_spinlock_init>
     * Hint: Think of it as the highest address in the ranges of the memory map table,
     *       divided by the page size.
     */
    // TODO [Lab 1]

    set_nps(nps);  // Setting the value computed above to NUM_PAGES.
  10671d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  106724:	e8 77 ff ff ff       	call   1066a0 <set_nps>
     *    not aligned by pages, so it may be possible that for some pages, only some of
     *    the addresses are in a usable range. Currently, we do not utilize partial pages,
     *    so in that case, you should consider those pages as unavailable.
     */
    // TODO [Lab 1]
}
  106729:	83 c4 18             	add    $0x18,%esp
  10672c:	5b                   	pop    %ebx
  10672d:	c3                   	ret
  10672e:	66 90                	xchg   %ax,%ax

00106730 <palloc>:
 * Note: palloc may run on several CPUs at the same time (lab 6), so the
 * allocation table is protected by mem_lock() / mem_unlock(). Keep your code
 * between the two calls and do not return in between.
 */
unsigned int palloc()
{
  106730:	53                   	push   %ebx
  106731:	e8 6c 9c ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106736:	81 c3 be d8 00 00    	add    $0xd8be,%ebx
  10673c:	83 ec 08             	sub    $0x8,%esp
    unsigned int palloc_free_index = 0;

    mem_lock();
  10673f:	e8 fc fe ff ff       	call   106640 <mem_lock>

    // TODO [Lab 1]

    mem_unlock();
  106744:	e8 17 ff ff ff       	call   106660 <mem_unlock>

    return palloc_free_index;
}
  106749:	83 c4 08             	add    $0x8,%esp
  10674c:	31 c0                	xor    %eax,%eax
  10674e:	5b                   	pop    %ebx
  10674f:	c3                   	ret

00106750 <pfree>:
 * in the allocation table.
 *
 * Hint: Simple.
 */
void pfree(unsigned int pfree_index)
{
  106750:	53                   	push   %ebx
  106751:	e8 4c 9c ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106756:	81 c3 9e d8 00 00    	add    $0xd89e,%ebx
  10675c:	83 ec 08             	sub    $0x8,%esp
    mem_lock();
  10675f:	e8 dc fe ff ff       	call   106640 <mem_lock>
    // TODO [Lab 1]
    mem_unlock();
  106764:	e8 f7 fe ff ff       	call   106660 <mem_unlock>
}
  106769:	83 c4 08             	add    $0x8,%esp
  10676c:	5b                   	pop    %ebx
  10676d:	c3                   	ret
  10676e:	66 90                	xchg   %ax,%ax

00106770 <container_init>:
/**
 * Initializes the container data for the root process (the one with index 0).
 * The root process is the one that gets spawned first by the kernel.
 */
void container_init(unsigned int mbi_addr)
{
  106770:	57                   	push   %edi
  106771:	56                   	push   %esi
  106772:	53                   	push   %ebx
  106773:	e8 2a 9c ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106778:	81 c3 7c d8 00 00    	add    $0xd87c,%ebx
    unsigned int real_quota;
    unsigned int idx;
    // TODO [Lab 2]: define your local variables here.

    pmem_init(mbi_addr);
  10677e:	83 ec 0c             	sub    $0xc,%esp
  106781:	ff 74 24 1c          	push   0x1c(%esp)
  106785:	e8 76 ff ff ff       	call   106700 <pmem_init>
     * TODO [Lab 2]: Compute the available quota and store it into the variable real_quota.
     * It should be the number of the unallocated pages with the normal permission
     * in the physical memory allocation table.
     */

    KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  10678a:	8d 83 08 76 ff ff    	lea    -0x89f8(%ebx),%eax
  106790:	6a 00                	push   $0x0
  106792:	8d b3 ac f2 08 00    	lea    0x8f2ac(%ebx),%esi
  106798:	50                   	push   %eax
  106799:	8d 83 70 82 ff ff    	lea    -0x7d90(%ebx),%eax
  10679f:	8d be 00 02 00 00    	lea    0x200(%esi),%edi
  1067a5:	6a 25                	push   $0x25
  1067a7:	50                   	push   %eax
  1067a8:	e8 d3 df ff ff       	call   104780 <debug_normal>

    CONTAINER[0].quota = real_quota;
  1067ad:	83 c4 20             	add    $0x20,%esp
  1067b0:	c7 83 ac f4 08 00 00 	movl   $0x0,0x8f4ac(%ebx)
  1067b7:	00 00 00 
    CONTAINER[0].usage = 0;
  1067ba:	c7 83 b0 f4 08 00 00 	movl   $0x0,0x8f4b0(%ebx)
  1067c1:	00 00 00 
    CONTAINER[0].parent = 0;
  1067c4:	c7 83 b4 f4 08 00 00 	movl   $0x0,0x8f4b4(%ebx)
  1067cb:	00 00 00 
    CONTAINER[0].nchildren = 0;
  1067ce:	c7 83 b8 f4 08 00 00 	movl   $0x0,0x8f4b8(%ebx)
  1067d5:	00 00 00 
    CONTAINER[0].used = 1;
  1067d8:	c7 83 bc f4 08 00 01 	movl   $0x1,0x8f4bc(%ebx)
  1067df:	00 00 00 

    for (idx = 0; idx < NUM_IDS; idx++) {
  1067e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        spinlock_init(&container_lks[idx]);
  1067e8:	83 ec 0c             	sub    $0xc,%esp
  1067eb:	56                   	push   %esi
    for (idx = 0; idx < NUM_IDS; idx++) {
  1067ec:	83 c6 08             	add    $0x8,%esi
        spinlock_init(&container_lks[idx]);
  1067ef:	e8 ac f7 ff ff       	call   105fa0 <spinlock_init>
    for (idx = 0; idx < NUM_IDS; idx++) {
  1067f4:	83 c4 10             	add    $0x10,%esp
  1067f7:	39 fe                	cmp    %edi,%esi
  1067f9:	75 ed                	jne    1067e8 <container_init+0x78>
    }
}
  1067fb:	5b                   	pop    %ebx
  1067fc:	5e                   	pop    %esi
  1067fd:	5f                   	pop    %edi
  1067fe:	c3                   	ret
  1067ff:	90                   	nop

00106800 <container_get_parent>:
// Get the id of parent process of process # [id].
unsigned int container_get_parent(unsigned int id)
{
    // TODO [Lab 2]
    return 0;
}
  106800:	31 c0                	xor    %eax,%eax
  106802:	c3                   	ret
  106803:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10680a:	00 
  10680b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106810 <container_get_nchildren>:

// Get the number of children of process # [id].
unsigned int container_get_nchildren(unsigned int id)
  106810:	31 c0                	xor    %eax,%eax
  106812:	c3                   	ret
  106813:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10681a:	00 
  10681b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106820 <container_get_quota>:
    // TODO [Lab 2]
    return 0;
}

// Get the maximum memory quota of process # [id].
unsigned int container_get_quota(unsigned int id)
  106820:	31 c0                	xor    %eax,%eax
  106822:	c3                   	ret
  106823:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10682a:	00 
  10682b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106830 <container_get_usage>:
    // TODO [Lab 2]
    return 0;
}

// Get the current memory usage of process # [id].
unsigned int container_get_usage(unsigned int id)
  106830:	31 c0                	xor    %eax,%eax
  106832:	c3                   	ret
  106833:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10683a:	00 
  10683b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106840 <container_can_consume>:
// [n] pages of memory. If so, returns 1, otherwise, returns 0.
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
    // TODO [Lab 2]
    return 0;
}
  106840:	31 c0                	xor    %eax,%eax
  106842:	c3                   	ret
  106843:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10684a:	00 
  10684b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106850 <container_split>:
 * You can assume it is safe to allocate [quota] pages
 * (the check is already done outside before calling this function).
 * Returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  106850:	57                   	push   %edi
  106851:	56                   	push   %esi
  106852:	53                   	push   %ebx
  106853:	8b 74 24 10          	mov    0x10(%esp),%esi
  106857:	e8 46 9b ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10685c:	81 c3 98 d7 00 00    	add    $0xd798,%ebx
    unsigned int child, nc;

    spinlock_acquire(&container_lks[id]);
  106862:	83 ec 0c             	sub    $0xc,%esp
  106865:	8d bc f3 ac f2 08 00 	lea    0x8f2ac(%ebx,%esi,8),%edi
  10686c:	57                   	push   %edi
  10686d:	e8 be f7 ff ff       	call   106030 <spinlock_acquire>

    nc = CONTAINER[id].nchildren;
  106872:	8d 14 b6             	lea    (%esi,%esi,4),%edx
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  106875:	8d 44 76 01          	lea    0x1(%esi,%esi,2),%eax

    if (NUM_IDS <= child) {
  106879:	83 c4 10             	add    $0x10,%esp
    child = id * MAX_CHILDREN + 1 + nc;  // container index for the child process
  10687c:	03 84 93 b8 f4 08 00 	add    0x8f4b8(%ebx,%edx,4),%eax
    if (NUM_IDS <= child) {
  106883:	83 f8 3f             	cmp    $0x3f,%eax
  106886:	77 18                	ja     1068a0 <container_split+0x50>

    /**
     * TODO [Lab 2]: Update the container structure of both parent and child process appropriately.
     */

    spinlock_release(&container_lks[id]);
  106888:	83 ec 0c             	sub    $0xc,%esp
  10688b:	89 c6                	mov    %eax,%esi
  10688d:	57                   	push   %edi
  10688e:	e8 1d f8 ff ff       	call   1060b0 <spinlock_release>

    return child;
  106893:	83 c4 10             	add    $0x10,%esp
}
  106896:	89 f0                	mov    %esi,%eax
  106898:	5b                   	pop    %ebx
  106899:	5e                   	pop    %esi
  10689a:	5f                   	pop    %edi
  10689b:	c3                   	ret
  10689c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        spinlock_release(&container_lks[id]);
  1068a0:	83 ec 0c             	sub    $0xc,%esp
        return NUM_IDS;
  1068a3:	be 40 00 00 00       	mov    $0x40,%esi
        spinlock_release(&container_lks[id]);
  1068a8:	57                   	push   %edi
  1068a9:	e8 02 f8 ff ff       	call   1060b0 <spinlock_release>
        return NUM_IDS;
  1068ae:	83 c4 10             	add    $0x10,%esp
}
  1068b1:	89 f0                	mov    %esi,%eax
  1068b3:	5b                   	pop    %ebx
  1068b4:	5e                   	pop    %esi
  1068b5:	5f                   	pop    %edi
  1068b6:	c3                   	ret
  1068b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1068be:	00 
  1068bf:	90                   	nop

001068c0 <container_alloc>:
 *
 * Note: the container of process # [id] is protected by container_lks[id]
 * (lab 6); keep your code between the acquire and the release.
 */
unsigned int container_alloc(unsigned int id)
{
  1068c0:	56                   	push   %esi
  1068c1:	53                   	push   %ebx
  1068c2:	e8 db 9a ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1068c7:	81 c3 2d d7 00 00    	add    $0xd72d,%ebx
  1068cd:	83 ec 10             	sub    $0x10,%esp
    unsigned int page_index = 0;

    spinlock_acquire(&container_lks[id]);
  1068d0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1068d4:	8d b4 c3 ac f2 08 00 	lea    0x8f2ac(%ebx,%eax,8),%esi
  1068db:	56                   	push   %esi
  1068dc:	e8 4f f7 ff ff       	call   106030 <spinlock_acquire>

    /*
     * TODO [Lab 2]: Implement the function here.
     */

    spinlock_release(&container_lks[id]);
  1068e1:	89 34 24             	mov    %esi,(%esp)
  1068e4:	e8 c7 f7 ff ff       	call   1060b0 <spinlock_release>

    return page_index;
}
  1068e9:	83 c4 14             	add    $0x14,%esp
  1068ec:	31 c0                	xor    %eax,%eax
  1068ee:	5b                   	pop    %ebx
  1068ef:	5e                   	pop    %esi
  1068f0:	c3                   	ret
  1068f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1068f8:	00 
  1068f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106900 <container_free>:

// Frees the physical page and reduces the usage by 1.
void container_free(unsigned int id, unsigned int page_index)
{
  106900:	56                   	push   %esi
  106901:	53                   	push   %ebx
  106902:	e8 9b 9a ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106907:	81 c3 ed d6 00 00    	add    $0xd6ed,%ebx
  10690d:	83 ec 10             	sub    $0x10,%esp
    spinlock_acquire(&container_lks[id]);
  106910:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  106914:	8d b4 c3 ac f2 08 00 	lea    0x8f2ac(%ebx,%eax,8),%esi
  10691b:	56                   	push   %esi
  10691c:	e8 0f f7 ff ff       	call   106030 <spinlock_acquire>

    // TODO [Lab 2]

    spinlock_release(&container_lks[id]);
  106921:	89 34 24             	mov    %esi,(%esp)
  106924:	e8 87 f7 ff ff       	call   1060b0 <spinlock_release>
}
  106929:	83 c4 14             	add    $0x14,%esp
  10692c:	5b                   	pop    %ebx
  10692d:	5e                   	pop    %esi
  10692e:	c3                   	ret
  10692f:	90                   	nop

00106930 <set_pdir_base>:

// Sets the CR3 register with the start address of the page structure for process # [index].
void set_pdir_base(unsigned int index)
{
    // TODO [Lab 2]
}
  106930:	c3                   	ret
  106931:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106938:	00 
  106939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106940 <get_pdir_entry>:
// This can be used to test whether the page directory entry is mapped.
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
    // TODO [Lab 2]
    return 0;
}
  106940:	31 c0                	xor    %eax,%eax
  106942:	c3                   	ret
  106943:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10694a:	00 
  10694b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106950 <set_pdir_entry>:
// You should also set the permissions PTE_P, PTE_W, and PTE_U.
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int page_index)
{
    // TODO [Lab 2]
}
  106950:	c3                   	ret
  106951:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106958:	00 
  106959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106960 <set_pdir_entry_identity>:
// You should also set the permissions PTE_P, PTE_W, and PTE_U.
// This will be used to map a page directory entry to an identity page table.
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{
    // TODO [Lab 2]
}
  106960:	c3                   	ret
  106961:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106968:	00 
  106969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106970 <rmv_pdir_entry>:

// Removes the specified page directory entry (sets the page directory entry to 0).
// Don't forget to cast the value to (unsigned int *).
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
  106970:	c3                   	ret
  106971:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106978:	00 
  106979:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106980 <get_ptbl_entry>:
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                            unsigned int pte_index)
{
    // TODO [Lab 2]
    return 0;
}
  106980:	31 c0                	xor    %eax,%eax
  106982:	c3                   	ret
  106983:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10698a:	00 
  10698b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106990 <set_ptbl_entry>:
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
                    unsigned int pte_index, unsigned int page_index,
                    unsigned int perm)
{
    // TODO [Lab 2]
}
  106990:	c3                   	ret
  106991:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106998:	00 
  106999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001069a0 <set_ptbl_entry_identity>:

// Sets up the specified page table entry in IDPTbl as the identity map.
// You should also set the given permission.
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index,
  1069a0:	c3                   	ret
  1069a1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1069a8:	00 
  1069a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001069b0 <rmv_ptbl_entry>:
{
    // TODO [Lab 2]
}

// Sets the specified page table entry to 0.
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index,
  1069b0:	c3                   	ret
  1069b1:	66 90                	xchg   %ax,%ax
  1069b3:	66 90                	xchg   %ax,%ax
  1069b5:	66 90                	xchg   %ax,%ax
  1069b7:	66 90                	xchg   %ax,%ax
  1069b9:	66 90                	xchg   %ax,%ax
  1069bb:	66 90                	xchg   %ax,%ax
  1069bd:	66 90                	xchg   %ax,%ax
  1069bf:	90                   	nop

001069c0 <get_ptbl_entry_by_va>:
 */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO [Lab 3]
    return 0;
}
  1069c0:	31 c0                	xor    %eax,%eax
  1069c2:	c3                   	ret
  1069c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1069ca:	00 
  1069cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001069d0 <get_pdir_entry_by_va>:

// Returns the page directory entry corresponding to the given virtual address.
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
  1069d0:	31 c0                	xor    %eax,%eax
  1069d2:	c3                   	ret
  1069d3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1069da:	00 
  1069db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001069e0 <rmv_ptbl_entry_by_va>:

// Removes the page table entry for the given virtual address.
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
    // TODO [Lab 3]
}
  1069e0:	c3                   	ret
  1069e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1069e8:	00 
  1069e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001069f0 <rmv_pdir_entry_by_va>:

// Removes the page directory entry for the given virtual address.
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
  1069f0:	c3                   	ret
  1069f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1069f8:	00 
  1069f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106a00 <set_ptbl_entry_by_va>:
// You do not need to worry about the page directory entry. just map the page table entry.
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index, unsigned int perm)
{
    // TODO [Lab 3]
}
  106a00:	c3                   	ret
  106a01:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106a08:	00 
  106a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106a10 <set_pdir_entry_by_va>:
// Registers the mapping from [vaddr] to physical page # [page_index] in the page directory.
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index)
{
    // TODO [Lab 3]
}
  106a10:	c3                   	ret
  106a11:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106a18:	00 
  106a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106a20 <idptbl_init>:

// Initializes the identity page table.
// The permission for the kernel memory should be PTE_P, PTE_W, and PTE_G,
// While the permission for the rest should be PTE_P and PTE_W.
void idptbl_init(unsigned int mbi_addr)
{
  106a20:	53                   	push   %ebx
  106a21:	e8 7c 99 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106a26:	81 c3 ce d5 00 00    	add    $0xd5ce,%ebx
  106a2c:	83 ec 14             	sub    $0x14,%esp
    // TODO [Lab 3]: Define your local variables here.

    container_init(mbi_addr);
  106a2f:	ff 74 24 1c          	push   0x1c(%esp)
  106a33:	e8 38 fd ff ff       	call   106770 <container_init>

    // TODO [Lab 3]
}
  106a38:	83 c4 18             	add    $0x18,%esp
  106a3b:	5b                   	pop    %ebx
  106a3c:	c3                   	ret
  106a3d:	66 90                	xchg   %ax,%ax
  106a3f:	90                   	nop

00106a40 <pdir_init>:
 * For each process from id 0 to NUM_IDS - 1,
 * set up the page directory entries so that the kernel portion of the map is
 * the identity map, and the rest of the page directories are unmapped.
 */
void pdir_init(unsigned int mbi_addr)
{
  106a40:	53                   	push   %ebx
  106a41:	e8 5c 99 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106a46:	81 c3 ae d5 00 00    	add    $0xd5ae,%ebx
  106a4c:	83 ec 14             	sub    $0x14,%esp
    // TODO [Lab 3]: Define your local variables here.

    idptbl_init(mbi_addr);
  106a4f:	ff 74 24 1c          	push   0x1c(%esp)
  106a53:	e8 c8 ff ff ff       	call   106a20 <idptbl_init>

    // TODO [Lab 3]
}
  106a58:	83 c4 18             	add    $0x18,%esp
  106a5b:	5b                   	pop    %ebx
  106a5c:	c3                   	ret
  106a5d:	8d 76 00             	lea    0x0(%esi),%esi

00106a60 <alloc_ptbl>:
 */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr)
{
    // TODO [Lab 3]
    return 0;
}
  106a60:	31 c0                	xor    %eax,%eax
  106a62:	c3                   	ret
  106a63:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106a6a:	00 
  106a6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106a70 <free_ptbl>:
// Removes corresponding the page directory entry,
// and frees the page for the page table entries (with container_free).
void free_ptbl(unsigned int proc_index, unsigned int vaddr)
{
    // TODO [Lab 3]
}
  106a70:	c3                   	ret
  106a71:	66 90                	xchg   %ax,%ax
  106a73:	66 90                	xchg   %ax,%ax
  106a75:	66 90                	xchg   %ax,%ax
  106a77:	66 90                	xchg   %ax,%ax
  106a79:	66 90                	xchg   %ax,%ax
  106a7b:	66 90                	xchg   %ax,%ax
  106a7d:	66 90                	xchg   %ax,%ax
  106a7f:	90                   	nop

00106a80 <pdir_init_kern>:
/**
 * Sets the entire page map for process 0 as the identity map.
 * Note that part of the task is already completed by pdir_init.
 */
void pdir_init_kern(unsigned int mbi_addr)
{
  106a80:	53                   	push   %ebx
  106a81:	e8 1c 99 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106a86:	81 c3 6e d5 00 00    	add    $0xd56e,%ebx
  106a8c:	83 ec 14             	sub    $0x14,%esp
    // TODO [Lab 3]: Define your local variables here.

    pdir_init(mbi_addr);
  106a8f:	ff 74 24 1c          	push   0x1c(%esp)
  106a93:	e8 a8 ff ff ff       	call   106a40 <pdir_init>

    // TODO [Lab 3]
}
  106a98:	83 c4 18             	add    $0x18,%esp
  106a9b:	5b                   	pop    %ebx
  106a9c:	c3                   	ret
  106a9d:	8d 76 00             	lea    0x0(%esi),%esi

00106aa0 <map_page>:
unsigned int map_page(unsigned int proc_index, unsigned int vaddr,
                      unsigned int page_index, unsigned int perm)
{
    // TODO [Lab 3]
    return 0;
}
  106aa0:	31 c0                	xor    %eax,%eax
  106aa2:	c3                   	ret
  106aa3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106aaa:	00 
  106aab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106ab0 <unmap_page>:
 */
unsigned int unmap_page(unsigned int proc_index, unsigned int vaddr)
{
    // TODO [Lab 3]
    return 0;
}
  106ab0:	31 c0                	xor    %eax,%eax
  106ab2:	c3                   	ret
  106ab3:	66 90                	xchg   %ax,%ax
  106ab5:	66 90                	xchg   %ax,%ax
  106ab7:	66 90                	xchg   %ax,%ax
  106ab9:	66 90                	xchg   %ax,%ax
  106abb:	66 90                	xchg   %ax,%ax
  106abd:	66 90                	xchg   %ax,%ax
  106abf:	90                   	nop

00106ac0 <paging_init>:
/**
 * Initializes the page structures, moves to the kernel page structure (0),
 * and turns on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  106ac0:	53                   	push   %ebx
  106ac1:	e8 dc 98 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106ac6:	81 c3 2e d5 00 00    	add    $0xd52e,%ebx
  106acc:	83 ec 14             	sub    $0x14,%esp
    pdir_init_kern(mbi_addr);
  106acf:	ff 74 24 1c          	push   0x1c(%esp)
  106ad3:	e8 a8 ff ff ff       	call   106a80 <pdir_init_kern>
    set_pdir_base(0);
  106ad8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  106adf:	e8 4c fe ff ff       	call   106930 <set_pdir_base>
    enable_paging();
  106ae4:	e8 d7 a6 ff ff       	call   1011c0 <enable_paging>
}
  106ae9:	83 c4 18             	add    $0x18,%esp
  106aec:	5b                   	pop    %ebx
  106aed:	c3                   	ret
  106aee:	66 90                	xchg   %ax,%ax

00106af0 <paging_init_ap>:

void paging_init_ap(void)
{
  106af0:	53                   	push   %ebx
  106af1:	e8 ac 98 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106af6:	81 c3 fe d4 00 00    	add    $0xd4fe,%ebx
  106afc:	83 ec 14             	sub    $0x14,%esp
    set_pdir_base(0);
  106aff:	6a 00                	push   $0x0
  106b01:	e8 2a fe ff ff       	call   106930 <set_pdir_base>
    enable_paging();
  106b06:	e8 b5 a6 ff ff       	call   1011c0 <enable_paging>
}
  106b0b:	83 c4 18             	add    $0x18,%esp
  106b0e:	5b                   	pop    %ebx
  106b0f:	c3                   	ret

00106b10 <alloc_page>:
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr,
                        unsigned int perm)
{
    // TODO [Lab 3]
    return 0;
}
  106b10:	31 c0                	xor    %eax,%eax
  106b12:	c3                   	ret
  106b13:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106b1a:	00 
  106b1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106b20 <alloc_mem_quota>:

/**
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota)
{
  106b20:	53                   	push   %ebx
  106b21:	e8 7c 98 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106b26:	81 c3 ce d4 00 00    	add    $0xd4ce,%ebx
  106b2c:	83 ec 10             	sub    $0x10,%esp
    unsigned int child;
    child = container_split(id, quota);
  106b2f:	ff 74 24 1c          	push   0x1c(%esp)
  106b33:	ff 74 24 1c          	push   0x1c(%esp)
  106b37:	e8 14 fd ff ff       	call   106850 <container_split>
    return child;
}
  106b3c:	83 c4 18             	add    $0x18,%esp
  106b3f:	5b                   	pop    %ebx
  106b40:	c3                   	ret
  106b41:	66 90                	xchg   %ax,%ax
  106b43:	66 90                	xchg   %ax,%ax
  106b45:	66 90                	xchg   %ax,%ax
  106b47:	66 90                	xchg   %ax,%ax
  106b49:	66 90                	xchg   %ax,%ax
  106b4b:	66 90                	xchg   %ax,%ax
  106b4d:	66 90                	xchg   %ax,%ax
  106b4f:	90                   	nop

00106b50 <kctx_set_esp>:
// Memory to save the NUM_IDS kernel thread states.
struct kctx kctx_pool[NUM_IDS];

void kctx_set_esp(unsigned int pid, void *esp)
{
    kctx_pool[pid].esp = esp;
  106b50:	e8 49 98 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106b55:	81 c2 9f d4 00 00    	add    $0xd49f,%edx
{
  106b5b:	8b 44 24 04          	mov    0x4(%esp),%eax
    kctx_pool[pid].esp = esp;
  106b5f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106b63:	8d 04 40             	lea    (%eax,%eax,2),%eax
  106b66:	89 8c c2 0c 00 4d 00 	mov    %ecx,0x4d000c(%edx,%eax,8)
}
  106b6d:	c3                   	ret
  106b6e:	66 90                	xchg   %ax,%ax

00106b70 <kctx_set_eip>:

void kctx_set_eip(unsigned int pid, void *eip)
{
    kctx_pool[pid].eip = eip;
  106b70:	e8 29 98 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106b75:	81 c2 7f d4 00 00    	add    $0xd47f,%edx
{
  106b7b:	8b 44 24 04          	mov    0x4(%esp),%eax
    kctx_pool[pid].eip = eip;
  106b7f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106b83:	8d 04 40             	lea    (%eax,%eax,2),%eax
  106b86:	89 8c c2 20 00 4d 00 	mov    %ecx,0x4d0020(%edx,%eax,8)
}
  106b8d:	c3                   	ret
  106b8e:	66 90                	xchg   %ax,%ax

00106b90 <kctx_switch>:
/**
 * Saves the states for thread # [from_pid] and restores the states
 * for thread # [to_pid].
 */
void kctx_switch(unsigned int from_pid, unsigned int to_pid)
{
  106b90:	53                   	push   %ebx
  106b91:	e8 0c 98 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106b96:	81 c3 5e d4 00 00    	add    $0xd45e,%ebx
  106b9c:	83 ec 10             	sub    $0x10,%esp
  106b9f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  106ba3:	8b 54 24 18          	mov    0x18(%esp),%edx
    cswitch(&kctx_pool[from_pid], &kctx_pool[to_pid]);
  106ba7:	8d 0c 40             	lea    (%eax,%eax,2),%ecx
  106baa:	8d 14 52             	lea    (%edx,%edx,2),%edx
  106bad:	8d 83 0c 00 4d 00    	lea    0x4d000c(%ebx),%eax
  106bb3:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  106bb6:	8d 04 d0             	lea    (%eax,%edx,8),%eax
  106bb9:	51                   	push   %ecx
  106bba:	50                   	push   %eax
  106bbb:	e8 05 00 00 00       	call   106bc5 <cswitch>
}
  106bc0:	83 c4 18             	add    $0x18,%esp
  106bc3:	5b                   	pop    %ebx
  106bc4:	c3                   	ret

00106bc5 <cswitch>:
/*
 * void cswitch(struct kctx *from, struct kctx *to);
 */
	.globl cswitch
cswitch:
	movl	4(%esp), %eax	/* %eax <- from */
  106bc5:	8b 44 24 04          	mov    0x4(%esp),%eax
	movl	8(%esp), %edx	/* %edx <- to */
  106bc9:	8b 54 24 08          	mov    0x8(%esp),%edx

	/* save the old kernel context */
	movl	0(%esp), %ecx
  106bcd:	8b 0c 24             	mov    (%esp),%ecx
	movl	%ecx, 20(%eax)
  106bd0:	89 48 14             	mov    %ecx,0x14(%eax)
	movl	%ebp, 16(%eax)
  106bd3:	89 68 10             	mov    %ebp,0x10(%eax)
	movl	%ebx, 12(%eax)
  106bd6:	89 58 0c             	mov    %ebx,0xc(%eax)
	movl	%esi, 8(%eax)
  106bd9:	89 70 08             	mov    %esi,0x8(%eax)
	movl	%edi, 4(%eax)
  106bdc:	89 78 04             	mov    %edi,0x4(%eax)
	movl	%esp, 0(%eax)
  106bdf:	89 20                	mov    %esp,(%eax)

	/* load the new kernel context */
	movl	0(%edx), %esp
  106be1:	8b 22                	mov    (%edx),%esp
	movl	4(%edx), %edi
  106be3:	8b 7a 04             	mov    0x4(%edx),%edi
	movl	8(%edx), %esi
  106be6:	8b 72 08             	mov    0x8(%edx),%esi
	movl	12(%edx), %ebx
  106be9:	8b 5a 0c             	mov    0xc(%edx),%ebx
	movl	16(%edx), %ebp
  106bec:	8b 6a 10             	mov    0x10(%edx),%ebp
	movl	20(%edx), %ecx
  106bef:	8b 4a 14             	mov    0x14(%edx),%ecx
	movl	%ecx, 0(%esp)
  106bf2:	89 0c 24             	mov    %ecx,(%esp)

	xor	%eax, %eax
  106bf5:	31 c0                	xor    %eax,%eax
	ret
  106bf7:	c3                   	ret
  106bf8:	66 90                	xchg   %ax,%ax
  106bfa:	66 90                	xchg   %ax,%ax
  106bfc:	66 90                	xchg   %ax,%ax
  106bfe:	66 90                	xchg   %ax,%ax

00106c00 <kctx_new>:
 */
unsigned int kctx_new(void *entry, unsigned int id, unsigned int quota)
{
    // TODO [Lab 4]
    return 0;
}
  106c00:	31 c0                	xor    %eax,%eax
  106c02:	c3                   	ret
  106c03:	66 90                	xchg   %ax,%ax
  106c05:	66 90                	xchg   %ax,%ax
  106c07:	66 90                	xchg   %ax,%ax
  106c09:	66 90                	xchg   %ax,%ax
  106c0b:	66 90                	xchg   %ax,%ax
  106c0d:	66 90                	xchg   %ax,%ax
  106c0f:	90                   	nop

00106c10 <tcb_get_state>:

struct TCB TCBPool[NUM_IDS];

unsigned int tcb_get_state(unsigned int pid)
{
    return TCBPool[pid].state;
  106c10:	e8 89 97 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106c15:	81 c2 df d3 00 00    	add    $0xd3df,%edx
  106c1b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106c20:	8b 84 02 0c 06 4d 00 	mov    0x4d060c(%edx,%eax,1),%eax
}
  106c27:	c3                   	ret
  106c28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106c2f:	00 

00106c30 <tcb_set_state>:

void tcb_set_state(unsigned int pid, unsigned int state)
{
    TCBPool[pid].state = state;
  106c30:	e8 69 97 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106c35:	81 c2 bf d3 00 00    	add    $0xd3bf,%edx
  106c3b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106c40:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106c44:	89 8c 02 0c 06 4d 00 	mov    %ecx,0x4d060c(%edx,%eax,1)
}
  106c4b:	c3                   	ret
  106c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106c50 <tcb_get_cpu>:

unsigned int tcb_get_cpu(unsigned int pid)
{
    return TCBPool[pid].cpuid;
  106c50:	e8 49 97 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106c55:	81 c2 9f d3 00 00    	add    $0xd39f,%edx
  106c5b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106c60:	8b 84 02 10 06 4d 00 	mov    0x4d0610(%edx,%eax,1),%eax
}
  106c67:	c3                   	ret
  106c68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106c6f:	00 

00106c70 <tcb_set_cpu>:

void tcb_set_cpu(unsigned int pid, unsigned int cpu)
{
    TCBPool[pid].cpuid = cpu;
  106c70:	e8 29 97 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106c75:	81 c2 7f d3 00 00    	add    $0xd37f,%edx
  106c7b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106c80:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106c84:	89 8c 02 10 06 4d 00 	mov    %ecx,0x4d0610(%edx,%eax,1)
}
  106c8b:	c3                   	ret
  106c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106c90 <tcb_get_prev>:

unsigned int tcb_get_prev(unsigned int pid)
{
    return TCBPool[pid].prev;
  106c90:	e8 09 97 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106c95:	81 c2 5f d3 00 00    	add    $0xd35f,%edx
  106c9b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106ca0:	8b 84 02 14 06 4d 00 	mov    0x4d0614(%edx,%eax,1),%eax
}
  106ca7:	c3                   	ret
  106ca8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106caf:	00 

00106cb0 <tcb_set_prev>:

void tcb_set_prev(unsigned int pid, unsigned int prev_pid)
{
    TCBPool[pid].prev = prev_pid;
  106cb0:	e8 e9 96 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106cb5:	81 c2 3f d3 00 00    	add    $0xd33f,%edx
  106cbb:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106cc0:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106cc4:	89 8c 02 14 06 4d 00 	mov    %ecx,0x4d0614(%edx,%eax,1)
}
  106ccb:	c3                   	ret
  106ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106cd0 <tcb_get_next>:

unsigned int tcb_get_next(unsigned int pid)
{
    return TCBPool[pid].next;
  106cd0:	e8 c9 96 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106cd5:	81 c2 1f d3 00 00    	add    $0xd31f,%edx
  106cdb:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106ce0:	8b 84 02 18 06 4d 00 	mov    0x4d0618(%edx,%eax,1),%eax
}
  106ce7:	c3                   	ret
  106ce8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106cef:	00 

00106cf0 <tcb_set_next>:

void tcb_set_next(unsigned int pid, unsigned int next_pid)
{
    TCBPool[pid].next = next_pid;
  106cf0:	e8 a9 96 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106cf5:	81 c2 ff d2 00 00    	add    $0xd2ff,%edx
  106cfb:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106d00:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106d04:	89 8c 02 18 06 4d 00 	mov    %ecx,0x4d0618(%edx,%eax,1)
}
  106d0b:	c3                   	ret
  106d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106d10 <tcb_init_at_id>:

void tcb_init_at_id(unsigned int pid)
{
  106d10:	57                   	push   %edi
    TCBPool[pid].state = TSTATE_DEAD;
  106d11:	8d 3d 0c 06 4d 00    	lea    0x4d060c,%edi
{
  106d17:	56                   	push   %esi
  106d18:	53                   	push   %ebx
    TCBPool[pid].state = TSTATE_DEAD;
  106d19:	6b 44 24 10 58       	imul   $0x58,0x10(%esp),%eax
  106d1e:	e8 7f 96 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106d23:	81 c3 d1 d2 00 00    	add    $0xd2d1,%ebx
    TCBPool[pid].cpuid = NUM_CPUS;
    TCBPool[pid].prev = NUM_IDS;
    TCBPool[pid].next = NUM_IDS;
    TCBPool[pid].channel = 0;
    memzero(TCBPool[pid].openfiles, sizeof *TCBPool[pid].openfiles);
  106d29:	83 ec 08             	sub    $0x8,%esp
    TCBPool[pid].state = TSTATE_DEAD;
  106d2c:	8d 14 3b             	lea    (%ebx,%edi,1),%edx
    TCBPool[pid].cpuid = NUM_CPUS;
  106d2f:	8d 34 18             	lea    (%eax,%ebx,1),%esi
  106d32:	01 fe                	add    %edi,%esi
    TCBPool[pid].state = TSTATE_DEAD;
  106d34:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    memzero(TCBPool[pid].openfiles, sizeof *TCBPool[pid].openfiles);
  106d37:	8d 44 02 14          	lea    0x14(%edx,%eax,1),%eax
    TCBPool[pid].state = TSTATE_DEAD;
  106d3b:	c7 01 03 00 00 00    	movl   $0x3,(%ecx)
    TCBPool[pid].cpuid = NUM_CPUS;
  106d41:	c7 46 04 08 00 00 00 	movl   $0x8,0x4(%esi)
    TCBPool[pid].prev = NUM_IDS;
  106d48:	c7 46 08 40 00 00 00 	movl   $0x40,0x8(%esi)
    TCBPool[pid].next = NUM_IDS;
  106d4f:	c7 46 0c 40 00 00 00 	movl   $0x40,0xc(%esi)
    TCBPool[pid].channel = 0;
  106d56:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
    memzero(TCBPool[pid].openfiles, sizeof *TCBPool[pid].openfiles);
  106d5d:	6a 04                	push   $0x4
  106d5f:	50                   	push   %eax
  106d60:	e8 8b d8 ff ff       	call   1045f0 <memzero>
    TCBPool[pid].cwd = namei("/");
  106d65:	8d 83 1a 76 ff ff    	lea    -0x89e6(%ebx),%eax
  106d6b:	89 04 24             	mov    %eax,(%esp)
  106d6e:	e8 8d 23 00 00       	call   109100 <namei>
}
  106d73:	83 c4 10             	add    $0x10,%esp
    TCBPool[pid].cwd = namei("/");
  106d76:	89 46 54             	mov    %eax,0x54(%esi)
}
  106d79:	5b                   	pop    %ebx
  106d7a:	5e                   	pop    %esi
  106d7b:	5f                   	pop    %edi
  106d7c:	c3                   	ret
  106d7d:	8d 76 00             	lea    0x0(%esi),%esi

00106d80 <tcb_get_chan>:

void *tcb_get_chan(unsigned int pid)
{
    return TCBPool[pid].channel;
  106d80:	e8 19 96 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106d85:	81 c2 6f d2 00 00    	add    $0xd26f,%edx
  106d8b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106d90:	8b 84 02 1c 06 4d 00 	mov    0x4d061c(%edx,%eax,1),%eax
}
  106d97:	c3                   	ret
  106d98:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106d9f:	00 

00106da0 <tcb_set_chan>:

void tcb_set_chan(unsigned int pid, void *chan)
{
    TCBPool[pid].channel = chan;
  106da0:	e8 f9 95 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106da5:	81 c2 4f d2 00 00    	add    $0xd24f,%edx
  106dab:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106db0:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106db4:	89 8c 02 1c 06 4d 00 	mov    %ecx,0x4d061c(%edx,%eax,1)
}
  106dbb:	c3                   	ret
  106dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106dc0 <tcb_get_openfiles>:

struct file **tcb_get_openfiles(unsigned int pid)
{
    return TCBPool[pid].openfiles;
  106dc0:	e8 d9 95 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106dc5:	81 c2 2f d2 00 00    	add    $0xd22f,%edx
  106dcb:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106dd0:	8d 84 02 20 06 4d 00 	lea    0x4d0620(%edx,%eax,1),%eax
}
  106dd7:	c3                   	ret
  106dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106ddf:	00 

00106de0 <tcb_set_openfiles>:

void tcb_set_openfiles(unsigned int pid, int fd, struct file *f)
{
    TCBPool[pid].openfiles[fd] = f;
  106de0:	e8 b9 95 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106de5:	81 c2 0f d2 00 00    	add    $0xd20f,%edx
  106deb:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  106def:	6b 44 24 04 16       	imul   $0x16,0x4(%esp),%eax
  106df4:	03 44 24 08          	add    0x8(%esp),%eax
  106df8:	89 8c 82 20 06 4d 00 	mov    %ecx,0x4d0620(%edx,%eax,4)
}
  106dff:	c3                   	ret

00106e00 <tcb_get_cwd>:

struct inode *tcb_get_cwd(unsigned int pid)
{
    return TCBPool[pid].cwd;
  106e00:	e8 99 95 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106e05:	81 c2 ef d1 00 00    	add    $0xd1ef,%edx
  106e0b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106e10:	8b 84 02 60 06 4d 00 	mov    0x4d0660(%edx,%eax,1),%eax
}
  106e17:	c3                   	ret
  106e18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106e1f:	00 

00106e20 <tcb_set_cwd>:

void tcb_set_cwd(unsigned int pid, struct inode *d)
{
    TCBPool[pid].cwd = d;
  106e20:	e8 79 95 ff ff       	call   10039e <__x86.get_pc_thunk.dx>
  106e25:	81 c2 cf d1 00 00    	add    $0xd1cf,%edx
  106e2b:	6b 44 24 04 58       	imul   $0x58,0x4(%esp),%eax
  106e30:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106e34:	89 8c 02 60 06 4d 00 	mov    %ecx,0x4d0660(%edx,%eax,1)
}
  106e3b:	c3                   	ret
  106e3c:	66 90                	xchg   %ax,%ax
  106e3e:	66 90                	xchg   %ax,%ax

00106e40 <tcb_init>:
/**
 * Initializes the TCB for all NUM_IDS threads with the state TSTATE_DEAD,
 * and with two indices being NUM_IDS (which represents NULL).
 */
void tcb_init(unsigned int mbi_addr)
{
  106e40:	53                   	push   %ebx
  106e41:	e8 5c 95 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106e46:	81 c3 ae d1 00 00    	add    $0xd1ae,%ebx
  106e4c:	83 ec 14             	sub    $0x14,%esp
    // TODO [Lab 4]: define your local variables here.

    paging_init(mbi_addr);
  106e4f:	ff 74 24 1c          	push   0x1c(%esp)
  106e53:	e8 68 fc ff ff       	call   106ac0 <paging_init>

    // TODO [Lab 4]
}
  106e58:	83 c4 18             	add    $0x18,%esp
  106e5b:	5b                   	pop    %ebx
  106e5c:	c3                   	ret
  106e5d:	66 90                	xchg   %ax,%ax
  106e5f:	90                   	nop

00106e60 <tqueue_get_head>:
 */
struct TQueue TQueuePool[NUM_IDS + NUM_CPUS];

unsigned int tqueue_get_head(unsigned int chid)
{
    return TQueuePool[chid].head;
  106e60:	e8 35 95 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  106e65:	05 8f d1 00 00       	add    $0xd18f,%eax
  106e6a:	8b 54 24 04          	mov    0x4(%esp),%edx
  106e6e:	8b 84 d0 6c 1c 4d 00 	mov    0x4d1c6c(%eax,%edx,8),%eax
}
  106e75:	c3                   	ret
  106e76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106e7d:	00 
  106e7e:	66 90                	xchg   %ax,%ax

00106e80 <tqueue_set_head>:

void tqueue_set_head(unsigned int chid, unsigned int head)
{
    TQueuePool[chid].head = head;
  106e80:	e8 15 95 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  106e85:	05 6f d1 00 00       	add    $0xd16f,%eax
  106e8a:	8b 54 24 04          	mov    0x4(%esp),%edx
  106e8e:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106e92:	89 8c d0 6c 1c 4d 00 	mov    %ecx,0x4d1c6c(%eax,%edx,8)
}
  106e99:	c3                   	ret
  106e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106ea0 <tqueue_get_tail>:

unsigned int tqueue_get_tail(unsigned int chid)
{
    return TQueuePool[chid].tail;
  106ea0:	e8 f5 94 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  106ea5:	05 4f d1 00 00       	add    $0xd14f,%eax
  106eaa:	8b 54 24 04          	mov    0x4(%esp),%edx
  106eae:	8b 84 d0 70 1c 4d 00 	mov    0x4d1c70(%eax,%edx,8),%eax
}
  106eb5:	c3                   	ret
  106eb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106ebd:	00 
  106ebe:	66 90                	xchg   %ax,%ax

00106ec0 <tqueue_set_tail>:

void tqueue_set_tail(unsigned int chid, unsigned int tail)
{
    TQueuePool[chid].tail = tail;
  106ec0:	e8 d5 94 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  106ec5:	05 2f d1 00 00       	add    $0xd12f,%eax
  106eca:	8b 54 24 04          	mov    0x4(%esp),%edx
  106ece:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  106ed2:	89 8c d0 70 1c 4d 00 	mov    %ecx,0x4d1c70(%eax,%edx,8)
}
  106ed9:	c3                   	ret
  106eda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00106ee0 <tqueue_init_at_id>:

void tqueue_init_at_id(unsigned int chid)
{
    TQueuePool[chid].head = NUM_IDS;
  106ee0:	e8 b5 94 ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  106ee5:	05 0f d1 00 00       	add    $0xd10f,%eax
{
  106eea:	8b 54 24 04          	mov    0x4(%esp),%edx
    TQueuePool[chid].head = NUM_IDS;
  106eee:	c7 84 d0 6c 1c 4d 00 	movl   $0x40,0x4d1c6c(%eax,%edx,8)
  106ef5:	40 00 00 00 
    TQueuePool[chid].tail = NUM_IDS;
  106ef9:	c7 84 d0 70 1c 4d 00 	movl   $0x40,0x4d1c70(%eax,%edx,8)
  106f00:	40 00 00 00 
}
  106f04:	c3                   	ret
  106f05:	66 90                	xchg   %ax,%ax
  106f07:	66 90                	xchg   %ax,%ax
  106f09:	66 90                	xchg   %ax,%ax
  106f0b:	66 90                	xchg   %ax,%ax
  106f0d:	66 90                	xchg   %ax,%ax
  106f0f:	90                   	nop

00106f10 <tqueue_init>:
 * Initializes all the thread queues with tqueue_init_at_id.
 * There are NUM_IDS + NUM_CPUS queues: queue # NUM_IDS + i is the ready
 * queue of CPU # i (with a single CPU, this is just queue # NUM_IDS).
 */
void tqueue_init(unsigned int mbi_addr)
{
  106f10:	53                   	push   %ebx
  106f11:	e8 8c 94 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106f16:	81 c3 de d0 00 00    	add    $0xd0de,%ebx
  106f1c:	83 ec 14             	sub    $0x14,%esp
    // TODO [Lab 4]: define your local variables here.

    tcb_init(mbi_addr);
  106f1f:	ff 74 24 1c          	push   0x1c(%esp)
  106f23:	e8 18 ff ff ff       	call   106e40 <tcb_init>

    // TODO [Lab 4]
}
  106f28:	83 c4 18             	add    $0x18,%esp
  106f2b:	5b                   	pop    %ebx
  106f2c:	c3                   	ret
  106f2d:	8d 76 00             	lea    0x0(%esi),%esi

00106f30 <tqueue_enqueue>:
 * Hint: there are multiple cases in this function.
 */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{
    // TODO [Lab 4]
}
  106f30:	c3                   	ret
  106f31:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106f38:	00 
  106f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106f40 <tqueue_dequeue>:
 */
unsigned int tqueue_dequeue(unsigned int chid)
{
    // TODO [Lab 4]
    return 0;
}
  106f40:	31 c0                	xor    %eax,%eax
  106f42:	c3                   	ret
  106f43:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  106f4a:	00 
  106f4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00106f50 <tqueue_remove>:

/**
 * Removes the TCB #pid from the queue #chid.
 * Hint: there are many cases in this function.
 */
void tqueue_remove(unsigned int chid, unsigned int pid)
  106f50:	c3                   	ret
  106f51:	66 90                	xchg   %ax,%ax
  106f53:	66 90                	xchg   %ax,%ax
  106f55:	66 90                	xchg   %ax,%ax
  106f57:	66 90                	xchg   %ax,%ax
  106f59:	66 90                	xchg   %ax,%ax
  106f5b:	66 90                	xchg   %ax,%ax
  106f5d:	66 90                	xchg   %ax,%ax
  106f5f:	90                   	nop

00106f60 <get_curid>:
#include <pcpu/PCPUIntro/export.h>

unsigned int CURID[NUM_CPUS];

unsigned int get_curid(void)
{
  106f60:	53                   	push   %ebx
  106f61:	e8 3c 94 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106f66:	81 c3 8e d0 00 00    	add    $0xd08e,%ebx
  106f6c:	83 ec 08             	sub    $0x8,%esp
    return CURID[get_pcpu_idx()];
  106f6f:	e8 cc f3 ff ff       	call   106340 <get_pcpu_idx>
  106f74:	8b 84 83 ac 1e 4d 00 	mov    0x4d1eac(%ebx,%eax,4),%eax
}
  106f7b:	83 c4 08             	add    $0x8,%esp
  106f7e:	5b                   	pop    %ebx
  106f7f:	c3                   	ret

00106f80 <set_curid>:

void set_curid(unsigned int curid)
{
  106f80:	53                   	push   %ebx
  106f81:	e8 1c 94 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106f86:	81 c3 6e d0 00 00    	add    $0xd06e,%ebx
  106f8c:	83 ec 08             	sub    $0x8,%esp
    CURID[get_pcpu_idx()] = curid;
  106f8f:	e8 ac f3 ff ff       	call   106340 <get_pcpu_idx>
  106f94:	8b 54 24 10          	mov    0x10(%esp),%edx
  106f98:	89 94 83 ac 1e 4d 00 	mov    %edx,0x4d1eac(%ebx,%eax,4)
}
  106f9f:	83 c4 08             	add    $0x8,%esp
  106fa2:	5b                   	pop    %ebx
  106fa3:	c3                   	ret
  106fa4:	66 90                	xchg   %ax,%ax
  106fa6:	66 90                	xchg   %ax,%ax
  106fa8:	66 90                	xchg   %ax,%ax
  106faa:	66 90                	xchg   %ax,%ax
  106fac:	66 90                	xchg   %ax,%ax
  106fae:	66 90                	xchg   %ax,%ax

00106fb0 <thread_init>:
static spinlock_t sched_lk;

unsigned int sched_ticks[NUM_CPUS];

void thread_init(unsigned int mbi_addr)
{
  106fb0:	53                   	push   %ebx
  106fb1:	e8 ec 93 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  106fb6:	81 c3 3e d0 00 00    	add    $0xd03e,%ebx
  106fbc:	83 ec 14             	sub    $0x14,%esp
    unsigned int i;
    for (i = 0; i < NUM_CPUS; i++) {
        sched_ticks[i] = 0;
  106fbf:	c7 83 cc 1e 4d 00 00 	movl   $0x0,0x4d1ecc(%ebx)
  106fc6:	00 00 00 
    }

    spinlock_init(&sched_lk);
  106fc9:	8d 83 ec 1e 4d 00    	lea    0x4d1eec(%ebx),%eax
  106fcf:	50                   	push   %eax
        sched_ticks[i] = 0;
  106fd0:	c7 83 d0 1e 4d 00 00 	movl   $0x0,0x4d1ed0(%ebx)
  106fd7:	00 00 00 
  106fda:	c7 83 d4 1e 4d 00 00 	movl   $0x0,0x4d1ed4(%ebx)
  106fe1:	00 00 00 
  106fe4:	c7 83 d8 1e 4d 00 00 	movl   $0x0,0x4d1ed8(%ebx)
  106feb:	00 00 00 
  106fee:	c7 83 dc 1e 4d 00 00 	movl   $0x0,0x4d1edc(%ebx)
  106ff5:	00 00 00 
  106ff8:	c7 83 e0 1e 4d 00 00 	movl   $0x0,0x4d1ee0(%ebx)
  106fff:	00 00 00 
  107002:	c7 83 e4 1e 4d 00 00 	movl   $0x0,0x4d1ee4(%ebx)
  107009:	00 00 00 
  10700c:	c7 83 e8 1e 4d 00 00 	movl   $0x0,0x4d1ee8(%ebx)
  107013:	00 00 00 
    spinlock_init(&sched_lk);
  107016:	e8 85 ef ff ff       	call   105fa0 <spinlock_init>
    tqueue_init(mbi_addr);
  10701b:	58                   	pop    %eax
  10701c:	ff 74 24 1c          	push   0x1c(%esp)
  107020:	e8 eb fe ff ff       	call   106f10 <tqueue_init>
    set_curid(0);
  107025:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10702c:	e8 4f ff ff ff       	call   106f80 <set_curid>
    tcb_set_state(0, TSTATE_RUN);
  107031:	5a                   	pop    %edx
  107032:	59                   	pop    %ecx
  107033:	6a 01                	push   $0x1
  107035:	6a 00                	push   $0x0
  107037:	e8 f4 fb ff ff       	call   106c30 <tcb_set_state>
}
  10703c:	83 c4 18             	add    $0x18,%esp
  10703f:	5b                   	pop    %ebx
  107040:	c3                   	ret
  107041:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107048:	00 
  107049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107050 <thread_spawn>:
 * thread with tcb_set_cpu.
 * The scheduler state is protected by sched_lk (lab 6); keep your code
 * between the acquire and the release.
 */
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota)
{
  107050:	56                   	push   %esi
  107051:	53                   	push   %ebx
  107052:	e8 4b 93 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107057:	81 c3 9d cf 00 00    	add    $0xcf9d,%ebx
  10705d:	83 ec 10             	sub    $0x10,%esp
    unsigned int pid = NUM_IDS;

    spinlock_acquire(&sched_lk);
  107060:	8d b3 ec 1e 4d 00    	lea    0x4d1eec(%ebx),%esi
  107066:	56                   	push   %esi
  107067:	e8 c4 ef ff ff       	call   106030 <spinlock_acquire>

    // TODO [Lab 4]

    spinlock_release(&sched_lk);
  10706c:	89 34 24             	mov    %esi,(%esp)
  10706f:	e8 3c f0 ff ff       	call   1060b0 <spinlock_release>

    return pid;
}
  107074:	83 c4 14             	add    $0x14,%esp
  107077:	b8 40 00 00 00       	mov    $0x40,%eax
  10707c:	5b                   	pop    %ebx
  10707d:	5e                   	pop    %esi
  10707e:	c3                   	ret
  10707f:	90                   	nop

00107080 <thread_yield>:
 * Note: the scheduler state is protected by sched_lk (lab 6). Release it
 * with spinlock_release(&sched_lk) before calling kctx_switch, and also on
 * the path where no switch is needed.
 */
void thread_yield(void)
{
  107080:	53                   	push   %ebx
  107081:	e8 1c 93 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107086:	81 c3 6e cf 00 00    	add    $0xcf6e,%ebx
  10708c:	83 ec 14             	sub    $0x14,%esp
    spinlock_acquire(&sched_lk);
  10708f:	8d 83 ec 1e 4d 00    	lea    0x4d1eec(%ebx),%eax
  107095:	50                   	push   %eax
  107096:	e8 95 ef ff ff       	call   106030 <spinlock_acquire>

    // TODO [Lab 4]
}
  10709b:	83 c4 18             	add    $0x18,%esp
  10709e:	5b                   	pop    %ebx
  10709f:	c3                   	ret

001070a0 <sched_update>:

void sched_update(void)
{
  1070a0:	57                   	push   %edi
  1070a1:	56                   	push   %esi
  1070a2:	53                   	push   %ebx
  1070a3:	e8 fa 92 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1070a8:	81 c3 4c cf 00 00    	add    $0xcf4c,%ebx
    spinlock_acquire(&sched_lk);
  1070ae:	83 ec 0c             	sub    $0xc,%esp
  1070b1:	8d bb ec 1e 4d 00    	lea    0x4d1eec(%ebx),%edi
    sched_ticks[get_pcpu_idx()] += 1000 / LAPIC_TIMER_INTR_FREQ;
  1070b7:	8d b3 cc 1e 4d 00    	lea    0x4d1ecc(%ebx),%esi
    spinlock_acquire(&sched_lk);
  1070bd:	57                   	push   %edi
  1070be:	e8 6d ef ff ff       	call   106030 <spinlock_acquire>
    sched_ticks[get_pcpu_idx()] += 1000 / LAPIC_TIMER_INTR_FREQ;
  1070c3:	e8 78 f2 ff ff       	call   106340 <get_pcpu_idx>
  1070c8:	83 04 86 01          	addl   $0x1,(%esi,%eax,4)
    if (sched_ticks[get_pcpu_idx()] >= SCHED_SLICE) {
  1070cc:	e8 6f f2 ff ff       	call   106340 <get_pcpu_idx>
  1070d1:	83 c4 10             	add    $0x10,%esp
  1070d4:	83 3c 86 04          	cmpl   $0x4,(%esi,%eax,4)
  1070d8:	76 26                	jbe    107100 <sched_update+0x60>
        sched_ticks[get_pcpu_idx()] = 0;
  1070da:	e8 61 f2 ff ff       	call   106340 <get_pcpu_idx>
        spinlock_release(&sched_lk);
  1070df:	83 ec 0c             	sub    $0xc,%esp
        sched_ticks[get_pcpu_idx()] = 0;
  1070e2:	c7 04 86 00 00 00 00 	movl   $0x0,(%esi,%eax,4)
        spinlock_release(&sched_lk);
  1070e9:	57                   	push   %edi
  1070ea:	e8 c1 ef ff ff       	call   1060b0 <spinlock_release>
    spinlock_acquire(&sched_lk);
  1070ef:	89 3c 24             	mov    %edi,(%esp)
  1070f2:	e8 39 ef ff ff       	call   106030 <spinlock_acquire>
}
  1070f7:	83 c4 10             	add    $0x10,%esp
        thread_yield();
    }
    else {
        spinlock_release(&sched_lk);
    }
}
  1070fa:	5b                   	pop    %ebx
  1070fb:	5e                   	pop    %esi
  1070fc:	5f                   	pop    %edi
  1070fd:	c3                   	ret
  1070fe:	66 90                	xchg   %ax,%ax
        spinlock_release(&sched_lk);
  107100:	83 ec 0c             	sub    $0xc,%esp
  107103:	57                   	push   %edi
  107104:	e8 a7 ef ff ff       	call   1060b0 <spinlock_release>
  107109:	83 c4 10             	add    $0x10,%esp
}
  10710c:	5b                   	pop    %ebx
  10710d:	5e                   	pop    %esi
  10710e:	5f                   	pop    %edi
  10710f:	c3                   	ret

00107110 <thread_sleep>:
 * Record the channel with tcb_set_chan and set the state to TSTATE_SLEEP,
 * then switch to the next thread in the ready queue of the current CPU
 * (NUM_IDS + get_pcpu_idx()), as in thread_yield.
 */
void thread_sleep(void *chan, spinlock_t *lk)
{
  107110:	53                   	push   %ebx
  107111:	e8 8c 92 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107116:	81 c3 de ce 00 00    	add    $0xcede,%ebx
  10711c:	83 ec 08             	sub    $0x8,%esp
    // TODO [Lab 6]: your local variables here.

    if (lk == 0)
  10711f:	8b 44 24 14          	mov    0x14(%esp),%eax
  107123:	85 c0                	test   %eax,%eax
  107125:	74 09                	je     107130 <thread_sleep+0x20>
    // TODO [Lab 6]: Context switch. (Release sched_lk before kctx_switch.)

    // TODO [Lab 6]: Tidy up.

    // TODO [Lab 6]: Reacquire original lock.
}
  107127:	83 c4 08             	add    $0x8,%esp
  10712a:	5b                   	pop    %ebx
  10712b:	c3                   	ret
  10712c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        KERN_PANIC("sleep without lock");
  107130:	83 ec 04             	sub    $0x4,%esp
  107133:	8d 83 1c 76 ff ff    	lea    -0x89e4(%ebx),%eax
  107139:	50                   	push   %eax
  10713a:	8d 83 2f 76 ff ff    	lea    -0x89d1(%ebx),%eax
  107140:	6a 61                	push   $0x61
  107142:	50                   	push   %eax
  107143:	e8 98 d6 ff ff       	call   1047e0 <debug_panic>
  107148:	83 c4 10             	add    $0x10,%esp
}
  10714b:	83 c4 08             	add    $0x8,%esp
  10714e:	5b                   	pop    %ebx
  10714f:	c3                   	ret

00107150 <thread_wakeup>:
 * ran on (NUM_IDS + tcb_get_cpu(pid)). Hold sched_lk while doing this.
 */
void thread_wakeup(void *chan)
{
    // TODO [Lab 6]
}
  107150:	c3                   	ret
  107151:	66 90                	xchg   %ax,%ax
  107153:	66 90                	xchg   %ax,%ax
  107155:	66 90                	xchg   %ax,%ax
  107157:	66 90                	xchg   %ax,%ax
  107159:	66 90                	xchg   %ax,%ax
  10715b:	66 90                	xchg   %ax,%ax
  10715d:	66 90                	xchg   %ax,%ax
  10715f:	90                   	nop

00107160 <proc_start_user>:
extern unsigned int last_active[NUM_CPUS];

void log_init();

void proc_start_user(void)
{
  107160:	57                   	push   %edi
  107161:	56                   	push   %esi
  107162:	53                   	push   %ebx
  107163:	e8 3a 92 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107168:	81 c3 8c ce 00 00    	add    $0xce8c,%ebx
    unsigned int cur_pid = get_curid();
  10716e:	e8 ed fd ff ff       	call   106f60 <get_curid>
  107173:	89 c6                	mov    %eax,%esi
    unsigned int cpu_idx = get_pcpu_idx();
  107175:	e8 c6 f1 ff ff       	call   106340 <get_pcpu_idx>
        started = TRUE;
        log_init();
    }
#endif

    kstack_switch(cur_pid);
  10717a:	83 ec 0c             	sub    $0xc,%esp
  10717d:	56                   	push   %esi
    unsigned int cpu_idx = get_pcpu_idx();
  10717e:	89 c7                	mov    %eax,%edi
    kstack_switch(cur_pid);
  107180:	e8 9b de ff ff       	call   105020 <kstack_switch>
    set_pdir_base(cur_pid);
  107185:	89 34 24             	mov    %esi,(%esp)
  107188:	e8 a3 f7 ff ff       	call   106930 <set_pdir_base>
    last_active[cpu_idx] = cur_pid;
  10718d:	c7 c0 40 70 62 00    	mov    $0x627040,%eax
  107193:	89 34 b8             	mov    %esi,(%eax,%edi,4)

    trap_return((void *) &uctx_pool[cur_pid]);
  107196:	6b f6 44             	imul   $0x44,%esi,%esi
  107199:	81 c6 00 5f 5e 00    	add    $0x5e5f00,%esi
  10719f:	89 34 24             	mov    %esi,(%esp)
  1071a2:	e8 d9 b0 ff ff       	call   102280 <trap_return>
}
  1071a7:	83 c4 10             	add    $0x10,%esp
  1071aa:	5b                   	pop    %ebx
  1071ab:	5e                   	pop    %esi
  1071ac:	5f                   	pop    %edi
  1071ad:	c3                   	ret
  1071ae:	66 90                	xchg   %ax,%ax

001071b0 <proc_create>:

unsigned int proc_create(void *elf_addr, unsigned int quota)
{
  1071b0:	57                   	push   %edi
  1071b1:	56                   	push   %esi
  1071b2:	53                   	push   %ebx
  1071b3:	e8 ea 91 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1071b8:	81 c3 3c ce 00 00    	add    $0xce3c,%ebx
    unsigned int pid, id;

    id = get_curid();
  1071be:	e8 9d fd ff ff       	call   106f60 <get_curid>
    pid = thread_spawn((void *) proc_start_user, id, quota);
  1071c3:	83 ec 04             	sub    $0x4,%esp
  1071c6:	ff 74 24 18          	push   0x18(%esp)
  1071ca:	50                   	push   %eax
  1071cb:	8d 83 6c 31 ff ff    	lea    -0xce94(%ebx),%eax
  1071d1:	50                   	push   %eax
  1071d2:	e8 79 fe ff ff       	call   107050 <thread_spawn>

    if (pid != NUM_IDS) {
  1071d7:	83 c4 10             	add    $0x10,%esp
    pid = thread_spawn((void *) proc_start_user, id, quota);
  1071da:	89 c6                	mov    %eax,%esi
    if (pid != NUM_IDS) {
  1071dc:	83 f8 40             	cmp    $0x40,%eax
  1071df:	74 66                	je     107247 <proc_create+0x97>
        elf_load(elf_addr, pid);
  1071e1:	83 ec 08             	sub    $0x8,%esp

        uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  1071e4:	6b fe 44             	imul   $0x44,%esi,%edi
        elf_load(elf_addr, pid);
  1071e7:	50                   	push   %eax
  1071e8:	ff 74 24 1c          	push   0x1c(%esp)
  1071ec:	e8 cf ea ff ff       	call   105cc0 <elf_load>
        uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  1071f1:	81 c7 00 5f 5e 00    	add    $0x5e5f00,%edi
  1071f7:	b8 23 00 00 00       	mov    $0x23,%eax
        uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  1071fc:	ba 23 00 00 00       	mov    $0x23,%edx
        uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  107201:	66 89 47 20          	mov    %ax,0x20(%edi)
        uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  107205:	b9 1b 00 00 00       	mov    $0x1b,%ecx
        uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  10720a:	b8 23 00 00 00       	mov    $0x23,%eax
        uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  10720f:	66 89 57 24          	mov    %dx,0x24(%edi)
        uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  107213:	66 89 4f 34          	mov    %cx,0x34(%edi)
        uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  107217:	66 89 47 40          	mov    %ax,0x40(%edi)
        uctx_pool[pid].esp = VM_USERHI;
  10721b:	c7 47 3c 00 00 00 f0 	movl   $0xf0000000,0x3c(%edi)
        uctx_pool[pid].eflags = FL_IF;
  107222:	c7 47 38 00 02 00 00 	movl   $0x200,0x38(%edi)
        uctx_pool[pid].eip = elf_entry(elf_addr);
  107229:	58                   	pop    %eax
  10722a:	ff 74 24 1c          	push   0x1c(%esp)
  10722e:	e8 cd ec ff ff       	call   105f00 <elf_entry>
  107233:	89 47 30             	mov    %eax,0x30(%edi)

        seg_init_proc(get_pcpu_idx(), pid);
  107236:	e8 05 f1 ff ff       	call   106340 <get_pcpu_idx>
  10723b:	5a                   	pop    %edx
  10723c:	59                   	pop    %ecx
  10723d:	56                   	push   %esi
  10723e:	50                   	push   %eax
  10723f:	e8 0c e0 ff ff       	call   105250 <seg_init_proc>
  107244:	83 c4 10             	add    $0x10,%esp
    }

    return pid;
}
  107247:	89 f0                	mov    %esi,%eax
  107249:	5b                   	pop    %ebx
  10724a:	5e                   	pop    %esi
  10724b:	5f                   	pop    %edi
  10724c:	c3                   	ret
  10724d:	66 90                	xchg   %ax,%ax
  10724f:	90                   	nop

00107250 <syscall_get_arg1>:
 */
unsigned int syscall_get_arg1(tf_t *tf)
{
    // TODO [Lab 5]
    return 0;
}
  107250:	31 c0                	xor    %eax,%eax
  107252:	c3                   	ret
  107253:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10725a:	00 
  10725b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107260 <syscall_get_arg2>:

unsigned int syscall_get_arg2(tf_t *tf)
  107260:	31 c0                	xor    %eax,%eax
  107262:	c3                   	ret
  107263:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10726a:	00 
  10726b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107270 <syscall_get_arg3>:
{
    // TODO [Lab 5]
    return 0;
}

unsigned int syscall_get_arg3(tf_t *tf)
  107270:	31 c0                	xor    %eax,%eax
  107272:	c3                   	ret
  107273:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10727a:	00 
  10727b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107280 <syscall_get_arg4>:
{
    // TODO [Lab 5]
    return 0;
}

unsigned int syscall_get_arg4(tf_t *tf)
  107280:	31 c0                	xor    %eax,%eax
  107282:	c3                   	ret
  107283:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10728a:	00 
  10728b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107290 <syscall_get_arg5>:
{
    // TODO [Lab 5]
    return 0;
}

unsigned int syscall_get_arg5(tf_t *tf)
  107290:	31 c0                	xor    %eax,%eax
  107292:	c3                   	ret
  107293:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10729a:	00 
  10729b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001072a0 <syscall_get_arg6>:
{
    // TODO [Lab 5]
    return 0;
}

unsigned int syscall_get_arg6(tf_t *tf)
  1072a0:	31 c0                	xor    %eax,%eax
  1072a2:	c3                   	ret
  1072a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1072aa:	00 
  1072ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001072b0 <syscall_set_errno>:
 * to the current running process when we return to it.
 */
void syscall_set_errno(tf_t *tf, unsigned int errno)
{
    // TODO [Lab 5]
}
  1072b0:	c3                   	ret
  1072b1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1072b8:	00 
  1072b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001072c0 <syscall_set_retval1>:

/**
 * Sets the return values in the trap frame [tf] that get passed
 * to the current running process when we return to it.
 */
void syscall_set_retval1(tf_t *tf, unsigned int retval)
  1072c0:	c3                   	ret
  1072c1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1072c8:	00 
  1072c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001072d0 <syscall_set_retval2>:
{
    // TODO [Lab 5]
}

void syscall_set_retval2(tf_t *tf, unsigned int retval)
  1072d0:	c3                   	ret
  1072d1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1072d8:	00 
  1072d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001072e0 <syscall_set_retval3>:
{
    // TODO [Lab 5]
}

void syscall_set_retval3(tf_t *tf, unsigned int retval)
  1072e0:	c3                   	ret
  1072e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1072e8:	00 
  1072e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001072f0 <syscall_set_retval4>:
{
    // TODO [Lab 5]
}

void syscall_set_retval4(tf_t *tf, unsigned int retval)
  1072f0:	c3                   	ret
  1072f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1072f8:	00 
  1072f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107300 <syscall_set_retval5>:
{
    // TODO [Lab 5]
}

void syscall_set_retval5(tf_t *tf, unsigned int retval)
  107300:	c3                   	ret
  107301:	66 90                	xchg   %ax,%ax
  107303:	66 90                	xchg   %ax,%ax
  107305:	66 90                	xchg   %ax,%ax
  107307:	66 90                	xchg   %ax,%ax
  107309:	66 90                	xchg   %ax,%ax
  10730b:	66 90                	xchg   %ax,%ax
  10730d:	66 90                	xchg   %ax,%ax
  10730f:	90                   	nop

00107310 <sys_puts>:
/**
 * Copies a string from user into buffer and prints it to the screen.
 * This is called by the user level "printf" library as a system call.
 */
void sys_puts(tf_t *tf)
{
  107310:	55                   	push   %ebp
  107311:	57                   	push   %edi
  107312:	56                   	push   %esi
  107313:	53                   	push   %ebx
  107314:	e8 89 90 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107319:	81 c3 db cc 00 00    	add    $0xccdb,%ebx
  10731f:	83 ec 2c             	sub    $0x2c,%esp
  107322:	8b 74 24 40          	mov    0x40(%esp),%esi
    unsigned int cur_pid;
    unsigned int str_uva, str_len;
    unsigned int remain, cur_pos, nbytes;

    cur_pid = get_curid();
  107326:	e8 35 fc ff ff       	call   106f60 <get_curid>
    str_uva = syscall_get_arg2(tf);
  10732b:	83 ec 0c             	sub    $0xc,%esp
    cur_pid = get_curid();
  10732e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    str_uva = syscall_get_arg2(tf);
  107332:	56                   	push   %esi
  107333:	e8 28 ff ff ff       	call   107260 <syscall_get_arg2>
    str_len = syscall_get_arg3(tf);
  107338:	89 34 24             	mov    %esi,(%esp)
    str_uva = syscall_get_arg2(tf);
  10733b:	89 c7                	mov    %eax,%edi
    str_len = syscall_get_arg3(tf);
  10733d:	e8 2e ff ff ff       	call   107270 <syscall_get_arg3>

    if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
  107342:	83 c4 10             	add    $0x10,%esp
  107345:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  10734b:	0f 86 d7 00 00 00    	jbe    107428 <sys_puts+0x118>
  107351:	8d 14 07             	lea    (%edi,%eax,1),%edx
  107354:	89 c5                	mov    %eax,%ebp
  107356:	81 fa 00 00 00 f0    	cmp    $0xf0000000,%edx
  10735c:	0f 87 c6 00 00 00    	ja     107428 <sys_puts+0x118>
    }

    remain = str_len;
    cur_pos = str_uva;

    while (remain) {
  107362:	85 c0                	test   %eax,%eax
  107364:	0f 84 a2 00 00 00    	je     10740c <sys_puts+0xfc>
        if (remain < PAGESIZE - 1)
            nbytes = remain;
        else
            nbytes = PAGESIZE - 1;

        if (pt_copyin(cur_pid, cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
  10736a:	8b 44 24 10          	mov    0x10(%esp),%eax
  10736e:	8d 8b 0c 30 4d 00    	lea    0x4d300c(%ebx),%ecx

        sys_buf[cur_pid][nbytes] = '\0';
#if LAB == 6
        KERN_INFO("From cpu %d: %s", get_pcpu_idx(), sys_buf[cur_pid]);
#else
        KERN_INFO("%s", sys_buf[cur_pid]);
  107374:	89 74 24 40          	mov    %esi,0x40(%esp)
  107378:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
        if (pt_copyin(cur_pid, cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
  10737c:	c1 e0 0c             	shl    $0xc,%eax
  10737f:	89 44 24 14          	mov    %eax,0x14(%esp)
  107383:	01 c8                	add    %ecx,%eax
  107385:	89 44 24 08          	mov    %eax,0x8(%esp)
        KERN_INFO("%s", sys_buf[cur_pid]);
  107389:	8d 83 1a 70 ff ff    	lea    -0x8fe6(%ebx),%eax
  10738f:	89 44 24 18          	mov    %eax,0x18(%esp)
  107393:	eb 33                	jmp    1073c8 <sys_puts+0xb8>
  107395:	8d 76 00             	lea    0x0(%esi),%esi
        sys_buf[cur_pid][nbytes] = '\0';
  107398:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  10739c:	89 44 24 0c          	mov    %eax,0xc(%esp)
        KERN_INFO("%s", sys_buf[cur_pid]);
  1073a0:	83 ec 08             	sub    $0x8,%esp
        sys_buf[cur_pid][nbytes] = '\0';
  1073a3:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1073a6:	8b 44 24 24          	mov    0x24(%esp),%eax
  1073aa:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
        KERN_INFO("%s", sys_buf[cur_pid]);
  1073ae:	ff 74 24 10          	push   0x10(%esp)
  1073b2:	ff 74 24 24          	push   0x24(%esp)
  1073b6:	e8 85 d3 ff ff       	call   104740 <debug_info>
#endif

        remain -= nbytes;
        cur_pos += nbytes;
  1073bb:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    while (remain) {
  1073bf:	83 c4 10             	add    $0x10,%esp
        cur_pos += nbytes;
  1073c2:	01 c7                	add    %eax,%edi
    while (remain) {
  1073c4:	29 c5                	sub    %eax,%ebp
  1073c6:	74 40                	je     107408 <sys_puts+0xf8>
        if (remain < PAGESIZE - 1)
  1073c8:	ba ff 0f 00 00       	mov    $0xfff,%edx
  1073cd:	39 d5                	cmp    %edx,%ebp
  1073cf:	89 d6                	mov    %edx,%esi
  1073d1:	0f 46 f5             	cmovbe %ebp,%esi
        if (pt_copyin(cur_pid, cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
  1073d4:	56                   	push   %esi
  1073d5:	ff 74 24 0c          	push   0xc(%esp)
  1073d9:	57                   	push   %edi
  1073da:	ff 74 24 1c          	push   0x1c(%esp)
  1073de:	e8 2d e6 ff ff       	call   105a10 <pt_copyin>
  1073e3:	83 c4 10             	add    $0x10,%esp
  1073e6:	39 f0                	cmp    %esi,%eax
  1073e8:	74 ae                	je     107398 <sys_puts+0x88>
            syscall_set_errno(tf, E_MEM);
  1073ea:	8b 74 24 40          	mov    0x40(%esp),%esi
  1073ee:	83 ec 08             	sub    $0x8,%esp
  1073f1:	6a 01                	push   $0x1
  1073f3:	56                   	push   %esi
  1073f4:	e8 b7 fe ff ff       	call   1072b0 <syscall_set_errno>
            return;
  1073f9:	83 c4 10             	add    $0x10,%esp
    }

    syscall_set_errno(tf, E_SUCC);
}
  1073fc:	83 c4 2c             	add    $0x2c,%esp
  1073ff:	5b                   	pop    %ebx
  107400:	5e                   	pop    %esi
  107401:	5f                   	pop    %edi
  107402:	5d                   	pop    %ebp
  107403:	c3                   	ret
  107404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107408:	8b 74 24 40          	mov    0x40(%esp),%esi
    syscall_set_errno(tf, E_SUCC);
  10740c:	83 ec 08             	sub    $0x8,%esp
  10740f:	6a 00                	push   $0x0
  107411:	56                   	push   %esi
  107412:	e8 99 fe ff ff       	call   1072b0 <syscall_set_errno>
  107417:	83 c4 10             	add    $0x10,%esp
}
  10741a:	83 c4 2c             	add    $0x2c,%esp
  10741d:	5b                   	pop    %ebx
  10741e:	5e                   	pop    %esi
  10741f:	5f                   	pop    %edi
  107420:	5d                   	pop    %ebp
  107421:	c3                   	ret
  107422:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        syscall_set_errno(tf, E_INVAL_ADDR);
  107428:	83 ec 08             	sub    $0x8,%esp
  10742b:	6a 04                	push   $0x4
  10742d:	56                   	push   %esi
  10742e:	e8 7d fe ff ff       	call   1072b0 <syscall_set_errno>
        return;
  107433:	83 c4 10             	add    $0x10,%esp
}
  107436:	83 c4 2c             	add    $0x2c,%esp
  107439:	5b                   	pop    %ebx
  10743a:	5e                   	pop    %esi
  10743b:	5f                   	pop    %edi
  10743c:	5d                   	pop    %ebp
  10743d:	c3                   	ret
  10743e:	66 90                	xchg   %ax,%ax

00107440 <sys_spawn>:
 * returning NUM_IDS in each of these error cases.
 */
void sys_spawn(tf_t *tf)
{
    // TODO [Lab 5]
}
  107440:	c3                   	ret
  107441:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107448:	00 
  107449:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107450 <sys_yield>:
 * Yields to another thread/process.
 * The user level library function sys_yield (defined in user/include/syscall.h)
 * does not take any argument and does not have any return values.
 * Do not forget to set the error number as E_SUCC.
 */
void sys_yield(tf_t *tf)
  107450:	c3                   	ret
  107451:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107458:	00 
  107459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107460 <sys_fork>:
 * kern/trap/TTrapHandler/TTrapHandler.c) when either process writes to it.
 * Returns the child's process id to the parent and 0 to the child.
 * The test program is user/fork_test (elf_id 5).
 */
void sys_fork(tf_t *tf)
{
  107460:	53                   	push   %ebx
  107461:	e8 3c 8f ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107466:	81 c3 8e cb 00 00    	add    $0xcb8e,%ebx
  10746c:	83 ec 10             	sub    $0x10,%esp
    // TODO [Lab 5] (optional)
    syscall_set_errno(tf, E_INVAL_CALLNR);
  10746f:	6a 03                	push   $0x3
  107471:	ff 74 24 1c          	push   0x1c(%esp)
  107475:	e8 36 fe ff ff       	call   1072b0 <syscall_set_errno>
}
  10747a:	83 c4 18             	add    $0x18,%esp
  10747d:	5b                   	pop    %ebx
  10747e:	c3                   	ret
  10747f:	90                   	nop

00107480 <sys_produce>:
 *     CPU <cpu>: Process <pid>: Consumed <item>
 * and set the error number to E_SUCC.
 */
static unsigned int nproduced[NUM_IDS];

void sys_produce(tf_t *tf)
  107480:	c3                   	ret
  107481:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107488:	00 
  107489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107490 <sys_consume>:
{
    // TODO [Lab 6]
}

void sys_consume(tf_t *tf)
  107490:	c3                   	ret
  107491:	66 90                	xchg   %ax,%ax
  107493:	66 90                	xchg   %ax,%ax
  107495:	66 90                	xchg   %ax,%ax
  107497:	66 90                	xchg   %ax,%ax
  107499:	66 90                	xchg   %ax,%ax
  10749b:	66 90                	xchg   %ax,%ax
  10749d:	66 90                	xchg   %ax,%ax
  10749f:	90                   	nop

001074a0 <bbuf_init>:
    unsigned int head;   // index of the oldest item
    unsigned int count;  // number of items in the buffer
} bbuf;

void bbuf_init(void)
{
  1074a0:	53                   	push   %ebx
  1074a1:	e8 fc 8e ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1074a6:	81 c3 4e cb 00 00    	add    $0xcb4e,%ebx
  1074ac:	83 ec 14             	sub    $0x14,%esp
    spinlock_init(&bbuf.lock);
  1074af:	8d 83 0c 30 51 00    	lea    0x51300c(%ebx),%eax
  1074b5:	50                   	push   %eax
  1074b6:	e8 e5 ea ff ff       	call   105fa0 <spinlock_init>
    bbuf.head = 0;
  1074bb:	c7 83 3c 30 51 00 00 	movl   $0x0,0x51303c(%ebx)
  1074c2:	00 00 00 
    bbuf.count = 0;
  1074c5:	c7 83 40 30 51 00 00 	movl   $0x0,0x513040(%ebx)
  1074cc:	00 00 00 
}
  1074cf:	83 c4 18             	add    $0x18,%esp
  1074d2:	5b                   	pop    %ebx
  1074d3:	c3                   	ret
  1074d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1074db:	00 
  1074dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001074e0 <bbuf_put>:
 * a different one for "not full" and for "not empty".
 */
void bbuf_put(unsigned int item)
{
    // TODO [Lab 6]
}
  1074e0:	c3                   	ret
  1074e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1074e8:	00 
  1074e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001074f0 <bbuf_get>:
    unsigned int item = 0;

    // TODO [Lab 6]

    return item;
}
  1074f0:	31 c0                	xor    %eax,%eax
  1074f2:	c3                   	ret
  1074f3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1074fa:	00 
  1074fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00107500 <bbuf_count>:

unsigned int bbuf_count(void)
{
    return bbuf.count;
  107500:	e8 95 8e ff ff       	call   10039a <__x86.get_pc_thunk.ax>
  107505:	05 ef ca 00 00       	add    $0xcaef,%eax
  10750a:	8b 80 40 30 51 00    	mov    0x513040(%eax),%eax
}
  107510:	c3                   	ret
  107511:	66 90                	xchg   %ax,%ax
  107513:	66 90                	xchg   %ax,%ax
  107515:	66 90                	xchg   %ax,%ax
  107517:	66 90                	xchg   %ax,%ax
  107519:	66 90                	xchg   %ax,%ax
  10751b:	66 90                	xchg   %ax,%ax
  10751d:	66 90                	xchg   %ax,%ax
  10751f:	90                   	nop

00107520 <syscall_dispatch>:

#include "import.h"
#include <kern/fs/sysfile.h>

void syscall_dispatch(tf_t *tf)
{
  107520:	56                   	push   %esi
  107521:	53                   	push   %ebx
  107522:	e8 7b 8e ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107527:	81 c3 cd ca 00 00    	add    $0xcacd,%ebx
  10752d:	83 ec 10             	sub    $0x10,%esp
  107530:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    unsigned int nr;

    nr = syscall_get_arg1(tf);
  107534:	56                   	push   %esi
  107535:	e8 16 fd ff ff       	call   107250 <syscall_get_arg1>

    switch (nr) {
  10753a:	83 c4 10             	add    $0x10,%esp
  10753d:	83 f8 0e             	cmp    $0xe,%eax
  107540:	0f 87 3b 01 00 00    	ja     107681 <.L6+0x11>
  107546:	8b 94 83 bc 8d ff ff 	mov    -0x7244(%ebx,%eax,4),%edx
  10754d:	01 da                	add    %ebx,%edx
  10754f:	ff e2                	jmp    *%edx
  107551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107558 <.L5>:
         *   0 in the child, the process ID of the child in the parent
         */
        sys_fork(tf);
        break;
    case SYS_produce:
        sys_produce(tf);
  107558:	83 ec 0c             	sub    $0xc,%esp
  10755b:	56                   	push   %esi
  10755c:	e8 1f ff ff ff       	call   107480 <sys_produce>
        break;
  107561:	83 c4 10             	add    $0x10,%esp
        sys_fstat(tf);
        break;
    default:
        syscall_set_errno(tf, E_INVAL_CALLNR);
    }
}
  107564:	83 c4 04             	add    $0x4,%esp
  107567:	5b                   	pop    %ebx
  107568:	5e                   	pop    %esi
  107569:	c3                   	ret
  10756a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00107570 <.L3>:
        sys_consume(tf);
  107570:	83 ec 0c             	sub    $0xc,%esp
  107573:	56                   	push   %esi
  107574:	e8 17 ff ff ff       	call   107490 <sys_consume>
        break;
  107579:	83 c4 10             	add    $0x10,%esp
  10757c:	eb e6                	jmp    107564 <.L5+0xc>
  10757e:	66 90                	xchg   %ax,%ax

00107580 <.L18>:
        sys_puts(tf);
  107580:	83 ec 0c             	sub    $0xc,%esp
  107583:	56                   	push   %esi
  107584:	e8 87 fd ff ff       	call   107310 <sys_puts>
        break;
  107589:	83 c4 10             	add    $0x10,%esp
  10758c:	eb d6                	jmp    107564 <.L5+0xc>
  10758e:	66 90                	xchg   %ax,%ax

00107590 <.L17>:
        sys_spawn(tf);
  107590:	83 ec 0c             	sub    $0xc,%esp
  107593:	56                   	push   %esi
  107594:	e8 a7 fe ff ff       	call   107440 <sys_spawn>
        break;
  107599:	83 c4 10             	add    $0x10,%esp
  10759c:	eb c6                	jmp    107564 <.L5+0xc>
  10759e:	66 90                	xchg   %ax,%ax

001075a0 <.L16>:
        sys_yield(tf);
  1075a0:	83 ec 0c             	sub    $0xc,%esp
  1075a3:	56                   	push   %esi
  1075a4:	e8 a7 fe ff ff       	call   107450 <sys_yield>
        break;
  1075a9:	83 c4 10             	add    $0x10,%esp
  1075ac:	eb b6                	jmp    107564 <.L5+0xc>
  1075ae:	66 90                	xchg   %ax,%ax

001075b0 <.L15>:
        sys_open(tf);
  1075b0:	83 ec 0c             	sub    $0xc,%esp
  1075b3:	56                   	push   %esi
  1075b4:	e8 77 26 00 00       	call   109c30 <sys_open>
        break;
  1075b9:	83 c4 10             	add    $0x10,%esp
  1075bc:	eb a6                	jmp    107564 <.L5+0xc>
  1075be:	66 90                	xchg   %ax,%ax

001075c0 <.L14>:
        sys_close(tf);
  1075c0:	83 ec 0c             	sub    $0xc,%esp
  1075c3:	56                   	push   %esi
  1075c4:	e8 07 22 00 00       	call   1097d0 <sys_close>
        break;
  1075c9:	83 c4 10             	add    $0x10,%esp
  1075cc:	eb 96                	jmp    107564 <.L5+0xc>
  1075ce:	66 90                	xchg   %ax,%ax

001075d0 <.L13>:
        sys_read(tf);
  1075d0:	83 ec 0c             	sub    $0xc,%esp
  1075d3:	56                   	push   %esi
  1075d4:	e8 d7 21 00 00       	call   1097b0 <sys_read>
        break;
  1075d9:	83 c4 10             	add    $0x10,%esp
  1075dc:	eb 86                	jmp    107564 <.L5+0xc>
  1075de:	66 90                	xchg   %ax,%ax

001075e0 <.L12>:
        sys_write(tf);
  1075e0:	83 ec 0c             	sub    $0xc,%esp
  1075e3:	56                   	push   %esi
  1075e4:	e8 d7 21 00 00       	call   1097c0 <sys_write>
        break;
  1075e9:	83 c4 10             	add    $0x10,%esp
  1075ec:	e9 73 ff ff ff       	jmp    107564 <.L5+0xc>
  1075f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001075f8 <.L11>:
        sys_mkdir(tf);
  1075f8:	83 ec 0c             	sub    $0xc,%esp
  1075fb:	56                   	push   %esi
  1075fc:	e8 5f 27 00 00       	call   109d60 <sys_mkdir>
        break;
  107601:	83 c4 10             	add    $0x10,%esp
  107604:	e9 5b ff ff ff       	jmp    107564 <.L5+0xc>
  107609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107610 <.L10>:
        sys_chdir(tf);
  107610:	83 ec 0c             	sub    $0xc,%esp
  107613:	56                   	push   %esi
  107614:	e8 e7 27 00 00       	call   109e00 <sys_chdir>
        break;
  107619:	83 c4 10             	add    $0x10,%esp
  10761c:	e9 43 ff ff ff       	jmp    107564 <.L5+0xc>
  107621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107628 <.L9>:
        sys_link(tf);
  107628:	83 ec 0c             	sub    $0xc,%esp
  10762b:	56                   	push   %esi
  10762c:	e8 bf 21 00 00       	call   1097f0 <sys_link>
        break;
  107631:	83 c4 10             	add    $0x10,%esp
  107634:	e9 2b ff ff ff       	jmp    107564 <.L5+0xc>
  107639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107640 <.L8>:
        sys_unlink(tf);
  107640:	83 ec 0c             	sub    $0xc,%esp
  107643:	56                   	push   %esi
  107644:	e8 47 23 00 00       	call   109990 <sys_unlink>
        break;
  107649:	83 c4 10             	add    $0x10,%esp
  10764c:	e9 13 ff ff ff       	jmp    107564 <.L5+0xc>
  107651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107658 <.L7>:
        sys_fstat(tf);
  107658:	83 ec 0c             	sub    $0xc,%esp
  10765b:	56                   	push   %esi
  10765c:	e8 7f 21 00 00       	call   1097e0 <sys_fstat>
        break;
  107661:	83 c4 10             	add    $0x10,%esp
  107664:	e9 fb fe ff ff       	jmp    107564 <.L5+0xc>
  107669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107670 <.L6>:
        sys_fork(tf);
  107670:	83 ec 0c             	sub    $0xc,%esp
  107673:	56                   	push   %esi
  107674:	e8 e7 fd ff ff       	call   107460 <sys_fork>
        break;
  107679:	83 c4 10             	add    $0x10,%esp
  10767c:	e9 e3 fe ff ff       	jmp    107564 <.L5+0xc>
        syscall_set_errno(tf, E_INVAL_CALLNR);
  107681:	83 ec 08             	sub    $0x8,%esp
  107684:	6a 03                	push   $0x3
  107686:	56                   	push   %esi
  107687:	e8 24 fc ff ff       	call   1072b0 <syscall_set_errno>
  10768c:	83 c4 10             	add    $0x10,%esp
}
  10768f:	e9 d0 fe ff ff       	jmp    107564 <.L5+0xc>
  107694:	66 90                	xchg   %ax,%ax
  107696:	66 90                	xchg   %ax,%ax
  107698:	66 90                	xchg   %ax,%ax
  10769a:	66 90                	xchg   %ax,%ax
  10769c:	66 90                	xchg   %ax,%ax
  10769e:	66 90                	xchg   %ax,%ax

001076a0 <exception_handler>:
 * All other exceptions should be routed to the default exception handler.
 */
void exception_handler(tf_t *tf)
{
    // TODO [Lab 5]
}
  1076a0:	c3                   	ret
  1076a1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1076a8:	00 
  1076a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001076b0 <trap_dump.part.0>:
static void trap_dump(tf_t *tf)
  1076b0:	55                   	push   %ebp
  1076b1:	57                   	push   %edi
  1076b2:	56                   	push   %esi
  1076b3:	89 c6                	mov    %eax,%esi
  1076b5:	53                   	push   %ebx
  1076b6:	e8 e7 8c ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1076bb:	81 c3 39 c9 00 00    	add    $0xc939,%ebx
  1076c1:	83 ec 0c             	sub    $0xc,%esp
    KERN_DEBUG("trapframe at %x\n", base);
  1076c4:	50                   	push   %eax
  1076c5:	8d bb 94 82 ff ff    	lea    -0x7d6c(%ebx),%edi
  1076cb:	8d 83 4d 76 ff ff    	lea    -0x89b3(%ebx),%eax
  1076d1:	50                   	push   %eax
    KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->regs.oesp, tf->regs.oesp);
  1076d2:	8d ab a0 76 ff ff    	lea    -0x8960(%ebx),%ebp
    KERN_DEBUG("trapframe at %x\n", base);
  1076d8:	6a 18                	push   $0x18
  1076da:	57                   	push   %edi
  1076db:	e8 a0 d0 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tedi:   \t\t%08x\n", &tf->regs.edi, tf->regs.edi);
  1076e0:	58                   	pop    %eax
  1076e1:	8d 83 5e 76 ff ff    	lea    -0x89a2(%ebx),%eax
  1076e7:	ff 36                	push   (%esi)
  1076e9:	56                   	push   %esi
  1076ea:	50                   	push   %eax
  1076eb:	6a 19                	push   $0x19
  1076ed:	57                   	push   %edi
  1076ee:	e8 8d d0 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tesi:   \t\t%08x\n", &tf->regs.esi, tf->regs.esi);
  1076f3:	83 c4 14             	add    $0x14,%esp
  1076f6:	8d 46 04             	lea    0x4(%esi),%eax
  1076f9:	ff 76 04             	push   0x4(%esi)
  1076fc:	50                   	push   %eax
  1076fd:	8d 83 74 76 ff ff    	lea    -0x898c(%ebx),%eax
  107703:	50                   	push   %eax
  107704:	6a 1a                	push   $0x1a
  107706:	57                   	push   %edi
  107707:	e8 74 d0 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tebp:   \t\t%08x\n", &tf->regs.ebp, tf->regs.ebp);
  10770c:	83 c4 14             	add    $0x14,%esp
  10770f:	8d 46 08             	lea    0x8(%esi),%eax
  107712:	ff 76 08             	push   0x8(%esi)
  107715:	50                   	push   %eax
  107716:	8d 83 8a 76 ff ff    	lea    -0x8976(%ebx),%eax
  10771c:	50                   	push   %eax
  10771d:	6a 1b                	push   $0x1b
  10771f:	57                   	push   %edi
  107720:	e8 5b d0 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->regs.oesp, tf->regs.oesp);
  107725:	83 c4 14             	add    $0x14,%esp
  107728:	8d 46 0c             	lea    0xc(%esi),%eax
  10772b:	ff 76 0c             	push   0xc(%esi)
  10772e:	50                   	push   %eax
  10772f:	55                   	push   %ebp
  107730:	6a 1c                	push   $0x1c
  107732:	57                   	push   %edi
  107733:	e8 48 d0 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tebx:   \t\t%08x\n", &tf->regs.ebx, tf->regs.ebx);
  107738:	83 c4 14             	add    $0x14,%esp
  10773b:	8d 46 10             	lea    0x10(%esi),%eax
  10773e:	ff 76 10             	push   0x10(%esi)
  107741:	50                   	push   %eax
  107742:	8d 83 b6 76 ff ff    	lea    -0x894a(%ebx),%eax
  107748:	50                   	push   %eax
  107749:	6a 1d                	push   $0x1d
  10774b:	57                   	push   %edi
  10774c:	e8 2f d0 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tedx:   \t\t%08x\n", &tf->regs.edx, tf->regs.edx);
  107751:	83 c4 14             	add    $0x14,%esp
  107754:	8d 46 14             	lea    0x14(%esi),%eax
  107757:	ff 76 14             	push   0x14(%esi)
  10775a:	50                   	push   %eax
  10775b:	8d 83 cc 76 ff ff    	lea    -0x8934(%ebx),%eax
  107761:	50                   	push   %eax
  107762:	6a 1e                	push   $0x1e
  107764:	57                   	push   %edi
  107765:	e8 16 d0 ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tecx:   \t\t%08x\n", &tf->regs.ecx, tf->regs.ecx);
  10776a:	83 c4 14             	add    $0x14,%esp
  10776d:	8d 46 18             	lea    0x18(%esi),%eax
  107770:	ff 76 18             	push   0x18(%esi)
  107773:	50                   	push   %eax
  107774:	8d 83 e2 76 ff ff    	lea    -0x891e(%ebx),%eax
  10777a:	50                   	push   %eax
  10777b:	6a 1f                	push   $0x1f
  10777d:	57                   	push   %edi
  10777e:	e8 fd cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\teax:   \t\t%08x\n", &tf->regs.eax, tf->regs.eax);
  107783:	83 c4 14             	add    $0x14,%esp
  107786:	8d 46 1c             	lea    0x1c(%esi),%eax
  107789:	ff 76 1c             	push   0x1c(%esi)
  10778c:	50                   	push   %eax
  10778d:	8d 83 f8 76 ff ff    	lea    -0x8908(%ebx),%eax
  107793:	50                   	push   %eax
  107794:	6a 20                	push   $0x20
  107796:	57                   	push   %edi
  107797:	e8 e4 cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tes:    \t\t%08x\n", &tf->es, tf->es);
  10779c:	0f b7 46 20          	movzwl 0x20(%esi),%eax
  1077a0:	83 c4 14             	add    $0x14,%esp
  1077a3:	50                   	push   %eax
  1077a4:	8d 46 20             	lea    0x20(%esi),%eax
  1077a7:	50                   	push   %eax
  1077a8:	8d 83 0e 77 ff ff    	lea    -0x88f2(%ebx),%eax
  1077ae:	50                   	push   %eax
  1077af:	6a 21                	push   $0x21
  1077b1:	57                   	push   %edi
  1077b2:	e8 c9 cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tds:    \t\t%08x\n", &tf->ds, tf->ds);
  1077b7:	0f b7 46 24          	movzwl 0x24(%esi),%eax
  1077bb:	83 c4 14             	add    $0x14,%esp
  1077be:	50                   	push   %eax
  1077bf:	8d 46 24             	lea    0x24(%esi),%eax
  1077c2:	50                   	push   %eax
  1077c3:	8d 83 24 77 ff ff    	lea    -0x88dc(%ebx),%eax
  1077c9:	50                   	push   %eax
  1077ca:	6a 22                	push   $0x22
  1077cc:	57                   	push   %edi
  1077cd:	e8 ae cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\ttrapno:\t\t%08x\n", &tf->trapno, tf->trapno);
  1077d2:	83 c4 14             	add    $0x14,%esp
  1077d5:	8d 46 28             	lea    0x28(%esi),%eax
  1077d8:	ff 76 28             	push   0x28(%esi)
  1077db:	50                   	push   %eax
  1077dc:	8d 83 3a 77 ff ff    	lea    -0x88c6(%ebx),%eax
  1077e2:	50                   	push   %eax
  1077e3:	6a 23                	push   $0x23
  1077e5:	57                   	push   %edi
  1077e6:	e8 95 cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\terr:   \t\t%08x\n", &tf->err, tf->err);
  1077eb:	83 c4 14             	add    $0x14,%esp
  1077ee:	8d 46 2c             	lea    0x2c(%esi),%eax
  1077f1:	ff 76 2c             	push   0x2c(%esi)
  1077f4:	50                   	push   %eax
  1077f5:	8d 83 50 77 ff ff    	lea    -0x88b0(%ebx),%eax
  1077fb:	50                   	push   %eax
  1077fc:	6a 24                	push   $0x24
  1077fe:	57                   	push   %edi
  1077ff:	e8 7c cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\teip:   \t\t%08x\n", &tf->eip, tf->eip);
  107804:	83 c4 14             	add    $0x14,%esp
  107807:	8d 46 30             	lea    0x30(%esi),%eax
  10780a:	ff 76 30             	push   0x30(%esi)
  10780d:	50                   	push   %eax
  10780e:	8d 83 66 77 ff ff    	lea    -0x889a(%ebx),%eax
  107814:	50                   	push   %eax
  107815:	6a 25                	push   $0x25
  107817:	57                   	push   %edi
  107818:	e8 63 cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tcs:    \t\t%08x\n", &tf->cs, tf->cs);
  10781d:	0f b7 46 34          	movzwl 0x34(%esi),%eax
  107821:	83 c4 14             	add    $0x14,%esp
  107824:	50                   	push   %eax
  107825:	8d 46 34             	lea    0x34(%esi),%eax
  107828:	50                   	push   %eax
  107829:	8d 83 7c 77 ff ff    	lea    -0x8884(%ebx),%eax
  10782f:	50                   	push   %eax
  107830:	6a 26                	push   $0x26
  107832:	57                   	push   %edi
  107833:	e8 48 cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\teflags:\t\t%08x\n", &tf->eflags, tf->eflags);
  107838:	83 c4 14             	add    $0x14,%esp
  10783b:	8d 46 38             	lea    0x38(%esi),%eax
  10783e:	ff 76 38             	push   0x38(%esi)
  107841:	50                   	push   %eax
  107842:	8d 83 92 77 ff ff    	lea    -0x886e(%ebx),%eax
  107848:	50                   	push   %eax
  107849:	6a 27                	push   $0x27
  10784b:	57                   	push   %edi
  10784c:	e8 2f cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
  107851:	83 c4 14             	add    $0x14,%esp
  107854:	8d 46 3c             	lea    0x3c(%esi),%eax
  107857:	ff 76 3c             	push   0x3c(%esi)
  10785a:	50                   	push   %eax
    KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
  10785b:	83 c6 40             	add    $0x40,%esi
    KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
  10785e:	55                   	push   %ebp
  10785f:	6a 28                	push   $0x28
  107861:	57                   	push   %edi
  107862:	e8 19 cf ff ff       	call   104780 <debug_normal>
    KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
  107867:	0f b7 06             	movzwl (%esi),%eax
  10786a:	83 c4 14             	add    $0x14,%esp
  10786d:	50                   	push   %eax
  10786e:	8d 83 a8 77 ff ff    	lea    -0x8858(%ebx),%eax
  107874:	56                   	push   %esi
  107875:	50                   	push   %eax
  107876:	6a 29                	push   $0x29
  107878:	57                   	push   %edi
  107879:	e8 02 cf ff ff       	call   104780 <debug_normal>
}
  10787e:	83 c4 2c             	add    $0x2c,%esp
  107881:	5b                   	pop    %ebx
  107882:	5e                   	pop    %esi
  107883:	5f                   	pop    %edi
  107884:	5d                   	pop    %ebp
  107885:	c3                   	ret
  107886:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10788d:	00 
  10788e:	66 90                	xchg   %ax,%ax

00107890 <interrupt_handler>:

/**
 * Any interrupt request other than the spurious or timer should be
 * routed to the default interrupt handler.
 */
void interrupt_handler(tf_t *tf)
  107890:	c3                   	ret
  107891:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107898:	00 
  107899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001078a0 <default_exception_handler>:
{
  1078a0:	56                   	push   %esi
  1078a1:	53                   	push   %ebx
  1078a2:	e8 fb 8a ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1078a7:	81 c3 4d c7 00 00    	add    $0xc74d,%ebx
  1078ad:	83 ec 04             	sub    $0x4,%esp
  1078b0:	8b 74 24 10          	mov    0x10(%esp),%esi
    cur_pid = get_curid();
  1078b4:	e8 a7 f6 ff ff       	call   106f60 <get_curid>
    if (tf == NULL)
  1078b9:	85 f6                	test   %esi,%esi
  1078bb:	74 07                	je     1078c4 <default_exception_handler+0x24>
  1078bd:	89 f0                	mov    %esi,%eax
  1078bf:	e8 ec fd ff ff       	call   1076b0 <trap_dump.part.0>
    KERN_PANIC("Trap %d @ 0x%08x.\n", tf->trapno, tf->eip);
  1078c4:	83 ec 0c             	sub    $0xc,%esp
  1078c7:	8d 83 be 77 ff ff    	lea    -0x8842(%ebx),%eax
  1078cd:	ff 76 30             	push   0x30(%esi)
  1078d0:	ff 76 28             	push   0x28(%esi)
  1078d3:	50                   	push   %eax
  1078d4:	8d 83 94 82 ff ff    	lea    -0x7d6c(%ebx),%eax
  1078da:	6a 33                	push   $0x33
  1078dc:	50                   	push   %eax
  1078dd:	e8 fe ce ff ff       	call   1047e0 <debug_panic>
}
  1078e2:	83 c4 24             	add    $0x24,%esp
  1078e5:	5b                   	pop    %ebx
  1078e6:	5e                   	pop    %esi
  1078e7:	c3                   	ret
  1078e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1078ef:	00 

001078f0 <pgflt_handler>:
{
  1078f0:	55                   	push   %ebp
  1078f1:	57                   	push   %edi
  1078f2:	56                   	push   %esi
  1078f3:	53                   	push   %ebx
  1078f4:	e8 a9 8a ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1078f9:	81 c3 fb c6 00 00    	add    $0xc6fb,%ebx
  1078ff:	83 ec 0c             	sub    $0xc,%esp
    cur_pid = get_curid();
  107902:	e8 59 f6 ff ff       	call   106f60 <get_curid>
  107907:	89 c7                	mov    %eax,%edi
    errno = tf->err;
  107909:	8b 44 24 20          	mov    0x20(%esp),%eax
  10790d:	8b 68 2c             	mov    0x2c(%eax),%ebp
    fault_va = rcr2();
  107910:	e8 9b dc ff ff       	call   1055b0 <rcr2>
  107915:	89 c6                	mov    %eax,%esi
    if ((errno & 0x3) == 0x3) {
  107917:	89 e8                	mov    %ebp,%eax
  107919:	f7 d0                	not    %eax
  10791b:	a8 03                	test   $0x3,%al
  10791d:	74 61                	je     107980 <pgflt_handler+0x90>
    if (errno & PFE_PR) {
  10791f:	f7 c5 01 00 00 00    	test   $0x1,%ebp
  107925:	75 21                	jne    107948 <pgflt_handler+0x58>
    if (alloc_page(cur_pid, fault_va, PTE_W | PTE_U | PTE_P) == MagicNumber) {
  107927:	83 ec 04             	sub    $0x4,%esp
  10792a:	6a 07                	push   $0x7
  10792c:	56                   	push   %esi
  10792d:	57                   	push   %edi
  10792e:	e8 dd f1 ff ff       	call   106b10 <alloc_page>
  107933:	83 c4 10             	add    $0x10,%esp
  107936:	3d 01 00 10 00       	cmp    $0x100001,%eax
  10793b:	74 73                	je     1079b0 <pgflt_handler+0xc0>
}
  10793d:	83 c4 0c             	add    $0xc,%esp
  107940:	5b                   	pop    %ebx
  107941:	5e                   	pop    %esi
  107942:	5f                   	pop    %edi
  107943:	5d                   	pop    %ebp
  107944:	c3                   	ret
  107945:	8d 76 00             	lea    0x0(%esi),%esi
    if (tf == NULL)
  107948:	8b 44 24 20          	mov    0x20(%esp),%eax
  10794c:	e8 5f fd ff ff       	call   1076b0 <trap_dump.part.0>
        KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n",
  107951:	83 ec 0c             	sub    $0xc,%esp
  107954:	8d 83 e0 82 ff ff    	lea    -0x7d20(%ebx),%eax
  10795a:	55                   	push   %ebp
  10795b:	56                   	push   %esi
  10795c:	50                   	push   %eax
  10795d:	8d 83 94 82 ff ff    	lea    -0x7d6c(%ebx),%eax
  107963:	6a 54                	push   $0x54
  107965:	50                   	push   %eax
  107966:	e8 75 ce ff ff       	call   1047e0 <debug_panic>
        return;
  10796b:	83 c4 20             	add    $0x20,%esp
}
  10796e:	83 c4 0c             	add    $0xc,%esp
  107971:	5b                   	pop    %ebx
  107972:	5e                   	pop    %esi
  107973:	5f                   	pop    %edi
  107974:	5d                   	pop    %ebp
  107975:	c3                   	ret
  107976:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10797d:	00 
  10797e:	66 90                	xchg   %ax,%ax
        pte_entry = get_ptbl_entry_by_va(cur_pid, fault_va);
  107980:	83 ec 08             	sub    $0x8,%esp
  107983:	56                   	push   %esi
  107984:	57                   	push   %edi
  107985:	e8 36 f0 ff ff       	call   1069c0 <get_ptbl_entry_by_va>
        if (pte_entry & PTE_COW) {
  10798a:	83 c4 10             	add    $0x10,%esp
  10798d:	f6 c4 08             	test   $0x8,%ah
  107990:	75 8d                	jne    10791f <pgflt_handler+0x2f>
            KERN_PANIC("Writing to read-only page: va = %p\n", fault_va);
  107992:	8d 83 bc 82 ff ff    	lea    -0x7d44(%ebx),%eax
  107998:	56                   	push   %esi
  107999:	50                   	push   %eax
  10799a:	8d 83 94 82 ff ff    	lea    -0x7d6c(%ebx),%eax
  1079a0:	6a 4a                	push   $0x4a
  1079a2:	50                   	push   %eax
  1079a3:	e8 38 ce ff ff       	call   1047e0 <debug_panic>
  1079a8:	83 c4 10             	add    $0x10,%esp
  1079ab:	e9 6f ff ff ff       	jmp    10791f <pgflt_handler+0x2f>
        KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n",
  1079b0:	83 ec 0c             	sub    $0xc,%esp
  1079b3:	8d 83 14 83 ff ff    	lea    -0x7cec(%ebx),%eax
  1079b9:	55                   	push   %ebp
  1079ba:	56                   	push   %esi
  1079bb:	50                   	push   %eax
  1079bc:	8d 83 94 82 ff ff    	lea    -0x7d6c(%ebx),%eax
  1079c2:	6a 5a                	push   $0x5a
  1079c4:	50                   	push   %eax
  1079c5:	e8 16 ce ff ff       	call   1047e0 <debug_panic>
  1079ca:	83 c4 20             	add    $0x20,%esp
}
  1079cd:	83 c4 0c             	add    $0xc,%esp
  1079d0:	5b                   	pop    %ebx
  1079d1:	5e                   	pop    %esi
  1079d2:	5f                   	pop    %edi
  1079d3:	5d                   	pop    %ebp
  1079d4:	c3                   	ret
  1079d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1079dc:	00 
  1079dd:	8d 76 00             	lea    0x0(%esi),%esi

001079e0 <trap>:
}

unsigned int last_active[NUM_CPUS];

void trap(tf_t *tf)
{
  1079e0:	55                   	push   %ebp
  1079e1:	57                   	push   %edi
  1079e2:	56                   	push   %esi
  1079e3:	53                   	push   %ebx
  1079e4:	e8 b9 89 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1079e9:	81 c3 0b c6 00 00    	add    $0xc60b,%ebx
  1079ef:	83 ec 1c             	sub    $0x1c,%esp
    unsigned int cur_pid = get_curid();
  1079f2:	e8 69 f5 ff ff       	call   106f60 <get_curid>
    unsigned int cpu_idx = get_pcpu_idx();
    trap_cb_t handler;

    unsigned int last_pid = last_active[cpu_idx];
  1079f7:	8d ab 4c 30 51 00    	lea    0x51304c(%ebx),%ebp
    unsigned int cur_pid = get_curid();
  1079fd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    unsigned int cpu_idx = get_pcpu_idx();
  107a01:	e8 3a e9 ff ff       	call   106340 <get_pcpu_idx>
    unsigned int last_pid = last_active[cpu_idx];
  107a06:	8b 7c 85 00          	mov    0x0(%ebp,%eax,4),%edi
    unsigned int cpu_idx = get_pcpu_idx();
  107a0a:	89 c6                	mov    %eax,%esi

    if (last_pid != 0)
  107a0c:	85 ff                	test   %edi,%edi
  107a0e:	75 48                	jne    107a58 <trap+0x78>
    {
        set_pdir_base(0);  // switch to the kernel's page table
        last_active[cpu_idx] = 0;
    }

    handler = TRAP_HANDLER[get_pcpu_idx()][tf->trapno];
  107a10:	e8 2b e9 ff ff       	call   106340 <get_pcpu_idx>
  107a15:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  107a19:	c1 e0 08             	shl    $0x8,%eax
  107a1c:	8b 51 28             	mov    0x28(%ecx),%edx
  107a1f:	c7 c1 60 70 62 00    	mov    $0x627060,%ecx
  107a25:	01 d0                	add    %edx,%eax
  107a27:	8b 04 81             	mov    (%ecx,%eax,4),%eax
#if LAB < 6
    /*
     * Before lab 6 (where you fill in the trap handler table in
     * kern/trap/TTrapInit/TTrapInit.c), traps are routed by their numbers.
     */
    if (handler == NULL) {
  107a2a:	85 c0                	test   %eax,%eax
  107a2c:	74 62                	je     107a90 <trap+0xb0>
            handler = syscall_dispatch;
    }
#endif

    if (handler) {
        handler(tf);
  107a2e:	83 ec 0c             	sub    $0xc,%esp
  107a31:	ff 74 24 3c          	push   0x3c(%esp)
  107a35:	ff d0                	call   *%eax
  107a37:	83 c4 10             	add    $0x10,%esp
    } else {
        KERN_WARN("No handler for user trap 0x%x, process %d, eip 0x%08x.\n",
                  tf->trapno, cur_pid, tf->eip);
    }

    if (last_pid != 0)
  107a3a:	85 ff                	test   %edi,%edi
  107a3c:	75 32                	jne    107a70 <trap+0x90>
        kstack_switch(cur_pid);
        set_pdir_base(cur_pid);
        last_active[cpu_idx] = last_pid;
    }

    trap_return((void *) tf);
  107a3e:	83 ec 0c             	sub    $0xc,%esp
  107a41:	ff 74 24 3c          	push   0x3c(%esp)
  107a45:	e8 36 a8 ff ff       	call   102280 <trap_return>
}
  107a4a:	83 c4 2c             	add    $0x2c,%esp
  107a4d:	5b                   	pop    %ebx
  107a4e:	5e                   	pop    %esi
  107a4f:	5f                   	pop    %edi
  107a50:	5d                   	pop    %ebp
  107a51:	c3                   	ret
  107a52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        set_pdir_base(0);  // switch to the kernel's page table
  107a58:	83 ec 0c             	sub    $0xc,%esp
  107a5b:	6a 00                	push   $0x0
  107a5d:	e8 ce ee ff ff       	call   106930 <set_pdir_base>
        last_active[cpu_idx] = 0;
  107a62:	c7 44 b5 00 00 00 00 	movl   $0x0,0x0(%ebp,%esi,4)
  107a69:	00 
  107a6a:	83 c4 10             	add    $0x10,%esp
  107a6d:	eb a1                	jmp    107a10 <trap+0x30>
  107a6f:	90                   	nop
        kstack_switch(cur_pid);
  107a70:	83 ec 0c             	sub    $0xc,%esp
  107a73:	ff 74 24 18          	push   0x18(%esp)
  107a77:	e8 a4 d5 ff ff       	call   105020 <kstack_switch>
        set_pdir_base(cur_pid);
  107a7c:	58                   	pop    %eax
  107a7d:	ff 74 24 18          	push   0x18(%esp)
  107a81:	e8 aa ee ff ff       	call   106930 <set_pdir_base>
        last_active[cpu_idx] = last_pid;
  107a86:	89 7c b5 00          	mov    %edi,0x0(%ebp,%esi,4)
  107a8a:	83 c4 10             	add    $0x10,%esp
  107a8d:	eb af                	jmp    107a3e <trap+0x5e>
  107a8f:	90                   	nop
        if (T_DIVIDE <= tf->trapno && tf->trapno <= T_SECEV)
  107a90:	83 fa 1e             	cmp    $0x1e,%edx
  107a93:	76 1b                	jbe    107ab0 <trap+0xd0>
                 && tf->trapno <= T_IRQ0 + IRQ_IDE2)
  107a95:	8d 42 e0             	lea    -0x20(%edx),%eax
        else if (T_IRQ0 + IRQ_TIMER <= tf->trapno
  107a98:	83 f8 0f             	cmp    $0xf,%eax
  107a9b:	76 23                	jbe    107ac0 <trap+0xe0>
        else if (tf->trapno == T_SYSCALL)
  107a9d:	83 fa 30             	cmp    $0x30,%edx
  107aa0:	75 2e                	jne    107ad0 <trap+0xf0>
            handler = syscall_dispatch;
  107aa2:	c7 c0 20 75 10 00    	mov    $0x107520,%eax
  107aa8:	eb 84                	jmp    107a2e <trap+0x4e>
  107aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            handler = exception_handler;
  107ab0:	8d 83 ac 36 ff ff    	lea    -0xc954(%ebx),%eax
  107ab6:	e9 73 ff ff ff       	jmp    107a2e <trap+0x4e>
  107abb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
            handler = interrupt_handler;
  107ac0:	8d 83 9c 38 ff ff    	lea    -0xc764(%ebx),%eax
  107ac6:	e9 63 ff ff ff       	jmp    107a2e <trap+0x4e>
  107acb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        KERN_WARN("No handler for user trap 0x%x, process %d, eip 0x%08x.\n",
  107ad0:	83 ec 08             	sub    $0x8,%esp
  107ad3:	8b 44 24 38          	mov    0x38(%esp),%eax
  107ad7:	ff 70 30             	push   0x30(%eax)
  107ada:	8d 83 4c 83 ff ff    	lea    -0x7cb4(%ebx),%eax
  107ae0:	ff 74 24 18          	push   0x18(%esp)
  107ae4:	52                   	push   %edx
  107ae5:	50                   	push   %eax
  107ae6:	8d 83 94 82 ff ff    	lea    -0x7d6c(%ebx),%eax
  107aec:	68 ab 00 00 00       	push   $0xab
  107af1:	50                   	push   %eax
  107af2:	e8 f9 cd ff ff       	call   1048f0 <debug_warn>
  107af7:	83 c4 20             	add    $0x20,%esp
  107afa:	e9 3b ff ff ff       	jmp    107a3a <trap+0x5a>
  107aff:	90                   	nop

00107b00 <trap_init_array>:
int inited = FALSE;

trap_cb_t TRAP_HANDLER[NUM_CPUS][256];

void trap_init_array(void)
{
  107b00:	53                   	push   %ebx
  107b01:	e8 9c 88 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107b06:	81 c3 ee c4 00 00    	add    $0xc4ee,%ebx
  107b0c:	83 ec 08             	sub    $0x8,%esp
    KERN_ASSERT(inited == FALSE);
  107b0f:	8b 83 6c 50 51 00    	mov    0x51506c(%ebx),%eax
  107b15:	85 c0                	test   %eax,%eax
  107b17:	75 27                	jne    107b40 <trap_init_array+0x40>
    memzero(&TRAP_HANDLER, sizeof(trap_cb_t) * 8 * 256);
  107b19:	83 ec 08             	sub    $0x8,%esp
  107b1c:	8d 83 6c 30 51 00    	lea    0x51306c(%ebx),%eax
  107b22:	68 00 20 00 00       	push   $0x2000
  107b27:	50                   	push   %eax
  107b28:	e8 c3 ca ff ff       	call   1045f0 <memzero>
    inited = TRUE;
  107b2d:	c7 83 6c 50 51 00 01 	movl   $0x1,0x51506c(%ebx)
  107b34:	00 00 00 
}
  107b37:	83 c4 18             	add    $0x18,%esp
  107b3a:	5b                   	pop    %ebx
  107b3b:	c3                   	ret
  107b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    KERN_ASSERT(inited == FALSE);
  107b40:	8d 83 d1 77 ff ff    	lea    -0x882f(%ebx),%eax
  107b46:	50                   	push   %eax
  107b47:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  107b4d:	50                   	push   %eax
  107b4e:	8d 83 84 83 ff ff    	lea    -0x7c7c(%ebx),%eax
  107b54:	6a 11                	push   $0x11
  107b56:	50                   	push   %eax
  107b57:	e8 84 cc ff ff       	call   1047e0 <debug_panic>
  107b5c:	83 c4 10             	add    $0x10,%esp
  107b5f:	eb b8                	jmp    107b19 <trap_init_array+0x19>
  107b61:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107b68:	00 
  107b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107b70 <trap_handler_register>:

void trap_handler_register(int cpu_idx, int trapno, trap_cb_t cb)
{
  107b70:	55                   	push   %ebp
  107b71:	57                   	push   %edi
  107b72:	56                   	push   %esi
  107b73:	53                   	push   %ebx
  107b74:	e8 29 88 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107b79:	81 c3 7b c4 00 00    	add    $0xc47b,%ebx
  107b7f:	83 ec 0c             	sub    $0xc,%esp
  107b82:	8b 74 24 20          	mov    0x20(%esp),%esi
  107b86:	8b 6c 24 24          	mov    0x24(%esp),%ebp
  107b8a:	8b 7c 24 28          	mov    0x28(%esp),%edi
    KERN_ASSERT(0 <= cpu_idx && cpu_idx < 8);
  107b8e:	83 fe 07             	cmp    $0x7,%esi
  107b91:	77 25                	ja     107bb8 <trap_handler_register+0x48>
    KERN_ASSERT(0 <= trapno && trapno < 256);
  107b93:	81 fd ff 00 00 00    	cmp    $0xff,%ebp
  107b99:	77 44                	ja     107bdf <trap_handler_register+0x6f>
    KERN_ASSERT(cb != NULL);
  107b9b:	85 ff                	test   %edi,%edi
  107b9d:	74 63                	je     107c02 <trap_handler_register+0x92>

    TRAP_HANDLER[cpu_idx][trapno] = cb;
  107b9f:	c1 e6 08             	shl    $0x8,%esi
  107ba2:	01 ee                	add    %ebp,%esi
  107ba4:	89 bc b3 6c 30 51 00 	mov    %edi,0x51306c(%ebx,%esi,4)
}
  107bab:	83 c4 0c             	add    $0xc,%esp
  107bae:	5b                   	pop    %ebx
  107baf:	5e                   	pop    %esi
  107bb0:	5f                   	pop    %edi
  107bb1:	5d                   	pop    %ebp
  107bb2:	c3                   	ret
  107bb3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    KERN_ASSERT(0 <= cpu_idx && cpu_idx < 8);
  107bb8:	8d 83 e1 77 ff ff    	lea    -0x881f(%ebx),%eax
  107bbe:	50                   	push   %eax
  107bbf:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  107bc5:	50                   	push   %eax
  107bc6:	8d 83 84 83 ff ff    	lea    -0x7c7c(%ebx),%eax
  107bcc:	6a 18                	push   $0x18
  107bce:	50                   	push   %eax
  107bcf:	e8 0c cc ff ff       	call   1047e0 <debug_panic>
  107bd4:	83 c4 10             	add    $0x10,%esp
    KERN_ASSERT(0 <= trapno && trapno < 256);
  107bd7:	81 fd ff 00 00 00    	cmp    $0xff,%ebp
  107bdd:	76 bc                	jbe    107b9b <trap_handler_register+0x2b>
  107bdf:	8d 83 fd 77 ff ff    	lea    -0x8803(%ebx),%eax
  107be5:	50                   	push   %eax
  107be6:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  107bec:	50                   	push   %eax
  107bed:	8d 83 84 83 ff ff    	lea    -0x7c7c(%ebx),%eax
  107bf3:	6a 19                	push   $0x19
  107bf5:	50                   	push   %eax
  107bf6:	e8 e5 cb ff ff       	call   1047e0 <debug_panic>
  107bfb:	83 c4 10             	add    $0x10,%esp
    KERN_ASSERT(cb != NULL);
  107bfe:	85 ff                	test   %edi,%edi
  107c00:	75 9d                	jne    107b9f <trap_handler_register+0x2f>
  107c02:	8d 83 19 78 ff ff    	lea    -0x87e7(%ebx),%eax
  107c08:	50                   	push   %eax
  107c09:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  107c0f:	50                   	push   %eax
  107c10:	8d 83 84 83 ff ff    	lea    -0x7c7c(%ebx),%eax
  107c16:	6a 1a                	push   $0x1a
  107c18:	50                   	push   %eax
  107c19:	e8 c2 cb ff ff       	call   1047e0 <debug_panic>
  107c1e:	83 c4 10             	add    $0x10,%esp
  107c21:	e9 79 ff ff ff       	jmp    107b9f <trap_handler_register+0x2f>
  107c26:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107c2d:	00 
  107c2e:	66 90                	xchg   %ax,%ax

00107c30 <trap_init>:

void trap_init(unsigned int cpu_idx)
{
  107c30:	57                   	push   %edi
  107c31:	56                   	push   %esi
  107c32:	53                   	push   %ebx
  107c33:	8b 74 24 10          	mov    0x10(%esp),%esi
  107c37:	e8 66 87 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107c3c:	81 c3 b8 c3 00 00    	add    $0xc3b8,%ebx
    if (cpu_idx == 0) {
  107c42:	85 f6                	test   %esi,%esi
  107c44:	74 6a                	je     107cb0 <trap_init+0x80>
        trap_init_array();
    }

    KERN_INFO_CPU("Register trap handlers...\n", cpu_idx);
  107c46:	83 ec 08             	sub    $0x8,%esp
  107c49:	8d 83 a4 83 ff ff    	lea    -0x7c5c(%ebx),%eax
    // TODO [Lab 6]: for CPU # [cpu_idx], register appropriate trap handler for each trap number,
    // with trap_handler_register function defined above.
    // (Until you do this, labs 1-5 route traps by number in trap(), see
    // kern/trap/TTrapHandler/TTrapHandler.c; from lab 6 on that fallback is gone.)

    KERN_INFO_CPU("Done.\n", cpu_idx);
  107c4f:	8d bb 24 78 ff ff    	lea    -0x87dc(%ebx),%edi
    KERN_INFO_CPU("Register trap handlers...\n", cpu_idx);
  107c55:	56                   	push   %esi
  107c56:	50                   	push   %eax
  107c57:	e8 e4 ca ff ff       	call   104740 <debug_info>
    KERN_INFO_CPU("Done.\n", cpu_idx);
  107c5c:	58                   	pop    %eax
  107c5d:	5a                   	pop    %edx
  107c5e:	56                   	push   %esi
  107c5f:	57                   	push   %edi
  107c60:	e8 db ca ff ff       	call   104740 <debug_info>
    KERN_INFO_CPU("Enabling interrupts...\n", cpu_idx);
  107c65:	59                   	pop    %ecx
  107c66:	58                   	pop    %eax
  107c67:	8d 83 cc 83 ff ff    	lea    -0x7c34(%ebx),%eax
  107c6d:	56                   	push   %esi
  107c6e:	50                   	push   %eax
  107c6f:	e8 cc ca ff ff       	call   104740 <debug_info>

    /* enable interrupts */
    intr_enable(IRQ_TIMER, cpu_idx);
  107c74:	58                   	pop    %eax
  107c75:	5a                   	pop    %edx
  107c76:	56                   	push   %esi
  107c77:	6a 00                	push   $0x0
  107c79:	e8 62 9b ff ff       	call   1017e0 <intr_enable>
    intr_enable(IRQ_KBD, cpu_idx);
  107c7e:	59                   	pop    %ecx
  107c7f:	58                   	pop    %eax
  107c80:	56                   	push   %esi
  107c81:	6a 01                	push   $0x1
  107c83:	e8 58 9b ff ff       	call   1017e0 <intr_enable>
    intr_enable(IRQ_SERIAL13, cpu_idx);
  107c88:	58                   	pop    %eax
  107c89:	5a                   	pop    %edx
  107c8a:	56                   	push   %esi
  107c8b:	6a 04                	push   $0x4
  107c8d:	e8 4e 9b ff ff       	call   1017e0 <intr_enable>
    intr_enable(IRQ_IDE1, cpu_idx);
  107c92:	59                   	pop    %ecx
  107c93:	58                   	pop    %eax
  107c94:	56                   	push   %esi
  107c95:	6a 0e                	push   $0xe
  107c97:	e8 44 9b ff ff       	call   1017e0 <intr_enable>

    KERN_INFO_CPU("Done.\n", cpu_idx);
  107c9c:	58                   	pop    %eax
  107c9d:	5a                   	pop    %edx
  107c9e:	56                   	push   %esi
  107c9f:	57                   	push   %edi
  107ca0:	e8 9b ca ff ff       	call   104740 <debug_info>
  107ca5:	83 c4 10             	add    $0x10,%esp
}
  107ca8:	5b                   	pop    %ebx
  107ca9:	5e                   	pop    %esi
  107caa:	5f                   	pop    %edi
  107cab:	c3                   	ret
  107cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    KERN_ASSERT(inited == FALSE);
  107cb0:	8b 83 6c 50 51 00    	mov    0x51506c(%ebx),%eax
  107cb6:	85 c0                	test   %eax,%eax
  107cb8:	0f 85 8a 00 00 00    	jne    107d48 <trap_init+0x118>
    memzero(&TRAP_HANDLER, sizeof(trap_cb_t) * 8 * 256);
  107cbe:	83 ec 08             	sub    $0x8,%esp
  107cc1:	8d 83 6c 30 51 00    	lea    0x51306c(%ebx),%eax
    KERN_INFO_CPU("Done.\n", cpu_idx);
  107cc7:	8d b3 37 78 ff ff    	lea    -0x87c9(%ebx),%esi
    memzero(&TRAP_HANDLER, sizeof(trap_cb_t) * 8 * 256);
  107ccd:	68 00 20 00 00       	push   $0x2000
  107cd2:	50                   	push   %eax
  107cd3:	e8 18 c9 ff ff       	call   1045f0 <memzero>
    KERN_INFO_CPU("Register trap handlers...\n", cpu_idx);
  107cd8:	8d 83 f0 83 ff ff    	lea    -0x7c10(%ebx),%eax
    inited = TRUE;
  107cde:	c7 83 6c 50 51 00 01 	movl   $0x1,0x51506c(%ebx)
  107ce5:	00 00 00 
    KERN_INFO_CPU("Register trap handlers...\n", cpu_idx);
  107ce8:	89 04 24             	mov    %eax,(%esp)
  107ceb:	e8 50 ca ff ff       	call   104740 <debug_info>
    KERN_INFO_CPU("Done.\n", cpu_idx);
  107cf0:	89 34 24             	mov    %esi,(%esp)
  107cf3:	e8 48 ca ff ff       	call   104740 <debug_info>
    KERN_INFO_CPU("Enabling interrupts...\n", cpu_idx);
  107cf8:	8d 83 18 84 ff ff    	lea    -0x7be8(%ebx),%eax
  107cfe:	89 04 24             	mov    %eax,(%esp)
  107d01:	e8 3a ca ff ff       	call   104740 <debug_info>
    intr_enable(IRQ_TIMER, cpu_idx);
  107d06:	58                   	pop    %eax
  107d07:	5a                   	pop    %edx
  107d08:	6a 00                	push   $0x0
  107d0a:	6a 00                	push   $0x0
  107d0c:	e8 cf 9a ff ff       	call   1017e0 <intr_enable>
    intr_enable(IRQ_KBD, cpu_idx);
  107d11:	59                   	pop    %ecx
  107d12:	5f                   	pop    %edi
  107d13:	6a 00                	push   $0x0
  107d15:	6a 01                	push   $0x1
  107d17:	e8 c4 9a ff ff       	call   1017e0 <intr_enable>
    intr_enable(IRQ_SERIAL13, cpu_idx);
  107d1c:	58                   	pop    %eax
  107d1d:	5a                   	pop    %edx
  107d1e:	6a 00                	push   $0x0
  107d20:	6a 04                	push   $0x4
  107d22:	e8 b9 9a ff ff       	call   1017e0 <intr_enable>
    intr_enable(IRQ_IDE1, cpu_idx);
  107d27:	59                   	pop    %ecx
  107d28:	5f                   	pop    %edi
  107d29:	6a 00                	push   $0x0
  107d2b:	6a 0e                	push   $0xe
  107d2d:	e8 ae 9a ff ff       	call   1017e0 <intr_enable>
    KERN_INFO_CPU("Done.\n", cpu_idx);
  107d32:	89 34 24             	mov    %esi,(%esp)
  107d35:	e8 06 ca ff ff       	call   104740 <debug_info>
  107d3a:	83 c4 10             	add    $0x10,%esp
}
  107d3d:	5b                   	pop    %ebx
  107d3e:	5e                   	pop    %esi
  107d3f:	5f                   	pop    %edi
  107d40:	c3                   	ret
  107d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    KERN_ASSERT(inited == FALSE);
  107d48:	8d 83 d1 77 ff ff    	lea    -0x882f(%ebx),%eax
  107d4e:	50                   	push   %eax
  107d4f:	8d 83 b8 70 ff ff    	lea    -0x8f48(%ebx),%eax
  107d55:	50                   	push   %eax
  107d56:	8d 83 84 83 ff ff    	lea    -0x7c7c(%ebx),%eax
  107d5c:	6a 11                	push   $0x11
  107d5e:	50                   	push   %eax
  107d5f:	e8 7c ca ff ff       	call   1047e0 <debug_panic>
  107d64:	83 c4 10             	add    $0x10,%esp
  107d67:	e9 52 ff ff ff       	jmp    107cbe <trap_init+0x8e>
  107d6c:	66 90                	xchg   %ax,%ax
  107d6e:	66 90                	xchg   %ax,%ax

00107d70 <bufcache_init>:
    // head.next is most recently used.
    struct buf head;
} bcache;

void bufcache_init(void)
{
  107d70:	57                   	push   %edi
  107d71:	56                   	push   %esi
  107d72:	e8 2e be ff ff       	call   103ba5 <__x86.get_pc_thunk.si>
  107d77:	81 c6 7d c2 00 00    	add    $0xc27d,%esi
  107d7d:	53                   	push   %ebx
    struct buf *b;

    spinlock_init(&bcache.lock);
  107d7e:	83 ec 0c             	sub    $0xc,%esp
  107d81:	8d be 8c 50 51 00    	lea    0x51508c(%esi),%edi
  107d87:	89 f3                	mov    %esi,%ebx
  107d89:	57                   	push   %edi
  107d8a:	e8 11 e2 ff ff       	call   105fa0 <spinlock_init>

    // Create linked list of buffers
    bcache.head.prev = &bcache.head;
  107d8f:	8d 97 f8 14 00 00    	lea    0x14f8(%edi),%edx
  107d95:	83 c4 10             	add    $0x10,%esp
    bcache.head.next = &bcache.head;
    for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
  107d98:	8d 47 08             	lea    0x8(%edi),%eax
    bcache.head.prev = &bcache.head;
  107d9b:	89 96 90 65 51 00    	mov    %edx,0x516590(%esi)
    for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
  107da1:	8d 9e 84 65 51 00    	lea    0x516584(%esi),%ebx
  107da7:	eb 09                	jmp    107db2 <bufcache_init+0x42>
  107da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  107db0:	89 c8                	mov    %ecx,%eax
  107db2:	8d 88 18 02 00 00    	lea    0x218(%eax),%ecx
        b->next = bcache.head.next;
  107db8:	89 50 10             	mov    %edx,0x10(%eax)
        b->prev = &bcache.head;
  107dbb:	89 58 0c             	mov    %ebx,0xc(%eax)
        b->dev = -1;
  107dbe:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
        bcache.head.next->prev = b;
  107dc5:	89 42 0c             	mov    %eax,0xc(%edx)
    for (b = bcache.buf; b < bcache.buf + NBUF; b++) {
  107dc8:	89 c2                	mov    %eax,%edx
  107dca:	39 d9                	cmp    %ebx,%ecx
  107dcc:	75 e2                	jne    107db0 <bufcache_init+0x40>
        bcache.head.next = b;
    }
}
  107dce:	5b                   	pop    %ebx
  107dcf:	89 86 94 65 51 00    	mov    %eax,0x516594(%esi)
  107dd5:	5e                   	pop    %esi
  107dd6:	5f                   	pop    %edi
  107dd7:	c3                   	ret
  107dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107ddf:	00 

00107de0 <bufcache_read>:

/**
 * Return a B_BUSY buf with the contents of the indicated disk sector.
 */
struct buf *bufcache_read(uint32_t dev, uint32_t sector)
{
  107de0:	55                   	push   %ebp
  107de1:	57                   	push   %edi
  107de2:	56                   	push   %esi
  107de3:	53                   	push   %ebx
  107de4:	e8 b9 85 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107de9:	81 c3 0b c2 00 00    	add    $0xc20b,%ebx
  107def:	83 ec 28             	sub    $0x28,%esp
  107df2:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
    spinlock_acquire(&bcache.lock);
  107df6:	8d 83 8c 50 51 00    	lea    0x51508c(%ebx),%eax
  107dfc:	8d bb 84 65 51 00    	lea    0x516584(%ebx),%edi
  107e02:	89 44 24 14          	mov    %eax,0x14(%esp)
  107e06:	50                   	push   %eax
  107e07:	e8 24 e2 ff ff       	call   106030 <spinlock_acquire>
  107e0c:	8b 44 24 44          	mov    0x44(%esp),%eax
  107e10:	83 c4 10             	add    $0x10,%esp
  107e13:	8d 15 8c 50 51 00    	lea    0x51508c,%edx
    for (b = bcache.head.next; b != &bcache.head; b = b->next) {
  107e19:	8b b4 1a 08 15 00 00 	mov    0x1508(%edx,%ebx,1),%esi
  107e20:	39 fe                	cmp    %edi,%esi
  107e22:	75 13                	jne    107e37 <bufcache_read+0x57>
  107e24:	eb 4a                	jmp    107e70 <bufcache_read+0x90>
  107e26:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107e2d:	00 
  107e2e:	66 90                	xchg   %ax,%ax
  107e30:	8b 76 10             	mov    0x10(%esi),%esi
  107e33:	39 fe                	cmp    %edi,%esi
  107e35:	74 39                	je     107e70 <bufcache_read+0x90>
        if (b->dev == dev && b->sector == sector) {
  107e37:	3b 6e 04             	cmp    0x4(%esi),%ebp
  107e3a:	75 f4                	jne    107e30 <bufcache_read+0x50>
  107e3c:	3b 46 08             	cmp    0x8(%esi),%eax
  107e3f:	75 ef                	jne    107e30 <bufcache_read+0x50>
            if (!(b->flags & B_BUSY)) {
  107e41:	8b 0e                	mov    (%esi),%ecx
  107e43:	f6 c1 01             	test   $0x1,%cl
  107e46:	0f 84 8a 00 00 00    	je     107ed6 <bufcache_read+0xf6>
  107e4c:	89 54 24 0c          	mov    %edx,0xc(%esp)
            thread_sleep(b, &bcache.lock);
  107e50:	83 ec 08             	sub    $0x8,%esp
  107e53:	89 44 24 3c          	mov    %eax,0x3c(%esp)
  107e57:	ff 74 24 10          	push   0x10(%esp)
  107e5b:	56                   	push   %esi
  107e5c:	e8 af f2 ff ff       	call   107110 <thread_sleep>
            goto loop;
  107e61:	83 c4 10             	add    $0x10,%esp
  107e64:	8b 44 24 34          	mov    0x34(%esp),%eax
  107e68:	8b 54 24 0c          	mov    0xc(%esp),%edx
  107e6c:	eb ab                	jmp    107e19 <bufcache_read+0x39>
  107e6e:	66 90                	xchg   %ax,%ax
    for (b = bcache.head.prev; b != &bcache.head; b = b->prev) {
  107e70:	8b b3 90 65 51 00    	mov    0x516590(%ebx),%esi
  107e76:	39 fe                	cmp    %edi,%esi
  107e78:	75 0d                	jne    107e87 <bufcache_read+0xa7>
  107e7a:	eb 70                	jmp    107eec <bufcache_read+0x10c>
  107e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  107e80:	8b 76 0c             	mov    0xc(%esi),%esi
  107e83:	39 fe                	cmp    %edi,%esi
  107e85:	74 65                	je     107eec <bufcache_read+0x10c>
        if ((b->flags & B_BUSY) == 0 && (b->flags & B_DIRTY) == 0) {
  107e87:	f6 06 05             	testb  $0x5,(%esi)
  107e8a:	75 f4                	jne    107e80 <bufcache_read+0xa0>
            spinlock_release(&bcache.lock);
  107e8c:	83 ec 0c             	sub    $0xc,%esp
            b->dev = dev;
  107e8f:	89 6e 04             	mov    %ebp,0x4(%esi)
            b->sector = sector;
  107e92:	89 46 08             	mov    %eax,0x8(%esi)
            b->flags = B_BUSY;
  107e95:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
            spinlock_release(&bcache.lock);
  107e9b:	ff 74 24 14          	push   0x14(%esp)
  107e9f:	e8 0c e2 ff ff       	call   1060b0 <spinlock_release>
            return b;
  107ea4:	83 c4 10             	add    $0x10,%esp
    struct buf *b;

    b = bufcache_get(dev, sector);
    if (!(b->flags & B_VALID)) {
  107ea7:	f6 06 02             	testb  $0x2,(%esi)
  107eaa:	74 14                	je     107ec0 <bufcache_read+0xe0>
        ide_rw(b);
    }
    return b;
}
  107eac:	83 c4 1c             	add    $0x1c,%esp
  107eaf:	89 f0                	mov    %esi,%eax
  107eb1:	5b                   	pop    %ebx
  107eb2:	5e                   	pop    %esi
  107eb3:	5f                   	pop    %edi
  107eb4:	5d                   	pop    %ebp
  107eb5:	c3                   	ret
  107eb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107ebd:	00 
  107ebe:	66 90                	xchg   %ax,%ax
        ide_rw(b);
  107ec0:	83 ec 0c             	sub    $0xc,%esp
  107ec3:	56                   	push   %esi
  107ec4:	e8 b7 c1 ff ff       	call   104080 <ide_rw>
  107ec9:	83 c4 10             	add    $0x10,%esp
}
  107ecc:	89 f0                	mov    %esi,%eax
  107ece:	83 c4 1c             	add    $0x1c,%esp
  107ed1:	5b                   	pop    %ebx
  107ed2:	5e                   	pop    %esi
  107ed3:	5f                   	pop    %edi
  107ed4:	5d                   	pop    %ebp
  107ed5:	c3                   	ret
                spinlock_release(&bcache.lock);
  107ed6:	83 ec 0c             	sub    $0xc,%esp
                b->flags |= B_BUSY;
  107ed9:	83 c9 01             	or     $0x1,%ecx
  107edc:	89 0e                	mov    %ecx,(%esi)
                spinlock_release(&bcache.lock);
  107ede:	ff 74 24 14          	push   0x14(%esp)
  107ee2:	e8 c9 e1 ff ff       	call   1060b0 <spinlock_release>
                return b;
  107ee7:	83 c4 10             	add    $0x10,%esp
  107eea:	eb bb                	jmp    107ea7 <bufcache_read+0xc7>
    KERN_PANIC("bufcache_get: no buffers");
  107eec:	50                   	push   %eax
  107eed:	8d 83 49 78 ff ff    	lea    -0x87b7(%ebx),%eax
  107ef3:	50                   	push   %eax
  107ef4:	8d 83 62 78 ff ff    	lea    -0x879e(%ebx),%eax
  107efa:	6a 5d                	push   $0x5d
  107efc:	50                   	push   %eax
  107efd:	e8 de c8 ff ff       	call   1047e0 <debug_panic>
    if (!(b->flags & B_VALID)) {
  107f02:	a1 00 00 00 00       	mov    0x0,%eax
  107f07:	0f 0b                	ud2
  107f09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00107f10 <bufcache_write>:

/**
 * Write b's contents to disk. Must be B_BUSY.
 */
void bufcache_write(struct buf *b)
{
  107f10:	56                   	push   %esi
  107f11:	53                   	push   %ebx
  107f12:	e8 8b 84 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107f17:	81 c3 dd c0 00 00    	add    $0xc0dd,%ebx
  107f1d:	83 ec 04             	sub    $0x4,%esp
  107f20:	8b 74 24 10          	mov    0x10(%esp),%esi
    if ((b->flags & B_BUSY) == 0)
  107f24:	8b 06                	mov    (%esi),%eax
  107f26:	a8 01                	test   $0x1,%al
  107f28:	74 16                	je     107f40 <bufcache_write+0x30>
        KERN_PANIC("bwrite");

    b->flags |= B_DIRTY;
    ide_rw(b);
  107f2a:	83 ec 0c             	sub    $0xc,%esp
    b->flags |= B_DIRTY;
  107f2d:	83 c8 04             	or     $0x4,%eax
  107f30:	89 06                	mov    %eax,(%esi)
    ide_rw(b);
  107f32:	56                   	push   %esi
  107f33:	e8 48 c1 ff ff       	call   104080 <ide_rw>
}
  107f38:	83 c4 14             	add    $0x14,%esp
  107f3b:	5b                   	pop    %ebx
  107f3c:	5e                   	pop    %esi
  107f3d:	c3                   	ret
  107f3e:	66 90                	xchg   %ax,%ax
        KERN_PANIC("bwrite");
  107f40:	83 ec 04             	sub    $0x4,%esp
  107f43:	8d 83 75 78 ff ff    	lea    -0x878b(%ebx),%eax
  107f49:	50                   	push   %eax
  107f4a:	8d 83 62 78 ff ff    	lea    -0x879e(%ebx),%eax
  107f50:	6a 75                	push   $0x75
  107f52:	50                   	push   %eax
  107f53:	e8 88 c8 ff ff       	call   1047e0 <debug_panic>
    b->flags |= B_DIRTY;
  107f58:	8b 06                	mov    (%esi),%eax
  107f5a:	83 c4 10             	add    $0x10,%esp
  107f5d:	eb cb                	jmp    107f2a <bufcache_write+0x1a>
  107f5f:	90                   	nop

00107f60 <bufcache_release>:
/**
 * Release a B_BUSY buffer.
 * Move to the head of the MRU list.
 */
void bufcache_release(struct buf *b)
{
  107f60:	57                   	push   %edi
  107f61:	56                   	push   %esi
  107f62:	53                   	push   %ebx
  107f63:	8b 74 24 10          	mov    0x10(%esp),%esi
  107f67:	e8 36 84 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107f6c:	81 c3 88 c0 00 00    	add    $0xc088,%ebx
    if ((b->flags & B_BUSY) == 0)
  107f72:	f6 06 01             	testb  $0x1,(%esi)
  107f75:	74 59                	je     107fd0 <bufcache_release+0x70>
        KERN_PANIC("brelse");

    spinlock_acquire(&bcache.lock);
  107f77:	83 ec 0c             	sub    $0xc,%esp
  107f7a:	8d bb 8c 50 51 00    	lea    0x51508c(%ebx),%edi
  107f80:	57                   	push   %edi
  107f81:	e8 aa e0 ff ff       	call   106030 <spinlock_acquire>

    b->next->prev = b->prev;
  107f86:	8b 56 10             	mov    0x10(%esi),%edx
  107f89:	8b 46 0c             	mov    0xc(%esi),%eax
  107f8c:	89 42 0c             	mov    %eax,0xc(%edx)
    b->prev->next = b->next;
  107f8f:	89 50 10             	mov    %edx,0x10(%eax)
    b->next = bcache.head.next;
  107f92:	8b 83 94 65 51 00    	mov    0x516594(%ebx),%eax
    b->prev = &bcache.head;
  107f98:	8d 97 f8 14 00 00    	lea    0x14f8(%edi),%edx
  107f9e:	89 56 0c             	mov    %edx,0xc(%esi)
    b->next = bcache.head.next;
  107fa1:	89 46 10             	mov    %eax,0x10(%esi)
    bcache.head.next->prev = b;
  107fa4:	89 70 0c             	mov    %esi,0xc(%eax)
    bcache.head.next = b;
  107fa7:	89 b3 94 65 51 00    	mov    %esi,0x516594(%ebx)

    b->flags &= ~B_BUSY;
  107fad:	83 26 fe             	andl   $0xfffffffe,(%esi)
    thread_wakeup(b);
  107fb0:	89 34 24             	mov    %esi,(%esp)
  107fb3:	e8 98 f1 ff ff       	call   107150 <thread_wakeup>

    spinlock_release(&bcache.lock);
  107fb8:	89 3c 24             	mov    %edi,(%esp)
  107fbb:	e8 f0 e0 ff ff       	call   1060b0 <spinlock_release>
}
  107fc0:	83 c4 10             	add    $0x10,%esp
  107fc3:	5b                   	pop    %ebx
  107fc4:	5e                   	pop    %esi
  107fc5:	5f                   	pop    %edi
  107fc6:	c3                   	ret
  107fc7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  107fce:	00 
  107fcf:	90                   	nop
        KERN_PANIC("brelse");
  107fd0:	83 ec 04             	sub    $0x4,%esp
  107fd3:	8d 83 7c 78 ff ff    	lea    -0x8784(%ebx),%eax
  107fd9:	50                   	push   %eax
  107fda:	8d 83 62 78 ff ff    	lea    -0x879e(%ebx),%eax
  107fe0:	68 82 00 00 00       	push   $0x82
  107fe5:	50                   	push   %eax
  107fe6:	e8 f5 c7 ff ff       	call   1047e0 <debug_panic>
  107feb:	83 c4 10             	add    $0x10,%esp
  107fee:	eb 87                	jmp    107f77 <bufcache_release+0x17>

00107ff0 <install_trans>:
    recover_from_log();
}

// Copy committed blocks from log to their home location.
static void install_trans(void)
{
  107ff0:	55                   	push   %ebp
  107ff1:	57                   	push   %edi
  107ff2:	56                   	push   %esi
  107ff3:	53                   	push   %ebx
  107ff4:	e8 a9 83 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  107ff9:	81 c3 fb bf 00 00    	add    $0xbffb,%ebx
  107fff:	83 ec 1c             	sub    $0x1c,%esp
    int tail;

    for (tail = 0; tail < log.lh.n; tail++) {
  108002:	8b b3 c4 67 51 00    	mov    0x5167c4(%ebx),%esi
  108008:	85 f6                	test   %esi,%esi
  10800a:	7e 79                	jle    108085 <install_trans+0x95>
  10800c:	31 ed                	xor    %ebp,%ebp
  10800e:	8d 3d ac 67 51 00    	lea    0x5167ac,%edi
  108014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        struct buf *lbuf = bufcache_read(log.dev, log.start + tail + 1);  // read log block
  108018:	8b 44 1f 08          	mov    0x8(%edi,%ebx,1),%eax
  10801c:	83 ec 08             	sub    $0x8,%esp
  10801f:	01 e8                	add    %ebp,%eax
  108021:	83 c0 01             	add    $0x1,%eax
  108024:	50                   	push   %eax
  108025:	ff 74 1f 14          	push   0x14(%edi,%ebx,1)
  108029:	e8 b2 fd ff ff       	call   107de0 <bufcache_read>
  10802e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        struct buf *dbuf = bufcache_read(log.dev, log.lh.sector[tail]);   // read dst
  108032:	58                   	pop    %eax
  108033:	5a                   	pop    %edx
  108034:	ff b4 ab c8 67 51 00 	push   0x5167c8(%ebx,%ebp,4)
    for (tail = 0; tail < log.lh.n; tail++) {
  10803b:	83 c5 01             	add    $0x1,%ebp
        struct buf *dbuf = bufcache_read(log.dev, log.lh.sector[tail]);   // read dst
  10803e:	ff 74 1f 14          	push   0x14(%edi,%ebx,1)
  108042:	e8 99 fd ff ff       	call   107de0 <bufcache_read>
        memmove(dbuf->data, lbuf->data, BSIZE);                           // copy block to dst
  108047:	83 c4 0c             	add    $0xc,%esp
  10804a:	68 00 02 00 00       	push   $0x200
        struct buf *dbuf = bufcache_read(log.dev, log.lh.sector[tail]);   // read dst
  10804f:	89 c6                	mov    %eax,%esi
        memmove(dbuf->data, lbuf->data, BSIZE);                           // copy block to dst
  108051:	8b 44 24 14          	mov    0x14(%esp),%eax
  108055:	83 c0 18             	add    $0x18,%eax
  108058:	50                   	push   %eax
  108059:	8d 46 18             	lea    0x18(%esi),%eax
  10805c:	50                   	push   %eax
  10805d:	e8 fe c3 ff ff       	call   104460 <memmove>
        bufcache_write(dbuf);                                             // write dst to disk
  108062:	89 34 24             	mov    %esi,(%esp)
  108065:	e8 a6 fe ff ff       	call   107f10 <bufcache_write>
        bufcache_release(lbuf);
  10806a:	59                   	pop    %ecx
  10806b:	ff 74 24 18          	push   0x18(%esp)
  10806f:	e8 ec fe ff ff       	call   107f60 <bufcache_release>
        bufcache_release(dbuf);
  108074:	89 34 24             	mov    %esi,(%esp)
  108077:	e8 e4 fe ff ff       	call   107f60 <bufcache_release>
    for (tail = 0; tail < log.lh.n; tail++) {
  10807c:	83 c4 10             	add    $0x10,%esp
  10807f:	39 6c 1f 18          	cmp    %ebp,0x18(%edi,%ebx,1)
  108083:	7f 93                	jg     108018 <install_trans+0x28>
    }
}
  108085:	83 c4 1c             	add    $0x1c,%esp
  108088:	5b                   	pop    %ebx
  108089:	5e                   	pop    %esi
  10808a:	5f                   	pop    %edi
  10808b:	5d                   	pop    %ebp
  10808c:	c3                   	ret
  10808d:	8d 76 00             	lea    0x0(%esi),%esi

00108090 <write_head>:
}

// Write in-memory log header to disk.
// This is the true point at which the current transaction commits.
static void write_head(void)
{
  108090:	57                   	push   %edi
  108091:	56                   	push   %esi
  108092:	e8 0e bb ff ff       	call   103ba5 <__x86.get_pc_thunk.si>
  108097:	81 c6 5d bf 00 00    	add    $0xbf5d,%esi
  10809d:	53                   	push   %ebx
    struct buf *buf = bufcache_read(log.dev, log.start);
  10809e:	83 ec 08             	sub    $0x8,%esp
  1080a1:	ff b6 b4 67 51 00    	push   0x5167b4(%esi)
  1080a7:	89 f3                	mov    %esi,%ebx
  1080a9:	ff b6 c0 67 51 00    	push   0x5167c0(%esi)
  1080af:	e8 2c fd ff ff       	call   107de0 <bufcache_read>
    struct logheader *hb = (struct logheader *) (buf->data);
    int i;
    hb->n = log.lh.n;
  1080b4:	8b 8e c4 67 51 00    	mov    0x5167c4(%esi),%ecx
    for (i = 0; i < log.lh.n; i++) {
  1080ba:	83 c4 10             	add    $0x10,%esp
    struct buf *buf = bufcache_read(log.dev, log.start);
  1080bd:	89 c7                	mov    %eax,%edi
    hb->n = log.lh.n;
  1080bf:	89 48 18             	mov    %ecx,0x18(%eax)
    for (i = 0; i < log.lh.n; i++) {
  1080c2:	85 c9                	test   %ecx,%ecx
  1080c4:	7e 21                	jle    1080e7 <write_head+0x57>
  1080c6:	8d 96 c8 67 51 00    	lea    0x5167c8(%esi),%edx
  1080cc:	8d 40 1c             	lea    0x1c(%eax),%eax
  1080cf:	8d 5c 8f 1c          	lea    0x1c(%edi,%ecx,4),%ebx
  1080d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        hb->sector[i] = log.lh.sector[i];
  1080d8:	8b 0a                	mov    (%edx),%ecx
    for (i = 0; i < log.lh.n; i++) {
  1080da:	83 c0 04             	add    $0x4,%eax
  1080dd:	83 c2 04             	add    $0x4,%edx
        hb->sector[i] = log.lh.sector[i];
  1080e0:	89 48 fc             	mov    %ecx,-0x4(%eax)
    for (i = 0; i < log.lh.n; i++) {
  1080e3:	39 d8                	cmp    %ebx,%eax
  1080e5:	75 f1                	jne    1080d8 <write_head+0x48>
    }
    bufcache_write(buf);
  1080e7:	83 ec 0c             	sub    $0xc,%esp
  1080ea:	89 f3                	mov    %esi,%ebx
  1080ec:	57                   	push   %edi
  1080ed:	e8 1e fe ff ff       	call   107f10 <bufcache_write>
    bufcache_release(buf);
  1080f2:	89 3c 24             	mov    %edi,(%esp)
  1080f5:	e8 66 fe ff ff       	call   107f60 <bufcache_release>
}
  1080fa:	83 c4 10             	add    $0x10,%esp
  1080fd:	5b                   	pop    %ebx
  1080fe:	5e                   	pop    %esi
  1080ff:	5f                   	pop    %edi
  108100:	c3                   	ret
  108101:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108108:	00 
  108109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00108110 <log_init>:
{
  108110:	57                   	push   %edi
  108111:	56                   	push   %esi
  108112:	53                   	push   %ebx
  108113:	e8 8a 82 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108118:	81 c3 dc be 00 00    	add    $0xbedc,%ebx
  10811e:	83 ec 1c             	sub    $0x1c,%esp
    spinlock_init(&log.lock);
  108121:	8d b3 ac 67 51 00    	lea    0x5167ac(%ebx),%esi
  108127:	56                   	push   %esi
  108128:	e8 73 de ff ff       	call   105fa0 <spinlock_init>
    read_superblock(ROOTDEV, &sb);
  10812d:	58                   	pop    %eax
  10812e:	5a                   	pop    %edx
  10812f:	8d 44 24 08          	lea    0x8(%esp),%eax
  108133:	50                   	push   %eax
  108134:	6a 01                	push   $0x1
  108136:	e8 85 02 00 00       	call   1083c0 <read_superblock>
    log.start = sb.size - sb.nlog;
  10813b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  10813f:	8b 44 24 10          	mov    0x10(%esp),%eax
    log.dev = ROOTDEV;
  108143:	c7 83 c0 67 51 00 01 	movl   $0x1,0x5167c0(%ebx)
  10814a:	00 00 00 
    struct buf *buf = bufcache_read(log.dev, log.start);
  10814d:	59                   	pop    %ecx
  10814e:	5f                   	pop    %edi
    log.start = sb.size - sb.nlog;
  10814f:	29 d0                	sub    %edx,%eax
    log.size = sb.nlog;
  108151:	89 93 b8 67 51 00    	mov    %edx,0x5167b8(%ebx)
    struct buf *buf = bufcache_read(log.dev, log.start);
  108157:	50                   	push   %eax
  108158:	6a 01                	push   $0x1
    log.start = sb.size - sb.nlog;
  10815a:	89 83 b4 67 51 00    	mov    %eax,0x5167b4(%ebx)
    struct buf *buf = bufcache_read(log.dev, log.start);
  108160:	e8 7b fc ff ff       	call   107de0 <bufcache_read>
    for (i = 0; i < log.lh.n; i++) {
  108165:	83 c4 10             	add    $0x10,%esp
    log.lh.n = lh->n;
  108168:	8b 48 18             	mov    0x18(%eax),%ecx
    struct buf *buf = bufcache_read(log.dev, log.start);
  10816b:	89 c7                	mov    %eax,%edi
    log.lh.n = lh->n;
  10816d:	89 8b c4 67 51 00    	mov    %ecx,0x5167c4(%ebx)
    for (i = 0; i < log.lh.n; i++) {
  108173:	85 c9                	test   %ecx,%ecx
  108175:	7e 18                	jle    10818f <log_init+0x7f>
  108177:	8d 40 1c             	lea    0x1c(%eax),%eax
  10817a:	8d 56 1c             	lea    0x1c(%esi),%edx
  10817d:	8d 34 88             	lea    (%eax,%ecx,4),%esi
        log.lh.sector[i] = lh->sector[i];
  108180:	8b 08                	mov    (%eax),%ecx
    for (i = 0; i < log.lh.n; i++) {
  108182:	83 c0 04             	add    $0x4,%eax
  108185:	83 c2 04             	add    $0x4,%edx
        log.lh.sector[i] = lh->sector[i];
  108188:	89 4a fc             	mov    %ecx,-0x4(%edx)
    for (i = 0; i < log.lh.n; i++) {
  10818b:	39 f0                	cmp    %esi,%eax
  10818d:	75 f1                	jne    108180 <log_init+0x70>
    bufcache_release(buf);
  10818f:	83 ec 0c             	sub    $0xc,%esp
  108192:	57                   	push   %edi
  108193:	e8 c8 fd ff ff       	call   107f60 <bufcache_release>

static void recover_from_log(void)
{
    read_head();
    install_trans();  // if committed, copy from log to disk
  108198:	e8 53 fe ff ff       	call   107ff0 <install_trans>
    log.lh.n = 0;
  10819d:	c7 83 c4 67 51 00 00 	movl   $0x0,0x5167c4(%ebx)
  1081a4:	00 00 00 
    write_head();     // clear the log
  1081a7:	e8 e4 fe ff ff       	call   108090 <write_head>
}
  1081ac:	83 c4 20             	add    $0x20,%esp
  1081af:	5b                   	pop    %ebx
  1081b0:	5e                   	pop    %esi
  1081b1:	5f                   	pop    %edi
  1081b2:	c3                   	ret
  1081b3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1081ba:	00 
  1081bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001081c0 <begin_trans>:
}

void begin_trans(void)
{
  1081c0:	57                   	push   %edi
  1081c1:	56                   	push   %esi
  1081c2:	53                   	push   %ebx
  1081c3:	e8 da 81 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1081c8:	81 c3 2c be 00 00    	add    $0xbe2c,%ebx
    spinlock_acquire(&log.lock);
  1081ce:	83 ec 0c             	sub    $0xc,%esp
  1081d1:	8d b3 ac 67 51 00    	lea    0x5167ac(%ebx),%esi
  1081d7:	56                   	push   %esi
  1081d8:	e8 53 de ff ff       	call   106030 <spinlock_acquire>
    while (log.busy) {
  1081dd:	8b 93 bc 67 51 00    	mov    0x5167bc(%ebx),%edx
  1081e3:	83 c4 10             	add    $0x10,%esp
  1081e6:	85 d2                	test   %edx,%edx
  1081e8:	74 1b                	je     108205 <begin_trans+0x45>
  1081ea:	8d 3d ac 67 51 00    	lea    0x5167ac,%edi
        thread_sleep(&log, &log.lock);
  1081f0:	83 ec 08             	sub    $0x8,%esp
  1081f3:	56                   	push   %esi
  1081f4:	56                   	push   %esi
  1081f5:	e8 16 ef ff ff       	call   107110 <thread_sleep>
    while (log.busy) {
  1081fa:	8b 44 1f 10          	mov    0x10(%edi,%ebx,1),%eax
  1081fe:	83 c4 10             	add    $0x10,%esp
  108201:	85 c0                	test   %eax,%eax
  108203:	75 eb                	jne    1081f0 <begin_trans+0x30>
    }
    log.busy = 1;
  108205:	c7 83 bc 67 51 00 01 	movl   $0x1,0x5167bc(%ebx)
  10820c:	00 00 00 
    spinlock_release(&log.lock);
  10820f:	83 ec 0c             	sub    $0xc,%esp
  108212:	56                   	push   %esi
  108213:	e8 98 de ff ff       	call   1060b0 <spinlock_release>
}
  108218:	83 c4 10             	add    $0x10,%esp
  10821b:	5b                   	pop    %ebx
  10821c:	5e                   	pop    %esi
  10821d:	5f                   	pop    %edi
  10821e:	c3                   	ret
  10821f:	90                   	nop

00108220 <commit_trans>:

void commit_trans(void)
{
  108220:	56                   	push   %esi
  108221:	53                   	push   %ebx
  108222:	e8 7b 81 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108227:	81 c3 cd bd 00 00    	add    $0xbdcd,%ebx
  10822d:	83 ec 04             	sub    $0x4,%esp
    if (log.lh.n > 0) {
  108230:	8b 83 c4 67 51 00    	mov    0x5167c4(%ebx),%eax
  108236:	85 c0                	test   %eax,%eax
  108238:	7e 19                	jle    108253 <commit_trans+0x33>
        write_head();     // Write header to disk -- the real commit
  10823a:	e8 51 fe ff ff       	call   108090 <write_head>
        install_trans();  // Now install writes to home locations
  10823f:	e8 ac fd ff ff       	call   107ff0 <install_trans>
        log.lh.n = 0;
  108244:	c7 83 c4 67 51 00 00 	movl   $0x0,0x5167c4(%ebx)
  10824b:	00 00 00 
        write_head();     // Erase the transaction from the log
  10824e:	e8 3d fe ff ff       	call   108090 <write_head>
    }

    spinlock_acquire(&log.lock);
  108253:	83 ec 0c             	sub    $0xc,%esp
  108256:	8d b3 ac 67 51 00    	lea    0x5167ac(%ebx),%esi
  10825c:	56                   	push   %esi
  10825d:	e8 ce dd ff ff       	call   106030 <spinlock_acquire>
    log.busy = 0;
    thread_wakeup(&log);
  108262:	89 34 24             	mov    %esi,(%esp)
    log.busy = 0;
  108265:	c7 83 bc 67 51 00 00 	movl   $0x0,0x5167bc(%ebx)
  10826c:	00 00 00 
    thread_wakeup(&log);
  10826f:	e8 dc ee ff ff       	call   107150 <thread_wakeup>
    spinlock_release(&log.lock);
  108274:	89 34 24             	mov    %esi,(%esp)
  108277:	e8 34 de ff ff       	call   1060b0 <spinlock_release>
}
  10827c:	83 c4 14             	add    $0x14,%esp
  10827f:	5b                   	pop    %ebx
  108280:	5e                   	pop    %esi
  108281:	c3                   	ret
  108282:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108289:	00 
  10828a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00108290 <log_write>:
//   bp = bufcache_read(...)
//   modify bp->data[]
//   log_write(bp)
//   bufcache_release(bp)
void log_write(struct buf *b)
{
  108290:	55                   	push   %ebp
  108291:	57                   	push   %edi
  108292:	56                   	push   %esi
  108293:	53                   	push   %ebx
  108294:	e8 09 81 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108299:	81 c3 5b bd 00 00    	add    $0xbd5b,%ebx
  10829f:	83 ec 0c             	sub    $0xc,%esp
  1082a2:	8b 7c 24 20          	mov    0x20(%esp),%edi
    int i;

    if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
  1082a6:	8b 83 c4 67 51 00    	mov    0x5167c4(%ebx),%eax
  1082ac:	8b 93 b8 67 51 00    	mov    0x5167b8(%ebx),%edx
  1082b2:	83 f8 09             	cmp    $0x9,%eax
  1082b5:	0f 8f a5 00 00 00    	jg     108360 <log_write+0xd0>
  1082bb:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1082be:	39 c8                	cmp    %ecx,%eax
  1082c0:	0f 8d 9a 00 00 00    	jge    108360 <log_write+0xd0>
        KERN_PANIC("too big a transaction. %d < %d <= %d",
                   log.size, log.lh.n, LOGSIZE);
    if (!log.busy)
  1082c6:	8b 83 bc 67 51 00    	mov    0x5167bc(%ebx),%eax
  1082cc:	85 c0                	test   %eax,%eax
  1082ce:	0f 84 bc 00 00 00    	je     108390 <log_write+0x100>
        KERN_PANIC("write outside of trans");

    for (i = 0; i < log.lh.n; i++) {
  1082d4:	8b 93 c4 67 51 00    	mov    0x5167c4(%ebx),%edx
        if (log.lh.sector[i] == b->sector)  // log absorbtion?
            break;
    }
    log.lh.sector[i] = b->sector;
  1082da:	8b 47 08             	mov    0x8(%edi),%eax
    for (i = 0; i < log.lh.n; i++) {
  1082dd:	31 f6                	xor    %esi,%esi
  1082df:	85 d2                	test   %edx,%edx
  1082e1:	7f 0c                	jg     1082ef <log_write+0x5f>
  1082e3:	eb 13                	jmp    1082f8 <log_write+0x68>
  1082e5:	8d 76 00             	lea    0x0(%esi),%esi
  1082e8:	83 c6 01             	add    $0x1,%esi
  1082eb:	39 d6                	cmp    %edx,%esi
  1082ed:	74 09                	je     1082f8 <log_write+0x68>
        if (log.lh.sector[i] == b->sector)  // log absorbtion?
  1082ef:	39 84 b3 c8 67 51 00 	cmp    %eax,0x5167c8(%ebx,%esi,4)
  1082f6:	75 f0                	jne    1082e8 <log_write+0x58>
    log.lh.sector[i] = b->sector;
  1082f8:	89 84 b3 c8 67 51 00 	mov    %eax,0x5167c8(%ebx,%esi,4)
    struct buf *lbuf = bufcache_read(b->dev, log.start + i + 1);
  1082ff:	8b 83 b4 67 51 00    	mov    0x5167b4(%ebx),%eax
  108305:	83 ec 08             	sub    $0x8,%esp
  108308:	01 f0                	add    %esi,%eax
  10830a:	83 c0 01             	add    $0x1,%eax
  10830d:	50                   	push   %eax
  10830e:	ff 77 04             	push   0x4(%edi)
  108311:	e8 ca fa ff ff       	call   107de0 <bufcache_read>
    memmove(lbuf->data, b->data, BSIZE);
  108316:	83 c4 0c             	add    $0xc,%esp
    struct buf *lbuf = bufcache_read(b->dev, log.start + i + 1);
  108319:	89 c5                	mov    %eax,%ebp
    memmove(lbuf->data, b->data, BSIZE);
  10831b:	8d 47 18             	lea    0x18(%edi),%eax
  10831e:	68 00 02 00 00       	push   $0x200
  108323:	50                   	push   %eax
  108324:	8d 45 18             	lea    0x18(%ebp),%eax
  108327:	50                   	push   %eax
  108328:	e8 33 c1 ff ff       	call   104460 <memmove>
    bufcache_write(lbuf);
  10832d:	89 2c 24             	mov    %ebp,(%esp)
  108330:	e8 db fb ff ff       	call   107f10 <bufcache_write>
    bufcache_release(lbuf);
  108335:	89 2c 24             	mov    %ebp,(%esp)
  108338:	e8 23 fc ff ff       	call   107f60 <bufcache_release>
    if (i == log.lh.n)
  10833d:	83 c4 10             	add    $0x10,%esp
  108340:	39 b3 c4 67 51 00    	cmp    %esi,0x5167c4(%ebx)
  108346:	75 09                	jne    108351 <log_write+0xc1>
        log.lh.n++;
  108348:	83 c6 01             	add    $0x1,%esi
  10834b:	89 b3 c4 67 51 00    	mov    %esi,0x5167c4(%ebx)
    b->flags |= B_DIRTY;  // XXX: prevent eviction
  108351:	83 0f 04             	orl    $0x4,(%edi)
}
  108354:	83 c4 0c             	add    $0xc,%esp
  108357:	5b                   	pop    %ebx
  108358:	5e                   	pop    %esi
  108359:	5f                   	pop    %edi
  10835a:	5d                   	pop    %ebp
  10835b:	c3                   	ret
  10835c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        KERN_PANIC("too big a transaction. %d < %d <= %d",
  108360:	83 ec 08             	sub    $0x8,%esp
  108363:	6a 0a                	push   $0xa
  108365:	50                   	push   %eax
  108366:	8d 83 3c 84 ff ff    	lea    -0x7bc4(%ebx),%eax
  10836c:	52                   	push   %edx
  10836d:	50                   	push   %eax
  10836e:	8d 83 83 78 ff ff    	lea    -0x877d(%ebx),%eax
  108374:	68 9d 00 00 00       	push   $0x9d
  108379:	50                   	push   %eax
  10837a:	e8 61 c4 ff ff       	call   1047e0 <debug_panic>
    if (!log.busy)
  10837f:	8b 83 bc 67 51 00    	mov    0x5167bc(%ebx),%eax
        KERN_PANIC("too big a transaction. %d < %d <= %d",
  108385:	83 c4 20             	add    $0x20,%esp
    if (!log.busy)
  108388:	85 c0                	test   %eax,%eax
  10838a:	0f 85 44 ff ff ff    	jne    1082d4 <log_write+0x44>
        KERN_PANIC("write outside of trans");
  108390:	83 ec 04             	sub    $0x4,%esp
  108393:	8d 83 91 78 ff ff    	lea    -0x876f(%ebx),%eax
  108399:	50                   	push   %eax
  10839a:	8d 83 83 78 ff ff    	lea    -0x877d(%ebx),%eax
  1083a0:	68 a0 00 00 00       	push   $0xa0
  1083a5:	50                   	push   %eax
  1083a6:	e8 35 c4 ff ff       	call   1047e0 <debug_panic>
  1083ab:	83 c4 10             	add    $0x10,%esp
  1083ae:	e9 21 ff ff ff       	jmp    1082d4 <log_write+0x44>
  1083b3:	66 90                	xchg   %ax,%ax
  1083b5:	66 90                	xchg   %ax,%ax
  1083b7:	66 90                	xchg   %ax,%ax
  1083b9:	66 90                	xchg   %ax,%ax
  1083bb:	66 90                	xchg   %ax,%ax
  1083bd:	66 90                	xchg   %ax,%ax
  1083bf:	90                   	nop

001083c0 <read_superblock>:
#include "dinode.h"
#include "log.h"

// Read the super block.
void read_superblock(int dev, struct superblock *sb)
{
  1083c0:	56                   	push   %esi
  1083c1:	53                   	push   %ebx
  1083c2:	e8 db 7f ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1083c7:	81 c3 2d bc 00 00    	add    $0xbc2d,%ebx
  1083cd:	83 ec 0c             	sub    $0xc,%esp
    struct buf *bp;

    bp = bufcache_read(dev, 1);  // Block 1 is super block.
  1083d0:	6a 01                	push   $0x1
  1083d2:	ff 74 24 1c          	push   0x1c(%esp)
  1083d6:	e8 05 fa ff ff       	call   107de0 <bufcache_read>
    memmove(sb, bp->data, sizeof(*sb));
  1083db:	83 c4 0c             	add    $0xc,%esp
    bp = bufcache_read(dev, 1);  // Block 1 is super block.
  1083de:	89 c6                	mov    %eax,%esi
    memmove(sb, bp->data, sizeof(*sb));
  1083e0:	8d 40 18             	lea    0x18(%eax),%eax
  1083e3:	6a 10                	push   $0x10
  1083e5:	50                   	push   %eax
  1083e6:	ff 74 24 20          	push   0x20(%esp)
  1083ea:	e8 71 c0 ff ff       	call   104460 <memmove>
    bufcache_release(bp);
  1083ef:	89 34 24             	mov    %esi,(%esp)
  1083f2:	e8 69 fb ff ff       	call   107f60 <bufcache_release>
}
  1083f7:	83 c4 14             	add    $0x14,%esp
  1083fa:	5b                   	pop    %ebx
  1083fb:	5e                   	pop    %esi
  1083fc:	c3                   	ret
  1083fd:	8d 76 00             	lea    0x0(%esi),%esi

00108400 <block_zero>:

// Zero a block.
void block_zero(uint32_t dev, uint32_t bno)
{
  108400:	56                   	push   %esi
  108401:	53                   	push   %ebx
  108402:	e8 9b 7f ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108407:	81 c3 ed bb 00 00    	add    $0xbbed,%ebx
  10840d:	83 ec 0c             	sub    $0xc,%esp
    struct buf *bp;

    bp = bufcache_read(dev, bno);
  108410:	ff 74 24 1c          	push   0x1c(%esp)
  108414:	ff 74 24 1c          	push   0x1c(%esp)
  108418:	e8 c3 f9 ff ff       	call   107de0 <bufcache_read>
    memset(bp->data, 0, BSIZE);
  10841d:	83 c4 0c             	add    $0xc,%esp
    bp = bufcache_read(dev, bno);
  108420:	89 c6                	mov    %eax,%esi
    memset(bp->data, 0, BSIZE);
  108422:	8d 40 18             	lea    0x18(%eax),%eax
  108425:	68 00 02 00 00       	push   $0x200
  10842a:	6a 00                	push   $0x0
  10842c:	50                   	push   %eax
  10842d:	e8 ee bf ff ff       	call   104420 <memset>
    log_write(bp);
  108432:	89 34 24             	mov    %esi,(%esp)
  108435:	e8 56 fe ff ff       	call   108290 <log_write>
    bufcache_release(bp);
  10843a:	89 34 24             	mov    %esi,(%esp)
  10843d:	e8 1e fb ff ff       	call   107f60 <bufcache_release>
}
  108442:	83 c4 14             	add    $0x14,%esp
  108445:	5b                   	pop    %ebx
  108446:	5e                   	pop    %esi
  108447:	c3                   	ret
  108448:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10844f:	00 

00108450 <block_alloc>:

// Allocate a zeroed disk block.
uint32_t block_alloc(uint32_t dev)
{
  108450:	55                   	push   %ebp
  108451:	57                   	push   %edi
  108452:	56                   	push   %esi
  108453:	53                   	push   %ebx
  108454:	e8 49 7f ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108459:	81 c3 9b bb 00 00    	add    $0xbb9b,%ebx
  10845f:	83 ec 34             	sub    $0x34,%esp
    bp = bufcache_read(dev, 1);  // Block 1 is super block.
  108462:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  108466:	6a 01                	push   $0x1
  108468:	ff 74 24 4c          	push   0x4c(%esp)
  10846c:	e8 6f f9 ff ff       	call   107de0 <bufcache_read>
    memmove(sb, bp->data, sizeof(*sb));
  108471:	83 c4 0c             	add    $0xc,%esp
    bp = bufcache_read(dev, 1);  // Block 1 is super block.
  108474:	89 c6                	mov    %eax,%esi
    memmove(sb, bp->data, sizeof(*sb));
  108476:	83 c0 18             	add    $0x18,%eax
  108479:	6a 10                	push   $0x10
  10847b:	50                   	push   %eax
  10847c:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  108480:	50                   	push   %eax
  108481:	e8 da bf ff ff       	call   104460 <memmove>
    bufcache_release(bp);
  108486:	89 34 24             	mov    %esi,(%esp)
  108489:	e8 d2 fa ff ff       	call   107f60 <bufcache_release>
    struct buf *bp;
    struct superblock sb;

    bp = 0;
    read_superblock(dev, &sb);
    for (b = 0; b < sb.size; b += BPB) {
  10848e:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  108492:	83 c4 10             	add    $0x10,%esp
  108495:	85 c9                	test   %ecx,%ecx
  108497:	0f 84 98 00 00 00    	je     108535 <block_alloc+0xe5>
  10849d:	31 ed                	xor    %ebp,%ebp
        bp = bufcache_read(dev, BBLOCK(b, sb.ninodes));
  10849f:	83 ec 08             	sub    $0x8,%esp
  1084a2:	89 ea                	mov    %ebp,%edx
  1084a4:	89 ee                	mov    %ebp,%esi
  1084a6:	8b 44 24 20          	mov    0x20(%esp),%eax
  1084aa:	c1 fa 0c             	sar    $0xc,%edx
  1084ad:	c1 e8 03             	shr    $0x3,%eax
  1084b0:	8d 44 10 03          	lea    0x3(%eax,%edx,1),%eax
  1084b4:	50                   	push   %eax
  1084b5:	ff 74 24 4c          	push   0x4c(%esp)
  1084b9:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  1084bd:	e8 1e f9 ff ff       	call   107de0 <bufcache_read>
  1084c2:	89 c7                	mov    %eax,%edi
        for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
  1084c4:	8b 44 24 20          	mov    0x20(%esp),%eax
  1084c8:	89 44 24 14          	mov    %eax,0x14(%esp)
  1084cc:	83 c4 10             	add    $0x10,%esp
  1084cf:	31 c0                	xor    %eax,%eax
  1084d1:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
  1084d5:	eb 32                	jmp    108509 <block_alloc+0xb9>
  1084d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1084de:	00 
  1084df:	90                   	nop
            m = 1 << (bi % 8);
  1084e0:	89 c1                	mov    %eax,%ecx
  1084e2:	bb 01 00 00 00       	mov    $0x1,%ebx
  1084e7:	83 e1 07             	and    $0x7,%ecx
  1084ea:	d3 e3                	shl    %cl,%ebx
            if ((bp->data[bi / 8] & m) == 0) {  // Is block free?
  1084ec:	89 c1                	mov    %eax,%ecx
  1084ee:	c1 f9 03             	sar    $0x3,%ecx
  1084f1:	0f b6 6c 0f 18       	movzbl 0x18(%edi,%ecx,1),%ebp
  1084f6:	89 ea                	mov    %ebp,%edx
  1084f8:	85 dd                	test   %ebx,%ebp
  1084fa:	74 64                	je     108560 <block_alloc+0x110>
        for (bi = 0; bi < BPB && b + bi < sb.size; bi++) {
  1084fc:	83 c0 01             	add    $0x1,%eax
  1084ff:	83 c6 01             	add    $0x1,%esi
  108502:	3d 00 10 00 00       	cmp    $0x1000,%eax
  108507:	74 08                	je     108511 <block_alloc+0xc1>
  108509:	8b 54 24 04          	mov    0x4(%esp),%edx
  10850d:	39 d6                	cmp    %edx,%esi
  10850f:	72 cf                	jb     1084e0 <block_alloc+0x90>
                bufcache_release(bp);
                block_zero(dev, b + bi);
                return b + bi;
            }
        }
        bufcache_release(bp);
  108511:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  108515:	83 ec 0c             	sub    $0xc,%esp
  108518:	57                   	push   %edi
  108519:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    for (b = 0; b < sb.size; b += BPB) {
  10851d:	81 c5 00 10 00 00    	add    $0x1000,%ebp
        bufcache_release(bp);
  108523:	e8 38 fa ff ff       	call   107f60 <bufcache_release>
    for (b = 0; b < sb.size; b += BPB) {
  108528:	83 c4 10             	add    $0x10,%esp
  10852b:	3b 6c 24 10          	cmp    0x10(%esp),%ebp
  10852f:	0f 82 6a ff ff ff    	jb     10849f <block_alloc+0x4f>
    }
    KERN_PANIC("balloc: out of blocks");
  108535:	83 ec 04             	sub    $0x4,%esp
    return 0;
  108538:	31 f6                	xor    %esi,%esi
    KERN_PANIC("balloc: out of blocks");
  10853a:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  10853e:	8d 83 a8 78 ff ff    	lea    -0x8758(%ebx),%eax
  108544:	50                   	push   %eax
  108545:	8d 83 be 78 ff ff    	lea    -0x8742(%ebx),%eax
  10854b:	6a 35                	push   $0x35
  10854d:	50                   	push   %eax
  10854e:	e8 8d c2 ff ff       	call   1047e0 <debug_panic>
    return 0;
  108553:	83 c4 10             	add    $0x10,%esp
}
  108556:	89 f0                	mov    %esi,%eax
  108558:	83 c4 2c             	add    $0x2c,%esp
  10855b:	5b                   	pop    %ebx
  10855c:	5e                   	pop    %esi
  10855d:	5f                   	pop    %edi
  10855e:	5d                   	pop    %ebp
  10855f:	c3                   	ret
                log_write(bp);
  108560:	83 ec 0c             	sub    $0xc,%esp
                bp->data[bi / 8] |= m;          // Mark block in use.
  108563:	09 da                	or     %ebx,%edx
  108565:	88 54 0f 18          	mov    %dl,0x18(%edi,%ecx,1)
                log_write(bp);
  108569:	57                   	push   %edi
  10856a:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  10856e:	e8 1d fd ff ff       	call   108290 <log_write>
                bufcache_release(bp);
  108573:	89 3c 24             	mov    %edi,(%esp)
  108576:	e8 e5 f9 ff ff       	call   107f60 <bufcache_release>
    bp = bufcache_read(dev, bno);
  10857b:	58                   	pop    %eax
  10857c:	5a                   	pop    %edx
  10857d:	56                   	push   %esi
  10857e:	ff 74 24 4c          	push   0x4c(%esp)
  108582:	e8 59 f8 ff ff       	call   107de0 <bufcache_read>
    memset(bp->data, 0, BSIZE);
  108587:	83 c4 0c             	add    $0xc,%esp
    bp = bufcache_read(dev, bno);
  10858a:	89 c7                	mov    %eax,%edi
    memset(bp->data, 0, BSIZE);
  10858c:	8d 40 18             	lea    0x18(%eax),%eax
  10858f:	68 00 02 00 00       	push   $0x200
  108594:	6a 00                	push   $0x0
  108596:	50                   	push   %eax
  108597:	e8 84 be ff ff       	call   104420 <memset>
    log_write(bp);
  10859c:	89 3c 24             	mov    %edi,(%esp)
  10859f:	e8 ec fc ff ff       	call   108290 <log_write>
    bufcache_release(bp);
  1085a4:	89 3c 24             	mov    %edi,(%esp)
  1085a7:	e8 b4 f9 ff ff       	call   107f60 <bufcache_release>
}
  1085ac:	83 c4 10             	add    $0x10,%esp
}
  1085af:	89 f0                	mov    %esi,%eax
  1085b1:	83 c4 2c             	add    $0x2c,%esp
  1085b4:	5b                   	pop    %ebx
  1085b5:	5e                   	pop    %esi
  1085b6:	5f                   	pop    %edi
  1085b7:	5d                   	pop    %ebp
  1085b8:	c3                   	ret
  1085b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001085c0 <block_free>:

// Free a disk block.
void block_free(uint32_t dev, uint32_t b)
{
  1085c0:	55                   	push   %ebp
  1085c1:	57                   	push   %edi
  1085c2:	56                   	push   %esi
  1085c3:	53                   	push   %ebx
  1085c4:	e8 d9 7d ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1085c9:	81 c3 2b ba 00 00    	add    $0xba2b,%ebx
  1085cf:	83 ec 34             	sub    $0x34,%esp
  1085d2:	8b 7c 24 48          	mov    0x48(%esp),%edi
  1085d6:	8b 74 24 4c          	mov    0x4c(%esp),%esi
    bp = bufcache_read(dev, 1);  // Block 1 is super block.
  1085da:	6a 01                	push   $0x1
  1085dc:	57                   	push   %edi
  1085dd:	e8 fe f7 ff ff       	call   107de0 <bufcache_read>
    memmove(sb, bp->data, sizeof(*sb));
  1085e2:	83 c4 0c             	add    $0xc,%esp
    bp = bufcache_read(dev, 1);  // Block 1 is super block.
  1085e5:	89 c5                	mov    %eax,%ebp
    memmove(sb, bp->data, sizeof(*sb));
  1085e7:	83 c0 18             	add    $0x18,%eax
  1085ea:	6a 10                	push   $0x10
  1085ec:	50                   	push   %eax
  1085ed:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  1085f1:	50                   	push   %eax
  1085f2:	e8 69 be ff ff       	call   104460 <memmove>
    bufcache_release(bp);
  1085f7:	89 2c 24             	mov    %ebp,(%esp)
  1085fa:	e8 61 f9 ff ff       	call   107f60 <bufcache_release>
    struct buf *bp;
    struct superblock sb;
    int bi, m;

    read_superblock(dev, &sb);
    bp = bufcache_read(dev, BBLOCK(b, sb.ninodes));
  1085ff:	58                   	pop    %eax
  108600:	5a                   	pop    %edx
  108601:	89 f2                	mov    %esi,%edx
  108603:	8b 44 24 20          	mov    0x20(%esp),%eax
  108607:	c1 ea 0c             	shr    $0xc,%edx
  10860a:	c1 e8 03             	shr    $0x3,%eax
  10860d:	8d 44 10 03          	lea    0x3(%eax,%edx,1),%eax
  108611:	50                   	push   %eax
  108612:	57                   	push   %edi
  108613:	e8 c8 f7 ff ff       	call   107de0 <bufcache_read>
    bi = b % BPB;
    m = 1 << (bi % 8);
  108618:	89 f1                	mov    %esi,%ecx
    if ((bp->data[bi / 8] & m) == 0)
  10861a:	c1 fe 03             	sar    $0x3,%esi
  10861d:	83 c4 10             	add    $0x10,%esp
    bp = bufcache_read(dev, BBLOCK(b, sb.ninodes));
  108620:	89 c7                	mov    %eax,%edi
    m = 1 << (bi % 8);
  108622:	83 e1 07             	and    $0x7,%ecx
  108625:	b8 01 00 00 00       	mov    $0x1,%eax
    if ((bp->data[bi / 8] & m) == 0)
  10862a:	81 e6 ff 01 00 00    	and    $0x1ff,%esi
    m = 1 << (bi % 8);
  108630:	d3 e0                	shl    %cl,%eax
    if ((bp->data[bi / 8] & m) == 0)
  108632:	0f b6 4c 37 18       	movzbl 0x18(%edi,%esi,1),%ecx
  108637:	89 ca                	mov    %ecx,%edx
  108639:	85 c1                	test   %eax,%ecx
  10863b:	74 23                	je     108660 <block_free+0xa0>
        KERN_PANIC("freeing free block");
    bp->data[bi / 8] &= ~m;
  10863d:	f7 d0                	not    %eax
    log_write(bp);
  10863f:	83 ec 0c             	sub    $0xc,%esp
    bp->data[bi / 8] &= ~m;
  108642:	21 d0                	and    %edx,%eax
  108644:	88 44 37 18          	mov    %al,0x18(%edi,%esi,1)
    log_write(bp);
  108648:	57                   	push   %edi
  108649:	e8 42 fc ff ff       	call   108290 <log_write>
    bufcache_release(bp);
  10864e:	89 3c 24             	mov    %edi,(%esp)
  108651:	e8 0a f9 ff ff       	call   107f60 <bufcache_release>
}
  108656:	83 c4 3c             	add    $0x3c,%esp
  108659:	5b                   	pop    %ebx
  10865a:	5e                   	pop    %esi
  10865b:	5f                   	pop    %edi
  10865c:	5d                   	pop    %ebp
  10865d:	c3                   	ret
  10865e:	66 90                	xchg   %ax,%ax
  108660:	89 44 24 0c          	mov    %eax,0xc(%esp)
        KERN_PANIC("freeing free block");
  108664:	8d 93 ce 78 ff ff    	lea    -0x8732(%ebx),%edx
  10866a:	83 ec 04             	sub    $0x4,%esp
  10866d:	52                   	push   %edx
  10866e:	8d 93 be 78 ff ff    	lea    -0x8742(%ebx),%edx
  108674:	6a 45                	push   $0x45
  108676:	52                   	push   %edx
  108677:	e8 64 c1 ff ff       	call   1047e0 <debug_panic>
    bp->data[bi / 8] &= ~m;
  10867c:	83 c4 10             	add    $0x10,%esp
  10867f:	0f b6 54 37 18       	movzbl 0x18(%edi,%esi,1),%edx
  108684:	8b 44 24 0c          	mov    0xc(%esp),%eax
  108688:	eb b3                	jmp    10863d <block_free+0x7d>
  10868a:	66 90                	xchg   %ax,%ax
  10868c:	66 90                	xchg   %ax,%ax
  10868e:	66 90                	xchg   %ax,%ax

00108690 <bmap>:
/**
 * Return the disk block address of the nth block in inode ip.
 * If there is no such block, bmap allocates one.
 */
static uint32_t bmap(struct inode *ip, uint32_t bn)
{
  108690:	55                   	push   %ebp
  108691:	57                   	push   %edi
  108692:	89 c7                	mov    %eax,%edi
  108694:	56                   	push   %esi
  108695:	53                   	push   %ebx
  108696:	e8 07 7d ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10869b:	81 c3 59 b9 00 00    	add    $0xb959,%ebx
  1086a1:	83 ec 1c             	sub    $0x1c,%esp
    uint32_t addr, *a;
    struct buf *bp;

    if (bn < NDIRECT) {
  1086a4:	83 fa 0b             	cmp    $0xb,%edx
  1086a7:	76 77                	jbe    108720 <bmap+0x90>
        if ((addr = ip->addrs[bn]) == 0)
            ip->addrs[bn] = addr = block_alloc(ip->dev);
        return addr;
    }
    bn -= NDIRECT;
  1086a9:	8d 72 f4             	lea    -0xc(%edx),%esi

    if (bn < NINDIRECT) {
  1086ac:	83 fe 7f             	cmp    $0x7f,%esi
  1086af:	77 3f                	ja     1086f0 <bmap+0x60>
        // Load indirect block, allocating if necessary.
        if ((addr = ip->addrs[NDIRECT]) == 0)
  1086b1:	8b 40 4c             	mov    0x4c(%eax),%eax
  1086b4:	85 c0                	test   %eax,%eax
  1086b6:	0f 84 c4 00 00 00    	je     108780 <bmap+0xf0>
            ip->addrs[NDIRECT] = addr = block_alloc(ip->dev);
        bp = bufcache_read(ip->dev, addr);
  1086bc:	83 ec 08             	sub    $0x8,%esp
  1086bf:	50                   	push   %eax
  1086c0:	ff 37                	push   (%edi)
  1086c2:	e8 19 f7 ff ff       	call   107de0 <bufcache_read>
        a = (uint32_t *) bp->data;
        if ((addr = a[bn]) == 0) {
  1086c7:	83 c4 10             	add    $0x10,%esp
  1086ca:	8d 74 b0 18          	lea    0x18(%eax,%esi,4),%esi
        bp = bufcache_read(ip->dev, addr);
  1086ce:	89 c2                	mov    %eax,%edx
        if ((addr = a[bn]) == 0) {
  1086d0:	8b 2e                	mov    (%esi),%ebp
  1086d2:	85 ed                	test   %ebp,%ebp
  1086d4:	74 7a                	je     108750 <bmap+0xc0>
            a[bn] = addr = block_alloc(ip->dev);
            log_write(bp);
        }
        bufcache_release(bp);
  1086d6:	83 ec 0c             	sub    $0xc,%esp
  1086d9:	52                   	push   %edx
  1086da:	e8 81 f8 ff ff       	call   107f60 <bufcache_release>
        return addr;
  1086df:	83 c4 10             	add    $0x10,%esp
    }

    KERN_PANIC("bmap: out of range");
    return 0;
}
  1086e2:	83 c4 1c             	add    $0x1c,%esp
  1086e5:	89 e8                	mov    %ebp,%eax
  1086e7:	5b                   	pop    %ebx
  1086e8:	5e                   	pop    %esi
  1086e9:	5f                   	pop    %edi
  1086ea:	5d                   	pop    %ebp
  1086eb:	c3                   	ret
  1086ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    KERN_PANIC("bmap: out of range");
  1086f0:	83 ec 04             	sub    $0x4,%esp
  1086f3:	8d 83 e1 78 ff ff    	lea    -0x871f(%ebx),%eax
    return 0;
  1086f9:	31 ed                	xor    %ebp,%ebp
    KERN_PANIC("bmap: out of range");
  1086fb:	50                   	push   %eax
  1086fc:	8d 83 f4 78 ff ff    	lea    -0x870c(%ebx),%eax
  108702:	68 fd 00 00 00       	push   $0xfd
  108707:	50                   	push   %eax
  108708:	e8 d3 c0 ff ff       	call   1047e0 <debug_panic>
    return 0;
  10870d:	83 c4 10             	add    $0x10,%esp
}
  108710:	89 e8                	mov    %ebp,%eax
  108712:	83 c4 1c             	add    $0x1c,%esp
  108715:	5b                   	pop    %ebx
  108716:	5e                   	pop    %esi
  108717:	5f                   	pop    %edi
  108718:	5d                   	pop    %ebp
  108719:	c3                   	ret
  10871a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if ((addr = ip->addrs[bn]) == 0)
  108720:	8d 72 04             	lea    0x4(%edx),%esi
  108723:	8b 6c b0 0c          	mov    0xc(%eax,%esi,4),%ebp
  108727:	85 ed                	test   %ebp,%ebp
  108729:	75 b7                	jne    1086e2 <bmap+0x52>
            ip->addrs[bn] = addr = block_alloc(ip->dev);
  10872b:	83 ec 0c             	sub    $0xc,%esp
  10872e:	ff 30                	push   (%eax)
  108730:	e8 1b fd ff ff       	call   108450 <block_alloc>
  108735:	83 c4 10             	add    $0x10,%esp
  108738:	89 44 b7 0c          	mov    %eax,0xc(%edi,%esi,4)
  10873c:	89 c5                	mov    %eax,%ebp
}
  10873e:	83 c4 1c             	add    $0x1c,%esp
  108741:	5b                   	pop    %ebx
  108742:	89 e8                	mov    %ebp,%eax
  108744:	5e                   	pop    %esi
  108745:	5f                   	pop    %edi
  108746:	5d                   	pop    %ebp
  108747:	c3                   	ret
  108748:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10874f:	00 
  108750:	89 44 24 0c          	mov    %eax,0xc(%esp)
            a[bn] = addr = block_alloc(ip->dev);
  108754:	83 ec 0c             	sub    $0xc,%esp
  108757:	ff 37                	push   (%edi)
  108759:	e8 f2 fc ff ff       	call   108450 <block_alloc>
            log_write(bp);
  10875e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
            a[bn] = addr = block_alloc(ip->dev);
  108762:	89 06                	mov    %eax,(%esi)
  108764:	89 c5                	mov    %eax,%ebp
            log_write(bp);
  108766:	89 14 24             	mov    %edx,(%esp)
  108769:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  10876d:	e8 1e fb ff ff       	call   108290 <log_write>
  108772:	83 c4 10             	add    $0x10,%esp
  108775:	8b 54 24 0c          	mov    0xc(%esp),%edx
  108779:	e9 58 ff ff ff       	jmp    1086d6 <bmap+0x46>
  10877e:	66 90                	xchg   %ax,%ax
            ip->addrs[NDIRECT] = addr = block_alloc(ip->dev);
  108780:	83 ec 0c             	sub    $0xc,%esp
  108783:	ff 37                	push   (%edi)
  108785:	e8 c6 fc ff ff       	call   108450 <block_alloc>
  10878a:	83 c4 10             	add    $0x10,%esp
  10878d:	89 47 4c             	mov    %eax,0x4c(%edi)
  108790:	e9 27 ff ff ff       	jmp    1086bc <bmap+0x2c>
  108795:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10879c:	00 
  10879d:	8d 76 00             	lea    0x0(%esi),%esi

001087a0 <inode_init>:
{
  1087a0:	53                   	push   %ebx
  1087a1:	e8 fc 7b ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1087a6:	81 c3 4e b8 00 00    	add    $0xb84e,%ebx
  1087ac:	83 ec 14             	sub    $0x14,%esp
    spinlock_init(&inode_cache.lock);
  1087af:	8d 83 0c 68 51 00    	lea    0x51680c(%ebx),%eax
  1087b5:	50                   	push   %eax
  1087b6:	e8 e5 d7 ff ff       	call   105fa0 <spinlock_init>
}
  1087bb:	83 c4 18             	add    $0x18,%esp
  1087be:	5b                   	pop    %ebx
  1087bf:	c3                   	ret

001087c0 <inode_update>:
{
  1087c0:	57                   	push   %edi
  1087c1:	56                   	push   %esi
  1087c2:	53                   	push   %ebx
  1087c3:	8b 74 24 10          	mov    0x10(%esp),%esi
  1087c7:	e8 d6 7b ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1087cc:	81 c3 28 b8 00 00    	add    $0xb828,%ebx
    bp = bufcache_read(ip->dev, IBLOCK(ip->inum));
  1087d2:	8b 46 04             	mov    0x4(%esi),%eax
    memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  1087d5:	83 c6 1c             	add    $0x1c,%esi
    bp = bufcache_read(ip->dev, IBLOCK(ip->inum));
  1087d8:	83 ec 08             	sub    $0x8,%esp
  1087db:	c1 e8 03             	shr    $0x3,%eax
  1087de:	83 c0 02             	add    $0x2,%eax
  1087e1:	50                   	push   %eax
  1087e2:	ff 76 e4             	push   -0x1c(%esi)
  1087e5:	e8 f6 f5 ff ff       	call   107de0 <bufcache_read>
    dip->type = ip->type;
  1087ea:	8b 56 f8             	mov    -0x8(%esi),%edx
  1087ed:	8b 4e f4             	mov    -0xc(%esi),%ecx
    memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  1087f0:	83 c4 0c             	add    $0xc,%esp
    bp = bufcache_read(ip->dev, IBLOCK(ip->inum));
  1087f3:	89 c7                	mov    %eax,%edi
    dip = (struct dinode *) bp->data + ip->inum % IPB;
  1087f5:	8b 46 e8             	mov    -0x18(%esi),%eax
  1087f8:	83 e0 07             	and    $0x7,%eax
  1087fb:	c1 e0 06             	shl    $0x6,%eax
  1087fe:	8d 44 07 18          	lea    0x18(%edi,%eax,1),%eax
    dip->type = ip->type;
  108802:	89 50 04             	mov    %edx,0x4(%eax)
    dip->size = ip->size;
  108805:	8b 56 fc             	mov    -0x4(%esi),%edx
    memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  108808:	83 c0 0c             	add    $0xc,%eax
    dip->type = ip->type;
  10880b:	89 48 f4             	mov    %ecx,-0xc(%eax)
    dip->size = ip->size;
  10880e:	89 50 fc             	mov    %edx,-0x4(%eax)
    memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  108811:	6a 34                	push   $0x34
  108813:	56                   	push   %esi
  108814:	50                   	push   %eax
  108815:	e8 46 bc ff ff       	call   104460 <memmove>
    log_write(bp);
  10881a:	89 3c 24             	mov    %edi,(%esp)
  10881d:	e8 6e fa ff ff       	call   108290 <log_write>
    bufcache_release(bp);
  108822:	89 3c 24             	mov    %edi,(%esp)
  108825:	e8 36 f7 ff ff       	call   107f60 <bufcache_release>
}
  10882a:	83 c4 10             	add    $0x10,%esp
  10882d:	5b                   	pop    %ebx
  10882e:	5e                   	pop    %esi
  10882f:	5f                   	pop    %edi
  108830:	c3                   	ret
  108831:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108838:	00 
  108839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00108840 <inode_get>:
{
  108840:	55                   	push   %ebp
  108841:	57                   	push   %edi
    empty = 0;
  108842:	31 ff                	xor    %edi,%edi
{
  108844:	56                   	push   %esi
  108845:	53                   	push   %ebx
  108846:	e8 57 7b ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10884b:	81 c3 a9 b7 00 00    	add    $0xb7a9,%ebx
  108851:	83 ec 28             	sub    $0x28,%esp
  108854:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
    spinlock_acquire(&inode_cache.lock);
  108858:	8d 83 0c 68 51 00    	lea    0x51680c(%ebx),%eax
  10885e:	89 44 24 18          	mov    %eax,0x18(%esp)
  108862:	89 c6                	mov    %eax,%esi
  108864:	50                   	push   %eax
    for (ip = &inode_cache.inode[0]; ip < &inode_cache.inode[NINODE]; ip++) {
  108865:	8d 76 08             	lea    0x8(%esi),%esi
    spinlock_acquire(&inode_cache.lock);
  108868:	e8 c3 d7 ff ff       	call   106030 <spinlock_acquire>
  10886d:	83 c4 10             	add    $0x10,%esp
  108870:	8d 93 b4 77 51 00    	lea    0x5177b4(%ebx),%edx
  108876:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  10887a:	eb 0f                	jmp    10888b <inode_get+0x4b>
  10887c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
  108880:	39 2e                	cmp    %ebp,(%esi)
  108882:	74 5c                	je     1088e0 <inode_get+0xa0>
    for (ip = &inode_cache.inode[0]; ip < &inode_cache.inode[NINODE]; ip++) {
  108884:	83 c6 50             	add    $0x50,%esi
  108887:	39 d6                	cmp    %edx,%esi
  108889:	74 1d                	je     1088a8 <inode_get+0x68>
        if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
  10888b:	8b 46 08             	mov    0x8(%esi),%eax
  10888e:	85 c0                	test   %eax,%eax
  108890:	7f ee                	jg     108880 <inode_get+0x40>
        if (empty == 0 && ip->ref == 0)  // Remember empty slot.
  108892:	85 ff                	test   %edi,%edi
  108894:	75 ee                	jne    108884 <inode_get+0x44>
  108896:	85 c0                	test   %eax,%eax
  108898:	75 6c                	jne    108906 <inode_get+0xc6>
            empty = ip;
  10889a:	89 f7                	mov    %esi,%edi
    for (ip = &inode_cache.inode[0]; ip < &inode_cache.inode[NINODE]; ip++) {
  10889c:	83 c6 50             	add    $0x50,%esi
  10889f:	39 d6                	cmp    %edx,%esi
  1088a1:	75 e8                	jne    10888b <inode_get+0x4b>
  1088a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if (empty == 0)
  1088a8:	85 ff                	test   %edi,%edi
  1088aa:	74 71                	je     10891d <inode_get+0xdd>
    spinlock_release(&inode_cache.lock);
  1088ac:	83 ec 0c             	sub    $0xc,%esp
    ip->dev = dev;
  1088af:	89 2f                	mov    %ebp,(%edi)
    ip->inum = inum;
  1088b1:	89 4f 04             	mov    %ecx,0x4(%edi)
    ip->ref = 1;
  1088b4:	c7 47 08 01 00 00 00 	movl   $0x1,0x8(%edi)
    ip->flags = 0;
  1088bb:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    spinlock_release(&inode_cache.lock);
  1088c2:	ff 74 24 18          	push   0x18(%esp)
  1088c6:	e8 e5 d7 ff ff       	call   1060b0 <spinlock_release>
    return ip;
  1088cb:	83 c4 10             	add    $0x10,%esp
}
  1088ce:	89 f8                	mov    %edi,%eax
  1088d0:	83 c4 1c             	add    $0x1c,%esp
  1088d3:	5b                   	pop    %ebx
  1088d4:	5e                   	pop    %esi
  1088d5:	5f                   	pop    %edi
  1088d6:	5d                   	pop    %ebp
  1088d7:	c3                   	ret
  1088d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1088df:	00 
        if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
  1088e0:	39 4e 04             	cmp    %ecx,0x4(%esi)
  1088e3:	75 9f                	jne    108884 <inode_get+0x44>
            ip->ref++;
  1088e5:	83 c0 01             	add    $0x1,%eax
            spinlock_release(&inode_cache.lock);
  1088e8:	83 ec 0c             	sub    $0xc,%esp
            return ip;
  1088eb:	89 f7                	mov    %esi,%edi
            ip->ref++;
  1088ed:	89 46 08             	mov    %eax,0x8(%esi)
            spinlock_release(&inode_cache.lock);
  1088f0:	ff 74 24 18          	push   0x18(%esp)
  1088f4:	e8 b7 d7 ff ff       	call   1060b0 <spinlock_release>
            return ip;
  1088f9:	83 c4 10             	add    $0x10,%esp
}
  1088fc:	89 f8                	mov    %edi,%eax
  1088fe:	83 c4 1c             	add    $0x1c,%esp
  108901:	5b                   	pop    %ebx
  108902:	5e                   	pop    %esi
  108903:	5f                   	pop    %edi
  108904:	5d                   	pop    %ebp
  108905:	c3                   	ret
    for (ip = &inode_cache.inode[0]; ip < &inode_cache.inode[NINODE]; ip++) {
  108906:	83 c6 50             	add    $0x50,%esi
  108909:	39 d6                	cmp    %edx,%esi
  10890b:	74 10                	je     10891d <inode_get+0xdd>
        if (ip->ref > 0 && ip->dev == dev && ip->inum == inum) {
  10890d:	8b 46 08             	mov    0x8(%esi),%eax
  108910:	85 c0                	test   %eax,%eax
  108912:	0f 8f 68 ff ff ff    	jg     108880 <inode_get+0x40>
  108918:	e9 79 ff ff ff       	jmp    108896 <inode_get+0x56>
  10891d:	89 4c 24 34          	mov    %ecx,0x34(%esp)
        KERN_PANIC("inode_get: no inodes");
  108921:	8d 83 04 79 ff ff    	lea    -0x86fc(%ebx),%eax
  108927:	83 ec 04             	sub    $0x4,%esp
  10892a:	31 ff                	xor    %edi,%edi
  10892c:	50                   	push   %eax
  10892d:	8d 83 f4 78 ff ff    	lea    -0x870c(%ebx),%eax
  108933:	6a 69                	push   $0x69
  108935:	50                   	push   %eax
  108936:	e8 a5 be ff ff       	call   1047e0 <debug_panic>
  10893b:	83 c4 10             	add    $0x10,%esp
  10893e:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  108942:	e9 65 ff ff ff       	jmp    1088ac <inode_get+0x6c>
  108947:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10894e:	00 
  10894f:	90                   	nop

00108950 <inode_alloc>:
{
  108950:	55                   	push   %ebp
  108951:	57                   	push   %edi
  108952:	56                   	push   %esi
  108953:	53                   	push   %ebx
  108954:	e8 49 7a ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108959:	81 c3 9b b6 00 00    	add    $0xb69b,%ebx
  10895f:	83 ec 34             	sub    $0x34,%esp
  108962:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  108966:	8b 7c 24 48          	mov    0x48(%esp),%edi
  10896a:	89 44 24 10          	mov    %eax,0x10(%esp)
    read_superblock(dev, &sb);
  10896e:	8d 44 24 18          	lea    0x18(%esp),%eax
  108972:	50                   	push   %eax
  108973:	57                   	push   %edi
  108974:	e8 47 fa ff ff       	call   1083c0 <read_superblock>
    for (inum = 1; inum < sb.ninodes; inum++) {
  108979:	83 c4 10             	add    $0x10,%esp
  10897c:	83 7c 24 18 01       	cmpl   $0x1,0x18(%esp)
  108981:	0f 86 89 00 00 00    	jbe    108a10 <inode_alloc+0xc0>
  108987:	bd 01 00 00 00       	mov    $0x1,%ebp
  10898c:	eb 17                	jmp    1089a5 <inode_alloc+0x55>
  10898e:	66 90                	xchg   %ax,%ax
        bufcache_release(bp);
  108990:	83 ec 0c             	sub    $0xc,%esp
    for (inum = 1; inum < sb.ninodes; inum++) {
  108993:	83 c5 01             	add    $0x1,%ebp
        bufcache_release(bp);
  108996:	56                   	push   %esi
  108997:	e8 c4 f5 ff ff       	call   107f60 <bufcache_release>
    for (inum = 1; inum < sb.ninodes; inum++) {
  10899c:	83 c4 10             	add    $0x10,%esp
  10899f:	3b 6c 24 18          	cmp    0x18(%esp),%ebp
  1089a3:	73 6b                	jae    108a10 <inode_alloc+0xc0>
        bp = bufcache_read(dev, IBLOCK(inum));
  1089a5:	89 e8                	mov    %ebp,%eax
  1089a7:	83 ec 08             	sub    $0x8,%esp
  1089aa:	c1 e8 03             	shr    $0x3,%eax
  1089ad:	83 c0 02             	add    $0x2,%eax
  1089b0:	50                   	push   %eax
  1089b1:	57                   	push   %edi
  1089b2:	e8 29 f4 ff ff       	call   107de0 <bufcache_read>
        if (dip->type == 0) {  // a free inode
  1089b7:	83 c4 10             	add    $0x10,%esp
        bp = bufcache_read(dev, IBLOCK(inum));
  1089ba:	89 c6                	mov    %eax,%esi
        dip = (struct dinode *) bp->data + inum % IPB;
  1089bc:	89 e8                	mov    %ebp,%eax
  1089be:	83 e0 07             	and    $0x7,%eax
  1089c1:	c1 e0 06             	shl    $0x6,%eax
  1089c4:	8d 4c 06 18          	lea    0x18(%esi,%eax,1),%ecx
        if (dip->type == 0) {  // a free inode
  1089c8:	66 83 39 00          	cmpw   $0x0,(%ecx)
  1089cc:	75 c2                	jne    108990 <inode_alloc+0x40>
            memset(dip, 0, sizeof(*dip));
  1089ce:	83 ec 04             	sub    $0x4,%esp
  1089d1:	6a 40                	push   $0x40
  1089d3:	6a 00                	push   $0x0
  1089d5:	51                   	push   %ecx
  1089d6:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
  1089da:	e8 41 ba ff ff       	call   104420 <memset>
            dip->type = type;
  1089df:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  1089e3:	0f b7 44 24 18       	movzwl 0x18(%esp),%eax
  1089e8:	66 89 01             	mov    %ax,(%ecx)
            log_write(bp);  // mark it allocated on the disk
  1089eb:	89 34 24             	mov    %esi,(%esp)
  1089ee:	e8 9d f8 ff ff       	call   108290 <log_write>
            bufcache_release(bp);
  1089f3:	89 34 24             	mov    %esi,(%esp)
  1089f6:	e8 65 f5 ff ff       	call   107f60 <bufcache_release>
            return inode_get(dev, inum);
  1089fb:	58                   	pop    %eax
  1089fc:	5a                   	pop    %edx
  1089fd:	55                   	push   %ebp
  1089fe:	57                   	push   %edi
  1089ff:	e8 3c fe ff ff       	call   108840 <inode_get>
  108a04:	83 c4 10             	add    $0x10,%esp
}
  108a07:	83 c4 2c             	add    $0x2c,%esp
  108a0a:	5b                   	pop    %ebx
  108a0b:	5e                   	pop    %esi
  108a0c:	5f                   	pop    %edi
  108a0d:	5d                   	pop    %ebp
  108a0e:	c3                   	ret
  108a0f:	90                   	nop
    KERN_PANIC("inode_alloc: no inodes");
  108a10:	83 ec 04             	sub    $0x4,%esp
  108a13:	8d 83 19 79 ff ff    	lea    -0x86e7(%ebx),%eax
  108a19:	50                   	push   %eax
  108a1a:	8d 83 f4 78 ff ff    	lea    -0x870c(%ebx),%eax
  108a20:	6a 38                	push   $0x38
  108a22:	50                   	push   %eax
  108a23:	e8 b8 bd ff ff       	call   1047e0 <debug_panic>
    return NULL;
  108a28:	83 c4 10             	add    $0x10,%esp
  108a2b:	31 c0                	xor    %eax,%eax
}
  108a2d:	83 c4 2c             	add    $0x2c,%esp
  108a30:	5b                   	pop    %ebx
  108a31:	5e                   	pop    %esi
  108a32:	5f                   	pop    %edi
  108a33:	5d                   	pop    %ebp
  108a34:	c3                   	ret
  108a35:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108a3c:	00 
  108a3d:	8d 76 00             	lea    0x0(%esi),%esi

00108a40 <inode_dup>:
{
  108a40:	57                   	push   %edi
  108a41:	56                   	push   %esi
  108a42:	53                   	push   %ebx
  108a43:	8b 74 24 10          	mov    0x10(%esp),%esi
  108a47:	e8 56 79 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108a4c:	81 c3 a8 b5 00 00    	add    $0xb5a8,%ebx
    spinlock_acquire(&inode_cache.lock);
  108a52:	83 ec 0c             	sub    $0xc,%esp
  108a55:	8d bb 0c 68 51 00    	lea    0x51680c(%ebx),%edi
  108a5b:	57                   	push   %edi
  108a5c:	e8 cf d5 ff ff       	call   106030 <spinlock_acquire>
    ip->ref++;
  108a61:	83 46 08 01          	addl   $0x1,0x8(%esi)
    spinlock_release(&inode_cache.lock);
  108a65:	89 3c 24             	mov    %edi,(%esp)
  108a68:	e8 43 d6 ff ff       	call   1060b0 <spinlock_release>
    return ip;
  108a6d:	83 c4 10             	add    $0x10,%esp
}
  108a70:	89 f0                	mov    %esi,%eax
  108a72:	5b                   	pop    %ebx
  108a73:	5e                   	pop    %esi
  108a74:	5f                   	pop    %edi
  108a75:	c3                   	ret
  108a76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108a7d:	00 
  108a7e:	66 90                	xchg   %ax,%ax

00108a80 <inode_lock>:
{
  108a80:	57                   	push   %edi
  108a81:	56                   	push   %esi
  108a82:	53                   	push   %ebx
  108a83:	8b 74 24 10          	mov    0x10(%esp),%esi
  108a87:	e8 16 79 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108a8c:	81 c3 68 b5 00 00    	add    $0xb568,%ebx
    if (ip == 0 || ip->ref < 1)
  108a92:	85 f6                	test   %esi,%esi
  108a94:	74 5a                	je     108af0 <inode_lock+0x70>
  108a96:	8b 46 08             	mov    0x8(%esi),%eax
  108a99:	85 c0                	test   %eax,%eax
  108a9b:	7e 53                	jle    108af0 <inode_lock+0x70>
    spinlock_acquire(&inode_cache.lock);
  108a9d:	83 ec 0c             	sub    $0xc,%esp
  108aa0:	8d bb 0c 68 51 00    	lea    0x51680c(%ebx),%edi
  108aa6:	57                   	push   %edi
  108aa7:	e8 84 d5 ff ff       	call   106030 <spinlock_acquire>
    while (ip->flags & I_BUSY)
  108aac:	8b 46 0c             	mov    0xc(%esi),%eax
  108aaf:	83 c4 10             	add    $0x10,%esp
  108ab2:	a8 01                	test   $0x1,%al
  108ab4:	74 1e                	je     108ad4 <inode_lock+0x54>
  108ab6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108abd:	00 
  108abe:	66 90                	xchg   %ax,%ax
        thread_sleep(ip, &inode_cache.lock);
  108ac0:	83 ec 08             	sub    $0x8,%esp
  108ac3:	57                   	push   %edi
  108ac4:	56                   	push   %esi
  108ac5:	e8 46 e6 ff ff       	call   107110 <thread_sleep>
    while (ip->flags & I_BUSY)
  108aca:	8b 46 0c             	mov    0xc(%esi),%eax
  108acd:	83 c4 10             	add    $0x10,%esp
  108ad0:	a8 01                	test   $0x1,%al
  108ad2:	75 ec                	jne    108ac0 <inode_lock+0x40>
    spinlock_release(&inode_cache.lock);
  108ad4:	83 ec 0c             	sub    $0xc,%esp
    ip->flags |= I_BUSY;
  108ad7:	83 c8 01             	or     $0x1,%eax
  108ada:	89 46 0c             	mov    %eax,0xc(%esi)
    spinlock_release(&inode_cache.lock);
  108add:	57                   	push   %edi
  108ade:	e8 cd d5 ff ff       	call   1060b0 <spinlock_release>
    if (!(ip->flags & I_VALID)) {
  108ae3:	83 c4 10             	add    $0x10,%esp
  108ae6:	f6 46 0c 02          	testb  $0x2,0xc(%esi)
  108aea:	74 24                	je     108b10 <inode_lock+0x90>
}
  108aec:	5b                   	pop    %ebx
  108aed:	5e                   	pop    %esi
  108aee:	5f                   	pop    %edi
  108aef:	c3                   	ret
        KERN_PANIC("inode_lock");
  108af0:	83 ec 04             	sub    $0x4,%esp
  108af3:	8d 83 30 79 ff ff    	lea    -0x86d0(%ebx),%eax
  108af9:	50                   	push   %eax
  108afa:	8d 83 f4 78 ff ff    	lea    -0x870c(%ebx),%eax
  108b00:	68 8b 00 00 00       	push   $0x8b
  108b05:	50                   	push   %eax
  108b06:	e8 d5 bc ff ff       	call   1047e0 <debug_panic>
  108b0b:	83 c4 10             	add    $0x10,%esp
  108b0e:	eb 8d                	jmp    108a9d <inode_lock+0x1d>
        bp = bufcache_read(ip->dev, IBLOCK(ip->inum));
  108b10:	8b 46 04             	mov    0x4(%esi),%eax
  108b13:	83 ec 08             	sub    $0x8,%esp
  108b16:	c1 e8 03             	shr    $0x3,%eax
  108b19:	83 c0 02             	add    $0x2,%eax
  108b1c:	50                   	push   %eax
  108b1d:	ff 36                	push   (%esi)
  108b1f:	e8 bc f2 ff ff       	call   107de0 <bufcache_read>
        memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  108b24:	83 c4 0c             	add    $0xc,%esp
        bp = bufcache_read(ip->dev, IBLOCK(ip->inum));
  108b27:	89 c7                	mov    %eax,%edi
        dip = (struct dinode *) bp->data + ip->inum % IPB;
  108b29:	8b 46 04             	mov    0x4(%esi),%eax
  108b2c:	83 e0 07             	and    $0x7,%eax
  108b2f:	c1 e0 06             	shl    $0x6,%eax
  108b32:	8d 44 07 18          	lea    0x18(%edi,%eax,1),%eax
        ip->type = dip->type;
  108b36:	8b 50 04             	mov    0x4(%eax),%edx
  108b39:	8b 08                	mov    (%eax),%ecx
        memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  108b3b:	83 c0 0c             	add    $0xc,%eax
        ip->type = dip->type;
  108b3e:	89 56 14             	mov    %edx,0x14(%esi)
        ip->size = dip->size;
  108b41:	8b 50 fc             	mov    -0x4(%eax),%edx
        ip->type = dip->type;
  108b44:	89 4e 10             	mov    %ecx,0x10(%esi)
        ip->size = dip->size;
  108b47:	89 56 18             	mov    %edx,0x18(%esi)
        memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
  108b4a:	6a 34                	push   $0x34
  108b4c:	50                   	push   %eax
  108b4d:	8d 46 1c             	lea    0x1c(%esi),%eax
  108b50:	50                   	push   %eax
  108b51:	e8 0a b9 ff ff       	call   104460 <memmove>
        bufcache_release(bp);
  108b56:	89 3c 24             	mov    %edi,(%esp)
  108b59:	e8 02 f4 ff ff       	call   107f60 <bufcache_release>
        ip->flags |= I_VALID;
  108b5e:	83 4e 0c 02          	orl    $0x2,0xc(%esi)
        if (ip->type == 0)
  108b62:	83 c4 10             	add    $0x10,%esp
  108b65:	66 83 7e 10 00       	cmpw   $0x0,0x10(%esi)
  108b6a:	75 80                	jne    108aec <inode_lock+0x6c>
            KERN_PANIC("inode_lock: no type");
  108b6c:	83 ec 04             	sub    $0x4,%esp
  108b6f:	8d 83 3b 79 ff ff    	lea    -0x86c5(%ebx),%eax
  108b75:	50                   	push   %eax
  108b76:	8d 83 f4 78 ff ff    	lea    -0x870c(%ebx),%eax
  108b7c:	68 9f 00 00 00       	push   $0x9f
  108b81:	50                   	push   %eax
  108b82:	e8 59 bc ff ff       	call   1047e0 <debug_panic>
  108b87:	83 c4 10             	add    $0x10,%esp
}
  108b8a:	5b                   	pop    %ebx
  108b8b:	5e                   	pop    %esi
  108b8c:	5f                   	pop    %edi
  108b8d:	c3                   	ret
  108b8e:	66 90                	xchg   %ax,%ax

00108b90 <inode_unlock>:
{
  108b90:	57                   	push   %edi
  108b91:	56                   	push   %esi
  108b92:	53                   	push   %ebx
  108b93:	8b 74 24 10          	mov    0x10(%esp),%esi
  108b97:	e8 06 78 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108b9c:	81 c3 58 b4 00 00    	add    $0xb458,%ebx
    if (ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
  108ba2:	85 f6                	test   %esi,%esi
  108ba4:	74 06                	je     108bac <inode_unlock+0x1c>
  108ba6:	f6 46 0c 01          	testb  $0x1,0xc(%esi)
  108baa:	75 4c                	jne    108bf8 <inode_unlock+0x68>
        KERN_PANIC("inode_unlock");
  108bac:	83 ec 04             	sub    $0x4,%esp
  108baf:	8d 83 4f 79 ff ff    	lea    -0x86b1(%ebx),%eax
  108bb5:	50                   	push   %eax
  108bb6:	8d 83 f4 78 ff ff    	lea    -0x870c(%ebx),%eax
  108bbc:	68 aa 00 00 00       	push   $0xaa
  108bc1:	50                   	push   %eax
  108bc2:	e8 19 bc ff ff       	call   1047e0 <debug_panic>
  108bc7:	83 c4 10             	add    $0x10,%esp
    spinlock_acquire(&inode_cache.lock);
  108bca:	83 ec 0c             	sub    $0xc,%esp
  108bcd:	8d bb 0c 68 51 00    	lea    0x51680c(%ebx),%edi
  108bd3:	57                   	push   %edi
  108bd4:	e8 57 d4 ff ff       	call   106030 <spinlock_acquire>
    ip->flags &= ~I_BUSY;
  108bd9:	83 66 0c fe          	andl   $0xfffffffe,0xc(%esi)
    thread_wakeup(ip);
  108bdd:	89 34 24             	mov    %esi,(%esp)
  108be0:	e8 6b e5 ff ff       	call   107150 <thread_wakeup>
    spinlock_release(&inode_cache.lock);
  108be5:	89 3c 24             	mov    %edi,(%esp)
  108be8:	e8 c3 d4 ff ff       	call   1060b0 <spinlock_release>
}
  108bed:	83 c4 10             	add    $0x10,%esp
  108bf0:	5b                   	pop    %ebx
  108bf1:	5e                   	pop    %esi
  108bf2:	5f                   	pop    %edi
  108bf3:	c3                   	ret
  108bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
  108bf8:	8b 46 08             	mov    0x8(%esi),%eax
  108bfb:	85 c0                	test   %eax,%eax
  108bfd:	7f cb                	jg     108bca <inode_unlock+0x3a>
  108bff:	eb ab                	jmp    108bac <inode_unlock+0x1c>
  108c01:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108c08:	00 
  108c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00108c10 <inode_put>:
{
  108c10:	55                   	push   %ebp
  108c11:	57                   	push   %edi
  108c12:	56                   	push   %esi
  108c13:	53                   	push   %ebx
  108c14:	e8 89 77 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108c19:	81 c3 db b3 00 00    	add    $0xb3db,%ebx
  108c1f:	83 ec 28             	sub    $0x28,%esp
  108c22:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    spinlock_acquire(&inode_cache.lock);
  108c26:	8d bb 0c 68 51 00    	lea    0x51680c(%ebx),%edi
  108c2c:	57                   	push   %edi
  108c2d:	e8 fe d3 ff ff       	call   106030 <spinlock_acquire>
    if (ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0) {
  108c32:	8b 46 08             	mov    0x8(%esi),%eax
  108c35:	83 c4 10             	add    $0x10,%esp
  108c38:	83 f8 01             	cmp    $0x1,%eax
  108c3b:	74 1b                	je     108c58 <inode_put+0x48>
    spinlock_release(&inode_cache.lock);
  108c3d:	83 ec 0c             	sub    $0xc,%esp
    ip->ref--;
  108c40:	83 e8 01             	sub    $0x1,%eax
  108c43:	89 46 08             	mov    %eax,0x8(%esi)
    spinlock_release(&inode_cache.lock);
  108c46:	57                   	push   %edi
  108c47:	e8 64 d4 ff ff       	call   1060b0 <spinlock_release>
}
  108c4c:	83 c4 2c             	add    $0x2c,%esp
  108c4f:	5b                   	pop    %ebx
  108c50:	5e                   	pop    %esi
  108c51:	5f                   	pop    %edi
  108c52:	5d                   	pop    %ebp
  108c53:	c3                   	ret
  108c54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0) {
  108c58:	8b 56 0c             	mov    0xc(%esi),%edx
  108c5b:	f6 c2 02             	test   $0x2,%dl
  108c5e:	74 dd                	je     108c3d <inode_put+0x2d>
  108c60:	66 83 7e 16 00       	cmpw   $0x0,0x16(%esi)
  108c65:	75 d6                	jne    108c3d <inode_put+0x2d>
        if (ip->flags & I_BUSY)
  108c67:	f6 c2 01             	test   $0x1,%dl
  108c6a:	0f 85 97 00 00 00    	jne    108d07 <inode_put+0xf7>
        ip->flags |= I_BUSY;
  108c70:	83 ca 01             	or     $0x1,%edx
        spinlock_release(&inode_cache.lock);
  108c73:	83 ec 0c             	sub    $0xc,%esp
  108c76:	8d 6e 1c             	lea    0x1c(%esi),%ebp
        ip->flags |= I_BUSY;
  108c79:	89 56 0c             	mov    %edx,0xc(%esi)
        spinlock_release(&inode_cache.lock);
  108c7c:	57                   	push   %edi
  108c7d:	e8 2e d4 ff ff       	call   1060b0 <spinlock_release>
{
    int i, j;
    struct buf *bp;
    uint32_t *a;

    for (i = 0; i < NDIRECT; i++) {
  108c82:	8d 56 4c             	lea    0x4c(%esi),%edx
  108c85:	83 c4 10             	add    $0x10,%esp
  108c88:	eb 0d                	jmp    108c97 <inode_put+0x87>
  108c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  108c90:	83 c5 04             	add    $0x4,%ebp
  108c93:	39 d5                	cmp    %edx,%ebp
  108c95:	74 29                	je     108cc0 <inode_put+0xb0>
        if (ip->addrs[i]) {
  108c97:	8b 45 00             	mov    0x0(%ebp),%eax
  108c9a:	85 c0                	test   %eax,%eax
  108c9c:	74 f2                	je     108c90 <inode_put+0x80>
  108c9e:	89 54 24 08          	mov    %edx,0x8(%esp)
            block_free(ip->dev, ip->addrs[i]);
  108ca2:	83 ec 08             	sub    $0x8,%esp
  108ca5:	50                   	push   %eax
  108ca6:	ff 36                	push   (%esi)
  108ca8:	e8 13 f9 ff ff       	call   1085c0 <block_free>
            ip->addrs[i] = 0;
  108cad:	83 c4 10             	add    $0x10,%esp
  108cb0:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
  108cb7:	8b 54 24 08          	mov    0x8(%esp),%edx
  108cbb:	eb d3                	jmp    108c90 <inode_put+0x80>
  108cbd:	8d 76 00             	lea    0x0(%esi),%esi
        }
    }

    if (ip->addrs[NDIRECT]) {
  108cc0:	8b 46 4c             	mov    0x4c(%esi),%eax
  108cc3:	85 c0                	test   %eax,%eax
  108cc5:	75 66                	jne    108d2d <inode_put+0x11d>
        block_free(ip->dev, ip->addrs[NDIRECT]);
        ip->addrs[NDIRECT] = 0;
    }

    ip->size = 0;
    inode_update(ip);
  108cc7:	83 ec 0c             	sub    $0xc,%esp
    ip->size = 0;
  108cca:	c7 46 18 00 00 00 00 	movl   $0x0,0x18(%esi)
    inode_update(ip);
  108cd1:	56                   	push   %esi
  108cd2:	e8 e9 fa ff ff       	call   1087c0 <inode_update>
        ip->type = 0;
  108cd7:	31 c0                	xor    %eax,%eax
  108cd9:	66 89 46 10          	mov    %ax,0x10(%esi)
        inode_update(ip);
  108cdd:	89 34 24             	mov    %esi,(%esp)
  108ce0:	e8 db fa ff ff       	call   1087c0 <inode_update>
        spinlock_acquire(&inode_cache.lock);
  108ce5:	89 3c 24             	mov    %edi,(%esp)
  108ce8:	e8 43 d3 ff ff       	call   106030 <spinlock_acquire>
        ip->flags = 0;
  108ced:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
        thread_wakeup(ip);
  108cf4:	89 34 24             	mov    %esi,(%esp)
  108cf7:	e8 54 e4 ff ff       	call   107150 <thread_wakeup>
    ip->ref--;
  108cfc:	8b 46 08             	mov    0x8(%esi),%eax
  108cff:	83 c4 10             	add    $0x10,%esp
  108d02:	e9 36 ff ff ff       	jmp    108c3d <inode_put+0x2d>
            KERN_PANIC("inode_put busy");
  108d07:	83 ec 04             	sub    $0x4,%esp
  108d0a:	8d 83 5c 79 ff ff    	lea    -0x86a4(%ebx),%eax
  108d10:	50                   	push   %eax
  108d11:	8d 83 f4 78 ff ff    	lea    -0x870c(%ebx),%eax
  108d17:	68 bf 00 00 00       	push   $0xbf
  108d1c:	50                   	push   %eax
  108d1d:	e8 be ba ff ff       	call   1047e0 <debug_panic>
        ip->flags |= I_BUSY;
  108d22:	8b 56 0c             	mov    0xc(%esi),%edx
  108d25:	83 c4 10             	add    $0x10,%esp
  108d28:	e9 43 ff ff ff       	jmp    108c70 <inode_put+0x60>
        bp = bufcache_read(ip->dev, ip->addrs[NDIRECT]);
  108d2d:	83 ec 08             	sub    $0x8,%esp
  108d30:	50                   	push   %eax
  108d31:	ff 36                	push   (%esi)
  108d33:	e8 a8 f0 ff ff       	call   107de0 <bufcache_read>
  108d38:	89 c2                	mov    %eax,%edx
  108d3a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        for (j = 0; j < NINDIRECT; j++) {
  108d3e:	8d 40 18             	lea    0x18(%eax),%eax
  108d41:	83 c4 10             	add    $0x10,%esp
  108d44:	8d aa 18 02 00 00    	lea    0x218(%edx),%ebp
  108d4a:	eb 0b                	jmp    108d57 <inode_put+0x147>
  108d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  108d50:	83 c0 04             	add    $0x4,%eax
  108d53:	39 e8                	cmp    %ebp,%eax
  108d55:	74 1e                	je     108d75 <inode_put+0x165>
            if (a[j])
  108d57:	8b 08                	mov    (%eax),%ecx
  108d59:	85 c9                	test   %ecx,%ecx
  108d5b:	74 f3                	je     108d50 <inode_put+0x140>
  108d5d:	89 44 24 08          	mov    %eax,0x8(%esp)
                block_free(ip->dev, a[j]);
  108d61:	83 ec 08             	sub    $0x8,%esp
  108d64:	51                   	push   %ecx
  108d65:	ff 36                	push   (%esi)
  108d67:	e8 54 f8 ff ff       	call   1085c0 <block_free>
  108d6c:	83 c4 10             	add    $0x10,%esp
  108d6f:	8b 44 24 08          	mov    0x8(%esp),%eax
  108d73:	eb db                	jmp    108d50 <inode_put+0x140>
        bufcache_release(bp);
  108d75:	83 ec 0c             	sub    $0xc,%esp
  108d78:	ff 74 24 18          	push   0x18(%esp)
  108d7c:	e8 df f1 ff ff       	call   107f60 <bufcache_release>
        block_free(ip->dev, ip->addrs[NDIRECT]);
  108d81:	5a                   	pop    %edx
  108d82:	59                   	pop    %ecx
  108d83:	ff 76 4c             	push   0x4c(%esi)
  108d86:	ff 36                	push   (%esi)
  108d88:	e8 33 f8 ff ff       	call   1085c0 <block_free>
        ip->addrs[NDIRECT] = 0;
  108d8d:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  108d94:	83 c4 10             	add    $0x10,%esp
  108d97:	e9 2b ff ff ff       	jmp    108cc7 <inode_put+0xb7>
  108d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00108da0 <inode_unlockput>:
{
  108da0:	53                   	push   %ebx
  108da1:	83 ec 14             	sub    $0x14,%esp
  108da4:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    inode_unlock(ip);
  108da8:	53                   	push   %ebx
  108da9:	e8 e2 fd ff ff       	call   108b90 <inode_unlock>
    inode_put(ip);
  108dae:	89 5c 24 20          	mov    %ebx,0x20(%esp)
}
  108db2:	83 c4 18             	add    $0x18,%esp
  108db5:	5b                   	pop    %ebx
    inode_put(ip);
  108db6:	e9 55 fe ff ff       	jmp    108c10 <inode_put>
  108dbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00108dc0 <inode_stat>:

/**
 * Copy stat information from inode.
 */
void inode_stat(struct inode *ip, struct file_stat *st)
{
  108dc0:	53                   	push   %ebx
  108dc1:	8b 54 24 08          	mov    0x8(%esp),%edx
  108dc5:	8b 44 24 0c          	mov    0xc(%esp),%eax
    st->dev = ip->dev;
  108dc9:	8b 4a 04             	mov    0x4(%edx),%ecx
  108dcc:	8b 1a                	mov    (%edx),%ebx
  108dce:	89 48 08             	mov    %ecx,0x8(%eax)
    st->ino = ip->inum;
    st->type = ip->type;
  108dd1:	0f b7 4a 10          	movzwl 0x10(%edx),%ecx
    st->dev = ip->dev;
  108dd5:	89 58 04             	mov    %ebx,0x4(%eax)
    st->type = ip->type;
  108dd8:	66 89 08             	mov    %cx,(%eax)
    st->nlink = ip->nlink;
  108ddb:	0f b7 4a 16          	movzwl 0x16(%edx),%ecx
    st->size = ip->size;
  108ddf:	8b 52 18             	mov    0x18(%edx),%edx
    st->nlink = ip->nlink;
  108de2:	66 89 48 0c          	mov    %cx,0xc(%eax)
    st->size = ip->size;
  108de6:	89 50 10             	mov    %edx,0x10(%eax)
}
  108de9:	5b                   	pop    %ebx
  108dea:	c3                   	ret
  108deb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00108df0 <inode_read>:

/**
 * Read data from inode.
 */
int inode_read(struct inode *ip, char *dst, uint32_t off, uint32_t n)
{
  108df0:	55                   	push   %ebp
  108df1:	57                   	push   %edi
  108df2:	56                   	push   %esi
  108df3:	53                   	push   %ebx
  108df4:	e8 a9 75 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108df9:	81 c3 fb b1 00 00    	add    $0xb1fb,%ebx
  108dff:	83 ec 2c             	sub    $0x2c,%esp
  108e02:	8b 4c 24 40          	mov    0x40(%esp),%ecx
  108e06:	8b 44 24 44          	mov    0x44(%esp),%eax
  108e0a:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    uint32_t tot, m;
    struct buf *bp;

    if (ip->type == T_DEV) {
  108e0e:	66 83 79 10 03       	cmpw   $0x3,0x10(%ecx)
{
  108e13:	89 44 24 0c          	mov    %eax,0xc(%esp)
  108e17:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    if (ip->type == T_DEV) {
  108e1b:	0f 84 bf 00 00 00    	je     108ee0 <inode_read+0xf0>
        if (ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
            return -1;
        return devsw[ip->major].read(ip, dst, n);
    }

    if (off > ip->size || off + n < off)
  108e21:	8b 79 18             	mov    0x18(%ecx),%edi
  108e24:	39 ef                	cmp    %ebp,%edi
  108e26:	0f 82 e4 00 00 00    	jb     108f10 <inode_read+0x120>
  108e2c:	89 ee                	mov    %ebp,%esi
  108e2e:	31 d2                	xor    %edx,%edx
  108e30:	01 c6                	add    %eax,%esi
  108e32:	0f 92 c2             	setb   %dl
  108e35:	0f 82 d5 00 00 00    	jb     108f10 <inode_read+0x120>
        return -1;
    if (off + n > ip->size)
        n = ip->size - off;
  108e3b:	89 7c 24 10          	mov    %edi,0x10(%esp)
  108e3f:	29 ef                	sub    %ebp,%edi
  108e41:	39 74 24 10          	cmp    %esi,0x10(%esp)
  108e45:	0f 42 c7             	cmovb  %edi,%eax

    for (tot = 0; tot < n; tot += m, off += m, dst += m) {
  108e48:	85 c0                	test   %eax,%eax
  108e4a:	0f 84 88 00 00 00    	je     108ed8 <inode_read+0xe8>
        bp = bufcache_read(ip->dev, bmap(ip, off / BSIZE));
        m = min(n - tot, BSIZE - off % BSIZE);
  108e50:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
  108e54:	89 d7                	mov    %edx,%edi
  108e56:	89 44 24 10          	mov    %eax,0x10(%esp)
  108e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        bp = bufcache_read(ip->dev, bmap(ip, off / BSIZE));
  108e60:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  108e64:	89 ea                	mov    %ebp,%edx
  108e66:	c1 ea 09             	shr    $0x9,%edx
  108e69:	89 f0                	mov    %esi,%eax
  108e6b:	e8 20 f8 ff ff       	call   108690 <bmap>
  108e70:	83 ec 08             	sub    $0x8,%esp
  108e73:	50                   	push   %eax
  108e74:	ff 36                	push   (%esi)
  108e76:	e8 65 ef ff ff       	call   107de0 <bufcache_read>
        m = min(n - tot, BSIZE - off % BSIZE);
  108e7b:	89 e9                	mov    %ebp,%ecx
  108e7d:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
        bp = bufcache_read(ip->dev, bmap(ip, off / BSIZE));
  108e83:	89 c6                	mov    %eax,%esi
        m = min(n - tot, BSIZE - off % BSIZE);
  108e85:	58                   	pop    %eax
  108e86:	b8 00 02 00 00       	mov    $0x200,%eax
  108e8b:	5a                   	pop    %edx
  108e8c:	29 c8                	sub    %ecx,%eax
  108e8e:	89 4c 24 20          	mov    %ecx,0x20(%esp)
  108e92:	50                   	push   %eax
  108e93:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  108e97:	29 f8                	sub    %edi,%eax
  108e99:	50                   	push   %eax
  108e9a:	e8 c1 c4 ff ff       	call   105360 <min>
        memmove(dst, bp->data + off % BSIZE, m);
  108e9f:	83 c4 0c             	add    $0xc,%esp
  108ea2:	50                   	push   %eax
  108ea3:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  108ea7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  108eab:	8d 44 0e 18          	lea    0x18(%esi,%ecx,1),%eax
  108eaf:	50                   	push   %eax
  108eb0:	ff 74 24 18          	push   0x18(%esp)
  108eb4:	e8 a7 b5 ff ff       	call   104460 <memmove>
        bufcache_release(bp);
  108eb9:	89 34 24             	mov    %esi,(%esp)
  108ebc:	e8 9f f0 ff ff       	call   107f60 <bufcache_release>
    for (tot = 0; tot < n; tot += m, off += m, dst += m) {
  108ec1:	8b 54 24 24          	mov    0x24(%esp),%edx
  108ec5:	01 54 24 1c          	add    %edx,0x1c(%esp)
  108ec9:	83 c4 10             	add    $0x10,%esp
  108ecc:	8b 44 24 10          	mov    0x10(%esp),%eax
  108ed0:	01 d7                	add    %edx,%edi
  108ed2:	01 d5                	add    %edx,%ebp
  108ed4:	39 c7                	cmp    %eax,%edi
  108ed6:	72 88                	jb     108e60 <inode_read+0x70>
    }
    return n;
}
  108ed8:	83 c4 2c             	add    $0x2c,%esp
  108edb:	5b                   	pop    %ebx
  108edc:	5e                   	pop    %esi
  108edd:	5f                   	pop    %edi
  108ede:	5d                   	pop    %ebp
  108edf:	c3                   	ret
        if (ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
  108ee0:	0f bf 51 12          	movswl 0x12(%ecx),%edx
  108ee4:	66 83 fa 09          	cmp    $0x9,%dx
  108ee8:	77 26                	ja     108f10 <inode_read+0x120>
  108eea:	8b 9b b4 77 51 00    	mov    0x5177b4(%ebx),%ebx
  108ef0:	8b 14 d3             	mov    (%ebx,%edx,8),%edx
  108ef3:	85 d2                	test   %edx,%edx
  108ef5:	74 19                	je     108f10 <inode_read+0x120>
        return devsw[ip->major].read(ip, dst, n);
  108ef7:	89 44 24 48          	mov    %eax,0x48(%esp)
  108efb:	8b 44 24 0c          	mov    0xc(%esp),%eax
  108eff:	89 4c 24 40          	mov    %ecx,0x40(%esp)
  108f03:	89 44 24 44          	mov    %eax,0x44(%esp)
}
  108f07:	83 c4 2c             	add    $0x2c,%esp
  108f0a:	5b                   	pop    %ebx
  108f0b:	5e                   	pop    %esi
  108f0c:	5f                   	pop    %edi
  108f0d:	5d                   	pop    %ebp
        return devsw[ip->major].read(ip, dst, n);
  108f0e:	ff e2                	jmp    *%edx
            return -1;
  108f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  108f15:	eb c1                	jmp    108ed8 <inode_read+0xe8>
  108f17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  108f1e:	00 
  108f1f:	90                   	nop

00108f20 <inode_write>:

/**
 * Write data to inode.
 */
int inode_write(struct inode *ip, char *src, uint32_t off, uint32_t n)
{
  108f20:	55                   	push   %ebp
  108f21:	57                   	push   %edi
  108f22:	56                   	push   %esi
  108f23:	53                   	push   %ebx
  108f24:	e8 79 74 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  108f29:	81 c3 cb b0 00 00    	add    $0xb0cb,%ebx
  108f2f:	83 ec 2c             	sub    $0x2c,%esp
  108f32:	8b 44 24 44          	mov    0x44(%esp),%eax
  108f36:	8b 4c 24 40          	mov    0x40(%esp),%ecx
  108f3a:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  108f3e:	89 44 24 10          	mov    %eax,0x10(%esp)
  108f42:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    uint32_t tot, m;
    struct buf *bp;

    if (ip->type == T_DEV) {
  108f46:	66 83 79 10 03       	cmpw   $0x3,0x10(%ecx)
{
  108f4b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    if (ip->type == T_DEV) {
  108f4f:	0f 84 d3 00 00 00    	je     109028 <inode_write+0x108>
        if (ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
            return -1;
        return devsw[ip->major].write(ip, src, n);
    }

    if (off > ip->size || off + n < off)
  108f55:	39 69 18             	cmp    %ebp,0x18(%ecx)
  108f58:	0f 82 13 01 00 00    	jb     109071 <inode_write+0x151>
  108f5e:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  108f62:	31 c0                	xor    %eax,%eax
  108f64:	89 fa                	mov    %edi,%edx
  108f66:	01 ea                	add    %ebp,%edx
  108f68:	0f 92 c0             	setb   %al
  108f6b:	89 c6                	mov    %eax,%esi
        return -1;
    if (off + n > MAXFILE * BSIZE)
  108f6d:	81 fa 00 18 01 00    	cmp    $0x11800,%edx
  108f73:	0f 87 f8 00 00 00    	ja     109071 <inode_write+0x151>
  108f79:	85 f6                	test   %esi,%esi
  108f7b:	0f 85 f0 00 00 00    	jne    109071 <inode_write+0x151>
        return -1;

    for (tot = 0; tot < n; tot += m, off += m, src += m) {
  108f81:	85 ff                	test   %edi,%edi
  108f83:	0f 84 90 00 00 00    	je     109019 <inode_write+0xf9>
        bp = bufcache_read(ip->dev, bmap(ip, off / BSIZE));
        m = min(n - tot, BSIZE - off % BSIZE);
  108f89:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
  108f8d:	31 ff                	xor    %edi,%edi
  108f8f:	90                   	nop
        bp = bufcache_read(ip->dev, bmap(ip, off / BSIZE));
  108f90:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  108f94:	89 ea                	mov    %ebp,%edx
  108f96:	c1 ea 09             	shr    $0x9,%edx
  108f99:	89 f0                	mov    %esi,%eax
  108f9b:	e8 f0 f6 ff ff       	call   108690 <bmap>
  108fa0:	83 ec 08             	sub    $0x8,%esp
  108fa3:	50                   	push   %eax
  108fa4:	ff 36                	push   (%esi)
  108fa6:	e8 35 ee ff ff       	call   107de0 <bufcache_read>
        m = min(n - tot, BSIZE - off % BSIZE);
  108fab:	89 e9                	mov    %ebp,%ecx
        bp = bufcache_read(ip->dev, bmap(ip, off / BSIZE));
  108fad:	89 c6                	mov    %eax,%esi
        m = min(n - tot, BSIZE - off % BSIZE);
  108faf:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
  108fb5:	58                   	pop    %eax
  108fb6:	b8 00 02 00 00       	mov    $0x200,%eax
  108fbb:	5a                   	pop    %edx
  108fbc:	29 c8                	sub    %ecx,%eax
  108fbe:	89 4c 24 20          	mov    %ecx,0x20(%esp)
  108fc2:	50                   	push   %eax
  108fc3:	8b 44 24 18          	mov    0x18(%esp),%eax
  108fc7:	29 f8                	sub    %edi,%eax
  108fc9:	50                   	push   %eax
  108fca:	e8 91 c3 ff ff       	call   105360 <min>
        memmove(bp->data + off % BSIZE, src, m);
  108fcf:	83 c4 0c             	add    $0xc,%esp
  108fd2:	50                   	push   %eax
  108fd3:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  108fd7:	ff 74 24 18          	push   0x18(%esp)
  108fdb:	8b 4c 24 24          	mov    0x24(%esp),%ecx
  108fdf:	8d 44 0e 18          	lea    0x18(%esi,%ecx,1),%eax
  108fe3:	50                   	push   %eax
  108fe4:	e8 77 b4 ff ff       	call   104460 <memmove>
        log_write(bp);
  108fe9:	89 34 24             	mov    %esi,(%esp)
  108fec:	e8 9f f2 ff ff       	call   108290 <log_write>
        bufcache_release(bp);
  108ff1:	89 34 24             	mov    %esi,(%esp)
  108ff4:	e8 67 ef ff ff       	call   107f60 <bufcache_release>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
  108ff9:	8b 54 24 24          	mov    0x24(%esp),%edx
  108ffd:	01 54 24 20          	add    %edx,0x20(%esp)
  109001:	83 c4 10             	add    $0x10,%esp
  109004:	8b 44 24 0c          	mov    0xc(%esp),%eax
  109008:	01 d7                	add    %edx,%edi
  10900a:	01 d5                	add    %edx,%ebp
  10900c:	39 c7                	cmp    %eax,%edi
  10900e:	72 80                	jb     108f90 <inode_write+0x70>
    }

    if (n > 0 && off > ip->size) {
  109010:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  109014:	39 69 18             	cmp    %ebp,0x18(%ecx)
  109017:	72 47                	jb     109060 <inode_write+0x140>
        ip->size = off;
        inode_update(ip);
    }
    return n;
  109019:	8b 44 24 0c          	mov    0xc(%esp),%eax
}
  10901d:	83 c4 2c             	add    $0x2c,%esp
  109020:	5b                   	pop    %ebx
  109021:	5e                   	pop    %esi
  109022:	5f                   	pop    %edi
  109023:	5d                   	pop    %ebp
  109024:	c3                   	ret
  109025:	8d 76 00             	lea    0x0(%esi),%esi
        if (ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
  109028:	0f bf 51 12          	movswl 0x12(%ecx),%edx
  10902c:	66 83 fa 09          	cmp    $0x9,%dx
  109030:	77 3f                	ja     109071 <inode_write+0x151>
  109032:	8b 9b b4 77 51 00    	mov    0x5177b4(%ebx),%ebx
  109038:	8b 54 d3 04          	mov    0x4(%ebx,%edx,8),%edx
  10903c:	85 d2                	test   %edx,%edx
  10903e:	74 31                	je     109071 <inode_write+0x151>
        return devsw[ip->major].write(ip, src, n);
  109040:	89 44 24 48          	mov    %eax,0x48(%esp)
  109044:	8b 44 24 10          	mov    0x10(%esp),%eax
  109048:	89 4c 24 40          	mov    %ecx,0x40(%esp)
  10904c:	89 44 24 44          	mov    %eax,0x44(%esp)
}
  109050:	83 c4 2c             	add    $0x2c,%esp
  109053:	5b                   	pop    %ebx
  109054:	5e                   	pop    %esi
  109055:	5f                   	pop    %edi
  109056:	5d                   	pop    %ebp
        return devsw[ip->major].write(ip, src, n);
  109057:	ff e2                	jmp    *%edx
  109059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        inode_update(ip);
  109060:	83 ec 0c             	sub    $0xc,%esp
        ip->size = off;
  109063:	89 69 18             	mov    %ebp,0x18(%ecx)
        inode_update(ip);
  109066:	51                   	push   %ecx
  109067:	e8 54 f7 ff ff       	call   1087c0 <inode_update>
  10906c:	83 c4 10             	add    $0x10,%esp
  10906f:	eb a8                	jmp    109019 <inode_write+0xf9>
            return -1;
  109071:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  109076:	eb a5                	jmp    10901d <inode_write+0xfd>
  109078:	66 90                	xchg   %ax,%ax
  10907a:	66 90                	xchg   %ax,%ax
  10907c:	66 90                	xchg   %ax,%ax
  10907e:	66 90                	xchg   %ax,%ax

00109080 <dir_namecmp>:
#include "dir.h"

// Directories

int dir_namecmp(const char *s, const char *t)
{
  109080:	53                   	push   %ebx
  109081:	e8 1c 73 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  109086:	81 c3 6e af 00 00    	add    $0xaf6e,%ebx
  10908c:	83 ec 0c             	sub    $0xc,%esp
    return strncmp(s, t, DIRSIZ);
  10908f:	6a 0e                	push   $0xe
  109091:	ff 74 24 1c          	push   0x1c(%esp)
  109095:	ff 74 24 1c          	push   0x1c(%esp)
  109099:	e8 42 b4 ff ff       	call   1044e0 <strncmp>
}
  10909e:	83 c4 18             	add    $0x18,%esp
  1090a1:	5b                   	pop    %ebx
  1090a2:	c3                   	ret
  1090a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1090aa:	00 
  1090ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001090b0 <dir_lookup>:
/**
 * Look for a directory entry in a directory.
 * If found, set *poff to byte offset of entry.
 */
struct inode *dir_lookup(struct inode *dp, char *name, uint32_t * poff)
{
  1090b0:	53                   	push   %ebx
  1090b1:	e8 ec 72 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1090b6:	81 c3 3e af 00 00    	add    $0xaf3e,%ebx
  1090bc:	83 ec 08             	sub    $0x8,%esp
    uint32_t off, inum;
    struct dirent de;

    if (dp->type != T_DIR)
  1090bf:	8b 44 24 10          	mov    0x10(%esp),%eax
  1090c3:	66 83 78 10 01       	cmpw   $0x1,0x10(%eax)
  1090c8:	74 1b                	je     1090e5 <dir_lookup+0x35>
        KERN_PANIC("dir_lookup not DIR");
  1090ca:	83 ec 04             	sub    $0x4,%esp
  1090cd:	8d 83 6b 79 ff ff    	lea    -0x8695(%ebx),%eax
  1090d3:	50                   	push   %eax
  1090d4:	8d 83 7e 79 ff ff    	lea    -0x8682(%ebx),%eax
  1090da:	6a 18                	push   $0x18
  1090dc:	50                   	push   %eax
  1090dd:	e8 fe b6 ff ff       	call   1047e0 <debug_panic>
  1090e2:	83 c4 10             	add    $0x10,%esp

    // TODO [Lab 7]

    return 0;
}
  1090e5:	83 c4 08             	add    $0x8,%esp
  1090e8:	31 c0                	xor    %eax,%eax
  1090ea:	5b                   	pop    %ebx
  1090eb:	c3                   	ret
  1090ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001090f0 <dir_link>:
    // TODO [Lab 7]: Check that name is not present.

    // TODO [Lab 7]: Look for an empty dirent.

    return 0;
}
  1090f0:	31 c0                	xor    %eax,%eax
  1090f2:	c3                   	ret
  1090f3:	66 90                	xchg   %ax,%ax
  1090f5:	66 90                	xchg   %ax,%ax
  1090f7:	66 90                	xchg   %ax,%ax
  1090f9:	66 90                	xchg   %ax,%ax
  1090fb:	66 90                	xchg   %ax,%ax
  1090fd:	66 90                	xchg   %ax,%ax
  1090ff:	90                   	nop

00109100 <namei>:

/**
 * Return the inode corresponding to path.
 */
struct inode *namei(char *path)
{
  109100:	53                   	push   %ebx
  109101:	e8 9c 72 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  109106:	81 c3 ee ae 00 00    	add    $0xaeee,%ebx
  10910c:	83 ec 08             	sub    $0x8,%esp
    if (*path == '/') {
  10910f:	8b 44 24 10          	mov    0x10(%esp),%eax
  109113:	80 38 2f             	cmpb   $0x2f,(%eax)
  109116:	74 28                	je     109140 <namei+0x40>
        ip = inode_dup((struct inode *) tcb_get_cwd(get_curid()));
  109118:	e8 43 de ff ff       	call   106f60 <get_curid>
  10911d:	83 ec 0c             	sub    $0xc,%esp
  109120:	50                   	push   %eax
  109121:	e8 da dc ff ff       	call   106e00 <tcb_get_cwd>
  109126:	89 04 24             	mov    %eax,(%esp)
  109129:	e8 12 f9 ff ff       	call   108a40 <inode_dup>
  10912e:	83 c4 10             	add    $0x10,%esp
    char name[DIRSIZ];
    return namex(path, FALSE, name);
}
  109131:	83 c4 08             	add    $0x8,%esp
  109134:	5b                   	pop    %ebx
  109135:	c3                   	ret
  109136:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10913d:	00 
  10913e:	66 90                	xchg   %ax,%ax
        ip = inode_get(ROOTDEV, ROOTINO);
  109140:	83 ec 08             	sub    $0x8,%esp
  109143:	6a 01                	push   $0x1
  109145:	6a 01                	push   $0x1
  109147:	e8 f4 f6 ff ff       	call   108840 <inode_get>
  10914c:	83 c4 10             	add    $0x10,%esp
}
  10914f:	83 c4 08             	add    $0x8,%esp
  109152:	5b                   	pop    %ebx
  109153:	c3                   	ret
  109154:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10915b:	00 
  10915c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00109160 <nameiparent>:
/**
 * Return the inode corresponding to path's parent directory and copy the final
 * element into name.
 */
struct inode *nameiparent(char *path, char *name)
{
  109160:	53                   	push   %ebx
  109161:	e8 3c 72 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  109166:	81 c3 8e ae 00 00    	add    $0xae8e,%ebx
  10916c:	83 ec 08             	sub    $0x8,%esp
    if (*path == '/') {
  10916f:	8b 44 24 10          	mov    0x10(%esp),%eax
  109173:	80 38 2f             	cmpb   $0x2f,(%eax)
  109176:	74 30                	je     1091a8 <nameiparent+0x48>
        ip = inode_dup((struct inode *) tcb_get_cwd(get_curid()));
  109178:	e8 e3 dd ff ff       	call   106f60 <get_curid>
  10917d:	83 ec 0c             	sub    $0xc,%esp
  109180:	50                   	push   %eax
  109181:	e8 7a dc ff ff       	call   106e00 <tcb_get_cwd>
  109186:	89 04 24             	mov    %eax,(%esp)
  109189:	e8 b2 f8 ff ff       	call   108a40 <inode_dup>
  10918e:	83 c4 10             	add    $0x10,%esp
        inode_put(ip);
  109191:	83 ec 0c             	sub    $0xc,%esp
  109194:	50                   	push   %eax
  109195:	e8 76 fa ff ff       	call   108c10 <inode_put>
    return namex(path, TRUE, name);
}
  10919a:	83 c4 18             	add    $0x18,%esp
  10919d:	31 c0                	xor    %eax,%eax
  10919f:	5b                   	pop    %ebx
  1091a0:	c3                   	ret
  1091a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        ip = inode_get(ROOTDEV, ROOTINO);
  1091a8:	83 ec 08             	sub    $0x8,%esp
  1091ab:	6a 01                	push   $0x1
  1091ad:	6a 01                	push   $0x1
  1091af:	e8 8c f6 ff ff       	call   108840 <inode_get>
  1091b4:	83 c4 10             	add    $0x10,%esp
        inode_put(ip);
  1091b7:	83 ec 0c             	sub    $0xc,%esp
  1091ba:	50                   	push   %eax
  1091bb:	e8 50 fa ff ff       	call   108c10 <inode_put>
}
  1091c0:	83 c4 18             	add    $0x18,%esp
  1091c3:	31 c0                	xor    %eax,%eax
  1091c5:	5b                   	pop    %ebx
  1091c6:	c3                   	ret
  1091c7:	66 90                	xchg   %ax,%ax
  1091c9:	66 90                	xchg   %ax,%ax
  1091cb:	66 90                	xchg   %ax,%ax
  1091cd:	66 90                	xchg   %ax,%ax
  1091cf:	90                   	nop

001091d0 <file_init>:
    spinlock_t lock;
    struct file file[NFILE];
} ftable;

void file_init(void)
{
  1091d0:	53                   	push   %ebx
  1091d1:	e8 cc 71 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1091d6:	81 c3 1e ae 00 00    	add    $0xae1e,%ebx
  1091dc:	83 ec 14             	sub    $0x14,%esp
    spinlock_init(&ftable.lock);
  1091df:	8d 83 cc 77 51 00    	lea    0x5177cc(%ebx),%eax
  1091e5:	50                   	push   %eax
  1091e6:	e8 b5 cd ff ff       	call   105fa0 <spinlock_init>
}
  1091eb:	83 c4 18             	add    $0x18,%esp
  1091ee:	5b                   	pop    %ebx
  1091ef:	c3                   	ret

001091f0 <file_alloc>:

/**
 * Allocate a file structure.
 */
struct file *file_alloc(void)
{
  1091f0:	57                   	push   %edi
  1091f1:	56                   	push   %esi
  1091f2:	53                   	push   %ebx
  1091f3:	e8 aa 71 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1091f8:	81 c3 fc ad 00 00    	add    $0xadfc,%ebx
    struct file *f;

    spinlock_acquire(&ftable.lock);
  1091fe:	83 ec 0c             	sub    $0xc,%esp
  109201:	8d bb cc 77 51 00    	lea    0x5177cc(%ebx),%edi
  109207:	57                   	push   %edi
    for (f = ftable.file; f < ftable.file + NFILE; f++) {
  109208:	8d 77 08             	lea    0x8(%edi),%esi
    spinlock_acquire(&ftable.lock);
  10920b:	e8 20 ce ff ff       	call   106030 <spinlock_acquire>
  109210:	83 c4 10             	add    $0x10,%esp
    for (f = ftable.file; f < ftable.file + NFILE; f++) {
  109213:	8d 83 a4 7f 51 00    	lea    0x517fa4(%ebx),%eax
  109219:	eb 0c                	jmp    109227 <file_alloc+0x37>
  10921b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  109220:	83 c6 14             	add    $0x14,%esi
  109223:	39 c6                	cmp    %eax,%esi
  109225:	74 20                	je     109247 <file_alloc+0x57>
        if (f->ref == 0) {
  109227:	8b 56 04             	mov    0x4(%esi),%edx
  10922a:	85 d2                	test   %edx,%edx
  10922c:	75 f2                	jne    109220 <file_alloc+0x30>
            f->ref = 1;
            spinlock_release(&ftable.lock);
  10922e:	83 ec 0c             	sub    $0xc,%esp
            f->ref = 1;
  109231:	c7 46 04 01 00 00 00 	movl   $0x1,0x4(%esi)
            spinlock_release(&ftable.lock);
  109238:	57                   	push   %edi
  109239:	e8 72 ce ff ff       	call   1060b0 <spinlock_release>
            return f;
  10923e:	83 c4 10             	add    $0x10,%esp
        }
    }
    spinlock_release(&ftable.lock);
    return 0;
}
  109241:	89 f0                	mov    %esi,%eax
  109243:	5b                   	pop    %ebx
  109244:	5e                   	pop    %esi
  109245:	5f                   	pop    %edi
  109246:	c3                   	ret
    spinlock_release(&ftable.lock);
  109247:	8d 86 28 f8 ff ff    	lea    -0x7d8(%esi),%eax
  10924d:	83 ec 0c             	sub    $0xc,%esp
    return 0;
  109250:	31 f6                	xor    %esi,%esi
    spinlock_release(&ftable.lock);
  109252:	50                   	push   %eax
  109253:	e8 58 ce ff ff       	call   1060b0 <spinlock_release>
    return 0;
  109258:	83 c4 10             	add    $0x10,%esp
}
  10925b:	89 f0                	mov    %esi,%eax
  10925d:	5b                   	pop    %ebx
  10925e:	5e                   	pop    %esi
  10925f:	5f                   	pop    %edi
  109260:	c3                   	ret
  109261:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109268:	00 
  109269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00109270 <file_dup>:

/**
 * Increment ref count for file f.
 */
struct file *file_dup(struct file *f)
{
  109270:	57                   	push   %edi
  109271:	56                   	push   %esi
  109272:	53                   	push   %ebx
  109273:	8b 74 24 10          	mov    0x10(%esp),%esi
  109277:	e8 26 71 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10927c:	81 c3 78 ad 00 00    	add    $0xad78,%ebx
    spinlock_acquire(&ftable.lock);
  109282:	83 ec 0c             	sub    $0xc,%esp
  109285:	8d bb cc 77 51 00    	lea    0x5177cc(%ebx),%edi
  10928b:	57                   	push   %edi
  10928c:	e8 9f cd ff ff       	call   106030 <spinlock_acquire>
    if (f->ref < 1)
  109291:	8b 46 04             	mov    0x4(%esi),%eax
  109294:	83 c4 10             	add    $0x10,%esp
  109297:	85 c0                	test   %eax,%eax
  109299:	7e 1d                	jle    1092b8 <file_dup+0x48>
        KERN_PANIC("file_dup");
    f->ref++;
  10929b:	83 c0 01             	add    $0x1,%eax
    spinlock_release(&ftable.lock);
  10929e:	83 ec 0c             	sub    $0xc,%esp
    f->ref++;
  1092a1:	89 46 04             	mov    %eax,0x4(%esi)
    spinlock_release(&ftable.lock);
  1092a4:	57                   	push   %edi
  1092a5:	e8 06 ce ff ff       	call   1060b0 <spinlock_release>
    return f;
  1092aa:	83 c4 10             	add    $0x10,%esp
}
  1092ad:	89 f0                	mov    %esi,%eax
  1092af:	5b                   	pop    %ebx
  1092b0:	5e                   	pop    %esi
  1092b1:	5f                   	pop    %edi
  1092b2:	c3                   	ret
  1092b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        KERN_PANIC("file_dup");
  1092b8:	83 ec 04             	sub    $0x4,%esp
  1092bb:	8d 83 8c 79 ff ff    	lea    -0x8674(%ebx),%eax
  1092c1:	50                   	push   %eax
  1092c2:	8d 83 95 79 ff ff    	lea    -0x866b(%ebx),%eax
  1092c8:	6a 31                	push   $0x31
  1092ca:	50                   	push   %eax
  1092cb:	e8 10 b5 ff ff       	call   1047e0 <debug_panic>
    f->ref++;
  1092d0:	8b 46 04             	mov    0x4(%esi),%eax
  1092d3:	83 c4 10             	add    $0x10,%esp
  1092d6:	eb c3                	jmp    10929b <file_dup+0x2b>
  1092d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1092df:	00 

001092e0 <file_close>:

/**
 * Close file f. Decrement ref count, close when reaches 0.
 */
void file_close(struct file *f)
{
  1092e0:	55                   	push   %ebp
  1092e1:	57                   	push   %edi
  1092e2:	56                   	push   %esi
  1092e3:	53                   	push   %ebx
  1092e4:	e8 b9 70 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1092e9:	81 c3 0b ad 00 00    	add    $0xad0b,%ebx
  1092ef:	83 ec 28             	sub    $0x28,%esp
  1092f2:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    struct file ff;

    spinlock_acquire(&ftable.lock);
  1092f6:	8d ab cc 77 51 00    	lea    0x5177cc(%ebx),%ebp
  1092fc:	55                   	push   %ebp
  1092fd:	e8 2e cd ff ff       	call   106030 <spinlock_acquire>
    if (f->ref < 1)
  109302:	8b 46 04             	mov    0x4(%esi),%eax
  109305:	83 c4 10             	add    $0x10,%esp
  109308:	85 c0                	test   %eax,%eax
  10930a:	7e 54                	jle    109360 <file_close+0x80>
        KERN_PANIC("file_close");
    if (--f->ref > 0) {
  10930c:	83 e8 01             	sub    $0x1,%eax
  10930f:	89 46 04             	mov    %eax,0x4(%esi)
  109312:	85 c0                	test   %eax,%eax
  109314:	7f 32                	jg     109348 <file_close+0x68>
        spinlock_release(&ftable.lock);
        return;
    }
    ff = *f;
  109316:	8b 46 0c             	mov    0xc(%esi),%eax
    f->ref = 0;
    f->type = FD_NONE;
    spinlock_release(&ftable.lock);
  109319:	83 ec 0c             	sub    $0xc,%esp
    ff = *f;
  10931c:	8b 3e                	mov    (%esi),%edi
    f->ref = 0;
  10931e:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
    f->type = FD_NONE;
  109325:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    ff = *f;
  10932b:	89 44 24 18          	mov    %eax,0x18(%esp)
    spinlock_release(&ftable.lock);
  10932f:	55                   	push   %ebp
  109330:	e8 7b cd ff ff       	call   1060b0 <spinlock_release>

    if (ff.type == FD_INODE) {
  109335:	83 c4 10             	add    $0x10,%esp
  109338:	83 ff 02             	cmp    $0x2,%edi
  10933b:	74 43                	je     109380 <file_close+0xa0>
        begin_trans();
        inode_put(ff.ip);
        commit_trans();
    }
}
  10933d:	83 c4 1c             	add    $0x1c,%esp
  109340:	5b                   	pop    %ebx
  109341:	5e                   	pop    %esi
  109342:	5f                   	pop    %edi
  109343:	5d                   	pop    %ebp
  109344:	c3                   	ret
  109345:	8d 76 00             	lea    0x0(%esi),%esi
        spinlock_release(&ftable.lock);
  109348:	83 ec 0c             	sub    $0xc,%esp
  10934b:	55                   	push   %ebp
  10934c:	e8 5f cd ff ff       	call   1060b0 <spinlock_release>
  109351:	83 c4 10             	add    $0x10,%esp
}
  109354:	83 c4 1c             	add    $0x1c,%esp
  109357:	5b                   	pop    %ebx
  109358:	5e                   	pop    %esi
  109359:	5f                   	pop    %edi
  10935a:	5d                   	pop    %ebp
  10935b:	c3                   	ret
  10935c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        KERN_PANIC("file_close");
  109360:	83 ec 04             	sub    $0x4,%esp
  109363:	8d 83 a4 79 ff ff    	lea    -0x865c(%ebx),%eax
  109369:	50                   	push   %eax
  10936a:	8d 83 95 79 ff ff    	lea    -0x866b(%ebx),%eax
  109370:	6a 40                	push   $0x40
  109372:	50                   	push   %eax
  109373:	e8 68 b4 ff ff       	call   1047e0 <debug_panic>
    if (--f->ref > 0) {
  109378:	8b 46 04             	mov    0x4(%esi),%eax
  10937b:	83 c4 10             	add    $0x10,%esp
  10937e:	eb 8c                	jmp    10930c <file_close+0x2c>
        begin_trans();
  109380:	e8 3b ee ff ff       	call   1081c0 <begin_trans>
        inode_put(ff.ip);
  109385:	83 ec 0c             	sub    $0xc,%esp
  109388:	ff 74 24 18          	push   0x18(%esp)
  10938c:	e8 7f f8 ff ff       	call   108c10 <inode_put>
        commit_trans();
  109391:	e8 8a ee ff ff       	call   108220 <commit_trans>
  109396:	83 c4 10             	add    $0x10,%esp
}
  109399:	83 c4 1c             	add    $0x1c,%esp
  10939c:	5b                   	pop    %ebx
  10939d:	5e                   	pop    %esi
  10939e:	5f                   	pop    %edi
  10939f:	5d                   	pop    %ebp
  1093a0:	c3                   	ret
  1093a1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1093a8:	00 
  1093a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001093b0 <file_stat>:

/**
 * Get metadata about file f.
 */
int file_stat(struct file *f, struct file_stat *st)
{
  1093b0:	56                   	push   %esi
  1093b1:	53                   	push   %ebx
  1093b2:	e8 eb 6f ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1093b7:	81 c3 3d ac 00 00    	add    $0xac3d,%ebx
  1093bd:	83 ec 04             	sub    $0x4,%esp
  1093c0:	8b 74 24 10          	mov    0x10(%esp),%esi
    if (f->type == FD_INODE) {
  1093c4:	83 3e 02             	cmpl   $0x2,(%esi)
  1093c7:	75 37                	jne    109400 <file_stat+0x50>
        inode_lock(f->ip);
  1093c9:	83 ec 0c             	sub    $0xc,%esp
  1093cc:	ff 76 0c             	push   0xc(%esi)
  1093cf:	e8 ac f6 ff ff       	call   108a80 <inode_lock>
        inode_stat(f->ip, st);
  1093d4:	58                   	pop    %eax
  1093d5:	5a                   	pop    %edx
  1093d6:	ff 74 24 1c          	push   0x1c(%esp)
  1093da:	ff 76 0c             	push   0xc(%esi)
  1093dd:	e8 de f9 ff ff       	call   108dc0 <inode_stat>
        inode_unlock(f->ip);
  1093e2:	59                   	pop    %ecx
  1093e3:	ff 76 0c             	push   0xc(%esi)
  1093e6:	e8 a5 f7 ff ff       	call   108b90 <inode_unlock>
        return 0;
  1093eb:	83 c4 10             	add    $0x10,%esp
  1093ee:	31 c0                	xor    %eax,%eax
    }
    return -1;
}
  1093f0:	83 c4 04             	add    $0x4,%esp
  1093f3:	5b                   	pop    %ebx
  1093f4:	5e                   	pop    %esi
  1093f5:	c3                   	ret
  1093f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1093fd:	00 
  1093fe:	66 90                	xchg   %ax,%ax
  109400:	83 c4 04             	add    $0x4,%esp
    return -1;
  109403:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
  109408:	5b                   	pop    %ebx
  109409:	5e                   	pop    %esi
  10940a:	c3                   	ret
  10940b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00109410 <file_read>:

/**
 * Read from file f.
 */
int file_read(struct file *f, char *addr, int n)
{
  109410:	57                   	push   %edi
  109411:	56                   	push   %esi
  109412:	53                   	push   %ebx
  109413:	8b 74 24 10          	mov    0x10(%esp),%esi
  109417:	e8 86 6f ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  10941c:	81 c3 d8 ab 00 00    	add    $0xabd8,%ebx
    int r;

    if (f->readable == 0)
  109422:	80 7e 08 00          	cmpb   $0x0,0x8(%esi)
  109426:	74 63                	je     10948b <file_read+0x7b>
        return -1;
    if (f->type == FD_INODE) {
  109428:	83 3e 02             	cmpl   $0x2,(%esi)
  10942b:	75 43                	jne    109470 <file_read+0x60>
        inode_lock(f->ip);
  10942d:	83 ec 0c             	sub    $0xc,%esp
  109430:	ff 76 0c             	push   0xc(%esi)
  109433:	e8 48 f6 ff ff       	call   108a80 <inode_lock>
        if ((r = inode_read(f->ip, addr, f->off, n)) > 0)
  109438:	ff 74 24 28          	push   0x28(%esp)
  10943c:	ff 76 10             	push   0x10(%esi)
  10943f:	ff 74 24 2c          	push   0x2c(%esp)
  109443:	ff 76 0c             	push   0xc(%esi)
  109446:	e8 a5 f9 ff ff       	call   108df0 <inode_read>
  10944b:	83 c4 20             	add    $0x20,%esp
  10944e:	89 c7                	mov    %eax,%edi
  109450:	85 c0                	test   %eax,%eax
  109452:	7e 03                	jle    109457 <file_read+0x47>
            f->off += r;
  109454:	01 46 10             	add    %eax,0x10(%esi)
        inode_unlock(f->ip);
  109457:	83 ec 0c             	sub    $0xc,%esp
  10945a:	ff 76 0c             	push   0xc(%esi)
  10945d:	e8 2e f7 ff ff       	call   108b90 <inode_unlock>
        return r;
  109462:	83 c4 10             	add    $0x10,%esp
    }
    KERN_PANIC("file_read");
    return -1;
}
  109465:	89 f8                	mov    %edi,%eax
  109467:	5b                   	pop    %ebx
  109468:	5e                   	pop    %esi
  109469:	5f                   	pop    %edi
  10946a:	c3                   	ret
  10946b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    KERN_PANIC("file_read");
  109470:	83 ec 04             	sub    $0x4,%esp
  109473:	8d 83 af 79 ff ff    	lea    -0x8651(%ebx),%eax
  109479:	50                   	push   %eax
  10947a:	8d 83 95 79 ff ff    	lea    -0x866b(%ebx),%eax
  109480:	6a 6f                	push   $0x6f
  109482:	50                   	push   %eax
  109483:	e8 58 b3 ff ff       	call   1047e0 <debug_panic>
    return -1;
  109488:	83 c4 10             	add    $0x10,%esp
        return -1;
  10948b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  109490:	eb d3                	jmp    109465 <file_read+0x55>
  109492:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109499:	00 
  10949a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001094a0 <file_write>:

/**
 * Write to file f.
 */
int file_write(struct file *f, char *addr, int n)
{
  1094a0:	55                   	push   %ebp
  1094a1:	57                   	push   %edi
  1094a2:	56                   	push   %esi
  1094a3:	53                   	push   %ebx
  1094a4:	e8 f9 6e ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1094a9:	81 c3 4b ab 00 00    	add    $0xab4b,%ebx
  1094af:	83 ec 1c             	sub    $0x1c,%esp
  1094b2:	8b 7c 24 30          	mov    0x30(%esp),%edi
    int r;

    if (f->writable == 0)
  1094b6:	80 7f 09 00          	cmpb   $0x0,0x9(%edi)
  1094ba:	0f 84 ee 00 00 00    	je     1095ae <file_write+0x10e>
        return -1;
    if (f->type == FD_INODE) {
  1094c0:	83 3f 02             	cmpl   $0x2,(%edi)
  1094c3:	0f 85 f4 00 00 00    	jne    1095bd <file_write+0x11d>
        // and 2 blocks of slop for non-aligned writes.
        // this really belongs lower down, since inode_write()
        // might be writing a device like the console.
        int max = ((LOGSIZE - 1 - 1 - 2) / 2) * 512;
        int i = 0;
        while (i < n) {
  1094c9:	8b 44 24 38          	mov    0x38(%esp),%eax
        int i = 0;
  1094cd:	31 ed                	xor    %ebp,%ebp
        while (i < n) {
  1094cf:	85 c0                	test   %eax,%eax
  1094d1:	0f 8e d1 00 00 00    	jle    1095a8 <file_write+0x108>
            commit_trans();

            if (r < 0)
                break;
            if (r != n1)
                KERN_PANIC("short file_write");
  1094d7:	8d 83 b9 79 ff ff    	lea    -0x8647(%ebx),%eax
  1094dd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1094e1:	8d 83 95 79 ff ff    	lea    -0x866b(%ebx),%eax
  1094e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1094eb:	eb 31                	jmp    10951e <file_write+0x7e>
  1094ed:	8d 76 00             	lea    0x0(%esi),%esi
                f->off += r;
  1094f0:	01 47 10             	add    %eax,0x10(%edi)
            inode_unlock(f->ip);
  1094f3:	83 ec 0c             	sub    $0xc,%esp
                f->off += r;
  1094f6:	89 44 24 10          	mov    %eax,0x10(%esp)
            inode_unlock(f->ip);
  1094fa:	ff 77 0c             	push   0xc(%edi)
  1094fd:	e8 8e f6 ff ff       	call   108b90 <inode_unlock>
            commit_trans();
  109502:	e8 19 ed ff ff       	call   108220 <commit_trans>
            if (r != n1)
  109507:	8b 44 24 14          	mov    0x14(%esp),%eax
  10950b:	83 c4 10             	add    $0x10,%esp
  10950e:	39 c6                	cmp    %eax,%esi
  109510:	75 65                	jne    109577 <file_write+0xd7>
            i += r;
  109512:	01 c5                	add    %eax,%ebp
        while (i < n) {
  109514:	39 6c 24 38          	cmp    %ebp,0x38(%esp)
  109518:	0f 8e 8a 00 00 00    	jle    1095a8 <file_write+0x108>
            int n1 = n - i;
  10951e:	8b 74 24 38          	mov    0x38(%esp),%esi
            if (n1 > max)
  109522:	b8 00 06 00 00       	mov    $0x600,%eax
            int n1 = n - i;
  109527:	29 ee                	sub    %ebp,%esi
            if (n1 > max)
  109529:	39 c6                	cmp    %eax,%esi
  10952b:	0f 4f f0             	cmovg  %eax,%esi
            begin_trans();
  10952e:	e8 8d ec ff ff       	call   1081c0 <begin_trans>
            inode_lock(f->ip);
  109533:	83 ec 0c             	sub    $0xc,%esp
  109536:	ff 77 0c             	push   0xc(%edi)
  109539:	e8 42 f5 ff ff       	call   108a80 <inode_lock>
            if ((r = inode_write(f->ip, addr + i, f->off, n1)) > 0)
  10953e:	56                   	push   %esi
  10953f:	ff 77 10             	push   0x10(%edi)
  109542:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  109546:	01 e8                	add    %ebp,%eax
  109548:	50                   	push   %eax
  109549:	ff 77 0c             	push   0xc(%edi)
  10954c:	e8 cf f9 ff ff       	call   108f20 <inode_write>
  109551:	83 c4 20             	add    $0x20,%esp
  109554:	85 c0                	test   %eax,%eax
  109556:	7f 98                	jg     1094f0 <file_write+0x50>
  109558:	89 44 24 04          	mov    %eax,0x4(%esp)
            inode_unlock(f->ip);
  10955c:	83 ec 0c             	sub    $0xc,%esp
  10955f:	ff 77 0c             	push   0xc(%edi)
  109562:	e8 29 f6 ff ff       	call   108b90 <inode_unlock>
            commit_trans();
  109567:	e8 b4 ec ff ff       	call   108220 <commit_trans>
            if (r < 0)
  10956c:	8b 44 24 14          	mov    0x14(%esp),%eax
  109570:	83 c4 10             	add    $0x10,%esp
  109573:	85 c0                	test   %eax,%eax
  109575:	75 31                	jne    1095a8 <file_write+0x108>
  109577:	89 44 24 04          	mov    %eax,0x4(%esp)
                KERN_PANIC("short file_write");
  10957b:	83 ec 04             	sub    $0x4,%esp
  10957e:	ff 74 24 0c          	push   0xc(%esp)
  109582:	68 94 00 00 00       	push   $0x94
  109587:	ff 74 24 18          	push   0x18(%esp)
  10958b:	e8 50 b2 ff ff       	call   1047e0 <debug_panic>
  109590:	8b 44 24 14          	mov    0x14(%esp),%eax
  109594:	83 c4 10             	add    $0x10,%esp
            i += r;
  109597:	01 c5                	add    %eax,%ebp
        while (i < n) {
  109599:	39 6c 24 38          	cmp    %ebp,0x38(%esp)
  10959d:	0f 8f 7b ff ff ff    	jg     10951e <file_write+0x7e>
  1095a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        }
        return i == n ? n : -1;
  1095a8:	39 6c 24 38          	cmp    %ebp,0x38(%esp)
  1095ac:	74 05                	je     1095b3 <file_write+0x113>
        return -1;
  1095ae:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
    }
    KERN_PANIC("file_write");
    return -1;
}
  1095b3:	83 c4 1c             	add    $0x1c,%esp
  1095b6:	89 e8                	mov    %ebp,%eax
  1095b8:	5b                   	pop    %ebx
  1095b9:	5e                   	pop    %esi
  1095ba:	5f                   	pop    %edi
  1095bb:	5d                   	pop    %ebp
  1095bc:	c3                   	ret
    KERN_PANIC("file_write");
  1095bd:	83 ec 04             	sub    $0x4,%esp
  1095c0:	8d 83 bf 79 ff ff    	lea    -0x8641(%ebx),%eax
  1095c6:	50                   	push   %eax
  1095c7:	8d 83 95 79 ff ff    	lea    -0x866b(%ebx),%eax
  1095cd:	68 99 00 00 00       	push   $0x99
  1095d2:	50                   	push   %eax
  1095d3:	e8 08 b2 ff ff       	call   1047e0 <debug_panic>
    return -1;
  1095d8:	83 c4 10             	add    $0x10,%esp
  1095db:	eb d1                	jmp    1095ae <file_write+0x10e>
  1095dd:	66 90                	xchg   %ax,%ax
  1095df:	90                   	nop

001095e0 <create.constprop.0>:
    commit_trans();
    syscall_set_errno(tf, E_DISK_OP);
    return;
}

static struct inode *create(char *path, short type, short major, short minor)
  1095e0:	55                   	push   %ebp
  1095e1:	57                   	push   %edi
  1095e2:	56                   	push   %esi
  1095e3:	53                   	push   %ebx
  1095e4:	e8 b9 6d ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1095e9:	81 c3 0b aa 00 00    	add    $0xaa0b,%ebx
  1095ef:	83 ec 44             	sub    $0x44,%esp
{
    uint32_t off;
    struct inode *ip, *dp;
    char name[DIRSIZ];

    if ((dp = nameiparent(path, name)) == 0)
  1095f2:	8d 6c 24 2a          	lea    0x2a(%esp),%ebp
static struct inode *create(char *path, short type, short major, short minor)
  1095f6:	89 54 24 14          	mov    %edx,0x14(%esp)
    if ((dp = nameiparent(path, name)) == 0)
  1095fa:	55                   	push   %ebp
  1095fb:	50                   	push   %eax
  1095fc:	e8 5f fb ff ff       	call   109160 <nameiparent>
  109601:	83 c4 10             	add    $0x10,%esp
  109604:	85 c0                	test   %eax,%eax
  109606:	74 64                	je     10966c <create.constprop.0+0x8c>
        return 0;
    inode_lock(dp);
  109608:	83 ec 0c             	sub    $0xc,%esp
  10960b:	89 c6                	mov    %eax,%esi
  10960d:	50                   	push   %eax
  10960e:	e8 6d f4 ff ff       	call   108a80 <inode_lock>

    if ((ip = dir_lookup(dp, name, &off)) != 0) {
  109613:	83 c4 0c             	add    $0xc,%esp
  109616:	8d 44 24 20          	lea    0x20(%esp),%eax
  10961a:	50                   	push   %eax
  10961b:	55                   	push   %ebp
  10961c:	56                   	push   %esi
  10961d:	e8 8e fa ff ff       	call   1090b0 <dir_lookup>
  109622:	83 c4 10             	add    $0x10,%esp
  109625:	89 c7                	mov    %eax,%edi
  109627:	85 c0                	test   %eax,%eax
  109629:	74 55                	je     109680 <create.constprop.0+0xa0>
        inode_unlockput(dp);
  10962b:	83 ec 0c             	sub    $0xc,%esp
  10962e:	56                   	push   %esi
  10962f:	e8 6c f7 ff ff       	call   108da0 <inode_unlockput>
        inode_lock(ip);
  109634:	89 3c 24             	mov    %edi,(%esp)
  109637:	e8 44 f4 ff ff       	call   108a80 <inode_lock>
        if (type == T_FILE && ip->type == T_FILE)
  10963c:	83 c4 10             	add    $0x10,%esp
  10963f:	66 83 7c 24 0c 02    	cmpw   $0x2,0xc(%esp)
  109645:	75 19                	jne    109660 <create.constprop.0+0x80>
  109647:	66 83 7f 10 02       	cmpw   $0x2,0x10(%edi)
  10964c:	75 12                	jne    109660 <create.constprop.0+0x80>
    if (dir_link(dp, name, ip->inum) < 0)
        KERN_PANIC("create: dir_link");

    inode_unlockput(dp);
    return ip;
}
  10964e:	83 c4 3c             	add    $0x3c,%esp
  109651:	89 f8                	mov    %edi,%eax
  109653:	5b                   	pop    %ebx
  109654:	5e                   	pop    %esi
  109655:	5f                   	pop    %edi
  109656:	5d                   	pop    %ebp
  109657:	c3                   	ret
  109658:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10965f:	00 
        inode_unlockput(ip);
  109660:	83 ec 0c             	sub    $0xc,%esp
  109663:	57                   	push   %edi
  109664:	e8 37 f7 ff ff       	call   108da0 <inode_unlockput>
        return 0;
  109669:	83 c4 10             	add    $0x10,%esp
}
  10966c:	83 c4 3c             	add    $0x3c,%esp
        return 0;
  10966f:	31 ff                	xor    %edi,%edi
}
  109671:	5b                   	pop    %ebx
  109672:	89 f8                	mov    %edi,%eax
  109674:	5e                   	pop    %esi
  109675:	5f                   	pop    %edi
  109676:	5d                   	pop    %ebp
  109677:	c3                   	ret
  109678:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10967f:	00 
    if ((ip = inode_alloc(dp->dev, type)) == 0)
  109680:	83 ec 08             	sub    $0x8,%esp
  109683:	0f bf 44 24 14       	movswl 0x14(%esp),%eax
  109688:	50                   	push   %eax
  109689:	ff 36                	push   (%esi)
  10968b:	e8 c0 f2 ff ff       	call   108950 <inode_alloc>
  109690:	83 c4 10             	add    $0x10,%esp
  109693:	89 c7                	mov    %eax,%edi
  109695:	85 c0                	test   %eax,%eax
  109697:	0f 84 e3 00 00 00    	je     109780 <create.constprop.0+0x1a0>
    inode_lock(ip);
  10969d:	83 ec 0c             	sub    $0xc,%esp
  1096a0:	57                   	push   %edi
  1096a1:	e8 da f3 ff ff       	call   108a80 <inode_lock>
    ip->major = major;
  1096a6:	31 c0                	xor    %eax,%eax
    ip->minor = minor;
  1096a8:	c7 47 14 00 00 01 00 	movl   $0x10000,0x14(%edi)
    ip->major = major;
  1096af:	66 89 47 12          	mov    %ax,0x12(%edi)
    inode_update(ip);
  1096b3:	89 3c 24             	mov    %edi,(%esp)
  1096b6:	e8 05 f1 ff ff       	call   1087c0 <inode_update>
    if (type == T_DIR) {  // Create . and .. entries.
  1096bb:	83 c4 10             	add    $0x10,%esp
  1096be:	66 83 7c 24 0c 01    	cmpw   $0x1,0xc(%esp)
  1096c4:	74 4a                	je     109710 <create.constprop.0+0x130>
    if (dir_link(dp, name, ip->inum) < 0)
  1096c6:	83 ec 04             	sub    $0x4,%esp
  1096c9:	ff 77 04             	push   0x4(%edi)
  1096cc:	55                   	push   %ebp
  1096cd:	56                   	push   %esi
  1096ce:	e8 1d fa ff ff       	call   1090f0 <dir_link>
  1096d3:	83 c4 10             	add    $0x10,%esp
  1096d6:	85 c0                	test   %eax,%eax
  1096d8:	78 16                	js     1096f0 <create.constprop.0+0x110>
    inode_unlockput(dp);
  1096da:	83 ec 0c             	sub    $0xc,%esp
  1096dd:	56                   	push   %esi
  1096de:	e8 bd f6 ff ff       	call   108da0 <inode_unlockput>
    return ip;
  1096e3:	83 c4 10             	add    $0x10,%esp
}
  1096e6:	89 f8                	mov    %edi,%eax
  1096e8:	83 c4 3c             	add    $0x3c,%esp
  1096eb:	5b                   	pop    %ebx
  1096ec:	5e                   	pop    %esi
  1096ed:	5f                   	pop    %edi
  1096ee:	5d                   	pop    %ebp
  1096ef:	c3                   	ret
        KERN_PANIC("create: dir_link");
  1096f0:	83 ec 04             	sub    $0x4,%esp
  1096f3:	8d 83 fa 79 ff ff    	lea    -0x8606(%ebx),%eax
  1096f9:	50                   	push   %eax
  1096fa:	8d 83 d9 79 ff ff    	lea    -0x8627(%ebx),%eax
  109700:	68 f7 00 00 00       	push   $0xf7
  109705:	50                   	push   %eax
  109706:	e8 d5 b0 ff ff       	call   1047e0 <debug_panic>
  10970b:	83 c4 10             	add    $0x10,%esp
  10970e:	eb ca                	jmp    1096da <create.constprop.0+0xfa>
        inode_update(dp);
  109710:	83 ec 0c             	sub    $0xc,%esp
        dp->nlink++;      // for ".."
  109713:	66 83 46 16 01       	addw   $0x1,0x16(%esi)
        inode_update(dp);
  109718:	56                   	push   %esi
  109719:	e8 a2 f0 ff ff       	call   1087c0 <inode_update>
        if (dir_link(ip, ".", ip->inum) < 0
  10971e:	83 c4 0c             	add    $0xc,%esp
  109721:	8d 83 f8 79 ff ff    	lea    -0x8608(%ebx),%eax
  109727:	ff 77 04             	push   0x4(%edi)
  10972a:	50                   	push   %eax
  10972b:	57                   	push   %edi
  10972c:	e8 bf f9 ff ff       	call   1090f0 <dir_link>
  109731:	83 c4 10             	add    $0x10,%esp
  109734:	85 c0                	test   %eax,%eax
  109736:	78 1e                	js     109756 <create.constprop.0+0x176>
            || dir_link(ip, "..", dp->inum) < 0)
  109738:	83 ec 04             	sub    $0x4,%esp
  10973b:	8d 83 f7 79 ff ff    	lea    -0x8609(%ebx),%eax
  109741:	ff 76 04             	push   0x4(%esi)
  109744:	50                   	push   %eax
  109745:	57                   	push   %edi
  109746:	e8 a5 f9 ff ff       	call   1090f0 <dir_link>
  10974b:	83 c4 10             	add    $0x10,%esp
  10974e:	85 c0                	test   %eax,%eax
  109750:	0f 89 70 ff ff ff    	jns    1096c6 <create.constprop.0+0xe6>
            KERN_PANIC("create dots");
  109756:	83 ec 04             	sub    $0x4,%esp
  109759:	8d 83 eb 79 ff ff    	lea    -0x8615(%ebx),%eax
  10975f:	50                   	push   %eax
  109760:	8d 83 d9 79 ff ff    	lea    -0x8627(%ebx),%eax
  109766:	68 f3 00 00 00       	push   $0xf3
  10976b:	50                   	push   %eax
  10976c:	e8 6f b0 ff ff       	call   1047e0 <debug_panic>
  109771:	83 c4 10             	add    $0x10,%esp
  109774:	e9 4d ff ff ff       	jmp    1096c6 <create.constprop.0+0xe6>
  109779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        KERN_PANIC("create: ialloc");
  109780:	83 ec 04             	sub    $0x4,%esp
  109783:	8d 83 ca 79 ff ff    	lea    -0x8636(%ebx),%eax
  109789:	50                   	push   %eax
  10978a:	8d 83 d9 79 ff ff    	lea    -0x8627(%ebx),%eax
  109790:	68 e5 00 00 00       	push   $0xe5
  109795:	50                   	push   %eax
  109796:	e8 45 b0 ff ff       	call   1047e0 <debug_panic>
  10979b:	83 c4 10             	add    $0x10,%esp
  10979e:	e9 fa fe ff ff       	jmp    10969d <create.constprop.0+0xbd>
  1097a3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1097aa:	00 
  1097ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001097b0 <sys_read>:
}
  1097b0:	c3                   	ret
  1097b1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1097b8:	00 
  1097b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001097c0 <sys_write>:
void sys_write(tf_t *tf)
  1097c0:	c3                   	ret
  1097c1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1097c8:	00 
  1097c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001097d0 <sys_close>:
void sys_close(tf_t *tf)
  1097d0:	c3                   	ret
  1097d1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1097d8:	00 
  1097d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001097e0 <sys_fstat>:
void sys_fstat(tf_t *tf)
  1097e0:	c3                   	ret
  1097e1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1097e8:	00 
  1097e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001097f0 <sys_link>:
{
  1097f0:	55                   	push   %ebp
  1097f1:	57                   	push   %edi
  1097f2:	56                   	push   %esi
  1097f3:	53                   	push   %ebx
  1097f4:	e8 a9 6b ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  1097f9:	81 c3 fb a7 00 00    	add    $0xa7fb,%ebx
  1097ff:	81 ec 28 01 00 00    	sub    $0x128,%esp
    pt_copyin(get_curid(), syscall_get_arg2(tf), old, 128);
  109805:	ff b4 24 3c 01 00 00 	push   0x13c(%esp)
  10980c:	e8 4f da ff ff       	call   107260 <syscall_get_arg2>
  109811:	89 c6                	mov    %eax,%esi
  109813:	e8 48 d7 ff ff       	call   106f60 <get_curid>
  109818:	68 80 00 00 00       	push   $0x80
  10981d:	8d bc 24 a4 00 00 00 	lea    0xa4(%esp),%edi
  109824:	57                   	push   %edi
  109825:	56                   	push   %esi
  109826:	50                   	push   %eax
  109827:	e8 e4 c1 ff ff       	call   105a10 <pt_copyin>
    pt_copyin(get_curid(), syscall_get_arg3(tf), new, 128);
  10982c:	83 c4 14             	add    $0x14,%esp
  10982f:	ff b4 24 3c 01 00 00 	push   0x13c(%esp)
  109836:	e8 35 da ff ff       	call   107270 <syscall_get_arg3>
  10983b:	89 c6                	mov    %eax,%esi
  10983d:	e8 1e d7 ff ff       	call   106f60 <get_curid>
  109842:	68 80 00 00 00       	push   $0x80
  109847:	8d 6c 24 24          	lea    0x24(%esp),%ebp
  10984b:	55                   	push   %ebp
  10984c:	56                   	push   %esi
  10984d:	50                   	push   %eax
  10984e:	e8 bd c1 ff ff       	call   105a10 <pt_copyin>
    if ((ip = namei(old)) == 0) {
  109853:	83 c4 14             	add    $0x14,%esp
  109856:	57                   	push   %edi
  109857:	e8 a4 f8 ff ff       	call   109100 <namei>
  10985c:	83 c4 10             	add    $0x10,%esp
  10985f:	85 c0                	test   %eax,%eax
  109861:	0f 84 f9 00 00 00    	je     109960 <sys_link+0x170>
  109867:	89 c6                	mov    %eax,%esi
    begin_trans();
  109869:	e8 52 e9 ff ff       	call   1081c0 <begin_trans>
    inode_lock(ip);
  10986e:	83 ec 0c             	sub    $0xc,%esp
  109871:	56                   	push   %esi
  109872:	e8 09 f2 ff ff       	call   108a80 <inode_lock>
    if (ip->type == T_DIR) {
  109877:	83 c4 10             	add    $0x10,%esp
  10987a:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
  10987f:	0f 84 fb 00 00 00    	je     109980 <sys_link+0x190>
    inode_update(ip);
  109885:	83 ec 0c             	sub    $0xc,%esp
    ip->nlink++;
  109888:	66 83 46 16 01       	addw   $0x1,0x16(%esi)
    inode_update(ip);
  10988d:	56                   	push   %esi
  10988e:	e8 2d ef ff ff       	call   1087c0 <inode_update>
    inode_unlock(ip);
  109893:	89 34 24             	mov    %esi,(%esp)
  109896:	e8 f5 f2 ff ff       	call   108b90 <inode_unlock>
    if ((dp = nameiparent(new, name)) == 0)
  10989b:	5f                   	pop    %edi
  10989c:	58                   	pop    %eax
  10989d:	8d 44 24 0a          	lea    0xa(%esp),%eax
  1098a1:	50                   	push   %eax
  1098a2:	89 c7                	mov    %eax,%edi
  1098a4:	55                   	push   %ebp
  1098a5:	e8 b6 f8 ff ff       	call   109160 <nameiparent>
  1098aa:	83 c4 10             	add    $0x10,%esp
  1098ad:	89 c5                	mov    %eax,%ebp
  1098af:	85 c0                	test   %eax,%eax
  1098b1:	74 69                	je     10991c <sys_link+0x12c>
    inode_lock(dp);
  1098b3:	83 ec 0c             	sub    $0xc,%esp
  1098b6:	50                   	push   %eax
  1098b7:	e8 c4 f1 ff ff       	call   108a80 <inode_lock>
    if (dp->dev != ip->dev || dir_link(dp, name, ip->inum) < 0) {
  1098bc:	8b 06                	mov    (%esi),%eax
  1098be:	83 c4 10             	add    $0x10,%esp
  1098c1:	39 45 00             	cmp    %eax,0x0(%ebp)
  1098c4:	75 4a                	jne    109910 <sys_link+0x120>
  1098c6:	83 ec 04             	sub    $0x4,%esp
  1098c9:	ff 76 04             	push   0x4(%esi)
  1098cc:	57                   	push   %edi
  1098cd:	55                   	push   %ebp
  1098ce:	e8 1d f8 ff ff       	call   1090f0 <dir_link>
  1098d3:	83 c4 10             	add    $0x10,%esp
  1098d6:	85 c0                	test   %eax,%eax
  1098d8:	78 36                	js     109910 <sys_link+0x120>
    inode_unlockput(dp);
  1098da:	83 ec 0c             	sub    $0xc,%esp
  1098dd:	55                   	push   %ebp
  1098de:	e8 bd f4 ff ff       	call   108da0 <inode_unlockput>
    inode_put(ip);
  1098e3:	89 34 24             	mov    %esi,(%esp)
  1098e6:	e8 25 f3 ff ff       	call   108c10 <inode_put>
    commit_trans();
  1098eb:	e8 30 e9 ff ff       	call   108220 <commit_trans>
    syscall_set_errno(tf, E_SUCC);
  1098f0:	59                   	pop    %ecx
  1098f1:	5e                   	pop    %esi
  1098f2:	6a 00                	push   $0x0
  1098f4:	ff b4 24 3c 01 00 00 	push   0x13c(%esp)
  1098fb:	e8 b0 d9 ff ff       	call   1072b0 <syscall_set_errno>
    return;
  109900:	83 c4 10             	add    $0x10,%esp
}
  109903:	81 c4 1c 01 00 00    	add    $0x11c,%esp
  109909:	5b                   	pop    %ebx
  10990a:	5e                   	pop    %esi
  10990b:	5f                   	pop    %edi
  10990c:	5d                   	pop    %ebp
  10990d:	c3                   	ret
  10990e:	66 90                	xchg   %ax,%ax
        inode_unlockput(dp);
  109910:	83 ec 0c             	sub    $0xc,%esp
  109913:	55                   	push   %ebp
  109914:	e8 87 f4 ff ff       	call   108da0 <inode_unlockput>
        goto bad;
  109919:	83 c4 10             	add    $0x10,%esp
    inode_lock(ip);
  10991c:	83 ec 0c             	sub    $0xc,%esp
  10991f:	56                   	push   %esi
  109920:	e8 5b f1 ff ff       	call   108a80 <inode_lock>
    ip->nlink--;
  109925:	66 83 6e 16 01       	subw   $0x1,0x16(%esi)
    inode_update(ip);
  10992a:	89 34 24             	mov    %esi,(%esp)
  10992d:	e8 8e ee ff ff       	call   1087c0 <inode_update>
    inode_unlockput(ip);
  109932:	89 34 24             	mov    %esi,(%esp)
  109935:	e8 66 f4 ff ff       	call   108da0 <inode_unlockput>
    commit_trans();
  10993a:	e8 e1 e8 ff ff       	call   108220 <commit_trans>
    syscall_set_errno(tf, E_DISK_OP);
  10993f:	58                   	pop    %eax
  109940:	5a                   	pop    %edx
  109941:	6a 0d                	push   $0xd
  109943:	ff b4 24 3c 01 00 00 	push   0x13c(%esp)
  10994a:	e8 61 d9 ff ff       	call   1072b0 <syscall_set_errno>
    return;
  10994f:	83 c4 10             	add    $0x10,%esp
}
  109952:	81 c4 1c 01 00 00    	add    $0x11c,%esp
  109958:	5b                   	pop    %ebx
  109959:	5e                   	pop    %esi
  10995a:	5f                   	pop    %edi
  10995b:	5d                   	pop    %ebp
  10995c:	c3                   	ret
  10995d:	8d 76 00             	lea    0x0(%esi),%esi
        syscall_set_errno(tf, E_NEXIST);
  109960:	83 ec 08             	sub    $0x8,%esp
  109963:	6a 1a                	push   $0x1a
  109965:	ff b4 24 3c 01 00 00 	push   0x13c(%esp)
  10996c:	e8 3f d9 ff ff       	call   1072b0 <syscall_set_errno>
        return;
  109971:	83 c4 10             	add    $0x10,%esp
}
  109974:	81 c4 1c 01 00 00    	add    $0x11c,%esp
  10997a:	5b                   	pop    %ebx
  10997b:	5e                   	pop    %esi
  10997c:	5f                   	pop    %edi
  10997d:	5d                   	pop    %ebp
  10997e:	c3                   	ret
  10997f:	90                   	nop
        inode_unlockput(ip);
  109980:	83 ec 0c             	sub    $0xc,%esp
  109983:	56                   	push   %esi
  109984:	eb af                	jmp    109935 <sys_link+0x145>
  109986:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10998d:	00 
  10998e:	66 90                	xchg   %ax,%ax

00109990 <sys_unlink>:
{
  109990:	55                   	push   %ebp
  109991:	57                   	push   %edi
  109992:	56                   	push   %esi
  109993:	53                   	push   %ebx
  109994:	e8 09 6a ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  109999:	81 c3 5b a6 00 00    	add    $0xa65b,%ebx
  10999f:	81 ec d8 00 00 00    	sub    $0xd8,%esp
    pt_copyin(get_curid(), syscall_get_arg2(tf), path, 128);
  1099a5:	ff b4 24 ec 00 00 00 	push   0xec(%esp)
  1099ac:	e8 af d8 ff ff       	call   107260 <syscall_get_arg2>
  1099b1:	89 c6                	mov    %eax,%esi
  1099b3:	e8 a8 d5 ff ff       	call   106f60 <get_curid>
  1099b8:	68 80 00 00 00       	push   $0x80
  1099bd:	8d 6c 24 54          	lea    0x54(%esp),%ebp
  1099c1:	55                   	push   %ebp
  1099c2:	56                   	push   %esi
  1099c3:	50                   	push   %eax
  1099c4:	e8 47 c0 ff ff       	call   105a10 <pt_copyin>
    if ((dp = nameiparent(path, name)) == 0) {
  1099c9:	83 c4 18             	add    $0x18,%esp
  1099cc:	8d 7c 24 2a          	lea    0x2a(%esp),%edi
  1099d0:	57                   	push   %edi
  1099d1:	55                   	push   %ebp
  1099d2:	e8 89 f7 ff ff       	call   109160 <nameiparent>
  1099d7:	83 c4 10             	add    $0x10,%esp
  1099da:	85 c0                	test   %eax,%eax
  1099dc:	0f 84 46 01 00 00    	je     109b28 <sys_unlink+0x198>
  1099e2:	89 c6                	mov    %eax,%esi
    begin_trans();
  1099e4:	e8 d7 e7 ff ff       	call   1081c0 <begin_trans>
    inode_lock(dp);
  1099e9:	83 ec 0c             	sub    $0xc,%esp
  1099ec:	56                   	push   %esi
  1099ed:	e8 8e f0 ff ff       	call   108a80 <inode_lock>
    if (dir_namecmp(name, ".") == 0 || dir_namecmp(name, "..") == 0)
  1099f2:	5d                   	pop    %ebp
  1099f3:	58                   	pop    %eax
  1099f4:	8d 83 f8 79 ff ff    	lea    -0x8608(%ebx),%eax
  1099fa:	50                   	push   %eax
  1099fb:	57                   	push   %edi
  1099fc:	e8 7f f6 ff ff       	call   109080 <dir_namecmp>
  109a01:	83 c4 10             	add    $0x10,%esp
  109a04:	85 c0                	test   %eax,%eax
  109a06:	75 30                	jne    109a38 <sys_unlink+0xa8>
    inode_unlockput(dp);
  109a08:	83 ec 0c             	sub    $0xc,%esp
  109a0b:	56                   	push   %esi
  109a0c:	e8 8f f3 ff ff       	call   108da0 <inode_unlockput>
    commit_trans();
  109a11:	e8 0a e8 ff ff       	call   108220 <commit_trans>
    syscall_set_errno(tf, E_DISK_OP);
  109a16:	58                   	pop    %eax
  109a17:	5a                   	pop    %edx
  109a18:	6a 0d                	push   $0xd
  109a1a:	ff b4 24 ec 00 00 00 	push   0xec(%esp)
  109a21:	e8 8a d8 ff ff       	call   1072b0 <syscall_set_errno>
    return;
  109a26:	83 c4 10             	add    $0x10,%esp
}
  109a29:	81 c4 cc 00 00 00    	add    $0xcc,%esp
  109a2f:	5b                   	pop    %ebx
  109a30:	5e                   	pop    %esi
  109a31:	5f                   	pop    %edi
  109a32:	5d                   	pop    %ebp
  109a33:	c3                   	ret
  109a34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (dir_namecmp(name, ".") == 0 || dir_namecmp(name, "..") == 0)
  109a38:	83 ec 08             	sub    $0x8,%esp
  109a3b:	8d 83 f7 79 ff ff    	lea    -0x8609(%ebx),%eax
  109a41:	50                   	push   %eax
  109a42:	57                   	push   %edi
  109a43:	e8 38 f6 ff ff       	call   109080 <dir_namecmp>
  109a48:	83 c4 10             	add    $0x10,%esp
  109a4b:	85 c0                	test   %eax,%eax
  109a4d:	74 b9                	je     109a08 <sys_unlink+0x78>
    if ((ip = dir_lookup(dp, name, &off)) == 0)
  109a4f:	83 ec 04             	sub    $0x4,%esp
  109a52:	8d 44 24 20          	lea    0x20(%esp),%eax
  109a56:	50                   	push   %eax
  109a57:	57                   	push   %edi
  109a58:	56                   	push   %esi
  109a59:	e8 52 f6 ff ff       	call   1090b0 <dir_lookup>
  109a5e:	83 c4 10             	add    $0x10,%esp
  109a61:	89 c7                	mov    %eax,%edi
  109a63:	85 c0                	test   %eax,%eax
  109a65:	74 a1                	je     109a08 <sys_unlink+0x78>
    inode_lock(ip);
  109a67:	83 ec 0c             	sub    $0xc,%esp
  109a6a:	50                   	push   %eax
  109a6b:	e8 10 f0 ff ff       	call   108a80 <inode_lock>
    if (ip->nlink < 1)
  109a70:	83 c4 10             	add    $0x10,%esp
  109a73:	66 83 7f 16 00       	cmpw   $0x0,0x16(%edi)
  109a78:	0f 8e 5a 01 00 00    	jle    109bd8 <sys_unlink+0x248>
    if (ip->type == T_DIR && !isdirempty(ip)) {
  109a7e:	66 83 7f 10 01       	cmpw   $0x1,0x10(%edi)
  109a83:	8d 54 24 30          	lea    0x30(%esp),%edx
  109a87:	0f 84 c3 00 00 00    	je     109b50 <sys_unlink+0x1c0>
    memset(&de, 0, sizeof(de));
  109a8d:	83 ec 04             	sub    $0x4,%esp
  109a90:	6a 10                	push   $0x10
  109a92:	6a 00                	push   $0x0
  109a94:	52                   	push   %edx
  109a95:	89 54 24 14          	mov    %edx,0x14(%esp)
  109a99:	e8 82 a9 ff ff       	call   104420 <memset>
    if (inode_write(dp, (char *) &de, off, sizeof(de)) != sizeof(de))
  109a9e:	6a 10                	push   $0x10
  109aa0:	ff 74 24 30          	push   0x30(%esp)
  109aa4:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  109aa8:	52                   	push   %edx
  109aa9:	56                   	push   %esi
  109aaa:	e8 71 f4 ff ff       	call   108f20 <inode_write>
  109aaf:	83 c4 20             	add    $0x20,%esp
  109ab2:	83 f8 10             	cmp    $0x10,%eax
  109ab5:	74 1e                	je     109ad5 <sys_unlink+0x145>
        KERN_PANIC("unlink: writei");
  109ab7:	83 ec 04             	sub    $0x4,%esp
  109aba:	8d 83 2f 7a ff ff    	lea    -0x85d1(%ebx),%eax
  109ac0:	50                   	push   %eax
  109ac1:	8d 83 d9 79 ff ff    	lea    -0x8627(%ebx),%eax
  109ac7:	68 ba 00 00 00       	push   $0xba
  109acc:	50                   	push   %eax
  109acd:	e8 0e ad ff ff       	call   1047e0 <debug_panic>
  109ad2:	83 c4 10             	add    $0x10,%esp
    if (ip->type == T_DIR) {
  109ad5:	66 83 7f 10 01       	cmpw   $0x1,0x10(%edi)
  109ada:	0f 84 20 01 00 00    	je     109c00 <sys_unlink+0x270>
    inode_unlockput(dp);
  109ae0:	83 ec 0c             	sub    $0xc,%esp
  109ae3:	56                   	push   %esi
  109ae4:	e8 b7 f2 ff ff       	call   108da0 <inode_unlockput>
    ip->nlink--;
  109ae9:	66 83 6f 16 01       	subw   $0x1,0x16(%edi)
    inode_update(ip);
  109aee:	89 3c 24             	mov    %edi,(%esp)
  109af1:	e8 ca ec ff ff       	call   1087c0 <inode_update>
    inode_unlockput(ip);
  109af6:	89 3c 24             	mov    %edi,(%esp)
  109af9:	e8 a2 f2 ff ff       	call   108da0 <inode_unlockput>
    commit_trans();
  109afe:	e8 1d e7 ff ff       	call   108220 <commit_trans>
    syscall_set_errno(tf, E_SUCC);
  109b03:	59                   	pop    %ecx
  109b04:	5e                   	pop    %esi
  109b05:	6a 00                	push   $0x0
  109b07:	ff b4 24 ec 00 00 00 	push   0xec(%esp)
  109b0e:	e8 9d d7 ff ff       	call   1072b0 <syscall_set_errno>
    return;
  109b13:	83 c4 10             	add    $0x10,%esp
}
  109b16:	81 c4 cc 00 00 00    	add    $0xcc,%esp
  109b1c:	5b                   	pop    %ebx
  109b1d:	5e                   	pop    %esi
  109b1e:	5f                   	pop    %edi
  109b1f:	5d                   	pop    %ebp
  109b20:	c3                   	ret
  109b21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        syscall_set_errno(tf, E_DISK_OP);
  109b28:	83 ec 08             	sub    $0x8,%esp
  109b2b:	6a 0d                	push   $0xd
  109b2d:	ff b4 24 ec 00 00 00 	push   0xec(%esp)
  109b34:	e8 77 d7 ff ff       	call   1072b0 <syscall_set_errno>
        return;
  109b39:	83 c4 10             	add    $0x10,%esp
}
  109b3c:	81 c4 cc 00 00 00    	add    $0xcc,%esp
  109b42:	5b                   	pop    %ebx
  109b43:	5e                   	pop    %esi
  109b44:	5f                   	pop    %edi
  109b45:	5d                   	pop    %ebp
  109b46:	c3                   	ret
  109b47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109b4e:	00 
  109b4f:	90                   	nop
    for (off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
  109b50:	83 7f 18 20          	cmpl   $0x20,0x18(%edi)
  109b54:	0f 86 33 ff ff ff    	jbe    109a8d <sys_unlink+0xfd>
            KERN_PANIC("isdirempty: readi");
  109b5a:	8d 83 1d 7a ff ff    	lea    -0x85e3(%ebx),%eax
  109b60:	89 74 24 0c          	mov    %esi,0xc(%esp)
    for (off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
  109b64:	bd 20 00 00 00       	mov    $0x20,%ebp
            KERN_PANIC("isdirempty: readi");
  109b69:	89 d6                	mov    %edx,%esi
  109b6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  109b6f:	8d 83 d9 79 ff ff    	lea    -0x8627(%ebx),%eax
  109b75:	89 44 24 08          	mov    %eax,0x8(%esp)
  109b79:	eb 11                	jmp    109b8c <sys_unlink+0x1fc>
  109b7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    for (off = 2 * sizeof(de); off < dp->size; off += sizeof(de)) {
  109b80:	83 c5 10             	add    $0x10,%ebp
  109b83:	3b 6f 18             	cmp    0x18(%edi),%ebp
  109b86:	0f 83 94 00 00 00    	jae    109c20 <sys_unlink+0x290>
        if (inode_read(dp, (char *) &de, off, sizeof(de)) != sizeof(de))
  109b8c:	6a 10                	push   $0x10
  109b8e:	55                   	push   %ebp
  109b8f:	56                   	push   %esi
  109b90:	57                   	push   %edi
  109b91:	e8 5a f2 ff ff       	call   108df0 <inode_read>
  109b96:	83 c4 10             	add    $0x10,%esp
  109b99:	83 f8 10             	cmp    $0x10,%eax
  109b9c:	74 18                	je     109bb6 <sys_unlink+0x226>
            KERN_PANIC("isdirempty: readi");
  109b9e:	83 ec 04             	sub    $0x4,%esp
  109ba1:	ff 74 24 08          	push   0x8(%esp)
  109ba5:	68 90 00 00 00       	push   $0x90
  109baa:	ff 74 24 14          	push   0x14(%esp)
  109bae:	e8 2d ac ff ff       	call   1047e0 <debug_panic>
  109bb3:	83 c4 10             	add    $0x10,%esp
        if (de.inum != 0)
  109bb6:	66 83 7c 24 30 00    	cmpw   $0x0,0x30(%esp)
  109bbc:	74 c2                	je     109b80 <sys_unlink+0x1f0>
        inode_unlockput(ip);
  109bbe:	8b 74 24 0c          	mov    0xc(%esp),%esi
  109bc2:	83 ec 0c             	sub    $0xc,%esp
  109bc5:	57                   	push   %edi
  109bc6:	e8 d5 f1 ff ff       	call   108da0 <inode_unlockput>
        goto bad;
  109bcb:	83 c4 10             	add    $0x10,%esp
  109bce:	e9 35 fe ff ff       	jmp    109a08 <sys_unlink+0x78>
  109bd3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        KERN_PANIC("unlink: nlink < 1");
  109bd8:	83 ec 04             	sub    $0x4,%esp
  109bdb:	8d 83 0b 7a ff ff    	lea    -0x85f5(%ebx),%eax
  109be1:	50                   	push   %eax
  109be2:	8d 83 d9 79 ff ff    	lea    -0x8627(%ebx),%eax
  109be8:	68 b2 00 00 00       	push   $0xb2
  109bed:	50                   	push   %eax
  109bee:	e8 ed ab ff ff       	call   1047e0 <debug_panic>
  109bf3:	83 c4 10             	add    $0x10,%esp
  109bf6:	e9 83 fe ff ff       	jmp    109a7e <sys_unlink+0xee>
  109bfb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        inode_update(dp);
  109c00:	83 ec 0c             	sub    $0xc,%esp
        dp->nlink--;
  109c03:	66 83 6e 16 01       	subw   $0x1,0x16(%esi)
        inode_update(dp);
  109c08:	56                   	push   %esi
  109c09:	e8 b2 eb ff ff       	call   1087c0 <inode_update>
  109c0e:	83 c4 10             	add    $0x10,%esp
  109c11:	e9 ca fe ff ff       	jmp    109ae0 <sys_unlink+0x150>
  109c16:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109c1d:	00 
  109c1e:	66 90                	xchg   %ax,%ax
  109c20:	89 f2                	mov    %esi,%edx
  109c22:	8b 74 24 0c          	mov    0xc(%esp),%esi
  109c26:	e9 62 fe ff ff       	jmp    109a8d <sys_unlink+0xfd>
  109c2b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00109c30 <sys_open>:

void sys_open(tf_t *tf)
{
  109c30:	55                   	push   %ebp
  109c31:	57                   	push   %edi
  109c32:	56                   	push   %esi
  109c33:	53                   	push   %ebx
  109c34:	e8 69 67 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  109c39:	81 c3 bb a3 00 00    	add    $0xa3bb,%ebx
  109c3f:	81 ec 98 00 00 00    	sub    $0x98,%esp
  109c45:	8b bc 24 ac 00 00 00 	mov    0xac(%esp),%edi
    char path[128];
    int fd, omode;
    struct file *f;
    struct inode *ip;

    pt_copyin(get_curid(), syscall_get_arg2(tf), path, 128);
  109c4c:	57                   	push   %edi
  109c4d:	e8 0e d6 ff ff       	call   107260 <syscall_get_arg2>
  109c52:	89 c5                	mov    %eax,%ebp
  109c54:	e8 07 d3 ff ff       	call   106f60 <get_curid>
  109c59:	68 80 00 00 00       	push   $0x80
  109c5e:	8d 74 24 14          	lea    0x14(%esp),%esi
  109c62:	56                   	push   %esi
  109c63:	55                   	push   %ebp
  109c64:	50                   	push   %eax
  109c65:	e8 a6 bd ff ff       	call   105a10 <pt_copyin>
    omode = syscall_get_arg3(tf);
  109c6a:	83 c4 14             	add    $0x14,%esp
  109c6d:	57                   	push   %edi
  109c6e:	e8 fd d5 ff ff       	call   107270 <syscall_get_arg3>

    if (omode & O_CREATE) {
  109c73:	89 f4                	mov    %esi,%esp
  109c75:	f6 c4 02             	test   $0x2,%ah
  109c78:	74 66                	je     109ce0 <sys_open+0xb0>
        begin_trans();
  109c7a:	e8 41 e5 ff ff       	call   1081c0 <begin_trans>
        ip = create(path, T_FILE, 0, 0);
  109c7f:	89 f0                	mov    %esi,%eax
  109c81:	ba 02 00 00 00       	mov    $0x2,%edx
  109c86:	e8 55 f9 ff ff       	call   1095e0 <create.constprop.0>
  109c8b:	89 c6                	mov    %eax,%esi
        commit_trans();
  109c8d:	e8 8e e5 ff ff       	call   108220 <commit_trans>
        if (ip == 0) {
  109c92:	85 f6                	test   %esi,%esi
  109c94:	0f 84 86 00 00 00    	je     109d20 <sys_open+0xf0>
            syscall_set_errno(tf, E_DISK_OP);
            return;
        }
    }

    if ((f = file_alloc()) == 0 || (fd = fdalloc(f)) < 0) {
  109c9a:	e8 51 f5 ff ff       	call   1091f0 <file_alloc>
        if (f)
  109c9f:	85 c0                	test   %eax,%eax
  109ca1:	74 0c                	je     109caf <sys_open+0x7f>
            file_close(f);
  109ca3:	83 ec 0c             	sub    $0xc,%esp
  109ca6:	50                   	push   %eax
  109ca7:	e8 34 f6 ff ff       	call   1092e0 <file_close>
  109cac:	83 c4 10             	add    $0x10,%esp
        inode_unlockput(ip);
  109caf:	83 ec 0c             	sub    $0xc,%esp
  109cb2:	56                   	push   %esi
  109cb3:	e8 e8 f0 ff ff       	call   108da0 <inode_unlockput>
        syscall_set_retval1(tf, -1);
  109cb8:	58                   	pop    %eax
  109cb9:	5a                   	pop    %edx
  109cba:	6a ff                	push   $0xffffffff
  109cbc:	57                   	push   %edi
  109cbd:	e8 fe d5 ff ff       	call   1072c0 <syscall_set_retval1>
        syscall_set_errno(tf, E_DISK_OP);
  109cc2:	59                   	pop    %ecx
  109cc3:	5e                   	pop    %esi
  109cc4:	6a 0d                	push   $0xd
  109cc6:	57                   	push   %edi
  109cc7:	e8 e4 d5 ff ff       	call   1072b0 <syscall_set_errno>
        return;
  109ccc:	83 c4 10             	add    $0x10,%esp
    f->off = 0;
    f->readable = !(omode & O_WRONLY);
    f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    syscall_set_retval1(tf, fd);
    syscall_set_errno(tf, E_SUCC);
}
  109ccf:	81 c4 8c 00 00 00    	add    $0x8c,%esp
  109cd5:	5b                   	pop    %ebx
  109cd6:	5e                   	pop    %esi
  109cd7:	5f                   	pop    %edi
  109cd8:	5d                   	pop    %ebp
  109cd9:	c3                   	ret
  109cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if ((ip = namei(path)) == 0) {
  109ce0:	83 ec 0c             	sub    $0xc,%esp
  109ce3:	89 c5                	mov    %eax,%ebp
  109ce5:	56                   	push   %esi
  109ce6:	e8 15 f4 ff ff       	call   109100 <namei>
  109ceb:	83 c4 10             	add    $0x10,%esp
  109cee:	89 c6                	mov    %eax,%esi
  109cf0:	85 c0                	test   %eax,%eax
  109cf2:	74 4c                	je     109d40 <sys_open+0x110>
        inode_lock(ip);
  109cf4:	83 ec 0c             	sub    $0xc,%esp
  109cf7:	50                   	push   %eax
  109cf8:	e8 83 ed ff ff       	call   108a80 <inode_lock>
        if (ip->type == T_DIR && omode != O_RDONLY) {
  109cfd:	83 c4 10             	add    $0x10,%esp
  109d00:	66 83 7e 10 01       	cmpw   $0x1,0x10(%esi)
  109d05:	75 93                	jne    109c9a <sys_open+0x6a>
  109d07:	85 ed                	test   %ebp,%ebp
  109d09:	75 a4                	jne    109caf <sys_open+0x7f>
    if ((f = file_alloc()) == 0 || (fd = fdalloc(f)) < 0) {
  109d0b:	e8 e0 f4 ff ff       	call   1091f0 <file_alloc>
        if (f)
  109d10:	85 c0                	test   %eax,%eax
  109d12:	75 8f                	jne    109ca3 <sys_open+0x73>
  109d14:	eb 99                	jmp    109caf <sys_open+0x7f>
  109d16:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109d1d:	00 
  109d1e:	66 90                	xchg   %ax,%ax
            syscall_set_retval1(tf, -1);
  109d20:	83 ec 08             	sub    $0x8,%esp
  109d23:	6a ff                	push   $0xffffffff
  109d25:	57                   	push   %edi
  109d26:	e8 95 d5 ff ff       	call   1072c0 <syscall_set_retval1>
            syscall_set_errno(tf, E_CREATE);
  109d2b:	58                   	pop    %eax
  109d2c:	5a                   	pop    %edx
  109d2d:	6a 1b                	push   $0x1b
  109d2f:	57                   	push   %edi
  109d30:	e8 7b d5 ff ff       	call   1072b0 <syscall_set_errno>
            return;
  109d35:	83 c4 10             	add    $0x10,%esp
  109d38:	eb 95                	jmp    109ccf <sys_open+0x9f>
  109d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            syscall_set_retval1(tf, -1);
  109d40:	83 ec 08             	sub    $0x8,%esp
  109d43:	6a ff                	push   $0xffffffff
  109d45:	57                   	push   %edi
  109d46:	e8 75 d5 ff ff       	call   1072c0 <syscall_set_retval1>
            syscall_set_errno(tf, E_NEXIST);
  109d4b:	5d                   	pop    %ebp
  109d4c:	58                   	pop    %eax
  109d4d:	6a 1a                	push   $0x1a
  109d4f:	57                   	push   %edi
  109d50:	e8 5b d5 ff ff       	call   1072b0 <syscall_set_errno>
            return;
  109d55:	83 c4 10             	add    $0x10,%esp
  109d58:	e9 72 ff ff ff       	jmp    109ccf <sys_open+0x9f>
  109d5d:	8d 76 00             	lea    0x0(%esi),%esi

00109d60 <sys_mkdir>:

void sys_mkdir(tf_t *tf)
{
  109d60:	55                   	push   %ebp
  109d61:	57                   	push   %edi
  109d62:	56                   	push   %esi
  109d63:	53                   	push   %ebx
  109d64:	e8 39 66 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  109d69:	81 c3 8b a2 00 00    	add    $0xa28b,%ebx
  109d6f:	81 ec 98 00 00 00    	sub    $0x98,%esp
  109d75:	8b b4 24 ac 00 00 00 	mov    0xac(%esp),%esi
    char path[128];
    struct inode *ip;

    pt_copyin(get_curid(), syscall_get_arg2(tf), path, 128);
  109d7c:	56                   	push   %esi
  109d7d:	e8 de d4 ff ff       	call   107260 <syscall_get_arg2>
  109d82:	89 c7                	mov    %eax,%edi
  109d84:	e8 d7 d1 ff ff       	call   106f60 <get_curid>
  109d89:	68 80 00 00 00       	push   $0x80
  109d8e:	8d 6c 24 14          	lea    0x14(%esp),%ebp
  109d92:	55                   	push   %ebp
  109d93:	57                   	push   %edi
  109d94:	50                   	push   %eax
  109d95:	e8 76 bc ff ff       	call   105a10 <pt_copyin>

    begin_trans();
  109d9a:	89 ec                	mov    %ebp,%esp
  109d9c:	e8 1f e4 ff ff       	call   1081c0 <begin_trans>
    if ((ip = (struct inode *) create(path, T_DIR, 0, 0)) == 0) {
  109da1:	ba 01 00 00 00       	mov    $0x1,%edx
  109da6:	89 e8                	mov    %ebp,%eax
  109da8:	e8 33 f8 ff ff       	call   1095e0 <create.constprop.0>
  109dad:	85 c0                	test   %eax,%eax
  109daf:	74 2f                	je     109de0 <sys_mkdir+0x80>
        commit_trans();
        syscall_set_errno(tf, E_DISK_OP);
        return;
    }
    inode_unlockput(ip);
  109db1:	83 ec 0c             	sub    $0xc,%esp
  109db4:	50                   	push   %eax
  109db5:	e8 e6 ef ff ff       	call   108da0 <inode_unlockput>
    commit_trans();
  109dba:	e8 61 e4 ff ff       	call   108220 <commit_trans>
    syscall_set_errno(tf, E_SUCC);
  109dbf:	58                   	pop    %eax
  109dc0:	5a                   	pop    %edx
  109dc1:	6a 00                	push   $0x0
  109dc3:	56                   	push   %esi
  109dc4:	e8 e7 d4 ff ff       	call   1072b0 <syscall_set_errno>
  109dc9:	83 c4 10             	add    $0x10,%esp
}
  109dcc:	81 c4 8c 00 00 00    	add    $0x8c,%esp
  109dd2:	5b                   	pop    %ebx
  109dd3:	5e                   	pop    %esi
  109dd4:	5f                   	pop    %edi
  109dd5:	5d                   	pop    %ebp
  109dd6:	c3                   	ret
  109dd7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109dde:	00 
  109ddf:	90                   	nop
        commit_trans();
  109de0:	e8 3b e4 ff ff       	call   108220 <commit_trans>
        syscall_set_errno(tf, E_DISK_OP);
  109de5:	83 ec 08             	sub    $0x8,%esp
  109de8:	6a 0d                	push   $0xd
  109dea:	56                   	push   %esi
  109deb:	e8 c0 d4 ff ff       	call   1072b0 <syscall_set_errno>
  109df0:	89 ec                	mov    %ebp,%esp
}
  109df2:	81 c4 8c 00 00 00    	add    $0x8c,%esp
  109df8:	5b                   	pop    %ebx
  109df9:	5e                   	pop    %esi
  109dfa:	5f                   	pop    %edi
  109dfb:	5d                   	pop    %ebp
  109dfc:	c3                   	ret
  109dfd:	8d 76 00             	lea    0x0(%esi),%esi

00109e00 <sys_chdir>:

void sys_chdir(tf_t *tf)
{
  109e00:	55                   	push   %ebp
  109e01:	57                   	push   %edi
  109e02:	56                   	push   %esi
  109e03:	53                   	push   %ebx
  109e04:	e8 99 65 ff ff       	call   1003a2 <__x86.get_pc_thunk.bx>
  109e09:	81 c3 eb a1 00 00    	add    $0xa1eb,%ebx
  109e0f:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
    char path[128];
    struct inode *ip;
    int pid = get_curid();
  109e15:	e8 46 d1 ff ff       	call   106f60 <get_curid>

    pt_copyin(get_curid(), syscall_get_arg2(tf), path, 128);
  109e1a:	83 ec 0c             	sub    $0xc,%esp
  109e1d:	ff b4 24 ac 00 00 00 	push   0xac(%esp)
    int pid = get_curid();
  109e24:	89 c6                	mov    %eax,%esi
    pt_copyin(get_curid(), syscall_get_arg2(tf), path, 128);
  109e26:	e8 35 d4 ff ff       	call   107260 <syscall_get_arg2>
  109e2b:	89 c5                	mov    %eax,%ebp
  109e2d:	e8 2e d1 ff ff       	call   106f60 <get_curid>
  109e32:	68 80 00 00 00       	push   $0x80
  109e37:	8d 7c 24 14          	lea    0x14(%esp),%edi
  109e3b:	57                   	push   %edi
  109e3c:	55                   	push   %ebp
  109e3d:	50                   	push   %eax
  109e3e:	e8 cd bb ff ff       	call   105a10 <pt_copyin>

    if ((ip = namei(path)) == 0) {
  109e43:	83 c4 14             	add    $0x14,%esp
  109e46:	57                   	push   %edi
  109e47:	e8 b4 f2 ff ff       	call   109100 <namei>
  109e4c:	89 fc                	mov    %edi,%esp
  109e4e:	85 c0                	test   %eax,%eax
  109e50:	0f 84 8a 00 00 00    	je     109ee0 <sys_chdir+0xe0>
        syscall_set_errno(tf, E_DISK_OP);
        return;
    }
    inode_lock(ip);
  109e56:	83 ec 0c             	sub    $0xc,%esp
  109e59:	89 c5                	mov    %eax,%ebp
  109e5b:	50                   	push   %eax
  109e5c:	e8 1f ec ff ff       	call   108a80 <inode_lock>
    if (ip->type != T_DIR) {
  109e61:	83 c4 10             	add    $0x10,%esp
  109e64:	66 83 7d 10 01       	cmpw   $0x1,0x10(%ebp)
  109e69:	75 45                	jne    109eb0 <sys_chdir+0xb0>
        inode_unlockput(ip);
        syscall_set_errno(tf, E_DISK_OP);
        return;
    }
    inode_unlock(ip);
  109e6b:	83 ec 0c             	sub    $0xc,%esp
  109e6e:	55                   	push   %ebp
  109e6f:	e8 1c ed ff ff       	call   108b90 <inode_unlock>
    inode_put(tcb_get_cwd(pid));
  109e74:	89 34 24             	mov    %esi,(%esp)
  109e77:	e8 84 cf ff ff       	call   106e00 <tcb_get_cwd>
  109e7c:	89 04 24             	mov    %eax,(%esp)
  109e7f:	e8 8c ed ff ff       	call   108c10 <inode_put>
    tcb_set_cwd(pid, ip);
  109e84:	58                   	pop    %eax
  109e85:	5a                   	pop    %edx
  109e86:	55                   	push   %ebp
  109e87:	56                   	push   %esi
  109e88:	e8 93 cf ff ff       	call   106e20 <tcb_set_cwd>
    syscall_set_errno(tf, E_SUCC);
  109e8d:	59                   	pop    %ecx
  109e8e:	5e                   	pop    %esi
  109e8f:	6a 00                	push   $0x0
  109e91:	ff b4 24 ac 00 00 00 	push   0xac(%esp)
  109e98:	e8 13 d4 ff ff       	call   1072b0 <syscall_set_errno>
  109e9d:	83 c4 10             	add    $0x10,%esp
}
  109ea0:	81 c4 8c 00 00 00    	add    $0x8c,%esp
  109ea6:	5b                   	pop    %ebx
  109ea7:	5e                   	pop    %esi
  109ea8:	5f                   	pop    %edi
  109ea9:	5d                   	pop    %ebp
  109eaa:	c3                   	ret
  109eab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        inode_unlockput(ip);
  109eb0:	83 ec 0c             	sub    $0xc,%esp
  109eb3:	55                   	push   %ebp
  109eb4:	e8 e7 ee ff ff       	call   108da0 <inode_unlockput>
        syscall_set_errno(tf, E_DISK_OP);
  109eb9:	5f                   	pop    %edi
  109eba:	5d                   	pop    %ebp
  109ebb:	6a 0d                	push   $0xd
  109ebd:	ff b4 24 ac 00 00 00 	push   0xac(%esp)
  109ec4:	e8 e7 d3 ff ff       	call   1072b0 <syscall_set_errno>
        return;
  109ec9:	83 c4 10             	add    $0x10,%esp
}
  109ecc:	81 c4 8c 00 00 00    	add    $0x8c,%esp
  109ed2:	5b                   	pop    %ebx
  109ed3:	5e                   	pop    %esi
  109ed4:	5f                   	pop    %edi
  109ed5:	5d                   	pop    %ebp
  109ed6:	c3                   	ret
  109ed7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109ede:	00 
  109edf:	90                   	nop
        syscall_set_errno(tf, E_DISK_OP);
  109ee0:	83 ec 08             	sub    $0x8,%esp
  109ee3:	6a 0d                	push   $0xd
  109ee5:	ff b4 24 ac 00 00 00 	push   0xac(%esp)
  109eec:	e8 bf d3 ff ff       	call   1072b0 <syscall_set_errno>
        return;
  109ef1:	89 fc                	mov    %edi,%esp
}
  109ef3:	81 c4 8c 00 00 00    	add    $0x8c,%esp
  109ef9:	5b                   	pop    %ebx
  109efa:	5e                   	pop    %esi
  109efb:	5f                   	pop    %edi
  109efc:	5d                   	pop    %ebp
  109efd:	c3                   	ret
  109efe:	66 90                	xchg   %ax,%ax

00109f00 <__udivdi3>:
  109f00:	f3 0f 1e fb          	endbr32
  109f04:	55                   	push   %ebp
  109f05:	89 e5                	mov    %esp,%ebp
  109f07:	57                   	push   %edi
  109f08:	56                   	push   %esi
  109f09:	53                   	push   %ebx
  109f0a:	83 ec 1c             	sub    $0x1c,%esp
  109f0d:	8b 7d 08             	mov    0x8(%ebp),%edi
  109f10:	8b 45 14             	mov    0x14(%ebp),%eax
  109f13:	8b 75 0c             	mov    0xc(%ebp),%esi
  109f16:	8b 5d 10             	mov    0x10(%ebp),%ebx
  109f19:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  109f1c:	85 c0                	test   %eax,%eax
  109f1e:	75 20                	jne    109f40 <__udivdi3+0x40>
  109f20:	39 de                	cmp    %ebx,%esi
  109f22:	73 54                	jae    109f78 <__udivdi3+0x78>
  109f24:	89 f8                	mov    %edi,%eax
  109f26:	31 ff                	xor    %edi,%edi
  109f28:	89 f2                	mov    %esi,%edx
  109f2a:	f7 f3                	div    %ebx
  109f2c:	89 fa                	mov    %edi,%edx
  109f2e:	83 c4 1c             	add    $0x1c,%esp
  109f31:	5b                   	pop    %ebx
  109f32:	5e                   	pop    %esi
  109f33:	5f                   	pop    %edi
  109f34:	5d                   	pop    %ebp
  109f35:	c3                   	ret
  109f36:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  109f3d:	00 
  109f3e:	66 90                	xchg   %ax,%ax
  109f40:	39 c6                	cmp    %eax,%esi
  109f42:	73 14                	jae    109f58 <__udivdi3+0x58>
  109f44:	31 ff                	xor    %edi,%edi
  109f46:	31 c0                	xor    %eax,%eax
  109f48:	89 fa                	mov    %edi,%edx
  109f4a:	83 c4 1c             	add    $0x1c,%esp
  109f4d:	5b                   	pop    %ebx
  109f4e:	5e                   	pop    %esi
  109f4f:	5f                   	pop    %edi
  109f50:	5d                   	pop    %ebp
  109f51:	c3                   	ret
  109f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  109f58:	0f bd f8             	bsr    %eax,%edi
  109f5b:	83 f7 1f             	xor    $0x1f,%edi
  109f5e:	75 48                	jne    109fa8 <__udivdi3+0xa8>
  109f60:	39 f0                	cmp    %esi,%eax
  109f62:	72 07                	jb     109f6b <__udivdi3+0x6b>
  109f64:	31 c0                	xor    %eax,%eax
  109f66:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  109f69:	72 dd                	jb     109f48 <__udivdi3+0x48>
  109f6b:	b8 01 00 00 00       	mov    $0x1,%eax
  109f70:	eb d6                	jmp    109f48 <__udivdi3+0x48>
  109f72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  109f78:	89 d9                	mov    %ebx,%ecx
  109f7a:	85 db                	test   %ebx,%ebx
  109f7c:	75 0b                	jne    109f89 <__udivdi3+0x89>
  109f7e:	b8 01 00 00 00       	mov    $0x1,%eax
  109f83:	31 d2                	xor    %edx,%edx
  109f85:	f7 f3                	div    %ebx
  109f87:	89 c1                	mov    %eax,%ecx
  109f89:	31 d2                	xor    %edx,%edx
  109f8b:	89 f0                	mov    %esi,%eax
  109f8d:	f7 f1                	div    %ecx
  109f8f:	89 c6                	mov    %eax,%esi
  109f91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  109f94:	89 f7                	mov    %esi,%edi
  109f96:	f7 f1                	div    %ecx
  109f98:	89 fa                	mov    %edi,%edx
  109f9a:	83 c4 1c             	add    $0x1c,%esp
  109f9d:	5b                   	pop    %ebx
  109f9e:	5e                   	pop    %esi
  109f9f:	5f                   	pop    %edi
  109fa0:	5d                   	pop    %ebp
  109fa1:	c3                   	ret
  109fa2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  109fa8:	89 f9                	mov    %edi,%ecx
  109faa:	ba 20 00 00 00       	mov    $0x20,%edx
  109faf:	29 fa                	sub    %edi,%edx
  109fb1:	d3 e0                	shl    %cl,%eax
  109fb3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  109fb6:	89 d1                	mov    %edx,%ecx
  109fb8:	89 d8                	mov    %ebx,%eax
  109fba:	d3 e8                	shr    %cl,%eax
  109fbc:	89 c1                	mov    %eax,%ecx
  109fbe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  109fc1:	09 c1                	or     %eax,%ecx
  109fc3:	89 f0                	mov    %esi,%eax
  109fc5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  109fc8:	89 f9                	mov    %edi,%ecx
  109fca:	d3 e3                	shl    %cl,%ebx
  109fcc:	89 d1                	mov    %edx,%ecx
  109fce:	d3 e8                	shr    %cl,%eax
  109fd0:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  109fd3:	89 f9                	mov    %edi,%ecx
  109fd5:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  109fd8:	d3 e6                	shl    %cl,%esi
  109fda:	89 d1                	mov    %edx,%ecx
  109fdc:	d3 eb                	shr    %cl,%ebx
  109fde:	09 f3                	or     %esi,%ebx
  109fe0:	89 c6                	mov    %eax,%esi
  109fe2:	89 f2                	mov    %esi,%edx
  109fe4:	89 d8                	mov    %ebx,%eax
  109fe6:	f7 75 e0             	divl   -0x20(%ebp)
  109fe9:	89 d6                	mov    %edx,%esi
  109feb:	89 c3                	mov    %eax,%ebx
  109fed:	f7 65 dc             	mull   -0x24(%ebp)
  109ff0:	89 55 e0             	mov    %edx,-0x20(%ebp)
  109ff3:	39 d6                	cmp    %edx,%esi
  109ff5:	72 21                	jb     10a018 <__udivdi3+0x118>
  109ff7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  109ffa:	89 f9                	mov    %edi,%ecx
  109ffc:	d3 e2                	shl    %cl,%edx
  109ffe:	39 c2                	cmp    %eax,%edx
  10a000:	73 07                	jae    10a009 <__udivdi3+0x109>
  10a002:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10a005:	39 d6                	cmp    %edx,%esi
  10a007:	74 0f                	je     10a018 <__udivdi3+0x118>
  10a009:	89 d8                	mov    %ebx,%eax
  10a00b:	31 ff                	xor    %edi,%edi
  10a00d:	e9 36 ff ff ff       	jmp    109f48 <__udivdi3+0x48>
  10a012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10a018:	8d 43 ff             	lea    -0x1(%ebx),%eax
  10a01b:	31 ff                	xor    %edi,%edi
  10a01d:	e9 26 ff ff ff       	jmp    109f48 <__udivdi3+0x48>
  10a022:	66 90                	xchg   %ax,%ax
  10a024:	66 90                	xchg   %ax,%ax
  10a026:	66 90                	xchg   %ax,%ax
  10a028:	66 90                	xchg   %ax,%ax
  10a02a:	66 90                	xchg   %ax,%ax
  10a02c:	66 90                	xchg   %ax,%ax
  10a02e:	66 90                	xchg   %ax,%ax

0010a030 <__umoddi3>:
  10a030:	f3 0f 1e fb          	endbr32
  10a034:	55                   	push   %ebp
  10a035:	89 e5                	mov    %esp,%ebp
  10a037:	57                   	push   %edi
  10a038:	56                   	push   %esi
  10a039:	53                   	push   %ebx
  10a03a:	83 ec 2c             	sub    $0x2c,%esp
  10a03d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  10a040:	8b 45 14             	mov    0x14(%ebp),%eax
  10a043:	8b 75 08             	mov    0x8(%ebp),%esi
  10a046:	8b 7d 10             	mov    0x10(%ebp),%edi
  10a049:	89 da                	mov    %ebx,%edx
  10a04b:	85 c0                	test   %eax,%eax
  10a04d:	75 19                	jne    10a068 <__umoddi3+0x38>
  10a04f:	39 fb                	cmp    %edi,%ebx
  10a051:	73 5d                	jae    10a0b0 <__umoddi3+0x80>
  10a053:	89 f0                	mov    %esi,%eax
  10a055:	f7 f7                	div    %edi
  10a057:	89 d0                	mov    %edx,%eax
  10a059:	31 d2                	xor    %edx,%edx
  10a05b:	83 c4 2c             	add    $0x2c,%esp
  10a05e:	5b                   	pop    %ebx
  10a05f:	5e                   	pop    %esi
  10a060:	5f                   	pop    %edi
  10a061:	5d                   	pop    %ebp
  10a062:	c3                   	ret
  10a063:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a068:	89 75 e0             	mov    %esi,-0x20(%ebp)
  10a06b:	39 c3                	cmp    %eax,%ebx
  10a06d:	73 11                	jae    10a080 <__umoddi3+0x50>
  10a06f:	89 f0                	mov    %esi,%eax
  10a071:	83 c4 2c             	add    $0x2c,%esp
  10a074:	5b                   	pop    %ebx
  10a075:	5e                   	pop    %esi
  10a076:	5f                   	pop    %edi
  10a077:	5d                   	pop    %ebp
  10a078:	c3                   	ret
  10a079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  10a080:	0f bd c8             	bsr    %eax,%ecx
  10a083:	83 f1 1f             	xor    $0x1f,%ecx
  10a086:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  10a089:	75 45                	jne    10a0d0 <__umoddi3+0xa0>
  10a08b:	39 d8                	cmp    %ebx,%eax
  10a08d:	0f 82 d5 00 00 00    	jb     10a168 <__umoddi3+0x138>
  10a093:	39 fe                	cmp    %edi,%esi
  10a095:	0f 83 cd 00 00 00    	jae    10a168 <__umoddi3+0x138>
  10a09b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10a09e:	83 c4 2c             	add    $0x2c,%esp
  10a0a1:	5b                   	pop    %ebx
  10a0a2:	5e                   	pop    %esi
  10a0a3:	5f                   	pop    %edi
  10a0a4:	5d                   	pop    %ebp
  10a0a5:	c3                   	ret
  10a0a6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a0ad:	00 
  10a0ae:	66 90                	xchg   %ax,%ax
  10a0b0:	89 f9                	mov    %edi,%ecx
  10a0b2:	85 ff                	test   %edi,%edi
  10a0b4:	75 0b                	jne    10a0c1 <__umoddi3+0x91>
  10a0b6:	b8 01 00 00 00       	mov    $0x1,%eax
  10a0bb:	31 d2                	xor    %edx,%edx
  10a0bd:	f7 f7                	div    %edi
  10a0bf:	89 c1                	mov    %eax,%ecx
  10a0c1:	89 d8                	mov    %ebx,%eax
  10a0c3:	31 d2                	xor    %edx,%edx
  10a0c5:	f7 f1                	div    %ecx
  10a0c7:	89 f0                	mov    %esi,%eax
  10a0c9:	f7 f1                	div    %ecx
  10a0cb:	eb 8a                	jmp    10a057 <__umoddi3+0x27>
  10a0cd:	8d 76 00             	lea    0x0(%esi),%esi
  10a0d0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  10a0d3:	ba 20 00 00 00       	mov    $0x20,%edx
  10a0d8:	29 ca                	sub    %ecx,%edx
  10a0da:	d3 e0                	shl    %cl,%eax
  10a0dc:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10a0df:	89 d1                	mov    %edx,%ecx
  10a0e1:	89 f8                	mov    %edi,%eax
  10a0e3:	d3 e8                	shr    %cl,%eax
  10a0e5:	89 55 e0             	mov    %edx,-0x20(%ebp)
  10a0e8:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
  10a0ec:	89 c2                	mov    %eax,%edx
  10a0ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10a0f1:	d3 e7                	shl    %cl,%edi
  10a0f3:	09 c2                	or     %eax,%edx
  10a0f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10a0f8:	89 7d d8             	mov    %edi,-0x28(%ebp)
  10a0fb:	89 f7                	mov    %esi,%edi
  10a0fd:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10a100:	89 da                	mov    %ebx,%edx
  10a102:	89 c1                	mov    %eax,%ecx
  10a104:	d3 ea                	shr    %cl,%edx
  10a106:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
  10a10a:	d3 e3                	shl    %cl,%ebx
  10a10c:	89 c1                	mov    %eax,%ecx
  10a10e:	d3 ef                	shr    %cl,%edi
  10a110:	0f b6 4d e4          	movzbl -0x1c(%ebp),%ecx
  10a114:	89 f8                	mov    %edi,%eax
  10a116:	d3 e6                	shl    %cl,%esi
  10a118:	09 d8                	or     %ebx,%eax
  10a11a:	f7 75 dc             	divl   -0x24(%ebp)
  10a11d:	89 d3                	mov    %edx,%ebx
  10a11f:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  10a122:	89 f7                	mov    %esi,%edi
  10a124:	f7 65 d8             	mull   -0x28(%ebp)
  10a127:	89 c6                	mov    %eax,%esi
  10a129:	89 d1                	mov    %edx,%ecx
  10a12b:	39 d3                	cmp    %edx,%ebx
  10a12d:	72 06                	jb     10a135 <__umoddi3+0x105>
  10a12f:	75 0e                	jne    10a13f <__umoddi3+0x10f>
  10a131:	39 c7                	cmp    %eax,%edi
  10a133:	73 0a                	jae    10a13f <__umoddi3+0x10f>
  10a135:	2b 45 d8             	sub    -0x28(%ebp),%eax
  10a138:	1b 55 dc             	sbb    -0x24(%ebp),%edx
  10a13b:	89 d1                	mov    %edx,%ecx
  10a13d:	89 c6                	mov    %eax,%esi
  10a13f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10a142:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  10a145:	29 f0                	sub    %esi,%eax
  10a147:	19 cb                	sbb    %ecx,%ebx
  10a149:	0f b6 4d e0          	movzbl -0x20(%ebp),%ecx
  10a14d:	89 da                	mov    %ebx,%edx
  10a14f:	d3 e2                	shl    %cl,%edx
  10a151:	89 f9                	mov    %edi,%ecx
  10a153:	d3 e8                	shr    %cl,%eax
  10a155:	d3 eb                	shr    %cl,%ebx
  10a157:	09 d0                	or     %edx,%eax
  10a159:	89 da                	mov    %ebx,%edx
  10a15b:	83 c4 2c             	add    $0x2c,%esp
  10a15e:	5b                   	pop    %ebx
  10a15f:	5e                   	pop    %esi
  10a160:	5f                   	pop    %edi
  10a161:	5d                   	pop    %ebp
  10a162:	c3                   	ret
  10a163:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  10a168:	89 da                	mov    %ebx,%edx
  10a16a:	29 fe                	sub    %edi,%esi
  10a16c:	19 c2                	sbb    %eax,%edx
  10a16e:	89 75 e0             	mov    %esi,-0x20(%ebp)
  10a171:	e9 25 ff ff ff       	jmp    10a09b <__umoddi3+0x6b>
