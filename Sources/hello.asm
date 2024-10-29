INCLUDE Irvine32.inc

.386

.stack 100h

.data
	TB DB "Hello World !", 0

.code
	main proc
	
	mov edx, offset TB
	call writeString
	call Crlf
	call WaitMsg

	main endp
end main
