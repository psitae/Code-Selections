REM David Shen, Anthony Castellano
REM TETRIS!!
REM Feb./March 2009
REM I used online reasearch for:
REM     Timer
REM     HighScore
REM     Play()
REM     Inkey$
REM     Arrow Keys
REM     Color
REM     Locate

CLS
RANDOMIZE TIMER
DIM Board$(21, 12, 2)
DIM NextPiece$(4, 4, 2)

PRINT , "        Press any key to start, Esc to exit."

DO
LOOP UNTIL INKEY$ <> ""

'PLAY "MB T120 O4 L2 E O3 L4 b O4 l4 c l2 d l32 c d l8 c. o3 l4 b l2 a. o4 l4 c l2 e l4 d c o3 l2 b. o4 l4 c l2 d e c o3  a l1 a O4 L2 D. l4 f L2 a l4 g f l2 e. l4 c l4 e l8 f e l4 d c o3 l2 b l4 b o4 c l2 d e c o3 a l1 a"
'SLEEP 30
nothing$ = ""
'OPEN "file.txt" FOR OUTPUT AS #9
'        WRITE #9, nothing$
'CLOSE #9
OPEN "file.txt" FOR INPUT AS #1
	INPUT #1, HighScore
CLOSE #1

countersub1 = 0
Piece = INT(RND * 7) + 1
stop$ = "no"
YouLose$ = "no"
codes$ = "off"
Status$ = "ended"
areWeRunning$ = "no"
level = 0
LivePiece$ = CHR$(178)
FrozenPiece$ = CHR$(176)
empty$ = " "
increment = 1


GOSUB 300
GOSUB 300


10

IF level <> oldlevel THEN increment = increment * 5 / 8
oldlevel = level
TheTime = TIMER + increment
'ON TIMER(1) GOSUB 200
'TIMER ON


20 WHILE TheTime >= TIMER
	a$ = INKEY$
	IF a$ = CHR$(0) + CHR$(75) THEN GOSUB 700     'LEFT
	IF a$ = CHR$(0) + CHR$(80) THEN GOSUB 400     'DOWN
	IF a$ = CHR$(0) + CHR$(77) THEN GOSUB 800     'RIGHT
	IF a$ = CHR$(0) + CHR$(72) THEN GOSUB 900     'rotate
	IF a$ = " " THEN GOSUB 1100                   'INSTANT DOWN
	IF a$ = "r" THEN GOSUB 900
	IF a$ = "p" THEN GOSUB 1200
	IF a$ = CHR$(147) THEN codes$ = "on"
	IF a$ = CHR$(246) THEN GOSUB 1300
	IF a$ = CHR$(137) THEN GOSUB 1400
	IF a$ = CHR$(159) THEN INPUT "", score
	IF a$ = CHR$(123) THEN INPUT "", increment
	IF a$ = CHR$(78) THEN GOSUB 300
	IF a$ = CHR$(27) THEN END
	'IF INT(count / 10000) = count / 10000 THEN PRINT "inkey IS"; A$
	'count = count + 1

WEND
59
GOSUB 60
'PRINT "WERE OUT THE LOOP"
GOSUB 200
GOTO 10
50 PRINT , ,
PRINT "Game Over"
GOSUB 60
END

60
IF score < HighScore THEN RETURN

OPEN "file.txt" FOR OUTPUT AS #2
	WRITE #2, score
CLOSE #2
RETURN



100
IF countersub1 <> 0 THEN GOTO 170
FOR x = 1 TO 21
	FOR y = 1 TO 12
		Board$(x, y, 1) = empty$
		IF x <= 20 THEN
			IF y = 1 OR y = 12 THEN Board$(x, y, 1) = CHR$(179)
		ELSE
			GOTO 150
		END IF
	NEXT y
NEXT x
150
Board$(21, 1, 1) = CHR$(212)
Board$(21, 12, 1) = CHR$(190)
FOR b = 2 TO 11
	Board$(x, b, 1) = CHR$(205)
