

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC026.INC'),ONCE        !Local module procedure declarations
                     END


OpenServiceA         PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('OpenServiceA : Start' )
    _***_
    GSCM:ServiceHandle = ISWA_OpenServiceA( GLLA:OpenServiceA, GSCM:SCMHandle, Address( GSCM:ServiceName ), GSCM:ServiceDesiredAccess )

    GSCM:ServiceLastError = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('OpenServiceA : GSCM:ServiceHandle (' & GSCM:ServiceHandle & ') = ISWA_OpenServiceA( GLLA:OpenServiceA (' & GLLA:OpenServiceA & '), ' &|
                                                'GSCM:SCMHandle (' & GSCM:SCMHandle & '), ' &|
                                                'Address( GSCM:ServiceName ) (' & Address( GSCM:ServiceName ) & ') (' & GSCM:ServiceName & ') ), ' &|
                                                'GSCM:ServiceDesiredAccess (' & GSCM:ServiceDesiredAccess & ') ) ' )

    DSS('OpenServiceA : 1 GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GSCM:ServiceHandle


        Compile('_***_',ISEQ:Debug)
        DSS('OpenServiceA : 2 GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISWA_GetLastError()' )
        _***_


        Case GSCM:ServiceLastError
        OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED ! The handle does not have access to the service.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE ! The specified handle is invalid.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_NAME ! The specified service name is invalid.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

        OF ISEQ:WindowsErrorCode:ERROR_SERVICE_DOES_NOT_EXIST ! The specified service does not exist.

            IF NOT StrPos( GCL:CommandLineFlags, '^[\\|\/]install',True)
                GEC:ExitApp     = 1
                GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes
            End

        Else

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

        End

    End


!SC_HANDLE OpenServiceA(
!  [in] SC_HANDLE hSCManager,
!  [in] LPCSTR    lpServiceName,
!  [in] DWORD     dwDesiredAccess
!);

! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-openservicea
    Compile('_***_',ISEQ:Debug)
    DSS('OpenServiceA : End' )
    _***_
