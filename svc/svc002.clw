

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC002.INC'),ONCE        !Local module procedure declarations
                     END


ServiceMain          PROCEDURE                             ! Declare Procedure
    MAP
    Module('WinApi')    ! OutputDebugStringA
    dv1( *Cstring ), Long, Raw, Pascal, Proc, Name('OutputDebugStringA')
    End
    END
  CODE
    GSS:dwServiceType               = ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS

    GSS:dwCurrentState              = ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED

    GSS:dwControlsAccepted          = 0

    GSS:dwWin32ExitCode             = ISEQ:SCM:NO_ERROR

    GSS:dwServiceSpecificExitCode   = ISEQ:SCM:NO_ERROR

    GSS:dwCheckPoint                = 0

    GSS:dwWaitHint                  = 0


    GSCV:ServiceCtrlHandlerHandle = ISWA_RegisterServiceCtrlHandlerExA(     GLLA:RegisterServiceCtrlHandlerA, |
                                                                            Address( GSCM:ServiceName ), |
                                                                            Address( ServiceHandlerExA ), |
                                                                            0 )

    IF NOT GSCV:ServiceCtrlHandlerHandle

        Return

    End
    GSS:dwServiceType               = ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS

    GSS:dwCurrentState              = ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING

    GSS:dwControlsAccepted          = ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP

    GSS:dwWin32ExitCode             = ISEQ:SCM:NO_ERROR

    GSS:dwServiceSpecificExitCode   = ISEQ:SCM:NO_ERROR

    GSS:dwCheckPoint                = 1

    GSS:dwWaitHint                  = 5000


    GLO:RVBool = ISWA_SetServiceStatus(  GLLA:SetServiceStatus, GSCV:ServiceCtrlHandlerHandle, Address( GSS:ServiceStatus ) )
    !success = UpdateSCMStatus(SERVICE_START_PENDING, NO_ERROR, 0, 1, 5000)

    IF NOT GLO:RVBool

        Return

    End

    GSCV:EventKillService = ISWA_CreateEventA(  GLLA:CreateEventA, |
                                                0, |
                                                True, |
                                                False, |
                                                0 )


    IF NOT GSCV:EventKillService

        Return

    End

!killServiceEvent = CreateEvent (0, TRUE, FALSE, 0);
!if (!killServiceEvent
    GSS:dwServiceType               = ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS

    GSS:dwCurrentState              = ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING

    GSS:dwControlsAccepted          = ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP

    GSS:dwWin32ExitCode             = ISEQ:SCM:NO_ERROR

    GSS:dwServiceSpecificExitCode   = ISEQ:SCM:NO_ERROR

    GSS:dwCheckPoint                = 2

    GSS:dwWaitHint                  = 1000


    GLO:RVBool = ISWA_SetServiceStatus(  GLLA:SetServiceStatus, GSCV:ServiceCtrlHandlerHandle, Address( GSS:ServiceStatus ) )
    !success = UpdateSCMStatus(SERVICE_START_PENDING, NO_ERROR, 0, 2, 1000)

    IF NOT GLO:RVBool

        Return

    End

    GSS:dwServiceType               = ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS

    GSS:dwCurrentState              = ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING

    GSS:dwControlsAccepted          = ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP

    GSS:dwWin32ExitCode             = ISEQ:SCM:NO_ERROR

    GSS:dwServiceSpecificExitCode   = ISEQ:SCM:NO_ERROR

    GSS:dwCheckPoint                = 3

    GSS:dwWaitHint                  = 5000


    GLO:RVBool = ISWA_SetServiceStatus(  GLLA:SetServiceStatus, GSCV:ServiceCtrlHandlerHandle, Address( GSS:ServiceStatus ) )
    !success = UpdateSCMStatus(SERVICE_START_PENDING, NO_ERROR, 0, 2, 1000)

    IF NOT GLO:RVBool

        Return

    End



!    // Notify the SCM of progress again...
!    success = UpdateSCMStatus(SERVICE_START_PENDING, NO_ERROR, 0, 3, 5000);
!    if (!success)
!    {
!    terminateService(GetLastError());
!    return;
!    }
!    // Start the service execution thread by calling our StartServiceThread function...
!    success = StartServiceThread();
!    if (!success)
!    {
!    terminateService(GetLastError());
!    return;
!    }
    GSS:dwServiceType               = ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS

    GSS:dwCurrentState              = ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING

    GSS:dwControlsAccepted          = ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP

    GSS:dwWin32ExitCode             = ISEQ:SCM:NO_ERROR

    GSS:dwServiceSpecificExitCode   = ISEQ:SCM:NO_ERROR

    GSS:dwCheckPoint                = 0

    GSS:dwWaitHint                  = 0


    GLO:RVBool = ISWA_SetServiceStatus(  GLLA:SetServiceStatus, GSCV:ServiceCtrlHandlerHandle, Address( GSS:ServiceStatus ) )
    !success = UpdateSCMStatus(SERVICE_START_PENDING, NO_ERROR, 0, 2, 1000)

    IF NOT GLO:RVBool

        Return

    End


!    // The service is now running. Notify the SCM of this fact.
!    serviceCurrentStatus = SERVICE_RUNNING;
!    success = UpdateSCMStatus(SERVICE_RUNNING, NO_ERROR, 0, 0, 0);
!    if (!success)
!    {
!    terminateService(GetLastError());
!    return;
!    }
    a# = ISWA_WaitForSingleObject( GLLA:EventKillService, GSCV:EventKillService, ISEQ:SCM:INFINITE )

    Return
!    Glo:DBmsg = 'ServiceMain Start'
!    dv( Glo:DBmsg )
!    dv1( Glo:DBmsg )
!    Access:Logger.Open()
!    Access:Logger.UseFile()
!
!
!    !Logg:RecordID   = 
!    Logg:Date       = Today()
!    Logg:Time       = Clock()
!    Logg:Msg        = 'ServiceMain'
!
!    Access:Logger.Insert()
!
!    Access:Logger.Close()
!    Glo:DBmsg = 'ServiceMain End'
!    dv( Glo:DBmsg )
!    dv1( Glo:DBmsg )
