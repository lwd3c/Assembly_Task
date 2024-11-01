include Irvine32.inc

; chuyen doi co so k sang co so 10: N(10) = an * k^n + a(n-1) * k^(n-1) + ... + a1 * k^1 + a0 * k^0

.data
    msg BYTE "Nhap co so k (2-16): ", 0
    msg2 BYTE "Nhap so trong co so k: ", 0
    msg3 BYTE "Gia tri trong he thap phan la: ", 0
    base DWORD ?               
    knum BYTE 20 DUP(0)  
    dnum DWORD 0       

.code
main PROC
 ; nhap co so k
    lea edx, msg
    call WriteString
    call ReadDec
    mov base, eax             
 ; nhap so
    lea edx, msg2
    call WriteString
    mov edx, OFFSET inputNumber
    moc ecx, 50
    call ReadString

    ; Chuyen doi chuoi sang he thap phan
    mov ecx, 0               
    mov esi, OFFSET inputNumber 
    xor ebx, ebx             

convert_loop:
    movzx eax, BYTE PTR [esi]  
    cmp eax, 0                
    je end_conversion          

   
    sub eax, '0'            
    cmp eax, 9
    jbe valid_digit            
    sub eax, 7               

valid_digit:
  
    mov edx, base             
    mov ebx, 1              
    mov edi, ecx              

    mov ecx, 0                
    lea esi, inputNumber      

calculate_power:
    cmp ebx, 0                 
    jz end_calculate_power      
    mul edx                  
    dec ebx                  
    jmp calculate_power

end_calculate_power:
  
    add edi, eax              
    inc esi                    
    jmp convert_loop

end_conversion:
    mov edx, OFFSET resultMsg
    call WriteString
    mov eax, ecx             
    call WriteDec              
    call Crlf

    exit
main ENDP
END main
