

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC020.INC'),ONCE        !Local module procedure declarations
                     END


CloseSCManagerHandle PROCEDURE                             ! Declare Procedure
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('CloseSCManagerHandle : Start' )
    _***_
    Loc:RVBool = ISWA_CloseServiceHandle( GLLA:CloseServiceHandle, GSCM:SCMHandle )

    GSCM:SCMLastError = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CloseSCManagerHandle : Loc:RVBool (' & Loc:RVBool & ') = ISWA_CloseServiceHandle( GLLA:CloseServiceHandle (' & GLLA:CloseServiceHandle & '), GSCM:SCMHandle (' & GSCM:SCMHandle & ') )' )
    DSS('CloseSCManagerHandle : GSCM:SCMLastError (' & GSCM:SCMLastError & ') = ISWA_GetLastError() ')
    _***_

    IF NOT Loc:RVBool

        GEC:ExitApp     = 1
        GEC:ExitCode    = GSCM:SCMLastError

    End


! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-closeservicehandle
    Compile('_***_',ISEQ:Debug)
    DSS('CloseSCManagerHandle : End' )
    _***_
! The CloseServiceHandle function does not destroy the service control manager object referred to by the handle.
! A service control manager object cannot be destroyed.
! A service object can be destroyed by calling the DeleteService function.
