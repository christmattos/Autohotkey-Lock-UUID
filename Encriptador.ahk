/*
;-------------------------------
  AHK Source Code Encryptor v3.2  By FeiYue

  Source do arquivo => https://www.autohotkey.com/boards/viewtopic.php?t=42494

  1. This tool can encrypt the AHK script into a self decode script.

  2. Then you can use ahk2exe to compile the script into a program,
     combined with mpress.exe or upx.exe packers.
     Note: To compile the script, you must have a AutoHotkey.exe
     in the script directory.

  3. When you want to use the directory relative to the script(eg 001.jpg),
     Don't use A_ScriptDir, but use A_ScriptDir2.
     It is recommended to change the path to absolute path  %A_ScriptDir2%\001.jpg.

  4. When you want to Reload your own script, the built-in Reload command will fail,
     You can use Reload() function instead (it's added when encrypted).

;-------------------------------
*/

#NoEnv
#SingleInstance force
ListLines, Off
SetBatchLines, -1
Version = 3.2

fs=
(` %

; You can compile and set icons by using Ahk2Exe.exe.
; If AutoHotkey.exe wants to change its name to abc.exe,
; please modify Ahk=%A_ScriptDir%\abc.exe.

#NoEnv
#NoTrayIcon
#SingleInstance off
SetBatchLines, -1
ScriptGuard1()
ScriptGuard1()  ; By TAC109
{
  if (!A_IsCompiled)
    return
  ahk:=">AUTOHOTKEY SCRIPT<", Ptr:=(A_PtrSize ? "UPtr":"UInt")
  if (rc:=DllCall("FindResource", Ptr,0, "Str",ahk, Ptr,10, Ptr))
  && (sz:=DllCall("SizeofResource", Ptr,0, Ptr,rc, "Uint"))
  && (pt:=DllCall("LoadResource", Ptr,0, Ptr,rc, Ptr))
  && (pt:=DllCall("LockResource", Ptr,pt, Ptr))
  && (DllCall("VirtualProtect", Ptr,pt, Ptr,sz, "UInt",0x40, "UInt*",rc))
    DllCall("RtlZeroMemory", Ptr,pt, "UInt",sz)
}

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
  Try
  {
    if (A_IsCompiled)
      Run *RunAs "%A_ScriptFullPath%" /restart
    else
      Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
  }
  ExitApp
}

Ahk=%A_ScriptDir%\AutoHotkey.exe
if (A_IsCompiled)
  FileInstall, AutoHotkey.exe, %Ahk%
Exec(s, Ahk)
ExitApp

)
fs=%fs%`n
(` %

Exec(str, Ahk="", args="") {
  static MyFunc, base
  SetBatchLines, -1
  Ptr:=(A_PtrSize ? "UPtr":"UInt"), AStr:=(A_IsUnicode ? "AStr":"Str")
  Ahk:=InStr(Ahk,"\\.\pipe\") or (Ahk="") ? A_AhkPath : Ahk
  IfNotExist, %Ahk%
  {
    MsgBox, 4096, Error!, `nCan't Find:`n`n%Ahk%`n`t
    return
  }
  if (!MyFunc)
  {
    x32:=""
    . "5557565381ECEC0100008B9C24080200008BAC240C0200008B433C01D8803850"
    . "0F85580A0000807801450F854E0A00008B7878C744247C0000000001DF89F88B"
    . "4F188B7F1C8B50208B40248944243031C085C98D34137513E9E30900008D7600"
    . "83C00139C10F84D50900008B1486813C134765745075E9817C1304726F634175"
    . "DF8B4C24308D04430FB704088D04838B343885F68974247C0F84A2090000B865"
    . "00000001DE891C2466898424AE0000008D8424A6000000C78424A60000005772"
    . "6974C78424AA0000006546696C89442404FFD683EC088944243C8D8424BB0000"
    . "00891C24C78424BB000000476C6F62C78424BF000000616C416CC78424C30000"
    . "006C6F630089442404FFD683EC0889C7B86565000066898424B80000008D8424"
    . "B0000000891C24C78424B0000000476C6F62C78424B4000000616C4672C68424"
    . "BA0000000089442404FFD683EC0889442448B873410000891C24668984240501"
    . "00008D8424F9000000C78424F900000043726561C78424FD00000074655072C7"
    . "8424010100006F636573C68424070100000089442404FFD683EC088944244C8D"
    . "84243A010000891C24C784243A01000043726561C784243E01000074654E61C7"
    . "8424420100006D656450C784244601000069706541C684244A01000000894424"
    . "04FFD683EC08894424508D84244B010000891C24C784244B010000436F6E6EC7"
    . "84244F0100006563744EC7842453010000616D6564C784245701000050697065"
    . "C684245B0100000089442404FFD683EC08894424588D8424C7000000891C24C7"
    . "8424C7000000436C6F73C78424CB0000006548616EC78424CF000000646C6500"
    . "89442404FFD683EC08894424388D842484010000891C24C78424840100005175"
    . "6572C784248801000079506572C784248C010000666F726DC784249001000061"
    . "6E6365C7842494010000436F756EC78424980100007465720089442404FFD683"
    . "EC08894424548D842494000000891C24C78424940000006C737472C784249800"
    . "000063617441C684249C0000000089442404FFD683EC08894424308D84249D00"
    . "0000891C24C784249D0000006C737472C78424A10000006C656E41C68424A500"
    . "00000089442404FFD683EC08894424348D8424D3000000891C24C78424D30000"
    . "0043726561C78424D700000074654669C78424DB0000006C65410089442404FF"
    . "D683EC088944245C8D8424DF000000891C24C78424DF00000047657446C78424"
    . "E3000000696C6553C78424E7000000697A650089442404FFD683EC0889442460"
    . "B867410000891C24668984246C0100008D84245C010000C784245C0100004372"
    . "6561C784246001000074654669C78424640100006C654D61C784246801000070"
    . "70696EC684246E0100000089442404FFD683EC08BA65000000894424648D8424"
    . "EB00000066899424F7000000891C24C78424EB0000004D617056C78424EF0000"
    . "006965774FC78424F30000006646696C89442404FFD683EC08894424688D8424"
    . "2A010000891C24C784242A010000556E6D61C784242E01000070566965C78424"
    . "32010000774F6646C7842436010000696C650089442404FFD683EC088D5C247C"
    . "8944246CC744241000000000C744240800000000896C2404895C240CC7042400"
    . "000000FF54243C83EC148B4C247C85C9894C24400F85D60500008B8C24000200"
    . "00890C24FF54243483EC043DE27F00000F8FC10500008B8424100200008D0485"
    . "040000003DFF7F0000894424440F865F0500008944247C89442404C704240000"
    . "0000FFD783EC0885C089C60F84BD0500008D842488000000C784246F0100005C"
    . "5C2E5CC784247301000070697065C78424770100005C41484BC784247B010000"
    . "31323334C784247F01000035363738C684248301000000890424FF54245483EC"
    . "048B8424880000008D9C246F010000891C248944247CFF54243483EC048D1403"
    . "8D7C03F88B4C247C908DB4260000000089C883EA01C1E90483E00F83C0418802"
    . "39D775ECB820220000894C247CC784248100000022202F666689842485000000"
    . "8B842400020000C684248700000000C60622C646010089342489442404FF5424"
    . "3083EC088DBC2481000000893424897C2404FF54243083EC08895C2404893424"
    . "FF54243083EC08897C2404C684248300000000893424FF54243083EC08893424"
    . "FF54243483EC0489C78B8C2404020000890C24FF54243401C783EC0481FFFF7F"
    . "00000F8E1C040000891C248B7C2450C744241C00000000C744241800000000C7"
    . "44241400000000C744241000000000C744240CFF000000C744240800000000C7"
    . "44240402000000FFD783EC20891C2489442430C744241C00000000C744241800"
    . "000000C744241400000000C744241000000000C744240CFF000000C744240800"
    . "000000C744240402000000FFD783EC2089C3837C2430FF0F84FB03000083F8FF"
    . "0F84F20300008D8C249C0100008D9424E0010000C744247C4400000089C86690"
    . "C6000083C00139D075F68D842408010000C784249C01000044000000894C2420"
    . "C744241C00000000C74424180000000089442424C744241400000000C7442410"
    . "00000000C744240C00000000C74424080000000089742404C7042400000000FF"
    . "54244C83EC2885C00F84300300008B8424080100008B7C243889042489F8FFD0"
    . "83EC048B84240C01000089042489F8FFD083EC048B84241002000085C0742A8B"
    . "8C241002000031C0908DB426000000008B54850089148683C00139C175F28B44"
    . "244483E804894424408B442440C70406000000008B842400020000C744241800"
    . "000000C744241400000000C744241003000000C744240C00000000C744240803"
    . "000000C744240400000080890424FF54245C83EC1C83F8FF89C5894424340F84"
    . "74010000C744240400000000890424FF54246083EC0889C7C744241400000000"
    . "C744241000000000C744240C00000000C744240802000000C744240400000000"
    . "892C24FF54246483EC1885C0894424400F8414010000C744241000000000C744"
    . "240C00000000C744240800000000C744240404000000890424FF54246883EC14"
    . "85C089C10F84D200000089F8BA5917B7D1C78424180100006F000000F7E2B864"
    . "000000C784241C01000071000000C784242001000075000000C7842424010000"
    . "7700000089D7BA6F000000C1EF0D69FF10270000C1EF0283FF630F46F831C0EB"
    . "0C89C283E2038B94941801000069D28300000003148189C583C00183E50339C7"
    . "8994AC1801000075D88BBC241002000031D285FF743C8BBC24100200008D7600"
    . "89D083E00369AC84180100008300000001D589AC84180100008B0496D1C029E8"
    . "D1C029E88944247C89049683C20139D775CE890C24FF54246C83EC048B442440"
    . "890424FF54243883EC048B442434890424FF54243883EC048B7C24308B6C2458"
    . "C744240400000000893C2489E8FFD083EC08893C248B7C243889F8FFD083EC04"
    . "89E8C744240400000000891C24FFD083EC088B6C24448D44247CC74424100000"
    . "000089742404891C248944240C896C2408FF54243C83EC1489F8891C24FFD083"
    . "EC0489F08D542EFC8B8C241002000085C9740DC7000000000083C00439D075F3"
    . "893424FF54244883EC0431C081C4EC0100005B5E5F5DC214008DB42600000000"
    . "B8FEFFFFFF81C4EC0100005B5E5F5DC21400C744247C00800000B800800000E9"
    . "93FAFFFF8B84240402000089342489442404FF54243083EC08E9CAFBFFFF81C4"
    . "EC010000B8FFFFFFFF5B5E5F5DC21400B8FCFFFFFFEBAEB8FBFFFFFFEBA78B44"
    . "24308B7C243889042489F8FFD083EC0489F8891C24FFD083EC04893424FF5424"
    . "48B8F8FFFFFF83EC04E977FFFFFFB8FAFFFFFFE96DFFFFFF8B4424308B7C2438"
    . "89042489F8FFD083EC0489F8891C24FFD083EC04893424FF542448B8F9FFFFFF"
    . "83EC04E93DFFFFFF9090909090909090"
    x64:=""
    . "4157415641554154555756534881ECE8020000B8FFFFFFFF8B9C245003000048"
    . "89942438030000418B503C4D89C548898C24300300004C89CE4C01C2803A500F"
    . "8536090000807A01450F852C0900008B8288000000C78424CC00000000000000"
    . "4C01C08B48188B5020448B481C448B502431C085C94D8D04107511E910090000"
    . "4883C00139C10F8604090000418B148041817C15004765745075E541817C1504"
    . "726F634175DA498D444500420FB70410498D448500468B24084585E44489A424"
    . "CC0000000F84C608000048B8577269746546696CBA650000004D01EC66899424"
    . "180100004C89E9488D942410010000488984241001000041FFD44989C6488984"
    . "248000000048B8476C6F62616C416C488D9424300100004C89E9488984243001"
    . "0000C78424380100006C6F630041FFD4B9656500004989C748B8476C6F62616C"
    . "467266898C2428010000488D9424200100004C89E94889842420010000C68424"
    . "2A0100000041FFD441B873410000488944246048B84372656174655072664489"
    . "84248C010000488D9424800100004C89E94889842480010000C7842488010000"
    . "6F636573C684248E0100000041FFD4488944246848B84372656174654E61488D"
    . "9424B001000048898424B001000048B86D656450697065414C89E948898424B8"
    . "010000C68424C00100000041FFD4488944247048B8436F6E6E6563744E488D94"
    . "24D001000048898424D001000048B8616D6564506970654C89E948898424D801"
    . "0000C68424E00100000041FFD4488984248800000048B8436C6F736548616E48"
    . "8D9424400100004C89E94889842440010000C7842448010000646C650041FFD4"
    . "488944245848B85175657279506572488D942430020000488984243002000048"
    . "B8666F726D616E63654C89E9488984243802000048B8436F756E746572004889"
    . "84244002000041FFD4488944247848B86C73747263617441488D9424F0000000"
    . "4C89E948898424F0000000C68424F80000000041FFD44889C748B86C7374726C"
    . "656E41488D9424000100004C89E94889842400010000C68424080100000041FF"
    . "D44889C548B84372656174654669488D9424500100004C89E948898424500100"
    . "00C78424580100006C65410041FFD4488984249000000048B847657446696C65"
    . "53488D9424600100004C89E94889842460010000C7842468010000697A650041"
    . "FFD448898424A000000048B8437265617465466941B96741000048898424F001"
    . "000048B86C654D617070696E6644898C2400020000488D9424F00100004C89E9"
    . "48898424F8010000C68424020200000041FFD441BA6500000048898424A80000"
    . "0048B84D6170566965774F66448994247C010000488D9424700100004C89E948"
    . "89842470010000C78424780100006646696C41FFD448898424B000000048B855"
    . "6E6D6170566965488D942490010000488984249001000048B8774F6646696C65"
    . "004C89E9488984249801000041FFD4488D8C24CC00000048898424B800000045"
    . "31C048C7442420000000004889F24C89F048898C24980000004989C931C9FFD0"
    . "448B9C24CC000000B8FCFFFFFF4585DB0F8505050000488B8C2430030000FFD5"
    . "3DE27F00000F8F33050000448D2C9D040000004181FDFF7F00000F86F7040000"
    . "4489AC24CC0000004489EA31C941FFD74885C04989C60F845805000048B85C5C"
    . "2E5C70697065488D8C24E0000000C78424200200003536373848898424100200"
    . "0048B85C41484B31323334C6842424020000004889842418020000488B442478"
    . "4C8DA42410020000FFD08B8424E00000004C89E1898424CC000000FFD58B8C24"
    . "CC0000008D50FF448D48F70F1F44000089C84189D083EA0183E00FC1E90483C0"
    . "414439CA428884041002000075E24C8DBC24D0000000B820220000898C24CC00"
    . "0000C78424D000000022202F6666898424D40000004C89F1C68424D600000000"
    . "488B94243003000041C6062241C6460100FFD74C89FA4C89F1FFD74C89E24C89"
    . "F1FFD74C89FA4C89F1C68424D200000000FFD74C89F1FFD54189C7488B8C2438"
    . "030000FFD54101C74181FFFF7F00000F8ED70300004531C041B9FF000000BA02"
    . "0000004C89E14C8B7C247048C744243800000000C744243000000000C7442428"
    . "00000000C74424200000000041FFD74889C74531C048C744243800000000C744"
    . "243000000000C74424280000000041B9FF000000C744242000000000BA020000"
    . "004C89E141FFD74883FFFF4889C50F84970300004883F8FF0F848D030000488D"
    . "8C2470020000C78424CC00000068000000488D51684889C80F1F840000000000"
    . "C600004883C0014839D075F4488D84245002000048894C24404531C94531C031"
    . "C9C784247002000068000000488944244848C7442438000000004C89F248C744"
    . "243000000000C744242800000000C744242000000000488B442468FFD085C00F"
    . "84E00200004C8B7C2458488B8C24500200004C89F8FFD0488B8C24580200004C"
    . "89F8FFD031C085DB741B660F1F4400008B1486418914864883C00139C377F189"
    . "D848C1E00241C70406000000004531C948C744243000000000C7442428000000"
    . "00C74424200300000041B803000000BA00000080488B8C2430030000488B8424"
    . "90000000FFD04883F8FF4989C40F848301000031D24889C1488B8424A0000000"
    . "FFD04531C931D24189C748C744242800000000C74424200000000041B8020000"
    . "004C89E1488B8424A8000000FFD04885C00F84350100004889C14531C94531C0"
    . "488944246848C744242000000000BA04000000488B8424B0000000FFD04885C0"
    . "4889C14C8B5C24680F84F40000004489F8BA5917B7D1C78424A00100006F0000"
    . "00F7E2B864000000C78424A401000071000000C78424A801000075000000C784"
    . "24AC010000770000004989C8C1EA0D4469CA1027000041C1E9024183F963440F"
    . "46C8B86F00000031D2EB110F1F44000089D083E0038B8484A001000069C08300"
    . "00004103004189D283C2014183E2034983C0044139D142898494A001000075D0"
    . "31D285DB7448662E0F1F8400000000004889D083E00344698484A00100008300"
    . "00004101D044898484A0010000418B0496D1C04429C0D1C04429C0898424CC00"
    . "0000418904964883C20139D377C24C895C2468488B8424B8000000FFD04C8B5C"
    . "24684C89D9488B442458FFD04C89E1488B442458FFD0488BB4248800000031D2"
    . "4889F94889F0FFD04889F9488B7C24584889F8FFD031D24889E94889F0FFD04C"
    . "8B8C24980000004589E84C89F24889E948C744242000000000488B8424800000"
    . "00FFD04889E94889F8FFD085DB74208D53FF4C89F0498D549604660F1F440000"
    . "C700000000004883C0044839C275F14C89F1488B442460FFD031C04881C4E802"
    . "00005B5E5F5D415C415D415E415FC390B8FEFFFFFFEBE4C78424CC0000000080"
    . "0000BA00800000E9FFFAFFFF488B9424380300004C89F1FFD7E917FCFFFFB8FB"
    . "FFFFFFEBB64889F9488B7C24584889F8FFD04889E94889F8FFD04C89F1488B44"
    . "2460FFD0B8F8FFFFFFEB904889F9488B7C24584889F8FFD04889E94889F8FFD0"
    . "4C89F1488B442460FFD0B8F9FFFFFFE967FFFFFFB8FAFFFFFFE95DFFFFFF9090"
    hex:=(A_PtrSize=8 ? x64 : x32)
    VarSetCapacity(MyFunc, len:=StrLen(hex)//2)
    Loop, % len
      NumPut("0x" SubStr(hex,2*A_Index-1,2),MyFunc,A_Index-1,"uchar")
    DllCall("VirtualProtect",Ptr,&MyFunc,Ptr,len,"uint",0x40,Ptr "*",0)
    base:=DllCall("GetModuleHandle", "Str","Kernel32", Ptr)
    IfExist, %A_ScriptFullPath%
      EnvSet, My_ScriptFullPath, %A_ScriptFullPath%
  }
  GetArgs(args)
  s:=RegExReplace(str,"\s"), RegExReplace(s,"u","",size)
  VarSetCapacity(str,(size+1)*4,0), s:=SubStr(s,InStr(s,"u")+1)
  Loop, Parse, s, u
    NumPut(A_LoopField, str, (A_Index-1)*4, "uint")
  hThread:=DllCall("CreateThread", Ptr,0, Ptr,0, Ptr
    , RegisterCallback("Thread","F"), Ptr,0, "uint",0, Ptr,0)
  r:=DllCall(&MyFunc,AStr,Ahk,AStr,args,Ptr,base,Ptr,&str,"int",size)
  if (hThread)
  {
    DllCall("TerminateThread", Ptr,hThread, Ptr,0)
    DllCall("CloseHandle", Ptr,hThread)
  }
  return r
}

GetArgs(ByRef args)
{
  global
  Loop, %0%
    args.=" """ (%A_Index%) """"
}

Thread(p)
{
  SetBatchLines, -1
  DllCall("Sleep", "int",1000)
  ExitApp
}

)

if 0>0
{
  file:=%True%
  IfExist, %file%
    Gosub, Encrypt
  ExitApp
}
Gui, +AlwaysOnTop
Gui, Color, DDEEFF
Gui, Font, cRed s28
Gui, Add, Text,, Drag the AHK script here to Encrypt`n`n
Gui, Show,, AHK Source Code Encryptor v%Version%  -  By FeiYue
OnMessage(0x201, "LButton_Down")
LButton_Down() {
  SendMessage, 0xA1, 2
}
return

GuiClose:
ExitApp

GuiDropFiles:
Gui, +OwnDialogs
Loop, parse, A_GuiEvent, `n
{
  file:=A_LoopField
  MsgBox, 4100, Tip, Do you want to encrypt this file ?`n`n%file%
  IfMsgBox, Yes
  {
    Gosub, Encrypt
    MsgBox, 4096, Tip, Encryption is completed !
  }
}
return

Encrypt:
SplitPath, file,, dir
IfNotExist, % Ahk:=dir "\AutoHotkey.exe"
{
  MsgBox, 4096, Error!, `nCan't Find:`n`n%Ahk%`n`t
  Exit
}
FileRead, s, %file%
s:=RegExReplace(Encode(s,Ahk), ".{1,60}", "s.=""$0""`n")
s:=RegExReplace(fs,"i)Exec\([^\n]+\s+ExitApp","`ns=`n" s "`n$0")
f:=RegExReplace(file,"\.[^.]+$") . "-encoded.ahk"
FileDelete, %f%
FileAppend, %s%, %f%
s:=""
return

Encode(s, Ahk) {
  static MyFunc
  Ptr:=A_PtrSize ? "UPtr" : "UInt"
  if (!MyFunc)
  {
    x32:=""
    . "5557B8640000005653BA6F00000083EC108B7C24308B4C24248B5C24288B6C24"
    . "2CC704246F000000C74424047100000083FF63C744240875000000C744240C77"
    . "0000000F46F831C0EB0E8DB60000000089C283E2038B149469D2830000000354"
    . "850089C683C00183E60339C78914B475DF31D285DB743089F68DBC2700000000"
    . "89D783E7036904BC830000008D34108B04918934BC01F0D1C801F0D1C8890491"
    . "83C20139D375D983C41031C05B5E5F5DC3909090909090909090909090909090"
    x64:=""
    . "4883EC18B8640000004183F963C704246F000000C744240471000000440F46C8"
    . "C744240875000000C744240C77000000B86F0000004531D2EB0F660F1F440000"
    . "4489D083E0038B048469C0830000004103004589D34183C2014183E3034983C0"
    . "044539D14289049C75D64531C085D274324D89C24183E2034269049483000000"
    . "468D0C00428B048146890C944401C8D1C84401C8D1C8428904814983C0014439"
    . "C277CE31C04883C418C3909090909090"
    hex:=(A_PtrSize=8 ? x64:x32)
    VarSetCapacity(MyFunc, len:=StrLen(hex)//2)
    Loop, % len
      NumPut("0x" SubStr(hex,2*A_Index-1,2),MyFunc,A_Index-1,"uchar")
    DllCall("VirtualProtect",Ptr,&MyFunc,Ptr,len,"uint",0x40,Ptr "*",0)
  }
  add=
  (` %
;-----------------------
ListLines, Off
OnlyOne()
global A_ScriptDir2 := A_WorkingDir
OnlyOne(flag="") {
  EnvGet, file, My_ScriptFullPath
  if RegExMatch(file, "i)\.(exe|com|scr|bat|cmd)\s*$")
    Menu, Tray, Icon, %file%
  SetWorkingDir, % RegExReplace(file, "\\[^\\]*$")
  flag:=(flag="" ? file : flag)
  DetectHiddenWindows, % (dhw:=A_DetectHiddenWindows) ? "On":"On"
  hash:=0, Ptr:=(A_PtrSize ? "UPtr":"UInt")
  Loop, Parse, flag
    hash:=(hash*31+Asc(A_LoopField))&0xFFFFFFFF
  Name:="Ahk_OnlyOne_" hash
  While Mutex:=DllCall("OpenMutex","int",0x100000,"int",0,"str",Name)
  {
    DllCall("CloseHandle", Ptr,Mutex)
    While WinExist("<<" flag ">> ahk_class AutoHotkey")
    {
      WinGet, pid, PID
      WinClose,,, 3
      IfWinExist
      {
        Process, Close, %pid%
        Process, WaitClose, %pid%, 3
      }
    }
  }
  DllCall("CreateMutex", Ptr,0, "int",0, "str",Name)
  IfEqual, A_LastError, 0xB7, ExitApp
  pid:=DllCall("GetCurrentProcessId")
  WinSetTitle, ahk_pid %pid% ahk_class AutoHotkey,, <<%flag%>>
  DetectHiddenWindows, %dhw%
}
Reload(args="") {
  global
  Loop, %0%
    args.=" """ (%A_Index%) """"
  local file
  EnvGet, file, My_ScriptFullPath
  if (file="")
    return
  if RegExMatch(file, "i)\.(exe|com|scr|bat|cmd)\s*$")
    Run, "%file%" /f %args%,, UseErrorLevel
  else
    Run, "%A_AhkPath%" /f "%file%" %args%,, UseErrorLevel
  ExitApp
}
ListLines, On
;-----------------------
  )
  FileGetSize, pSize, %Ahk%
  FileRead, pFile, *c %Ahk%
  s:="`n" add "`n" s "`nExitApp`n#SingleInstance off`n"
  ;  . togetcode(s)
  s:=(A_IsUnicode ? chr(0xfeff) : chr(0xEF) chr(0xBB) chr(0xBF))
    . RegExReplace(s,"\R","`r`n") . "`t`t`t"
  size:=VarSetCapacity(s,-1)//4
  DllCall(&MyFunc, Ptr,&s, "uint",size
    , Ptr,&pFile, "uint",(pSize//10000)*10000/4, "Cdecl")
  VarSetCapacity(str, size*11*(!!A_IsUnicode+1))
  Loop, % size
    str.="u" . NumGet(s,(A_Index-1)*4,"uint")
  return str
}

; If you need to read the script itself, you need it
togetcode(s) {
  StringReplace, s, s, `r,, 1
  StringReplace, s, s, #, #0, 1
  r:="`n"";``"
  Loop, Parse, r
    StringReplace, s, s, %A_LoopField%, #%A_Index%, 1
  s:="`ngetcode(k) {`nListLines, Off`n"
    . "IfNotEqual,k,abc@123.com,return`ns=`n"
    . RegExReplace(s,".{1,60}","s.=""$0""`n")
    . "r:=""``n"""";````""`n"
    . "Loop, Parse, r`n"
    . "  StringReplace, s, s, #%A_Index%, %A_LoopField%, 1`n"
    . "StringReplace, s, s, #0, #, 1`n"
    . "return s`n}`n"
  return s
}

;======== The End ========

;

getfs() {
  fs=
(%

#include <windows.h>

typedef HANDLE (WINAPI * _GetProcAddress)(
  HMODULE hModule,
  LPCSTR  lpProcName );

typedef BOOL (WINAPI * _WriteFile)(
  HANDLE       hFile,
  LPCVOID      lpBuffer,
  DWORD        nNumberOfBytesToWrite,
  LPDWORD      lpNumberOfBytesWritten,
  LPOVERLAPPED lpOverlapped );

typedef HGLOBAL (WINAPI * _GlobalAlloc)(
  UINT   uFlags,
  SIZE_T dwBytes );

typedef HGLOBAL (WINAPI * _GlobalFree)(
  HGLOBAL hMem );

typedef BOOL (WINAPI * _CreateProcessA)(
  LPCSTR                lpApplicationName,
  LPSTR                 lpCommandLine,
  LPSECURITY_ATTRIBUTES lpProcessAttributes,
  LPSECURITY_ATTRIBUTES lpThreadAttributes,
  BOOL                  bInheritHandles,
  DWORD                 dwCreationFlags,
  LPVOID                lpEnvironment,
  LPCSTR                lpCurrentDirectory,
  LPSTARTUPINFOA        lpStartupInfo,
  LPPROCESS_INFORMATION lpProcessInformation );

typedef HANDLE (WINAPI * _CreateNamedPipeA)(
  LPCSTR                lpName,
  DWORD                 dwOpenMode,
  DWORD                 dwPipeMode,
  DWORD                 nMaxInstances,
  DWORD                 nOutBufferSize,
  DWORD                 nInBufferSize,
  DWORD                 nDefaultTimeOut,
  LPSECURITY_ATTRIBUTES lpSecurityAttributes );

typedef BOOL (WINAPI * _ConnectNamedPipe)(
  HANDLE       hNamedPipe,
  LPOVERLAPPED lpOverlapped );

typedef BOOL (WINAPI * _CloseHandle)(
  HANDLE hObject );

typedef BOOL (WINAPI * _QueryPerformanceCounter)(
  LARGE_INTEGER *lpPerformanceCount );

typedef LPSTR (WINAPI * _lstrcatA)(
  LPSTR  lpString1,
  LPCSTR lpString2 );

typedef int (WINAPI * _lstrlenA)(
  LPCSTR lpString );

typedef HANDLE (WINAPI * _CreateFileA)(
  LPCSTR                lpFileName,
  DWORD                 dwDesiredAccess,
  DWORD                 dwShareMode,
  LPSECURITY_ATTRIBUTES lpSecurityAttributes,
  DWORD                 dwCreationDisposition,
  DWORD                 dwFlagsAndAttributes,
  HANDLE                hTemplateFile );

typedef DWORD (WINAPI * _GetFileSize)(
  HANDLE  hFile,
  LPDWORD lpFileSizeHigh );

typedef HANDLE (WINAPI * _CreateFileMappingA)(
  HANDLE                hFile,
  LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
  DWORD                 flProtect,
  DWORD                 dwMaximumSizeHigh,
  DWORD                 dwMaximumSizeLow,
  LPCSTR                lpName );

typedef LPVOID (WINAPI * _MapViewOfFile)(
  HANDLE hFileMappingObject,
  DWORD  dwDesiredAccess,
  DWORD  dwFileOffsetHigh,
  DWORD  dwFileOffsetLow,
  SIZE_T dwNumberOfBytesToMap );

typedef BOOL (WINAPI * _UnmapViewOfFile)(
  LPCVOID lpBaseAddress );

//-----------------------------

int WINAPI DecodeAndRun(
  LPCSTR ahk_path, LPCSTR args,
  HMODULE hMod, LPDWORD str, DWORD size )
{
  DWORD i, j, k, name_num;
  PUCHAR base, addr;
  LPDWORD Addr_func, Addr_name, hMen;
  PUSHORT Addr_ord;
  HANDLE p1, p2;
  //-----------------------------
  base = (PUCHAR)hMod;
  addr = base+(*(LPDWORD)(base+0x3C));
  if (addr[0] != 'P' || addr[1] != 'E')
    return -1;
  k = (sizeof(HANDLE)==8 ? 0x88 : 0x78);
  addr = base+(*(LPDWORD)(addr+k));
  name_num  = *(LPDWORD)(addr+0x18);
  Addr_func = (LPDWORD)(base+(*(LPDWORD)(addr+0x1C)));
  Addr_name = (LPDWORD)(base+(*(LPDWORD)(addr+0x20)));
  Addr_ord  = (PUSHORT)(base+(*(LPDWORD)(addr+0x24)));
  char str0[] = "GetProcAddress";
  for (i=0, k=0; i<name_num; i++)
  {
    j=Addr_name[i];
    if ( (*(LPDWORD)(base+j)) == (*(LPDWORD)(str0))
    && (*(LPDWORD)(base+j+4)) == (*(LPDWORD)(str0+4)) )
    {
      k=Addr_func[Addr_ord[i]];
      break;
    }
  }
  if (k==0)
    return -2;
  //-----------------------------
  _GetProcAddress GetProcAddress = (_GetProcAddress)(base+k);

  char str1[] = "WriteFile";
  _WriteFile WriteFile = (_WriteFile)GetProcAddress(hMod,str1);

  char str2[] = "GlobalAlloc";
  _GlobalAlloc GlobalAlloc = (_GlobalAlloc)GetProcAddress(hMod,str2);

  char str3[] = "GlobalFree";
  _GlobalFree GlobalFree = (_GlobalFree)GetProcAddress(hMod,str3);

  char str4[] = "CreateProcessA";
  _CreateProcessA CreateProcessA = (_CreateProcessA)GetProcAddress(hMod,str4);

  char str5[] = "CreateNamedPipeA";
  _CreateNamedPipeA CreateNamedPipeA = (_CreateNamedPipeA)GetProcAddress(hMod,str5);

  char str6[] = "ConnectNamedPipe";
  _ConnectNamedPipe ConnectNamedPipe = (_ConnectNamedPipe)GetProcAddress(hMod,str6);

  char str7[] = "CloseHandle";
  _CloseHandle CloseHandle = (_CloseHandle)GetProcAddress(hMod,str7);

  char str8[] = "QueryPerformanceCounter";
  _QueryPerformanceCounter QueryPerformanceCounter = (_QueryPerformanceCounter)GetProcAddress(hMod,str8);

  char str9[] = "lstrcatA";
  _lstrcatA lstrcatA = (_lstrcatA)GetProcAddress(hMod,str9);

  char str10[] = "lstrlenA";
  _lstrlenA lstrlenA = (_lstrlenA)GetProcAddress(hMod,str10);

  char str11[] = "CreateFileA";
  _CreateFileA CreateFileA = (_CreateFileA)GetProcAddress(hMod,str11);

  char str12[] = "GetFileSize";
  _GetFileSize GetFileSize = (_GetFileSize)GetProcAddress(hMod,str12);

  char str13[] = "CreateFileMappingA";
  _CreateFileMappingA CreateFileMappingA = (_CreateFileMappingA)GetProcAddress(hMod,str13);

  char str14[] = "MapViewOfFile";
  _MapViewOfFile MapViewOfFile = (_MapViewOfFile)GetProcAddress(hMod,str14);

  char str15[] = "UnmapViewOfFile";
  _UnmapViewOfFile UnmapViewOfFile = (_UnmapViewOfFile)GetProcAddress(hMod,str15);

  //-----------------------------
  WriteFile(0, str, 0, &k, 0);
  if (k!=0)
    return -4;
  if (lstrlenA(ahk_path)>32768-30)
    return -5;
  k=(size+1)*4; if (k<32768) k=32768;
  hMen=(LPDWORD)GlobalAlloc(0, k);
  if (hMen==0)
    return -6;
  //-----------------------------
  // "ahk_path" /f "pipe_name" args
  //-----------------------------
  char pipe_name[] = "\\\\.\\pipe\\AHK12345678";
  LARGE_INTEGER count;
  QueryPerformanceCounter(&count);
  k=count.LowPart; j=lstrlenA(pipe_name);
  for (i=1; i<=8; i++, k>>=4)
    pipe_name[j-i]=(k&0xF)+'A';
  //-----------------------------
  LPSTR cmdline=(LPSTR)hMen;
  char t1[]="\" /f \"";
  cmdline[0]='\"'; cmdline[1]=0;
  lstrcatA(cmdline, ahk_path);
  lstrcatA(cmdline, t1);
  lstrcatA(cmdline, pipe_name); t1[2]=0;
  lstrcatA(cmdline, t1);
  if (lstrlenA(cmdline)+lstrlenA(args)<32768)
    lstrcatA(cmdline, args);
  //-----------------------------
  p1=CreateNamedPipeA(pipe_name, 2, 0, 255, 0, 0, 0, 0);
  p2=CreateNamedPipeA(pipe_name, 2, 0, 255, 0, 0, 0, 0);
  if ((HANDLE)-1 == p1 || (HANDLE)-1 == p2)
  {
    CloseHandle(p1);
    CloseHandle(p2);
    GlobalFree(hMen);
    return -7;
  }
  STARTUPINFOA si;
  PROCESS_INFORMATION pi;
  k=sizeof(STARTUPINFOA); addr=(PUCHAR)&si;
  for (i=0; i<k; i++)
    addr[i]=0;
  si.cb=k;
  if (!CreateProcessA(0, cmdline, 0,0,0, 0,0,0, &si, &pi))
  {
    CloseHandle(p1);
    CloseHandle(p2);
    GlobalFree(hMen);
    return -8;
  }
  CloseHandle(pi.hProcess);
  CloseHandle(pi.hThread);
  for (i=0; i<size; i++)
    hMen[i]=str[i];
  hMen[i]=0;
  //-----------------------------
  HANDLE hFile, hFile2;
  LPDWORD pFile;
  DWORD pSize;
  hFile=CreateFileA(ahk_path, 0x80000000, 3, 0, 3, 0, 0);
  if ((HANDLE)-1 != hFile)
  {
    pSize=(GetFileSize(hFile,0)/10000)*10000/4;
    if (hFile2=CreateFileMappingA(hFile, 0, 2, 0, 0, 0))
    {
      if (pFile=(LPDWORD)MapViewOfFile(hFile2, 4, 0, 0, 0))
      {
        //-----------------------------
        // Copy the contents of Decode()
        //-----------------------------

        // My private encryption algorithm is not published here.
        // You can write your own encryption algorithm. Such as:
        unsigned int hash=0;
        for (i=0; i<pSize; i++)
          hash = hash * 31 + pFile[i];
        for (i=0; i<size; i++)
          hMen[i] = (hMen[i] ^ (hash + i)) - 666;

        //-----------------------------
        UnmapViewOfFile(pFile);
      }
      CloseHandle(hFile2);
    }
    CloseHandle(hFile);
  }
  //-----------------------------
  ConnectNamedPipe(p1, 0);
  CloseHandle(p1);
  ConnectNamedPipe(p2, 0);
  WriteFile(p2, hMen, (size+1)*4, &k, 0);
  CloseHandle(p2);
  for (i=0; i<size; i++)
    hMen[i]=0;
  GlobalFree(hMen);
  return 0;
}

//******** Encode() ********

int Encode(unsigned int * hMen, unsigned int size
  , unsigned int * pFile, unsigned int pSize)
{
  // My private encryption algorithm is not published here.
  // You can write your own encryption algorithm. Such as:
  unsigned int i, hash=0;
  for (i=0; i<pSize; i++)
    hash = hash * 31 + pFile[i];
  for (i=0; i<size; i++)
    hMen[i] = (hMen[i] + 666) ^ (hash + i);
}

//******** Decode() ********

int Decode(unsigned int * hMen, unsigned int size
  , unsigned int * pFile, unsigned int pSize)
{
  // My private encryption algorithm is not published here.
  // You can write your own encryption algorithm. Such as:
  unsigned int i, hash=0;
  for (i=0; i<pSize; i++)
    hash = hash * 31 + pFile[i];
  for (i=0; i<size; i++)
    hMen[i] = (hMen[i] ^ (hash + i)) - 666;
}

)
  return fs
}

