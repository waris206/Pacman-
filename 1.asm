include irvine32.inc
include macros.inc
includelib Winmm.lib
bsize = 1000
.data
 line1 byte"|  __ \ /\   / ____|  \/  |   /\   | \ | |",0
line2 byte "| |__) /  \ | |    | \  / |  /  \  |  \| |",0
line3 byte "|  ___/ /\ \| |    | |\/| | / /\ \ | . ` |",0
line4 byte "| |  / ____ | |____| |  | |/ ____ \| |\  |",0
line5 byte "|_| /_/    \_\_____|_|  |_/_/    \_|_| \_|",0

PlaySound PROTO,
pszSound:PTR BYTE, 
hmod:DWORD, 
fdwSound:DWORD
 

death db  "pacman_death.wav",0
file12 BYTE "movement.wav",0
begin_sound byte "pacman_beginning.wav",0
fruit_sound byte "pacman_eatfruit.wav",0
mission byte "pacman_intermission.wav",0
overss byte "game_over.wav",0
  exit_screen       db'                                                                            ',13,10
                    db'                             $$$$$$$$\ $$\   $$\ $$$$$$\ $$$$$$$$\              ',13,10
                    db'                             $$  _____|$$ |  $$ |\_$$  _|\__$$  __|             ',13,10
                    db'                             $$ |      \$$\ $$  |  $$ |     $$ |                ',13,10
                    db'                             $$$$$\     \$$$$  /   $$ |     $$ |                ',13,10
                    db'                             $$  __|    $$  $$<    $$ |     $$ |                ',13,10
                    db'                             $$ |      $$  /\$$\   $$ |     $$ |                ',13,10
                    db'                             $$$$$$$$\ $$ /  $$ |$$$$$$\    $$ |                ',13,10
                    db'                             \________|\__|  \__|\______|   \__|                ',13,10
                    db 0

 gameover_screen db  ' ______                        ____',13,10                
                  db '/ ________ _____ ___  ___     / __ \_   _____  _____',13,10
                 db '/ / __/ __ `/ __ `__ \/ _ \   / / / | | / / _ \/ ___/',13,10
                db '/ /_/ / /_/ / / / / / /  __/  / /_/ /| |/ /  __/ /',13,10 
                db '\____/\__,_/_/ /_/ /_/\___/   \____/ |___/\___/_/',13,10
                db 0

 
win1 db ' \o       o/                             o              o     o              ',13,10
     db '  v\     /v                             <|>            <|>  _<|>_            ',13,10
     db '   <\   />                              / \            / \                   ',13,10
     db '     \o/    o__ __o     o       o       \o/            \o/    o    \o__ __o  ',13,10
     db '      |    /v     v\   <|>     <|>       |              |    <|>    |     |> ',13,10
     db '     / \  />       <\  < >     < >      < >            < >   / \   / \   / \ ',13,10
     db '     \o/  \         /   |       |        \o    o/\o    o/    \o/   \o/   \o/ ',13,10
     db '      |    o       o    o       o         v\  /v  v\  /v      |     |     |  ',13,10
     db '     / \   <\__ __/>    <\__ __/>          <\/>    <\/>      / \   / \   / \ ',13,10
 db 0                                                                           
                                                                             
                                                                             





v1 byte ?
v2 byte ?
b1 byte 0
b2 byte 0
temp111 Dword ?
g_num byte 1
g_num1 byte 1
g_num2 byte 3
g_num3 byte 4
newline db 0Dh, 0Ah, 0
arr db bsize dup(?)
naming db 100 dup(?)
temp11 db bsize dup(?)
temp12 db bsize dup(?)
bestPlayer db bsize dup(?)
Player Dword ?
origin db bsize dup(?)
temp_flag_2  db ?
handler HANDLE ?
file db "inst.txt",0
file1 db "name.txt",0
file4 db "Best.txt",0
scoring db "Your score  ",0
livestr db "Lives ",0
Live db 3
Score word 0
score_arr db 300 dup (0)
file3 db "Score_saving.txt",0
fruit1 db "@",0
fruitx1 db 115
fruity1  db  3
palletx1 db 113
pallety1  db  23
power_timer DWORD 0
temp dword ?
plus  byte 0deh,0
set_beap db 0
xPos byte  40
yPos byte  16
ghostx db  70
ghosty db  16
ghostx1 db  5
ghosty1 db  5
currentx db ?
currenty db ?
currentx1 db ?
currenty1 db ?
ghostx2  db 5
ghosty2  db 5
currentx2 db ?
currenty2 db ?
ghostchar db '$',0
tempchar db ?
obstacle db  0dbh,0ah, 0
index_x db 3332 dup(-1)
index_y db 3332 dup(-1)
loopVarCoin db 30
xCoinPos BYTE ?
yCoinPos BYTE ?
holding_location db ?
tempx db ?
tempy db ?
sss db bsize dup (0)
levelc db     '_        _______           _______  _          _______  _        _______  _______  _______  _______  ______ ',13,10 
      db      '( \      (  ____ \|\     /|(  ____ \( \        (  ____ \( \      (  ____ \(  ___  )(  ____ )(  ____ \(  __  \ ',13,10
       db     '| (      | (    \/| )   ( || (    \/| (        | (    \/| (      | (    \/| (   ) || (    )|| (    \/| (  \  ) ',13,10
      BYTE    '| |      | (__    | |   | || (__    | |        | |      | |      | (__    | (___) || (____)|| (__    | |   ) | ',13,10
      BYTE    '| |      |  __)   ( (   ) )|  __)   | |        | |      | |      |  __)   |  ___  ||     __)|  __)   | |   | | ',13,10
      BYTE    '| |      | (       \ \_/ / | (      | |        | |      | |      | (      | (   ) || (\ (   | (      | |   ) | ',13,10
      BYTE    '| (____/\| (____/\  \   /  | (____/\| (____/\  | (____/\| (____/\| (____/\| )   ( || ) \ \__| (____/\| (__/  )  ',13,10
       BYTE   '(_______/(_______/   \_/   (_______/(_______/  (_______/(_______/(_______/|/     \||/   \__/(_______/(______/  ',13,10

storage Dword ?
  ; blocks array
  block1x db 9
  block1y db 10,11,12,13,14,15,16,17,18,19
  
  block2x db 110

  block3x db 10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
  block3y db 10

  block4x db 90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111
  block4y db 11

  block5x db 50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70
  block5y db 7

  block6x db 45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65
  block6y db 24

  flag_for_level2 db 0
  flag_for_level3 db 0

