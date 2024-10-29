include Irvine32.inc

.data
	msg1 BYTE "Nhap so nguyen thu nhat: ", 0
	msg2 BYTE "Nhap so nguyen thu hai: ", 0
	msg3 BYTE "Tong 2 so nguyen vua nhap la: ", 0

.code
	main proc
		call Clrscr 
		lea edx, msg1
		call writestring
		call readDec
		mov ebx, eax

		lea edx, msg2
		call writestring
		call readDec
		add eax, ebx

		lea edx, msg3
		call writestring
		call writeDec
		exit
	main endp
end main