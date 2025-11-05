   PROGRAM


! ISEQ:LoadLibraryEx

ISEQ:LoadLibraryEx:Dont_Resolve_Dll_References            Equate(00000001h) !Static Imports not loaded if EXE
ISEQ:LoadLibraryEx:Load_Ignore_Code_Authz_Level           Equate(00000010h) !bypass applocker or group policy rules, use for setup programs. Must be running as TrustedInstaller or LocalSystem and is security risk!
ISEQ:LoadLibraryEx:Load_Library_As_DataFile               Equate(00000002h)
ISEQ:LoadLibraryEx:Load_Library_As_DataFile_Exclusive     Equate(00000040h)
ISEQ:LoadLibraryEx:Load_Library_As_Image_Resource         Equate(00000020h)
ISEQ:LoadLibraryEx:Load_Library_Search_Application        Equate(00000200h)
ISEQ:LoadLibraryEx:Load_Library_Search_Default_Dirs       Equate(00001000h)
ISEQ:LoadLibraryEx:Load_Library_Search_Dll_Load_Dll       Equate(00000100h)
ISEQ:LoadLibraryEx:Load_Library_Search_System32           Equate(00000800h)
ISEQ:LoadLibraryEx:Load_Library_Search_User_Dirs          Equate(00000400h)
ISEQ:LoadLibraryEx:Load_With_Altered_Search_path          Equate(00000008h) ! if used, absolute path in the filename is used and uses altered search stategy. if relative path, behaviour is "undefined"
ISEQ:LoadLibraryEx:Load_Library_Require_Signed_Target     Equate(00000080h) ! Dlls need to be signed
ISEQ:LoadLibraryEx:Load_Library_Safe_Current_Dirs         Equate(00002000h) ! use dlls in current directory, provided current directory is in the Safe load list, what ever that is!
ISEQ:SCM:NO_ERROR                       EQUATE(0)        ! Successful handling of control code
ISEQ:SetServiceStatus:ServiceType:SERVICE_KERNEL_DRIVER         Equate(00000001h) ! Driver service
ISEQ:SetServiceStatus:ServiceType:SERVICE_FILE_SYSTEM_DRIVER    Equate(00000002h) ! File system driver service
ISEQ:SetServiceStatus:ServiceType:SERVICE_ADAPTER               Equate(00000004h) ! Reserved
ISEQ:SetServiceStatus:ServiceType:SERVICE_RECOGNIZER_DRIVER     Equate(00000008h) ! Reserved
ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS     Equate(00000010h) ! Service that runs in its own process
ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_SHARE_PROCESS   Equate(00000020h) ! Service that shares a process with other services
ISEQ:SetServiceStatus:ServiceType:SERVICE_INTERACTIVE_PROCESS   Equate(00000100h) ! The service can interact with the desktop

!SERVICE_KERNEL_DRIVER            EQUATE(1)       ! SERVICE_KERNEL_DRIVER
!SERVICE_FILE_SYSTEM_DRIVER       EQUATE(2)       ! SERVICE_FILE_SYSTEM_DRIVER
!SERVICE_WIN32_OWN_PROCESS        EQUATE(16)      ! SERVICE_WIN32_OWN_PROCESS
!SERVICE_WIN32_SHARE_PROCESS      EQUATE(32)      ! SERVICE_WIN32_SHARE_PROCESS
!SERVICE_INTERACTIVE_PROCESS      EQUATE(256)     ! SERVICE_INTERACTIVE_PROCESS
ISEQ:SetServiceStatus:CurrentState:SERVICE_STOPPED          Equate(00000001h) ! Service is not running.
ISEQ:SetServiceStatus:CurrentState:SERVICE_START_PENDING    Equate(00000002h) ! Service is in the process of starting.
ISEQ:SetServiceStatus:CurrentState:SERVICE_STOP_PENDING     Equate(00000003h) ! Service is in the process of stopping.
ISEQ:SetServiceStatus:CurrentState:SERVICE_RUNNING          Equate(00000004h) ! Service is actively running.
ISEQ:SetServiceStatus:CurrentState:SERVICE_CONTINUE_PENDING Equate(00000005h) ! Service is in the process of continuing from a paused state.
ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSE_PENDING    Equate(00000006h) ! Service is in the process of pausing.
ISEQ:SetServiceStatus:CurrentState:SERVICE_PAUSED           Equate(00000007h) ! Service is currently paused.


!SERVICE_STOPPED                  EQUATE(1)       ! SERVICE_STOPPED
!SERVICE_START_PENDING            EQUATE(2)       ! SERVICE_START_PENDING
!SERVICE_STOP_PENDING             EQUATE(3)       ! SERVICE_STOP_PENDING
!SERVICE_RUNNING                  EQUATE(4)       ! SERVICE_RUNNING
!SERVICE_CONTINUE_PENDING         EQUATE(5)       ! SERVICE_CONTINUE_PENDING
!SERVICE_PAUSE_PENDING            EQUATE(6)       ! SERVICE_PAUSE_PENDING
!SERVICE_PAUSED                   EQUATE(7)       ! SERVICE_PAUSED
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_STOP                      Equate(00000001h) ! Allows the service to be stopped; enables STOP notification.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PAUSE_CONTINUE            Equate(00000002h) ! Supports pause and continue operations; enables PAUSE and CONTINUE notifications.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SHUTDOWN                  Equate(00000004h) ! Receives system shutdown notification; only system can send SHUTDOWN.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PARAMCHANGE               Equate(00000008h) ! Allows rereading of startup parameters without restart; enables PARAMCHANGE notification.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_NETBINDCHANGE             Equate(00000010h) ! Accepts binding changes without restart; enables NETBINDADD/REMOVE/ENABLE/DISABLE notifications.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_HARDWAREPROFILECHANGE     Equate(00000020h) ! Enables notification when hardware profile changes; triggers SERVICE_CONTROL_HARDWAREPROFILECHANGE.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_POWEREVENT                Equate(00000040h) ! Enables power status change notifications; triggers SERVICE_CONTROL_POWEREVENT.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_SESSIONCHANGE             Equate(00000080h) ! Enables session status change notifications; triggers SERVICE_CONTROL_SESSIONCHANGE.

! Windows Server 2003, Windows XP:  This value is not supported.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_PRESHUTDOWN               Equate(00000100h) ! Enables preshutdown task handling; only system can send PRESHUTDOWN (unsupported on XP/2003).

! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista:  This control code is not supported.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TIMECHANGE                Equate(00000200h) ! 1... Enables system time change notifications; triggers SERVICE_CONTROL_TIMECHANGE (unsupported pre-Vista).
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_TRIGGEREVENT              Equate(00000400h) ! Enables trigger event notifications; triggers SERVICE_CONTROL_TRIGGEREVENT (unsupported pre-Vista).

! Windows Server 2003, Windows XP, Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7:  This control code is not supported.
ISEQ:SetServiceStatus:ControlsAccepted:SERVICE_ACCEPT_USERMODEREBOOT            Equate(00000800h) ! Enables user-initiated reboot notifications; triggers SERVICE_CONTROL_USERMODEREBOOT (unsupported pre-Win8).




!SERVICE_ACCEPT_STOP              EQUATE(1)       ! Accepts SERVICE_CONTROL_STOP
!SERVICE_ACCEPT_PAUSE_CONTINUE   EQUATE(2)       ! Accepts SERVICE_CONTROL_PAUSE and CONTINUE
!SERVICE_ACCEPT_SHUTDOWN          EQUATE(4)       ! Accepts SERVICE_CONTROL_SHUTDOWN
!SERVICE_ACCEPT_PARAMCHANGE       EQUATE(8)       ! Accepts SERVICE_CONTROL_PARAMCHANGE
!SERVICE_ACCEPT_NETBINDCHANGE     EQUATE(16)      ! Accepts SERVICE_CONTROL_NETBINDADD/REMOVE/ENABLE/DISABLE
!SERVICE_ACCEPT_HARDWAREPROFILECHANGE EQUATE(32)  ! Accepts SERVICE_CONTROL_HARDWAREPROFILECHANGE
!SERVICE_ACCEPT_POWEREVENT        EQUATE(64)      ! Accepts SERVICE_CONTROL_POWEREVENT
!SERVICE_ACCEPT_SESSIONCHANGE     EQUATE(128)     ! Accepts SERVICE_CONTROL_SESSIONCHANGE
!SERVICE_ACCEPT_PRESHUTDOWN       EQUATE(256)     ! Accepts SERVICE_CONTROL_PRESHUTDOWN
!SERVICE_ACCEPT_TIMECHANGE        EQUATE(512)     ! Accepts SERVICE_CONTROL_TIMECHANGE
!SERVICE_ACCEPT_TRIGGEREVENT      EQUATE(1024)    ! Accepts SERVICE_CONTROL_TRIGGEREVENT
!SERVICE_ACCEPT_USER_LOGOFF       EQUATE(2048)    ! Accepts SERVICE_CONTROL_USER_LOGOFF

!
!
!SERVICE_ACCEPT_STOP            0x00000001      The service can be stopped.
!                                               This control code allows the service to receive SERVICE_CONTROL_STOP notifications.
!
!SERVICE_ACCEPT_PAUSE_CONTINUE  0x00000002      The service can be paused and continued.
!                                               This control code allows the service to receive
!                                               SERVICE_CONTROL_PAUSE and SERVICE_CONTROL_CONTINUE notifications.
!
!SERVICE_ACCEPT_SHUTDOWN        0x00000004      The service is notified when system shutdown occurs.
!                                               This control code allows the service to receive
!                                               SERVICE_CONTROL_SHUTDOWN notifications.
!                                               Note that ControlService and ControlServiceEx cannot send this notification; only the system can send it.
!
!SERVICE_ACCEPT_PARAMCHANGE     0x00000008      The service can reread its startup parameters without being stopped and restarted.
!                                               This control code allows the service to receive SERVICE_CONTROL_PARAMCHANGE notifications.
!
!SERVICE_ACCEPT_NETBINDCHANGE   0x00000010      The service is a network component that can accept changes in its binding without being stopped and restarted.
!                                               This control code allows the service to receive
!                                               SERVICE_CONTROL_NETBINDADD, SERVICE_CONTROL_NETBINDREMOVE, SERVICE_CONTROL_NETBINDENABLE,
!                                               and SERVICE_CONTROL_NETBINDDISABLE notifications.

!
!SERVICE_ACCEPT_HARDWAREPROFILECHANGE   0x00000020  The service is notified when the computer's hardware profile has changed.
!                                                   This enables the system to send SERVICE_CONTROL_HARDWAREPROFILECHANGE notifications to the service.
!
!SERVICE_ACCEPT_POWEREVENT      0x00000040      The service is notified when the computer's power status has changed.
!                                               This enables the system to send SERVICE_CONTROL_POWEREVENT notifications to the service.
!
!SERVICE_ACCEPT_SESSIONCHANGE   0x00000080      The service is notified when the computer's session status has changed.
!                                               This enables the system to send SERVICE_CONTROL_SESSIONCHANGE notifications to the service.
!
!SERVICE_ACCEPT_PRESHUTDOWN     0x00000100      The service can perform preshutdown tasks.
!                                               This control code enables the service to receive SERVICE_CONTROL_PRESHUTDOWN notifications.
!                                               Note that ControlService and ControlServiceEx cannot send this notification; only the system can send it.
!
!                                               Windows Server 2003 and Windows XP:  This value is not supported.
!
!SERVICE_ACCEPT_TIMECHANGE      0x00000200      The service is notified when the system time has changed.
!                                               This enables the system to send SERVICE_CONTROL_TIMECHANGE notifications to the service.
!
!                                               Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  This control code is not supported.
!
!SERVICE_ACCEPT_TRIGGEREVENT    0x00000400      The service is notified when an event for which the service has registered occurs.
!                                               This enables the system to send SERVICE_CONTROL_TRIGGEREVENT notifications to the service.
!
!                                               Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  This control code is not supported.
!
!SERVICE_ACCEPT_USERMODEREBOOT  0x00000800      The services is notified when the user initiates a reboot.
!
!               Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  This control code is not supported.




