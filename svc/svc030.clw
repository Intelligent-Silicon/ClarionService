

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC030.INC'),ONCE        !Local module procedure declarations
                     END


GetVersionExA        PROCEDURE                             ! Declare Procedure
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('GetVersionExa : Start' )
    _***_
    GOVIE:dwOSVersionInfoSize = Size( GOVIE:OsVersionInfoExA )

    Loc:RVBool = ISWA_GetVersionExA( GLLA:GetVersionExA, Address(GOVIE:OsVersionInfoExA) )

    IF NOT Loc:RVBool

        GLO:LastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('GetVersionExA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_GetVersionExA( GLLA:GetVersionExA (' & GLLA:GetVersionExA & '), Address(GOVIE:OsVersionInfoExA) ) ')
        DSS('GetVersionExA : GLO:LastError (' & GLO:LastError & ') = ISWA_GetLastError()' )
        _***_

    Else

        Compile('_***_',ISEQ:Debug)
        DSS('GetVersionExA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_GetVersionExA( GLLA:GetVersionExA (' & GLLA:GetVersionExA & '), Address(GOVIE:OsVersionInfoExA) ) ')
        _***_

    End


!    IF Loc:RVBool
!        SES:OSMajorVersion          = GOSVI:dwMajorVersion
!        SES:OSMinorVersion          = GOSVI:dwMinorVersion
!        SES:BuildNo                 = GOSVI:dwBuildNumber
!        SES:PlatformID              = GOSVI:dwPlatformId
!        SES:CSDVersion              = GOSVI:szCSDVersion
!        SES:ServicePackMajor        = GOSVI:wServicePackMajor
!        SES:ServicePackMinor        = GOSVI:wServicePackMinor
!        SES:SuiteMask               = GOSVI:wSuiteMask
!        SES:ProductType             = GOSVI:wProductType
!
!        SES:Suite_BackOffice                = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_BACKOFFICE ), 1, 0 )
!        SES:Suite_Blade                     = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_BLADE ), 1, 0 )
!        SES:Suite_Compute_Cluster           = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_COMPUTE_SERVER ), 1, 0 )
!        SES:Suite_DataCentre                = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_DATACENTER ), 1, 0 )
!        SES:Suite_Enterprise                = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_ENTERPRISE ), 1, 0 )
!        SES:Suite_EmbeddedNT                = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_EMBEDDEDNT ), 1, 0 )
!        SES:Suite_Personal                  = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_PERSONAL ), 1, 0 )
!        SES:Suite_SingleUserTS              = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_SINGLEUSERTS ), 1, 0 )
!        SES:Suite_SmallBusiness             = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_SMALLBUSINESS ), 1, 0 )
!        SES:Suite_SmallBusiness_Restricted  = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_SMALLBUSINESS_RESTRICTED ), 1, 0 )
!        SES:Suite_Storage_Server            = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_STORAGE_SERVER ), 1, 0 )
!        SES:Suite_Terminal                  = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_TERMINAL ), 1, 0 )
!        SES:Suite_Home_Server               = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_WH_SERVER ), 1, 0 )
!        SES:Suite_MultiUserTS               = Choose( BAND(SES:SuiteMask, ISEQ:VER_SUITE_MULTIUSERTS ), 1, 0 )
!
!        Case SES:ProductType
!        OF ISEQ:VER_NT_DOMAIN_CONTROLLER
!            SES:ProductTypeDescription      = 'NT Domain Controller'
!        OF ISEQ:VER_NT_SERVER
!            SES:ProductTypeDescription      = 'Server'
!        OF ISEQ:VER_NT_WORKSTATION
!            SES:ProductTypeDescription      = 'Workstation'
!        Else
!            SES:ProductTypeDescription      = 'Contact for Update'
!        End
!
!        Access:Sessions.TryUpdate()
    Compile('_***_',ISEQ:Debug)
    DSS('GetVersionExa : End' )
    _***_
