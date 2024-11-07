include Irvine32.inc

; chuyen doi co so k sang co so 10: N(10) = an * k^n + a(n-1) * k^(n-1) + ... + a1 * k^1 + a0 * k^0

.data
    msg BYTE "Enter Base K (2-36): ", 0
    msg2 BYTE "Enter Base K value: ", 0
    msg3 BYTE "Decimal value: ", 0
    base DWORD ?				; co so 
    k_value BYTE 20 DUP(?)		; so ban dau
    d_value DWORD 0				; so he thap phan

.code
	main PROC
	; nhap co so k
		lea edx, msg
		call WriteString
		call ReadDec
		mov base, eax    
    
	; nhap so ban dau
		lea edx, msg2
		call WriteString
		lea edx, k_value
		mov ecx, 20
		call ReadString

	; chuyen doi ki tu ve so
		lea esi, k_value
		call CharToValue
  

	exit
	main endp

	CharToValue proc
	; chuyen ve dang so
		mov ecx, 9
		Number:
			push ecx
			mov al, [esi]
			cmp al, 0
			jz End_Convert
			cmp al, 'A'
			je caseA

			sub al, '0'
			L1:	
				cmp al, cl
				je Convert
				dec ecx
				jmp L1

		Convert:
			mov [esi], al
			inc esi
			pop ecx
			jmp Number
		
		End_Convert:
			ret
	CharToValue endp


end main