!SERVICE_ACCEPT_HARDWAREPROFILECHANGE
!0x00000020
!
!    The service is notified when the computer's hardware profile has changed.
!    This enables the system to send SERVICE_CONTROL_HARDWAREPROFILECHANGE notifications to the service.
!
!SERVICE_ACCEPT_POWEREVENT
!0x00000040
!
!    The service is notified when the computer's power status has changed.
!    This enables the system to send SERVICE_CONTROL_POWEREVENT notifications to the service.
!
!SERVICE_ACCEPT_SESSIONCHANGE
!0x00000080
!
!    The service is notified when the computer's session status has changed.
!    This enables the system to send SERVICE_CONTROL_SESSIONCHANGE notifications to the service.
!
!
!
!SERVICE_ACCEPT_USERMODEREBOOT
!0x00000800
!
!    The services is notified when the user initiates a reboot.
!
!Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  This control code is not supported.
!
!
!






!This control code allows the service to receive
!SERVICE_CONTROL_NETBINDADD, SERVICE_CONTROL_NETBINDREMOVE, SERVICE_CONTROL_NETBINDENABLE, and SERVICE_CONTROL_NETBINDDISABLE notifications.
!
!
!
ISEQ:SetServiceStatus:WindowsErrorExitCode:NO_ERROR                     EQUATE(0)     ! The service has not returned an error code
ISEQ:SetServiceStatus:WindowsErrorExitCode:ERROR_SERVICE_SPECIFIC_ERROR EQUATE(1066)  ! The service has returned a service-specific error code


ISEQ:SetServiceStatus:SpecificExitCode:NO_ERROR                         EQUATE(0)     ! The service has not returned an error code
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_STOP             EQUATE(1)  ! Stop the service and return NO_ERROR
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PAUSE            EQUATE(2)  ! Pause the service
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_CONTINUE         EQUATE(3)  ! Resume a paused service
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_INTERROGATE      EQUATE(4)  ! Request service status; return NO_ERROR
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_SHUTDOWN         EQUATE(5)  ! System shutdown; cleanup and stop service
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PARAMCHANGE      EQUATE(6)  ! Reread service-specific startup parameters
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDADD       EQUATE(7)  ! Bind to new network component (use Plug and Play)
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDREMOVE    EQUATE(8)  ! Unbind removed network component (use Plug and Play)
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDENABLE    EQUATE(9)  ! Add enabled network binding (use Plug and Play)
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_NETBINDDISABLE   EQUATE(10) ! Remove disabled network binding (use Plug and Play)
ISEQ:ServiceHandlerExA:SERVICE_CONTROL_PRESHUTDOWN      EQUATE(15) ! Pre-shutdown cleanup; blocks shutdown until complete
                                                                
ISEQ:ServiceHandlerExA:NO_ERROR                         Equate(0)       ! Control request handled successfully
ISEQ:ServiceHandlerExA:ERROR_ACCESS_DENIED              Equate(5)       ! Access denied (e.g., insufficient privileges)
ISEQ:ServiceHandlerExA:ERROR_INVALID_PARAMETER          Equate(87)      ! Invalid control code or context
ISEQ:ServiceHandlerExA:ERROR_CALL_NOT_IMPLEMENTED       Equate(120)     ! Control code not supported by the service
ISEQ:ServiceHandlerExA:ERROR_SERVICE_SPECIFIC_ERROR     Equate(1066)    ! Generic service-specific failure
ISEQ:SingleWaitObject:WAIT_OBJECT_0         Equate(000000000h)      ! Object is in signaled state
ISEQ:SingleWaitObject:WAIT_ABANDONED_0      Equate(000000080h)      ! Mutex was not released before owning thread terminated
ISEQ:SingleWaitObject:WAIT_TIMEOUT          Equate(000000102h)      ! Timeout elapsed; object remains nonsignaled
ISEQ:SingleWaitObject:WAIT_FAILED           Equate(0FFFFFFFFh)      ! Function failed; use GetLastError for details







!WAIT_ABANDONED      0x00000080L         The specified object is a mutex object that was not released by the thread that owned the mutex object
!                                        before the owning thread terminated.
!                                        Ownership of the mutex object is granted to the calling thread and the mutex state is set to nonsignaled.
!                                        If the mutex was protecting persistent state information, you should check it for consistency.
!
!WAIT_OBJECT_0       0x00000000L         The state of the specified object is signaled.
!
!WAIT_TIMEOUT        0x00000102L         The time-out interval elapsed, and the object's state is nonsignaled.
!
!WAIT_FAILED         (DWORD)0xFFFFFFFF   The function has failed. To get extended error information, call GetLastError.
ISEQ:MultipleWaitObject:MAXIMUM_WAIT_OBJECTS    Equate(64)          ! Maximum handles allowed in WaitForMultipleObjects[Ex]; exceeding this returns ERROR_INVALID_PARAMETER
ISEQ:MultipleWaitObject:WAIT_OBJECT_0       Equate(000000000h)      ! Return value base when wait is satisfied;
                                                                    ! ISEQ:MultipleWaitObject:WAIT_OBJECT+i gives index if bWaitAll=FALSE
ISEQ:MultipleWaitObject:WAIT_ABANDONED_0    Equate(000000080h)      ! Return value base when wait is satisfied by abandoned mutex;
                                                                    ! ISEQ:MultipleWaitObject:WAIT_OBJECT+i gives index if bWaitAll=FALSE
ISEQ:MultipleWaitObject:WAIT_IO_COMPLETION  Equate(0000000C0h)      ! Wait ended by user-mode APCs queued to the thread
ISEQ:MultipleWaitObject:WAIT_TIMEOUT        Equate(000000102h)      ! Timeout elapsed; no objects satisfied wait and no APCs queued
ISEQ:MultipleWaitObject:WAIT_FAILED         Equate(0FFFFFFFFh)      ! Function failed; call GetLastError for extended error info



!ISEQ:MultipleWaitObject:WAIT_OBJECT_1       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 1)   ! WaitObject Index 1 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_2       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 2)   ! WaitObject Index 2 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_3       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 3)   ! WaitObject Index 3 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_4       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 4)   ! WaitObject Index 4 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_5       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 5)   ! WaitObject Index 5 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_6       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 6)   ! WaitObject Index 6 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_7       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 7)   ! WaitObject Index 7 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_8       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 8)   ! WaitObject Index 8 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_9       Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 9)   ! WaitObject Index 9 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_OBJECT_10      Equate(ISEQ:MultipleWaitObject:WAIT_OBJECT_0 + 10)  ! WaitObject Index 10 / Handle signaled
!
!
!
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_1       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 1)   ! WaitObject Index 1 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_2       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 2)   ! WaitObject Index 2 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_3       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 3)   ! WaitObject Index 3 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_4       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 4)   ! WaitObject Index 4 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_5       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 5)   ! WaitObject Index 5 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_6       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 6)   ! WaitObject Index 6 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_7       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 7)   ! WaitObject Index 7 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_8       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 8)   ! WaitObject Index 8 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_9       Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 9)   ! WaitObject Index 9 / Handle signaled
!ISEQ:MultipleWaitObject:WAIT_ABANDONED_10      Equate(ISEQ:MultipleWaitObject:WAIT_ABANDONED_0 + 10)  ! WaitObject Index 10 / Handle signaled


