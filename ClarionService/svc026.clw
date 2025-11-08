

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC026.INC'),ONCE        !Local module procedure declarations
                     END


OpenServiceA         PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-openservicea
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

    DSS('OpenServiceA : GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISWA_GetLastError()' )
    DSS('OpenServiceA : IF NOT GSCM:ServiceHandle (' & GSCM:ServiceHandle & ')' )
    _***_


    IF NOT GSCM:ServiceHandle


        Compile('_***_',ISEQ:Debug)
        DSS('OpenServiceA : Case GSCM:ServiceLastError (' & GSCM:ServiceLastError & ')' )
        _***_


        Case GSCM:ServiceLastError
        OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED ! The handle does not have access to the service.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

            Compile('_***_',ISEQ:Debug)
            DSS('OpenServiceA : OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED (' & ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED & ')' )
            _***_

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE ! The specified handle is invalid.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

            Compile('_***_',ISEQ:Debug)
            DSS('OpenServiceA : OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE (' & ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE & ')' )
            _***_

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_NAME ! The specified service name is invalid.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

            Compile('_***_',ISEQ:Debug)
            DSS('OpenServiceA : OF ISEQ:WindowsErrorCode:ERROR_INVALID_NAME (' & ISEQ:WindowsErrorCode:ERROR_INVALID_NAME & ')' )
            _***_


        OF ISEQ:WindowsErrorCode:ERROR_SERVICE_DOES_NOT_EXIST ! The specified service does not exist.

            Compile('_***_',ISEQ:Debug)
            DSS('OpenServiceA : OF ISEQ:WindowsErrorCode:ERROR_INVALID_NAME (' & ISEQ:WindowsErrorCode:ERROR_INVALID_NAME & ')' )
            DSS('OpenServiceA : IF NOT StrPos( GCL:CommandLineFlags, ''^[\\|\/]install'',True) (' & StrPos( GCL:CommandLineFlags, '^[\\|\/]install',True) & ')' )
            _***_


            IF NOT StrPos( GCL:CommandLineFlags, '^[\\|\/|-]install',True)
                GEC:ExitApp     = 1
                GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes
            End

            Compile('_***_',ISEQ:Debug)
            DSS('OpenServiceA : End' )
            _***_


        Else

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

            Compile('_***_',ISEQ:Debug)
            DSS('OpenServiceA : Else' )
            _***_


        End

        Compile('_***_',ISEQ:Debug)
        DSS('OpenServiceA : End' )
        DSS('OpenServiceA : GEC:ExitApp (' & GEC:ExitApp & ') = 1' )
        DSS('OpenServiceA : GEC:ExitCode (' & GEC:ExitCode & ') = GSCM:SCMLastError (' & GSCM:SCMLastError & ')' )
        _***_

    End



    Compile('_***_',ISEQ:Debug)
    DSS('OpenServiceA : End' )
    _***_
