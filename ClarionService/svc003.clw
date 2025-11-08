

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
    IF plpContext = 0   ! Used to differentiate multiple Services in the same EXE
    Compile('_***_',ISEQ:Debug)         ! Case pdwControl
    DSS('ServiceHandlerExA : Case pdwControl (' & pdwControl & ')' )
    _***_

!   Keep all the code here brief.
!   Dont use calls to SetServiceStatus here, Windows doesnt like it.
!   Just get the action from the Windows Service Control Manager, and send the WaitObject back to ServiceMain
!   If you are running two or more services from the app, use the Context param to direct actions to the relevent code and relevant WaitObjects
!   which will be duplicated for every service instance
!


    Case pdwControl
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP              ! Stop the service and return NO_ERROR

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP & ')' )
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') )' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_STOP )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP             Equate(00000001h)   ! Notifies a service that it should stop.
!                                                                            ! If a service accepts this control code, it must stop upon receipt and
!                                                                            ! return NO_ERROR.
!                                                                            ! After the SCM sends this control code, it will not send other control codes
!                                                                            ! to the service.
!                                                                            ! Windows XP:  If the service returns NO_ERROR and continues to run,
!                                                                            ! it continues to receive control codes.
!                                                                            ! This behavior changed starting with Windows Server 2003 and Windows XP with SP2.
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE             ! Pause the service

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE & ')' )
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') )' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_PAUSE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE            Equate(00000002h)   ! Notifies a service that it should pause.

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE          ! Resume a paused service
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE & ')' )
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE & ') )' )
        _***_


        Glo:RVBool = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_CONTINUE )
        Glo:LastError  = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE         Equate(00000003h)   ! Notifies a paused service that it should resume.



    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE       ! Request service status; return NO_ERROR
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE & ')' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_INTERROGATE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_INTERROGATE (' & GWOE:Event:SERVICE_ACCEPT_INTERROGATE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR' )
        _***_


        Return ISEQ:ServiceHandlerExA:NO_ERROR  ! MS advises we always return this.


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE      Equate(00000004h)   ! Notifies a service to report its current status information to the service control manager.
!                                                                            ! The handler should simply return NO_ERROR; the SCM is aware of the current state of the service.
!                                                                            ! Return NO_ERROR


    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN          ! System shutdown; cleanup and stop service
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN & ')' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_SHUTDOWN )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR' )
        _***_


        Return ISEQ:ServiceHandlerExA:NO_ERROR  ! MS advises we always return this.

