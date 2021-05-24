[ORG 0x7C00]
[BITS 16]

header:
    jmp 0x0000:start
    times 8-($-$$) db 0

PrimaryVolumeDescriptor resd 1
BootFileLocation        resd 1
BootFileLength          resd 1
Checksum                resd 1
Reserved                resb 40

start:
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    mov si, welcome
    call print
    jmp $

%include "x86_16-pc.s"

welcome:
    db 'Hello, World', 0x0D, 0x0A, 0