NEXT b
170
CLS
TIMER STOP
zw = 0
aaaa = 0
COLOR 15
FOR zw = 1 TO 21
	PRINT , ,
	FOR aaaa = 1 TO 12
		SELECT CASE Board$(zw, aaaa, 2)
			CASE "14": COLOR 14
			CASE "9": COLOR 9
			CASE "13": COLOR 13
			CASE "11": COLOR 11
			CASE "10": COLOR 10
			CASE "6": COLOR 6
			CASE "12": COLOR 12
			CASE ELSE: COLOR 15
		END SELECT
		PRINT Board$(zw, aaaa, 1);
	NEXT aaaa
	IF zw = 2 THEN PRINT "     Instructions";
	IF zw = 3 THEN PRINT "  ------------------- ";
	IF zw = 4 THEN PRINT ;
	IF zw = 5 THEN PRINT "  Use Arrow Keys For Navigation";
	IF zw = 6 THEN PRINT "  SpaceBar - Instant Down";
	IF zw = 7 THEN PRINT "  r - Rotate";
	IF zw = 8 THEN PRINT "  p - Pause";

	PRINT
NEXT zw
'FOR x120 = 1 TO 20
'        FOR y120 = 2 TO 11
'                IF board$(x120, y120, 1) = LivePiece$ THEN
'                        COLOR ColorNow
'                        LOCATE x120, y120 + 28
'                        PRINT board$(x120, y120, 1)
'                END IF
'        NEXT y120
'NEXT x120
COLOR 15

LOCATE 10, 44
PRINT "Next Piece "
LOCATE 11, 44
PRINT "----------"
FOR x100 = 1 TO 4
	FOR y100 = 1 TO 4
		LOCATE 12 + x100, 44 + y100
		SELECT CASE NextPiece$(x100, y100, 2)
			CASE "14": COLOR 14
			CASE "9": COLOR 9
			CASE "13": COLOR 13
			CASE "11": COLOR 11
			CASE "10": COLOR 10
			CASE "6": COLOR 6
			CASE "12": COLOR 12
			CASE ELSE: COLOR 15
		END SELECT

		PRINT NextPiece$(x100, y100, 1)
	NEXT y100
NEXT x100
COLOR 15
TIMER ON
LOCATE 1, 12
PRINT "Level"; level + 1
LOCATE 22
PRINT , , ; "Your Score is"; score;
LOCATE 22, 50
PRINT "Your High Score is"; HighScore;
IF codes$ = "off" THEN GOTO 198
LOCATE 25, 45
PRINT "246 - Clear Board"
LOCATE 26, 45
PRINT "157 - Change score"
LOCATE 27, 45
PRINT "123 - Change piece speed (seconds)"
LOCATE 28, 45
PRINT "137 - Pick piece"
LOCATE 29, 45
PRINT "78  - GOSUB 300"

198
PRINT
countersub1 = countersub1 + 1
RETURN

200
zw = 0
aaaa = 0
IF YouLose$ = "yes" THEN GOTO 50
IF Status$ = "increment" THEN GOSUB 400
IF Status$ = "ended" THEN GOSUB 300
RETURN


300
CurrentPiece = NextPiece
310 NextPiece = INT(RND * 7) + 1
IF NextPiece = Piece THEN GOTO 310
'NextPiece = 7
'nextpiece = 1 + nextpiece
330
FOR x302 = 1 TO 20
	FOR y302 = 2 TO 11
		IF Board$(x302, y302, 1) = LivePiece$ THEN Board$(x302, y302, 1) = empty$
	NEXT y302
NEXT x302
ColorNow = ColorNext
LOCATE 1, 1
FOR x300 = 1 TO 3
	FOR y300 = 1 TO 4
		FOR z300 = 1 TO 2
			IF NextPiece$(x300, y300, 1) = LivePiece$ THEN
				Board$(x300, y300 + 4, z300) = NextPiece$(x300, y300, z300)
			END IF
		NEXT z300
	NEXT y300
NEXT x300

countsub300 = countsub300 + 1

FOR x301 = 1 TO 4
	FOR y301 = 1 TO 4
		NextPiece$(x301, y301, 1) = empty$
		NextPiece$(x301, y301, 2) = ""
	NEXT y301