!WAIT_OBJECT_0        EQUATE(0)          !Base for signaled object index
!WAIT_ABANDONED_0     EQUATE(80h)        !Base for abandoned mutex index
!WAIT_IO_COMPLETION   EQUATE(0C0h)       !APC or I/O completion routine triggered
!WAIT_TIMEOUT         EQUATE(102h)       !Timeout elapsed
!WAIT_FAILED          EQUATE(-1)         !Function failed; use GetLastError


! If you dont want to cont how many handles exist
! use IndexOfSignaledHandle = ReturnValue - WAIT_OBJECT_0
! This gives you the index of the handle that satisfied the wait when bWaitAll=FALSE


!WAIT_OBJECT_0 to (WAIT_OBJECT_0 + nCount - 1)   If bWaitAll is TRUE, a return value in this range indicates that the state of all specified objects
!                                                is signaled.
!
!                                                If bWaitAll is FALSE, the return value minus WAIT_OBJECT_0 indicates the lpHandles array index of
!                                                the object that satisfied the wait. If more than one object became signaled during the call,
!                                                this is the array index of the signaled object with the smallest index value of all the signaled objects.
!
!WAIT_ABANDONED_0 to (WAIT_ABANDONED_0 + nCount- 1)  If bWaitAll is TRUE, a return value in this range indicates that the state of all specified objects
!                                                    is signaled, and at least one of the objects is an abandoned mutex object.
!
!                                                    If bWaitAll is FALSE, the return value minus WAIT_ABANDONED_0 indicates the lpHandles array index
!                                                    of an abandoned mutex object that satisfied the wait. Ownership of the mutex object is granted to the calling thread, and the mutex is set to nonsignaled.
!
!                                                    If a mutex was protecting persistent state information, you should check it for consistency.
!
!WAIT_IO_COMPLETION  0x000000C0L                 The wait was ended by one or more user-mode asynchronous procedure calls (APC) queued to the thread.
!
!WAIT_TIMEOUT        0x00000102L                 The time-out interval elapsed, the conditions specified by the bWaitAll parameter were not satisfied, and no completion routines are queued.
!
!WAIT_FAILED         (DWORD)0xFFFFFFFF           The function has failed. To get extended error information, call GetLastError.
ISEQ:WaitObject:INFINITE                    Equate(0FFFFFFFFh)      ! Used with WaitForSingleObject to wait indefinitely
ISEQ:WaitObject:DELETE              Equate(00010000h)   ! Required to delete the object.
ISEQ:WaitObject:READ_CONTROL        Equate(00020000h)   !  Required to read information in the security descriptor for the object, not including the information in the SACL. To read or write the SACL, you must request the ACCESS_SYSTEM_SECURITY access right. For more information, see SACL Access Right.
ISEQ:WaitObject:SYNCHRONIZE         Equate(00100000h)   !  The right to use the object for synchronization. This enables a thread to wait until the object is in the signaled state.
ISEQ:WaitObject:WRITE_DAC           Equate(00040000h)   !  Required to modify the DACL in the security descriptor for the object.
ISEQ:WaitObject:WRITE_OWNER         Equate(00080000h)   !  Required to change the owner in the security descriptor for the object.

ISEQ:WaitObject:EVENT_ALL_ACCESS    Equate(001F0003h)   ! All possible access rights for an event object.
                                                        ! Use this right only if your application requires access beyond that granted by the standard access
                                                        ! rights and EVENT_MODIFY_STATE.
                                                        ! Using this access right increases the possibility that your application must be run by an
                                                        ! Administrator.
ISEQ:WaitObject:EVENT_MODIFY_STATE  Equate(00000002h)   ! Modify state access, which is required for the SetEvent, ResetEvent and PulseEvent functions.

ISEQ:WaitObject:CREATE_EVENT_MANUAL_RESET       Equate(00000001h)   ! The event must be manually reset using the ResetEvent function. Any number of waiting threads, or threads that subsequently begin wait operations for the specified event object, can be released while the object's state is signaled.
                                                                    ! If this flag is not specified, the system automatically resets the event after
                                                                    ! releasing a single waiting thread.
ISEQ:WaitObject:CREATE_EVENT_INITIAL_SET        Equate(00000002h)   ! The initial state of the event object is signaled; otherwise, it is nonsignaled.

ISEQ:ErrorCode:STATUS_ACCESS_VIOLATION      Equate(0C0000005h) !
ISEQ:TH32CS_SNAPHEAPLIST   EQUATE(1)          ! Includes all heaps of the process in the snapshot.
ISEQ:TH32CS_SNAPPROCESS    EQUATE(2)          ! Includes all processes in the system in the snapshot.
ISEQ:TH32CS_SNAPTHREAD     EQUATE(4)          ! Includes all threads in the system in the snapshot.
ISEQ:TH32CS_SNAPMODULE     EQUATE(8)          ! Includes all modules of the process in the snapshot.
ISEQ:TH32CS_SNAPMODULE32   EQUATE(16)         ! Includes all 32-bit modules of the process when called from a 64-bit process.
ISEQ:TH32CS_SNAPALL        EQUATE(15)         ! Includes all processes, threads, heaps, and modules in the snapshot.
ISEQ:TH32CS_INHERIT        EQUATE(2147483648) ! Indicates that the snapshot handle is to be inheritable.

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE

   MAP
     MODULE('Windows API')
