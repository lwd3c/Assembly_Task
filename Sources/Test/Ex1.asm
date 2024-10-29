include Irvine32.inc

.data
	msg BYTE "Nhap vao yyyydd (yyyy la nam sinh, dd la ngay sinh): ", 0
	msg1 BYTE "YES", 0
	msg2 BYTE "NO", 0
	msg3 BYTE "Kiem tra nam nhuan: ", 0
	msg4 BYTE "Kiem tra so nguyen to: ", 0
	val1 DWORD ?
	year DWORD ?

.code
	main proc
	; nhap input
		lea edx, msg
		call writestring
		call readdec
		mov val1, eax		; val1 = yyyydd

	; tach yyyydd thanh yyyy va dd
		mov ebx, 100
		cdq
		div ebx			; chia lay phan nguyen val1 cho 100
		mov year, eax		; year = yyyy

	; kiem tra so nguyen to
		call SoNguyenTo
		call crlf

	; kiem tra nam nhuan
		call namNhuan		

		exit
	main endp

; ham kiem tra so nguyen to
	SoNguyenTo proc
		lea edx, msg4
		call writestring

	; kiem tra dieu kien lon hon 1
		mov eax, val1
		cmp eax, 1
		jle KhongLaSoNguyenTo		; neu khong lon hon 1 -> khong la so nguyen to

	; kiem tra voi i = 2,3,4,..., (val1 / 2)
		mov eax, val1
		mov ebx, 2
		cdq
		div ebx			; tinh val1 / 2
		mov ecx, eax		; luu ket qua phan nguyen vao ecx
		mov edi, 2		; i = 2
	L1:
		mov eax, val1
		mov ebx, edi
		cdq
		div ebx				; tinh yyyydd % i
		cmp edx, 0			
		jz KhongLaSoNguyenTo	; kiem tra phan du, neu = 0 -> khong la so nguyen to
		inc edi				; i++
		loop L1

		lea edx, msg1			; neu khong co i thoa man yyyydd % i = 0 -> in ra thong bao "YES"
		call writestring
		ret

	KhongLaSoNguyenTo:			; in ra thong bao "NO"
		lea edx, msg2
		call writestring
		ret
	SoNguyenTo endp

; ham kiem tra nam nhuan
	namNhuan proc
		lea edx, msg3
		call writestring

		mov eax, year
		mov ebx, 400
		CDQ 
		div ebx				; tinh yyyy % 400
		cmp edx, 0			; neu = 0 -> la nam nhuan
		jz LaNamNhuan

		mov eax, year
		mov ebx, 100
		CDQ 
		div ebx				; neu khong, tinh yyyy % 100
		cmp edx, 0			; neu = 0 -> khong la nam nhuan
		jz KhongLaNamNhuan

		mov eax, year
		mov ebx, 4
		CDQ 
		div ebx				; neu khong, tinh yyyy % 4
		cmp edx, 0			; neu = 0 -> la nam nhuan 
		jz LaNamNhuan

	LaNamNhuan:				; in ra thong bao "YES"
		lea edx, msg1
		call writestring
		ret

	KhongLaNamNhuan:			; in ra thong bao "NO"
		lea edx, msg2
		call writestring
		ret 
	namNhuan endp

end main