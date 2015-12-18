keliling:
	mov eax, [nilaiS1]
	add eax, [nilaiS2]
	add eax, [nilaiS3]
	mov dword[jumlah],eax
	
	push dword[jumlah]
	push formatkeliling
	call printf
	add esp, 8

	ret
