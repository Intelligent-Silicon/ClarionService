
  MEMBER('svc.clw')                                        ! apiNTServices (ABC Free)

! Module Data

ServiceName           CSTRING(256)                         ! apiNTServices (ABC Free)
DisplayName           CSTRING(256)                         ! apiNTServices (ABC Free)
Executable            CSTRING(256)                         ! apiNTServices (ABC Free)
InteractWithDesktop   BYTE(0)                              ! apiNTServices (ABC Free)

CurrentState          ULONG                                ! apiNTServices (ABC Free)
ServiceRunning        BYTE                                 ! apiNTServices (ABC Free)
ServicePaused         BYTE                                 ! apiNTServices (ABC Free)
hServiceStatus        ULONG                                ! apiNTServices (ABC Free)

SCResult              ULONG                                ! apiNTServices (ABC Free)

!---------------------------------------------------------------
! Service Equates and data structures
!---------------------------------------------------------------

SERVICE_WIN32_OWN_PROCESS    EQUATE(00000010h)             ! apiNTServices (ABC Free)
SERVICE_WIN32_SHARE_PROCESS  EQUATE(00000020h)             ! apiNTServices (ABC Free)
SERVICE_INTERACTIVE_PROCESS  EQUATE(00000100h)             ! apiNTServices (ABC Free)

SYNCHRONIZE                   EQUATE(00100000h)            ! apiNTServices (ABC Free)

STANDARD_RIGHTS_REQUIRED      EQUATE(000F0000h)            ! apiNTServices (ABC Free)
STANDARD_RIGHTS_READ          EQUATE(00020000h)            ! apiNTServices (ABC Free)
STANDARD_RIGHTS_WRITE         EQUATE(00020000h)            ! apiNTServices (ABC Free)
STANDARD_RIGHTS_EXECUTE       EQUATE(00020000h)            ! apiNTServices (ABC Free)
STANDARD_RIGHTS_ALL           EQUATE(001F0000h)            ! apiNTServices (ABC Free)

SPECIFIC_RIGHTS_ALL           EQUATE(0000FFFFh)            ! apiNTServices (ABC Free)


SERVICE_ACTIVE      EQUATE(00000001h)                      ! apiNTServices (ABC Free)
SERVICE_INACTIVE    EQUATE(00000002h)                      ! apiNTServices (ABC Free)
SERVICE_STATE_ALL   EQUATE(SERVICE_ACTIVE + SERVICE_INACTIVE) ! apiNTServices (ABC Free)

SERVICE_CONTROL_STOP        EQUATE(00000001h)              ! apiNTServices (ABC Free)
SERVICE_CONTROL_PAUSE       EQUATE(00000002h)              ! apiNTServices (ABC Free)
SERVICE_CONTROL_CONTINUE    EQUATE(00000003h)              ! apiNTServices (ABC Free)
SERVICE_CONTROL_INTERROGATE EQUATE(00000004h)              ! apiNTServices (ABC Free)
SERVICE_CONTROL_SHUTDOWN    EQUATE(00000005h)              ! apiNTServices (ABC Free)

SERVICE_STOPPED             EQUATE(00000001h)              ! apiNTServices (ABC Free)
SERVICE_START_PENDING       EQUATE(00000002h)              ! apiNTServices (ABC Free)
SERVICE_STOP_PENDING        EQUATE(00000003h)              ! apiNTServices (ABC Free)
SERVICE_RUNNING             EQUATE(00000004h)              ! apiNTServices (ABC Free)
SERVICE_CONTINUE_PENDING    EQUATE(00000005h)              ! apiNTServices (ABC Free)
SERVICE_PAUSE_PENDING       EQUATE(00000006h)              ! apiNTServices (ABC Free)
SERVICE_PAUSED              EQUATE(00000007h)              ! apiNTServices (ABC Free)

SERVICE_ACCEPT_STOP           EQUATE(00000001h)            ! apiNTServices (ABC Free)
SERVICE_ACCEPT_PAUSE_CONTINUE EQUATE(00000002h)            ! apiNTServices (ABC Free)
SERVICE_ACCEPT_SHUTDOWN       EQUATE(00000003h)            ! apiNTServices (ABC Free)

SC_MANAGER_CONNECT            EQUATE(0001h)                ! apiNTServices (ABC Free)
SC_MANAGER_CREATE_SERVICE     EQUATE(0002h)                ! apiNTServices (ABC Free)
SC_MANAGER_ENUMERATE_SERVICE  EQUATE(0004h)                ! apiNTServices (ABC Free)
SC_MANAGER_LOCK               EQUATE(0008h)                ! apiNTServices (ABC Free)
SC_MANAGER_QUERY_LOCK_STATUS  EQUATE(0010h)                ! apiNTServices (ABC Free)
SC_MANAGER_MODIFY_BOOT_CONFIG EQUATE(0020h)                ! apiNTServices (ABC Free)

