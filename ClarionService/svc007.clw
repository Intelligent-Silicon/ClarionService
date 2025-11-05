

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC007.INC'),ONCE        !Local module procedure declarations
                     END


ServiceMain          PROCEDURE  ( Ulong pdwNumServicesArgs, Long plpServiceArgVectors ) ! Declare Procedure
Loc:ServiceControlsAccepted ULONG                          !
ISEQ:Debug      Equate(True)
  CODE
! https://learn.microsoft.com/en-us/windows/win32/services/service-servicemain-function
! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nc-winsvc-lpservice_main_functiona
!
!    VOID LpserviceMainFunctiona(
!      [in] DWORD dwNumServicesArgs,
!      [in] LPSTR *lpServiceArgVectors
!    )
    ISWA_AttachThreadToClarion( True )  ! *** This has to be the first line of code ***
                                        ! The Windows Service Control Manager steps into this Service at this procedure.
                                        ! The Clarion Runtime, Globals and Classes have not been initialised, so this function AttachThreadToClarion()
                                        ! initialises the Clarion Runtime.
                                        ! Normally a Clarion program starts at 400000h, but this procedure is typically loaded at
    Compile('_***_',ISEQ:Debug)         ! ServiceMain : Start : After AttachThreadToClarion( True ) ! *** AttachThreadToClarion( True ) must be the First line in ServiceMain ***
    DSS('ServiceMain : Start : After AttachThreadToClarion( True ) ! *** AttachThreadToClarion( True ) must be the First line in ServiceMain ***' )
    _***_
    Compile('_***_',ISEQ:Debug)         ! Passed Parameters
    DSS('ServiceMain : Parameters Passed pdwNumServicesArgs (' & pdwNumServicesArgs & ') : plpServiceArgVectors (' & plpServiceArgVectors & ')' )
    _***_
    Compile('_***_',ISEQ:Debug)         ! RegisterServiceCtrlHandlerExA - Gets GSCV:ServiceCtrlHandlerHandle for SetServiceStatus
    DSS('ServiceMain : GSCV:ServiceCtrlHandlerHandle (' & GSCV:ServiceCtrlHandlerHandle & ') = ISWA_RegisterServiceCtrlHandlerExA( GLLA:RegisterServiceCtrlHandlerA (' & GLLA:RegisterServiceCtrlHandlerA & '), |' )
    DSS('ServiceMain : Address( GSCM:ServiceName (' & Address( GSCM:ServiceName ) & '), |' )
    DSS('ServiceMain : Address( ServiceHandlerExA (' & Address( ServiceHandlerExA ) & '), |' )
    DSS('ServiceMain : 0 )' )
    _***_

    GSCV:ServiceCtrlHandlerHandle = ISWA_RegisterServiceCtrlHandlerExA(     GLLA:RegisterServiceCtrlHandlerA, |
                                                                            Address( GSCM:ServiceName ), |
                                                                            Address( ServiceHandlerExA ), |
                                                                            0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GSCV:ServiceCtrlHandlerHandle (' & GSCV:ServiceCtrlHandlerHandle & ') = ISWA_RegisterServiceCtrlHandlerExA( GLLA:RegisterServiceCtrlHandlerA (' & GLLA:RegisterServiceCtrlHandlerA & '), |' )
    DSS('ServiceMain : Address( GSCM:ServiceName (' & Address( GSCM:ServiceName ) & '), |' )
    DSS('ServiceMain : Address( ServiceHandlerExA (' & Address( ServiceHandlerExA ) & '), |' )
    DSS('ServiceMain : 0 )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GSCV:ServiceCtrlHandlerHandle

        Return Glo:LastError

    End
    Compile('_***_',ISEQ:Debug)         ! SetServiceStatusServiceType( ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS )
    DSS('ServiceMain : SetServiceStatusServiceType( ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS (' & ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS & ') )' )
    _***_

    SetServiceStatusServiceType( ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS )
    Compile('_***_',ISEQ:Debug)         ! SetServiceStatusControlsAccepted() - This will load the defaults which is all of them
    DSS('ServiceMain : SetServiceStatusControlsAccepted()' )
    _***_


    SetServiceStatusControlsAccepted()


!AcceptedControls = 0
!AcceptedControls = BOR(AcceptedControls, SERVICE_ACCEPT_STOP)
!AcceptedControls = BOR(AcceptedControls, SERVICE_ACCEPT_PAUSE_CONTINUE)
!AcceptedControls = BOR(AcceptedControls, SERVICE_ACCEPT_SHUTDOWN)
!AcceptedControls = BOR(AcceptedControls, SERVICE_ACCEPT_POWEREVENT)

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).


    Compile('_***_',ISEQ:Debug)         ! SetServiceStatusExitCode( ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR )
    DSS('ServiceMain : SetServiceStatusExitCode( ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR (' & ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR & ') )')
    _***_


    SetServiceStatusExitCode( ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR )
    Compile('_***_',ISEQ:Debug)         ! SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING )
    DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING & ') )')
    _***_


    SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING, 1 , 5000 )
    Compile('_***_',ISEQ:Debug)         ! SetServiceStatus()
    DSS('ServiceMain : SetServiceStatus()')
    _***_


    SetServiceStatus()
    Clear( GWOE:Event:WaitObjectHandles )
    GWOE:Event:WaitObjectHandlesCnt = 0
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_STOP
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_STOP  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_STOP

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_STOP

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') )' )
        _***_

    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PAUSE
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PAUSE  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GWOE:Event:SERVICE_ACCEPT_PAUSE

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_PAUSE

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') )' )
        _***_

    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_CONTINUE
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_CONTINUE  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GWOE:Event:SERVICE_ACCEPT_CONTINUE

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_CONTINUE

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_SHUTDOWN
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_SHUTDOWN  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                                0, |
                                                                0, |
                                                                0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_SHUTDOWN

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_SHUTDOWN

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') )' )
        _***_

    End

