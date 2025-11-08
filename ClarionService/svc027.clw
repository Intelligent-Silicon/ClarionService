

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC027.INC'),ONCE        !Local module procedure declarations
                     END


QueryServiceConfig2A PROCEDURE                             ! Declare Procedure
Loc:RVBool           BYTE                                  !
Loc:BytesNeeded      ULONG                                 !
Loc:RVLong           LONG                                  !
Loc:InfoLevel        ULONG                                 !
Loc:TempBuffer       STRING(1)                             !
Loc:StringBuffer     &STRING                               !
Loc:ActionCnt        ULONG                                 !
Loc:QueryServiceConfigAType GROUP,TYPE,PRE()               !
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
Loc:AddressPos       LONG                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('QueryServiceConfigA : Start' )
    _***_
    Loc:InfoLevel   = 1  ! SERVICE_CONFIG_DESCRIPTION

    ! Windows Server 2003 and Windows XP:  Localized strings are not supported until Windows Vista.

    Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

    Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

    Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

    GSCM:ServiceLastError = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )

    DSS('QueryServiceConfigA : GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISWA_GetLastError()')
    _***_

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

        Loc:AddressPos  = Address( Loc:StringBuffer)
        Loc:RVLong  = ISWA_lStrCpyA( GSCM:QS1_DescriptionAddress, Loc:AddressPos )
        Loc:RVLong  = ISWA_lStrCpyA( GSCM:QS1_Description, GSCM:QS1_DescriptionAddress )

    End

    Dispose( Loc:StringBuffer )



! typedef struct _SERVICE_DESCRIPTIONA {
!  LPSTR lpDescription;


! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/ns-winsvc-service_descriptiona
    Loc:InfoLevel   = 2 ! SERVICE_CONFIG_FAILURE_ACTIONS

    ! Windows Server 2003 and Windows XP:  Localized strings are not supported until Windows Vista.

    Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

    Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

    Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

    GSCM:ServiceLastError = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )

    DSS('QueryServiceConfigA : GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISWA_GetLastError()')
    _***_

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
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_ResetPeriod ), Loc:AddressPos )

        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_RebootMsgAddress ), Loc:AddressPos )
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_RebootMsg ), GSCM:QS2_RebootMsgAddress )


        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_CommandAddress ), Loc:AddressPos )
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_Command ), GSCM:QS2_CommandAddress)


        Loc:AddressPos  += 4
        Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_Actions ), Loc:AddressPos )

        IF GSCM:QS2_Actions

            Loc:AddressPos  += 4
            GSCM:QS2_SC_ActionsAddress  = Loc:AddressPos

            Loop Loc:ActionCnt = 1 to GSCM:QS2_Actions

                Loc:AddressPos  += 4
                Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_Type[ Loc:ActionCnt ] ) , Loc:AddressPos )

                Loc:AddressPos  += 4
                Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS2_Delay[ Loc:ActionCnt ] ), Loc:AddressPos )

            End

        End

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
    Loc:InfoLevel   = 3 ! SERVICE_CONFIG_DELAYED_AUTO_START_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )

        DSS('QueryServiceConfigA : GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISWA_GetLastError()')
        _***_

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
            Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS3_DelayedAutostart ), Loc:AddressPos )

        End

        Dispose( Loc:StringBuffer )

    End


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
    Loc:InfoLevel   = 4 ! SERVICE_CONFIG_FAILURE_ACTIONS_FLAG

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()


        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

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
            Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS4_FailureActionsOnNonCrashFailures ), Loc:AddressPos )

        End

        Dispose( Loc:StringBuffer )

    End
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
    Loc:InfoLevel   = 5 ! SERVICE_CONFIG_SERVICE_SID_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

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
            Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS5_ServiceSidType ), Loc:AddressPos )

        End

        Dispose( Loc:StringBuffer )

    End
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
    Loc:InfoLevel   = 6 ! SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

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
            Loc:RVLong      = ISWA_lStrCpyA( Address( GSCM:QS6_RequiredPrivilegesAddress ), Loc:AddressPos )

            ! A multi-string is a sequence of null-terminated strings, terminated by an empty string (\0).
            ! The following is an example: String1\0String2\0String3\0LastString\0\0.

            !                = GSCM:QueryServiceConfig2AGrp.ServiceRequiredPrivilegesInfoAGrp.RequiredPrivileges

        End

        Dispose( Loc:StringBuffer )

    End



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
    Loc:InfoLevel   = 7 ! SERVICE_CONFIG_PRESHUTDOWN_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

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
            Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS7_PreshutdownTimeout ), Loc:AddressPos )

            ! Windows Creator’s Update (build 15063) the default preshutdown time-out value is 10,000 milliseconds (10 seconds).
            ! In prior releases, the default preshutdown time-out value is 180,000 milliseconds (three minutes).
            !
            ! After the service control manager sends the SERVICE_CONTROL_PRESHUTDOWN notification to the HandlerEx function,
            ! it waits for one of the following to occur before proceeding with other shutdown actions:
            ! the specified time elapses or the service enters the SERVICE_STOPPED state.
            ! The service can continue to update its status for as long as it is in the SERVICE_STOP_PENDING state.

        End

        Dispose( Loc:StringBuffer )

    End



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
    Loc:InfoLevel   = 8 ! SERVICE_CONFIG_TRIGGER_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

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
            Loc:RVLong      = ISWA_lStrCpyA( Address( GSCM:QS8_cTriggers ), Loc:AddressPos )

            Loc:AddressPos  += 4
            Loc:RVLong      = ISWA_lStrCpyA( Address( GSCM:QS8_pTriggersAddress ), Loc:AddressPos )

            Loc:AddressPos  += 4
            Loc:RVLong      = ISWA_lStrCpyA( Address( GSCM:QS8_pReserved ), Loc:AddressPos )

        End

        Dispose( Loc:StringBuffer )

    End


