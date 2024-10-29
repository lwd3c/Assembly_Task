; tinh tong cua 3 mang khac nhau voi 1 ham sum
include Irvine32.inc

.data
	array BYTE "2,3,4,5,6", 0
	array2 BYTE "7,8,9, 10,11", 0
	array3 BYTE "8,9,10,5,6,7,4", 0
	msg BYTE "Tong cac phan tu mang la: ", 0
.code
	main proc	
		lea edi,array
		mov ecx, LENGTHOF array
		xor eax, eax
	L1:
		add eax, [esi]
		add esi, TYPE array
		dec ecx
		cmp ecx, 0
		call dumpregs
		jnz L1

		lea edx, msg
		call writestring
		call writeDec
		exit
		

	main endp

	SUM proc
		
	SUM endp
end main	