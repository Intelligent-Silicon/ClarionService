

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC029.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('SVC017.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC019.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC020.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC022.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC026.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC027.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('SVC028.INC'),ONCE        !Req'd for module callout resolution
                     END


ServiceCheck         PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('ServiceCheck : Start' )
    _***_
    IF NOT GSCV:ServiceMode = 1 ! If not called by the Service Control Manager (SC)

        OpenSCManagerA()

        IF NOT GSCM:SCMHandle

            GEC:ExitApp     = 1
            GEC:ExitCode    = GSCM:SCMLastError  ! Use/Pass on Window Error Codes

        Else

            OpenServiceA()

            IF NOT GEC:ExitApp     = 1

                Compile('_***_',ISEQ:Debug)
                DSS('ServiceCheck : IF NOT GEC:ExitApp (' & GEC:ExitApp & ') = 1' )
                _***_


                IF GCL:CommandLineAction = 1 ! Install

                    Compile('_***_',ISEQ:Debug)
                    DSS('ServiceCheck : IF GCL:CommandLineAction (' & GCL:CommandLineAction & ') = 1 ! Install' )
                    _***_

                    IF GSCM:ServiceLastError = ISEQ:WindowsErrorCode:ERROR_SERVICE_DOES_NOT_EXIST

                        Compile('_***_',ISEQ:Debug)
                        DSS('ServiceCheck : IF GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISEQ:WindowsErrorCode:ERROR_SERVICE_DOES_NOT_EXIST (' & ISEQ:WindowsErrorCode:ERROR_SERVICE_DOES_NOT_EXIST & ') ' )
                        _***_

                        CreateServiceA()

                        Compile('_***_',ISEQ:Debug)
                        DSS('ServiceCheck : End ! IF GSCM:ServiceLastError (' & GSCM:ServiceLastError & ') = ISEQ:WindowsErrorCode:ERROR_SERVICE_DOES_NOT_EXIST (' & ISEQ:WindowsErrorCode:ERROR_SERVICE_DOES_NOT_EXIST & ') ' )
                        _***_

                    End

                    IF GSCM:ServiceHandle

                        Compile('_***_',ISEQ:Debug)
                        DSS('ServiceCheck : IF GSCM:ServiceHandle (' & GSCM:ServiceHandle & ')' )
                        _***_

                        QueryServiceConfigA()
                        QueryServiceConfig2A()

                        ChangeServiceConfigA()
                        ChangeServiceConfig2A()

                        Compile('_***_',ISEQ:Debug)
                        DSS('ServiceCheck : End ! IF GSCM:ServiceHandle (' & GSCM:ServiceHandle & ')' )
                        _***_

                    End

                End


                IF GCL:CommandLineAction = 2 ! Check This is also the default action

                    Compile('_***_',ISEQ:Debug)
                    DSS('ServiceCheck : IF GCL:CommandLineAction (' & GCL:CommandLineAction & ') = 2 ! Check' )
                    _***_

                    IF GSCM:ServiceHandle

                        Compile('_***_',ISEQ:Debug)
                        DSS('ServiceCheck : IF GSCM:ServiceHandle (' & GSCM:ServiceHandle & ')' )
                        _***_


                        QueryServiceConfigA()
                        QueryServiceConfig2A()

                        ChangeServiceConfigA()
                        ChangeServiceConfig2A()

                        Compile('_***_',ISEQ:Debug)
                        DSS('ServiceCheck : End ! IF GSCM:ServiceHandle (' & GSCM:ServiceHandle & ')' )
                        _***_

                    End

                    Compile('_***_',ISEQ:Debug)
                    DSS('ServiceCheck : End ! IF GCL:CommandLineAction (' & GCL:CommandLineAction & ') = 2 ! Check' )
                    _***_

                End


                IF GCL:CommandLineAction = 3 ! Delete

                    Compile('_***_',ISEQ:Debug)
                    DSS('ServiceCheck : IF GCL:CommandLineAction = 3 ! Delete' )
                    _***_

                    DeleteService()

                    Compile('_***_',ISEQ:Debug)
                    DSS('ServiceCheck : End ! IF GCL:CommandLineAction = 3 ! Delete' )
                    _***_

                End

                CloseServiceHandle()

                CloseSCManagerHandle()


                IF GCL:CommandLineAction = 3 ! Delete

                    Compile('_***_',ISEQ:Debug)
                    DSS('ServiceCheck : IF GCL:CommandLineAction (' & GCL:CommandLineAction & ') = 3 ! Delete' )
                    _***_

                    GEC:ExitApp     = 1
                    GEC:ExitCode    = 0 ! Use/Pass on Window Error Codes

                    Compile('_***_',ISEQ:Debug)
                    DSS('ServiceCheck : GEC:ExitApp (' & GEC:ExitApp & ') = 1' )
                    DSS('ServiceCheck : GEC:ExitCode (' & GEC:ExitCode & ') = 0' )
                    DSS('ServiceCheck : End ! IF GCL:CommandLineAction (' & GCL:CommandLineAction & ') = 3 ! Delete' )
                    _***_

                End

            End

        End
    End
    Compile('_***_',ISEQ:Debug)
    DSS('ServiceCheck : End' )
    _***_