SC_MANAGER_ALL_ACCESS   EQUATE(SC_MANAGER_CONNECT+|
                            SC_MANAGER_CREATE_SERVICE+|
                            SC_MANAGER_ENUMERATE_SERVICE+|
                            SC_MANAGER_LOCK+|
                            SC_MANAGER_QUERY_LOCK_STATUS+|
                            SC_MANAGER_MODIFY_BOOT_CONFIG) ! apiNTServices (ABC Free)


SERVICE_QUERY_CONFIG           EQUATE(0001h)               ! apiNTServices (ABC Free)
SERVICE_CHANGE_CONFIG          EQUATE(0002h)               ! apiNTServices (ABC Free)
SERVICE_QUERY_STATUS           EQUATE(0004h)               ! apiNTServices (ABC Free)
SERVICE_ENUMERATE_DEPENDENTS   EQUATE(0008h)               ! apiNTServices (ABC Free)
SERVICE_START                  EQUATE(0010h)               ! apiNTServices (ABC Free)
SERVICE_STOP                   EQUATE(0020h)               ! apiNTServices (ABC Free)
SERVICE_PAUSE_CONTINUE         EQUATE(0040h)               ! apiNTServices (ABC Free)
SERVICE_INTERROGATE            EQUATE(0080h)               ! apiNTServices (ABC Free)
SERVICE_USER_DEFINED_CONTROL   EQUATE(0100h)               ! apiNTServices (ABC Free)

SERVICE_ALL_ACCESS      EQUATE(STANDARD_RIGHTS_REQUIRED+|
                            SERVICE_START+|
                            SERVICE_STOP+|
                            SERVICE_PAUSE_CONTINUE+|
                            SERVICE_INTERROGATE+|
                            SERVICE_USER_DEFINED_CONTROL+|
                            SERVICE_QUERY_CONFIG+|
                            SERVICE_CHANGE_CONFIG+|
                            SERVICE_QUERY_STATUS+|
                            SERVICE_ENUMERATE_DEPENDENTS)  ! apiNTServices (ABC Free)

SERVICE_ALL_ACCESS_SYNC EQUATE(STANDARD_RIGHTS_ALL+|
                            SERVICE_START+|
                            SERVICE_STOP+|
                            SERVICE_PAUSE_CONTINUE+|
                            SERVICE_INTERROGATE+|
                            SERVICE_USER_DEFINED_CONTROL+|
                            SERVICE_QUERY_CONFIG+|
                            SERVICE_CHANGE_CONFIG+|
                            SERVICE_QUERY_STATUS+|
                            SERVICE_ENUMERATE_DEPENDENTS)  ! apiNTServices (ABC Free)



SERVICE_BOOT_START             EQUATE(00000000h)           ! apiNTServices (ABC Free)
SERVICE_SYSTEM_START           EQUATE(00000001h)           ! apiNTServices (ABC Free)
SERVICE_AUTO_START             EQUATE(00000002h)           ! apiNTServices (ABC Free)
SERVICE_DEMAND_START           EQUATE(00000003h)           ! apiNTServices (ABC Free)
SERVICE_DISABLED               EQUATE(00000004h)           ! apiNTServices (ABC Free)

!
! Error control type
!
SERVICE_ERROR_IGNORE           EQUATE(00000000h)           ! apiNTServices (ABC Free)
SERVICE_ERROR_NORMAL           EQUATE(00000001h)           ! apiNTServices (ABC Free)
SERVICE_ERROR_SEVERE           EQUATE(00000002h)           ! apiNTServices (ABC Free)
SERVICE_ERROR_CRITICAL         EQUATE(00000003h)           ! apiNTServices (ABC Free)

NO_ERROR                       EQUATE(0)                   ! apiNTServices (ABC Free)
ERROR_SERVICE_SPECIFIC_ERROR   EQUATE(1066)                ! apiNTServices (ABC Free)

NTDELETE                      EQUATE(00010000h)            ! apiNTServices (ABC Free)

SERVICE_STATUS      GROUP,TYPE                             ! apiNTServices (ABC Free)
dwServiceType              ULONG                           ! apiNTServices (ABC Free)
dwCurrentState             ULONG                           ! apiNTServices (ABC Free)
dwControlsAccepted         ULONG                           ! apiNTServices (ABC Free)
dwWin32ExitCode            ULONG                           ! apiNTServices (ABC Free)
dwServiceSpecificExitCode  ULONG                           ! apiNTServices (ABC Free)
dwCheckPoint               ULONG                           ! apiNTServices (ABC Free)
dwWaitHint                 ULONG                           ! apiNTServices (ABC Free)
                    END                                    ! apiNTServices (ABC Free)

