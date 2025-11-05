

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC011.INC'),ONCE        !Local module procedure declarations
                     END


SetServiceStatusExitCode PROCEDURE  ( < Ulong pdwWin32ExitCode >, < Ulong pdwServiceSpecificExitCode > ) ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusExitCode : Start' )
    _***_
! ( < Ulong pdwWin32ExitCode >, < Ulong pdwServiceSpecificExitCode > )

    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusExitCode : pdwWin32ExitCode (' & pdwWin32ExitCode & ') : pdwServiceSpecificExitCode (' & pdwServiceSpecificExitCode & ')' )
    _***_


    Case pdwWin32ExitCode ! Return Win32 API errors here

    OF 0
        IF pdwServiceSpecificExitCode = 0
            GSS:dwWin32ExitCode         = ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR

            Compile('_***_',ISEQ:Debug)
            DSS('SetServiceStatusExitCode : Case pdwWin32ExitCode' )
            DSS('SetServiceStatusExitCode : OF 0' )
            DSS('SetServiceStatusExitCode : IF pdwServiceSpecificExitCode = 0' )
            DSS('SetServiceStatusExitCode : GSS:dwWin32ExitCode (' & GSS:dwWin32ExitCode & ') = ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR (' & ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR & ')' )
            _***_

        Else
            GSS:dwWin32ExitCode         = ISEQ:SetServiceStatus:WindowsErrorExitCode:ERROR_SERVICE_SPECIFIC_ERROR
            Compile('_***_',ISEQ:Debug)
            DSS('SetServiceStatusExitCode : Case pdwWin32ExitCode' )
            DSS('SetServiceStatusExitCode : OF 0' )
            DSS('SetServiceStatusExitCode : IF pdwServiceSpecificExitCode = 0' )
            DSS('SetServiceStatusExitCode : Else' )
            DSS('SetServiceStatusExitCode : GSS:dwWin32ExitCode (' & GSS:dwWin32ExitCode & ') = ISEQ:SetServiceStatus:WindowsErrorExitCode:ERROR_SERVICE_SPECIFIC_ERROR (' & ISEQ:SetServiceStatus:WindowsErrorExitCode:ERROR_SERVICE_SPECIFIC_ERROR & ')' )
            _***_

        End

    Else

        GSS:dwWin32ExitCode             = pdwWin32ExitCode
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusExitCode : Case pdwWin32ExitCode' )
        DSS('SetServiceStatusExitCode : OF 0' )
        DSS('SetServiceStatusExitCode : Else' )
        DSS('SetServiceStatusExitCode : GSS:dwWin32ExitCode (' & GSS:dwWin32ExitCode & ') = ISEQ:SetServiceStatus:WindowsErrorExitCode:ERROR_SERVICE_SPECIFIC_ERROR (' & ISEQ:SetServiceStatus:WindowsErrorExitCode:ERROR_SERVICE_SPECIFIC_ERROR & ')' )
        _***_

    End


    Case pdwServiceSpecificExitCode ! Return your Service Error Codes here.

    OF 0
        GSS:dwServiceSpecificExitCode   = ISEQ:SetServiceStatus:SpecificExitCode:NO_ERROR
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusExitCode : Case pdwServiceSpecificExitCode' )
        DSS('SetServiceStatusExitCode : OF 0' )
        DSS('SetServiceStatusExitCode : GSS:dwServiceSpecificExitCode (' & GSS:dwServiceSpecificExitCode & ') = ISEQ:SetServiceStatus:SpecificExitCode:NO_ERROR (' & ISEQ:SetServiceStatus:SpecificExitCode:NO_ERROR & ')' )
        _***_

    Else
        GSS:dwServiceSpecificExitCode   = pdwServiceSpecificExitCode
        Compile('_***_',ISEQ:Debug)
        DSS('SetServiceStatusExitCode : Case pdwServiceSpecificExitCode' )
        DSS('SetServiceStatusExitCode : OF 0' )
        DSS('SetServiceStatusExitCode : Else' )
        DSS('SetServiceStatusExitCode : GSS:dwServiceSpecificExitCode (' & GSS:dwServiceSpecificExitCode & ') = pdwServiceSpecificExitCode (' & pdwServiceSpecificExitCode & ')' )
        _***_

    End



!ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR                     EQUATE(0)     ! The service has not returned an error code
!ISEQ:SetServiceStatus:WindowsErrorExitCode:ERROR_SERVICE_SPECIFIC_ERROR EQUATE(1066)  ! The service has returned a service-specific error code

!ISEQ:SetServiceStatus:SpecificExitCode:NO_ERROR                         EQUATE(0)     ! The service has not returned an error code



    Compile('_***_',ISEQ:Debug)
    DSS('SetServiceStatusExitCode : End' )
    _***_
