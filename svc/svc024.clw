

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC024.INC'),ONCE        !Local module procedure declarations
                     END


NtQueryInformationProcess PROCEDURE                        ! Declare Procedure
Loc:ProcessID        LONG                                  !
Loc:RV_NTStatus      LONG                                  !
Loc:ProcessInformationClass LONG                           !
Loc:ProcessInformationAddress LONG                         !
Loc:ProcessInformationLength LONG                          !
Loc:ReturnLength     ULONG                                 !
Loc:TempBuffer       STRING(1)                             !
Loc:StringBuffer     &STRING                               !
Loc:AddressPos       LONG                                  !
Loc:RVLong           LONG                                  !
ISEQ:Debug      Equate(True)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : Start' )
    _***_
    Loc:ProcessInformationClass = ISEQ:NTQuery:ProcessBasicInformation  !

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : Loc:ProcessInformationClass (' & Loc:ProcessInformationClass & ') = ISEQ:NTQuery:ProcessBasicInformation' )
    _***_

    Loc:ProcessID = ISWA_GetCurrentProcess( GLLA:GetCurrentProcess )

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : Loc:ProcessID (' & Loc:ProcessID & ') = ISWA_GetCurrentProcess( GLLA:GetCurrentProcess (' & GLLA:GetCurrentProcess & ') )' )
    _***_

    GNTQ:PebBaseAddress = Address( Loc:TempBuffer )

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : GNTQ:PebBaseAddress (' & GNTQ:PebBaseAddress & ') = Address( Loc:TempBuffer )' )
    _***_

    Loc:RV_NTStatus = ISWA_NtQueryInformationProcess(   GLLA:NtQueryInformationProcess, |
                                                        Loc:ProcessID, |
                                                        Loc:ProcessInformationClass, |
                                                        Address( GNTQ:ProcessBasicInformationGrp ), |
                                                        Size( GNTQ:ProcessBasicInformationGrp ), |
                                                        Address( Loc:ReturnLength ) )

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : Loc:RV_NTStatus (' & Loc:RV_NTStatus & ') = ISWA_NtQueryInformationProcess( GLLA:NtQueryInformationProcess (' & GLLA:NtQueryInformationProcess & '), |' &|
                                                      ' Loc:ProcessID (' & Loc:ProcessID & '), |' &|
                                                      ' Loc:ProcessInformationClass (' & Loc:ProcessInformationClass & '), |' &|
                                                      ' Address( GNTQ:ProcessBasicIinformationGrp ) (' & Address( GNTQ:ProcessBasicInformationGrp ) & '), |' &|
                                                      ' Size( GNTQ:ProcessBasicIinformationGrp ) (' & Size( GNTQ:ProcessBasicInformationGrp ) & '), |' &|
                                                      ' Address( Loc:ReturnLength ) (' & Address( Loc:ReturnLength ) & ') (' & Loc:ReturnLength & ') ) )' )
    _***_


    Loc:StringBuffer &= New( String( Loc:ReturnLength ) )

    GNTQ:PebBaseAddress = Address( Loc:StringBuffer )

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : GNTQ:PebBaseAddress (' & GNTQ:PebBaseAddress & ') = Address( Loc:StringBuffer )' )
    _***_

    Loc:RV_NTStatus = ISWA_NtQueryInformationProcess(   GLLA:NtQueryInformationProcess, |
                                                        Loc:ProcessID, |
                                                        Loc:ProcessInformationClass, |
                                                        Address( GNTQ:ProcessBasicInformationGrp ), |
                                                        Size( GNTQ:ProcessBasicInformationGrp ), |
                                                        Address( Loc:ReturnLength ) )

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : Loc:RV_NTStatus (' & Loc:RV_NTStatus & ') = ISWA_NtQueryInformationProcess( GLLA:NtQueryInformationProcess (' & GLLA:NtQueryInformationProcess & '), |' &|
                                                      ' Loc:ProcessID (' & Loc:ProcessID & '), |' &|
                                                      ' Loc:ProcessInformationClass (' & Loc:ProcessInformationClass & '), |' &|
                                                      ' Address( GNTQ:ProcessBasicIinformationGrp ) (' & Address( GNTQ:ProcessBasicInformationGrp ) & '), |' &|
                                                      ' Size( GNTQ:ProcessBasicIinformationGrp ) (' & Size( GNTQ:ProcessBasicInformationGrp ) & '), |' &|
                                                      ' Address( Loc:ReturnLength ) (' & Address( Loc:ReturnLength ) & ') (' & Loc:ReturnLength & ') ) )' )
    _***_


    IF NOT Loc:RV_NTStatus

        Compile('_***_',ISEQ:Debug)     
        DSS('NtQueryInformationProcess : GNTQ:UniqueProcessId (' & GNTQ:UniqueProcessId & ')' )
        DSS('NtQueryInformationProcess : GNTQ:InheritedFromUniqueProcessId (' & GNTQ:InheritedFromUniqueProcessId & ') ! - services.exe, explorer.exe or something else' )
        _***_

        Peek( GNTQ:PebBaseAddress, GNTQ:PEB )

        Compile('_***_',ISEQ:Debug)
        DSS('NtQueryInformationProcess : Peek( GNTQ:PebBaseAddress, GNTQ:PEB )' )
        DSS('NtQueryInformationProcess : GNTQ:BeingDebugged (' & GNTQ:BeingDebugged & ')' )
        _***_

        Peek( GNTQ:ProcessParameters, GNTQ:RTL_User_Process_Parameters )

        Compile('_***_',ISEQ:Debug)
        DSS('NtQueryInformationProcess : Peek( GNTQ:ProcessParameters, GNTQ:RTL_User_Process_Parameters )' )
        _***_


        Loc:RVLong = UnicodeStringToAnsiString( GNTQ:RTL_ImagePath_Buffer, GSPD:SCMModuleFilename )   ! Not used any more

        Compile('_***_',ISEQ:Debug)
        DSS('NtQueryInformationProcess : Loc:RVLong (' & Loc:RVLong & ') = UnicodeStringToAnsiString( GNTQ:RTL_ImagePath_Buffer, GSPD:SCMModuleFilename (' & GSPD:SCMModuleFilename & ') )' )
        _***_



    End

    Dispose( Loc:StringBuffer )

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : Dispose( Loc:StringBuffer )' )
    _***_

    Compile('_***_',ISEQ:Debug)
    DSS('NtQueryInformationProcess : End' )
    _***_
