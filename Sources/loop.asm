INCLUDE Irvine32.inc

.386

.stack 100h

.data
	count DWORD 1000
	msg1 DB "Tong 1000 so dau tien la: ", 0

.code
main proc
	mov ecx, count
	mov eax, 0
	call dumpregs
	L1:
		add eax, ecx
		call writeDec
		call Crlf
		loop L1
	
	lea edx, offset msg1
	call writeString
	call writeDec
	call Crlf
	call waitmsg
	
main endp
end main


	