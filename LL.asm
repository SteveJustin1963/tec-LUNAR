047B   14           LUNAWIN:   DB   0x14   ;D
047C   12                     DB   0x12   ;C
047D   14                     DB   0x14   ;D
047E   17                     DB   0x17   ;F
047F   17                     DB   0x17   ;F
0480   12                     DB   0x12   ;C
0481   14                     DB   0x14   ;D
0482   10                     DB   0x10   ;A#
0483   1F                     DB   0x1F   ;END
0484   01           LUNALOSE:   DB   0x01   ;G
0485   11                     DB   0x11   ;B
0486   01                     DB   0x01   ;G
0487   11                     DB   0x11   ;B
0488   01                     DB   0x01   ;G
0489   11                     DB   0x11   ;B
048A   1F                     DB   0x1F   ;END
048B   FF                     DB   0xFF
048C   FF                     DB   0xFF
048D   FF                     DB   0xFF
048E   FF                     DB   0xFF
048F   FF                     DB   0xFF
0490                             ;LUNALANDER
0490                             ;you must land your luna module on the moon
0490                             ;as gently as possible while gravity is pulling you down.wn.
0490                             ;You can use the + key to fire your engine briefly
0490                             ;this will slow down your descent but it also uses fuell
0490                             ;if you run out of fuel you will crash
0490                LUNALANDER:   .ORG   0x490
0490   DD 21 F1 0F            LD   ix,DISPLAY   ;ix = DISPLAY
0494   FD 21 00 08            LD   iy,STARTRAM   ;iy = STARTRAM
0498   3E 50                  LD   a,0x50
049A   FD 77 00               LD   (iy+0),a   ;(ALTITUDE) = 50
049D   3E 20                  LD   a,0x20
049F   FD 77 01               LD   (iy+1),a   ;(FUEL) = 20
04A2   AF                     XOR   a
04A3   FD 77 02               LD   (iy+2),a   ;(VELOCITY) = 0
04A6                             ;clear display
04A6   21 F1 0F               LD   hl,DISPLAY   ;hl = DISPLAY
04A9   06 06                  LD   b,0x06   ;b = num_digits
04AB   36 00        LUNA10:   LD   (hl),0x00   ;(hl) = 0
04AD   23                     INC   hl   ;hl++
04AE   10 FB                  DJNZ   0x04ab   ;if (--b != 0) goto LUNA10
04B0   16 80        LUNA15:   LD   d,0x80   ;d = 80
04B2   FD 7E 01     LUNA20:   LD   a,(iy+1)   ;a = (FUEL)
04B5   21 F1 0F               LD   hl,DISPLAY   ;hl = DISPLAY
04B8   CD 15 01               CALL   WRITEHEX   ;write (FUEL) BCD number
04BB   23                     INC   hl
04BC   23                     INC   hl   ;hl += 2
04BD   FD 7E 00               LD   a,(iy+0)   ;a = (ALTITUDE)
04C0   CD 15 01               CALL   WRITEHEX   ;write (ALTITUDE) BCD number
04C3   3E FF                  LD   a,0xff   ;a = FF
04C5   ED 47                  LD   i,a
04C7   CD 40 01               CALL   SCANDISP
04CA   ED 57                  LD   a,i
04CC   FE FF                  CP   0xff   ;if (keypressed)
04CE   C4 F3 04               CALL   nz,LUNAKPRESS   ;    call LUNAKPRESS
04D1   15                     DEC   d   ;d--
04D2   C2 B2 04               JP   nz,LUNA20   ;loop 128 times
04D5   FD 7E 02               LD   a,(iy+2)   ;a = (VELOCITY)
04D8   D6 01                  SUB   0x01   ;a--
04DA   27                     DAA      ;BCD adjust
04DB   FD 77 02               LD   (iy+2),a   ;(VELOCITY) = a
04DE   47                     LD   b,a   ;b = a
04DF   FD 7E 00               LD   a,(iy+0)   ;a = (ALTITUDE)
04E2   80                     ADD   a,b   ;a += b
04E3   27                     DAA      ;BCD adjust
04E4   FE 00                  CP   0x00   ;if (a == 0)
04E6   CA 11 05               JP   z,LWIN   ;  goto LWIN
04E9   FE 60                  CP   0x60   ;if (a < 60)
04EB   30 1B                  JR   nc,LLOSE   ;  goto LLOSE
04ED   FD 77 00               LD   (iy+0),a   ;(ALTITUDE) = a
04F0   C3 B0 04               JP   LUNA15   ;goto LUNA15
04F3                             ;subroutine LUNAKPRESS
04F3   FD 7E 01     LUNAKPRESS:   LD   a,(iy+1)   ;a = (FUEL)
04F6   FE 00                  CP   0x00   ;if (a == 0)
04F8   C8                     RET   z   ;  return
04F9   3D                     DEC   a   ;reduce fuel
04FA   27                     DAA      ;BCD adjust
04FB   FD 77 01               LD   (iy+1),a   ;(FUEL) = a
04FE   FD 7E 02               LD   a,(iy+2)   ;a = (VELOCITY)
0501   C6 02                  ADD   a,0x02   ;a += 2
0503   27                     DAA      ;BCD adjust
0504   FD 77 02               LD   (iy+2),a   ;(VELOCITY) = a
0507   C9                     RET      ;return
0508   11 84 04     LLOSE:    LD   de,LUNALOSE   ;de = winning tune
050B   DD 21 00 00            LD   ix,0x0000   ;???
050F   18 03                  JR   LUNAPLAYTUNE   ;goto LUNAPLAYTUNE
0511   11 7B 04     LWIN:     LD   de,LUNAWIN   ;de = losing tune
0514   ED 53 00 08  LUNAPLAYTUNE:   LD   (STARTRAM),de   ;store starting address in RAM
0518   CD B0 01               CALL   PLAYTUNE   ;play tune
051B   CD 31 01               CALL   GETKEY   ;wait for key
051E   C3 90 04               JP   LUNALANDER   ;repeat