!--------------------------------------------------------------------------
InstallService   PROCEDURE                                 ! apiNTServices (ABC Free)
!--------------------------------------------------------------------------
!
!  - Program.EXE /IS will call this procedure
!  - Installs service into default Service Control Manager

ServicesMachineName   CSTRING(256)                         ! apiNTServices (ABC Free)
ServicesDatabaseName  CSTRING(256)                         ! apiNTServices (ABC Free)
ServiceHandle         UNSIGNED                             ! apiNTServices (ABC Free)
SCMHandle             UNSIGNED                             ! apiNTServices (ABC Free)
tag                   ULONG                                ! apiNTServices (ABC Free)
Access                ULONG                                ! apiNTServices (ABC Free)
LoadOrderingGroup     CSTRING('<0>')                       ! apiNTServices (ABC Free)
TagIdentifier         ULONG(0)                             ! apiNTServices (ABC Free)
Dependencies          CSTRING('<0>')                       ! apiNTServices (ABC Free)

  CODE                                            ! Begin processed code


   ServicesMachineName=''                                  ! apiNTServices (ABC Free)
   ServicesDatabaseName='ServicesActive'                   ! apiNTServices (ABC Free)

   ServiceName='pcWTsvc'                                   ! apiNTServices (ABC Free)
   DisplayName='pcWT Service'                              ! apiNTServices (ABC Free)
   IF ~GetModuleFilename(SYSTEM{Prop:AppInstance},Executable,SIZE(Executable)) ! apiNTServices (ABC Free)
      MESSAGE('Invalid executable name.','Error!')
      RETURN                                               ! apiNTServices (ABC Free)
   END                                                     ! apiNTServices (ABC Free)
   Executable=CLIP(Executable) & ' SERVICEPATH=' & PATH()  ! apiNTServices (ABC Free)
   tag = 0                                                 ! apiNTServices (ABC Free)

   SCMHandle = OpenSCManager(ServicesMachineName,ServicesDatabaseName,SC_MANAGER_CREATE_SERVICE+STANDARD_RIGHTS_REQUIRED) ! apiNTServices (ABC Free)

   IF SCMHandle                                            ! apiNTServices (ABC Free)
      ServiceHandle = CreateService(    |!(Win32 API)
            SCMHandle,                  |! SCManager database
            ServiceName,                |! name of service
            DisplayName,                |! name to display
            SERVICE_ALL_ACCESS,         |! desired access to service
            SERVICE_WIN32_OWN_PROCESS + SERVICE_INTERACTIVE_PROCESS * 0,  |! service type
            SERVICE_AUTO_START,         |! start type
            SERVICE_ERROR_NORMAL,       |! error control type
            Executable,                 |! service's binary location
            0,                          |! address of: no load ordering group
            0,                          |! address of: no tag identifier
            0,                          |! address of: no dependencies
            0,                          |! address of: no LocalSystem account
            0)                           ! address of: no password

      IF ServiceHandle                                     ! apiNTServices (ABC Free)
         X# = CloseServiceHandle(ServiceHandle) !Close the Service Handle(win32 API)
         X# = CloseServiceHandle(SCMHandle)     !Close the SCM (Win32 API)
         MESSAGE('Service "' & CLIP(DisplayName)& '" installed.<13>Executable:  ' & Executable,'Finished') ! apiNTServices (ABC Free)
      ELSE                                                 ! apiNTServices (ABC Free)
         MESSAGE(GetAPIError() & '.<13>Cannot create Service Entry in Registry.','Error') ! apiNTServices (ABC Free)
         X# = CloseServiceHandle(SCMHandle)     !Close the SCM (Win32 API)
      END                                                  ! apiNTServices (ABC Free)
   ELSE                                                    ! apiNTServices (ABC Free)
      SCMHandle = OpenSCManager(ServicesMachineName,ServicesDatabaseName,STANDARD_RIGHTS_REQUIRED)     !open the
      IF SCMHandle                                         ! apiNTServices (ABC Free)
         X# = CloseServiceHandle(SCMHandle)     !Close the SCM (Win32 API)
         MESSAGE('This process requires administrator rights in order to create this service.','Cannot Create Service') ! apiNTServices (ABC Free)
      ELSE                                                 ! apiNTServices (ABC Free)
         MESSAGE(GetAPIError() & '.<13><13>No Service Control Manager available.<13>Check your security access rights.<13><13>','Error') ! apiNTServices (ABC Free)
      END                                                  ! apiNTServices (ABC Free)
   .                                                       !Service Control Man. ( Win32 API)

