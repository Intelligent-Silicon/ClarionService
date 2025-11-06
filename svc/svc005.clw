

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC005.INC'),ONCE        !Local module procedure declarations
                     END


Count_Service_Instances PROCEDURE                          ! Declare Procedure
Loc:SnapshotHandle   LONG                                  !
Loc:RVBool           BYTE                                  !
ISEQ:Debug      Equate(False)
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

        Compile('_***_',ISEQ:Debug)
        DSS('Count_Service_Instances : IF StrPos( GS:szExeFile (' & GS:szExeFile & ') , ''^'' & GCL:BinaryFilename (' & GCL:BinaryFilename & ') &''$'', True)' )
        _***_

        IF StrPos(GS:szExeFile, '^' & GCL:BinaryFilename &'$', True)

            Glo:ServiceInstances += 1

            Compile('_***_',ISEQ:Debug)
            DSS('Count_Service_Instances : Glo:ServiceInstances (' & Glo:ServiceInstances & ') += 1' )
            _***_

        End

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

                Loc:RVBool = ISWA_Process32Next( GLLA:Process32Next, |
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

                Compile('_***_',ISEQ:Debug)
                DSS('Count_Service_Instances : IF StrPos( GS:szExeFile (' & GS:szExeFile & ') , ''^'' & GCL:BinaryFilename (' & GCL:BinaryFilename & ') &''$'', True)' )
                _***_

                IF StrPos(GS:szExeFile, '^' & GCL:BinaryFilename &'$', True)

                    Glo:ServiceInstances += 1

                    Compile('_***_',ISEQ:Debug)
                    DSS('Count_Service_Instances : Glo:ServiceInstances (' & Glo:ServiceInstances & ') += 1' )

                    !DSS('Count_Service_Instances : IF StrPos( GS:szExeFile (' & GS:szExeFile & '), ''^services.exe$'', True) (' & StrPos(GS:szExeFile, '^services.exe$', True) & ')' )
                    !DSS('Count_Service_Instances : GSCV:ServiceMode (' & GSCV:ServiceMode & ') = 1' )
                    _***_

                    

                End


            End

        End
    End



!PROCESSENTRY32 STRUCT
!  dwSize              ULONG        ! Size of the structure, in bytes
!  cntUsage            ULONG        ! Number of references to this process
!  th32ProcessID       ULONG        ! Process ID
!  th32DefaultHeapID   UNSIGNED     ! Default heap ID (ULONG_PTR; use UNSIGNED for pointer-sized value)
!  th32ModuleID        ULONG        ! Module ID (not used, always zero)
!  cntThreads          ULONG        ! Number of threads in the process
!  th32ParentProcessID ULONG        ! Parent process ID
!  pcPriClassBase      LONG         ! Base priority of any threads created by this process
!  dwFlags             ULONG        ! Reserved; always zero
!  szExeFile           CSTRING(260) ! Executable filename (MAX_PATH = 260)
!END
!
!
!typedef struct tagPROCESSENTRY32 {
!  DWORD     dwSize;
!  DWORD     cntUsage;
!  DWORD     th32ProcessID;
!  ULONG_PTR th32DefaultHeapID;
!  DWORD     th32ModuleID;
!  DWORD     cntThreads;
!  DWORD     th32ParentProcessID;
!  LONG      pcPriClassBase;
!  DWORD     dwFlags;
!  CHAR      szExeFile[MAX_PATH];
!} PROCESSENTRY32;
!

!ISEQ:TH32CS_SNAPHEAPLIST   EQUATE(1)          ! Includes all heaps of the process in the snapshot.
!ISEQ:TH32CS_SNAPPROCESS    EQUATE(2)          ! Includes all processes in the system in the snapshot.
!ISEQ:TH32CS_SNAPTHREAD     EQUATE(4)          ! Includes all threads in the system in the snapshot.
!ISEQ:TH32CS_SNAPMODULE     EQUATE(8)          ! Includes all modules of the process in the snapshot.
!ISEQ:TH32CS_SNAPMODULE32   EQUATE(16)         ! Includes all 32-bit modules of the process when called from a 64-bit process.
!ISEQ:TH32CS_SNAPALL        EQUATE(15)         ! Includes all processes, threads, heaps, and modules in the snapshot.
!ISEQ:TH32CS_INHERIT        EQUATE(2147483648) ! Indicates that the snapshot handle is to be inheritable.
    Compile('_***_',ISEQ:Debug)
    DSS('Count_Service_Instances : End' )
    _***_
