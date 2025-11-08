

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC005.INC'),ONCE        !Local module procedure declarations
                     END


Count_ClarionService_Instances PROCEDURE                   ! Declare Procedure
Loc:SnapshotHandle   LONG                                  !
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(True)
    Map

CheckEXE        Procedure

    End
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('Count_Service_Instances : Start' )
    _***_
    Compile('_***_',ISEQ:Debug)
    DSS('Count_Service_Instances : Start' )
    _***_

    ! GetModuleFileNameExA crashes and kills the service on Win 11 not Win XP, when trying to confirm the ParentProcessID aka InheritedFromUniqueProcessId
    ! obtained from NtQueryInformationProcess PROCESS_BASIC_INFORMATION. GetModuleFileNameExA would return "c:\windows\system32\services.exe"
    ! So the below is a workaround to get the process ID for services.exe and then compare it to the ParentProcessID obtained from
    ! NtQueryInformationProcess PROCESS_BASIC_INFORMATION to make sure its been called by Services before starting ServiceMain and the HandlerEx

    Loc:SnapshotHandle = ISWA_CreateToolhelp32Snapshot( GLLA:CreateToolhelp32Snapshot, |
                                                        ISEQ:TH32CS_SNAPPROCESS, |
                                                        0 )

    GLO:LastError   = ISWA_GetLastError()


    Compile('_***_',ISEQ:Debug)
    DSS('Count_Service_Instances : Loc:SnapshotHandle (' & Loc:SnapshotHandle & ') = ISWA_CreateToolhelp32Snapshot( GLLA:CreateToolhelp32Snapshot (' & GLLA:CreateToolhelp32Snapshot & '), |' )
    DSS('Count_Service_Instances : ISEQ:TH32CS_SNAPPROCESS (' & ISEQ:TH32CS_SNAPPROCESS & '), |' )
    DSS('Count_Service_Instances : 0 ' )
    DSS('Count_Service_Instances : GLO:LastError (' & GLO:LastError & ') = ISWA_GetLastError()' )
    DSS('Count_Service_Instances : IF Loc:SnapshotHandle (' & Loc:SnapshotHandle & ')' )
    _***_


    IF Loc:SnapshotHandle

        GS:dwSize = Size( GS:ProcessEntry32 )

        Compile('_***_',ISEQ:Debug)
        DSS('Count_Service_Instances : GS:dwSize (' & GS:dwSize & ') = Size( GS:ProcessEntry32 )' )
        _***_


        Loc:RVBool = ISWA_Process32First(   GLLA:Process32First, |
                                            Loc:SnapshotHandle, |
                                            Address( GS:ProcessEntry32 ) )

        GLO:LastError   = ISWA_GetLastError()

        Compile('_***_',ISEQ:Debug)
        DSS('Count_Service_Instances : Loc:RVBool (' & Loc:RVBool & ') = ISWA_Process32First( GLLA:Process32First (' & GLLA:Process32First & '), |' )
        DSS('Count_Service_Instances : Loc:SnapshotHandle (' & Loc:SnapshotHandle & '), |' )
        DSS('Count_Service_Instances : Address( GS:ProcessEntry32 ) (' & Address( GS:ProcessEntry32 ) & ') )' )
        DSS('Count_Service_Instances : GLO:LastError (' & GLO:LastError & ') = ISWA_GetLastError()' )
        _***_


