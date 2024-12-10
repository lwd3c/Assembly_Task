include Irvine32.inc

; CMYK to RGB

.data
    msgC  BYTE "Nhap gia tri C (0-255): ", 0
    msgM  BYTE "Nhap gia tri M (0-255): ", 0
    msgY  BYTE "Nhap gia tri Y (0-255): ", 0
    msgK  BYTE "Nhap gia tri K (0-255): ", 0
    msgR  BYTE "Gia tri R: ", 0
    msgG  BYTE "Gia tri G: ", 0
    msgB  BYTE "Gia tri B: ", 0

    ColorC DWORD 0        ; Cyan
    ColorM DWORD 0        ; Magenta
    ColorY DWORD 0        ; Yellow
    ColorK DWORD 0        ; Black
    ColorR DWORD 0        ; Red 
    ColorG DWORD 0        ; Green 
    ColorB DWORD 0        ; Blu 

.code
main proc
	; Nhap C
	    lea edx, msgC
	    call WriteString
	    call ReadDec
	    mov ColorC, eax      

    ; Nhap M
	    lea edx, msgM
	    call WriteString
	    call ReadDec
	    mov ColorM, eax        

    ; Nhap Y
	    lea edx, msgY
	    call WriteString
	    call ReadDec
	    mov ColorY, eax      

    ; Nhap K
	    lea edx, msgK
	    call WriteString
	    call ReadDec
	    mov ColorK, eax      

    ; Tinh R = 255 * (255 - C) * (255 - K) / (255 * 255)
	    mov eax, 255
	    sub eax, ColorC        ; eax = 255 - C
	    mov ebx, 255
	    sub ebx, ColorK        ; ebx = 255 - K
	    imul ebx			  ; eax = (255 - C) * (255 - K)
	    mov ebx, eax	       ; ebx = (255 - C) * (255 - K)              
	    mov eax, 255
	    imul eax		  ; eax = 255 * 255
	    mov ecx, eax	  ; ecx = 255 * 255
	    mov eax, ebx	  ; eax = (255 - C) * (255 - K)
	    cdq 
	    div ecx          ; eax = [(255 - C) * (255 - K)] / (255 * 255)
	    mov ebx, 255
	    imul ebx
	    mov ColorR, eax        

    ; Tinh G = 255 * (255 - M) * (255 - K) / (255 * 255)
	    mov eax, 255
	    sub eax, ColorM        ; eax = 255 - M
	    mov ebx, 255
	    sub ebx, ColorK        ; ebx = 255 - K
	    imul ebx			  ; eax = (255 - M) * (255 - K)
	    mov ebx, eax	       ; ebx = (255 - M) * (255 - K)              
	    mov eax, 255
	    imul eax		  ; eax = 255 * 255
	    mov ecx, eax	  ; ecx = 255 * 255
	    mov eax, ebx	  ; eax = (255 - M) * (255 - K)
	    cdq 
	    div ecx          ; eax = [(255 - M) * (255 - K)] / (255 * 255)
	    mov ebx, 255
	    imul ebx
	    mov ColorG, eax    

    ; Tinh B = 255 * (255 - Y) * (255 - K) / (255 * 255)
	    mov eax, 255
	    sub eax, ColorY        ; eax = 255 - Y
	    mov ebx, 255
	    sub ebx, ColorK        ; ebx = 255 - K
	    imul ebx			  ; eax = (255 - Y) * (255 - K)
	    mov ebx, eax	       ; ebx = (255 - Y) * (255 - K)              
	    mov eax, 255
	    imul eax		  ; eax = 255 * 255
	    mov ecx, eax	  ; ecx = 255 * 255
	    mov eax, ebx	  ; eax = (255 - Y) * (255 - K)
	    cdq 
	    div ecx          ; eax = [(255 - Y) * (255 - K)] / (255 * 255)
	    mov ebx, 255
	    imul ebx
	    mov ColorB, eax        

    ; Hien thi R
	    lea edx, msgR
	    call WriteString
	    mov eax, ColorR
	    call WriteDec
	    call Crlf

    ; Hien thi G
	    lea edx, msgG
	    call WriteString
	    mov eax, ColorG
	    call WriteDec
	    call Crlf

    ; Hien thi B
	    lea edx, msgB
	    call WriteString
	    mov eax, ColorB
	    call WriteDec
	    call Crlf

    exit
main endp
end main
