

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC023.INC'),ONCE        !Local module procedure declarations
                     END


DeleteService        PROCEDURE                             ! Declare Procedure
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('DeleteService : Start' )
    _***_
    Loc:RVBool = ISWA_DeleteService( GLLA:DeleteService, GSCM:ServiceHandle )

    GSCM:ServiceLastError = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('DeleteService : Loc:RVBool (' & Loc:RVBool & ') = ISWA_DeleteService( GLLA:DeleteService (' & GLLA:DeleteService & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle & ') )' )
    _***_


    IF NOT Loc:RVBool

        GEC:ExitApp     = 1
        GEC:ExitCode    = GSCM:ServiceLastError ! Use/Pass on Window Error Codes

    End


! Dos
! SC STOP shortservicename
! SC DELETE shortservicename

!BOOL DeleteService(
!  [in] SC_HANDLE hService
!);
!

! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-deleteservice
    Compile('_***_',ISEQ:Debug)
    DSS('DeleteService : End' )
    _***_
