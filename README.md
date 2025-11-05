# ClarionService
Example of a Clarion Service Control Manager HandlerEx

Overview.

Shows dynamically loading DLL's and unloading them.

Uses the latest Windows API's to handle multiple WaitObjects and all the options the Service Control Manager provides.
eg, Start, Stop, Pause, Continue, Restart.

C6 App and Dct file, so it can be loaded into later versions of Clarion.

Works on Windows XP through to Windows 11.

Because its impossible to debug a service due to it running in a different Session to the Windows Desktop, load DebugView, tick CaptureGlobal Win32 to see the OutputDebugString comments, which will help you get a better understanding of whats going on in realtime.
This CaptureGlobal Win32 option doesnt exist in early versions of DebugView, like the one's that run on Windows XP, so run and test this on Windows 11.

ToDo.

Copy over the procedures to Install, Change and Remove a service and ALL its fields. currently working in another app, but will copy them across to this app. In the meantime if you want to test this, edit the registry!

 