.code 
 main proc
 call start_game  ; this is jsut print our pacman as show start of ggame 
 call asking 
  
  ret
 main endp

  ; ********************start_game fucntion *******************
   start_game proc
    mov eax,yellow 
    call SetTextColor
    mov dl, 35
    mov dh, 10
    call Gotoxy
    mov edx, offset line1
    call writestring
    mov eax, 220
    call Delay
    mov dl, 35
    mov dh, 11
    call Gotoxy
    mov edx, offset line2
    call writestring
    mov eax, 220
    call Delay
    mov dl, 35
    mov dh, 12
    call Gotoxy
    mov edx, offset line3
    call writestring
    mov eax, 220
    call Delay
    mov dl, 35
    mov dh, 13
    call Gotoxy
    mov edx, offset line4
    call writestring
    mov eax, 220
    call Delay
    mov dl, 35
    mov dh, 14
    call Gotoxy
    mov edx, offset line5
    call writestring
    mov eax, 1000
    call Delay
    call clrscr
     mov eax, white
    call SetTextColor

    ret
   start_game endp
   ;----------------------------ending of start_game proc -----------------------

                        ; ********************asking fucntion *******************
 asking proc
 call clrscr
 INVOKE PlaySound, OFFSET begin_sound , NULL, 1
 l1:
  mov dl ,35
  mov dh ,9
  call gotoxy
  mov eax ,green
  call settextcolor
   mwrite "playing game (Press 1 )"
   call crlf
    mov dl ,35
    mov dh ,12
    call gotoxy
    mov eax ,yellow
  call settextcolor
   mwrite "For instructions  (Press 2 )"
      call crlf
      mov dl ,35
      mov dh ,15
     call gotoxy
     mov eax ,red
  call settextcolor
    mwrite "Quit game (Press 3 )"
    call crlf
    mov dl ,35
      mov dh ,18
     call gotoxy
     mov eax ,CYAN
  call settextcolor
    mwrite"Highest Score (Press 4)"
    call crlf
    mov eax ,white
    call settextcolor
    mwrite "Enter your choice "
    call crlf
    call readchar
    cmp al ,'1'
    je game_proc
    cmp al ,'2'
    je instruction_proc
    cmp al ,'3'
    je exit_proc
    cmp al ,'4'
    je display_highScore
    mwrite "you choose invalid choice .. choose one of these"
    call crlf
    mov eax,2000
    call delay
    jmp l1
    ret
 asking endp

 ;---------------------------- asking proc ending ----------------------

                    ;*******************  game_proc start here ******************

 game_proc proc
   ; first here we ask..for name .. so put in file also ..
     call name_proc
     call scoring_proc
     call lives_proc
     call DrawCoin
     call draw_player_proc
    call draw_ghost_proc
    call draw_ghost_proc1
    call draw_ghost_proc2
    call draw_obstacles_proc
     call  Drawboundaries
     INVOKE PlaySound, OFFSET file12, NULL, 1
     ; here main code for this proc is starting it about movement now 
     Gameloop:
     
     mov al,ghostx
     mov currentx ,al
     mov al,ghosty
     mov currenty,al
     call update_ghost_ll
     mov al,ghostx1
     mov currentx1 ,al
     mov al,ghosty1
     mov currenty1,al
     call update_ghost_ll2
     mov al,ghostx2
     mov currentx2 ,al
     mov al,ghosty2
     mov currenty2,al
     call update_ghost_ll3
      call   readchar
      cmp al,'x'
      je exit_proc
      cmp al,'p'
      je pause1
      cmp al ,'a'
      je move_left
      cmp al ,'d'
      je move_right
      cmp al,'w'
      je move_up
      cmp al,'s'
      je move_down
      jmp Gameloop
      ;-------------- left side movement ----------------
 move_left:
 ;INVOKE PlaySound, OFFSET file12, NULL, 1
 mov holding_location , 'a'
 call obstacles_checkingL
      cmp cl,0
      je  l1
      jmp l2
l1:
    call check_for_ghost
    cmp cl,0
    je l3
    jmp l2
   
l3:
   call check_for_ghost1
   cmp cl,0
   je l4
   jmp l2
l4:
   call updatePlayer
    dec xPos
    cmp xPos ,1
    jle resetL
    call draw_player_proc
    call updatescore
   ; call update_ghost_ll
    jmp Gameloop
l2:
    jmp Gameloop
 resetL:
    call updatePlayer 
      inc xPos
      call draw_player_proc
      jmp Gameloop

           ;-------------- right  side movement ----------------
 move_right:
 ;INVOKE PlaySound, OFFSET file12, NULL, 1
 mov holding_location , 'd'
 call obstacles_checkingR
      cmp cl,0
      je  r1
      jmp r2
r1:
   call check_for_ghost
    cmp cl,0
    je r3
    jmp r2
r3:
  call check_for_ghost1
  cmp cl,0
  je r4
  jmp r2
r4:
  call updatePlayer
    inc xPos
    cmp xPos ,118
    jge resetR
    
    call draw_player_proc
    call updatescore
    ;call update_ghost_ll
    jmp Gameloop
r2:
   jmp Gameloop
 resetR:
    call updatePlayer 
      dec xPos
      call draw_player_proc
      jmp Gameloop


           ;-------------- up side movement ----------------
 move_up:
 ;INVOKE PlaySound, OFFSET file12, NULL, 1
  mov holding_location , 'w'
 call obstacles_checkingU
      cmp cl,0
      je  u1
      jmp u2
u1:
   call check_for_ghost
    cmp cl,0
    je u3
    jmp u2
u3:
   call check_for_ghost1
   cmp cl,0
   je u4
   jmp u2
u4:
   call updatePlayer
    dec yPos
    cmp yPos ,2
    jle resetU
   ; call update_ghost_ll
    call draw_player_proc
    call updatescore
    jmp Gameloop
u2:
   jmp Gameloop
 resetU:
    call updatePlayer 
      inc yPos
      call draw_player_proc
      jmp Gameloop
           ;-------------- down  side movement ----------------
 move_down:
 ;INVOKE PlaySound, OFFSET file12, NULL, 1
 mov holding_location ,'s'
 call obstacles_checkingD
      cmp cl,0
      je  d1
      jmp d2
d1:
    call check_for_ghost
    cmp cl,0
    je d3
    jmp d2
d3:
    call check_for_ghost1
    cmp cl,0
    je d4
    jmp d2
d4:
    call updatePlayer
    inc yPos
    cmp yPos ,28
    jge resetD
    call draw_player_proc
    call updatescore
    ;call update_ghost_ll
    jmp Gameloop
d2:
   jmp Gameloop
 resetD:
    call updatePlayer 
      dec yPos
      call draw_player_proc
      jmp Gameloop
pause1:

 wait_loop:
  ; INVOKE PlaySound, OFFSET file12, NULL, 1
    call ReadChar
    cmp al, 'r'          
    jne wait_loop 
    jmp Gameloop
   
 ret
 game_proc endp
  ;-------------------------- game_proc ending ------------------------
updateGhost1 proc
  mov dl,ghostx
  mov dh ,ghosty
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots
  cmp cl,1
  je ll1
  jmp ll2
ll1:
  mov al,'.'
  call writechar
  dec ghostx
  call draw_ghost_proc
  add g_num,1  ; first case
  
  ret
ll2:
mov al,' '
  call writechar
  dec ghostx
  call draw_ghost_proc
  add g_num,1  ; first case
  ret
updateGhost1 endp

updateGhost2 proc
  mov dl,ghostx
  mov dh ,ghosty
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots
  cmp cl,1
  je tt1
  jmp tt2
tt1:
  mov al,'.'
  call writechar
  inc ghostx
  call draw_ghost_proc
    add g_num,1
  ret
tt2:
 mov al,' '
  call writechar
  inc ghostx
  call draw_ghost_proc
    add g_num,1
  ret

updateGhost2 endp

updateGhost3 proc
  mov dl,ghostx
  mov dh ,ghosty
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots
  cmp cl,1
  je three1
  jmp three2
three1:
  mov al,'.'
  call writechar
  dec ghosty
  call draw_ghost_proc
    add g_num,1
  ret
