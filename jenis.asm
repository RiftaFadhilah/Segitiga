jenis:
;bukan segitiga
    mov eax,0
    cmp [nilaiS1],eax
    jle kondisi1    ;kurang dari samadengan
    cmp [nilaiS2],eax
    jle kondisi1
    cmp [nilaiS3],eax
    jle kondisi1
    
    mov eax,[nilaiS1]
    add eax,[nilaiS2]
    cmp eax,[nilaiS3]
    jl kondisi1     ;kurang dari
    
    mov eax,[nilaiS2]
    add eax, [nilaiS3]
    cmp eax,[nilaiS1]
    jl kondisi1
    
    mov eax,[nilaiS1]
    add eax,[nilaiS3]
    cmp eax,[nilaiS2]
    jl kondisi1
    
;else if
    mov ebx,[nilaiS2]
    mov ecx,[nilaiS3]
    cmp [nilaiS1],ebx
    je kondisi2         ;sama dengan
    cmp ebx,ecx
    je kondisi3
    cmp [nilaiS1],ecx
    je kondisi3a
    ;printf segitiga sembarang
    jmp kondisi4
    
kondisi1:
    call bukansegi ;printf bukan segitiga
    mov dword[jenis_segitiga], 0
    ret
    
kondisi2:
    mov ecx,[nilaiS2]
    cmp ecx,[nilaiS3]
    je kondisi2a
    call samakaki;printf sama kaki
    mov dword[jenis_segitiga], 2
    ret
    
kondisi2a:
    call samasisi ;printf sama sisi
    mov dword[jenis_segitiga], 1
    ret
    
kondisi3: 
    call samakaki;printf samakaki
    mov dword[jenis_segitiga], 2
    ret
    
kondisi3a:
    call samakaki;printf samakaki
    mov dword[jenis_segitiga], 2
    ret
    
kondisi4:
    call sembarangkaki
    mov dword[jenis_segitiga], 3
    ret
                                                                                                                                                         