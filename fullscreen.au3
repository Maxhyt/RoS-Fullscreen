
#AutoIt3Wrapper_Icon=res\ros.ico
#AutoIt3Wrapper_Res_Description=Rules of Survival Fullscreen mode
#AutoIt3Wrapper_Res_LegalCopyright=@Maxhyt

#include <WinAPI.au3>
#include <GUIConstants.au3>
#include <Misc.au3>

Local $msg, $Nhandle

Run("ros.exe", "", @SW_HIDE)
$hwd = WinWait("Rules of Survival")
Sleep(6000)

$Nhandle = WinGetHandle($hwd)
_WinAPI_SetWindowLong($Nhandle, $GWL_STYLE, $WS_POPUP + $WS_VISIBLE + $WS_MAXIMIZE)
_WinAPI_SetWindowPos($Nhandle, $HWND_BOTTOM, 0, 0, @DesktopWidth, @DesktopHeight, $SWP_SHOWWINDOW)

If WinWait("[CLASS:MPAY_LOGIN]", "", 5) Then
	WinSetState("[CLASS:MPAY_LOGIN]", "", @SW_HIDE)
	WinSetState("[CLASS:MPAY_LOGIN]", "", @SW_SHOW)
ElseIf WinWait("[CLASS:MPAY_SWITCH_ACCOUNT]", "", 5) Then
	WinSetState("[CLASS:MPAY_SWITCH_ACCOUNT]", "", @SW_HIDE)
	WinSetState("[CLASS:MPAY_SWITCH_ACCOUNT]", "", @SW_SHOW)
EndIf

While 1
	If _IsPressed("1B") Then
		WinClose($hwd)
	EndIf
WEnd
