

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC010.INC'),ONCE        !Local module procedure declarations
                     END


SetServiceStatusControlsAccepted PROCEDURE  ( < Ulong pdwControlsAccepted > ) ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusControlsAccepted : Start' )
    _***_
! ( < Ulong pdwControlsAccepted > )

    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusControlsAccepted : pdwControlsAccepted (' & pdwControlsAccepted & ')' )
    _***_


    IF NOT pdwControlsAccepted  ! Default switch it all on

        Compile('_***_',ISEQ:Debug)         ! SetServiceStatusControlsAccepted(   GSS:dwControlsAccepted )
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted         = 0' )
        _***_


        GSS:dwControlsAccepted         = 0
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = 0' )
        _***_

        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP )' )
        _***_


        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE )' )
        _***_

        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN )' )
        _***_


!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE )' )
!        _***_
!
!
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE )' )
!        _***_
!
!
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE )' )
!        _***_
!
!
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT )' )
!        _***_
!
!
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE )' )
!        _***_
!
!        ! In Practice as these are higher numbers, the OS, whatever version it is, will simply ignore these values....
!        ! Windows Server 2003, Windows XP:  This value is not supported.
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN )' )
!        _***_
!
!        ! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE )' )
!        _***_
!
!
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT )' )
!        _***_
!
!
!        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT )
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT )' )
!        _***_
!
!        ! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!        Compile('_***_',ISEQ:Debug)
!        DSS('SetServiceStatusControlsAccepted : SetServiceStatusControlsAccepted( GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') )' )
!        _***_


    Else

        GSS:dwControlsAccepted   = pdwControlsAccepted
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = pdwControlsAccepted (' & pdwControlsAccepted & ')' )
        _***_

    End


!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.
!
!! Windows Server 2003, Windows XP:  This value is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).
!
!! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
!ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusControlsAccepted : Start' )
    _***_