!        Compile('_***_',ISEQ:Debug)
!        DSS('Count_Service_Instances : IF GS:th32ProcessID (' & GS:th32ProcessID & ') = GNTQ:InheritedFromUniqueProcessId (' & GNTQ:InheritedFromUniqueProcessId & ')' )
!        _***_

        CheckEXE()

            ! IF GS:szExeFile = 'services.exe', you can use the GS:th32ProcessID to find all processes where
            ! GS:th32ParentProcessID = the 'services.exe' GS:th32ProcessID

        Compile('_***_',ISEQ:Debug)
        DSS('Count_Service_Instances : IF Loc:RVBool (' & Loc:RVBool & ')' )
        _***_

        IF Loc:RVBool

            Compile('_***_',ISEQ:Debug)
            DSS('Count_Service_Instances : *************************************' )
            DSS('Count_Service_Instances : GS:dwSize (' & GS:dwSize & ')' )
            DSS('Count_Service_Instances : GS:cntUsage (' & GS:cntUsage & ')' )
            DSS('Count_Service_Instances : GS:th32ProcessID (' & GS:th32ProcessID & ')' )
            DSS('Count_Service_Instances : GS:th32DefaultHeapID (' & GS:th32DefaultHeapID & ')' )
            DSS('Count_Service_Instances : GS:th32ModuleID (' & GS:th32ModuleID & ')' )
            DSS('Count_Service_Instances : GS:cntThreads (' & GS:cntThreads & ')' )
            DSS('Count_Service_Instances : GS:th32ParentProcessID (' & GS:th32ParentProcessID & ')' )
            DSS('Count_Service_Instances : GS:pcPriClassBase (' & GS:pcPriClassBase & ')' )
            DSS('Count_Service_Instances : GS:dwFlags (' & GS:dwFlags & ')' )
            DSS('Count_Service_Instances : GS:szExeFile (' & GS:szExeFile & ')' )
            DSS('Count_Service_Instances : *************************************' )
            _***_


            Loop

                Loc:RVBool = ISWA_Process32Next(    GLLA:Process32Next, |
                                                    Loc:SnapshotHandle, |
                                                    Address( GS:ProcessEntry32 ) )

                GLO:LastError   = ISWA_GetLastError()

                Compile('_***_',ISEQ:Debug)
                DSS('Count_Service_Instances : GLO:LastError (' & GLO:LastError & ') = ISWA_GetLastError()' )
                _***_

                IF NOT Loc:RVBool

                    GLO:LastError   = ISWA_GetLastError()

                    Compile('_***_',ISEQ:Debug)
                    DSS('Count_Service_Instances : IF NOT Loc:RVBool (' & Loc:RVBool & ')' )
                    DSS('Count_Service_Instances : Break' )
                    _***_

                    Break

                End

                Compile('_***_',ISEQ:Debug)
                DSS('Count_Service_Instances : *************************************' )
                DSS('Count_Service_Instances : GS:dwSize (' & GS:dwSize & ')' )
                DSS('Count_Service_Instances : GS:cntUsage (' & GS:cntUsage & ')' )
                DSS('Count_Service_Instances : GS:th32ProcessID (' & GS:th32ProcessID & ')' )
                DSS('Count_Service_Instances : GS:th32DefaultHeapID (' & GS:th32DefaultHeapID & ')' )
                DSS('Count_Service_Instances : GS:th32ModuleID (' & GS:th32ModuleID & ')' )
                DSS('Count_Service_Instances : GS:cntThreads (' & GS:cntThreads & ')' )
                DSS('Count_Service_Instances : GS:th32ParentProcessID (' & GS:th32ParentProcessID & ')' )
                DSS('Count_Service_Instances : GS:pcPriClassBase (' & GS:pcPriClassBase & ')' )
                DSS('Count_Service_Instances : GS:dwFlags (' & GS:dwFlags & ')' )
                DSS('Count_Service_Instances : GS:szExeFile (' & GS:szExeFile & ')' )
                DSS('Count_Service_Instances : *************************************' )
                _***_


!                Compile('_***_',ISEQ:Debug)
!                DSS('Count_Service_Instances : IF GS:th32ProcessID (' & GS:th32ProcessID & ') = GNTQ:InheritedFromUniqueProcessId (' & GNTQ:InheritedFromUniqueProcessId & ')' )
!                _***_

                CheckEXE()

            End

        End
    End



    Compile('_***_',ISEQ:Debug)
    DSS('Count_Service_Instances : End' )
    _***_
CheckEXE            Procedure()


    Code


    Compile('_***_',ISEQ:Debug)
    DSS('Count_Service_Instances : CheckEXE : IF StrPos( GS:szExeFile (' & GS:szExeFile & ') , ''^services.exe$'', True)' )
    _***_

    IF StrPos( GS:szExeFile, '^services.exe$', True)
        GSPD:SCMProcessHandle   = 0
        GSPD:SCMProcessID       = GS:th32ProcessID
        GSPD:SCMModuleFilename  = 0

        Compile('_***_',ISEQ:Debug)
        DSS('Count_Service_Instances : CheckEXE : GSPD:SCMProcessHandle (0) = 0' )
        DSS('Count_Service_Instances : CheckEXE : GSPD:SCMProcessID (' & GSPD:SCMProcessID & ') = GS:th32ProcessID (' & GS:th32ProcessID & ')' )
        DSS('Count_Service_Instances : CheckEXE : GSPD:SCMModuleFilename (0) = 0' )
        _***_

    End


    Compile('_***_',ISEQ:Debug)
    DSS('Count_Service_Instances : CheckEXE : IF StrPos( GS:szExeFile (' & GS:szExeFile & ') , ''^'' & GCL:BinaryFilename (' & GCL:BinaryFilename & ') &''$'', True)' )
    _***_

    IF StrPos(GS:szExeFile, '^' & GCL:BinaryFilename &'$', True)

        Glo:ServiceInstances += 1

        Compile('_***_',ISEQ:Debug)
        DSS('Count_Service_Instances : CheckEXE : Glo:ServiceInstances (' & Glo:ServiceInstances & ') += 1' )
        _***_

    End
