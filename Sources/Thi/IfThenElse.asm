include Irvine32.inc

; the hien lai bo cau truc if...then...else trong ngon ngu C

.data
    val1 DWORD ?  
    val2 DWORD ?
    result DWORD ?   
    tb1 BYTE "Nhap a: ", 0
    tb2 BYTE "Nhap b: ", 0
    msg1 BYTE "a < b. Thuc hien: a + b =  ", 0
    msg2 BYTE "a = b. Thuc hien: a * b =  ", 0
    msg3 BYTE "a > b. Thuc hien: a - b =  ", 0

.code
	main proc
	    lea edx, tb1
	    call writestring
	    call readdec
	    mov val1, eax

	    lea edx, tb2
	    call writestring
	    call readdec
	    mov val2, eax

	    mov eax, val1               
	    mov ebx, val2                  
	    cmp eax, ebx             
	    jl  Less              
	    je  Equal                  

	Greater:
	    sub eax, ebx              
	    mov result, eax            
	    lea edx, msg3       
	    call WriteString
	    mov eax, result
	    call WriteDec              
	    jmp Thoat                

	Less:
	    add eax, ebx                
	    mov result, eax            
	    lea edx, msg1       
	    call WriteString
	    mov eax, result
	    call WriteDec              
	    jmp Thoat                

	Equal:
	    imul eax, ebx            
	    mov result, eax          
	    lea edx, msg2     
	    call WriteString
	    mov eax, result
	    call WriteDec              

	Thoat:
	    call Crlf               
	    exit
	main endp
end main

