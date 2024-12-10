include Irvine32.inc

; the hien lai bo cau truc Switch cua ngon ngu C

.data
	msg BYTE "Enter your option (1-3): ", 0
	choice DWORD ?            
	msg1 BYTE "This is option 1 !", 0
	msg2 BYTE "This is option 2 !", 0
	msg3 BYTE "This is option 3 !", 0
	default BYTE "This is an invalid option !", 0

.code
	main proc
	; nhap choice
		lea edx, msg
		call writestring
		call readdec
		mov choice, eax

	; switch
	     cmp choice, 1           
	     je  option1             

	     cmp choice, 2          
	     je  option2             

	     cmp choice, 3           
	     je  option3             

	     jmp defaultoption        
	
	; opitons
	option1:
		lea edx, msg1
		call writestring
		jmp endSwitch           

	option2:
		lea edx, msg2
		call writestring
	     jmp endSwitch            

	option3:
		lea edx, msg3
		call writestring
	     jmp endSwitch          

	defaultoption:
		lea edx, default
		call writestring

	endSwitch:
	call crlf
		exit

	main endp
end main
