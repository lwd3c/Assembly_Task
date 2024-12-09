include Irvine32.inc

.data
     msg1 BYTE "Nhap vao so he 10: ",0
     msg2 BYTE "So La Ma tuong ung: ",0
     num BYTE 50 DUP(0)

.code
main proc
    lea edx, msg1
    call writeString
    call readDec

    mov ebx, eax
    lea edi, num 
    call Compare

    lea edx, msg2
    call writeString
    lea edx, num 
    call writeString

    exit
main endp

Compare proc
    mov ecx, 1000   
    mov edx, 'M'         
    call Convert
    
    mov ecx, 900
    mov edx, 'MC'
    call Convert
    
    mov ecx, 500
    mov edx, 'D'
    call Convert
    
    mov ecx, 400
    mov edx, 'DC'
    call Convert
    
    mov ecx, 100
    mov edx, 'C'
    call Convert
    
    mov ecx, 90
    mov edx, 'CX'
    call Convert
    
    mov ecx, 50
    mov edx, 'L'
    call Convert
    
    mov ecx, 40
    mov edx, 'LX'
    call Convert
    
    mov ecx, 10
    mov edx, 'X'
    call Convert
    
    mov ecx, 9
    mov edx, 'XI'
    call Convert
    
    mov ecx, 5
    mov edx, 'V'
    call Convert
    
    mov ecx, 4
    mov edx, 'VI'
    call Convert
    
    mov ecx, 1
    mov edx, 'I'
    call Convert

    ret
Compare endp

Convert proc
    L1:
        cmp ebx, ecx          ; so sanh so nhap vao voi tung gia tri La Ma    
        jl Thoat               
        sub ebx, ecx          ; neu lon hon, tru di va luu gia tri La Ma tuong ung vao mang
        mov [edi], edx           
        inc edi              
        jmp L1
        
    Thoat:
        ret
Convert endp

end main