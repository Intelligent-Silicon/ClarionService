  MEMBER('svc.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('SVCBC0.CLW')
SVCBC0:DctInit             PROCEDURE
SVCBC0:DctKill             PROCEDURE
SVCBC0:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  SVCBC0:DctInit
  SVCBC0:FilesInit


DctKill PROCEDURE
  CODE
  SVCBC0:DctKill

