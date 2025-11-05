

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC006.INC'),ONCE        !Local module procedure declarations
                     END


FreeLibraryEx        PROCEDURE                             ! Declare Procedure
Loc:EntryCnt         ULONG                                 !
Loc:Cnt              ULONG                                 !
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('FreeLibraryEx : Start' )
    _***_
    Loc:EntryCnt    = Records( GLLQ:GlobalLoadLibraryQ )

    Compile('_***_',ISEQ:Debug)
    DSS('FreeLibraryEx : Loc:EntryCnt (' & Loc:EntryCnt & ')    = Records( GLLQ:GlobalLoadLibraryQ )' )
    _***_


    Loc:Cnt = 0
    Loop Loc:EntryCnt times
        Loc:Cnt += 1
        Get( GLLQ:GlobalLoadLibraryQ, Loc:Cnt )

        Compile('_***_',ISEQ:Debug)
        DSS('FreeLibraryEx : Get( GLLQ:GlobalLoadLibraryQ, Loc:Cnt (' & Loc:Cnt & ') ) ErrorCode() = ' & ErrorCode() )
        _***_

        IF ErrorCode() = 0
            Loc:RVBool = ISWA_FreeLibrary( GLLQ:LoadLibraryHandle )

            Compile('_***_',ISEQ:Debug)
            DSS('FreeLibraryEx : Loc:RVBool (' & Loc:RVBool & ') = ISWA_FreeLibrary( GLLQ:LoadLibraryHandle (' & GLLQ:LoadLibraryHandle & ') )' )
            _***_

        End
    End
    Compile('_***_',ISEQ:Debug)
    DSS('FreeLibraryEx : End' )
    _***_