NEXT x301
COLOR 15
IF NextPiece = 1 THEN
	NextPiece$(1, 2, 1) = LivePiece$
	NextPiece$(1, 3, 1) = LivePiece$
	NextPiece$(2, 2, 1) = LivePiece$
	NextPiece$(2, 3, 1) = LivePiece$
	NextPiece$(1, 2, 2) = "14"
	NextPiece$(1, 3, 2) = "14"
	NextPiece$(2, 2, 2) = "14"
	NextPiece$(2, 3, 2) = "14"
ELSEIF NextPiece = 2 THEN
	NextPiece$(1, 1, 1) = LivePiece$
	NextPiece$(1, 2, 1) = LivePiece$
	NextPiece$(1, 3, 1) = LivePiece$
	NextPiece$(2, 1, 1) = LivePiece$
	NextPiece$(1, 1, 2) = "9"
	NextPiece$(1, 2, 2) = "9"
	NextPiece$(1, 3, 2) = "9"
	NextPiece$(2, 1, 2) = "9"
ELSEIF NextPiece = 3 THEN
	NextPiece$(1, 1, 1) = LivePiece$
	NextPiece$(1, 2, 1) = LivePiece$
	NextPiece$(1, 3, 1) = LivePiece$
	NextPiece$(2, 2, 1) = LivePiece$
	NextPiece$(1, 1, 2) = "13"
	NextPiece$(1, 2, 2) = "13"
	NextPiece$(1, 3, 2) = "13"
	NextPiece$(2, 2, 2) = "13"
ELSEIF NextPiece = 4 THEN
	NextPiece$(1, 1, 1) = LivePiece$
	NextPiece$(1, 2, 1) = LivePiece$
	NextPiece$(1, 3, 1) = LivePiece$
	NextPiece$(2, 3, 1) = LivePiece$
	NextPiece$(1, 1, 2) = "11"
	NextPiece$(1, 2, 2) = "11"
	NextPiece$(1, 3, 2) = "11"
	NextPiece$(2, 3, 2) = "11"
ELSEIF NextPiece = 5 THEN
	NextPiece$(1, 2, 1) = LivePiece$
	NextPiece$(2, 2, 1) = LivePiece$
	NextPiece$(2, 3, 1) = LivePiece$
	NextPiece$(3, 3, 1) = LivePiece$
	NextPiece$(1, 2, 2) = "10"
	NextPiece$(2, 2, 2) = "10"
	NextPiece$(2, 3, 2) = "10"
	NextPiece$(3, 3, 2) = "10"
ELSEIF NextPiece = 6 THEN
	NextPiece$(1, 3, 1) = LivePiece$
	NextPiece$(2, 2, 1) = LivePiece$
	NextPiece$(2, 3, 1) = LivePiece$
	NextPiece$(3, 2, 1) = LivePiece$
	NextPiece$(1, 3, 2) = "6"
	NextPiece$(2, 2, 2) = "6"
	NextPiece$(2, 3, 2) = "6"
	NextPiece$(3, 2, 2) = "6"
ELSEIF NextPiece = 7 THEN
	NextPiece$(1, 1, 1) = LivePiece$
	NextPiece$(1, 2, 1) = LivePiece$
	NextPiece$(1, 3, 1) = LivePiece$
	NextPiece$(1, 4, 1) = LivePiece$
	NextPiece$(1, 1, 2) = "12"
	NextPiece$(1, 2, 2) = "12"
	NextPiece$(1, 3, 2) = "12"
	NextPiece$(1, 4, 2) = "12"

END IF

Piece = NextPiece
Status$ = "increment"
GOSUB 100
RETURN

400
move$ = "null"
stop$ = "no"
420 FOR x = 21 TO 1 STEP -1
	FOR d = 2 TO 11
		IF Board$(x, d, 1) = LivePiece$ THEN
			FOR E = 2 TO 11
				IF Board$(x - 1, E, 1) = LivePiece$ THEN
					IF Board$(x, E, 1) = FrozenPiece$ THEN
						stop$ = "yes"
						GOSUB 500
						RETURN
					END IF
				END IF
			NEXT E
