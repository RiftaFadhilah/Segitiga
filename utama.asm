utama:
	push dword opening1
	call printf
	add esp,4
	
	push dword opening2
	call printf
	add esp,4
	
	push dword opening3
	call printf
	add esp,4
	
	push dword opening4
	call printf
	add esp,4
	
	push dword opening5
	call printf
	add esp,4
	
	push dword opening6
	call printf
	add esp,4
	
	push dword opening7
	call printf
	add esp,4
	
	push dword opening8
	call printf
	add esp,4
	
	push dword opening9
	call printf
	add esp,4
	
	push dword opening10
	call printf
	add esp,4
	
	mov eax,4
	mov ebx,1
	mov ecx, selamat1
	mov edx, selamat1_len
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx, selamat2
	mov edx, selamat2_len
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx, selamat3
	mov edx, selamat3_len
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx, menu1
	mov edx, menu1_len
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx, menu2
	mov edx, menu2_len
	int 0x80
	
	;ngeprint string
	mov eax,4
	mov ebx,1
	mov ecx, menu3
	mov edx, menu3_len
	int 0x80

push basabasi
call printf
add esp, 4
;looping
mov ebx, 0
mov eax, 3
mov dword [tiga], eax
loop_input:
	push dword temp
	push format
	call scanf
	add esp, 8
	push dword[temp]
    pop dword[nilaiS1+4*ebx]
    fld dword[nilaiS1+4*ebx]
    fstp dword[nilaiS1+4*ebx]
	inc ebx
	cmp ebx, [tiga]
	jl loop_input
	
	ret

