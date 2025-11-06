

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC018.INC'),ONCE        !Local module procedure declarations
                     END


ChangeServiceConfig2A PROCEDURE                            ! Declare Procedure
Loc:InfoLevel        ULONG                                 !
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('ChangeServiceConfig2A : Start' )
    _***_
    Loc:InfoLevel   = 1  ! SERVICE_CONFIG_DESCRIPTION

    ! Windows Server 2003 and Windows XP:  Localized strings are not supported until Windows Vista.


    IF NOT GSCM:QS1_Description = GSCM:DS1_Description

        GSCM:CS1_DescriptionAddress = Address( GSCM:CS1_Description )
        GSCM:CS1_Description        = GSCM:DS1_Description


        Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS1_ServiceDescriptionAGrp ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        IF NOT Loc:RVBool

            Case GSCM:ServiceLastError
            OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

            OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

            OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

            End

        End

    End


    Loc:InfoLevel   = 2 ! SERVICE_CONFIG_FAILURE_ACTIONS

    ! Windows Server 2003 and Windows XP:  Localized strings are not supported until Windows Vista.


    IF NOT GSCM:QS2_ServiceFailureActionsAGrp = GSCM:DS2_ServiceFailureActionsAGrp

        GSCM:CS2_1_ResetPeriod              = GSCM:DS2_ResetPeriod
        GSCM:CS2_2_RebootMsgAddress         = Address( GSCM:CS2_RebootMsg )
        GSCM:CS2_3_CommandAddress           = Address( GSCM:CS2_Command )
        GSCM:CS2_4_Actions                  = GSCM:DS2_Actions
        GSCM:CS2_5_SC_ActionsAddress        = Address( GSCM:CS2_SC_Action )

        GSCM:CS2_Type[1]                    = GSCM:DS2_Type[1]
        GSCM:CS2_Delay[1]                   = GSCM:DS2_Delay[1]
        GSCM:CS2_Type[2]                    = GSCM:DS2_Type[2]
        GSCM:CS2_Delay[2]                   = GSCM:DS2_Delay[2]
        GSCM:CS2_Type[3]                    = GSCM:DS2_Type[3]
        GSCM:CS2_Delay[3]                   = GSCM:DS2_Delay[3]

        GSCM:CS2_RebootMsg                  = GSCM:DS2_RebootMsg
        GSCM:CS2_Command                    = GSCM:DS2_Command

        Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS2_ServiceFailureActionsAGrp ) )

        GSCM:ServiceLastError = ISWA_GetLastError()

        IF NOT Loc:RVBool

            Case GSCM:ServiceLastError
            OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

            OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

            OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

            End

        End

    End


    Loc:InfoLevel   = 3 ! SERVICE_CONFIG_DELAYED_AUTO_START_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        IF NOT GSCM:QS3_ServiceDelayedAutoStartInfoGrp = GSCM:DS3_ServiceDelayedAutoStartInfoGrp

            GSCM:CS3_DelayedAutostart = GSCM:DS3_DelayedAutostart

            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS3_ServiceDelayedAutoStartInfoGrp ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End

    Loc:InfoLevel   = 4 ! SERVICE_CONFIG_FAILURE_ACTIONS_FLAG

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        IF NOT GSCM:QS4_ServiceFailureActionsFlagGrp = GSCM:DS4_ServiceFailureActionsFlagGrp

            GSCM:CS4_FailureActionsOnNonCrashFailures = GSCM:DS4_FailureActionsOnNonCrashFailures

            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS4_ServiceFailureActionsFlagGrp ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End

    Loc:InfoLevel   = 5 ! SERVICE_CONFIG_SERVICE_SID_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        IF NOT GSCM:QS5_ServiceSIDInfoGrp = GSCM:DS5_ServiceSIDInfoGrp

            GSCM:CS5_ServiceSidType = GSCM:DS5_ServiceSidType

            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:QS5_ServiceSIDInfoGrp ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End

    Loc:InfoLevel   = 6 ! SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        IF NOT GSCM:QS6_ServiceRequiredPrivilegesInfoAGrp = GSCM:DS6_RequiredPrivilegesGrp

            ! ToDo need to find example using Required Privileges

            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:DS6_RequiredPrivilegesAddress ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End
    Loc:InfoLevel   = 7 ! SERVICE_CONFIG_PRESHUTDOWN_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        IF NOT GSCM:QS7_ServicePreShutdownInfoGrp = GSCM:DS7_ServicePreShutdownInfoGrp

            GSCM:CS7_PreshutdownTimeout = GSCM:DS7_PreshutdownTimeout

            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS7_ServicePreShutdownInfoGrp ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End

    Loc:InfoLevel   = 8 ! SERVICE_CONFIG_TRIGGER_INFO

    IF GOVIE:dwMajorVersion > 5 ! Min Windows Vista and Windows Server 2008

        IF NOT GSCM:QS8_cTriggers = GSCM:DS8_cTriggers

            GSCM:CS8_cTriggers                  = GSCM:DS8_cTriggers
            GSCM:CS8_pTriggersAddress           = GSCM:DS8_pTriggersAddress
            GSCM:CS8_pReserved                  = GSCM:DS8_pReserved