three2:
  mov al,' '
  call writechar
  dec ghosty
  call draw_ghost_proc
    add g_num,1
  ret

updateGhost3 endp

updateGhost4 proc
  mov dl,ghostx
  mov dh ,ghosty
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots
  cmp cl,1
  je fort1
  jmp fort2
fort1:
  mov al,'.'
  call writechar
  inc ghosty
  call draw_ghost_proc
    add g_num,1
  ret
 fort2:
  mov al,' '
  call writechar
  inc ghosty
  call draw_ghost_proc
    add g_num,1
  ret

updateGhost4 endp
;###########################################################################################################
 update_ghost_ll proc
 cmp Score ,710
 je reset
 cmp Score,890
 je reset
 jmp proceed
reset:
  call update_ghost_proccc
   mov bl,70
   mov bh,16
   mov ghostx ,bl
   mov ghosty ,bh
proceed:
  call obstacles_checkingLG
  cmp cl,0
  je move_it ; mean no issue if jumo here
  jmp for_right
  move_it:
  cmp g_num,11
  jl con
  jmp for_right
con:
   call updateGhost1
   ret
for_right:
      ; mean here can not move in left side  ao start right side 
      call obstacles_checkingRG
      cmp cl,0
      je move_can_be
      jmp for_up
move_can_be:
    cmp g_num,11
    jge check1

    jmp for_up
check1:
     cmp g_num,19
     jle con1
     jmp for_up
con1:
    call updateGhost2
    ret
for_up:
      call obstacles_checkingUG
      cmp cl,0
      je move_itt
      jmp for_down
move_itt:
    cmp g_num,20
    jge checkk2
    jmp for_down
checkk2:
     cmp g_num,26
     jl con2
     jmp for_down
con2:
    call updateGhost3
    ret
for_down:
    call obstacles_checkingDG
      cmp cl,0
      je move_down_way
      jmp l1
move_down_way:
    cmp g_num,26
    jge checkk3
    jmp l1
checkk3:
   cmp g_num,32
   jl con4
   jmp l1
con4:
    call updateGhost4
    ret
l1:
   mov g_num,1
   ret
  update_ghost_ll endp
  ;------------------- update player proc is here ----------------------
  updatePlayer proc
  mov dh,yPos
  mov dl, xPos
  call gotoxy
  mov al,' '
  call writechar
  updatePlayer endp

  ;******************************************obstacles_checking is here ----------

  obstacles_checkingL proc

   mov bl ,xPos
   mov bh ,yPos
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   dec tempx
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingL endp

  ; ------------------second phase is here ------------
 obstacles_checkingR proc
  
   mov bl ,xPos
   mov bh ,yPos
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   inc tempx
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; check for block 5 and 6 also 
      mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
     
     jmp l2
for_y_side1:
     mov esi,offset block1y
    mov ecx ,lengthof block1y
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],bh
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
    ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret
   
                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x
     ;add ecx,1
  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
     ;add ecx,1
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret

  ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingR endp
                                                ; 3rd phase of obstacles checking is her e
 obstacles_checkingU proc

   mov bl ,xPos
   mov bh ,yPos
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   dec tempy
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingU endp
                                        ; last check for   blocks 
    obstacles_checkingD proc

   mov bl ,xPos
   mov bh ,yPos
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   inc tempy
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingD endp
  ; ----------------obstacles_checking ending -------------------------------------
  ;*///////////// temp working 
  check_for_ghost proc
   ;call update_ghost_ll
  mov bl,ghostx
  mov al ,xPos
  cmp holding_location ,'a'
  je mean_leftii
    cmp holding_location ,'d'
    je mean_rite
    cmp holding_location ,'w'
    je mean_upi
    cmp holding_location ,'s'
    je mean_down
 mean_leftii:
  dec al
   jmp imp
 mean_rite:
  inc al
   jmp imp
mean_upi:
 mov ah,yPos
 dec ah
   jmp imp1
mean_down:
   mov ah,yPos
   inc ah
   jmp imp1
imp1:
       cmp al ,bl
       je l2
       ret
l2:
    mov bl,ghosty
    cmp ah,bl
    je great
    ret
imp:
   cmp al ,bl
   je l1
   ret
l1:
    mov bl ,ghosty
    cmp yPos,bl
    je great
    ret
great:

   call updates_lives
    call updateGhost

    mov cl,1
    
   ret
  check_for_ghost endp
   ;*----------------- update player proc is endng ----------------------
   
   ;------------------- update ghost proc is here ----------------------
  updateGhost proc
  mov dh,yPos
  mov dl, xPos
  dec dl
  mov eax,green
  call settextcolor
  call gotoxy
  mov al,"."
  call writechar
  call draw_ghost_proc
  call resetting_location_dot
  mov xPos,40
  mov yPos,16
  call Draw_player_proc
  ret
  updateGhost endp

   ;*----------------- update ghost proc is endng ----------------------
   
   ; ############################## resetting_location_dot is here ##################33
resetting_location_dot proc
  mov dl,xPos
  mov dh ,yPos
  call gotoxy
  mov al,' '
  call writechar
  ret
resetting_location_dot endp
             ;************************* instrucntion_proc start  here **********
 
 
 instruction_proc proc
   mov edx ,offset file
   call openinputfile
   mov handler,eax
   jc exit1

   mov edx ,offset arr
   mov ecx ,bsize
   mov eax ,handler
   call readfromfile
   jc exit1
    mov eax ,handler
   call closefile
   call clrscr
l1:
   mov eax ,yellow
   call settextcolor
   mov edx ,offset arr
   call writestring
   call crlf
   mov eax,white
   call settextcolor
   mwrite "Enter your choice "
   call readchar
   cmp al,'3'
   je exit_proc
   cmp al ,'q'
   je asking
   mov eax ,red
   call settextcolor
   mwrite "You enter wrong choice.."
   call crlf
   mov eax,500
   call delay
   call clrscr
   jmp l1

  
   
exit1:
     call crlf
     mwrite "Error in file..."
     exit

 ret
 instruction_proc endp
   ;-------------------------- instruction_proc ending ------------------------




;************************* exit_proc start  here **********
 exit_proc proc
   call clrscr
   call final_name_call   ; this fucntion wirte scoere in file 
   ; now we call one function ..... in which we wirte all data 
   call append_file
    mov dl ,35
    mov dh ,5
    call gotoxy
    add dh,1
    mov eax ,blue
    call settextcolor
  mwrite "Are you sure . you want to exit the game ?"
  call crlf
  call gotoxy
  add dh ,1
  mov eax ,red
  call settextcolor
  mwrite "press 1 for confirmation "
  call gotoxy
  call crlf
  add dh,1
  call gotoxy
  mov eax ,yellow
  call settextcolor
  mwrite "OR press any number to  go back"
  call crlf
  call readchar 
  cmp al,'1'
  je exit1
  mov eax ,white
  call settextcolor
  call clrscr
  call asking
exit1:
      call clrscr
      mov eax,green
      call settextcolor
      movzx eax ,Score
      mwrite "Your score : "
      call writedec
      mwrite "                                                                                   "
      mov edx,offset naming
      mwrite "Name : "
      call  writestring
       mov eax,red
       call crlf
       call crlf
      call settextcolor
      mov edx,offset exit_screen
      call writestring
       exit
 ret
 exit_proc endp
   ;-------------------------- exit _proc ending ------------------------
; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
 append_file proc
 mov edx,offset file1
 call openinputfile
 mov handler,eax

 mov edx,offset temp11
 mov ecx,bsize
 mov eax,handler
 call readfromfile
find_s1:
    mov edi,offset temp11
    mov v1,0
    jmp find_s2
    
find_s2:
    mov al,[edi]
    cmp al,' '
    je next
    inc edi
    inc v1
    jmp find_s2

next:
  inc v1
 mov eax,handler
 call closefile
                                      ; second file is here 
  mov edx,offset file3
 call openinputfile
 mov handler,eax

 mov edx,offset temp12
 mov ecx,bsize
 mov eax,handler
 call readfromfile

 mov eax,handler
 call closefile
                                       ; now write into file of Best
 mov edx,offset file4
 call openinputfile
 mov handler,eax

 mov edx,offset origin
 mov ecx,bsize
 mov eax,handler
 call readfromfile
 mov temp111 ,eax
 mov eax,handler
 call closefile
                                ; now here firsr write this all then temp 11 and temp12
mov edx ,offset file4
call createoutputfile
mov handler,eax


mov edx ,offset origin
mov ecx , temp111
mov eax ,handler
call writetofile

  mov edx, offset newline         
  mov ecx, 2                      
  mov eax, handler
  call writetofile

mov edx ,offset temp11
movzx ecx , v1
mov eax ,handler
call writetofile

mov edx ,offset temp12
mov ecx , 4
mov eax ,handler
call writetofile

mov eax,handler
call closefile
 ret
 append_file endp
final_name_call proc
   
   mov edx, offset file3    
    call CreateOutputFile       
    mov handler, eax            
    jc error                    

    ; Convert score to string
    movzx eax, Score              
    mov edi, offset score_arr       
   

convertLoop:
    xor edx, edx
    mov ebx, 10
    div ebx                       
    add dl, '0'                   
    mov [edi], dl                 
    inc edi                       
    inc ecx                       
    test eax, eax                 
    jnz convertLoop               

    ; Reverse the string in place
    mov esi, offset score_arr     
    dec edi                       
reverseLoop:
    cmp esi, edi                  
    jge endReverse                
    mov al, [esi]                 
    mov bl, [edi]
    mov [edi], al
    mov [esi], bl
    inc esi
    dec edi
    jmp reverseLoop
endReverse:
    inc esi
    inc esi
    ; Null-terminate the string
    mov byte ptr [esi], 0

    ; Write the score to the file
    mov edx, offset score_arr     ; Address of the converted score string
    mov ecx, 300                  
    mov eax, handler              ; File handle
    call WriteToFile              ; Write the string into the file
    jc error                      ; Jump to error if write fails

    ; Close the file
    mov eax, handler              ; File handle
    call CloseFile                ; Close the file
    jc error                      ; Jump to error if close fails

    ret

error:
    mwrite "Error occurred during file operation."
    ret
final_name_call endp
   ;********************* name-proc  procedure   **************

 name_proc proc
  ; here ask name and insert.. into .. file ... again 
  cmp flag_for_level3,1
  je no_asking
  cmp flag_for_level2,1
  je no_asking
  mov dh ,21
  mov dl ,0
  call gotoxy
  mov eax ,LIGHTCYAN
  call settextcolor
  mwrite "Enter your name "
  call crlf 
  mov edx ,offset naming
  mov ecx ,100
  call readstring
  mov temp,eax
  ; now open the file and write into it also 
  mov edx ,offset file1
  call createoutputfile
  mov handler,eax
  jc exit1
  mov ebx ,temp
  mov naming[ebx],' '
  mov naming[ebx+1],0
  mov edx ,offset naming
  mov ecx ,temp
  add ecx,2
  mov eax ,handler
  call writetofile
  mov eax ,handler
  call closefile
   mov dh,0
   mov dl ,55
   call gotoxy
   mov eax ,LIGHTMAGENTA
   call settextcolor
   mov edx,offset naming
   call writestring
   mov eax,white
   call settextcolor
  ret
exit1:
   mwrite "ERror in file.."
   ret
 no_asking:
    mov dh,0
   mov dl ,55
   call gotoxy
   mov eax ,LIGHTMAGENTA
   call settextcolor
   mov edx,offset naming
   call writestring
   mov eax,white
   call settextcolor
 ret 
 name_proc endp
  ;---------------------- name_proc ending -------------
  ;------------  scoring_proc start here ------------------
scoring_proc proc
  mov eax,LIGHTMAGENTA
     call settextcolor
     ;call clrscr
     mov dl,2
     mov dh,0
     call gotoxy
     mov edx,offset scoring
     call writestring
     mov eax,white
     call settextcolor
     ; here i think we need to make integer ir char to update the score here 
     mov dh,0
     mov dl,13
     call gotoxy
     mov ax,Score
     cmp ax,350
     je level2
     call writedec
     mov ax,Score
     cmp ax,520
     je display_fruit
      cmp ax,820
     je display_fruit
     cmp ax,580
     je display_pallet
     cmp ax,880
     je display_pallet
     cmp ax,700
     je level3
     cmp ax,999
     je winner
     ret
display_fruit:
  mov dh,fruity1
  mov dl ,fruitx1
  call gotoxy
  mov al ,'@'
  call writechar
   ret
display_pallet:
  mov dh,pallety1
  mov dl ,palletx1
  call gotoxy
  mov al ,'#'
  call writechar
   ret
level2:
     inc score
     call clrscr
     mov eax,green
     call settextcolor
     mov edx,offset levelc
     call writestring
     mov eax,900
     call delay
     
 Gameloop1:
   mov eax,green
   call settextcolor
   mwrite"Do you want to continue in next level ?"
   call crlf
   mwrite "Press n for it "
   call crlf
    call ReadChar
    cmp al, 'n'          
     je jumping_for2 
    jmp Gameloop1
    
  jumping_for2:
     call clrscr
     mov  flag_for_level2 ,1
     jmp game_proc
     ret

    level3:
     inc score
     call clrscr
     mov eax,green
     call settextcolor
     mov edx,offset levelc
     call writestring
     mov eax,900
     call delay
     
 Gameloop2:
  INVOKE PlaySound, OFFSET mission , NULL, 1 
  mov ax,400
  call delay
   mov eax,green
   call settextcolor
   mwrite"Do you want to continue in next level ?"
   call crlf
   mwrite "Press n for it "
   call crlf
    call ReadChar
    cmp al, 'n'          
     je jumping_for3
    jmp Gameloop2
    
  jumping_for3:
     call clrscr
     
     mov  flag_for_level3 ,1
     jmp game_proc
     ret
winner:
     call clrscr
      mov eax,green
      call settextcolor
      movzx eax ,Score
      add eax,1
      mwrite "Your score : "
      call writedec
      mwrite "                                                                                   "
      mov edx,offset naming
      mwrite "Name : "
      call  writestring
       mov eax,red
       call crlf
       call crlf
      call settextcolor
      mov edx,offset win1
      call writestring
      mov eax,900
      call delay
 ;     call append_file
       exit
       ret
     scoring_proc endp
     ;----------------  enfing of scoring proc---------------
     ; ------------- socre counting is ehre -----------
