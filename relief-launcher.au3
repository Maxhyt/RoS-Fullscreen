#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=res\ros.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

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

$esp = Run("ReliefExternal_v3.5.exe")
WinWait("Welcome", "Enjoy")
ControlClick("Welcome", "Enjoy", 2)

WinWait("[CLASS:ConsoleWindowClass]")
WinSetState("[CLASS:ConsoleWindowClass]","",@SW_MINIMIZE)

WinWait("[CLASS:MPAY_LOGIN]")
WinSetState("[CLASS:MPAY_LOGIN]","",@SW_HIDE)
WinSetState("[CLASS:MPAY_LOGIN]","",@SW_SHOW)

While 1

	If _IsPressed("1B") Then
		WinClose($hwd)
	EndIf

	If Not ProcessExists("ros.exe") Then
		ProcessClose($esp)
		Exit
	EndIf

	$msg = GUIGetMsg()
    Switch $msg
        Case $GUI_EVENT_CLOSE
            WinClose($hwd)
    EndSwitch

	If WinActive($hwd) Then
		WinActivate("RoS")
	EndIf
	Sleep(80)
WEnd