!            GSCM:CS8_cTriggers                  = GSCM:DS8_cTriggers
!            GSCM:CS8_pTriggersAddress           = Address( GSCM:CS8_ServiceTriggerGrp )
!            GSCM:CS8_pReserved                  = GSCM:DS8_pReserved
!
!            GSCM:QS8_TriggerType                    =
!            GSCM:QS8_Action                         =
!            GSCM:QS8_TriggerSubTypeGuidAddress      = Address( GSCM:QS8_TriggerSubTypeGuid )
!
!            GSCM:QS8_DataItems                      =
!            GSCM:QS8_DataItemsAddress               = Address(
!
!            GSCM:QS8_DataType                       = ISEQ:SCM:SERVICE_TRIGGER_DATA_TYPE_BINARY
!            GSCM:QS8_Data                           =
!
!            GSCM:QS8_ServiceTriggerDataTypeBinary   =
!
!
!            GSCM:QS8_DataType                       = ISEQ:SCM:SERVICE_TRIGGER_DATA_TYPE_STRING
!            GSCM:QS8_Data                           =
!
!            GSCM:QS8_ServiceTriggerDataTypeString   =
!


            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS8_ServiceTriggerInfoGrp ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End

    Loc:InfoLevel   = 9 ! SERVICE_CONFIG_PREFERRED_NODE -- Numa Nodes

    IF GOVIE:dwMajorVersion > 5 and GNN:HighestNodeNumber ! Min Windows Vista and Windows Server 2008 and Numa Nodes must Exist

        IF NOT GSCM:QS9_ServicePreferredNodeInfoGrp = GSCM:DS9_ServicePreferredNodeInfoGrp

            GSCM:CS9_PreferredNode      = GSCM:DS9_PreferredNode
            GSCM:CS9_Delete             = GSCM:DS9_Delete


            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS9_ServicePreferredNodeInfoGrp ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End

    Loc:InfoLevel   = 12 ! SERVICE_CONFIG_LAUNCH_PROTECTED

    IF ( GOVIE:dwMajorVersion = 6 and GOVIE:dwMinorVersion => 3 )  OR GOVIE:dwMajorVersion > 6 ! Min Windows 8.1

        IF NOT GSCM:QS12_ServiceLaunchProtectedInfoGrp = GSCM:DS12_ServiceLaunchProtectedInfoGrp

            GSCM:CS12_LaunchProtected = GSCM:DS12_LaunchProtected


            Loc:RVBool = ISWA_ChangeServiceConfig2A( GLLA:ChangeServiceConfig2A, GSCM:ServiceHandle, Loc:InfoLevel, Address( GSCM:CS12_ServiceLaunchProtectedInfoGrp ) )

            GSCM:ServiceLastError = ISWA_GetLastError()

            IF NOT Loc:RVBool

                Case GSCM:ServiceLastError
                OF ISEQ:WindowsErrorCode:ERROR_ACCESS_DENIED

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INSUFFICIENT_BUFFER

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                OF ISEQ:WindowsErrorCode:ERROR_INVALID_HANDLE

                GEC:ExitApp     = 0                         ! Wont terminate the program
                GEC:ExitCode    = GSCM:ServiceLastError     ! but will return the errorcode

                End

            End

        End
    End

    Compile('_***_',ISEQ:Debug)
    DSS('ChangeServiceConfig2A : End' )
    _***_
