extern printf
extern scanf

%include "utama.asm"
%include "keliling.asm"
%include "jenis.asm"
%include "luas.asm"

section .data
    basabasi db 'masukkan sisi ke 1-3 : ', 0
    ;Kalimat Pembuka
    opening1 db '||======================================================||',0xa, 0
    opening2 db '||                 Δ        ...       Δ                 ||',0xa, 0
    opening3 db '||                ΔΔΔ      Jenis     ΔΔΔ                ||',0xa, 0
    opening4 db '||               ΔΔΔΔΔ     Jenis    ΔΔΔΔΔ               ||',0xa, 0
    opening5 db '||              ΔΔΔΔΔΔΔ  Segitiga  ΔΔΔΔΔΔΔ              ||',0xa, 0
    opening6 db '||                          ...                         ||',0xa, 0
    opening7 db '||                        Oleh:                         ||',0xa, 0
    opening8 db '||               Mutiara Rifta (G64154046)              ||',0xa, 0
    opening9 db '||               Okta Fadhilah (G64154053)              ||',0xa, 0
    opening10 db'||======================================================||',0xa, 0
    
    
	
selamat1	db	"-------------Organisasi dan Arsitektur Komputer-----------",10,0
	
selamat1_len equ $-selamat1
	
	
selamat2	db	"----------------------------------------------------------",10,10,0
	
selamat2_len equ $-selamat2
	
selamat3	db	"Terdapat tiga jenis segitiga :",10,0
	
selamat3_len equ $-selamat3
	
	
menu1	db	"1. Segitiga Sama Sisi",10,0
	
menu1_len equ $-menu1
	
menu2	db	"2. Segitiga Sama Kaki",10,0
	
menu2_len equ $-menu2
	
menu3 	db	"3. Segitiga Sembarang",10,10,0
	
menu3_len equ $-menu3
	
sisi1	db	"Masukkan sisi pertama : ",0
	
sisi1_len equ $-sisi1
	
sisi2	db	"Masukkan sisi kedua : ",0
	
sisi2_len equ $-sisi2
	
sisi3	db	"Masukkan sisi ketiga: ",0
	
sisi3_len equ $-sisi3
	
bukan db "Bukan Segitiga",10,0
sisi db "Segitiga Sama Sisi",10,0
kaki db "Segitiga Sama Kaki",10,0
sembarang db "Segitiga Sembarang",10,0

formatluas db "Luas Segitiga Adalah %.2f",10,0
formatkeliling db "Keliling Segitiga Adalah %d",10,0

format db "%d",0	
	
len		equ 1000

akar_nilai dd 3.0
bil_pembagi dd 4.0
bagi dd 0.5

  


section .bss
	
jenis_segitiga resd 1
jumlah resd 1
luas resd 1
setengah resd 1
tinggi resd 1
alas resd 1
nilaiS1 resd 1
nilaiS2 resd 1
nilaiS3 resd 1
akar resd 1
cetak resq 1
temp resd 16
tiga resd 0



section .text
	   
	   
global main


main:
	call utama
hitung:
	call jenis
	cmp dword[jenis_segitiga], 0
	je exit
	call keliling
	call luas_segitiga
	jmp exit
	
samasisi:
    push sisi
    call printf                     
    add esp,4
	ret
	
samakaki:
    push kaki 
    call printf                     
    add esp,4
	ret
	
sembarangkaki:
    push sembarang
    call printf                     
    add esp,4
	ret
	
bukansegi:
    push bukan
    call printf                     
    add esp,4
	ret



exit:
