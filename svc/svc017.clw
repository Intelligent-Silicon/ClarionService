

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC017.INC'),ONCE        !Local module procedure declarations
                     END


OpenSCManagerA       PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('OpenSCManagerA : Start' )
    _***_
    IF GSCM:MachineName and GSCM:DatabaseName   ! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-openscmanagera
       

        GSCM:SCMHandle = ISWA_OpenSCManagerA( GLLA:OpenSCManagerA, Address( GSCM:MachineName ), Address( GSCM:DatabaseName ), GSCM:SCMDesiredAccess )

        GSCM:SCMLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('OpenSCManagerA : GSCM:SCMHandle (' & GSCM:SCMHandle & ') = ISWA_OpenSCManagerA( ' &|
                                                        'GLLA:OpenSCManagerA (' & GLLA:OpenSCManagerA & '), ' &|
                                                        'Address( GSCM:MachineName (' & Address( GSCM:MachineName ) & ') (' & GSCM:MachineName & ') ), ' &|
                                                        'Address( GSCM:DatabaseName (' & Address( GSCM:DatabaseName ) & ') (' & GSCM:DatabaseName & ') ), ' &|
                                                        'GSCM:SCMDesiredAccess (' & GSCM:SCMDesiredAccess & ') ) ' &|
                                                        'ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

    ElsIF NOT GSCM:MachineName and GSCM:DatabaseName

        GSCM:SCMHandle = ISWA_OpenSCManagerA( GLLA:OpenSCManagerA, 0, Address( GSCM:DatabaseName ), GSCM:SCMDesiredAccess )

        GSCM:SCMLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('OpenSCManagerA : GSCM:SCMHandle (' & GSCM:SCMHandle & ') = ISWA_OpenSCManagerA( ' &|
                                                        'GLLA:OpenSCManagerA (' & GLLA:OpenSCManagerA & '), ' &|
                                                        '0, ' &|
                                                        'Address( GSCM:DatabaseName (' & Address( GSCM:DatabaseName ) & ') (' & GSCM:DatabaseName & ') ), ' &|
                                                        'GSCM:SCMDesiredAccess (' & GSCM:SCMDesiredAccess & ') ) ' &|
                                                        'ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

    ElsIF GSCM:MachineName and NOT GSCM:DatabaseName

        GSCM:SCMHandle = ISWA_OpenSCManagerA( GLLA:OpenSCManagerA, Address( GSCM:MachineName ), 0, GSCM:SCMDesiredAccess )

        GSCM:SCMLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('OpenSCManagerA : GSCM:SCMHandle (' & GSCM:SCMHandle & ') = ISWA_OpenSCManagerA( ' &|
                                                        'GLLA:OpenSCManagerA (' & GLLA:OpenSCManagerA & '), ' &|
                                                        'Address( GSCM:MachineName (' & Address( GSCM:MachineName ) & ') (' & GSCM:MachineName & ') ), ' &|
                                                        '0, ' &|
                                                        'GSCM:SCMDesiredAccess (' & GSCM:SCMDesiredAccess & ') ) ' &|
                                                        'ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

    ElsIF NOT GSCM:MachineName and NOT GSCM:DatabaseName

        GSCM:SCMHandle = ISWA_OpenSCManagerA( GLLA:OpenSCManagerA, 0, 0, GSCM:SCMDesiredAccess )

        GSCM:SCMLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('OpenSCManagerA : GSCM:SCMHandle (' & GSCM:SCMHandle & ') = ISWA_OpenSCManagerA( ' &|
                                                        'GLLA:OpenSCManagerA (' & GLLA:OpenSCManagerA & '), ' &|
                                                        '0, ' &|
                                                        '0, ' &|
                                                        'GSCM:SCMDesiredAccess (' & GSCM:SCMDesiredAccess & ') ) ' &|
                                                        'ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_


    End


    IF NOT GSCM:SCMHandle

        Case GSCM:SCMLastError
        OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

        OF ISEQ:WindowsErrorCode:ERROR_DATABASE_DOES_NOT_EXIST

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

        Else

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError ! Use/Pass on Window Error Codes

        End

    End

    Compile('_***_',ISEQ:Debug)
    DSS('OpenSCManagerA : End' )
    _***_
