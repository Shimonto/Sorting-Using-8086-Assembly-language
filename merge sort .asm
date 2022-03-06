include 'emu8086.inc'
.model small 
.stack 100h
.data

arr db '7','2','1','5','4','6','3'

arrsiz dw 7 
size dw ? 
n dw 2  
siz dw ?

.code 
 main proc    
      
      print 'Given unsorted array : '
      
      mov ax,@data    ; access all the variable in data segment
      mov ds,ax
            
            
            mov si, offset arr
            l1:     
            mov dl,[si] 
            mov ah,2
            int 21h
          
            mov dl,32
            mov ah,2
            int 21h
            
            inc si
            
            cmp si,arrsiz
            je sortlevel

            jmp l1 
            
            sortlevel:
         
            loop0:        ; start loop0
            
               
            mov dx,n      ; moves value of n in to dx register 
            mov size,dx   ; moves the value in size and siz variable
            mov siz,dx        
            sub siz,1      
            mov si, offset arr ; si points to the 1st index of arr
   
            loop1:        ;start loop1
                  
            mov di,si      ;  moves si to di 
            inc di         ; di points the next index 
            
            
            loop2:          ; start loop2
            
            mov cl,[si]     ; moves the value of index that si  
            mov bl,[di]     ; and di is pointing to cl and bl register  
            cmp bl,cl       ;compare the values in bl and cl 
            jl swap         ;jumps to swap level if value of bl is less than the value of cl
            jmp notswap     ;jumps to notswap level if upper condition is false 
            swap:           
            mov [si],bl     ; moves the values 
            mov [di],cl
             
            notswap:
            
            
            inc di         ; increase the di to point the next index to compare 
            cmp di,size    ; compare if the index number in di is equal to size 
            je lev2        ; jumps to lev2 and goes out of the loop2 if size is equal means of condition is true 

            jmp loop2      ; jumps to start of the loop2 if condition is not true  
            
            
            lev2:           
            inc si         ; increase si to point the next index of arr 
            cmp si,siz     ; compare si to siz and if equal it will go out of the loop  
            je lev1        ; jumps to lev1 if equal 

            jmp loop1      ; jumps to start of the loop1 if the upper condition if not true  
            
             
            lev1: 
            
            mov dx,n       ; moves the value of n in to dx reg
            add dx,dx      ; increase the value of dx to sort between 2 sorted array and merge them 
            mov n,dx       ; moves the value of dx to n  
            cmp dx,arrsiz  ; compare the value to array size 
            jg lev0        ; jumps to lev0 of dx is gretter than the array size 
            
            jmp loop0      ; jumps to start of the loop0 if condition is false to continue 
            
     
             
            ;sorted value and unsorted values are sorted hear togather
             
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
            
       
      ; prints new line     
      mov dl,10 
      mov ah,2
      int 21h

      mov dl,13
      mov ah,2
      int 21h
            
            
            print 'Sorted array : '
            
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

