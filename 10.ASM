COMMENT*输出规则三角形图案*
CODE	SEGMENT
	ASSUME	CS:CODE
START:	MOV	AH,1H
	INT	21H
	SUB	AL,30H
	
	XOR	CH,CH
	XOR	AH,AH	
	MOV	BL,1H
	MOV	BH,AL		
	MOV	DH,AL
	MOV	CL,AL

	MOV	DL,0DH;回车换行
	MOV	AH,2H
	INT	21H
	MOV	DL,0AH
	INT	21H		
	
AGAIN:	PUSH	CX

	MOV	CL,BH
SHOW1:	MOV	DL,20H;输出空格
	MOV	AH,2
	INT	21H	
	LOOP	SHOW1
	SUB	BH,1
	
	MOV	CL,BL
SHOW2:	MOV	DL,03H;输出图案
	MOV	AH,2
	INT	21H	
	LOOP	SHOW2
	ADD	BL,2

	MOV	DL,0DH;回车换行
	MOV	AH,2
	INT	21H
	INT	21H

	POP	CX
	LOOP	AGAIN

	MOV	CL,DH
SHOW3:	MOV	DL,20H;树根
	MOV	AH,2
	INT	21H	
	LOOP	SHOW3	
	MOV	DL,124
	MOV	AH,2
	INT	21H
	INT	21H

	MOV	AH,4CH
	INT	21H
CODE	ENDS
	END	START
	
