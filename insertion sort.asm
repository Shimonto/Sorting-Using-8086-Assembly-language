; simple insertion sort for single digits

.model small 
.stack 100h
.data

arr db '7','2','1','5','4','6','3','7','2','8'

arrsiz dw 10 
size dw ? 
n dw 2  
siz dw ?

.code 
 main proc    
      
      mov ax,@data    ; access all the variable in data segment
      mov ds,ax
      
             
            lev0:

            mov dx,arrsiz
            mov siz,dx
            
            sub siz,1
            
            mov si, offset arr
            
            lop1:
                  
            mov di,si
            inc di 
            
            
            lop2:
            
            mov cl,[si]
            mov bl,[di]      
            cmp bl,cl
            jl swp
            jmp notswp
            swp:
            mov [si],bl
            mov [di],cl
             
            notswp:
            
            
            inc di
            cmp di,arrsiz
            je lv2

            jmp lop2
            
            
            lv2:  
            inc si
            cmp si,siz
            je lev

            jmp lop1 
                  
             
            lev:
            
            
            mov si, offset arr
            lop3:     
            mov dl,[si] 
            mov ah,2
            int 21h
          
            mov dl,32
            mov ah,2
            int 21h
            
            inc si
            
            cmp si,arrsiz
            je exit

            jmp lop3 
            
                    
            
exit:
mov ah,04ch
int 21h
           
main endp
end main  