RemoveService        PROCEDURE                    ! Declare Procedure
!***************************************************************
! RemoveService() - This function is called if Command Line Parameter /R
!                   used.  It removes all the Keys from the registry relating
!                   this service.
!***************************************************************
ServicesMachineName  CSTRING(128)                          ! apiNTServices (ABC Free)
ServicesDatabaseName CSTRING(128)                          ! apiNTServices (ABC Free)
SCMHandle            UNSIGNED                              ! apiNTServices (ABC Free)
ServiceHandle        UNSIGNED                              ! apiNTServices (ABC Free)

  CODE                                            ! Begin processed code



  ServicesMachineName=''                                   ! apiNTServices (ABC Free)
  ServicesDatabaseName='ServicesActive'                    ! apiNTServices (ABC Free)


  SCMHandle = OpenSCManager(ServicesMachineName,ServicesDatabaseName,SC_MANAGER_CREATE_SERVICE+STANDARD_RIGHTS_REQUIRED) ! apiNTServices (ABC Free)
  IF SCMHandle                                             ! apiNTServices (ABC Free)
     ! Win32 API, opend the Service section for Delete Access only
     ServiceName='pcWTsvc'                                 ! apiNTServices (ABC Free)
     ServiceHandle = OpenService(SCMHandle,Address(ServiceName), NTDELETE) !Win32 API

      IF ServiceHandle                                     ! apiNTServices (ABC Free)
         ServiceHandle = DeleteService(ServiceHandle) ! Remove the Service (Win32 API)
         IF ~ServiceHandle                                 ! apiNTServices (ABC Free)
            MESSAGE(GetAPIError() & '.<13>Cannot remove Service Entry in Registry.','Error') ! apiNTServices (ABC Free)
            X# = CloseServiceHandle(ServiceHandle) !Close the Service Handle(win32 API)
            X# = CloseServiceHandle(SCMHandle)     !Close the SCM (Win32 API)
         ELSE                                              ! apiNTServices (ABC Free)
            X# = CloseServiceHandle(ServiceHandle) !Close the Service Handle(win32 API)
            X# = CloseServiceHandle(SCMHandle)     !Close the SCM (Win32 API)
            MESSAGE('Service "' & CLIP(ServiceName) & '" removed.','Finished') ! apiNTServices (ABC Free)
         END                                               ! apiNTServices (ABC Free)
      ELSE                                                 ! apiNTServices (ABC Free)
         MESSAGE(GetAPIError() & '.<13>Cannot open and remove Service Entry in Registry.','Error') ! apiNTServices (ABC Free)
         X# = CloseServiceHandle(ServiceHandle) !Close the Service
         X# = CloseServiceHandle(SCMHandle)     !Close the SCM (Win32 API)
      END                                                  ! apiNTServices (ABC Free)
   ELSE                                                    ! apiNTServices (ABC Free)
      SCMHandle = OpenSCManager(ServicesMachineName,ServicesDatabaseName,STANDARD_RIGHTS_REQUIRED) !open the
      IF SCMHandle                                         ! apiNTServices (ABC Free)
         MESSAGE('This process requires administrator rights in order to create this service.','Cannot Create Service') ! apiNTServices (ABC Free)
      ELSE                                                 ! apiNTServices (ABC Free)
         MESSAGE(GetAPIError() & '.<13><13>No Service Control Manager available.<13>Check your security access rights.<13><13>','Error') ! apiNTServices (ABC Free)
  .   .                                                    ! apiNTServices (ABC Free)

! These comments were provided by eem:

! The main functions here are OpenService(), CreateService(), and
! DeleteService(), and OpenSCManager().  For a complete description of these
! API calls, see you favourite Win32 API reference.

! Ok,  so... those two functions will install or remove a service from the
! registry.  After the InstallService() function executes correctly, then
! your service will show up in the Services Applet.  But that is only half
! of the battle.  The real work of a service lies in a function called
! StartServiceCtrlDispatcher().

! Before going much further into StartServiceCtrlDispatcher(), here is how
! services work.  When you start the service, the SCM will start the
! executable specified when you installed the service.  When the
! executable is loaded, the SCM sits and waits for your application to tell the SCM
! what to do next.  How you tell the SCM what to do next lies in the parameters
! you pass to StartServiceCtrlDispatcher().  The parameter here is a data
! structure that tells the SCM what Procedure it should use as the service
! main function.  Basically what happens is, you call
! StartServiceCtrlDispatcher() with a procedure designated as your main,
! and the SCM starts ANOTHER process, using this new function as the entry
! point. It is important to note that the SCM starts another process because, it
! is the O/S that is starting the process, and not your code.  This becomes
! relevant when you are trying to debug.   The data structure I use for
! StartServiceCtrlDispatcher() is as follows:

