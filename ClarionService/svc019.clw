

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC019.INC'),ONCE        !Local module procedure declarations
                     END


ChangeServiceConfigA PROCEDURE                             ! Declare Procedure
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('ChangeServiceConfigA : Start' )
    _***_
    IF GSCM:QueryServiceConfigAGrp.QS_ServiceType = GSCM:ServiceType
        GSCM:ChangeServiceConfigAGrp.CS_ServiceType = ISEQ:SCM:SERVICE_NO_CHANGE
    Else
        GSCM:ChangeServiceConfigAGrp.CS_ServiceType = GSCM:ServiceType
    End

    IF GSCM:QueryServiceConfigAGrp.QS_StartType = GSCM:StartType
        GSCM:ChangeServiceConfigAGrp.CS_StartType = ISEQ:SCM:SERVICE_NO_CHANGE
    Else
        GSCM:ChangeServiceConfigAGrp.CS_StartType = GSCM:StartType
    End

    IF GSCM:QueryServiceConfigAGrp.QS_ErrorControl = GSCM:ErrorControl
        GSCM:ChangeServiceConfigAGrp.CS_ErrorControl = ISEQ:SCM:SERVICE_NO_CHANGE
    Else
        GSCM:ChangeServiceConfigAGrp.CS_ErrorControl = GSCM:ErrorControl
    End

    IF GSCM:QueryServiceConfigAGrp.QS_BinaryPathName = GSCM:BinaryPathname
        GSCM:ChangeServiceConfigAGrp.CS_BinaryPathAddress = 0
    Else
        GSCM:ChangeServiceConfigAGrp.CS_BinaryPathAddress = Address( GSCM:BinaryPathname )
    End

    IF GSCM:QueryServiceConfigAGrp.QS_LoadOrderGroup = GSCM:LoadOrderGroup
        GSCM:ChangeServiceConfigAGrp.CS_LoadOrderGroupAddress = 0
    Else
        GSCM:ChangeServiceConfigAGrp.CS_LoadOrderGroupAddress = Address( GSCM:LoadOrderGroup )
    End

    IF GSCM:QueryServiceConfigAGrp.QS_TagID = GSCM:TagID
        GSCM:ChangeServiceConfigAGrp.CS_TagIDAddress = 0
    Else
        GSCM:ChangeServiceConfigAGrp.CS_TagIDAddress = Address( GSCM:TagID )
    End

    IF GSCM:QueryServiceConfigAGrp.QS_DependenciesArrayGrp = GSCM:DependenciesArrayGrp
        GSCM:ChangeServiceConfigAGrp.CS_DependenciesArrayGrpAddress = 0
    Else
        GSCM:ChangeServiceConfigAGrp.CS_DependenciesArrayGrpAddress = Address( GSCM:DependenciesArrayGrp )
    End

    IF GSCM:QueryServiceConfigAGrp.QS_ServiceStartName = 'LocalSystem' ! GSCM:ServiceStartName = NT AUTHORITY\LocalService which equals LocalSystem
        GSCM:ChangeServiceConfigAGrp.CS_ServiceStartNameAddress = 0
    Else
        GSCM:ChangeServiceConfigAGrp.CS_ServiceStartNameAddress = Address( GSCM:ServiceStartName )
        GSCM:ChangeServiceConfigAGrp.CS_PasswordAddress         = Address( GSCM:Password )
    End

    IF GSCM:QueryServiceConfigAGrp.QS_DisplayName = GSCM:DS_ServiceDisplayName
        GSCM:ChangeServiceConfigAGrp.CS_DisplayNameAddress = 0
    Else
        GSCM:ChangeServiceConfigAGrp.CS_DisplayNameAddress = Address( GSCM:DS_ServiceDisplayName )
    End



    Loc:RVBool = ISWA_ChangeServiceConfigA( GLLA:ChangeServiceConfigA, |
                                            GSCM:ServiceHandle, |
                                            GSCM:ChangeServiceConfigAGrp.CS_ServiceType, |
                                            GSCM:ChangeServiceConfigAGrp.CS_StartType, |
                                            GSCM:ChangeServiceConfigAGrp.CS_ErrorControl, |
                                            GSCM:ChangeServiceConfigAGrp.CS_BinaryPathAddress, |
                                            GSCM:ChangeServiceConfigAGrp.CS_LoadOrderGroupAddress, |
                                            GSCM:ChangeServiceConfigAGrp.CS_TagIDAddress, |
                                            GSCM:ChangeServiceConfigAGrp.CS_DependenciesArrayGrpAddress, |
                                            GSCM:ChangeServiceConfigAGrp.CS_ServiceStartNameAddress, |
                                            GSCM:ChangeServiceConfigAGrp.CS_PasswordAddress, |
                                            GSCM:ChangeServiceConfigAGrp.CS_DisplayNameAddress )

    GSCM:ServiceLastError = ISWA_GetLastError()

    IF NOT Loc:RVBool

        Case GSCM:ServiceLastError
        OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

            GEC:ExitApp     = 0                       ! Wont terminate the program 
            GEC:ExitCode    = GSCM:ServiceLastError   ! but will return the ErrorCode

        OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

            GEC:ExitApp     = 0                       ! Wont terminate the program 
            GEC:ExitCode    = GSCM:ServiceLastError   ! but will return the ErrorCode

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

            GEC:ExitApp     = 0                       ! Wont terminate the program 
            GEC:ExitCode    = GSCM:ServiceLastError   ! but will return the ErrorCode

        End

    End

    Compile('_***_',ISEQ:Debug)
    DSS('ChangeServiceConfigA : End' )
    _***_
