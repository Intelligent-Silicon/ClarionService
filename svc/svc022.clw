

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC022.INC'),ONCE        !Local module procedure declarations
                     END


CreateServiceA       PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('CreateServiceA : Start' )
    _***_
    GSCM:ServiceHandle  = ISWA_CreateServiceA(  GLLA:CreateServiceA, |
                                                GSCM:SCMHandle, |
                                                Address( GSCM:ServiceName ), |
                                                Address( GSCM:DS_ServiceDisplayName ), |
                                                GSCM:ServiceDesiredAccess, |
                                                GSCM:ServiceType, |
                                                GSCM:StartType, |
                                                GSCM:ErrorControl, |
                                                Address( GSCM:BinaryPathname ), |
                                                0, | Load Order Group
                                                0, | Tag ID
                                                0, | Dependancies Array
                                                0, | Service Start Name - Null = Local System Account
                                                0 )  ! Password

    GSCM:ServiceLastError = ISWA_GetLastError()


    Compile('_***_',ISEQ:Debug)
    DSS('CreateServiceA : GSCM:ServiceHandle (' & GSCM:ServiceHandle & ') = ISWA_CreateServiceA( GLLA:CreateServiceA (' & GLLA:CreateServiceA & '), ' &|
                                                                          'GSCM:SCMHandle (' & GSCM:SCMHandle & '), ' &|
                                                                          'Address( GSCM:ServiceName (' & Address( GSCM:ServiceName ) & ') (' & GSCM:ServiceName & ') ), ' &|
                                                                          'Address( GSCM:ServiceDisplayName (' & Address( GSCM:DS_ServiceDisplayName) & ') (' & GSCM:DS_ServiceDisplayName & ') ), ' &|
                                                                          'GSCM:ServiceDesiredAccess (' & GSCM:ServiceDesiredAccess & '), ' &|
                                                                          'GSCM:ServiceType (' & GSCM:ServiceType & '), ' &|
                                                                          'GSCM:StartType (' & GSCM:StartType & '), ' &|
                                                                          'GSCM:ErrorControl (' & GSCM:ErrorControl & '), ' &|
                                                                          'Address( GSCM:BinaryPathname (' & Address( GSCM:BinaryPathname ) & ') (' & GSCM:BinaryPathname & ') ), ' &|
                                                                          'Address( GSCM:LoadOrderGroup (' & Address( GSCM:LoadOrderGroup) & ') (' & GSCM:LoadOrderGroup & ') ), ' &|
                                                                          'Address( GSCM:TagID (' & Address( GSCM:TagID) & ') (' & GSCM:TagID & ') ), ' &|
                                                                          'Address( GSCM:DependenciesArrayGrp (' & Address( GSCM:DependenciesArrayGrp) & ') (' & GSCM:DependenciesArrayGrp & ') ), ' &|
                                                                          'Address( GSCM:ServiceStartName (' & Address( GSCM:ServiceStartName) & ') (' & GSCM:ServiceStartName & ') ), ' &|
                                                                          'Address( GSCM:Password (' & Address( GSCM:Password ) & ') (' & GSCM:Password & ') ), ' )

    DSS('CreateServiceA : GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISWA_GetLastError() ')
    _***_


    IF NOT GSCM:ServiceHandle

        Case GSCM:ServiceLastError
        OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED ! The handle to the SCM database does not have the SC_MANAGER_CREATE_SERVICE access right.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_CIRCULAR_DEPENDENCY ! A circular service dependency was specified.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_DUPLICATE_SERVICE_NAME ! The display name already exists in the service control manager database either as a service name or as another display name.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE ! The handle to the specified service control manager database is invalid.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_NAME ! The specified service name is invalid.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_PARAMETER ! A parameter that was specified is invalid.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_SERVICE_ACCOUNT ! The user account name specified in the lpServiceStartName parameter does not exist.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_SERVICE_EXISTS ! The specified service already exists in this database.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        OF ISEQ:WindowsErrorCode:ERROR_SERVICE_MARKED_FOR_DELETE  ! The specified service already exists in this database and has been marked for deletion.

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        Else

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:ServiceLastError

        End

    End


!ERROR_ACCESS_DENIED
!
!    The handle to the SCM database does not have the SC_MANAGER_CREATE_SERVICE access right.
!
!ERROR_CIRCULAR_DEPENDENCY
!
!    A circular service dependency was specified.
!
!ERROR_DUPLICATE_SERVICE_NAME
!
!    The display name already exists in the service control manager database either as a service name or as another display name.
!
!ERROR_INVALID_HANDLE
!
!    The handle to the specified service control manager database is invalid.
!
!ERROR_INVALID_NAME
!
!    The specified service name is invalid.
!
!ERROR_INVALID_PARAMETER
!
!    A parameter that was specified is invalid.
!
!ERROR_INVALID_SERVICE_ACCOUNT
!
!    The user account name specified in the lpServiceStartName parameter does not exist.
!
!ERROR_SERVICE_EXISTS
!
!    The specified service already exists in this database.
!
!ERROR_SERVICE_MARKED_FOR_DELETE
!
!    The specified service already exists in this database and has been marked for deletion. 
!
!SC_HANDLE CreateServiceA(
!  [in]            SC_HANDLE hSCManager,
!  [in]            LPCSTR    lpServiceName,
!  [in, optional]  LPCSTR    lpDisplayName,
!  [in]            DWORD     dwDesiredAccess,
!  [in]            DWORD     dwServiceType,
!  [in]            DWORD     dwStartType,
!  [in]            DWORD     dwErrorControl,
!  [in, optional]  LPCSTR    lpBinaryPathName,
!  [in, optional]  LPCSTR    lpLoadOrderGroup,
!  [out, optional] LPDWORD   lpdwTagId,
!  [in, optional]  LPCSTR    lpDependencies,
!  [in, optional]  LPCSTR    lpServiceStartName,
!  [in, optional]  LPCSTR    lpPassword

! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-createservicea
    Compile('_***_',ISEQ:Debug)
    DSS('CreateServiceA : End' )
    _***_