StartServiceMain PROCEDURE                                 ! apiNTServices (ABC Free)

ServiceTable         GROUP,PRE(LOC)                        ! apiNTServices (ABC Free)
ServiceName          UNSIGNED                   ! ADDRESS() of Service Name
ServiceProc          UNSIGNED                   ! ADDRESS() of Main Service Proc
EndServiceName       SIGNED(0)                  ! Null to indicate end
EndServiceProc       SIGNED(0)                  ! Null to indicate end
                     END                                   ! apiNTServices (ABC Free)

  CODE                                                     ! apiNTServices (ABC Free)

   AttachThreadToClarion(True)                             ! apiNTServices (ABC Free)

   ServiceName='ServiceMain'                               ! apiNTServices (ABC Free)
   LOC:ServiceName   = ADDRESS(ServiceName)                ! apiNTServices (ABC Free)
   LOC:ServiceProc   = ADDRESS(ServiceMain)                ! apiNTServices (ABC Free)
   ! Register Service Main with the Service control manager
   IF StartServiceCtrlDispatcher(ADDRESS(ServiceTable))    ! apiNTServices (ABC Free)
   ELSE                                                    ! apiNTServices (ABC Free)
       MESSAGE(GetAPIError() & '.<13>Cannot start service.','Error') ! apiNTServices (ABC Free)
   END                                                     ! apiNTServices (ABC Free)

ServiceMain   PROCEDURE(pParam1,pParam2)                   ! apiNTServices (ABC Free)
LOC_ThreadID                ULONG                          ! apiNTServices (ABC Free)

LOC_SECURITY_ATTRIBUTES     GROUP,PRE(LOC)                 ! apiNTServices (ABC Free)
nLength                        ULONG                       ! apiNTServices (ABC Free)
lpSecurityDescriptor           ULONG                       ! apiNTServices (ABC Free)
bInheritHandle                 SIGNED                      ! apiNTServices (ABC Free)
                            END                            ! apiNTServices (ABC Free)

    CODE                                                   ! apiNTServices (ABC Free)

    AttachThreadToClarion(True)                            ! apiNTServices (ABC Free)

    KillServiceEvent = CreateEvent (0, TRUE, FALSE, 0);    ! apiNTServices (ABC Free)
    IF NOT(KillServiceEvent)                               ! apiNTServices (ABC Free)
       DO ServiceStop                                      ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    CurrentState = SERVICE_RUNNING                         ! apiNTServices (ABC Free)
    hServiceStatus=RegisterServiceCtrlHandler(ADDRESS(ServiceName),ADDRESS(ServiceHandler)) ! apiNTServices (ABC Free)
    IF NOT(hServiceStatus)                                 ! apiNTServices (ABC Free)
       MESSAGE(GetAPIError() & '.<13>Cannot register service handler.','Error') ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    SCResult = SendStatustoSCM(SERVICE_RUNNING, NO_ERROR, 0, 1, 1000) ! apiNTServices (ABC Free)
    ServiceRunning=1                                       ! apiNTServices (ABC Free)
    GLO:ServiceStatus = ServiceRunning + 2 * ServicePaused ! apiNTServices (ABC Free)
    ! ServiceThread will automatically call the main procedure in a loop.
    LOC:nLength=0                                          ! apiNTServices (ABC Free)
    LOC:lpSecurityDescriptor=0                             ! apiNTServices (ABC Free)
    LOC:bInheritHandle=0                                   ! apiNTServices (ABC Free)
    IF NOT(CreateThread(0,0,ADDRESS(ServiceThread),0,0,LOC_ThreadID)) ! apiNTServices (ABC Free)
       DO ServiceStop                                      ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)

    LOOP                                                   ! apiNTServices (ABC Free)
       IF NOT(WaitForSingleObject(KillServiceEvent,INFINITE)) ! apiNTServices (ABC Free)
          ServiceRunning=0
          ! Note: Set ServiceRunning to 1 if you need to prevent the service from closing
       ELSE                                                ! apiNTServices (ABC Free)
       END                                                 ! apiNTServices (ABC Free)
       IF CurrentState = SERVICE_STOP_PENDING OR ServiceRunning=0 ! apiNTServices (ABC Free)
          BREAK                                            ! apiNTServices (ABC Free)
       END                                                 ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    DO ServiceStop                                         ! apiNTServices (ABC Free)

ServiceStop ROUTINE                                        ! apiNTServices (ABC Free)
    !IF LOC_ThreadID
    !  Do something that kills the thread that was started.
    !  For example, set a global variable that signals your code
    !  to stop.
    !.
    POST(Event:CloseDown,,LOC_ThreadID)                    ! apiNTServices (ABC Free)
    CurrentState = SERVICE_STOPPED                         ! apiNTServices (ABC Free)
    SCResult = SendStatusToSCM(SERVICE_STOPPED,NO_ERROR,0,1,1000) ! apiNTServices (ABC Free)
    RETURN                                                 ! apiNTServices (ABC Free)



