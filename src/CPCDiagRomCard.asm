 MODULE CPCDiagRomCard

@CPCDiagRomCardDisableLowerROM:
	; Disable CPCDiagRomBoard lower ROM so system lower ROM is accessible
	; CPCDiagRomBoard interprets bit7 of the dataword for the Upper ROM select byte.
	; 0=enabled (default) 1=disabled. Any normal rom select operation will enable rom0 again.
	;Deactivate Lower ROM and enables Diag Upper ROM
	LD BC,#FBEC              ;Address of DiagRom for ROM disable
	LD A,1                   ;disable rom
	OUT (C),A                ;output C to &FBEC
	ret

@CPCDiagRomCardEnableLowerROM:
	;Enables Lower AND Upper ROM0 from the Board.
	LD BC,#FBEC              ;Address of DiagRom for ROM disable
	LD A,0                   ;enable rom
	OUT (C),A                ;output A to &FBEC
	ret
  
 ENDMODULE