440                     IF Board$(x + 1, d, 1) <> empty$ THEN  ' making sure it can move down
				stop$ = "yes"
				GOSUB 500
				RETURN
			END IF
		END IF
	NEXT d
	FOR y = 2 TO 11                                  ' move piece down
		IF Board$(x, y, 1) = LivePiece$ THEN
			IF Board$(x + 1, y, 1) = empty$ THEN
				Board$(x, y, 1) = empty$
				SWAP Board$(x, y, 2), Board$(x + 1, y, 2)
				Board$(x + 1, y, 1) = LivePiece$
				move$ = "i_did"
			ELSE
				stop$ = "yes"
				move$ = "i_didn't"
			END IF

		END IF
	NEXT y
	IF move$ = "i_didn't" THEN
		GOSUB 500
		RETURN
	END IF
NEXT x
Status$ = "increment"
GOSUB 100
RETURN

500
FOR x = 1 TO 20
	FOR y = 2 TO 11
		IF Board$(x, y, 1) = LivePiece$ THEN Board$(x, y, 1) = FrozenPiece$
	NEXT y
NEXT x
Status$ = "ended"
GOSUB 1000
GOSUB 300
GOSUB 600
RETURN

600
FOR a = 2 TO 11
	IF Board$(1, a, 1) = FrozenPiece$ THEN
		YouLose$ = "yes"
		Status$ = "Not Running"
	END IF
NEXT a
RETURN

700
Piece$ = "full"
x700 = 0
y700 = 0
FOR x700 = 21 TO 1 STEP -1
	FOR y700 = 2 TO 11
		IF Board$(x700, y700, 1) = LivePiece$ THEN
			IF Board$(x700, y700 - 1, 1) <> empty$ THEN
				RETURN
			ELSE
				x700 = x700 - 1
				y700 = 2
			END IF
		END IF
	NEXT y700
NEXT x700
FOR count = 21 TO 1 STEP -1
	FOR y = 2 TO 11
		IF Board$(count, y, 1) = LivePiece$ THEN
			IF Board$(count, y - 1, 1) = empty$ THEN
				Board$(count, y, 1) = empty$
				Board$(count, y - 1, 1) = LivePiece$
				SWAP Board$(count, y, 2), Board$(count, y - 1, 2)
			END IF

		END IF
	NEXT y
NEXT count
GOTO 100
RETURN


800
x800 = 0
y800 = 0
piece2$ = "full"
FOR x800 = 21 TO 1 STEP -1
	FOR y800 = 11 TO 2 STEP -1
		IF Board$(x800, y800, 1) = LivePiece$ THEN
			'PRINT "x1 = "; x800; "y1 = "; y800
			IF Board$(x800, y800 + 1, 1) <> empty$ THEN
				RETURN
			ELSE
				x800 = x800 - 1
				y800 = 11
			END IF
		END IF
	NEXT y800
NEXT x800
FOR xxx = 21 TO 1 STEP -1
	FOR y = 11 TO 2 STEP -1
		IF Board$(xxx, y, 1) = LivePiece$ THEN
			IF Board$(xxx, y + 1, 1) = empty$ THEN
				Board$(xxx, y, 1) = empty$
				Board$(xxx, y + 1, 1) = LivePiece$
				SWAP Board$(xxx, y, 2), Board$(xxx, y + 1, 2)
			END IF
		END IF
	NEXT y
NEXT xxx
GOTO 100
RETURN

900
IF CurrentPiece = 1 THEN RETURN
FOR p = 1 TO 20
	FOR o = 2 TO 11
		IF Board$(p, o, 1) = LivePiece$ THEN
		       FOR p2 = 2 TO 11
				FOR o2 = 1 TO 20
					IF Board$(o2, p2, 1) = LivePiece$ THEN
						DIM BoardPiece$(4, 4, 2)
						boardp = p
						boardp2 = p2
						FOR r = 1 TO 4
							p2 = boardp2
							FOR t = 1 TO 4
								BoardPiece$(r, t, 1) = Board$(p, p2, 1)
								BoardPiece$(r, t, 2) = Board$(p, p2, 2)
								p2 = p2 + 1
								IF p2 = 13 THEN
									p2 = 12
									'GOSUB 950
									'RETURN
								END IF
							NEXT t
						p = p + 1
						IF p = 22 THEN RETURN
						NEXT r
						GOSUB 950
						GOSUB 100
						RETURN
					END IF
				NEXT o2
			NEXT p2
		END IF
	NEXT o
