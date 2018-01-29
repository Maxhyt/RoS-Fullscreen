#AutoIt3Wrapper_Icon=res\ros.ico
#AutoIt3Wrapper_Res_Description=Rules of Survival Fullscreen mode
#AutoIt3Wrapper_Res_LegalCopyright=@Maxhyt
#AutoIt3Wrapper_Res_FileVersion=1.3.0.0

#include <WinAPI.au3>
#include <GUIConstants.au3>
#include <Misc.au3>

Local $msg, $Nhandle

Run("ros.exe", "", @SW_HIDE)
$hwd = WinWait("Rules of Survival")
Sleep(6000)

$Nhandle = WinGetHandle($hwd)
_WinAPI_SetWindowLong($Nhandle, $GWL_STYLE, $WS_POPUP + $WS_VISIBLE + $WS_MAXIMIZE)
WinMove($hwd, "", 0, 0, @DesktopWidth, @DesktopHeight)

If WinWait("[CLASS:MPAY_LOGIN]", "", 5) Then
	WinSetState("[CLASS:MPAY_LOGIN]", "", @SW_HIDE)
	WinSetState("[CLASS:MPAY_LOGIN]", "", @SW_SHOW)
	WinWaitClose("[CLASS:MPAY_LOGIN]")
ElseIf WinWait("[CLASS:MPAY_SWITCH_ACCOUNT]", "", 5) Then
	WinSetState("[CLASS:MPAY_SWITCH_ACCOUNT]", "", @SW_HIDE)
	WinSetState("[CLASS:MPAY_SWITCH_ACCOUNT]", "", @SW_SHOW)
	WinWaitClose("[CLASS:MPAY_SWITCH_ACCOUNT]")
EndIf

$esp = Run("ReliefExternal_v3.5.exe")
WinWait("Welcome", "Enjoy")
ControlClick("Welcome", "Enjoy", 2)

WinWait("[CLASS:ConsoleWindowClass]")
WinSetState("[CLASS:ConsoleWindowClass]","",@SW_MINIMIZE)

While 1
	If _IsPressed("23") Then
		WinClose($hwd)
	EndIf

	If Not ProcessExists("ros.exe") Then
		ProcessClose($esp)
		Exit
	EndIf
	Sleep(80)
WEnd
