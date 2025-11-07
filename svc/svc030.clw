

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
    Compile('_***_',ISEQ:Debug)
    DSS('GetVersionExA : GOVIE:dwOSVersionInfoSize (' & GOVIE:dwOSVersionInfoSize & ')')
    DSS('GetVersionExA : GOVIE:dwMajorVersion (' & GOVIE:dwMajorVersion & ')')
    DSS('GetVersionExA : GOVIE:dwMinorVersion (' & GOVIE:dwMinorVersion & ')')
    DSS('GetVersionExA : GOVIE:dwBuildNumber (' & GOVIE:dwBuildNumber & ')')
    DSS('GetVersionExA : GOVIE:dwPlatformId (' & GOVIE:dwPlatformId & ')')
    DSS('GetVersionExA : GOVIE:szCSDVersion (' & GOVIE:szCSDVersion & ')')
    DSS('GetVersionExA : GOVIE:wServicePackMajor (' & GOVIE:wServicePackMajor & ')')
    DSS('GetVersionExA : GOVIE:wServicePackMinor (' & GOVIE:wServicePackMinor & ')')
    DSS('GetVersionExA : GOVIE:wSuiteMask (' & GOVIE:wSuiteMask & ')')
    DSS('GetVersionExA : GOVIE:wProductType (' & GOVIE:wProductType & ')')
    DSS('GetVersionExA : GOVIE:wReserved (' & GOVIE:wReserved & ')')
    _***_

    GOVIE:dwOSVersionInfoSize = Size( GOVIE:OsVersionInfoExA )

    Compile('_***_',ISEQ:Debug)
    DSS('GetVersionExA : GOVIE:dwOSVersionInfoSize (' & GOVIE:dwOSVersionInfoSize & ') = Size( GOVIE:OsVersionInfoExA )')
    DSS('GetVersionExA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_GetVersionExA( GLLA:GetVersionExA (' & GLLA:GetVersionExA & '), Address( GOVIE:OsVersionInfoExA ) (' & Address( GOVIE:OsVersionInfoExA ) & ' )')
    _***_


    Loc:RVBool = ISWA_GetVersionExA( GLLA:GetVersionExA, Address( GOVIE:OsVersionInfoExA ) )

    GLO:LastError = ISWA_GetLastError()
    GOVIE:WindowsVersion    = GOVIE:dwMajorVersion + ( GOVIE:dwMinorVersion / 10 )

    Compile('_***_',ISEQ:Debug)
    DSS('GetVersionExA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_GetVersionExA( GLLA:GetVersionExA (' & GLLA:GetVersionExA & '), Address( GOVIE:OsVersionInfoExA ) (' & Address( GOVIE:OsVersionInfoExA ) & ' )')
    DSS('GetVersionExA : GLO:LastError (' & GLO:LastError & ') = ISWA_GetLastError()')
    DSS('GetVersionExA : GOVIE:dwOSVersionInfoSize (' & GOVIE:dwOSVersionInfoSize & ')')
    DSS('GetVersionExA : GOVIE:dwMajorVersion (' & GOVIE:dwMajorVersion & ')')
    DSS('GetVersionExA : GOVIE:dwMinorVersion (' & GOVIE:dwMinorVersion & ')')
    DSS('GetVersionExA : GOVIE:dwBuildNumber (' & GOVIE:dwBuildNumber & ')')
    DSS('GetVersionExA : GOVIE:dwPlatformId (' & GOVIE:dwPlatformId & ')')
    DSS('GetVersionExA : GOVIE:szCSDVersion (' & GOVIE:szCSDVersion & ')')
    DSS('GetVersionExA : GOVIE:wServicePackMajor (' & GOVIE:wServicePackMajor & ')')
    DSS('GetVersionExA : GOVIE:wServicePackMinor (' & GOVIE:wServicePackMinor & ')')
    DSS('GetVersionExA : GOVIE:wSuiteMask (' & GOVIE:wSuiteMask & ')')
    DSS('GetVersionExA : GOVIE:wProductType (' & GOVIE:wProductType & ')')
    DSS('GetVersionExA : GOVIE:wReserved (' & GOVIE:wReserved & ')')
    DSS('GetVersionExA : GOVIE:WindowsVersion (' & GOVIE:WindowsVersion & ')')
    _***_

!    Operating system        Version number
!    Windows 11                  10.0*
!    Windows 10                  10.0*
!    Windows Server 2022         10.0*
!    Windows Server 2019         10.0*
!    Windows Server 2016         10.0*
!    Windows 8.1                 6.3*
!    Windows Server 2012 R2      6.3*
!    Windows 8                   6.2
!    Windows Server 2012         6.2
!    Windows 7                   6.1
!    Windows Server 2008 R2      6.1
!    Windows Server 2008         6.0
!    Windows Vista               6.0
!    Windows Server 2003 R2      5.2
!    Windows Server 2003         5.2
!    Windows XP 64-Bit Edition   5.2
!    Windows XP                  5.1
!    Windows 2000                5.0

! https://learn.microsoft.com/en-us/windows/win32/sysinfo/operating-system-version

    DSS('GetVersionExA : Operating system        Version number')
    DSS('GetVersionExA : Windows 11                  10.0*')
    DSS('GetVersionExA : Windows 10                  10.0*')
    DSS('GetVersionExA : Windows Server 2022         10.0*')
    DSS('GetVersionExA : Windows Server 2019         10.0*')
    DSS('GetVersionExA : Windows Server 2016         10.0*')
    DSS('GetVersionExA : Windows 8.1                 6.3*')
    DSS('GetVersionExA : Windows Server 2012 R2      6.3*')
    DSS('GetVersionExA : Windows 8                   6.2')
    DSS('GetVersionExA : Windows Server 2012         6.2')
    DSS('GetVersionExA : Windows 7                   6.1')
    DSS('GetVersionExA : Windows Server 2008 R2      6.1')
    DSS('GetVersionExA : Windows Server 2008         6.0')
    DSS('GetVersionExA : Windows Vista               6.0')
    DSS('GetVersionExA : Windows Server 2003 R2      5.2')
    DSS('GetVersionExA : Windows Server 2003         5.2')
    DSS('GetVersionExA : Windows XP 64-Bit Edition   5.2')
    DSS('GetVersionExA : Windows XP                  5.1')
    DSS('GetVersionExA : Windows 2000                5.0')
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
