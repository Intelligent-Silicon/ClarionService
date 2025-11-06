

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC013.INC'),ONCE        !Local module procedure declarations
                     END


DSS                  PROCEDURE  (String pString)           ! Declare Procedure
Loc:Cstring          &CSTRING                              !
  CODE
    Loc:Cstring &= New( Cstring( Size(pString) + 1 ) )

    Loc:Cstring = pString

    DSC( Loc:Cstring )

    Dispose( Loc:Cstring )