SystemParametersInfo PROCEDURE (LONG uAction, LONG uParam, *? lpvParam, LONG fuWinIni),LONG,RAW,PROC,PASCAL,DLL(TRUE),NAME('SystemParametersInfoA')
     END
     MODULE('SVCBC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('SVC001.CLW')
Main                   PROCEDURE   !
     END
     MODULE('SVC003.CLW')
ServiceHandlerExA      FUNCTION( Ulong pdwControl, Ulong pdwEventType, Long plpEventData, Long plpContext ), Ulong, Pascal   !
     END
     MODULE('SVC004.CLW')
LoadLibraryEx          PROCEDURE   !
     END
     MODULE('SVC005.CLW')
Count_Service_Instances PROCEDURE   !
     END
     MODULE('SVC006.CLW')
FreeLibraryEx          PROCEDURE   !
     END
     MODULE('SVC007.CLW')
ServiceMain            FUNCTION( Ulong pdwNumServicesArgs, Long plpServiceArgVectors ), Long, Pascal   !
     END
     MODULE('SVC008.CLW')
SetServiceStatus       PROCEDURE   !
     END
     MODULE('SVC009.CLW')
SetServiceStatusServiceType PROCEDURE( < Ulong pdwServiceType > )   !
     END
     MODULE('SVC010.CLW')
SetServiceStatusControlsAccepted PROCEDURE( < Ulong pdwControlsAccepted > )   !
     END
     MODULE('SVC011.CLW')
SetServiceStatusExitCode PROCEDURE( < Ulong pdwWin32ExitCode >, < Ulong pdwServiceSpecificExitCode > )   !
     END
     MODULE('SVC012.CLW')
SetServiceStatusCurrentState PROCEDURE( Ulong pdwCurrentState, < Ulong pdwCheckPoint > , < Ulong pdwWaitHint > )   !
     END
     MODULE('SVC013.CLW')
DSS                    PROCEDURE(String pString)   !
     END
     MODULE('SVC014.CLW')
DSC                    PROCEDURE(*Cstring pCstring)   !
     END
     MODULE('SVC015.CLW')
CommandLineProcessor   PROCEDURE   !
     END
     ! ISWA = Intelligent Silicon Windows API
         INCLUDE('CWUTIL.INC'),ONCE ! For CreateDirectory()
         MODULE('')  ! For CreateDirectory Errors
         ErrNo(),*SIGNED,NAME('__errno__')   !prototype built-in error flag
         END
         Module('WinApi')    ! GetLastError
     ISWA_GetLastError(), Ulong, Pascal, Name('GetLastError')
         End
         Module('WinApi')    ! OutputDebugStringA
     ISWA_OutputDebugStringA( *Cstring ), Long, Raw, Pascal, Proc, Name('OutputDebugStringA')
         End
         Module('WinApi')    ! LoadLibrarysEx & FreeLibrarysEx
     ISWA_LoadLibraryExA( <CONST *Cstring>, Long = 0, Long ), Long, Pascal, Raw, Name( 'LoadLibraryExA' )
     ISWA_GetProcAddress( Long, Long ), Long, Raw, Pascal, Name( 'GetProcAddress' )
     ISWA_FreeLibrary( Long ), Bool, Raw, Pascal, Name( 'FreeLibrary' )
         End
         Module('WinApi')    ! String Copy
     ISWA_lstrcpyA( Long, Long), Long, Pascal, Raw, Name( 'lstrcpyA' )
     ISWA_lstrcpyA( *Cstring, *Cstring), Long, Pascal, Raw, Name( 'lstrcpyA' )
     
         End
         Module('SCLoadLibraryHack') ! This uses the SCLoadLibraryHack.clw file which must be included in the Project Includes
     
     ISWA_OpenSCManagerA( Long pProcedureAddress, Long plpMachineName, Long plpDatabaseName, Ulong pdwDesiredAccess ), Long, Proc, Name('ISWA_OpenSCManagerA')
     
     ISWA_CloseServiceHandle( Long pProcedureAddress, Long phSCObject ), Bool, Proc, Name('ISWA_CloseServiceHandle')
     
     ISWA_CreateServiceA( Long pProcedureAddress, Long phSCManager, Long plpServiceName, Long plpDisplayName, Ulong pdwDesiredAccess, Ulong pdwServiceType, Ulong pdwStartType, Ulong pdwErrorControl, Long plpBinaryPathName, Long plpLoadOrderGroup, Long plpdwTagId, Long plpDependencies, Long plpServiceStartName, Long plpPassword ), Long, Proc, Name('ISWA_CreateServiceA')
     
     ISWA_OpenServiceA( Long pProcedureAddress, Long phSCManager, Long plpServiceName, Ulong dwDesiredAccess ), Long, Proc, Name('ISWA_OpenServiceA')
     
     ISWA_DeleteService( Long pProcedureAddress, Long phService), Bool, Proc, Name('ISWA_DeleteService')
     
     ISWA_QueryServiceConfigA( Long pProcedureAddress, Long phService, Long plpServiceConfig, Ulong pcbBufSize, Long pcbBytesNeeded ), Bool, Proc, Name('ISWA_QueryServiceConfigA')
     
     ISWA_QueryServiceConfig2A( Long pProcedureAddress, Long phService, Ulong pdwInfoLevel, Long lpBuffer, Ulong pcbBufSize, Long pcbBytesNeeded ), Bool, Proc, Name('ISWA_QueryServiceConfig2A')
     
     
     ISWA_ChangeServiceConfigA(      Long pProcedureAddress, |
                                     Long phService, Ulong pdwServiceType, Ulong pdwStartType, Ulong pdwErrorControl, Long plpBinaryPathName, |
                                     Long plpLoadOrderGroup, Long plpdwTagId, Long plpDependencies, Long plpServiceStartName, Long plpPassword, |
                                     Long plpDisplayName ), Bool, Proc, Name('ISWA_ChangeServiceConfigA')
     
     
     ISWA_ChangeServiceConfig2A(     Long pProcedureAddress, |
                                     Long phService, Ulong pdwInfoLevel, Long lpInfo), Bool, Proc, Name('ISWA_ChangeServiceConfig2A')
     
     ISWA_StartServiceCtrlDispatcherA(   Long pProcedureAddress, |
                                         Long plpServiceStartTable ), Bool, Proc, Name('ISWA_StartServiceCtrlDispatcherA')
     
     ISWA_RegisterServiceCtrlHandlerA(   Long pProcedureAddress, |
                                         Long plpServiceName, Long plpHandlerProc ), Long, Proc, Name('ISWA_RegisterServiceCtrlHandlerA')
     
     ISWA_RegisterServiceCtrlHandlerExA( Long pProcedureAddress, |
                                         Long plpServiceName, Long plpHandlerProc, Long plpContext ), Long, Proc, Name('ISWA_RegisterServiceCtrlHandlerExA')
     
     ISWA_SetServiceStatus(              Long pProcedureAddress, |
                                         Long phServiceStatus, Long plpServiceStatus ), Long, Proc, Name('ISWA_SetServiceStatus')
     
     
     ISWA_OpenProcess(                   Long pProcedureAddress, |
                                         Ulong pdwDesiredAccess, Bool pbInheritHandle, Ulong pdwProcessId ), Long, Proc, Name('ISWA_OpenProcess')
     
     
     ISWA_GetVersionExA(             Long pProcedureAddress, |
                                     Long plpVersionInformation ), Bool, Proc, Name('ISWA_GetVersionExA')
     
     ISWA_ExitProcess(               Long pProcedureAddress, |
                                     Ulong puExitCode), Long, Pascal, Proc, Name('ISWA_ExitProcess')
     
     ISWA_GetModuleFileNameExA(      Long pProcedureAddress, |
                                     Long phProcess, Long phModule, Long plpFilename, Ulong nSize ), Ulong, Pascal, Proc, Name('ISWA_GetModuleFileNameExA')
     
     
     
     ISWA_SHGetFolderPathA(      Long pProcedureAddress, |
                                 Long phwnd, Long pcsidl, Long hToken, Ulong dwFlags, Long ppszPath), Long, Proc, Name('ISWA_SHGetFolderPathA')
     
     
     ISWA_NtQueryInformationProcess(     Long pProcedureAddress, |
                                         Long pProcessHandle, Long pProcessInformationClass, Long pProcessInformation, |
                                         Ulong pProcessInformationLength, Long pReturnLength), Long, Proc, Name('ISWA_NtQueryInformationProcess')
     
     ISWA_GetCurrentProcess(             Long pProcedureAddress ), Long, Proc, Name('ISWA_GetCurrentProcess')
     
     ISWA_WideCharToMultiByte(           Long pProcedureAddress, |
                                         Ulong pCodePage, Ulong pdwFlags, Long plpWideCharStr, Long pcchWideChar, |
                                         Long plpMultiByteStr, Long pcbMultiByte, Long plpDefaultChar, |
                                         Long plpUsedDefaultChar ), Long, Proc, Name('ISWA_WideCharToMultiByte')
     
     ISWA_GetACP(                        Long pProcedureAddress ), Ulong, Proc, Name('ISWA_GetACP')
     
     ISWA_lstrlenW(                      Long pProcedureAddress, |
                                         Long plpString ), Long, Proc, Name('ISWA_lstrlenW')
     
     ISWA_GetProcessImageFileNameA(      Long pProcedureAddress, |
                                         Long phProcess, Long plpImageFileName, Ulong pnSize ), Ulong, Proc, Name('ISWA_GetProcessImageFileNameA')
     
     ISWA_GetCurrentProcessId(           Long pProcedureAddress ), Ulong, Proc, Name('ISWA_GetCurrentProcessId')
     
     ISWA_CreateToolhelp32Snapshot(      Long pProcedureAddress, |
                                         Ulong pdwFlags, Ulong pth32ProcessID ), Long, Proc, Name('ISWA_CreateToolhelp32Snapshot')
     
     ISWA_Process32First(                Long pProcedureAddress, |
                                         Long phSnapshot, Long plppe ), Long, Proc, Name('ISWA_Process32First')
     
     ISWA_Process32Next(                 long pProcedureAddress, |
                                         Long phSnapshot, Long plppe ), Long, Proc, Name('ISWA_Process32Next')
     
     ISWA_CreateEventA(                  Long pProcedureAddress, |
                                         Long plpEventAttributes, Bool pbManualReset, Bool pbInitialState, Long plpName ), Long, Proc, Name('ISWA_CreateEventA')
     
     
     ISWA_CreateEventExA(                Long pProcedureAddress, |
                                         Long plpEventAttributes, Long plpName, Ulong dwFlags, Ulong dwDesiredAccess ), Long, Proc, Name('ISWA_CreateEventExA')
     
     
     ISWA_WaitForSingleObject(           Long pProcedureAddress, |
                                         Long phHandle, Ulong pdwMilliseconds ), Ulong, Proc, Name('api_WaitForSingleObject')
     
     ISWA_SetEvent(                      Long pProcedureAddress, |
                                         Long phEvent ), Bool, Proc, Name('ISWA_SetEvent')
     
     
     ISWA_ResetEvent(                    Long pProcedureAddress, |
                                         Long phEvent ), Bool, Proc, Name('ISWA_ResetEvent')
     
     
     ISWA_GetModuleHandleA(              Long pProcedureAddress, |
                                         Long plpModuleName ), Long, Proc, Name('ISWA_GetModuleHandleA')
     
     ISWA_GetProcAddress(                Long pProcedureAddress, |
                                         Long phModule, Long plpProcName ), Long, Proc, Name('ISWA_GetProcAddress')
     
     ISWA_WaitForMultipleObjectsEx(      long pProcedureAddress, |
                                         Ulong pnCount, Long plpHandles, Bool pbWaitAll, Ulong pdwMilliseconds, Bool pbAlertable ), Ulong, Proc, Name('ISWA_WaitForMultipleObjectsEx')
     
     ISWA_RegisterDeviceNotificationA(   Long pProcedureAddress, |
                                         Long phRecipient, Long pNotificationFilter, Ulong Flags ), Long, Proc, Name('ISWA_RegisterDeviceNotificationA')
     
         End
     
         Module('C60RunX')    ! AttachThreadToClarion - Initialise the Clarion Runtime when the Windows Service Control Manager (SCM) steps into ServiceMain
     ISWA_AttachThreadToClarion( Bool ), Pascal, Name('AttachThreadToClarion') ! Change this to match your version of Clarion.
         End
     
     ! For More Info
     ! https://clarion.help/doku.php?id=c_and_api_considerations.htm
     ! https://www.icetips.com/showarticle.php?articleid=529
   END

GWOE:Event:WaitObjectHandles LONG,DIM(64)
GWOE:Event:WaitObjectHandlesCnt ULONG
GWOE:Event:SERVICE_ACCEPT_STOP LONG
GWOE:Event:SERVICE_ACCEPT_PAUSE LONG
GWOE:Event:SERVICE_ACCEPT_CONTINUE LONG
GWOE:Event:SERVICE_ACCEPT_SHUTDOWN LONG
GWOE:Event:SERVICE_ACCEPT_PARAMCHANGE LONG
GWOE:Event:SERVICE_ACCEPT_NETBINDCHANGE LONG
GWOE:Event:SERVICE_ACCEPT_HARDWAREPROFILECHANGE LONG
GWOE:Event:SERVICE_ACCEPT_POWEREVENT LONG
GWOE:Event:SERVICE_ACCEPT_SESSIONCHANGE LONG
GWOE:Event:SERVICE_ACCEPT_PRESHUTDOWN LONG
GWOE:Event:SERVICE_ACCEPT_TIMECHANGE LONG
GWOE:Event:SERVICE_ACCEPT_TRIGGEREVENT LONG
GWOE:Event:SERVICE_ACCEPT_USERMODEREBOOT LONG
GWOS:RV:WaitObject:SignalEvent ULONG
GWOS:WaitObject:SERVICE_ACCEPT_STOP ULONG
GWOS:WaitObject:SERVICE_ACCEPT_PAUSE ULONG
GWOS:WaitObject:SERVICE_ACCEPT_CONTINUE ULONG
GWOS:WaitObject:SERVICE_ACCEPT_SHUTDOWN ULONG
GWOS:WaitObject:SERVICE_ACCEPT_PARAMCHANGE ULONG
GWOS:WaitObject:SERVICE_ACCEPT_NETBINDCHANGE ULONG
GWOS:WaitObject:SERVICE_ACCEPT_HARDWAREPROFILECHANGE ULONG
GWOS:WaitObject:SERVICE_ACCEPT_POWEREVENT ULONG
GWOS:WaitObject:SERVICE_ACCEPT_SESSIONCHANGE ULONG
GWOS:WaitObject:SERVICE_ACCEPT_PRESHUTDOWN ULONG
GWOS:WaitObject:SERVICE_ACCEPT_TIMECHANGE ULONG
GWOS:WaitObject:SERVICE_ACCEPT_TRIGGEREVENT ULONG
GWOS:WaitObject:SERVICE_ACCEPT_USERMODEREBOOT ULONG
GCL:CommandLine      CSTRING(1024)
GCL:CommandLineFlags CSTRING(1024)
GCL:CommandLineAction BYTE(2)
GCL:BinaryPath       CSTRING(1024)
GCL:BinaryFilename   CSTRING(1024)
GSCM:ServiceName     CSTRING('ClarionService<0>{241}')
GSCM:ProcessHandle   LONG
GSCM:Process_Main    CSTRING('_main<0>{1018}')
GSCM:Process_MainAddress LONG
GS:ProcessEntry32    GROUP,PRE(GS)
dwSize                 ULONG
cntUsage               ULONG
th32ProcessID          ULONG
th32DefaultHeapID      LONG
th32ModuleID           ULONG
cntThreads             ULONG
th32ParentProcessID    ULONG
pcPriClassBase         LONG
dwFlags                ULONG
szExeFile              CSTRING(260)
                     END
GLLA:OpenSCManagerA  LONG
GLLA:CloseServiceHandle LONG
GLLA:CreateServiceA  LONG
GLLA:OpenServiceA    LONG
GLLA:DeleteService   LONG
GLLA:QueryServiceConfigA LONG
GLLA:QueryServiceConfig2A LONG
GLLA:ChangeServiceConfigA LONG
GLLA:ChangeServiceConfig2A LONG
GLLA:StartServiceCtrlDispatcherA LONG
GLLA:RegisterServiceCtrlHandlerA LONG
GLLA:SetServiceStatus LONG
GLLA:CreateEventA    LONG
GLLA:CreateEventExA  LONG
GLLA:GetVersionExA   LONG
GLLA:ExitProcess     LONG
GLLA:OpenProcess     LONG
GLLA:GetModuleFileNameExA LONG
GLLA:SHGetFolderPathA LONG
GLLA:NtQueryInformationProcess LONG
GLLA:GetCurrentProcess LONG
GLLA:WideCharToMultiByte LONG
GLLA:GetACP          LONG
GLLA:lstrlenW        LONG
GLLA:GetProcessImageFileNameA LONG
GLLA:GetCurrentProcessId LONG
GLLA:CreateToolhelp32Snapshot LONG
GLLA:Process32First  LONG
GLLA:Process32Next   LONG
GLLA:EventKillService LONG
GLLA:SetEvent        LONG
GLLA:ResetEvent      LONG
GLLA:GetModuleHandleA LONG
GLLA:GetProcAddress  LONG
GLLA:WaitForSingleObject LONG
GLLA:WaitForMultipleObjectsEx LONG
GSCV:ServiceMode     BYTE(0)
GSCV:ServiceTableEntryA GROUP,PRE(GSCV),DIM(10)
lpServiceName          LONG(0)
lpServiceProc          LONG(0)
                     END
GSCV:ServiceCtrlHandlerHandle LONG
GLLQ:GlobalLoadLibraryQ QUEUE,PRE(GLLQ)
DLLFilename            CSTRING(1024)
LoadLibraryHandle      LONG
ProcedureName          CSTRING(1024)
ProcedureAddress       LONG
Error                  ULONG
                     END
GSS:ServiceStatus    GROUP,PRE(GSS)
dwServiceType          ULONG(ISEQ:SetServiceStatus:ServiceType:SERVICE_WIN32_OWN_PROCESS)
dwCurrentState         ULONG
dwControlsAccepted     ULONG
dwWin32ExitCode        ULONG
dwServiceSpecificExitCode ULONG
dwCheckPoint           ULONG
dwWaitHint             ULONG
                     END
GLO:RVBool           BYTE
GLO:DBmsg            CSTRING(1024)
GLO:LastError        LONG
GLO:ServiceRunning   BYTE
GLO:ServiceInstances ULONG
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'


ISEQ:DebugGlobal      Equate(True)
!ISEQ:ServiceMode    Equate(True)

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END

lCurrentFDSetting    LONG                                  ! Used by window frame dragging
lAdjFDSetting        LONG                                  ! ditto

  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('svc.INI', NVD_INI)                          ! Configure INIManager to use INI file
  DctInit
  Compile('_***_',ISEQ:DebugGlobal)
  DSS('_main : Program Setup : Start' )
  _***_
  
  CommandLineProcessor()
  LoadLibraryEx()  ! Dynamically load DLL's using SCLoadLibraryHack.clw
  Count_Service_Instances()
  Compile('_***_',ISEQ:DebugGlobal)   ! IF Glo:ServiceInstances = 1 - StartServiceCtrlDispatcherA - Only One Instance Can Run StartServiceCtrlDispatcherA
  DSS('_main : Program Setup : IF Glo:ServiceInstances (' & Glo:ServiceInstances & ') = 1' )
  _***_
  
  IF Glo:ServiceInstances = 1  ! The app needs to be running first, in order to then call the StartServiceCtrlDispatcherA api
  
      ! This isnt actually needed, but it shows how to get the address of _main because the Clarion function Address( _main ) will crash.
      ! GSCM:ProcessHandle      = ISWA_GetModuleHandleA( GLLA:GetModuleHandleA, 0 ) ! Gets the address of _main which is 04000000h
  
      GSCV:lpServiceName[1]   = Address( GSCM:ServiceName )       ! ClarionService Initial Value set in the Dct
      GSCV:lpServiceProc[1]   = Address( ServiceMain )
  
      Compile('_***_',ISEQ:DebugGlobal)
      DSS('_main : Program Setup : GSCV:lpServiceName[1] (' & GSCV:lpServiceName[1] & ')  = Address( GSCM:ServiceName (' & Address( GSCM:ServiceName ) & ') )' )
      DSS('_main : Program Setup : GSCV:lpServiceProc[1] (' & GSCV:lpServiceProc[1] & ')  = Address( ServiceMain (' & Address( ServiceMain ) & ') )' )
      _***_
  
                                    
      GSCV:lpServiceName[2]   = 0   ! This tells the Service Control Manager there are no more services in this app/exe
      GSCV:lpServiceProc[2]   = 0   ! This tells the Service Control Manager there are no more services in this app/exe
  
      Compile('_***_',ISEQ:DebugGlobal)
      DSS('_main : Program Setup : GSCV:lpServiceName[2] (' & GSCV:lpServiceName[2] & ')  = 0' )
      DSS('_main : Program Setup : GSCV:lpServiceProc[2] (' & GSCV:lpServiceProc[2] & ')  = 0' )
      _***_
  
  
  !    ! If you wanted to put two services in this exe, which is more hassle for a number of reasons,
  !    ! comment out the two lines above and uncomment the four lines below.
  !    ! You then need to create a ServiceMain for the
  !    GSCV:lpServiceName[2]   = Address( Glo:AnotherCstringHoldingTheServiceName )
  !    GSCV:lpServiceProc[2]   = Address( TheProcedureNameForThe2ndServiceMain ) ! You can use the same HandlerEx aka by using the Context param
  !
  !
  !    GSCV:lpServiceName[3]   = 0   ! This tells the Service Control Manager there are no more services in this app/exe
  !    GSCV:lpServiceProc[3]   = 0   ! This tells the Service Control Manager there are no more services in this app/exe
  
  
  
      Compile('_***_',ISEQ:DebugGlobal)
      DSS('_main : Program Setup : Glo:RVBool (' & Glo:RVBool & ') = ISWA_StartServiceCtrlDispatcherA( GLLA:StartServiceCtrlDispatcherA (' & GLLA:StartServiceCtrlDispatcherA & '), Address( GSCV:ServiceTableEntryA (' & Address( GSCV:ServiceTableEntryA ) & ') )' )
      _***_
  
  
      ! StartServiceCtrlDispatcherA This does not return a value until ServiceMain has been loaded & shutdown - See DebugView when you Start and Stop the Service
      Glo:RVBool      = ISWA_StartServiceCtrlDispatcherA( GLLA:StartServiceCtrlDispatcherA, Address( GSCV:ServiceTableEntryA ) )
      Glo:LastError   = ISWA_GetLastError() ! If there is an error with StartServiceCtrlDispatcherA, it will return an error here.
  
      Compile('_***_',ISEQ:DebugGlobal)
      DSS('_main : Program Setup : Glo:RVBool (' & Glo:RVBool & ') = ISWA_StartServiceCtrlDispatcherA( GLLA:StartServiceCtrlDispatcherA (' & GLLA:StartServiceCtrlDispatcherA & '), Address( GSCV:ServiceTableEntryA (' & Address( GSCV:ServiceTableEntryA ) & ') )' )
      DSS('_main : Program Setup : Glo:LastError (' & Glo:LastError & ') = ISWA_GetLastError()')
      DSS('_main : Program Setup : Return - Exiting the Service ')
      _***_
  
      ! Return ! At this point we can exit the program, but library's, File Managers, classes etc are not unloaded properly.
      ! This is why Main is just a source procedure that does nothing.
  End
  
  
              
  
                                                                
  Compile('_***_',ISEQ:DebugGlobal)   ! IF Glo:ServiceInstances = 2 - Do whatever here, like kill 2nd instance of the App.
  DSS('_main : Program Setup : IF Glo:ServiceInstances (' & Glo:ServiceInstances & ') = 2' )
  _***_
  
  ! This isnt going to happen but is a backup/2nd attempt to call RegisterServiceCtrlHandlerExA
  ! You could use Glo:ServiceInstances = 2  for other reasons with other code. You could kill a 2nd instance of a desktop app using this.
  IF Glo:ServiceInstances = 2 
  
      ! You can have code here to kill the app.
      ! You could wrap the MAIN procedure call in this IF statement, in order to shutdown the files and classes properly
  
  End
  Compile('_***_',ISEQ:DebugGlobal)
  DSS('_main : Program Setup : End' )
  _***_
  SystemParametersInfo (38, 0, lCurrentFDSetting, 0)       ! Configure frame dragging
  IF lCurrentFDSetting = 1
    SystemParametersInfo (37, 0, lAdjFDSetting, 3)
  END
  Main
  INIMgr.Update
  Compile('_***_',ISEQ:DebugGlobal)
  DSS('_main : Program End : Start' )
  _***_
  FreeLibraryEx()
  Compile('_***_',ISEQ:DebugGlobal)
  DSS('_main : Program End : End' )
  _***_
  IF lCurrentFDSetting = 1
    SystemParametersInfo (37, 1, lAdjFDSetting, 3)
  END
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