ServiceThread PROCEDURE                                    ! apiNTServices (ABC Free)

    CODE                                                   ! apiNTServices (ABC Free)

    AttachThreadToClarion(True)                            ! apiNTServices (ABC Free)

    LOOP                                                   ! apiNTServices (ABC Free)
       IF SleepEx(2500,0)            ! Every so often (milliseconds)
          ! If SleepEx returns a non-zero value, there's an error
       END                                                 ! apiNTServices (ABC Free)
       IF CurrentState = SERVICE_STOP_PENDING              ! apiNTServices (ABC Free)
          BREAK                                            ! apiNTServices (ABC Free)
       END                                                 ! apiNTServices (ABC Free)
       Main(pParam1,pParam2)                               ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    KillService                                            ! apiNTServices (ABC Free)

KillService PROCEDURE                                      ! apiNTServices (ABC Free)
   CODE                                                    ! apiNTServices (ABC Free)

   ServiceRunning=0                                        ! apiNTServices (ABC Free)
   GLO:ServiceStatus = 0                                   ! apiNTServices (ABC Free)
   IF SetEvent(killServiceEvent)                           ! apiNTServices (ABC Free)
   END                                                     ! apiNTServices (ABC Free)
   !IF LOC_ThreadID
   !   Do something that kills the thread that was started.
   !   For example, set a global variable that signals your code
   !   to stop.
   !.
! What happens here is your executable is started by the SCM,  then when
! the above code is encountered, StartServiceCtrlDispatcher(), tells the SCM
! that for the given ServiceName, call the given ServiceProc (which in this
! instance is ServiceMain).  Then the address of the entire structure is
! passed to StartServiceCtrlDispatcher() so the SCM will know what to do
! next.  StartServiceCtrlDispatcher() does not return until the service
! has completed, so you shouldn't put any code that you need executed after
! that call.

! What happens next, is ServiceMain is called by the SCM. And another very
! important Win32 API call is required. RegisterServiceCtrlHandler() is
! used to register a function that your service uses as the procedure that
! handles the user's interaction with the Services Applet in the Control Panel.
! When a user presses Start, Stop, or Pause, the function passed to
! RegisterServiceCtrlHandler() is called by the SCM so you can have you
! program act accordingly (ie stop all threads when Pause is pressed and
! so on.) Below is my ServiceHandler, and it works for ALL of my services:

ServiceHandler       PROCEDURE (ControlCode)      ! Declare Procedure
!***************************************************************
! ServiceHandler() - This is the procedure that handles all the
!                    interaction between the User from the Control Panel
!                    Applet. The control code is passed in by the SCM.
!***************************************************************

  CODE                                                     ! apiNTServices (ABC Free)
    IF CurrentState = SERVICE_RUNNING                      ! apiNTServices (ABC Free)
       ServiceRunning=1                                    ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    IF CurrentState = SERVICE_PAUSED                       ! apiNTServices (ABC Free)
       ServicePaused=1                                     ! apiNTServices (ABC Free)
    ELSE                                                   ! apiNTServices (ABC Free)
       ServicePaused=0                                     ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    GLO:ServiceStatus = ServiceRunning + 2 * ServicePaused ! apiNTServices (ABC Free)

    CASE ControlCode                                       ! apiNTServices (ABC Free)
    OF SERVICE_CONTROL_STOP                                ! apiNTServices (ABC Free)
       CurrentState = SERVICE_STOP_PENDING                 ! apiNTServices (ABC Free)
       SCResult = SendStatusToSCM(SERVICE_STOP_PENDING, NO_ERROR, |
                        0,1,1000)                          ! apiNTServices (ABC Free)
       KillService                                         ! apiNTServices (ABC Free)
       RETURN                                              ! apiNTServices (ABC Free)
    OF SERVICE_CONTROL_PAUSE                               ! apiNTServices (ABC Free)
       IF ServiceRunning AND ~ServicePaused THEN           ! apiNTServices (ABC Free)
         SCResult = SendStatustoSCM(SERVICE_PAUSE_PENDING,NO_ERROR,0 ,1, 1000) ! apiNTServices (ABC Free)
         !PauseService()
         CurrentState = SERVICE_PAUSED                     ! apiNTServices (ABC Free)
       END                                                 ! apiNTServices (ABC Free)

    OF SERVICE_CONTROL_CONTINUE                            ! apiNTServices (ABC Free)
       IF ServicePaused                                    ! apiNTServices (ABC Free)
         SCResult = SendStatustoSCM(SERVICE_CONTINUE_PENDING, NO_ERROR, 0, |
                                1, 1000)                   ! apiNTServices (ABC Free)
         !ResumeService()
         CurrentState = SERVICE_RUNNING                    ! apiNTServices (ABC Free)
       END                                                 ! apiNTServices (ABC Free)

    OF SERVICE_CONTROL_SHUTDOWN                            ! apiNTServices (ABC Free)
       CurrentState = SERVICE_STOP_PENDING                 ! apiNTServices (ABC Free)
       SCResult = SendStatusToSCM(SERVICE_STOP_PENDING, NO_ERROR, |
                        0,1,1000)                          ! apiNTServices (ABC Free)
       KillService                                         ! apiNTServices (ABC Free)
       RETURN                                              ! apiNTServices (ABC Free)

    OF SERVICE_CONTROL_INTERROGATE                         ! apiNTServices (ABC Free)
       SCResult = SendStatustoSCM(CurrentState, NO_ERROR, 0, |
                                1, 1000)                   ! apiNTServices (ABC Free)
    ELSE                                                   ! apiNTServices (ABC Free)
       SCResult = SendStatustoSCM(CurrentState, NO_ERROR, 0, |
                                1, 1000)                   ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    RETURN                                                 ! apiNTServices (ABC Free)


