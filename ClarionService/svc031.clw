

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC031.INC'),ONCE        !Local module procedure declarations
                     END


CloseWaitObjectEventHandles PROCEDURE                      ! Declare Procedure
Loc:ArrayPos         ULONG                                 !
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('CloseWaitObjectEventHandles : Start' )
    _***_
    Compile('_***_',ISEQ:Debug)
    DSS('CloseWaitObjectEventHandles : Loop Loc:ArrayPos (' & Loc:ArrayPos & ') = 1 to GWOE:Event:WaitObjectHandlesArrayCnt (' & GWOE:Event:WaitObjectHandlesArrayCnt & ')' )
    _***_

    Loop Loc:ArrayPos = 1 to GWOE:Event:WaitObjectHandlesArrayCnt

        Loc:RVBool = ISWA_CloseHandle( GLLA:CloseHandle, GWOE:Event:WaitObjectHandlesArray [ Loc:ArrayPos ] )

        Glo:LastError = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('CloseWaitObjectEventHandles : Loc:RVBool (' & Loc:RVBool & ') = ISWA_CloseHandle( GLLA:CloseHandle, GWOE:Event:WaitObjectHandlesArray [ Loc:ArrayPos ] )' )
        DSS('CloseWaitObjectEventHandles : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()' )
        _***_

    End

    Compile('_***_',ISEQ:Debug)
    DSS('CloseWaitObjectEventHandles : End' )
    _***_
    Compile('_***_',ISEQ:Debug)
    DSS('CloseWaitObjectEventHandles : End' )
    _***_
