

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC025.INC'),ONCE        !Local module procedure declarations
                     END


UnicodeStringToAnsiString PROCEDURE  ( Long pUnicodeStringAddress, *Cstring pAnsiCstring ) ! Declare Procedure
Loc:CodePage         ULONG                                 !
Loc:dwFlags          ULONG                                 !
Loc:UnicodeStringLen LONG                                  !
Loc:AnsiStringLen    LONG                                  !
Loc:lpDefaultChar    LONG                                  !
Loc:UsedDefaultChar  LONG                                  !
Loc:RVLong           LONG                                  !
  CODE
! ( Long pUnicodeStringAddress, *Cstring pAnsiCstring ), Long

    Loc:CodePage            = ISWA_GetACP( GLLA:GetACP )
    Loc:dwFlags             = 0
    !Loc:UnicodeStringLen    = ISWA_lstrlenW( GLLA:lstrlenW, pUnicodeStringAddress ) ! can do a -1 to indicate the string is null terminated
    !Loc:UnicodeStringLen    = GNTQ:RTL_ImagePath_Length
    !Loc:UnicodeStringLen    = GNTQ:RTL_ImagePath_MaximumLength
    Loc:UnicodeStringLen    = -1
    Loc:AnsiStringLen       = Size( pAnsiCstring )
    Loc:lpDefaultChar       = 0
    Loc:UsedDefaultChar     = 0
    Loc:RVLong              = ISWA_WideCharToMultiByte( GLLA:WideCharToMultiByte, |
                                                        Loc:CodePage, | Ulong
                                                        Loc:dwFlags, | Ulong
                                                        pUnicodeStringAddress, | Long
                                                        Loc:UnicodeStringLen, | Long
                                                        Address( pAnsiCstring ), |
                                                        Loc:AnsiStringLen, |
                                                        Address( Loc:lpDefaultChar) , |
                                                        Address( Loc:UsedDefaultChar ) )

    GLO:LastError  = ISWA_GetLastError()
    Return Loc:RVLong

!ConvertUnicodeToAnsi PROCEDURE(*UNICODE_STRING ustr, *CSTRING ansiBuffer, LONG bufferSize)
!CODE
!  WideCharToMultiByte(CP_ACP, 0, 
!                      ustr.Buffer, 
!                      ustr.Length / 2, 
!                      ansiBuffer, bufferSize, 
!                      0, 0)
!
!
!Loc:cchWideChar         = ISWA_lstrlenW( Address(Loc:GuidStringW) )
!
!                                Result#              = ISWA_WideCharToMultiByte( Loc:CodePage, |  Ulong
!                                                                                    Loc:dwFlags, |   Ulong
!                                                                                    Address(Loc:GuidStringW), | long
!                                                                                    Loc:cchWideChar, |    long
!                                                                                    Address( GWMPowerQ:NotificationStatus ), |  long
!                                                                                    Size( GWMPowerQ:NotificationStatus ), | long
!                                                                                    Loc:lpDefaultChar, |
!                                                                                    Address( Loc:UsedDefaultChar ) )