NEXT p
RETURN


950
DIM boardPiece2$(4, 4, 2), BoardPiece3$(4, 4, 2)
'PRINT "::::"
'FOR ss = 1 TO 4
'        FOR tt = 1 TO 4
'                PRINT boardPiece$(ss, tt);
'        NEXT tt
'        PRINT
'NEXT ss
PRINT
PRINT

FOR u2 = 1 TO 4
	FOR n2 = 1 TO 4
		boardPiece2$(u2, n2, 1) = BoardPiece$(u2, n2, 1)
	NEXT n2
NEXT u2
uq = 0
nq = 0
FOR uq = 1 TO 4
	FOR nq = 1 TO 4    '(down) takes all frozen and outline charaters out
		IF BoardPiece$(uq, nq, 1) = FrozenPiece$ OR BoardPiece$(uq, nq, 1) = CHR$(179) OR BoardPiece$(uq, nq, 1) = CHR$(205) THEN
			BoardPiece$(uq, nq, 1) = empty$
		END IF
	NEXT nq
NEXT uq
FOR x3 = 1 TO 4          'rotates boardPiece3
	FOR y3 = 1 TO 4
		      BoardPiece3$(y3, (5 - x3), 1) = BoardPiece$(x3, y3, 1)
		      BoardPiece3$(y3, (5 - x3), 2) = BoardPiece$(x3, y3, 2)
	NEXT y3
NEXT x3
'PRINT "I rotated it"
'FOR ss = 1 TO 4
'        FOR tt = 1 TO 4
'                PRINT boardPiece3$(ss, tt);
'        NEXT tt
'        PRINT
'NEXT ss
'                              moving all the way to the left inside boardpiece
WHILE BoardPiece3$(1, 1, 1) = empty$ AND BoardPiece3$(2, 1, 1) = empty$ AND BoardPiece3$(3, 1, 1) = empty$ AND BoardPiece3$(4, 1, 1) = empty$
	FOR g5 = 1 TO 3
		FOR x5 = 1 TO 4
			SWAP BoardPiece3$(x5, g5, 1), BoardPiece3$(x5, g5 + 1, 1)
			SWAP BoardPiece3$(x5, g5, 2), BoardPiece3$(x5, g5 + 1, 2)
		NEXT x5
	NEXT g5
WEND
'PRINT "I fixed it"
'FOR ss = 1 TO 4
'        FOR tt = 1 TO 4
'                PRINT boardPiece3$(ss, tt);
'        NEXT tt
'        PRINT
'NEXT ss
'PRINT "Let's compare"
'PRINT
'PRINT "Original"
'FOR ss = 1 TO 4
'        FOR tt = 1 TO 4
'                PRINT boardPiece2$(ss, tt);
'        NEXT tt
'        PRINT
'NEXT ss
'PRINT "Rotated"
'FOR ss = 1 TO 4
'        FOR tt = 1 TO 4
'                PRINT boardPiece3$(ss, tt);
'        NEXT tt
'        PRINT
'NEXT ss

FOR g2 = 1 TO 4 '                  if you can't put it back into board return
	FOR h2 = 1 TO 4
		IF boardPiece2$(g2, h2, 1) = FrozenPiece$ OR boardPiece2$(g2, h2, 1) = CHR$(179) THEN
		IF BoardPiece3$(g2, h2, 1) = LivePiece$ THEN
			GOSUB 972
			GOTO 979
		END IF
		END IF
	NEXT h2
NEXT g2
979
GOTO 980

REM ********************************************************************
972


'Push left if obstructed
DIM BoardPiece4$(4, 8, 2)
		    ' THIS IS MIGHT BE THE PROB

FOR ss = 1 TO 4
	FOR tt = 1 TO 8
		BoardPiece4$(ss, tt, 1) = empty$

	NEXT tt
NEXT ss

