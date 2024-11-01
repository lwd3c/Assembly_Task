include Irvine32.inc

; the hien cau truc for ngon ngu C

.data
    msg BYTE "i = ", 0

.code
	main proc
	    mov ecx, 0                ; i = 0

	for_start:
	    cmp ecx, 10              
	    jg for_end              

	    lea edx, msg       
	    call WriteString
	    mov eax, ecx              
	    call WriteDec           
	    call Crlf                
	    inc ecx                   ; i++
	    jmp for_start             

	for_end:
	    exit                      
	main endp
end main
