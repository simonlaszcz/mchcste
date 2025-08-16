; vim:ts=10:expandtab:

          output	mchcste.prg
          machine	mc68000
          opt	atari
          opt	brs
          opt	xdebug

P_COOKIES	= $5a0
Supexec	= 38
Cconws	= 9

          rsreset
c_id	rs.l	1
c_value	rs.l	1
c_len	rs.b	0

          section	text
main
          pea	su
          move.w	#Supexec,-(sp)
          trap	#14
          addq.l	#6,sp

          clr.w	-(sp)
          trap	#1

su
          move.l	P_COOKIES,d7
          beq	.exit
          movea.l	d7,a6
.find_mch
          tst.l	c_id(a6)
          beq	.exit

          cmpi.l	#'_MCH',c_id(a6)
          beq	.found_mch

          adda.l	#c_len,a6
          bra	.find_mch

.found_mch
          move.l	c_value(a6),d6
          cmpi.l	#$00010008,d6	;STE+IDE
          bne	.ismega
          bra	.clear
.ismega
          cmpi.l	#$00010018,d6	;MSTE+IDE
          bne	.exit
.clear
          bclr	#3,d6
          move.l	d6,c_value(a6)
          pea	OKMSG
          move.w	#Cconws,-(sp)
          trap	#1
          addq.l	#6,sp
.exit
          rts

          section	data
OKMSG	dc.b	13,10,27,'p'
          dc.b	"(M)STE IDE flag was cleared"
          dc.b	27,'q',13,10,0
          even