!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN         Equate(00000005h)   ! Notifies a service that the system is shutting down so the service can perform
!                                                                            ! cleanup tasks.
!                                                                            ! Note that services that register for SERVICE_CONTROL_PRESHUTDOWN notifications
!                                                                            ! cannot receive this notification because they have already stopped.
!                                                                            ! If a service accepts this control code, it must stop after it performs its
!                                                                            ! cleanup tasks and return NO_ERROR.
!                                                                            ! After the SCM sends this control code, it will not send other control codes
!                                                                            ! to the service.
!                                                                            ! For more information, see the Remarks section of this topic.
                                                                             ! https://learn.microsoft.com/en-us/windows/win32/api/winsvc/nc-winsvc-lphandler_function_ex

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE       ! Reread service-specific startup parameters
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE & ')' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR' )
        _***_


        Return ISEQ:ServiceHandlerExA:NO_ERROR  ! MS advises we should always return this.


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE      Equate(00000006h)   ! Notifies a service that service-specific startup parameters have changed.
!                                                                            ! The service should reread its startup parameters.

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD        ! Bind to new network component (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_NETBINDADD )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_NETBINDADD (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR



!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD       Equate(00000007h)   ! Notifies a network service that there is a new component for binding.
!                                                                            ! The service should bind to the new component.
!                                                                            ! Applications should use Plug and Play functionality instead.

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE     ! Unbind removed network component (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE & ')' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR



!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE    Equate(00000008h)   ! Notifies a network service that a component for binding has been removed.
!                                                                            ! The service should reread its binding information and unbind from
!                                                                            ! the removed component.
!                                                                            ! Applications should use Plug and Play functionality instead.
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE     ! Add enabled network binding (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE & ')' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE    Equate(00000009h)   ! Notifies a network service that a disabled binding has been enabled.
!                                                                            ! The service should reread its binding information and add the new binding.
!                                                                            ! Applications should use Plug and Play functionality instead.
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE    ! Remove disabled network binding (use Plug and Play)
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE   Equate(0000000Ah)   ! Notifies a network service that one of its bindings has been disabled.
!                                                                            ! The service should reread its binding information and remove the binding.
!                                                                            ! Applications should use Plug and Play functionality instead.

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_DEVICEEVENT    ! Notifies a service of device events.
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_DEVICEEVENT (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_DEVICEEVENT & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT (' & GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_DEVICEEVENT      Equate(0000000Bh)   ! Notifies a service of device events.
!                                                                            ! (The service must have registered to receive these notifications using the
!                                                                            ! RegisterDeviceNotification function.)
!                                                                            ! The dwEventType and lpEventData parameters contain additional information.

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_HARDWAREPROFILECHANGE    ! Notifies a service that the computer's hardware profile has changed.
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_HARDWAREPROFILECHANGE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_HARDWAREPROFILECHANGE & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR

!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_HARDWAREPROFILECHANGE    Equate(0000000Ch)   ! Notifies a service that the computer's hardware profile has changed.
!                                                                            ! The dwEventType parameter contains additional information.
!

    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_POWEREVENT    ! Notifies a service of system power events.
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_POWEREVENT (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_POWEREVENT & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_POWEREVENT )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_POWEREVENT       Equate(0000000Dh)   ! Notifies a service of system power events.
!                                                                            ! The dwEventType parameter contains additional information.
!                                                                            ! If dwEventType is PBT_POWERSETTINGCHANGE, the lpEventData parameter also
!                                                                            ! contains additional information.
!
!
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SESSIONCHANGE    ! Notifies a service of session change events.
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SESSIONCHANGE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SESSIONCHANGE & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SESSIONCHANGE    Equate(0000000Eh)   ! Notifies a service of session change events.
!                                                                            ! Note that a service will only be notified of a user logon if it is fully
!                                                                            ! loaded before the logon attempt is made.
!                                                                            ! The dwEventType and lpEventData parameters contain additional information.
!
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN       ! Pre-shutdown cleanup; blocks shutdown until complete
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN & ')' )
        _***_


        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN      Equate(0000000Fh)   ! Notifies a service that the system will be shutting down.
!                                                                            ! Services that need additional time to perform cleanup tasks beyond the tight
!                                                                            ! time restriction at system shutdown can use this notification.
!                                                                            ! The service control manager sends this notification to applications that
!                                                                            ! have registered for it before sending a SERVICE_CONTROL_SHUTDOWN notification
!                                                                            ! to applications that have registered for that notification.
!                                                                            ! A service that handles this notification blocks system shutdown until the
!                                                                            ! service stops or the preshutdown time-out interval specified through
!                                                                            ! SERVICE_PRESHUTDOWN_INFO expires.
!                                                                            ! Because this affects the user experience, services should use this feature
!                                                                            ! only if it is absolutely necessary to avoid data loss or significant recovery
!                                                                            ! time at the next system start.
!                                                                            ! Windows Server 2003 and Windows XP:  This value is not supported.


    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TIMECHANGE    ! Notifies a service of session change events.
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TIMECHANGE (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TIMECHANGE & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_TIMECHANGE )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR


!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TIMECHANGE       Equate(00000010h)   ! Notifies a service that the system time has changed.
!                                                                            ! The lpEventData parameter contains additional information.
!                                                                            ! The dwEventType parameter is not used.
!                                                                            ! Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  This control code is not supported.
!
!
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TRIGGEREVENT    ! Notifies a service registered for a service trigger event that the event has occurred.
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TRIGGEREVENT (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TRIGGEREVENT & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR

!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_TRIGGEREVENT     Equate(00000020h)   ! Notifies a service registered for a service trigger event that the event has occurred.
!                                                                            ! Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  This control code is not supported.
!
!
    OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_USERMODEREBOOT    ! Notifies a service registered for a service trigger event that the event has occurred.
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : OF ISEQ:ServiceHandlerExA:SERVICE_CONTROL_USERMODEREBOOT (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_USERMODEREBOOT & ')' )
        _***_

        Glo:RVBool      = ISWA_SetEvent( GLLA:SetEvent, ISEQ:ServiceHandlerExA:SERVICE_CONTROL_USERMODEREBOOT )
        Glo:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Glo:RVBool (' & Glo:RVBool & ') = ISWA_SetEvent( GLLA:SetEvent (' & GLLA:SetEvent & ') , ISEQ:ServiceHandlerExA:SERVICE_CONTROL_USERMODEREBOOT (' & ISEQ:ServiceHandlerExA:SERVICE_CONTROL_USERMODEREBOOT & ') )' )
        DSS('ServiceHandlerExA : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        DSS('ServiceHandlerExA : Return ISEQ:ServiceHandlerExA:NO_ERROR (' & ISEQ:ServiceHandlerExA:NO_ERROR & ')' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR

!ISEQ:ServiceHandlerExA:SERVICE_CONTROL_USERMODEREBOOT   Equate(00000040h)   ! Notifies a service that the user has initiated a reboot.
!                                                                            ! Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  This control code is not supported.
    Else
        Compile('_***_',ISEQ:Debug)
        DSS('ServiceHandlerExA : Else' )
        DSS('ServiceHandlerExA : pdwControl (' & pdwControl & ')' )
        DSS('ServiceHandlerExA : Return 0' )
        _***_

        Return ISEQ:ServiceHandlerExA:NO_ERROR

    End
    End   ! END - IF plpContext = 0   ! Used to differentiate multiple Services in the same EXE
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