SendStatusToSCM      FUNCTION (dwCurrentState, dwWin32ExitCode, dwServiceExitCode, dwCheckPoint, dwWaitHint) ! Declare Procedure
!---------------------------------------------------------------------
! SendStatusToSCM() - This function is used to send a specific status
!                     to the Service Control Manager (SCM).
!---------------------------------------------------------------------

LOC:SERVICE_STATUS  LIKE(SERVICE_STATUS),PRE(STT)          ! apiNTServices (ABC Free)

  CODE                                            ! Begin processed code


  STT:dwServiceType     = SERVICE_WIN32_OWN_PROCESS + SERVICE_INTERACTIVE_PROCESS * 0 ! service type
  STT:dwCurrentState    = dwCurrentState                   ! apiNTServices (ABC Free)

  IF dwCurrentState = SERVICE_START_PENDING THEN           ! apiNTServices (ABC Free)
     STT:dwControlsAccepted = 0                            ! apiNTServices (ABC Free)
  ELSE                                                     ! apiNTServices (ABC Free)
     IF dwCurrentState = SERVICE_STOP_PENDING THEN         ! apiNTServices (ABC Free)
        STT:dwControlsAccepted = SERVICE_ACCEPT_STOP+SERVICE_ACCEPT_PAUSE_CONTINUE ! apiNTServices (ABC Free)
     ELSIF dwCurrentState = SERVICE_RUNNING THEN           ! apiNTServices (ABC Free)
        STT:dwControlsAccepted = SERVICE_ACCEPT_PAUSE_CONTINUE+SERVICE_ACCEPT_SHUTDOWN ! apiNTServices (ABC Free)
     END                                                   ! apiNTServices (ABC Free)
  END                                                      ! apiNTServices (ABC Free)

  IF dwServiceExitCode = 0 THEN                            ! apiNTServices (ABC Free)
     STT:dwWin32ExitCode = dwWin32ExitCode                 ! apiNTServices (ABC Free)
  ELSE                                                     ! apiNTServices (ABC Free)
     STT:dwWin32ExitCode = ERROR_SERVICE_SPECIFIC_ERROR    ! apiNTServices (ABC Free)
     STT:dwServiceSpecificExitCode = dwServiceExitCode     ! apiNTServices (ABC Free)
  END                                                      ! apiNTServices (ABC Free)

  STT:dwCheckPoint = dwCheckPoint                          ! apiNTServices (ABC Free)
  STT:dwWaitHint   = dwWaitHint                            ! apiNTServices (ABC Free)

  SCResult = SetServiceStatus(hServiceStatus,ADDRESS(LOC:SERVICE_STATUS)) ! apiNTServices (ABC Free)
  IF NOT(SCResult)                                         ! apiNTServices (ABC Free)
     POST(Event:CloseWindow,,1)                            ! apiNTServices (ABC Free)
  END                                                      ! apiNTServices (ABC Free)
  RETURN(SCResult)                                         ! apiNTServices (ABC Free)

!==============================================================================
GetAPIError PROCEDURE(BYTE pMode=0,LONG pError=0) !,STRING ! Declare Procedure

   INCLUDE('VSA_AERR.TRN'),ONCE                            ! apiNTServices (ABC Free)

