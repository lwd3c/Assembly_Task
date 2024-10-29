include Irvine32.inc

.data
	msg BYTE "Hello World !", 0
.code
	main proc
		lea edx, msg
		call writestring
		call crlf
	main endp
end main