FOR x951 = 1 TO 4
	FOR y951 = 1 TO 4
		BoardPiece4$(x951, y951, 1) = BoardPiece3$(x951, y951, 1)
		BoardPiece4$(x951, y951, 2) = BoardPiece3$(x951, y951, 2)
		IF boardPiece2$(x951, y951, 1) <> LivePiece$ THEN
			BoardPiece4$(x951, y951 + 4, 1) = boardPiece2$(x951, y951, 1)
		END IF
	NEXT y951
NEXT x951


'PRINT "BIG PIECE"
'FOR ss = 1 TO 4
'        FOR tt = 1 TO 8
'                PRINT boardPiece4$(ss, tt);
'        NEXT tt
'        PRINT
'NEXT ss






canMove$ = "yes"
moveRight = -1

WHILE canMove$ = "yes"
	GOSUB 990
	moveRight = moveRight + 1
WEND

boardp2 = boardp2 - 4 + moveRight

RETURN

REM *****************************************************************
980
'PRINT "You can clear this"
'FOR ss = 0 TO 3 '
'        FOR tt = 0 TO 3
'                PRINT board$(ss + boardp, tt + boardp2, 1);
'        NEXT tt
'        PRINT
'NEXT ss

FOR ty = 0 TO 3                      'clears board$
	FOR yu = 0 TO 3
		IF Board$((ty + boardp), (yu + boardp2), 1) = LivePiece$ THEN
			Board$((ty + boardp), (yu + boardp2), 1) = empty$
			Board$((ty + boardp), (yu + boardp2), 2) = ""
		END IF
	NEXT yu
NEXT ty
'PRINT "bp, bp2="; boardp; boardp2
'PRINT "'Cleared' board"
'FOR ss = 1 TO 4
'        FOR tt = 1 TO 4
'                PRINT board$(-1 + ss + boardp, -1 + tt + boardp2,1);
'        NEXT tt
'        PRINT
'NEXT ss
'PRINT " NOW, for some reason its"; board$(2, 6, 1)


FOR x10 = 0 TO 3                     'put piece back to board$
	FOR y10 = 0 TO 3
		IF BoardPiece3$(x10 + 1, y10 + 1, 1) = LivePiece$ THEN
			Board$(x10 + boardp, y10 + boardp2, 1) = LivePiece$
			Board$(x10 + boardp, y10 + boardp2, 2) = BoardPiece3$(x10 + 1, y10 + 1, 2)
		END IF
	NEXT y10
NEXT x10
RETURN


990
x900 = 4
y900 = 8
canMove$ = "yes"
piece3$ = "full"
FOR x900 = 4 TO 1 STEP -1
	FOR y900 = 8 TO 1 STEP -1
		IF BoardPiece4$(x900, y900, 1) = LivePiece$ THEN
			PRINT "x = "; x900; "y = "; y900
			IF BoardPiece4$(x900, y900 + 1, 1) <> empty$ THEN
				canMove$ = "no"
				RETURN
			ELSE
				x900 = x900 - 1
				y900 = 9
			END IF
		END IF
	NEXT y900
NEXT x900
FOR x901 = 4 TO 1 STEP -1
	FOR y901 = 8 TO 1 STEP -1
		IF BoardPiece4$(x901, y901, 1) = LivePiece$ THEN
			IF BoardPiece4$(x901, y901 + 1, 1) = empty$ THEN
				BoardPiece4$(x901, y901, 1) = empty$
				BoardPiece4$(x901, y901 + 1, 1) = LivePiece$
				SWAP BoardPiece4$(x901, y901, 2), BoardPiece4$(x901, y901 + 1, 2)
			END IF
		END IF
	NEXT y901
NEXT x901
PRINT "I moved It"
RETURN

1000
TimesCleared = 0
FOR g = 1 TO 20
	IF Board$(g, 2, 1) = FrozenPiece$ AND Board$(g, 3, 1) = FrozenPiece$ AND Board$(g, 4, 1) = FrozenPiece$ AND Board$(g, 5, 1) = FrozenPiece$ AND Board$(g, 6, 1) = FrozenPiece$ AND Board$(g, 7, 1) = FrozenPiece$ AND Board$(g, 8, 1) =  _
