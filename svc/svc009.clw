

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC009.INC'),ONCE        !Local module procedure declarations
                     END


SetServiceStatusServiceType PROCEDURE  ( < Ulong pdwServiceType > ) ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusServiceType : Start' )
    _***_
! ( < Ulong pdwServiceType > )



    IF NOT pdwServiceType   ! Default version which in reality is the most likely case for your clarion app

        GSS:dwServiceType   = ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusServiceType : GSS:dwServiceType (' & GSS:dwServiceType & ') = ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS (' & ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS & ')' )
        _***_

    Else

        GSS:dwServiceType   = pdwServiceType
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusServiceType : GSS:dwServiceType (' & GSS:dwServiceType & ') = pdwServiceType (' & pdwServiceType & ')' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusServiceType : End' )
    _***_