!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!!
!!! Windows Server 2003, Windows XP:  This value is not supported.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!!
!!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!!
!!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') )' )
        _***_

    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                                0, |
                                                                                0, |
                                                                                0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') )' )
        _***_

    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_POWEREVENT
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_POWEREVENT  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                                0, |
                                                                                0, |
                                                                                0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_POWEREVENT

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_POWEREVENT

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_TIMECHANGE
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_TIMECHANGE  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_TIMECHANGE

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_TIMECHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT

        Return Glo:LastError

    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : 0, |' )
    DSS('ServiceMain : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT

        Return Glo:LastError
    Else

        GWOE:Event:WaitObjectHandlesCnt     += 1
        GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ]  = GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') += 1' )
        DSS('ServiceMain : GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] (' & GWOE:Event:WaitObjectHandles[ GWOE:Event:WaitObjectHandlesCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') )' )
        _***_


    End

!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)         ! SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING )
    DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING & ') )')
    _***_


    SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING, 0 , 0 )
    Compile('_***_',ISEQ:Debug)         ! SetServiceStatus()
    DSS('ServiceMain : SetServiceStatus()')
    _***_


    SetServiceStatus()
    Loop    ! ServiceMain Loop waiting for WaitObjects from the Windows Service Control Manager (SCM)
    Compile('_***_',ISEQ:Debug)         ! WaitForMultipleObjectsEx
    DSS('ServiceMain : GWOS:RV:WaitObject:SignalEvent (' & GWOS:RV:WaitObject:SignalEvent & ') = ISWA_WaitForMultipleObjectsEx( GLLA:WaitForMultipleObjectsEx (' & GLLA:WaitForMultipleObjectsEx & '), |' )
    DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & '), |' )
    DSS('ServiceMain : Address( GWOE:Event:WaitObjectHandles (' & Address( GWOE:Event:WaitObjectHandles ) & ') ), |' )
    DSS('ServiceMain : False, |' )
    DSS('ServiceMain : ISEQ:WaitObject:INFINITE (' & ISEQ:WaitObject:INFINITE & '), |' )
    DSS('ServiceMain : False )' )
    _***_



    GWOS:RV:WaitObject:SignalEvent = ISWA_WaitForMultipleObjectsEx( GLLA:WaitForMultipleObjectsEx, |
                                                                    GWOE:Event:WaitObjectHandlesCnt, |
                                                                    Address( GWOE:Event:WaitObjectHandles ), |
                                                                    False, | ! If this is True, then all the WaitObjectHandles have to be signalled before this returns
                                                                    ISEQ:WaitObject:INFINITE, |
                                                                    False ) ! the function returns when the system queues an I/O completion routine or APC, and the thread runs the routine or function

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)         ! WaitForMultipleObjectsEx
    DSS('ServiceMain : GWOS:RV:WaitObject:SignalEvent (' & GWOS:RV:WaitObject:SignalEvent & ') = ISWA_WaitForMultipleObjectsEx( GLLA:WaitForMultipleObjectsEx (' & GLLA:WaitForMultipleObjectsEx & '), |' )
    DSS('ServiceMain : GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & '), |' )
    DSS('ServiceMain : Address( GWOE:Event:WaitObjectHandles (' & Address( GWOE:Event:WaitObjectHandles ) & ') ), |' )
    DSS('ServiceMain : False, |' )
    DSS('ServiceMain : ISEQ:WaitObject:INFINITE (' & ISEQ:WaitObject:INFINITE & '), |' )
    DSS('ServiceMain : False )' )
    DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