UpdateScore PROC
    mov esi,offset index_x
    mov edi,offset index_y
    mov ecx,lengthof index_x
    loopScore:
        mov al,[edi]
        mov ah,[esi]
        inc esi
        inc edi
        cmp al,yPos
        jne skipScore
        cmp ah,xPos
        je increment
        skipScore:
    loop loopScore
    jmp noInc
    increment:
        dec edi
        dec esi
        mov al,-1
        mov [esi],al
        mov [edi],al
        add Score,1
        cmp xPos,115
        je for_y
        mov bl,palletx1
        cmp xPos,bl
        je check_for_y1
        
    noInc:
  call  scoring_proc
    ret
for_y:
      cmp yPos ,3
      je big_jump
      ret
big_jump:
add Score,19
INVOKE PlaySound, OFFSET fruit_sound, NULL, 1 
mov eax,400
call delay
INVOKE PlaySound, OFFSET file12, NULL, 1 
jmp noInc
    ret
check_for_y1:
   mov bh,pallety1
   cmp yPos ,bh
   je mean_beep
   ret
mean_beep:
 cmp Score ,580
 jge nooo
 ret
 
nooo:
 mov  set_beap ,1
 mov power_timer ,1
 ret
UpdateScore ENDP
;---------------------- here scoring is ending ----------------
     ;*************** lives_proc start here *********
 lives_proc proc
   mov dh,0
   mov dl ,100
   call gotoxy
   mov eax ,LIGHTMAGENTA
   call settextcolor
   mov edx,offset livestr
   call writestring
   mov eax,white
     call settextcolor
     ; here i think we need to make integer ir char to update the score here 
     mov dh,0
     mov dl,108
     call gotoxy
     mov al,Live
     call writedec
   ret
 lives_proc endp
     ; ----------- lives_proc proc end -------------
     ;##############################333 update lives proc is here ##############33333
     updates_lives proc
     cmp set_beap,1
     je nothing_doing
    INVOKE PlaySound, OFFSET death, NULL, 1
    dec Live
    mov eax, red
    call settextcolor
    ; Blinking effect for "Lives"
    mov ecx,2     
    ;INVOKE PlaySound, OFFSET file12, NULL, 1
blink_loop:
    mov dh, 0          
    mov dl, 100
    call gotoxy
    mov edx, offset livestr
    call writestring      
    mov eax, white        
    call settextcolor
    mov eax, 100          
    call delay
    mov eax, red
    call settextcolor
    loop blink_loop       ; Repeat blinking
   
    ; Check if Live reaches 0
    cmp Live, 0
    je gameoverr          

    ; Update lives on screen
    call lives_proc
    mov eax,900
    call delay
     INVOKE PlaySound, OFFSET file12, NULL, 1
    ret
nothing_doing:
    mov eax, power_timer      
    cmp eax, 0
    je reset_flag             

    ; Decrease timer
    dec power_timer
    call delay_1_second       
    ret

reset_flag:
    mov set_beap, 0          
    ret
gameoverr:
   call append_file
   call clrscr
      mov eax,green
      call settextcolor
      movzx eax ,Score
      mwrite "Your score : "
      call writedec
      mwrite "                                                                                   "
      mov edx,offset naming
      mwrite "Name : "
      call  writestring
      
       mov eax,red
       call crlf
       call crlf
      call settextcolor
      mov edx,offset gameover_screen
      call writestring
      INVOKE PlaySound, OFFSET overss , NULL, 1
      mov eax,3000
      call delay
       exit
       ret
updates_lives endp
 ; ---------------------------------------------------------------------------------------
  delay_1_second proc
    mov eax, 1000    ; Milliseconds for 1 second
    call delay
    ret
delay_1_second endp
     ;-----------------------------------updates lives proc is ending  ---------------
     ;**********   DRWA boaundries proc   is here **********
Drawboundaries PROC
    mov eax,blue
    call SetTextColor
    mov dl,1
    mov dh,29   ; lower lines 
    call Gotoxy
    mov ecx, 118
    loop1:
         mov al, plus
         call WriteChar
         inc dl
         Call Gotoxy
    loop loop1
     
    mov ecx, 118  ; top lines 
    mov dl,1
    mov dh,1
    call Gotoxy
    loop2:
        mov al, plus
        call WriteChar
        inc dl
        call Gotoxy
    loop loop2


    mov ecx,27
    mov dh,2
    mov v1,dh
    l1:
    mov dh,v1
    mov dl,0
    call Gotoxy
    mov edx,OFFSET plus
    call WriteString
    inc v1
    loop l1

    mov ecx,27
    mov dh,2
    mov v1,dh
    l2:
    mov dh,v1
    mov dl,119
    call Gotoxy
    mov edx,OFFSET plus
    call WriteString
    inc v1
    loop l2
    
    ret

Drawboundaries endp
     ;--------------DRWA boaundries proc  is ending here .. *------------
   ;***************  draw_player_proc is here *******************

draw_player_proc proc 
 ; max in y have 0 to 27 ..and in row have form 0 -> 119
    mov eax,yellow 
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,"X"
    call WriteChar
    ret 
 
draw_player_proc endp
    ;-------------- draw_player_proc ending is here -----------------------------------------

    ;***************draw_ghost_proc is here **********************
    draw_ghost_proc proc
    cmp power_timer ,1
    je changing_ghost1
    mov eax, red
    call settextcolor

    mov dl, ghostx
    mov dh, ghosty

    call Gotoxy

    mov al, "$"
    call writechar
   ret
changing_ghost1:
   mov eax, red
    call settextcolor

    mov dl, ghostx
    mov dh, ghosty

    call Gotoxy

    mov al, "&"
    call writechar
   ret
    draw_ghost_proc endp

     ; for level 2 ghost is here @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
draw_ghost_proc1 proc
   cmp flag_for_level2,1
   jne no_gg2
   cmp power_timer ,1
   je changing_ghost2
    mov eax, blue
    call settextcolor

    mov dl, ghostx1
    mov dh, ghosty1

    call Gotoxy

    mov al, "$"
    call writechar
   ret
no_gg2:
     ret
changing_ghost2:
mov eax, blue
    call settextcolor

    mov dl, ghostx1
    mov dh, ghosty1
    call Gotoxy

    mov al, "&"
    call writechar
   ret
    draw_ghost_proc1 endp

; @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ for level 3 draw ghost is here 
draw_ghost_proc2 proc
   cmp flag_for_level3,1
   jne no_gg2
   cmp power_timer ,1
   je changing_ghost2
    mov eax, LightMagenta
    call settextcolor

    mov dl, ghostx2
    mov dh, ghosty2

    call Gotoxy

    mov al, "$"
    call writechar
   ret
no_gg2:
     ret
changing_ghost2:
mov eax, blue
    call settextcolor

    mov dl, ghostx2
    mov dh, ghosty2
    call Gotoxy

    mov al, "&"
    call writechar
   ret
    draw_ghost_proc2 endp
update_ghost_proc1 proc
   cmp flag_for_level2,1
   jne no_gg2
    mov eax, green
    call settextcolor

    mov dl, ghostx1
    mov dh, ghosty1

    call Gotoxy

    mov al, " "
    call writechar
   ret
no_gg2:
     ret
    update_ghost_proc1 endp