FrozenPiece$ AND Board$(g, 9, 1) = FrozenPiece$ AND Board$(g, 10, 1) = FrozenPiece$ AND Board$(g, 11, 1) = FrozenPiece$ THEN
		TimesCleared = TimesCleared + 1
		FOR h = 2 TO 11
			Board$(g, h, 1) = empty$
			Board$(g, h, 2) = ""

		NEXT h
		
		v1000 = g

	END IF
NEXT g
'SLEEP .5
FOR x1000 = 1 TO TimesCleared
	FOR k = v1000 TO 2 STEP -1
		FOR l = 2 TO 11
			SWAP Board$(k, l, 1), Board$(k - 1, l, 1)
			SWAP Board$(k, l, 2), Board$(k - 1, l, 2)
		NEXT l
	NEXT k
NEXT x1000

Differance = 10000 - (score MOD 10000)
IF score + TimesCleared ^ 2 * 100 > Differance THEN level = level + 1
score = score + TimesCleared ^ 2 * 100
GOSUB 100
RETURN

		
1100
WHILE 1 = 1
	FOR xq = 2 TO 11
	       FOR dq = 21 TO 1 STEP -1
			IF Board$(dq, xq, 1) = LivePiece$ THEN
				IF Board$(dq + 1, xq, 1) <> empty$ THEN
					stop$ = "yes"
					GOSUB 500
					RETURN
				ELSE
					xq = xq + 1
					dq = 21
				END IF
			END IF
		NEXT dq
	NEXT xq
	FOR xs = 21 TO 1 STEP -1
		FOR yq = 2 TO 11                                  ' move piece down
			IF Board$(xs, yq, 1) = LivePiece$ THEN
				IF Board$(xs + 1, yq, 1) = empty$ THEN
					Board$(xs, yq, 1) = empty$
					Board$(xs + 1, yq, 1) = LivePiece$
					SWAP Board$(xs, yq, 2), Board$(xs + 1, yq, 2)
					move$ = "i_did"
				ELSE
					stop$ = "yes"
					move$ = "i_didn't"
				END IF

			END IF
		NEXT yq
		IF move$ = "i_didn't" THEN
			GOSUB 500
			RETURN
		END IF
       NEXT xs
WEND
RETURN

1200
CLS
LOCATE 20, 33
PRINT "Press r to resume"
TIMER OFF
DO
IF INKEY$ = CHR$(27) THEN
	GOSUB 100
	END
END IF
LOOP WHILE INKEY$ <> "r"
TIMER ON
GOSUB 100
RETURN


1300
FOR x1300 = 1 TO 20
	FOR y1300 = 2 TO 11
		IF Board$(x1300, y1300, 1) = FrozenPiece$ THEN Board$(x1300, y1300, 1) = empty$
	NEXT y1300
NEXT x1300
RETURN

1400
TIMER OFF
PRINT "1 - Square"
PRINT "2 - L"
PRINT "3 - T"
PRINT "4 - Backwards L"
PRINT "5 - S"
PRINT "6 - Z"
PRINT "7 - Straight"
1404 INPUT "", NextPiece
IF NextPiece > 7 OR NextPiece < 1 THEN GOTO 1404

FOR x1402 = 1 TO 20
	FOR y1402 = 2 TO 11
		IF Board$(x1402, y1402, 1) = LivePiece$ THEN Board$(x1402, y1402, 1) = empty$
	NEXT y1402
NEXT x1402

CurrentPiece = NextPiece
IF NextPiece = 1 THEN
	ColorNext = 14
	Board$(1, 6, 1) = LivePiece$
	Board$(1, 7, 1) = LivePiece$
	Board$(2, 6, 1) = LivePiece$
	Board$(2, 7, 1) = LivePiece$
ELSEIF NextPiece = 2 THEN
	ColorNext = 9
	Board$(1, 5, 1) = LivePiece$
	Board$(1, 6, 1) = LivePiece$
	Board$(1, 7, 1) = LivePiece$
	Board$(2, 5, 1) = LivePiece$