!ISEQ:WaitObject:WAIT_OBJECT_0       Equate(000000000h)     ! Object is in signaled state
!ISEQ:WaitObject:WAIT_ABANDONED      Equate(000000080h)     ! Mutex was not released before owning thread terminated
!ISEQ:WaitObject:WAIT_TIMEOUT        Equate(000000102h)     ! Timeout elapsed; object remains nonsignaled
!ISEQ:WaitObject:WAIT_FAILED         Equate(0FFFFFFFFh)     ! Function failed; use GetLastError for details
!ISEQ:WaitObject:INFINITE
    Compile('_***_',ISEQ:Debug)         ! Case GWOS:RV:WaitObject:SignalEvent
    DSS('ServiceMain : Case GWOS:RV:WaitObject:SignalEvent (' & GWOS:RV:WaitObject:SignalEvent & ')' )
    _***_



    Case GWOS:RV:WaitObject:SignalEvent
    OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 to ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + ( GWOE:Event:WaitObjectHandlesCnt - 1 )  ! Object is in signaled state

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 (' & ISEQ:MultipleWaitObject:WAIT_OBJECT_0 & ') to ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + ( GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') - 1 ) (' & ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + ( GWOE:Event:WaitObjectHandlesCnt - 1 ) & ') ' )
        DSS('ServiceMain : Case GWOS:RV:WaitObject:SignalEvent (' & GWOS:RV:WaitObject:SignalEvent & ')' )
        _***_

        Case GWOS:RV:WaitObject:SignalEvent
        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 !GWOS:WaitObject:SERVICE_ACCEPT_STOP

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 ! GWOS:WaitObject:SERVICE_ACCEPT_STOP' )
            DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED & ') )' )
            _***_

            SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED )
            SetServiceStatus()

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : Break' )
            _***_

            Break

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 1 !GWOS:WaitObject:SERVICE_ACCEPT_PAUSE

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 1 ! GWOS:WaitObject:SERVICE_ACCEPT_PAUSE' )
            DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING & ') )' )
            _***_


            SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING, 1, 5000 )
            SetServiceStatus()

            ! Do Something - Spawn a thread or two

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED & ') )' )
            _***_

            SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSED )
            SetServiceStatus()


        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 2 !GWOS:WaitObject:SERVICE_ACCEPT_CONTINUE

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 2 ! GWOS:WaitObject:SERVICE_ACCEPT_CONTINUE' )
            DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING & ') )' )
            _***_

            SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING, 1, 5000 )
            SetServiceStatus()

            ! Do Something - Spawn a thread or two

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING & ') )' )
            _***_

            SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING )
            SetServiceStatus()

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 3 !GWOS:WaitObject:SERVICE_ACCEPT_SHUTDOWN

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 3 ! GWOS:WaitObject:SERVICE_ACCEPT_SHUTDOWN' )
            DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING & ') )' )
            _***_

            SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING, 1, 5000 )
            SetServiceStatus()

            ! Do Something - Spawn a thread or two but prepare for shutdown

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED & ') )' )
            _***_

            SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED )
            SetServiceStatus()

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : Break' )
            _***_

            Break

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 4 !GWOS:WaitObject:SERVICE_ACCEPT_PARAMCHANGE

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 4 ! GWOS:WaitObject:SERVICE_ACCEPT_PARAMCHANGE' )
            _***_


            ! Do Something - Spawn a thread or two, handle the passed Parameter Change Event
            ! SetServiceStatus changes depend on the passed Parameter Change Event that have been setup and what you want this service to do

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 5 !GWOS:WaitObject:SERVICE_ACCEPT_NETBINDCHANGE

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 5 ! GWOS:WaitObject:SERVICE_ACCEPT_NETBINDCHANGE' )
            _***_


            ! Do Something - Spawn a thread or two, handle the Network Change events
            ! SetServiceStatus changes depend on the Network Change events that have been setup and what you want this service to do

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 6 !GWOS:WaitObject:SERVICE_ACCEPT_HARDWAREPROFILECHANGE

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 6 ! GWOS:WaitObject:SERVICE_ACCEPT_NETBINDCHANGE' )
            _***_


            ! Do Something - Spawn a thread or two, handle the Hardware Profile Change events
            ! SetServiceStatus changes depend on the Hardware Profile Change events that have been setup and what you want this service to do

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 7 !GWOS:WaitObject:SERVICE_ACCEPT_POWEREVENT

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 7 ! GWOS:WaitObject:SERVICE_ACCEPT_POWEREVENT' )
            _***_

            ! Do Something - Spawn a thread or two, handle the power event
            ! SetServiceStatus changes depend on the Power Events that have been setup and what you want this service to do

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 8 !GWOS:WaitObject:SERVICE_ACCEPT_SESSIONCHANGE

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 8 ! GWOS:WaitObject:SERVICE_ACCEPT_SESSIONCHANGE' )
            _***_

            ! Do Something - Spawn a thread or two, handle the Terminal Service / Remote Desktop Services event 
            ! SetServiceStatus changes depend on the TS/RDS Events that have been setup and what you want this service to do

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 9 !GWOS:WaitObject:SERVICE_ACCEPT_PRESHUTDOWN

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 9 ! GWOS:WaitObject:SERVICE_ACCEPT_PRESHUTDOWN' )
            _***_

            ! Do Something - Spawn a thread or two, handle the advance notice the the system is shutting
            ! SetServiceStatus changes depend on the Pre Shutdown Event that have been setup and what you want this service to do

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 10 !GWOS:WaitObject:SERVICE_ACCEPT_TIMECHANGE

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 10 ! GWOS:WaitObject:SERVICE_ACCEPT_TIMECHANGE' )
            _***_

            ! Do Something - Spawn a thread or two, handle the system clock has been changed
            ! SetServiceStatus changes depend on the Time Change Event that have been setup and what you want this service to do

        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 11 !GWOS:WaitObject:SERVICE_ACCEPT_TRIGGEREVENT
            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 11 ! GWOS:WaitObject:SERVICE_ACCEPT_TRIGGEREVENT' )
            _***_

            ! Do Something - Spawn a thread or two, handle the Service trigger events that have been setup.
            ! SetServiceStatus changes depend on the Service Trigger Events that have been setup and what you want this service to do
            ! More Info.
            ! https://learn.microsoft.com/en-us/windows/win32/services/service-trigger-events
            !   Typical Trigger Sources
            !   - Device interface arrival/removal (e.g., USB device plugged in)
            !   - IP address availability
            !   - Domain join/unjoin
            !   - Firewall port events
            !   - Custom ETW events




        OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 12 !GWOS:WaitObject:SERVICE_ACCEPT_USERMODEREBOOT
            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 12 ! GWOS:WaitObject:SERVICE_ACCEPT_TIMECHANGE' )
            _***_

            ! Do Something - Spawn a thread or two, handle the Service trigger events that have been setup.
            ! Receives a notification when the system is about to reboot due to a user-mode request,
            ! such as from Windows Update or an application calling InitiateShutdown or ExitWindowsEx


        Else

            Compile('_***_',ISEQ:Debug)
            DSS('ServiceMain : Else ! Unhandled situation' )
            _***_

            ! Do Something - Spawn a thread or two, handle the Unhandled Exception that has occurred.
            ! SetServiceStatus changes maybe, depends on how you want to handle the Unhandled Exception and what you want this service to do

        End

        


    OF ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 to ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + ( GWOE:Event:WaitObjectHandlesCnt - 1 )   ! Mutex was not released before owning thread terminated - Break ???

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 (' & ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 & ') to ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + ( GWOE:Event:WaitObjectHandlesCnt (' & GWOE:Event:WaitObjectHandlesCnt & ') - 1 ) (' & ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + ( GWOE:Event:WaitObjectHandlesCnt - 1 ) & ') ' )
        _***_


        ! If bWaitAll is FALSE, the return value minus WAIT_ABANDONED_0 indicates the lpHandles array index of an abandoned mutex object that
        ! satisfied the wait.
        ! Ownership of the mutex object is granted to the calling thread, and the mutex is set to nonsignaled.

        ! If a mutex was protecting persistent state information, you should check it for consistency.

        ! indicates that a mutex object was abandoned by the owning thread before releasing it, and your thread has now acquired ownership of that mutex.

        ! - Thread safety risk: An abandoned mutex may leave shared resources in an inconsistent state.
        ! - Your thread now owns the mutex: The system grants ownership to your thread, but you should inspect the state of the protected resource.
        ! - Common cause: A thread terminated unexpectedly (e.g., crash or forced exit) while holding the mutex.

        ! Break ???

    OF ISEQ:MultipleWaitObject:WAIT_IO_COMPLETION   ! WaitForMultipleObjectsEx wait was interrupted by an asynchronous I/O completion routine. - Do Something?

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_IO_COMPLETION' )
        _***_


       ! See WaitForMultipleObjectsEx bAlertable for more info
    OF ISEQ:MultipleWaitObject:WAIT_TIMEOUT     ! Timeout elapsed; object remains nonsignaled - Break

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_TIMEOUT' )
        DSS('ServiceMain : Break' )
        _***_


        ! This should never happen if using WaitForMultipleObjectsEx ISEQ:WaitObject:INFINITE

        Break

    OF ISEQ:MultipleWaitObject:WAIT_FAILED      ! Function failed; use GetLastError for details - Break???

        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : OF ISEQ:MultipleWaitObject:WAIT_TIMEOUT' )
        DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceMain : Break' )
        _***_

        Break  ! We will Break because the Service Control Manager is going to restart it within 1 minute, but we could add code to investigate and recover

    Else ! Break

        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceMain : Else' )
        DSS('ServiceMain : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceMain : Break' )
        _***_

        Break

    End

    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : Case GWOS:RV:WaitObject:SignalEvent' )
    DSS('ServiceMain : End' )
    DSS('ServiceMain : *** Now Loops back up to the WaitForMultipleObjectsEx api call again ' )
    _***_



    End ! Loop
    Compile('_***_',ISEQ:Debug)
    DSS('ServiceMain : End' )
    _***_
