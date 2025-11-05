

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC003.INC'),ONCE        !Local module procedure declarations
                     END


ServiceHandlerExA    PROCEDURE  ( Ulong pdwControl, Ulong pdwEventType, Long plpEventData, Long plpContext ) ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
! ( Ulong pdwControl, Ulong pdwEventType, Long plpEventData, Long plpContext ), Ulong, Pascal
! ( Ulong pdwControl, Ulong pdwEventType, Long plpEventData, Long plpContext )
    Compile('_***_',ISEQ:Debug)         ! ServiceHandlerExA : Start
    DSS('ServiceHandlerExA : Start' )
    _***_
    Compile('_***_',ISEQ:Debug)         ! Params
    DSS('ServiceHandlerExA : pdwControl (' & pdwControl & ')')
    DSS('ServiceHandlerExA : pdwEventType (' & pdwEventType & ')')
    DSS('ServiceHandlerExA : plpEventData (' & plpEventData & ')')
    DSS('ServiceHandlerExA : plpContext (' & plpContext & ')')
    _***_

! ( Ulong pdwControl, Ulong pdwEventType, Long plpEventData, Long plpContext ), Ulong, Pascal
    Compile('_***_',ISEQ:Debug)     ! Case pdwControl
    DSS('ServiceHandlerExA : Case pdwControl (' & pdwControl & ')' )
    _***_


    Case pdwControl

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP              ! Stop the service and return NO_ERROR

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP & ')' )
        DSS('ServiceHandlerExA : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING & ') )' )
        _***_


!        SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING )
!        SetServiceStatus()

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_STOP )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return 0' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE             ! Pause the service

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE & ')' )
        DSS('ServiceHandlerExA : SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING (' & ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING & ') )' )
        _***_


!        SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING, 1, 5000 )
!        SetServiceStatus()

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_PAUSE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return 0' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE          ! Resume a paused service
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE & ')' )
        _***_


        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE & ')' )
        DSS('ServiceHandlerExA : SetServiceStatusCurrentState( ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE & ') )' )
        _***_


!        SetServiceStatusCurrentState( ISEQ:SetServiceStatus:CurrentState:SERVICE_CONTINUE_PENDING, 1, 5000 )
!        SetServiceStatus()

        Glo:RVBool = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_CONTINUE )
        Glo:LastError  = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return 0' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR




    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE       ! Request service status; return NO_ERROR
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE & ')' )
        _***_


        Return ISEQ:ServiceHandlerExA:NO_ERROR


    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN          ! System shutdown; cleanup and stop service
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN & ')' )
        _***_

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE       ! Reread service-specific startup parameters
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE & ')' )
        _***_

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD        ! Bind to new network component (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD & ')' )
        _***_

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE     ! Unbind removed network component (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE & ')' )
        _***_

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE     ! Add enabled network binding (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE & ')' )
        _***_

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE    ! Remove disabled network binding (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE & ')' )
        _***_

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN       ! Pre-shutdown cleanup; blocks shutdown until complete
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN & ')' )
        _***_

    Else
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Else' )
        DSS('ServiceHandlerExA : pdwControl (' & pdwControl & ')' )
        DSS('ServiceHandlerExA : Return 0' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR

    End

!ISEQ:ServiceHandlerExA:NO_ERROR                         Equate(0)       ! Control request handled successfully
!ISEQ:ServiceHandlerExA:ERROR_ACCESS_DENIED              Equate(5)       ! Access denied (e.g., insufficient privileges)
!ISEQ:ServiceHandlerExA:ERROR_INVALID_PARAMETER          Equate(87)      ! Invalid control code or context
!ISEQ:ServiceHandlerExA:ERROR_CALL_NOT_IMPLEMENTED       Equate(120)     ! Control code not supported by the service
!ISEQ:ServiceHandlerExA:ERROR_SERVICE_SPECIFIC_ERROR     Equate(1066)    ! Generic service-specific failure
!
    Compile('_***_',ISEQ:Debug)
    DSS('ServiceHandlerExA : End' )
    _***_
!( Ulong pdwControl, Ulong pdwEventType, Long plpEventData, Long plpContext ), Ulong, Pascal
!
!DWORD LphandlerFunctionEx(
!  [in] DWORD dwControl,
!  [in] DWORD dwEventType,
!  [in] LPVOID lpEventData,
!  [in] LPVOID lpContext
!)
!{...}
