;;;								;;;
;;;;;;	define variable area  ;;;;;	 				
;;;								;;;


;;;								;;;
;;;;;;	   run app area	  	  ;;;;;	 				
;;;								;;;

;win+\ to run wiz and hide
#\::
Process, Exist, Wiz.exe
;detect process if exist, the result stored in ErrorLevel
if(ErrorLevel = 0)
;not exist
{
	Run "C:\Program Files (x86)\WizNote\Wiz.exe"
}
Else
{
	Send ^!d
	;the default shortcut key of wiz, to show or hide itself
}
return


;win+v to run Emeditor
#V::
run "C:\Program Files\EmEditor\EmEditor.exe"
return

;;;Learn Example:

;;;win+] to run evernote and hide
;Process, Exist, Evernote.exe
;if(ErrorLevel = 0)
;{
;	Run "D:\Program Files\Evernote\Evernote\Evernote.exe"
;}
;else
;{
;	;there is to show how to use pid to active and hide
;	IfWinNotActive ahk_pid %ErrorLevel%
;		Send ^!b
;	;if evernote is not in front, use its default shortcut key 
;	else
;		WinClose ahk_pid %ErrorLevel%
;	;if it is in front, close it 
;}

;win+X to run SpeedCrunch
#X::
IfWinActive,SpeedCrunch
WinClose,SpeedCrunch
Else
IfWinExist,SpeedCrunch
WinActivate,SpeedCrunch
Else
Run "C:\Program Files\SpeedCrunch\speedcrunch.exe"
Return

;win+q to run Clauncher
;#q::
;run "C:\Program Files\CLaunch\X64\CLaunch.exe"
;return

;;;								;;;
;;;;;;  replace shortcut area ;;;;;	 				
;;;								;;;

;;;win+tab to replace alt+tab (default key of VistaSwitcher)
;#Tab::
;send #{F11}
;return

;win+s to replace alt+F4	
#s::
WinGetActiveTitle, Title
IfInString, Title, ´ý¶¨????***
{
	WinClose %Title%
	return
}
IfInString, Title, CLaunch
{
	Send {Esc}
	return
}
else
	Send !{F4}
	return

;win+shift+s to kill process
#+s::
WinGet, active_pid, PID, A
Process, Close, %active_pid%
Return


;;;								;;;
;;;;;;	control window area	  ;;;;;	 				
;;;								;;;

;win+shift+e to open desktop file and Maximize
#+E::
run "C:\Users\I310242\Desktop\"
WinWaitActive Desktop
WinMaximize Desktop
return

;win+w to minimize current window
#W::
WinMinimize A
return

;;;	  							 ;;;
;;;;;; improve efficiency area ;;;;;	 				
;;;								 ;;;

;when in explorer, press leftbutton of mouse and W to new a file
~LButton & W::
WinGet, Process, ProcessName, A
WinGetClass, class, A
If (Process != "explorer.exe")
{
	;MsgBox, Error!       
    Exit
}
Else
{
	Click right
	Sleep, 80
	Send, w
	Sleep, 80
	send, f
}
return

;when in explorer, press leftbutton of mouse and T to new a txt
~LButton & E::
WinGet, Process, ProcessName, A
WinGetClass, class, A
If (Process != "explorer.exe")
{
	;MsgBox, Error!
    Exit
}
Else
{
	Click right
	Sleep, 80
	Send, w
	Sleep, 80
	send, t
}
return

;quick type code statement
::bga::
FormatTime, now_date, %A_Now%, yyyy-MM-dd 
send Created on %now_date% `n
send Author: Aran `n
send Description: 
Return

;quick type date
::rqa::
FormatTime, now_date, %A_Now%, yyyyMMdd 
send %now_date% 
Return

;quick type date
::rqa-::
FormatTime, now_date, %A_Now%, yyyy-MM-dd 
send %now_date% 
Return

;;;Learn Example:

;;;pure text paste
;~^+v::                             ; Text¨Conly paste from ClipBoard
;   Clip0 = %ClipBoardAll%
;   ClipBoard = %ClipBoard%       ; Convert to text
;;SendEvent {Ctrl down}{V down}{Ctrl Up}{V up}   
;   Send ^v                       ; For best compatibility: SendPlay
;   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
;   ClipBoard = %Clip0%           ; Restore original ClipBoard
;   VarSetCapacity(Clip0, 0)      ; Free memory
;Return
;;;								;;;
;;;;;;	define variable area  ;;;;;	 				
;;;								;;;