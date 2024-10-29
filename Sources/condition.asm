include Irvine32.inc

.386

.stack 100h

.data
	msg1 DB "Nhap 1 so bat ki: ", 0
	msg2 DB "So vua nhap lon hon 10", 0
	msg3 DB "So vua nhap nho hon 10", 0

.code
	main proc
		mov edx, offset msg1
		call writestring
		call readDec

		mov ebx, 10
		cmp eax, ebx
		jg L1
		mov edx, offset msg3
		call writestring
		call Crlf
		exit
		
	L1:
		mov edx, offset msg2
		call writestring

	main endp
end main