ELSEIF NextPiece = 3 THEN
	ColorNext = 13
	Board$(1, 5, 1) = LivePiece$
	Board$(1, 6, 1) = LivePiece$
	Board$(1, 7, 1) = LivePiece$
	Board$(2, 6, 1) = LivePiece$
ELSEIF NextPiece = 4 THEN
	ColorNext = 11
	Board$(1, 5, 1) = LivePiece$
	Board$(1, 6, 1) = LivePiece$
	Board$(1, 7, 1) = LivePiece$
	Board$(2, 7, 1) = LivePiece$
ELSEIF NextPiece = 5 THEN
	ColorNext = 10
	Board$(1, 6, 1) = LivePiece$
	Board$(2, 6, 1) = LivePiece$
	Board$(2, 7, 1) = LivePiece$
	Board$(3, 7, 1) = LivePiece$
ELSEIF NextPiece = 6 THEN
	ColorNext = 6
	Board$(1, 7, 1) = LivePiece$
	Board$(2, 6, 1) = LivePiece$
	Board$(2, 7, 1) = LivePiece$
	Board$(3, 6, 1) = LivePiece$
ELSEIF NextPiece = 7 THEN
	ColorNext = 12
	Board$(1, 5, 1) = LivePiece$
	Board$(1, 6, 1) = LivePiece$
	Board$(1, 7, 1) = LivePiece$
	Board$(1, 8, 1) = LivePiece$
END IF
ColorNow = ColorNext
TIMER ON
GOTO 100
RETURN


'SELECT CASE piece
'        CASE 1: RETURN
'        CASE 2:
'                i = 0
'                j = 0
'                FOR i = 1 TO 20
'                        FOR j = 2 TO 11
'                                IF board$(i, j) = CHR$(178) THEN
'                                IF board$(i - 1, j + 1) = empty$ THEN
'                                IF board$(i + 1, j + 1) = empty$ THEN
'                                IF board$(i + 1, j + 2) = empty$ THEN
'                                        board$(i, j) = empty$
'                                        board$(i - 1, j + 1) = CHR$(178)
'                                        board$(i + 1, j + 1) = CHR$(178)
'                                        board$(i + 1, j + 2) = CHR$(178)
'                                        board$(i + 1, j) = empty$
'                                        board$(i, j + 2) = empty$
'                                        GOSUB 100
'                                        RETURN
'                                END IF
'                                END IF
'                                END IF
'                                END IF
'                                IF board$(i, j) = CHR$(178) THEN
'                                IF board$(i + 1, j - 1) = empty$ THEN
'                                IF board$(i + 2, j + 1) = empty$ THEN
'                                        board$(i, j) = empty$
'                                        board$(i + 1, j - 1) = CHR$(178)
'                                        board$(i + 2, j + 1) = CHR$(178)
'                                        board$(x, y) = empty$
'                                END IF
'                                END IF
'                                END IF
'
'                        NEXT j
'                NEXT i
'        CASE 3: RETURN
'        CASE 4: RETURN
'        CASE 5: RETURN
'        CASE 6: RETURN
'        CASE 7:
'                i = 0
'                j = 0
'                FOR i = 1 TO 20
'                        FOR j = 2 TO 11
'                                IF board$(i, j) = CHR$(178) THEN
'                                IF board$(i, j + 1) = CHR$(178) THEN
'                                IF board$(i, j + 2) = CHR$(178) THEN
'                                IF board$(i, j + 3) = CHR$(178) THEN
'                                IF board$(i - 2, j + 2) = empty$ THEN
'                                IF board$(i - 1, j + 2) = empty$ THEN
'                                IF board$(i + 1, j + 2) = empty$ THEN
'                                        board$(i, j) = empty$
'                                        board$(i, j + 1) = empty$
'                                        board$(i, j + 3) = empty$
'                                        board$(i - 2, j + 2) = CHR$(178)
'                                        board$(i + 1, j + 2) = CHR$(178)
'                                        board$(i - 1, j + 2) = CHR$(178)
'                                        GOSUB 100
'                                        RETURN
'                                END IF
'                                END IF
'                                END IF
'                                END IF
'                                END IF
'                                END IF
'                                END IF
'                        NEXT j
'                NEXT i
'
'END SELECT

