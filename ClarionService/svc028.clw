

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC028.INC'),ONCE        !Local module procedure declarations
                     END


QueryServiceConfigA  PROCEDURE                             ! Declare Procedure
Loc:RVBool           BYTE                                  !
Loc:TempBuffer       STRING(1)                             !
Loc:BytesNeeded      ULONG                                 !
Loc:StringBuffer     &STRING                               !
Loc:AddressPos       LONG                                  !
Loc:RVLong           LONG                                  !
Loc:QueryServiceConfigATypeOLD GROUP,TYPE,PRE()            !
dwServiceType        ULONG                                 !
dwStartType          ULONG                                 !
dwErrorControl       ULONG                                 !
lpBinaryPathName     CSTRING(1024)                         !
lpLoadOrderGroup     CSTRING(1024)                         !
dwTagId              ULONG                                 !
lpDependencies       CSTRING(1024)                         !
lpServiceStartName   CSTRING(1024)                         !
lpDisplayName        CSTRING(1024)                         !
                     END                                   !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('QueryServiceConfigA : Start' )
    _***_
    Loc:RVBool = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA, GSCM:ServiceHandle, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

    Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

    Loc:RVBool = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA, GSCM:ServiceHandle, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

    GSCM:ServiceLastError = ISWA_GetLastError()

!    Compile('_***_',ISEQ:Debug)
!    DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
!    _***_

    IF NOT Loc:RVBool

        Case GSCM:ServiceLastError
        OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED 
                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

        OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

        OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

        End

    End

    IF Loc:RVBool

        Loc:AddressPos  = Address( Loc:StringBuffer )
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_ServiceType ), Loc:AddressPos )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_StartType ), Loc:AddressPos )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_ErrorControl ), Loc:AddressPos )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_BinaryPathAddress ), Loc:AddressPos )
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_BinaryPathName ), GSCM:QS_BinaryPathAddress )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_LoadOrderGroupAddress ), Loc:AddressPos )
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_LoadOrderGroup ), GSCM:QS_LoadOrderGroupAddress )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_TagID ), Loc:AddressPos )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_DependenciesArrayGrpAddress ), Loc:AddressPos )
        !Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_DependenciesArrayGrp ), GSCM:QueryServiceConfigAGrp.QS_DependenciesArrayGrpAddress )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_ServiceStartNameAddress ), Loc:AddressPos )
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_ServiceStartName ), GSCM:QS_ServiceStartNameAddress )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_DisplayNameAddress ), Loc:AddressPos )
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS_DisplayName ), GSCM:QS_DisplayNameAddress )

    End

    Dispose( Loc:StringBuffer )

!BOOL QueryServiceConfigA(
!  [in]            SC_HANDLE               hService,
!  [out, optional] LPQUERY_SERVICE_CONFIGA lpServiceConfig,
!  [in]            DWORD                   cbBufSize,
!  [out]           LPDWORD                 pcbBytesNeeded
!);
!
!
!
!https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nf-winsvc-queryserviceconfiga
    Compile('_***_',ISEQ:Debug)
    DSS('QueryServiceConfigA : End' )
    _***_
