# ClarionService
Example of a Clarion Service Control Manager HandlerEx

Overview.

Shows dynamically loading DLL's and unloading them.

Uses the latest Windows API's to handle multiple WaitObjects and all the options the Service Control Manager provides.
eg, Start, Stop, Pause, Continue, Restart.

C6 App and Dct file, so it can be loaded into later versions of Clarion.

Works on Windows XP through to Windows 11.

Because its difficult to debug a service due to it running in a different Session to the Windows Desktop, load DebugView, tick CaptureGlobal Win32 to see the OutputDebugString comments, which will help you get a better understanding of whats going on in realtime.
This CaptureGlobal Win32 option doesnt exist in early versions of DebugView, like the one's that run on Windows XP, so run and test this on Windows 11.

Alternatively build a wait into your app and then attach the debugger to the process ID. Instructions here: https://learn.microsoft.com/en-us/windows/win32/services/debugging-a-service


# How it works

Run from NOT Service Control Manager (SCM), ie File Explorer, Windows Run, loaded by another process and the command line switches/flags are processed.

    Install
    Check
    Delete
   
If no command line switch/flag is specified, default action is for Check to process.

Prefix a switch/flag with \, / or - , eg \install, /install or -install.

If the Service Control Manager (SCM) calls/loads the program, SCM runs like this:

Loads app normally, ie PROGRAM global code runs.

StartServiceCtrlDispatcherA is called, passing the address of where to find the SERVICEMAIN procedure in the app.

Service Control Manager (SCM) starts a new thread and calls/steps into the SERVICEMAIN procedure.

AttachThreadToClarion( True ) has to be the very first line of code after CODE in order to intialise the Clarion runtime, globals and classes.

RegisterServiceCtrlHandlerExA is called early on, which passes the address of the HandlerEx callback procedure to the SCM.
Fill in the SetServiceStatus fields and call it, to tell the SCM what type of Service this app is.

ServiceHandlerExA aka HandlerEx is a call back proceure which accepts input from the SCM and sends a WaitObject signal/event using SetEvent back to the SERVICEMAIN procedure. 

SERVICEMAIN processes the WaitObject signal/event using WaitForMultipleObjectsEx in a loop. The SERVICEMAIN thread/procedure hangs/waits on the WaitForMultipleObjectsEx for the next WaitObject signal/event, processes it, then loops back to the WaitForMultipleObjectsEx line and hangs/waits for the next WaitObject signal/event Ad Infinitum.

-- Sidenote, this is also the start of how you turn your Clarion app into a COM object (stepping into different procedures) and WaitForMultipleObjectsEx is also used to work with COM objects.

Thats all there is to having a service, without a Clarion Window and Clarion Accept loop attached to the window.

All the API's create, change, query and delete a service is in use here. Additional properties of the service, like Description, retry attempts and times, etc are set using the ChangeServiceConfigA and ChangeServiceConfig2A.


This app, does not show you have to start a new thread for processing a WaitObject signal event, and does not show you how process system events sent to the service. 

Usual manifest rules apply, ie to correctly detect the version of Windows, include a manifest others the latest OS's will only report back they are running on Windows 8.

<!-- OS Compatibility block -->
  <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1">
    <application>
      <!-- Windows 7 -->
      <supportedOS Id="{35138b9a-5d96-4fbd-8e2d-a2440225f93a}"/>
      <!-- Windows 8 -->
      <supportedOS Id="{4a2f28e3-53b9-4441-ba9c-d69d4a4a6e38}"/>
      <!-- Windows 8.1 -->
      <supportedOS Id="{1f676c76-80e1-4239-95bb-83d0f6d0da78}"/>
      <!-- Windows 10 -->
      <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}"/>
      <!-- Windows 11 -->
      <supportedOS Id="{d1f7f3f8-33b7-4a6e-9a0c-030d3f5c4f1a}"/>
    </application>
  </compatibility>
  
  
  UAC elevation needed in order to create, change or delete the service.
  <!-- UAC elevation -->
  <trustInfo xmlns="urn:schemas-microsoft-com:asm.v3">
    <security>
      <requestedPrivileges>
        <requestedExecutionLevel level="requireAdministrator" uiAccess="false"/>
      </requestedPrivileges>
    </security>
  </trustInfo>
  
 
Any problems, check your Anti Virus/ Windows Defender isnt blocking it without notice. Sometimes, you will see the code run in Debugview, but the SCM will not display the latest SetServiceStatus messages that's already been run.


# TODO

The SERVICE_CONTROL_USERMODEREBOOT code is disabled because this makes the app/service hang on Windows 11. see https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nc-winsvc-lphandler_function_ex

I havent been able to track down any reason why this happens and the LLM's dont have any answer either.