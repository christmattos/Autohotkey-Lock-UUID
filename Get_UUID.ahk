; Source do arquivo => https://www.autohotkey.com/boards/viewtopic.php?t=71638

MsgBox % UUID()
Clipboard := UUID() ; Coloca o UUID no clipboard

; Função UUID
; 	retorna o UUID do computador na SMBIOS.
;	isso é único para cada computador.
UUID()
{
	For obj in ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\" . A_ComputerName . "\root\cimv2").ExecQuery("Select * From Win32_ComputerSystemProduct")
	return obj.UUID	; http://msdn.microsoft.com/en-us/library/aa394105%28v=vs.85%29.aspx
}