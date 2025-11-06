

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC001.INC'),ONCE        !Local module procedure declarations
                     END


Main                 PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('Main : Start' )
    _***_
! https://learn.microsoft.com/en-us/windows/win32/services/service-servicemain-function
    Compile('_***_',ISEQ:Debug)
    DSS('Main : End' )
    _***_
