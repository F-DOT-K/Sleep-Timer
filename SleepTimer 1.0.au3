#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Outfile=SleepTimer.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Felix Kruszinski

 Script Function:
	SleepTimer.

#ce ----------------------------------------------------------------------------

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>


#Region ### START Koda GUI section ### Form=
$gui_1 = GUICreate("SleepTimer", 283, 204, 192, 124)
$BT_start = GUICtrlCreateButton("Start", 104, 96, 140, 28)
GUICtrlSetFont(-1, 14, 400, 0, "Arial")
$BT_abort = GUICtrlCreateButton("Abort", 104, 136, 140, 28)
GUICtrlSetFont(-1, 14, 400, 0, "Arial")
$IP_hour = GUICtrlCreateInput("", 120, 24, 121, 28, BitOr($ES_CENTER, $ES_NUMBER))
GUICtrlSetFont(-1, 14, 400, 0, "Arial")
$IP_minutes = GUICtrlCreateInput("", 120, 56, 121, 28, BitOr($ES_CENTER, $ES_NUMBER))
GUICtrlSetFont(-1, 14, 400, 0, "Arial")
$LB_hour = GUICtrlCreateLabel("Hour", 32, 24, 70, 28)
GUICtrlSetFont(-1, 14, 400, 0, "Arial")
$LB_minutes = GUICtrlCreateLabel("Minutes", 32, 56, 70, 28)
GUICtrlSetFont(-1, 14, 400, 0, "Arial")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $BT_start
			Start()
		Case $BT_abort
			Abort()
	EndSwitch
WEnd

Func Start()
	$read_hour = GUICtrlRead($IP_hour)
	$read_minutes = GUICtrlRead($IP_minutes)
	$len_hour = StringLen($read_hour)
	$len_minutes= StringLen($read_minutes)
	$min_in_sec = $read_minutes * 60
	$hour_in_sec = ($read_hour * 60) * 60
	$time = $min_in_sec + $hour_in_sec

	If $len_hour = "0" And $len_minutes = "0" Then
		MsgBox(0,"SleepTimer","Fill in the field 'Hour' or 'Minutes'")
	ElseIf $len_hour = "0" And $read_minutes > "1" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_minutes & " minutes")
	ElseIf $read_hour > "1" And $len_minutes = "0" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_hour & " hours")
	ElseIf $read_hour = "1" And $len_minutes = "0" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_hour & " hour")
	ElseIf $len_hour = "0" And $read_minutes = "1" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_minutes & " minute")
	ElseIf $read_hour > "1" And $read_minutes > "1" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_hour & " hours and " & $read_minutes & " minutes")
	ElseIf $read_hour = "1" And $read_minutes = "1" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_hour & " hour and " & $read_minutes & " minute")
	ElseIf $read_hour > "1" And $read_minutes = "1" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_hour & " hours and " & $read_minutes & " minute")
	ElseIf $read_hour = "1" And $read_minutes > "1" Then
		$command = "shutdown -t " & $time & " -s -f"
		Local $return = RunWait(@ComSpec & ' /c ' & $command,@TempDir,@SW_HIDE)
		MsgBox(0,"SleepTimer","Computer shuts down in " & $read_hour & " hour and " & $read_minutes & " minutes")
	EndIf
EndFunc

Func Abort()
	Local $return = RunWait(@ComSpec & ' /c ' & "shutdown -a",@TempDir,@SW_HIDE)
	If $return = "0" Then
		MsgBox(0,"SleepTimer","Shutdown aborted")
	ElseIf $return = "1116" Then
		MsgBox(0,"SleepTimer","No shutdown in progress")
	EndIf
EndFunc