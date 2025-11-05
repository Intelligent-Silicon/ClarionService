

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC012.INC'),ONCE        !Local module procedure declarations
                     END


SetServiceStatusCurrentState PROCEDURE  ( Ulong pdwCurrentState, < Ulong pdwCheckPoint > , < Ulong pdwWaitHint > ) ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusCurrentState : Start' )
    _***_
! ( Ulong pdwCurrentState, < Ulong pdwCheckPoint > , < Ulong pdwWaitHint > )


    GSS:dwCurrentState  = pdwCurrentState

    GSS:dwCheckPoint    = pdwCheckPoint ! Increment by 1, 0 resets

    GSS:dwWaitHint      = pdwWaitHint   ! milliseconds,  1 second = 1000 milliseconds

    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusCurrentState : GSS:dwCurrentState (' & GSS:dwCurrentState & ') = pdwCurrentState (' & pdwCurrentState & ')' )
    DSS('SetServiceStatusCurrentState : GSS:dwCheckPoint (' & GSS:dwCheckPoint & ') = pdwCheckPoint (' & pdwCheckPoint & ')' )
    DSS('SetServiceStatusCurrentState : GSS:dwWaitHint (' & GSS:dwWaitHint & ') = pdwWaitHint (' & pdwWaitHint & ')' )
    _***_



!    ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED          Equate(00000001h) ! Service is not running.
!    ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING    Equate(00000002h) ! Service is in the process of starting.
!    ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING     Equate(00000003h) ! Service is in the process of stopping.
!    ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING          Equate(00000004h) ! Service is actively running.
!    ISEQ:SetServiceStatus:CurrentState:SERVICE_CONTINUE_PENDING Equate(00000005h) ! Service is in the process of continuing from a paused state.
!    ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING    Equate(00000006h) ! Service is in the process of pausing.
!    ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSED           Equate(00000007h) ! Service is currently paused.
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusCurrentState : End' )
    _***_
