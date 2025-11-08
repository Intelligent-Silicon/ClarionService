

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC016.INC'),ONCE        !Local module procedure declarations
                     END


CreateWaitObjectEvents PROCEDURE                           ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : Start' )
    _***_
    Clear( GWOE:Event:WaitObjectHandlesArray )
    GWOE:Event:WaitObjectHandlesArrayCnt = 0
    IF GOVIE:WindowsVersion => 6.0 ! Vista onwards use CreateEventExA else CreateEventA
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_STOP
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_


    ! There's no need to use names with CreateEventExA, because CreateEventExA returns a 4byte incrementing number which is associated and assigned into GWOE:Event:SERVICE_ACCEPT_STOP
    ! Then when the Service HandlerEx gets a SERVICE_ACCEPT_STOP event, we send GWOE:Event:SERVICE_ACCEPT_STOP to WaitForMultipleObjects in ServiceMain for it to do stuff.
    GWOE:Event:SERVICE_ACCEPT_STOP  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_STOP

        Return

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_STOP

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PAUSE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PAUSE  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GWOE:Event:SERVICE_ACCEPT_PAUSE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_PAUSE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_CONTINUE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_CONTINUE  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GWOE:Event:SERVICE_ACCEPT_CONTINUE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_CONTINUE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_SHUTDOWN
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_SHUTDOWN  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                                0, |
                                                                0, |
                                                                0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_SHUTDOWN

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_SHUTDOWN

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE  = ISWA_CreateEventExA(  GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDADD
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDADD (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDADD  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDADD (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDADD

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDADD

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDADD (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT (' & GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT (' & GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT (' & GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                                0, |
                                                                                0, |
                                                                                0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_POWEREVENT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_POWEREVENT  = ISWA_CreateEventExA(     GLLA:CreateEventExA, |
                                                                                0, |
                                                                                0, |
                                                                                0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_POWEREVENT

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_POWEREVENT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_TIMECHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_TIMECHANGE  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_TIMECHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_TIMECHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventExA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT  = ISWA_CreateEventExA( GLLA:CreateEventExA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                            ISEQ:WaitObject:SYNCHRONIZE + |
                                                            ISEQ:WaitObject:EVENT_MODIFY_STATE )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') = ISWA_CreateEventExA( GLLA:CreateEventExA (' & GLLA:CreateEventExA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : ISEQ:WaitObject:SYNCHRONIZE (' & ISEQ:WaitObject:SYNCHRONIZE & ') )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT

        Return 
    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') )' )
        _***_


    End
    Else ! CreateEventA
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_STOP
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_


    ! There's no need to use names with CreateEventA, because CreateEventA returns a 4byte incrementing number which is associated and assigned into GWOE:Event:SERVICE_ACCEPT_STOP
    ! Then when the Service HandlerEx gets a SERVICE_ACCEPT_STOP event, we send GWOE:Event:SERVICE_ACCEPT_STOP to WaitForMultipleObjects in ServiceMain for it to do stuff.
    GWOE:Event:SERVICE_ACCEPT_STOP  = ISWA_CreateEventA(  GLLA:CreateEventA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_STOP

        Return

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_STOP

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_STOP (' & GWOE:Event:SERVICE_ACCEPT_STOP & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PAUSE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PAUSE  = ISWA_CreateEventA(  GLLA:CreateEventA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GWOE:Event:SERVICE_ACCEPT_PAUSE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_PAUSE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PAUSE (' & GWOE:Event:SERVICE_ACCEPT_PAUSE & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_CONTINUE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_CONTINUE  = ISWA_CreateEventA(  GLLA:CreateEventA, |
                                                            0, |
                                                            0, |
                                                            0, |
                                                            0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_


    IF NOT GWOE:Event:SERVICE_ACCEPT_CONTINUE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_CONTINUE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_CONTINUE (' & GWOE:Event:SERVICE_ACCEPT_CONTINUE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_SHUTDOWN
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_SHUTDOWN  = ISWA_CreateEventA(  GLLA:CreateEventA, |
                                                                0, |
                                                                0, |
                                                                0, |
                                                                0 )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_SHUTDOWN

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_SHUTDOWN

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_SHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_SHUTDOWN & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE  = ISWA_CreateEventA(  GLLA:CreateEventA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                                    0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE (' & GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDADD
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDADD (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDADD  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                                        0 )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDADD (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDADD

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDADD

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDADD (' & GWOE:Event:SERVICE_ACCEPT_NETBINDADD & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                                        0 )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                                        0 )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDREMOVE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                                        0 )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDENABLE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                                        0 )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE (' & GWOE:Event:SERVICE_ACCEPT_NETBINDDISABLE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT (' & GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                        0, |
                                                                        0, |
                                                                        0, |
                                                                        0 )



    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT (' & GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT (' & GWOE:Event:SERVICE_ACCEPT_DEVICEEVENT & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                                0, |
                                                                                0, |
                                                                                0, |
                                                                                0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE (' & GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE & ') )' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_POWEREVENT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_POWEREVENT  = ISWA_CreateEventA(     GLLA:CreateEventA, |
                                                                                0, |
                                                                                0, |
                                                                                0, |
                                                                                0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_POWEREVENT

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_POWEREVENT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_POWEREVENT (' & GWOE:Event:SERVICE_ACCEPT_POWEREVENT & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE  = ISWA_CreateEventA( GLLA:CreateEventA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                                    0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE (' & GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN  = ISWA_CreateEventA( GLLA:CreateEventA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                                    0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN (' & GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_TIMECHANGE
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_TIMECHANGE  = ISWA_CreateEventA( GLLA:CreateEventA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                                    0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_TIMECHANGE

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_TIMECHANGE

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_TIMECHANGE (' & GWOE:Event:SERVICE_ACCEPT_TIMECHANGE & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT  = ISWA_CreateEventA( GLLA:CreateEventA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                                    0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT

        Return 

    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT (' & GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT & ') )' )
        _***_


    End
    Compile('_***_',ISEQ:Debug)         ! CreateEventA  - Creates a WaitObject GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    _***_



    GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT  = ISWA_CreateEventA( GLLA:CreateEventA, |
                                                                    0, |
                                                                    0, |
                                                                    0, |
                                                                    0 )

    Glo:LastError   = ISWA_GetLastError()

    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') = ISWA_CreateEventA( GLLA:CreateEventA (' & GLLA:CreateEventA & '), |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0, |' )
    DSS('CreateWaitObjectEvents : 0 )' )
    DSS('CreateWaitObjectEvents : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
    _***_

    IF NOT GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT

        Return 
    Else

        GWOE:Event:WaitObjectHandlesArrayCnt     += 1
        GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ]  = GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT

        Compile('_***_',ISEQ:Debug)
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ') += 1' )
        DSS('CreateWaitObjectEvents : GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] (' & GWOE:Event:WaitObjectHandlesArray[ GWOE:Event:WaitObjectHandlesArrayCnt ] & ' = GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT (' & GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT & ') )' )
        _***_


    End
    End
    Compile('_***_',ISEQ:Debug)
    DSS('CreateWaitObjectEvents : End' )
    _***_
