.DATA
    ZERO: .BYTE 0b11101101
    ONE: .BYTE 0b01100000
    TWO: .BYTE 0b11001110
    THREE: .BYTE 0b11101010
    FOUR: .BYTE 0b01100011
    FIVE: .BYTE 0b10101011
    SIX: .BYTE 0b10101111
    SEVEN: .BYTE 0b11100000
    EIGHT: .BYTE 0b11101111
    NINE: .BYTE 0b11101011
    A: .BYTE 0b11100111
    B: .BYTE  0b11101111
    C: .BYTE 0b10001101
    D: .BYTE 0b11101101
    E: .BYTE 0b10001111
    F: .BYTE 0b10000111

.TEXT

    MOV R0,#0

    ALWAYS:
        SWI 0x202
        CMP R0,#1
        BEQ FORWARD
        CMP R0,#2
        BEQ BACKWARD
        B ALWAYS
    
    FORWARD:
        MOV R3,#16
        MOV R2,#1
        LDR R1,=ZERO
        LOOP1:
            LDRB R0,[R1]
            SWI 0x200
            BL DELAY
            ADD R1,R1,R2
            SUB R3,R3,#1
            CMP R3,#0
            BNE LOOP1
        B ALWAYS

    BACKWARD:
        MOV R3,#16
        MOV R2,#-1
        LDR R1,=F
        LOOP2:
            LDRB R0,[R1]
            SWI 0x200
            BL DELAY
            ADD R1,R1,R2
            SUB R3,R3,#1
            CMP R3,#0
            BNE LOOP2
        B ALWAYS

    DELAY: 
        MOV R4,#8000
        DELAYCOUNT:
        SUB R4,R4,#1
        CMP r4,#0
        BGE DELAYCOUNT
        MOV PC,LR
   
        