update_ghost_proccc proc
   
    mov eax, green
    call settextcolor

    mov dl, ghostx
    mov dh, ghosty

    call Gotoxy

    mov al, " "
    call writechar
   ret

    update_ghost_proccc endp
    ;------------------draw_ghost_proc ending...-----------------

 ; *************draw_obstacles_proc start here ********
 draw_obstacles_proc proc
  ; this is for level 1 
   mov eax ,yellow
   call settextcolor
   mov dl ,9
   mov dh ,10
   mov ecx,10
  l1:
       call gotoxy
       mov al,obstacle
       call writechar
       inc dh
       loop l1
          ; now make second one here ...
        mov dl ,110
       mov dh ,10
       mov ecx,10
   l2:
       call gotoxy
       mov al,obstacle
       call writechar
       inc dh
       loop l2
       ; now make third  one here ...
        mov dl ,10
       mov dh ,10
       mov ecx,20
   l3:
       call gotoxy
       mov al,obstacle
       call writechar
       inc dl
       loop l3

        ; now make forth   one here ...
        mov dl ,90
       mov dh ,11
       mov ecx,21
   l4:
       call gotoxy
       mov al,obstacle
       call writechar
       inc dl
       loop l4

        ; now make fifth   one here ...
        mov dl ,50
       mov dh ,7
       mov ecx,20
   l5:
       call gotoxy
       mov al,obstacle
       call writechar
       inc dl
       loop l5

       ; now make sixth   one here ...
        mov dl ,45
       mov dh ,24
       mov ecx,20
   l6:
       call gotoxy
       mov al,obstacle
       call writechar
       inc dl
       loop l6
   ret
 draw_obstacles_proc endp
 
 ; ---------- draw_obstacles_proc ending here... ----------
  
  ;*********Draw_coins_proc start here//////////*************
  DrawCoin proc
  cmp flag_for_level2,1
  je no_ask
  cmp flag_for_level3,1
  je no_ask
  mov eax,green ;(red * 16)
    call SetTextColor
    mov dh,1
    mov al,"."
    mov ecx,27
    mov ah,118
    mov edi,offset index_x
    mov esi,offset index_y
    loopCoin:
            inc dh
            mov dl,0
            mov loopVarCoin,ah
        loopCoin1:
            inc dl
            call Gotoxy
            mov [esi],dh
            mov [edi],dl
            inc esi
            inc edi
            call WriteChar
        dec loopVarCoin
        cmp loopVarCoin,0
        jne loopCoin1
       
    loop loopCoin
    ret
no_ask: 
mov eax, green ; Set text color to green
    call SetTextColor

    mov edi, offset index_x 
    mov esi, offset index_y
    mov ecx, lengthof index_x             

level2Loop:
    mov al, [edi]          
    cmp al, -1             
    je skipCoinLevel2      

    mov al, [esi]          
    cmp al, -1             
    je skipCoinLevel2      

    mov dl, [edi]         
    mov dh, [esi]          
    call Gotoxy            
    mov al, "."            
    call WriteChar       

skipCoinLevel2:
    add edi, 1             
    add esi, 1             
    loop level2Loop        
     ret
     DrawCoin ENDP

CreateRandomCoin PROC
    mov eax,55
    inc eax
    call RandomRange
    mov xCoinPos,al
    mov yCoinPos,27
    ret
CreateRandomCoin ENDP


  
  
  ; at end here we need to kow total dots we have ..beacusw later will use 
  ; 23 we have here .. 
  
  ; ---------------Draw_coins_proc ending here --------------

  ; this is all same coee as we do above just the differne is little bit here 
 ;******************************************obstacles_checking for ghost  is here ----------

  obstacles_checkingLG proc

   mov bl ,currentx
   mov bh ,currenty
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   dec tempx
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingLG endp

  ; ------------------second phase is here ------------
 obstacles_checkingRG proc
  
   mov bl ,currentx
   mov bh ,currenty
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   inc tempx
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; check for block 5 and 6 also 
      mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
     
     jmp l2
for_y_side1:
     mov esi,offset block1y
    mov ecx ,lengthof block1y
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],bh
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
    ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret
   
                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x
     ;add ecx,1
  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
     ;add ecx,1
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret

  ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingRG endp
                                                ; 3rd phase of obstacles checking is her e
 obstacles_checkingUG proc

   mov bl ,currentx
   mov bh ,currenty
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   dec tempy
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingUG endp
                                        ; last check for   blocks 
    obstacles_checkingDG proc

   mov bl ,currentx
   mov bh ,currenty
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   inc tempy
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingDG endp
  ; this is fucnton which may be belp us for ghost update
ghost_dots proc
 mov esi,offset index_x
    mov edi,offset index_y
    mov ecx,lengthof index_x
    loopScore:
        mov al,[edi]
        mov ah,[esi]
        inc esi
        inc edi
        cmp al,ghosty
        jne skipScore
        cmp ah,ghostx
        je increment
        skipScore:
    loop loopScore
    jmp noInc
    increment:
        dec edi
        dec esi
       cmp esi,'.'
       je noInc
       jmp going
    noInc:
      mov cl,0
    ret
going:
     mov cl,1
     ret
 ghost_dots endp

 ; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 ; testing is doing here for ghost 2 
 ; *****************************************************************************************
 ghost_dots1 proc
 mov esi,offset index_x
    mov edi,offset index_y
    mov ecx,lengthof index_x
    loopScore:
        mov al,[edi]
        mov ah,[esi]
        inc esi
        inc edi
        cmp al,ghosty1
        jne skipScore
        cmp ah,ghostx1
        je increment
        skipScore:
    loop loopScore
    jmp noInc
    increment:
        dec edi
        dec esi
       cmp esi,'.'
       je noInc
       jmp going
    noInc:
      mov cl,0
    ret
going:
     mov cl,1
     ret
 ghost_dots1 endp

 updateGhost12 proc
  mov dl,ghostx1
  mov dh ,ghosty1
  mov bh,pallety1
  mov bl,palletx1
  cmp ghostx1,bl
  je next_for_y 
main1:
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots1
  cmp cl,1
  je ll1
  jmp ll2
ll1:
  mov al,'.'
  call writechar
  inc ghostx1
  call draw_ghost_proc1
  add g_num1,1  ; first case
  
  ret
ll2:
mov al,' '
  call writechar
  inc ghostx1
  call draw_ghost_proc1
  add g_num1,1  ; first case
  ret
next_for_y:
  cmp ghosty1,bh
  je mean_proceed
  jmp main1
mean_proceed:
  call gotoxy
  mov eax,white
  call settextcolor
  mov al,'#'
  call writechar
  ret
updateGhost12 endp

updateGhost22 proc
  mov dl,ghostx1
  mov dh ,ghosty1
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots1
  cmp cl,1
  je tt1
  jmp tt2
tt1:
  mov al,'.'
  call writechar
  dec ghostx1
  call draw_ghost_proc1
    add g_num1,1
  ret
tt2:
 mov al,' '
  call writechar
  inc ghosty1
  call draw_ghost_proc1
    add g_num1,1
  ret

updateGhost22 endp

updateGhost32 proc
  mov dl,ghostx1
  mov dh ,ghosty1
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots1
  cmp cl,1
  je three1
  jmp three2
three1:
  mov al,'.'
  call writechar
  inc ghostx1
  call draw_ghost_proc1
    add g_num1,1
  ret
three2:
  mov al,' '
  call writechar
  dec ghosty1
  call draw_ghost_proc1
    add g_num1,1
  ret

updateGhost32 endp

