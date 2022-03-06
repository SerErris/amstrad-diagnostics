MODULE CPCDiagRomBoard

@CPCDiagRomBoardDisableLowerROM:
	; Disable CPCDiagRomBoard lower ROM so system lower ROM is accessible
  ; CPCDiagRomBoard interprets bit7 of the dataword for the Upper ROM select byte.
  ; 0=enabled (default) 1=disabled. Any normal rom select operation will enable rom0 again.
  ;Deactivate Lower ROM and enables Upper ROM 0
  LD BC,&DF80            ;output Romselect - bit7 high
                         ;it also selects Upper Rom 0
  OUT (C),C              ;output C to &DFxx
  ret

@CPCDiagRomBoardEnableLowerROM:
  ;Enables Lower AND Upper ROM0 from the Board.
  LD BC,&DF00            ;output Romselect - bit7 low.
                         ;it also selects Upper Rom 0
  OUT (C),C              ;output C to &DFxx
  ret

;; Variable, but this resides in RAM, so that's OK
ScratchByte: db 0

 ENDMODULE