tSysErrQ    QUEUE,TYPE                                     ! apiNTServices (ABC Free)
seValue        LONG                                        ! apiNTServices (ABC Free)
seText         &STRING                                     ! apiNTServices (ABC Free)
            END                                            ! apiNTServices (ABC Free)

VSEC         CLASS                                         ! apiNTServices (ABC Free)
SysErrQ        &tSysErrQ                                   ! apiNTServices (ABC Free)

Init           PROCEDURE()                                 ! apiNTServices (ABC Free)
Kill           PROCEDURE()                                 ! apiNTServices (ABC Free)
GetErrorCode   PROCEDURE(),LONG                            ! apiNTServices (ABC Free)
GetError       PROCEDURE(),STRING                          ! apiNTServices (ABC Free)
GetError       PROCEDURE(LONG pErrorCode),STRING           ! apiNTServices (ABC Free)
             END                                           ! apiNTServices (ABC Free)

RetVal STRING(255)                                         ! apiNTServices (ABC Free)

   CODE                                            ! Begin processed code

     VSEC.Init()                                           ! apiNTServices (ABC Free)
     IF pMode=0                                            ! apiNTServices (ABC Free)
        RetVal = VSEC.GetError()                           ! apiNTServices (ABC Free)
     ELSE                                                  ! apiNTServices (ABC Free)
        RetVal = VSEC.GetError(pError)                     ! apiNTServices (ABC Free)
     END                                                   ! apiNTServices (ABC Free)
     VSEC.Kill()                                           ! apiNTServices (ABC Free)

     RETURN CLIP(RetVal)                                   ! apiNTServices (ABC Free)


VSEC.Init PROCEDURE                                        ! apiNTServices (ABC Free)
Follow  USHORT(3)                                          ! apiNTServices (ABC Free)
Slen    BYTE,AUTO                                          ! apiNTServices (ABC Free)

TrnGrp   &STRING                                           ! apiNTServices (ABC Free)
TempLong LONG                                              ! apiNTServices (ABC Free)
TempStr  STRING(SIZE(TempLong)),OVER(TempLong)             ! apiNTServices (ABC Free)

  CODE                                                     ! apiNTServices (ABC Free)
    SELF.SysErrQ &= NEW tSysErrQ                           ! apiNTServices (ABC Free)

    TrnGrp &= vSysErrList                                  ! apiNTServices (ABC Free)

    LOOP vSysErrList.Number TIMES                          ! apiNTServices (ABC Free)
      ! Id is a little-endian binary 16 bit word
      Slen = VAL(TrnGrp[Follow])                           ! apiNTServices (ABC Free)
      Follow += 1                                          ! apiNTServices (ABC Free)
      SELF.SysErrQ.seText &= TrnGrp[Follow :Follow+Slen-1] ! apiNTServices (ABC Free)
      Follow += Slen                                       ! apiNTServices (ABC Free)
      TempStr = TrnGrp[Follow : Follow+3]                  ! apiNTServices (ABC Free)
      SELF.SysErrQ.seValue = TempLong                      ! apiNTServices (ABC Free)
      Follow += 4                                          ! apiNTServices (ABC Free)
      ADD(SELF.SysErrQ,SELF.SysErrQ.seValue)               ! apiNTServices (ABC Free)
      ASSERT(~ERRORCODE())                                 ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)


VSEC.Kill PROCEDURE                                        ! apiNTServices (ABC Free)
  CODE                                                     ! apiNTServices (ABC Free)
    IF NOT( SELF.SysErrQ &= NULL )                         ! apiNTServices (ABC Free)
       DISPOSE(SELF.SysErrQ)                               ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)


VSEC.GetErrorCode               PROCEDURE()                ! apiNTServices (ABC Free)
    CODE                                                   ! apiNTServices (ABC Free)
    RETURN vsGetLastError()                                ! apiNTServices (ABC Free)

VSEC.GetError                   PROCEDURE()                ! apiNTServices (ABC Free)
    CODE                                                   ! apiNTServices (ABC Free)
    RETURN SELF.GetError(SELF.GetErrorCode())              ! apiNTServices (ABC Free)

VSEC.GetError                   PROCEDURE(LONG pErrorCode) ! apiNTServices (ABC Free)
    CODE                                                   ! apiNTServices (ABC Free)
    SELF.SysErrQ.seValue=pErrorCode                        ! apiNTServices (ABC Free)
    GET(SELF.SysErrQ,SELF.SysErrQ.seValue)                 ! apiNTServices (ABC Free)
    IF ERRORCODE()                                         ! apiNTServices (ABC Free)
       RETURN('Unknown Status')                            ! apiNTServices (ABC Free)
    END                                                    ! apiNTServices (ABC Free)
    RETURN CLIP(SELF.SysErrQ.seText)                       ! apiNTServices (ABC Free)

