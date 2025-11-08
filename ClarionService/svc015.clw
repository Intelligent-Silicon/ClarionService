

   MEMBER('svc.clw')                                       ! This is a MEMBER module

                     MAP
                       INCLUDE('SVC015.INC'),ONCE        !Local module procedure declarations
                     END


CommandLineProcessor PROCEDURE                             ! Declare Procedure
ISEQ:Debug      Equate(True)
Loc:LastSlashPos    Ulong(0)
Loc:CommandLineLen  Ulong(0)
Loc:Cnt             ULong(0)
  CODE
    Compile('_***_',ISEQ:Debug)
    DSS('CommandLineProcessor : Start' )
    _***_
    GCL:CommandLine         = Command('0')
    GCL:CommandLineFlags    = Command('')
    GSCM:BinaryPathname     = GCL:CommandLine

    Compile('_***_',ISEQ:Debug)
    DSS('CommandLineProcessor : GCL:CommandLine (' & GCL:CommandLine & ') = Command(''0'')' )
    DSS('CommandLineProcessor : GCL:CommandLineFlags (' & GCL:CommandLineFlags & ') = Command('''')' )
    DSS('CommandLineProcessor : GSCM:BinaryPathname (' & GSCM:BinaryPathname & ') = GCL:CommandLine (' & GCL:CommandLine & ')' )
    _***_


    Loc:CommandLineLen      = Len( GCL:CommandLine )
    Compile('_***_',ISEQ:Debug)
    DSS('CommandLineProcessor : Loc:CommandLineLen (' & Loc:CommandLineLen & ') = Len( GCL:CommandLine )' )
    _***_


    Loop Loc:Cnt = 1 to Loc:CommandLineLen

        Compile('_***_',ISEQ:Debug)
        DSS('CommandLineProcessor : Loc:Cnt (' & Loc:Cnt & ')' )
        _***_

        IF GCL:CommandLine[ Loc:Cnt ] = '\'
            Loc:LastSlashPos = Loc:Cnt

            Compile('_***_',ISEQ:Debug)
            DSS('CommandLineProcessor : Loc:LastSlashPos (' & Loc:LastSlashPos & ') = Loc:Cnt' )
            _***_

        End
    End



    GCL:BinaryPath          = GCL:CommandLine[ 1 : Loc:LastSlashPos ]
    GCL:BinaryFilename      = GCL:CommandLine[ Loc:LastSlashPos + 1 : Loc:CommandLineLen ]

    Compile('_***_',ISEQ:Debug)
    DSS('CommandLineProcessor : GCL:BinaryPath (' & GCL:BinaryPath & ') = GCL:CommandLine[ 1 : Loc:LastSlashPos (' & Loc:LastSlashPos & ') ]' )
    DSS('CommandLineProcessor : GCL:BinaryFilename (' & GCL:BinaryFilename & ') = GCL:CommandLine[ Loc:LastSlashPos + 1 : Loc:CommandLineLen (' & Loc:CommandLineLen & ') ]' )
    _***_


    IF StrPos( GCL:CommandLineFlags, '^[\\|\/|-]install',True)
        GCL:CommandLineAction = 1

        Compile('_***_',ISEQ:Debug)
        DSS('CommandLineProcessor : GCL:CommandLineAction = 1 ! Install' )
        _***_

    End

    IF StrPos( GCL:CommandLineFlags, '^[\\|\/|-]check',True)
        GCL:CommandLineAction = 2

        Compile('_***_',ISEQ:Debug)
        DSS('CommandLineProcessor : GCL:CommandLineAction = 2 ! Check' )
        _***_

    End

    IF StrPos( GCL:CommandLineFlags, '^[\\|\/|-]delete',True)
        GCL:CommandLineAction = 3

        Compile('_***_',ISEQ:Debug)
        DSS('CommandLineProcessor : GCL:CommandLineAction = 3 ! Delete' )
        _***_

    End

    Compile('_***_',ISEQ:Debug)
    DSS('CommandLineProcessor : End' )
    _***_
