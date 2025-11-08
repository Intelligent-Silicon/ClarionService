

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


    IF NOT pdwControlsAccepted  ! Default switch it all on except SERVICE_ACCEPT_USERMODEREBOOT... see notes below.

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


        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE )' )
        _***_


        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE )' )
        _***_


        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE )' )
        _***_


        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT )' )
        _***_


        GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE )
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE )' )
        _***_

        IF GOVIE:WindowsVersion > 5.2 ! Vista and Server 2008 onwards

!            ! Windows Server 2003, Windows XP:  This value is not supported.
!            ! Use this Control wisely. See https://learn.microsoft.com/en-us/windows/win32/services/service-control-handler-function
!            ! It receives this control first and blocks the SERVICE_ACCEPT_SHUTDOWN control signal until PRESHUTDOWN timeout occurs or any code for this
!            ! in the Handler completes.

            GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN )
            Compile('_***_',ISEQ:Debug)
            DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN )' )
            _***_

            IF GOVIE:WindowsVersion > 6.0 ! Win 7 and Server 2008 R2 onwards
                ! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.

                GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE )
                Compile('_***_',ISEQ:Debug)
                DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE )' )
                _***_

!               You need to register the Trigger events first, before you can use this
!               https://learn.microsoft.com/en-us/windows/win32/services/service-trigger-events

                GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT )
                Compile('_***_',ISEQ:Debug)
                DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT )' )
                _***_

                IF GOVIE:WindowsVersion > 6.1 ! Windows 8 and Server 2012 onwards

!                    ! For some reason this does not work on Win 11 22H2 and havent found out why.
!                    ! Nothing is mentioned in the various Windows API doc webpages, various LLM's dont have any valid suggestions either
!                    ! so for now this a mystery

!                    GSS:dwControlsAccepted         = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT )
!                    Compile('_***_',ISEQ:Debug)
!                    DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = Bor( GSS:dwControlsAccepted, ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT )' )
!                    _***_


                End ! IF GOVIE:WindowsVersion > 6.1 ! Windows 8 and Server 2012 onwards

            End ! IF GOVIE:WindowsVersion > 6.0 ! Win 7 and Server 2008 R2 onwards

        End ! IF GOVIE:WindowsVersion > 5.2 ! Vista and Server 2008 onwards

    Else

        GSS:dwControlsAccepted   = pdwControlsAccepted
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusControlsAccepted : GSS:dwControlsAccepted (' & GSS:dwControlsAccepted & ') = pdwControlsAccepted (' & pdwControlsAccepted & ')' )
        _***_

    End
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusControlsAccepted : Start' )
    _***_
