luas_segitiga:
	cmp dword[jenis_segitiga], 1
	je luas_sisi
	cmp dword[jenis_segitiga], 2
	je luas_kaki
	cmp dword[jenis_segitiga], 3
	je luas_sembarang
	jmp exit
	
luas_sisi:
	fld dword[akar_nilai]
	fsqrt
	fst dword[akar]
	
	fild dword[nilaiS1]
	fst dword[nilaiS1]
	
	fld dword[nilaiS1]
	fld dword[nilaiS1]
	fmul
	fst dword[nilaiS1]
	
	fld dword[nilaiS1]
	fld dword[bil_pembagi]
	fdiv
	fst dword[nilaiS1]
	
	fld dword[nilaiS1]
	fld dword[akar]
	fmul
	fstp qword[cetak]
	
	jmp luas_cetak
	
luas_kaki:
	; Mencari tinggi
	mov eax, [nilaiS1]
	cmp eax, [nilaiS1+4]
	je luas_kaki_alas3
	cmp eax, [nilaiS1+8]
	je luas_kaki_alas2
	jmp luas_kaki_alas1
	
luas_kaki_final:
	fld dword[alas]
	fld dword[tinggi]
	fmul
	fst dword[alas]
	
	fld dword[alas]
	fld dword[bagi]
	fmul
	fstp qword[cetak]
	
	jmp luas_cetak
	
luas_kaki_alas1:
	fild dword[nilaiS1]
	fst dword[nilaiS1]
	fild dword[nilaiS1+4]
	fst dword[nilaiS1+4]
	
	fld dword[nilaiS1]
	fst dword[alas]
	
	mov dword[bil_pembagi], 2
	fild dword[bil_pembagi]
	fst dword[bil_pembagi]
	
	fld dword[nilaiS1]
	fld dword[bil_pembagi]
	fdiv
	fstp dword[nilaiS1]
	
	fld dword[nilaiS1]
	fld dword[nilaiS1]
	fmul
	fstp dword[nilaiS1]
	
	fld dword[nilaiS1+4]
	fld dword[nilaiS1+4]
	fmul
	fstp dword[nilaiS1+4]
	
	fld dword[nilaiS1+4]
	fld dword[nilaiS1]
	fsub
	fstp dword[tinggi]
	
	fld dword[tinggi]
	fsqrt
	fstp dword[tinggi]
	
	jmp luas_kaki_final
	
luas_kaki_alas2:
	fild dword[nilaiS1]
	fst dword[nilaiS1]
	fild dword[nilaiS1+4]
	fst dword[nilaiS1+4]
	
	fld dword[nilaiS1+4]
	fst dword[alas]
	
	mov dword[bil_pembagi], 2
	fild dword[bil_pembagi]
	fst dword[bil_pembagi]
	
	fld dword[nilaiS1+4]
	fld dword[bil_pembagi]
	fdiv
	fstp dword[nilaiS1+4]
	
	fld dword[nilaiS1]
	fld dword[nilaiS1]
	fmul
	fstp dword[nilaiS1]
	
	fld dword[nilaiS1+4]
	fld dword[nilaiS1+4]
	fmul
	fstp dword[nilaiS1+4]
	
	fld dword[nilaiS1]
	fld dword[nilaiS1+4]
	fsub
	fstp dword[tinggi]
	
	fld dword[tinggi]
	fsqrt
	fstp dword[tinggi]
	
	jmp luas_kaki_final

luas_kaki_alas3:
	fild dword[nilaiS1]
	fst dword[nilaiS1]
	fild dword[nilaiS1+8]
	fst dword[nilaiS1+8]
	
	fld dword[nilaiS1+8]
	fst dword[alas]
	
	mov dword[bil_pembagi], 2
	fild dword[bil_pembagi]
	fst dword[bil_pembagi]
	
	fld dword[nilaiS1+8]
	fld dword[bil_pembagi]
	fdiv
	fstp dword[nilaiS1+8]
	
	fld dword[nilaiS1]
	fld dword[nilaiS1]
	fmul
	fstp dword[nilaiS1]
	
	fld dword[nilaiS1+8]
	fld dword[nilaiS1+8]
	fmul
	fstp dword[nilaiS1+8]
	
	fld dword[nilaiS1]
	fld dword[nilaiS1+8]
	fsub
	fstp dword[tinggi]
	
	fld dword[tinggi]
	fsqrt
	fstp dword[tinggi]
	
	jmp luas_kaki_final

luas_sembarang:
	fild dword[jumlah]
	fst dword[jumlah]
	
	mov dword[bil_pembagi], 2
	fild dword[bil_pembagi]
	fst dword[bil_pembagi]
	
	fld dword[jumlah]
	fld dword[bil_pembagi]
	fdiv
	fst dword[jumlah]
	
	fild dword[nilaiS1]
	fst dword[nilaiS1]
	
	fild dword[nilaiS1+4]
	fst dword[nilaiS1+4]
	
	fild dword[nilaiS1+8]
	fst dword[nilaiS1+8]
	
	;akar(s(s-a)(s-b)(s-c))
	
	fld dword[jumlah]
	fld dword[nilaiS1]
	fsub
	fstp dword[nilaiS1]
	
	fld dword[jumlah]
	fld dword[nilaiS1+4]
	fsub
	fstp dword[nilaiS1+4]
	
	fld dword[jumlah]
	fld dword[nilaiS1+8]
	fsub
	fstp dword[nilaiS1+8]
	
	fld dword[jumlah]
	fld dword[nilaiS1]
	fmul
	fstp dword[jumlah]
	
	fld dword[jumlah]
	fld dword[nilaiS1+4]
	fmul
	fstp dword[jumlah]
	
	fld dword[jumlah]
	fld dword[nilaiS1+8]
	fmul
	fstp dword[jumlah]
	
	fld dword[jumlah]
	fsqrt
	fstp qword[cetak]
	
	jmp luas_cetak

luas_cetak:
	push dword[cetak+4]
	push dword[cetak]
	push formatluas
	call printf
	add esp, 12
	
	ret