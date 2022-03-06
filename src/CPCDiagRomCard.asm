MODULE CPCDiagRomCard

@CPCDiagRomCardDisableLowerROM:
  ; Disable CPCDiagRomBoard lower ROM so system lower ROM is accessible
  ; CPCDiagRomBoard interprets bit7 of the dataword for the Upper ROM select byte.
  ; 0=enabled (default) 1=disabled. Any normal rom select operation will enable rom0 again.
  ;Deactivate Lower ROM and enables Diag Upper ROM
  LD A,(UpperROMConfig)    ;load the Romnumber of DIAG ROM
  LD B,&DF                 ;output Romselect
  LD C,&80                 ;unselect the Lower ROM (bit7 high)
  OR C                     ;
  OUT (C),A                ;output C to &DFxx
  ret

@CPCDiagRomCardEnableLowerROM:
  ;Enables Lower AND Upper ROM0 from the Board.
  LD C,(UpperRomConfig)  ;load Romnumber of DIAG Rom
  LD B,&DF               ;output Romselect - bit7 low.
                         ;it also selects Upper Rom 0
  OUT (C),C              ;output C to &DFxx
  ret

ENDMODULE