updateGhost42 proc
  mov dl,ghostx1
  mov dh ,ghosty1
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots1
  cmp cl,1
  je fort1
  jmp fort2
fort1:
  mov al,'.'
  call writechar
  inc ghosty1
  call draw_ghost_proc1
    add g_num1,1
  ret
 fort2:
  mov al,' '
  call writechar
  dec ghosty1
  call draw_ghost_proc1
    add g_num1,1
  ret

updateGhost42 endp
;###########################################################################################################
 update_ghost_ll2 proc
 cmp flag_for_level2 , 1
 jne no_this   
  cmp score,500
  je updating
  cmp score,630
  je updating
  cmp score,699
  je updating
   cmp score,799
  je updating
   cmp score,910
  je updating
  jmp proceed
updating:
  call update_ghost_proc1
  mov ghostx1 ,11
  mov ghosty1 ,5
  mov g_num,4
proceed:
  call obstacles_checkingLG2
  cmp cl,0
  je move_it ; mean no issue if jumo here
  jmp for_right
  move_it:
  cmp g_num1,15
  jl con
  jmp for_right
con:
   call updateGhost12
   ret
for_right:
      ; mean here can not move in left side  ao start right side 
      call obstacles_checkingRG2
      cmp cl,0
      je move_can_be
      jmp for_up
move_can_be:
    cmp g_num1,15
    jge check1

    jmp for_up
check1:
     cmp g_num1,19
     jle con1
     jmp for_up
con1:
    call updateGhost22
    ret
for_up:
      call obstacles_checkingUG2
      cmp cl,0
      je move_itt
      jmp for_down
move_itt:
    cmp g_num1,20
    jge checkk2
    jmp for_down
checkk2:
     cmp g_num1,25
     jl con2
     jmp for_down
con2:
    call updateGhost32
    ret
for_down:
    call obstacles_checkingDG2
      cmp cl,0
      je move_down_way
      jmp l1
move_down_way:
    cmp g_num1,25
    jge checkk3
    jmp l1
checkk3:
   cmp g_num1,29
   jl con4
   jmp l1
con4:
    call updateGhost42
    ret
l1:
   mov g_num1,1
   ret
no_this:
ret
  update_ghost_ll2 endp

  check_for_ghost1 proc
   
   cmp flag_for_level2 ,1
   jne no_ask
  mov bl,ghostx1
  mov al ,xPos
  cmp holding_location ,'a'
  je mean_leftii
    cmp holding_location ,'d'
    je mean_rite
    cmp holding_location ,'w'
    je mean_upi
    cmp holding_location ,'s'
    je mean_down
 mean_leftii:
  dec al
   jmp imp
 mean_rite:
  inc al
   jmp imp
mean_upi:
 mov ah,yPos
 dec ah
   jmp imp1
mean_down:
   mov ah,yPos
   inc ah
   jmp imp1
imp1:
       cmp al ,bl
       je l2
       ret
l2:
    mov bl,ghosty1
    cmp ah,bl
    je great
    ret
imp:
   cmp al ,bl
   je l1
   ret
l1:
    mov bl ,ghosty1
    cmp yPos,bl
    je great
    ret
great:

   call updates_lives
    call updateGhost_level2

    mov cl,1
    
   ret
no_ask:
   mov cl,0
   ret
  check_for_ghost1 endp
   ;*----------------- update player proc is endng ----------------------
   
   ;------------------- update ghost proc is here ----------------------
 updateGhost_level2 proc
  mov dh,yPos
  mov dl, xPos
  dec dl
  mov eax,green
  call settextcolor
  call gotoxy
  mov al,"."
  call writechar
  call draw_ghost_proc1
  call resetting_location_dot1
  mov xPos,40
  mov yPos,16
  call Draw_player_proc
  ret
  updateGhost_level2 endp

   ;*----------------- update ghost proc is endng ----------------------
   
   ; ############################## resetting_location_dot is here ##################33
resetting_location_dot1 proc
  mov dl,xPos
  mov dh ,yPos
  call gotoxy
  mov al,' '
  call writechar
  ret
resetting_location_dot1 endp

; obstacles checking for ghost number 2 is here
 ;******************************************obstacles_checking for ghost  is here ----------!!!!!

  obstacles_checkingLG2 proc

   mov bl ,currentx1
   mov bh ,currenty1
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   dec tempx
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingLG2 endp

  ; ------------------second phase is here ------------
 obstacles_checkingRG2 proc
  
   mov bl ,currentx1
   mov bh ,currenty1
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   inc tempx
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; check for block 5 and 6 also 
      mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
     
     jmp l2
for_y_side1:
     mov esi,offset block1y
    mov ecx ,lengthof block1y
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],bh
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
    ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret
   
                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x
     ;add ecx,1
  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
     ;add ecx,1
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret

  ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingRG2 endp
                                                ; 3rd phase of obstacles checking is her e
 obstacles_checkingUG2 proc

   mov bl ,currentx1
   mov bh ,currenty1
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   dec tempy
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingUG2 endp
                                        ; last check for   blocks 
    obstacles_checkingDG2 proc

   mov bl ,currentx1
   mov bh ,currenty1
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   inc tempy
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingDG2 endp

display_highScore proc
  ; here we print our best players in foud bestPlayer arrya
  mov edx,offset file4
  call openinputfile
  mov handler ,eax

  mov edx,offset bestPlayer
  mov ecx,bsize
  mov eax,handler
  call readfromfile
  mov Player ,eax
  call clrscr
  mov eax,green
  call settextcolor
  mov dl ,47
  mov dh ,3
  call gotoxy
  mwrite "High Score List : "
  call crlf
mov ecx,120
mov eax,cyan
  call settextcolor
l1:
   mov al,'_'
   call writechar
   loop l1
   mov eax,red
   call settextcolor
  mov edx,offset bestPlayer
  call writestring
  call crlf
mov ecx,120
mov eax,cyan
  call settextcolor
l2:
   mov al,'_'
   call writechar
   loop l2
   mov eax,handler
   call closefile
   mov eax,white
   call settextcolor
   mwrite "Do you want to go back (press 1)"
   call crlf
   mwrite "for exit (press 2)"
   call crlf
   call readchar
   cmp al,'1'
   je asking
   cmp al,'2'
   je  exit_proc
   mwrite "Wrong input "
   jmp asking
ret
display_highScore endp
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
update_ghost_ll3 proc
cmp flag_for_level3 ,0
  je nothing_doing
  mov bl ,xPos
  mov bh ,yPos
  mov v1 ,bl
  mov v2 ,bh

  mov dh,v2
  mov dl ,v1
  cmp holding_location ,'d'
  je subtraction
  cmp holding_location ,'a'
  je addition
  cmp holding_location, 'w'
  je change_up
  cmp holding_location ,'s'
  je change_down
subtraction:
  call obstacles_checkingLG3

  cmp cl,1
  je see1

okay:
  sub v1,2
  jmp labell
see1:
  call check_for_ghost3
  call draw_ghost_proc2
  ret
addition:
  call  obstacles_checkingRG3
  cmp cl,1
  je see2
yess:
   add v1,2
   jmp labell
see2:
  call check_for_ghost3
  call draw_ghost_proc2
  ret
change_up:
   call obstacles_checkingUG3
   cmp cl,1
   je see23
go1:
   add v2,1
   jmp labell
