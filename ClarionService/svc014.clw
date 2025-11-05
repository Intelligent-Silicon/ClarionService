

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC014.INC'),ONCE        !Local module procedure declarations
                     END


DSC                  PROCEDURE  (*Cstring pCstring)        ! Declare Procedure
Loc:RVLong           LONG                                  !
  CODE
!    IF GD:LogToDebugOutput
!
!        GD:DebugOutputID   += 1
!        DbgO:RecordID       = GD:DebugOutputID
!        DbgO:Date           = Today()
!        DbgO:Time           = Clock()
!        DbgO:DebugString    = pCstring
!        !Access:DebugOutput.TryInsert()
!        Add( DebugOutput )
!
!        IF GD:LastFlushDebugOutputID <  ( GD:DebugOutputID + 100 )
!            Flush( DebugOutput )
!        End
!
!    End

    Loc:RVLong = ISWA_OutputDebugStringA(pCstring)
