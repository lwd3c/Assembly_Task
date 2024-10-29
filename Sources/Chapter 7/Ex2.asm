include Irvine32.inc
; display binary bits
.data
	buffer BYTE 32 DUP(0), 0

.code
main proc
	mov eax, 12345678h
	mov ecx, 32
	lea esi, buffer
	L1:
		shl eax, 1
		mov BYTE PTR [esi], '0'
		jnc L2
		mov BYTE PTR [esi], '1'
	L2:
		inc esi
		loop L1

		lea edx, buffer
		call writestring

main endp
end main