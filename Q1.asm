[org 0x0100] 

jmp start

; coordinates of a circle of radius 24 

x24: dw 48,47,44,40,36,30,24,17,12,7,3,0,0,0,3,7,11,17,23,30,36,40,44,47,48 

y24: dw 24,30,36,40,44,47,48,47,44,40,36,30,24,17,11,7,3,0,0,0,3,7,11,17,23



; coordinates of a circle of radius 45

x45: dw 90,89,88,86,83,79,75,70,64,58,52,46,40,34,28,22,17,12,8,5,2,0,0,0,0,2,5,8,12,17,22,28,34,40,46,52,58,64,70,75,79,83,86,88,89,90

y45: dw 45,51,57,63,68,73,78,82,85,87,89,89,89,88,86,83,80,76,71,66,60,54,48,41,35,29,23,18,13,9,6,3,1,0,0,0,2,4,7,11,16,21,26,32,38,44



; coordinates of a circle of radius 72

x72: dw 144,143,142,141,139,137,134,130,127,122,118,113,108,102,96,90,84,78,72,65,59,53,47,41,36,30,25,21,16,13,9,6,4,2,1,0,0,0,1,2,4,6,9,13,16,21,25,30,35,41,47,53,59,65,71,78,84,90,96,102,108,113,118,122,127,130,134,137,139,141,142,143,144

y72: dw 72,78,84,90,96,102,108,113,118,122,127,130,134,137,139,141,142,143,144,143,142,141,139,137,134,130,127,122,118,113,108,102,96,90,84,78,72,65,59,53,47,41,35,30,25,21,16,13,9,6,4,2,1,0,0,0,1,2,4,6,9,13,16,21,25,30,35,41,47,53,59,65,71 



; coordinates of a circle of radius 120 

x120: dw 240,239,239,238,237,235,234,232,229,226,223,220,217,213,209,204,200,195,190,185,180,174,168,163,157,151,144,138,132,126,120,113,107,101,95,88,82,76,71,65,60,54,49,44,39,35,30,26,22,19,16,13,10,7,5,4,2,1,0,0,0,0,0,1,2,4,5,7,10,13,16,19,22,26,30,35,39,44,49,54,59,65,71,76,82,88,95,101,107,113,119,126,132,138,144,151,157,163,168,174,180,185,190,195,200,204,209,213,217,220,223,226,229,232,234,235,237,238,239,239,240

y120: dw 120,126,132,138,144,151,157,163,168,174,180,185,190,195,200,204,209,213,217,220,223,226,229,232,234,235,237,238,239,239,240,239,239,238,237,235,234,232,229,226,223,220,217,213,209,204,200,195,190,185,180,174,168,163,157,151,144,138,132,126,120,113,107,101,95,88,82,76,71,65,59,54,49,44,39,35,30,26,22,19,16,13,10,7,5,4,2,1,0,0,0,0,0,1,2,4,5,7,10,13,16,19,22,26,30,35,39,44,49,54,59,65,71,76,82,88,95,101,107,113,119



; setting up the parameters

counter : db 0 
radius : equ 24         ; choose radius (24, 45, 72, 120) 

xoffset1: equ 54           ; change to move circle along x axis 
yoffset1: equ 150            ; change to move circle along y axis

xoffset2: equ 52           ; change to move circle along x axis 
yoffset2: equ 160            ; change to move circle along y axis

xoffset3: equ 56           ; change to move circle along x axis 
yoffset3: equ 160            ; change to move circle along y axis

radius1 : equ 45        ; choose radius (24, 45, 72, 120) 
xoffset4: equ 200           ; change to move circle along x axis 
yoffset4: equ 2            ; change to move circle along y axis

xoffset5: equ 4          ; change to move circle along x axis 
yoffset5: equ 200            ; change to move circle along y axis

w equ 50   ;width offset
y equ 200  ;starting y coordinate of line
x equ 0   ;starting x coordinate of line  
c equ 50   ;color


start:

mov si, x24              ; change x array as radius
mov di, y24              ; change y array as radius

mov ax, 0x0010            ; set 640 x 350 graphics mode
int 0x10                  ; bios video services 
mov ax, 0x0C07            ; put pixel in white color 
xor bx, bx                ; page number 0 
mov cx, [si]              ;first x position
add cx, xoffset1           ; moving point along x axis
mov dx, [di]              ; first y position 
add dx, yoffset1           ; moving point along y axis 

l1:
int 0x10                  ; bios video services
add si, 2                 ; next location address
add di, 2                 ; next location address
mov cx, [si] 
add cx, xoffset1 
mov dx, [di] 
add dx, yoffset1 
inc byte[counter]
cmp byte[counter], radius  ; stopping condition
jle l1                     ; jump if less 

l2:
int 0x10                  ; bios video services
add si, 2                 ; next location address
add di, 2                 ; next location address
mov cx, [si] 
add cx, xoffset2 
mov dx, [di] 
add dx, yoffset2 
inc byte[counter]
cmp byte[counter], radius  ; stopping condition
jle l2                     ; jump if less 

l3:
int 0x10                  ; bios video services
add si, 2                 ; next location address
add di, 2                 ; next location address
mov cx, [si] 
add cx, xoffset3 
mov dx, [di] 
add dx, yoffset3 
inc byte[counter]
cmp byte[counter], radius  ; stopping condition
jle l3                    ; jump if less

l4:
int 0x10                  ; bios video services
add si, 2                 ; next location address
add di, 2                 ; next location address
mov cx, [si] 
add cx, xoffset4 
mov dx, [di] 
add dx, yoffset4 
inc byte[counter]
cmp byte[counter], radius1  ; stopping condition
jle l4                    ; jump if less

l5:
int 0x10                  ; bios video services
add si, 2                 ; next location address
add di, 2                 ; next location address
mov cx, [si] 
add cx, xoffset5
mov dx, [di] 
add dx, yoffset5 
inc byte[counter]
cmp byte[counter], radius1  ; stopping condition
jle l5                     ; jump if less

mov ah, 0                  ; service 0 – get keystroke 
int 0x16                   ; bios keyboard services 
mov ax, 0x0003             ; 80x25 text mode 
int 0x10                   ; bios video services 

l0:
mov cx, x
mov dx, y
mov al, c 

ll:
inc dx
mov ah, 0ch 
int 10h
inc cx
cmp cx, x
jbe ll

line2:
dec dx
mov ah, 0ch 
int 10h
inc cx
cmp cx, y+w
jbe line2

line3:
dec dx
mov ah, 0ch 
int 10h
inc cx
cmp cx, y
jbe line3

line4:
;inc dx
mov ah, 0ch 
int 10h
;dec cx
cmp cx, w
jbe line4

mov ah, 00 
int 16h

mov ax, 0x4c00             ; terminate program 
int 0x21