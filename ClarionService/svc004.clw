

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC004.INC'),ONCE        !Local module procedure declarations
                     END


LoadLibraryEx        PROCEDURE                             ! Declare Procedure
Loc:DLLFilename      CSTRING(1024)                         !
Loc:LoadLibrarySearchFlags LONG                            !
Loc:ReturnAddress    LONG                                  !
ISEQ:Debug      Equate(False)
    Map
LoadLibraryEx   Procedure(String pDllFilename, String pProcedureName ),Long
LoadLibraryEx   Procedure(String pDllFilename, Long pOrdinal, String pProcedureName ),Long
    End
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Start' )
    _***_
    Loc:LoadLibrarySearchFlags      =   ISEQ:LoadLibraryEx:Load_Library_Search_System32 !+ |
                                        !ISEQ:LoadLibraryEx:Load_Library_Require_Signed_Target


    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:LoadLibrarySearchFlags (' & Loc:LoadLibrarySearchFlags & ') = ISEQ:LoadLibraryEx:Load_Library_Search_System32 (' & ISEQ:LoadLibraryEx:Load_Library_Search_System32 & ')' )
    _***_

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','OpenSCManagerA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''OpenSCManagerA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:OpenSCManagerA = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','CloseServiceHandle')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''CloseServiceHandle'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:CloseServiceHandle  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','CreateServiceA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''CreateServiceA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:CreateServiceA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','OpenServiceA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''OpenServiceA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:OpenServiceA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','DeleteService')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''DeleteService'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:DeleteService  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','QueryServiceConfigA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''QueryServiceConfigA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:QueryServiceConfigA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','QueryServiceConfig2A')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''QueryServiceConfig2A'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:QueryServiceConfig2A  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','ChangeServiceConfigA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''ChangeServiceConfigA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:ChangeServiceConfigA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','ChangeServiceConfig2A')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''ChangeServiceConfig2A'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:ChangeServiceConfig2A  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','StartServiceCtrlDispatcherA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''StartServiceCtrlDispatcherA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:StartServiceCtrlDispatcherA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','RegisterServiceCtrlHandlerExA' )

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''RegisterServiceCtrlHandlerA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:RegisterServiceCtrlHandlerA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Advapi32.dll','SetServiceStatus' )

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''SetServiceStatus'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:SetServiceStatus  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetVersionExA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''GetVersionExA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetVersionExA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','ExitProcess')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Advapi32.dll'',''ExitProcess'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:ExitProcess  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetCurrentProcess')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''GetCurrentProcess'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetCurrentProcess  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','OpenProcess')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''OpenProcess'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:OpenProcess  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','WideCharToMultiByte')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''WideCharToMultiByte'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:WideCharToMultiByte  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetACP')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''GetACP'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetACP  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','lstrlenW')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''lstrlenW'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:lstrlenW  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetCurrentProcessId')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''GetCurrentProcessId'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetCurrentProcessId  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','CreateToolhelp32Snapshot')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''CreateToolhelp32Snapshot'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:CreateToolhelp32Snapshot  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','Process32First')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''Process32First'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:Process32First  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','Process32Next')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''Process32Next'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:Process32Next  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','SetEvent')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''SetEvent'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:SetEvent  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','ResetEvent')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''ResetEvent'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:ResetEvent  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetModuleHandleA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''GetModuleHandleA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetModuleHandleA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetProcAddress')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''GetProcAddress'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetProcAddress  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','CreateEventA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''CreateEventA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:CreateEventA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','CreateEventExA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''CreateEventExA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:CreateEventExA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','WaitForSingleObject')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''WaitForSingleObject'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:WaitForSingleObject  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','WaitForMultipleObjectsEx')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''WaitForMultipleObjectsEx'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:WaitForMultipleObjectsEx  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Shell32.dll','SHGetFolderPathA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Shell32.dll'',''SHGetFolderPathA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:SHGetFolderPathA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('PSapi.dll','GetModuleFileNameExA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''PSapi.dll'',''GetModuleFileNameExA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetModuleFileNameExA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('PSapi.dll','GetProcessImageFileNameA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''PSapi.dll'',''GetProcessImageFileNameA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetProcessImageFileNameA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetModuleFileNameExA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''GetModuleFileNameExA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetModuleFileNameExA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('Kernel32.dll','GetProcessImageFileNameA')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''Kernel32.dll'',''GetProcessImageFileNameA'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:GetProcessImageFileNameA  = Loc:ReturnAddress
    End

    Loc:ReturnAddress = LoadLibraryEx('ntdll.dll','NtQueryInformationProcess')

    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx(''ntdll.dll'',''NtQueryInformationProcess'')' )
    _***_


    IF Loc:ReturnAddress
        GLLA:NtQueryInformationProcess  = Loc:ReturnAddress
    End

!    Loc:ReturnAddress = LoadLibraryEx('Shell32.dll',703,'GUIDFromStringA') ! GUIDFromStringAOrdinal
!
!    Compile('_***_',ISEQ:Debug)
!    DSS('LoadLibraryEx : Loc:ReturnAddress (' & Loc:ReturnAddress & ') = LoadLibraryEx( ''Shell32.dll'',703,''GUIDFromStringA'')' )
!    _***_
!
!
!    IF Loc:ReturnAddress
!        GLLA:GUIDFromStringA = Loc:ReturnAddress
!    End
!
    Compile('_***_',ISEQ:Debug)
    DSS('LoadLibraryEx : End' )
    _***_
LoadLibraryEx   Procedure(String pDllFilename, String pProcedureName )

    Code

    GLLQ:DLLFilename         = pDllFilename
    GLLQ:LoadLibraryHandle   = ISWA_LoadLibraryExA( GLLQ:DLLFilename, 0, Loc:LoadLibrarySearchFlags )

    IF GLLQ:LoadLibraryHandle
        GLLQ:ProcedureName       = pProcedureName
        GLLQ:ProcedureAddress    = ISWA_GetProcAddress( GLLQ:LoadLibraryHandle, Address( GLLQ:ProcedureName ) )
        IF GLLQ:ProcedureAddress = 0
            GLLQ:ProcedureName       = pProcedureName
            GLLQ:ProcedureAddress    = 0
            GLLQ:Error               = ISWA_GetLastError()
        Else
            GLLQ:Error = 0
        End
    Else
        GLLQ:DLLFilename         = pDllFilename
        GLLQ:LoadLibraryHandle   = 0
        GLLQ:ProcedureName       = ''
        GLLQ:ProcedureAddress    = 0
        GLLQ:Error               = ISWA_GetLastError()
    End
    Add( GLLQ:GlobalLoadLibraryQ )

    IF GLLQ:ProcedureAddress
        Return GLLQ:ProcedureAddress
    Else
        Return 0
    End


LoadLibraryEx   Procedure(String pDllFilename, long pOrdinal, String pProcedureName )

    Code

    GLLQ:DLLFilename         = pDllFilename
    GLLQ:LoadLibraryHandle   = ISWA_LoadLibraryExA( GLLQ:DLLFilename, 0, Loc:LoadLibrarySearchFlags )

    IF GLLQ:LoadLibraryHandle
        GLLQ:ProcedureName       = pProcedureName
        GLLQ:ProcedureAddress    = ISWA_GetProcAddress( GLLQ:LoadLibraryHandle, pOrdinal )
        IF GLLQ:ProcedureAddress = 0
            GLLQ:ProcedureName       = pProcedureName
            GLLQ:ProcedureAddress    = 0
            GLLQ:Error               = ISWA_GetLastError()
        Else
            GLLQ:Error = 0
        End
    Else
        GLLQ:DLLFilename         = pDllFilename
        GLLQ:LoadLibraryHandle   = 0
        GLLQ:ProcedureName       = ''
        GLLQ:ProcedureAddress    = 0
        GLLQ:Error               = ISWA_GetLastError()
    End
    Add( GLLQ:GlobalLoadLibraryQ )

    IF GLLQ:ProcedureAddress
        Return GLLQ:ProcedureAddress
    Else
        Return 0
    End
