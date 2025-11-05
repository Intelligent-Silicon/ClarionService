

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC008.INC'),ONCE        !Local module procedure declarations
                     END


SetServiceStatus     PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatus : Start' )
    _***_
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatus : GLO:RVBool (' & GLO:RVBool & ') = ISWA_SetServiceStatus( GLLA:SetServiceStatus (' & GLLA:SetServiceStatus & '), |' )
    DSS('SetServiceStatus : GSCV:ServiceCtrlHandlerHandle (' & GSCV:ServiceCtrlHandlerHandle & '), |' )
    DSS('SetServiceStatus : Address( GSS:ServiceStatus (' & Address( GSS:ServiceStatus ) &') )' )
    _***_





    GLO:RVBool = ISWA_SetServiceStatus(     GLLA:SetServiceStatus, |
                                            GSCV:ServiceCtrlHandlerHandle, |
                                            Address( GSS:ServiceStatus ) )

    Glo:LastError  = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatus : GLO:RVBool (' & GLO:RVBool & ') = ISWA_SetServiceStatus( GLLA:SetServiceStatus (' & GLLA:SetServiceStatus & '), |' )
    DSS('SetServiceStatus : GSCV:ServiceCtrlHandlerHandle (' & GSCV:ServiceCtrlHandlerHandle & '), |' )
    DSS('SetServiceStatus : Address( GSS:ServiceStatus (' & Address( GSS:ServiceStatus ) &') )' )
    DSS('SetServiceStatus : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    DSS('SetServiceStatus : GSS:dwServiceType (' & GSS:dwServiceType & ')' )
    DSS('SetServiceStatus : GSS:dwCurrentState (' & GSS:dwCurrentState & ')' )
    DSS('SetServiceStatus : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ')' )
    DSS('SetServiceStatus : GSS:dwWin32ExitCode (' & GSS:dwWin32ExitCode & ')' )
    DSS('SetServiceStatus : GSS:dwServiceSpecificExitCode (' & GSS:dwServiceSpecificExitCode & ')' )
    DSS('SetServiceStatus : GSS:dwCheckPoint (' & GSS:dwCheckPoint & ')' )
    DSS('SetServiceStatus : GSS:dwWaitHint (' & GSS:dwWaitHint & ')' )
    _***_

    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatus : End' )
    _***_
