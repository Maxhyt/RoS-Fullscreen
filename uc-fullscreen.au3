#AutoIt3Wrapper_Icon=res\ros.ico
#AutoIt3Wrapper_Res_Description=Rules of Survival Fullscreen mode
#AutoIt3Wrapper_Res_LegalCopyright=@Maxhyt
#AutoIt3Wrapper_Res_FileVersion=1.3.1.0

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

WinWaitClose("[CLASS:MPAY_LOGIN]")

$esp = Run("ROS_Ex.exe")
WinWait("[REGEXPCLASS:(WindowsForms10.Window.8.ap)]")
Sleep(2000)
$espwin = WinGetHandle("[REGEXPCLASS:(WindowsForms10.Window.8.ap)]")
WinMove($espwin, "", 1, 1)

While 1
	If _IsPressed("23") Then
		WinClose($hwd)
	EndIf

	If Not ProcessExists("ros.exe") Then
		ProcessClose($esp)
		Exit
	EndIf
	Sleep(100)
WEnd