see23:
  call check_for_ghost333
  call draw_ghost_proc2
   ret
change_down:
   call obstacles_checkingDG3
   cmp cl,1
   je see3
go:
   sub v2 ,1
   jmp labell
see3:
  call check_for_ghost3
  call draw_ghost_proc2
  ret
labell:
 call  updateGhost33
 mov ah,v2
 mov al,v1
  mov ghostx2 ,al
  mov ghosty2 ,ah
  call draw_ghost_proc2
 ret
nothing_doing:
ret
update_ghost_ll3 endp

 ghost_dots2 proc
 mov esi,offset index_x
    mov edi,offset index_y
    mov ecx,lengthof index_x
    loopScore:
        mov al,[edi]
        mov ah,[esi]
        inc esi
        inc edi
        cmp al,ghosty2
        jne skipScore
        cmp ah,ghostx2
        je increment
        skipScore:
    loop loopScore
    jmp noInc
    increment:
        dec edi
        dec esi
       cmp esi,'.'
       je noInc
       jmp going
    noInc:
      mov cl,0
    ret
going:
     mov cl,1
     ret
 ghost_dots2 endp

 updateGhost33 proc
  mov dl,ghostx2
  mov dh ,ghosty2
  call gotoxy
  mov eax,green
  call settextcolor
  call ghost_dots2
  cmp cl,1
  je ll1
  jmp ll2
ll1:
  mov al,'.'
  call writechar
 
  ;add g_num,1  ; first case
  
  ret
ll2:
mov al,' '
  call writechar
  
  ret
updateGhost33 endp
                                                                  ; !!!!!!!!
obstacles_checkingLG3 proc

   mov bl ,ghostx2
   mov bh ,ghosty2
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   sub tempx,3
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingLG3 endp

  ; ------------------second phase is here ------------
 obstacles_checkingRG3 proc
  
   mov bl ,ghostx2
   mov bh ,ghosty2
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   add tempx,3
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; check for block 5 and 6 also 
      mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
     
     jmp l2
for_y_side1:
     mov esi,offset block1y
    mov ecx ,lengthof block1y
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],bh
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
    ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret
   
                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x
     ;add ecx,1
  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
     ;add ecx,1
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret

  ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingRG3 endp
    check_for_ghost3 proc
   
   cmp flag_for_level3 ,1
   jne no_ask
  mov bl,ghostx2
  mov al ,xPos
  cmp holding_location ,'a'
  je mean_leftii
    cmp holding_location ,'d'
    je mean_rite
    cmp holding_location ,'w'
    je mean_upi
    cmp holding_location ,'s'
    je mean_down
 mean_leftii:
  dec al
   jmp imp
 mean_rite:
  inc al
   jmp imp
mean_upi:
 mov ah,yPos
 dec ah
   jmp imp1
mean_down:
   mov ah,yPos
   inc ah
   jmp imp1
imp1:
       cmp al ,bl
       je l2
       ret
l2:
    mov bl,ghosty2
    inc bl
    cmp ah,bl
    je great
    ret
imp:
   cmp al ,bl
   je l1
   ret
l1:
    mov bl ,ghosty2
    cmp yPos,bl
    je great
    ret
great:

   call updates_lives
    call updateGhost33

    mov cl,1
    
   ret
no_ask:
   mov cl,0
   ret
  check_for_ghost3 endp

;111obstacles checking reamin for up and down...so 
obstacles_checkingUG3 proc

   mov bl ,ghostx2
   mov bh ,ghosty2
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   add tempy,2
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingUG3 endp
                                        ; last check for   blocks 
    obstacles_checkingDG3 proc

   mov bl ,ghostx2
   mov bh ,ghosty2
   mov tempx ,bl
   mov tempy ,bh
   ; first case to see if both increases
   sub tempy,2
   mov  al,tempx
   ; here check for block 1 first
 l1:
     cmp al,block1x
     je for_y_side1
     cmp al,block2x
     je for_y_side1
     ; if not any block 1 or 2 check for 5 and 6 blocks 
     mov ah,tempy
     cmp ah,block5y
     je for_x_side5
     cmp ah,block6y
     je for_x_side6
     ; check for block 3 and 4 also now 
     cmp ah,block3y
     je for_x_side3
     cmp ah,block4y
     je for_x_side4
      jmp l2
for_y_side1:
     mov esi,offset block1y
     mov ecx ,lengthof block1y
     movzx ax ,tempy
  c1:
     cmp ecx,0
     je exit1
      cmp byte ptr [esi],al
      je find_1_done
      inc esi
      dec ecx
      jmp c1
l2:
    mov cl,0
     ret 
find_1_done:
  mov cl,1
  ret
exit1:
   mov cl,0
   ret

                                     ; for block 5 check
for_x_side5:
     mov esi,offset block5x
     mov ecx ,lengthof block5x

  c5:
     cmp ecx,0
     je exit5
      cmp byte ptr [esi],al
      je find_5_done
      inc esi
      dec ecx
      jmp c5

find_5_done:
  mov cl,1
  ret
exit5:
   mov cl,0
   ret
    ;                              6th block checks 
for_x_side6:
     mov esi,offset block6x
     mov ecx ,lengthof block6x
  
  c6:
     cmp ecx,0
     je exit6
      cmp byte ptr [esi],al
      je find_6_done
      inc esi
      dec ecx
      jmp c6

find_6_done:
  mov cl,1
  ret
exit6:
   mov cl,0
   ret
    ;                              3rd block checks 
for_x_side3:
     mov esi,offset block3x
     mov ecx ,lengthof block3x
     ;add ecx,1
  c3:
     cmp ecx,0
     je exit3
      cmp byte ptr [esi],al
      je find_3_done
      inc esi
      dec ecx
      jmp c3

find_3_done:
  mov cl,1
  ret
exit3:
   mov cl,0
   ret

     ;                              4th block checks 
for_x_side4:
     mov esi,offset block4x
     mov ecx ,lengthof block4x
     ;add ecx,1
  c4:
     cmp ecx,0
     je exit4
      cmp byte ptr [esi],al
      je find_4_done
      inc esi
      dec ecx
      jmp c4

find_4_done:
  mov cl,1
  ret
exit4:
   mov cl,0
   ret

  obstacles_checkingDG3 endp

    check_for_ghost333 proc
   
   cmp flag_for_level3 ,1
   jne no_ask
  mov bl,ghostx2
  mov al ,xPos
  cmp holding_location ,'a'
  je mean_leftii
    cmp holding_location ,'d'
    je mean_rite
    cmp holding_location ,'w'
    je mean_upi
    cmp holding_location ,'s'
    je mean_down
 mean_leftii:
  dec al
   jmp imp
 mean_rite:
  inc al
   jmp imp
mean_upi:
 mov ah,yPos
 dec ah
   jmp imp1
mean_down:
   mov ah,yPos
   inc ah
   jmp imp1
imp1:
       cmp al ,bl
       je l2
       ret
l2:
    mov bl,ghosty2
    dec bl
    cmp ah,bl
    je great
    ret
imp:
   cmp al ,bl
   je l1
   ret
l1:
    mov bl ,ghosty2
    cmp yPos,bl
    je great
    ret
great:

   call updates_lives
    call updateGhost33

    mov cl,1
    
   ret
no_ask:
   mov cl,0
   ret
  check_for_ghost333 endp
 end main



