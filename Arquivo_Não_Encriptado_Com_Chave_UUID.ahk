UUID_User := "XXXXXXXXXX" ; Coloque aqui o UUID que veio no arquivo GET_UUID
If !(UUID_User = UUID())
{
	MsgBox Não funcionou
	ExitApp
}
MsgBox Funcionou

UUID()
{
	For obj in ComObjGet("winmgmts:{impersonationLevel=impersonate}!\\" . A_ComputerName . "\root\cimv2").ExecQuery("Select * From Win32_ComputerSystemProduct")
		return obj.UUID	; http://msdn.microsoft.com/en-us/library/aa394105%28v=vs.85%29.aspx
}