INCLUDE Irvine32.inc

.386

.stack 100h

.data
	msg1 DB "Nhap vao so thu nhat: ", 0
	msg2 DB "Nhap vao so thu hai: ", 0
	msg3 DB "Tich cua 2 so la: ", 0
	msg4 DB "Thuong cua 2 so la: ", 0
	val1 DWORD ?
.code
	main proc
		mov edx, offset msg1
		call writeString
		call readDec
		mov val1, eax

		mov edx, offset msg2
		call writeString
		call readDec
		mov ebx, eax
		mul val1
		
		call DumpRegs

		mov edx, offset msg3
		call writeString
		call writeDec
		call Crlf

		mov edx, offset msg4
		call writeString
		mov eax, val1
		CDQ
		div ebx
		call writeDec

		call crlf
		call WaitMsg
	main endp
end main