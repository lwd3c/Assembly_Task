include Irvine32.inc

; chuyen doi co so k sang co so 10: N(10) = an * k^n + a(n-1) * k^(n-1) + ... + a1 * k^1 + a0 * k^0

.data
    msg BYTE "Nhap Base: ", 0
    msg2 BYTE "Nhap so k: ", 0
    msg3 BYTE "So k trong co so 10: ", 0
    msg4 BYTE "So nhap vao chua ki tu khong hop le!", 0
    base DWORD ?				; co so 
    k_value BYTE 100 DUP(32)		; so ban dau
    d_value DWORD 0				; so he thap phan

.code
	main proc
	; nhap base
		lea edx, msg
		call WriteString
		call ReadDec
		mov base, eax    
    
	; nhap so ban dau k
		lea edx, msg2
		call WriteString
		lea edx, k_value
		mov ecx, 100
		call ReadString
		
	; chuyen doi ki tu ve so
		lea esi, k_value
		call ConvertCharToValue
	
	; chuyen doi co so
		lea esi, k_value
		mov eax, base
		call ConvertToDecimal

	; hien thi ket qua
		lea edx, msg3
		call WriteString
		mov eax, d_value
		call writeDec

	exit
	main endp

; chuyen ki tu ve so
	ConvertCharToValue proc
	    push esi                
	    ConvertLoop:
		   mov al, [esi]		
		   cmp al, 0			; thay the 00 0a bang 20
		   je Remove
		   cmp al, 32			; kiem tra ket thuc chuoi
		   je EndConvert
		
		; kiem tra chu so
		   cmp al, '0'			; 30h
		   jl InvalidChar        
		   cmp al, '9'
		   jle IsNumber   
		   
		; kiem tra chu in hoa
		   cmp al, 'A'			; 41h
		   jl InvalidChar        
		   cmp al, 'Z'
		   jle IsUpperChar     

		; kiem tra chu in thuong
		   cmp al, 'a'			; 61h
		   jl InvalidChar        
		   cmp al, 'z'
		   jle IsLowerChar    
		   jmp InvalidChar

	    Remove:
	        mov al, 32
		   mov [esi], al
		   inc esi
		   mov [esi], al
		   jmp EndConvert

	    IsNumber:
		   sub al, '0'         
		   jmp StoreValue

	    IsUpperChar:
		   sub al, 'A'       
		   add al, 10
		   jmp StoreValue

	    IsLowerChar:
		   sub al, 'a'       
		   add al, 10
		   jmp StoreValue

	    StoreValue:
		   mov [esi], al   
		   inc esi             
		   jmp ConvertLoop

	    InvalidChar:
		   lea edx, msg4
		   call writeString
		   exit

	    EndConvert:
		   pop esi             
		   ret
	ConvertCharToValue endp

; tinh gia tri Dec: N(10) = an * k^n + a(n-1) * k^(n-1) + ... + a1 * k^1 + a0 * k^0
	ConvertToDecimal proc
	    push esi
	    push eax                
	    xor ecx, ecx         ; do dai chuoi
	    xor ebx, ebx		; ket qua

; tinh do dai so
	FindLength:
	    cmp byte ptr [esi + ecx], ' '		; kiem tra ket thuc chuoi
	    je StartConvert
	    inc ecx
	    jmp FindLength

	StartConvert:
	    dec ecx					; vi tri so cuoi cung        

	ConvertLoop:
	    movzx eax, byte ptr [esi]		; gia tri tai vi tri hien tai
	    mov edi, base				
	    mov ebx, ecx				; chi so luy thua
	    cmp ebx, 0					; chi so bang 0 thi khong thuc hien luy thua
	    je AddValue

	PowerLoop:			; tinh luy thua
	    mul edi
	    dec ebx
	    cmp ebx, 0			; luy thua ve 0 thi thoat vong lap
	    jnz PowerLoop

	AddValue:				; luu gia tri sau chuyen doi
	    add d_value, eax  
	    dec ecx
	    inc esi
	    cmp byte ptr [esi], 32
	    jnz ConvertLoop

	    pop eax                
	    pop esi
	    ret
	ConvertToDecimal endp

end main
