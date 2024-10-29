include Irvine32.inc

.data
	val1 SDWORD 8
	val2 SDWORD 15
	val3 SDWORD 20

.code
	main proc
		mov eax, val2			; eax = 0000000Fh
		neg eax				; eax = FFFFFFF1h
		add eax, 7			; eax = FFFFFFF8h
		sub eax, val3			; eax = FFFFFFE4h
		add eax, val1			; eax = FFFFFFECh
		call dumpregs
	
		exit
	main endp
end main