!https://learn.microsoft.com/en-us/windows/win32/api/winsvc/ns-winsvc-service_trigger
!typedef struct _SERVICE_TRIGGER {
!  DWORD                               dwTriggerType;
!  DWORD                               dwAction;
!  GUID                                *pTriggerSubtype;
!  DWORD                               cDataItems;
!  PSERVICE_TRIGGER_SPECIFIC_DATA_ITEM pDataItems;
!} SERVICE_TRIGGER, *PSERVICE_TRIGGER;
!
!
!1F81D131-3FAC-4537-9E0C-7E7B0C2F4B55
!
!
!typedef struct _SERVICE_TRIGGER_INFO {
!  DWORD            cTriggers;
!  PSERVICE_TRIGGER pTriggers;
!  PBYTE            pReserved;
!} SERVICE_TRIGGER_INFO, *PSERVICE_TRIGGER_INFO;
!
!SERVICE_TRIGGER_SPECIFIC_DATA_ITEM
!typedef struct _SERVICE_TRIGGER_SPECIFIC_DATA_ITEM {
!  DWORD dwDataType;
!  DWORD cbData;
!  PBYTE pData;
!} SERVICE_TRIGGER_SPECIFIC_DATA_ITEM, *PSERVICE_TRIGGER_SPECIFIC_DATA_ITEM;
!
!

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
    Loc:InfoLevel   = 9 ! SERVICE_CONFIG_PREFERRED_NODE -- Numa Nodes

    IF GOVIE:dwMajorVersion > 5 and GNN:HighestNodeNumber ! Min Windows Vista and Windows Server 2008 and Numa Nodes must Exist

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

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
            Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS9_PreferredNode ), Loc:AddressPos )

            Loc:AddressPos  += 2
            Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS9_Delete ), Loc:AddressPos )

        End

        Dispose( Loc:StringBuffer )

    End



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
    Loc:InfoLevel   = 12 ! SERVICE_CONFIG_LAUNCH_PROTECTED

    IF ( GOVIE:dwMajorVersion = 6 and GOVIE:dwMinorVersion => 3 )  OR GOVIE:dwMajorVersion > 6 ! Min Windows 8.1

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:TempBuffer ), Size( Loc:TempBuffer ), Address( Loc:BytesNeeded ) )

        Loc:StringBuffer &= New( String( Loc:BytesNeeded ) )

        Loc:RVBool = ISWA_QueryServiceConfig2A( GLLA:QueryServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( Loc:StringBuffer ), Loc:BytesNeeded, Address( Loc:BytesNeeded ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('QueryServiceConfigA : Loc:RVBool (' & Loc:RVBool & ') = ISWA_QueryServiceConfigA( GLLA:QueryServiceConfigA (' & GLLA:QueryServiceConfigA & '), GSCM:ServiceHandle (' & GSCM:ServiceHandle &'), Address( GSCM:QueryServiceConfigAGrp (' & Address( GSCM:QueryServiceConfigAGrp ) &'), Size( GSCM:QueryServiceConfigAGrp (' & Size( GSCM:QueryServiceConfigAGrp) & ') ), Address( Loc:BytesNeeded (' & Address( Loc:BytesNeeded ) & ') ) ) & ISWA_GetLastError() (' & ISWA_GetLastError() & ')' )
        _***_

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
            Loc:RVLong  = ISWA_lStrCpyA( Address( GSCM:QS12_LaunchProtected ), Loc:AddressPos )

        End

        Dispose( Loc:StringBuffer )

    End



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
