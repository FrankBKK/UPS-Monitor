
unit uUpsMonitorMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, UTF8Process, LazFileUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus, ActnList,
  EditBtn, StdCtrls, ExtCtrls, Spin, Grids, Buttons, IniFiles,
  LCLIntf, LCLType,
  RxVersInfo,
  DataPortIP, DataPort, SynSock, BlckSock,
  cySimpleGauge,
  A3nalogGauge,
  uPoweredby, usplashabout,

  uAPCMiniView, uNUTMiniView, uAPCLogView, uNUTLogView, uAPCEventsView
  ;

type

  { TfUpsMonitorMain }

  TfUpsMonitorMain = class(TForm)
    acCheckShutdownPC: TAction;
    acNUTInfo: TAction;
    acNUTTimer: TAction;
    acNUTdpOpen: TAction;
    acNUTdpClose: TAction;
    acNUTdpData: TAction;
    acNUTTimerDataPoll: TAction;
    acNUTGenUpsStatus: TAction;
    acAPCTimer: TAction;
    acAPCdpOpen: TAction;
    acAPCdpClose: TAction;
    acAPCdpData: TAction;
    acAPCTimerDataPoll: TAction;
    acNUTUpdateStatusBar: TAction;
    acAnimateTrayIcon: TAction;
    acLogs: TAction;
    acSimStats: TAction;
    acAPCUpdateMainForm: TAction;
    acNUTUpdateMainForm: TAction;
    acNUTUpdateMiniView: TAction;
    acSwitchTabsheet: TAction;
    acRefreshAllMiniViews: TAction;
    acTrayIconDblClick: TAction;
    acTrayIconClick: TAction;
    acAPCUpdateMiniView: TAction;
    acUpdateSystemTray: TAction;
    bbShowMore: TBitBtn;
    bbShowEvenMore: TBitBtn;
    bbTestChangeTrayIcon: TBitBtn;
    bbSetViewRefresh: TBitBtn;
    btTestShowMiniView: TButton;
    btTestResetPos: TButton;
    btTestNUTConnect: TButton;
    btNUTSend: TButton;
    btNUTDisconnect: TButton;
    cbAllowManualShutdown: TCheckBox;
    cbAPCMiniView: TCheckBox;
    cbAPCUPSDactive: TCheckBox;
    cbAutoConnect: TCheckBox;
    cbCloseToTray: TCheckBox;
    cbLogOnlyErrors: TCheckBox;
    cbNUTLogMiniView: TCheckBox;
    cbNUTActive: TCheckBox;
    cbNUTAutoConnect: TCheckBox;
    cbNUTLogOnlyErrors: TCheckBox;
    cbNUTMiniView: TCheckBox;
    cbAPCEventsMiniView: TCheckBox;
    cbAPCLogMiniView: TCheckBox;
    cbNUTShutDownOnLowBatt: TCheckBox;
    cbNUTUpdateTrayIcon: TCheckBox;
    cbSavePosMiniView: TCheckBox;
    cbShutDownOnLowBatt: TCheckBox;
    cbSimOnApc: TCheckBox;
    cbSimOnNUT: TCheckBox;
    cbSimStatus: TComboBox;
    cbStartMinimized: TCheckBox;
    cbTestSendLogin: TCheckBox;
    cbUpdateTrayIcon: TCheckBox;
    cbLoadLogsOnStartup: TCheckBox;
    cbKeepMiniViewOnTop: TCheckBox;
    cyNUTBatteryCharge: TcySimpleGauge;
    cyRuntimeLeft: TcySimpleGauge;
    cyBatteryCharge: TcySimpleGauge;
    cyNUTRuntimeLeft: TcySimpleGauge;
    dpNUTTimer: TDataPortTCP;
    dpTestNUT: TDataPortTCP;
    edApcUpsDServer: TEdit;
    edNUTName: TEdit;
    edNUTPassword: TEdit;
    edNUTServer: TEdit;
    edNUTUser: TEdit;
    edSimBCharge: TEdit;
    edSimLoadPct: TEdit;
    edSimTimeLeft: TEdit;
    edTest: TEdit;
    GroupBox1: TGroupBox;
    gbSetAPC: TGroupBox;
    gbSetNUT: TGroupBox;
    gbSetApp: TGroupBox;
    gbSetMiniView: TGroupBox;
    ImageListTray: TImageList;
    imLoad: TA3nalogGauge;
    acActions: TActionList;
    acAPCInfo: TAction;
    acSettings: TAction;
    acAbout: TAction;
    acExit: TAction;
    acInitialize: TAction;
    acSaveSettings: TAction;
    acLoadSettings: TAction;
    acReadAppVersion: TAction;
    acGetUpsData: TAction;
    acTest: TAction;
    acAPCGenUpsEvents: TAction;
    acAPCGenUpsStatus: TAction;
    acAPCUpdateStatusBar: TAction;
    btTestConnection: TButton;
    dpUpsDManual: TDataPortTCP;
    dpUpsDTimer: TDataPortTCP;
    edData: TEdit;
    ImageList: TImageList;
    imgAbout: TImage;
    imNUTLoad: TA3nalogGauge;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    lbGitHubLink: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbNUTBatteryCharge: TLabel;
    lbInfo: TLabel;
    lbBatteryCharge: TLabel;
    lbRuntimeLeft: TLabel;
    lbNUTRuntimeLeft: TLabel;
    lbTitel: TLabel;
    lbVersion: TLabel;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    miLogs: TMenuItem;
    miShutdown: TMenuItem;
    MenuItem2: TMenuItem;
    miTest: TMenuItem;
    miGetData: TMenuItem;
    mmLog: TMemo;
    mmNUTLog: TMemo;
    mmTestLog: TMemo;
    N2: TMenuItem;
    miAbout: TMenuItem;
    miExit: TMenuItem;
    N1: TMenuItem;
    miInfo: TMenuItem;
    miSettings: TMenuItem;
    pnNUTRuntime: TPanel;
    pnStatus: TPanel;
    pcUpsMonitor: TPageControl;
    pmUpsMonitor: TPopupMenu;
    pnRuntime: TPanel;
    pnNUTStatus: TPanel;
    LazarusPowered: TPoweredby;
    RadioGroup2: TRadioGroup;
    rbEvents: TRadioButton;
    rbStatus: TRadioButton;
    RxVersionInfo: TRxVersionInfo;
    sbStatusBar: TStatusBar;
    seApcUpsDPort: TSpinEdit;
    seIntervalPoll: TSpinEdit;
    seNUTInterval: TSpinEdit;
    seNUTPort: TSpinEdit;
    sgEventsS: TStringGrid;
    sgStatus: TStringGrid;
    sgNUTStatus: TStringGrid;
    SplashAbout: TSplashAbout;
    tsLogs: TTabSheet;
    tiNUTDataPoll: TTimer;
    tiNUTConnect: TTimer;
    tsNUTInfo: TTabSheet;
    tiUpsDConnect: TTimer;
    TrayIcon: TTrayIcon;
    tsTest: TTabSheet;
    tiUpsDDataPoll: TTimer;
    tsInfo: TTabSheet;
    tsSettings: TTabSheet;
    tsAbout: TTabSheet;
    procedure acAnimateTrayIconExecute(Sender: TObject);
    procedure acAPCdpCloseExecute(Sender: TObject);
    procedure acAPCdpDataExecute(Sender: TObject);
    procedure acAPCdpOpenExecute(Sender: TObject);
    procedure acAPCTimerDataPollExecute(Sender: TObject);
    procedure acAPCTimerExecute(Sender: TObject);
    procedure acAPCGenUpsEventsExecute(Sender: TObject);
    procedure acAPCGenUpsStatusExecute(Sender: TObject);
    procedure acAPCUpdateMainFormExecute(Sender: TObject);
    procedure acLogsExecute(Sender: TObject);
    procedure acNUTdpCloseExecute(Sender: TObject);
    procedure acNUTdpDataExecute(Sender: TObject);
    procedure acNUTdpOpenExecute(Sender: TObject);
    procedure acNUTGenUpsStatusExecute(Sender: TObject);
    procedure acNUTInfoExecute(Sender: TObject);
    procedure acNUTTimerDataPollExecute(Sender: TObject);
    procedure acNUTTimerExecute(Sender: TObject);
    procedure acNUTUpdateMainFormExecute(Sender: TObject);
    procedure acNUTUpdateMiniViewExecute(Sender: TObject);
    procedure acNUTUpdateStatusBarExecute(Sender: TObject);
    procedure acCheckShutdownPCExecute(Sender: TObject);
    procedure acRefreshAllMiniViewsExecute(Sender: TObject);
    procedure acSimStatsExecute(Sender: TObject);
    procedure acSwitchTabsheetExecute(Sender: TObject);
    procedure acTestExecute(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acGetUpsDataExecute(Sender: TObject);
    procedure acAboutExecute(Sender: TObject);
    procedure acAPCInfoExecute(Sender: TObject);
    procedure acInitializeExecute(Sender: TObject);
    procedure acLoadSettingsExecute(Sender: TObject);
    procedure acReadAppVersionExecute(Sender: TObject);
    procedure acSaveSettingsExecute(Sender: TObject);
    procedure acSettingsExecute(Sender: TObject);
    procedure acAPCUpdateStatusBarExecute(Sender: TObject);
    procedure acTrayIconClickExecute(Sender: TObject);
    procedure acTrayIconDblClickExecute(Sender: TObject);
    procedure acUpdateAPCMiniViewExecute(Sender: TObject);
    procedure acUpdateSystemTrayExecute(Sender: TObject);
    procedure bbShowMoreClick(Sender: TObject);
    procedure bbShowEvenMoreClick(Sender: TObject);
    procedure bbTestChangeTrayIconClick(Sender: TObject);
    procedure btNUTDisconnectClick(Sender: TObject);
    procedure btNUTSendClick(Sender: TObject);
    procedure btTestNUTConnectClick(Sender: TObject);
    procedure btTestResetPosClick(Sender: TObject);
    procedure btTestConnectionClick(Sender: TObject);
    procedure dpNUTTimerError(Sender: TObject; const AMsg: string);
    procedure dpTestNUTClose(Sender: TObject);
    procedure dpTestNUTDataAppear(Sender: TObject);
    procedure dpTestNUTError(Sender: TObject; const AMsg: string);
    procedure dpTestNUTOpen(Sender: TObject);
    procedure dpUpsDManualClose(Sender: TObject);
    procedure dpUpsDManualDataAppear(Sender: TObject);
    procedure dpUpsDManualError(Sender: TObject; const AMsg: string);
    procedure dpUpsDManualOpen(Sender: TObject);
    procedure dpAPCTimerError(Sender: TObject; const AMsg: string);
    procedure edTestExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormWindowStateChange(Sender: TObject);
    procedure lbGitHubLinkClick(Sender: TObject);
    procedure lbGitHubLinkMouseEnter(Sender: TObject);
    procedure lbGitHubLinkMouseLeave(Sender: TObject);
    procedure mmLogDblClick(Sender: TObject);
    procedure mmTestLogDblClick(Sender: TObject);
    procedure seIntervalPollChange(Sender: TObject);
    procedure sgStatusDblClick(Sender: TObject);
  private

  public
    // Global Vars used in ApcUpsD communication
    gsRawData    : AnsiString ;
    gsRawStatus  : String ;
    gsRawEvents  : String ;
    giTimerStatus: Integer ;
    gsLastConnect: String ;
    gsConError   : String ;

    // Global Vars used in NUT communication
    gsNUTRawData    : AnsiString ;
    gsNUTRawStatus  : String ;
    gsNUTRawEvents  : String ;
    giNUTTimerStatus: Integer ;
    gsNUTLastConnect: String ;
    gsNUTConError   : String ;

    // Global Vars used in the StatusBar, SystemTray, MiniView etc.
    giStatusBarFontSize : Integer ;
    gsAPCMiniViewShowWhat : String ;
    gsNUTMiniViewShowWhat : String ;
    giALLFailureFlag   : Integer ;
    gsAPCFailureFlag   : String ;
    gsNUTFailureFlag   : String ;
    gbShowTestSheet    : Boolean ;

    // Global Vars used for the MiniViewForm CurrentPositions
    giAPCMiniViewTop,    giAPCMiniViewLeft: Integer ;
    giAPCLogMiniViewTop, giAPCLogMiniViewLeft: Integer ;
    giAPCEventsMiniViewTop, giAPCEventsMiniViewLeft: Integer ;
    giNUTMiniViewTop,    giNUTMiniViewLeft: Integer ;
    giNUTLogMiniViewTop, giNUTLogMiniViewLeft: Integer ;

    // Global Vars used for APCUPSD data
    gsUpsName, gsBCharge, gsTimeLeft, gsLoadPct, gsLoadWtt,
    gsStatus, gsLastEvnt, gsMaxRuntime, gsStatusText, gsNomPower : String ;

    // Global Vars used for NUT data
    gsNUTUpsName, gsNUTBCharge, gsNUTTimeLeft, gsNUTLoadPct, gsNUTLoadWtt,
    gsNUTStatus, gsNUTLastEvnt, gsNUTMaxRuntime, gsNUTStatusText, gsNUTNomPower : String ;

    // Global Vars for testing
    giTest : Integer ;
    gsTest : String ;
    gdTest : Double ;
  end;

var
  //CaseArray's for fast conversion - see PosBetween()
  gaANSIUpperArray   : array[Char] of Char;
  gaANSILowerArray   : array[Char] of Char;

function Before(const SubStr : String; const s : String; Position : Integer = 1) : String;
function After(const SubStr : String; const s : String; Position : Integer = 1) : String;
function Between(const SubStr1, SubStr2 : String; const s : String; StartPos : Integer = 1) : String;
function PosBetween(const SubStr1, SubStr2 : String; const s : String; var StartPos, EndPos : Integer; IgnoreCase : Boolean = False) : Integer;
function StrFloat(Value : Extended; aFormatStr : String = '0.00###'; Padlen : SmallInt = 0; PadChar : Char = ' ') : String;
function Pad(const s : String; PadLen : SmallInt; c : Char = ' ') : String;

const
   cMainFormHeight = 600 ;// Mainform default size
   cMainFormWidth  = 800 ;

   cMiniViewHeight    = 190 ;// MiniView default size
   cMiniViewWidth     = 160 ;
   cLogMiniViewHeight = 190 ;// Log- and Events-MiniView default size
   cLogMiniViewWidth  = 160 ;

   ctsAPCInfo      =  0 ; // TabSheet Position
   ctsNUTInfo      =  1 ; // TabSheet Position
   ctsDualView     =  -1 ;
   ctsLogs         =  2 ;
   ctsSettings     =  3 ;
   ctsAbout        =  4 ;
   ctsTest         =  5 ;
   ctsOthers       =  -1 ;

   csbUpsName      = 0 ;  // Statusbar Panel Position
   csbRuntime      = 1 ;
   csbBCharge      = 2 ;
   csbLoadPerc     = 3 ;
   csbLoadWatt     = 4 ;
   csbStatus       = 5 ;
   csbLastUpdate   = 6 ;

   ciSysTrayLogo   = 23 ; // ImageListIndex for SystemTrayIcon
   ciSysTrayWarning=  1 ;
   ciSysTrayC100   =  2 ;
   ciSysTrayC75    =  3 ;
   ciSysTrayC50    =  4 ;
   ciSysTrayC25    =  5 ;
   ciSysTrayB100   =  6 ;
   ciSysTrayB75    =  7 ;
   ciSysTrayB50    =  8 ;
   ciSysTrayB25    =  9 ;
   ciSysTrayB0     = 10 ;
   ciSysTrayError  = 11 ;

   ciMnVwSbOnline  =206 ; // ImageListIndex for MiniViewSpeedbuttonUpsStatus
   ciMnVwSbBattery =217 ;
   ciMnVwSbError   =  0 ;
   ciMnVwSbUnplug  =207 ;

   cConError       = 'ERROR' ;      // values for connection errors
   cConErrorNone   = 'OK' ;
   cConErrorSim    = 'SIMULATION' ;

   cBatChargeGreen  = 70 ;// Threshold in percent for green color gauge on battery charge (Value must be above)
   cBatChargeYellow = 25 ;// Threshold in percent for yellow color gauge on battery charge (Value must be above)

   cBatCharge75     = 75 ;// Threshold in percent for different SysTray Status Logos
   cBatCharge50     = 50 ;
   cBatCharge25     = 25 ;
   cBatCharge05     =  5 ;

   cTimeLeftGreen   = 10 ;// Threshold in minutes for green color gauge on runtime left (Value most be above)
   cTimeLeftYellow  =  5 ;// Threshold in minutes for yellow color gauge on runtime left (Value most be above)

   cTimeShutdown    =  3 ;// Remaining time in minutes when we should shutdown this computer

   cTiActive =  1 ;       // Connection APC TimerStatus - Timer is blocked from calling again
   cTiDone   =  0 ;       // Connection APC TimerStatus - Timer received all data but data not processed yet
   cTiWaiting= -1 ;       // Connection APC TimerStatus - Timer waits to be activated for new Poll

   ciTimerOnBattery = 30 ;// Timer Intervall (in seconds) when UPS is running on battery (we want to know the status then more often)

   cNUTTiActive =  1 ;    // Connection NUT TimerStatus - Timer is blocked from calling again
   cNUTTiDone   =  0 ;    // Connection NUT TimerStatus - Timer received all data but Data not processed yet
   cNUTTiWaiting= -1 ;    // Connection NUT TimerStatus - Timer waits to be activated for new Poll

   cTsLength = 26 ;       // Length of TimeStamp in APC-Event-Data
   cTsTzLen  =  6 ;       // Length of TimeZone in APC-Event-Data
   cTsBlank  =  2 ;       // Length of Space between TimeStamp and Event-Data

   cSeparator= ':' ;      // Seperator between APC-Status Name and Value in APC-Status Msgs
   cWatts   = 'Watts' ;   // Names of Units used in Status Msgs
   cVolts   = 'Volts' ;
   cMinutes = 'Minutes' ;
   cSeconds = 'Seconds' ;
   cPercent = 'Percent' ;

   cTIMELEFT= 'TIMELEFT' ;// Identifier in APC-Status Msgs needed to extract add.data
   cLOADPCT = 'LOADPCT' ;
   cBCHARGE = 'BCHARGE' ;
   cSTATUS  = 'STATUS' ;
   cNOMPOWER= 'NOMPOWER' ;
   cUPSNAME = 'UPSNAME' ;

   cStatusONLINE      = 'ONLINE' ;      // Identifier for Status msg STATUS
   cStatusONBATT      = 'ONBATT' ;
   cStatusLOWBATT     = 'LOWBATT' ;
   cStatusREPLACEBATT = 'REPLACEBATT' ;
   cStatusNOBATT      = 'NOBATT' ;
   cStatusOVERLOAD    = 'OVERLOAD' ;
   cStatusCAL         = 'CAL' ;
   cStatusTRIM        = 'TRIM' ;
   cStatusBOOST       = 'BOOST' ;
   cStatusERROR       = 'LOSTCON' ;     // we use this constant when the connection to the UPS was lost

   cNUTSeparator= '"' ;                 // Seperator between UPS-Status Name and Value in UPS-Status Msgs
   cNUTTIMELEFT= 'battery.runtime' ;    // Identifier in NUT-Status Msgs needed to extract add.data
   cNUTLOADPCT = 'ups.load' ;
   cNUTBCHARGE = 'battery.charge' ;
   cNUTSTATUS  = 'ups.status' ;
   cNUTNOMPOWER= 'ups.realpower.nominal' ;
   cNUTUPSNAME = 'ups.model' ;

   cNUTStatusONLINE      = 'OL' ;       // Identifier for NUT-Status msg
   cNUTStatusONBATT      = 'OB' ;
   cNUTStatusLOWBATT     = 'LB' ;
   cNUTStatusREPLACEBATT = 'RB' ;
   cNUTStatusNOBATT      = 'NOBATT' ;
   cNUTStatusOVERLOAD    = 'OVER' ;
   cNUTStatusCAL         = 'CAL' ;
   cNUTStatusTRIM        = 'TRIM' ;
   cNUTStatusBOOST       = 'BOOST' ;
   cNUTStatusERROR       = 'LOSTCON' ; // we use this constant when the connection to the UPS was lost

   cStatusTextONLINE      = 'On Line' ; // ClearText-Status msgs
   cStatusTextONBATT      = 'On Battery' ;
   cStatusTextLOWBATT     = 'Low Battery' ;
   cStatusTextREPLACEBATT = 'Replace Batt.' ;
   cStatusTextNOBATT      = 'No Battery' ;
   cStatusTextOVERLOAD    = 'Overload' ;
   cStatusTextCAL         = 'Calibrating' ;
   cStatusTextTRIM        = 'Trimming' ;
   cStatusTextBOOST       = 'Boosting' ;
   cStatusTextERROR       = 'Connection lost' ;

var
  fUpsMonitorMain: TfUpsMonitorMain;

implementation

{$R *.lfm}

{ TfUpsMonitorMain }


procedure TfUpsMonitorMain.acAPCInfoExecute(Sender: TObject);
// Show APC-Info Tabsheet
begin
  fUpsMonitorMain.Show;
  pcUpsMonitor.ActivePage := tsInfo ;
end;

procedure TfUpsMonitorMain.acNUTInfoExecute(Sender: TObject);
// Show NUT-Info Tabsheet
begin
  fUpsMonitorMain.Show;
  pcUpsMonitor.ActivePage := tsNUTInfo ;
end;

procedure TfUpsMonitorMain.acLogsExecute(Sender: TObject);
// Show Connection Logs Tabsheet
begin
  fUpsMonitorMain.Show;
  pcUpsMonitor.ActivePage := tsLogs ;
end;

procedure TfUpsMonitorMain.acSettingsExecute(Sender: TObject);
// Show Settings Tabsheet
begin
  acAPCUpdateStatusBar.Execute ;
  fUpsMonitorMain.Show;
  pcUpsMonitor.ActivePage := tsSettings ;
end;

procedure TfUpsMonitorMain.acAboutExecute(Sender: TObject);
// Show About Tabsheet
begin
  acAPCUpdateStatusBar.Execute ;
  fUpsMonitorMain.Show;
  pcUpsMonitor.ActivePage := tsAbout ;
end;

procedure TfUpsMonitorMain.acTestExecute(Sender: TObject);
// Show Test Tabsheet
begin
  acAPCUpdateStatusBar.Execute ;
  fUpsMonitorMain.Show;
  pcUpsMonitor.ActivePage := tsTest ;
end;

procedure TfUpsMonitorMain.acExitExecute(Sender: TObject);
begin
  // disable the timers, close the dataport
  giTimerStatus := cTiDone ;
  tiUpsDConnect.Enabled  := False ;
  tiUpsDDataPoll.Enabled := False ;

  // save the logfile
  mmLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-APC.log' );
  mmNUTLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-NUT.log' );

  // save the position of the MiniView and close it
  giAPCMiniViewTop   := fAPCMiniView.Top ;
  giAPCMiniViewLeft  := fAPCMiniView.Left ;
  fAPCMiniView.Close ;

  // Save Settings To INI file
  acSaveSettings.Execute ;

  // Exit the Application, bypass the CloseQuery, ignore CloseToSystemTray
  Application.Terminate;  ;
end;

procedure TfUpsMonitorMain.acCheckShutdownPCExecute(Sender: TObject);
// Check if a shutdown is allowed / necessary
begin
  if Sender is TAction then // Manualy called from PopUpMenuAction
  begin
    if MessageDlg('Computer will shut down now !' + #13 + #13 + 'Are you sure ? ', mtWarning, [mbOK, mbCancel],0) = mrOk then
    begin
      // Manualy shutdown this PC
      mmNUTLog.Append(DateTimeToStr(now) + ' WARNING: Local shutdown initiated manualy' ) ;
      mmNUTLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-NUT.log' );
      mmLog.Append(DateTimeToStr(now) + ' WARNING: Local Shutdown initiated manualy' ) ;
      mmLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-APC.log' );
      RunCmdFromPath('shutdown', '/s /t 0 /d u:6:12 /c "UPS-Monitor shutdown manualy"');
    end;
  end
  else // called from another procedure via acCheckShutdownPCExecute
  begin
    // Check if we have to shutdown the PC on Low Battery and Time run out
    if  (cbShutDownOnLowBatt.Checked)
    and ( (gsStatus = cStatusLOWBATT) or (gsStatus = cStatusNOBATT) )
    and (StrToFloat(gsTimeLeft) <= cTimeShutdown) then
    begin
      mmNUTLog.Append(DateTimeToStr(now) + ' WARNING: Shutdown initiated due to low battery on APC' ) ;
      mmNUTLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-NUT.log' );
      mmLog.Append(DateTimeToStr(now) + ' WARNING: Shutdown initiated due to low battery on APC' ) ;
      mmLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-APC.log' );
      if cbSimOnAPC.Checked then ShowMessage('SIMULATED SHUTDOWN due to low battery on APC')
        else RunCmdFromPath('shutdown', '/s /t 0 /d u:6:12 /c "UPS-Monitor shutdown due to low battery on APC"');
    end
    else
    if  (cbNUTShutDownOnLowBatt.Checked)
    and ( (gsNUTStatus = cNUTStatusLOWBATT) or (gsNUTStatus = cNUTStatusNOBATT) )
    and (StrToFloat(gsNUTTimeLeft) <= cTimeShutdown) then
    begin
      mmNUTLog.Append(DateTimeToStr(now) + ' WARNING: Shutdown initiated due to low battery on NUT' ) ;
      mmNUTLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-NUT.log' );
      mmLog.Append(DateTimeToStr(now) + ' WARNING: Shutdown initiated due to low battery on NUT' ) ;
      mmLog.Lines.SaveToFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-APC.log' );
      if cbSimOnNUT.Checked then ShowMessage('SIMULATED SHUTDOWN due to low battery on NUT')
        else RunCmdFromPath('shutdown', '/s /t 0 /d u:6:12 /c "UPS-Monitor shutdown due to low battery on NUT"');
    end ;
  end;
end;

procedure TfUpsMonitorMain.acRefreshAllMiniViewsExecute(Sender: TObject);
// Refresh the MiniView Forms
begin
  // save settings
  acSaveSettings.Execute ;

  // update the data
  acAPCUpdateMiniView.Execute ;
  acNUTUpdateMiniView.Execute ;

  // let forms stay on top if requested
  if cbKeepMiniViewOnTop.Checked then
  begin
    fAPCMiniView.FormStyle   := fsSystemStayOnTop ;
    fAPCLogView.FormStyle    := fsSystemStayOnTop ;
    fAPCEventsView.FormStyle := fsSystemStayOnTop ;
    fNUTMiniView.FormStyle   := fsSystemStayOnTop ;
    fNUTLogView.FormStyle    := fsSystemStayOnTop ;
  end
  else
  begin
    fAPCMiniView.FormStyle   := fsNormal ;
    fAPCLogView.FormStyle    := fsNormal ;
    fAPCEventsView.FormStyle := fsNormal ;
    fNUTMiniView.FormStyle   := fsNormal ;
    fNUTLogView.FormStyle    := fsNormal ;
  end ;

  // show/hide the forms according to settings
  if cbAPCMiniView.Checked       then fAPCMiniView.Show   else fAPCMiniView.Hide ;
  if cbAPCLogMiniView.Checked    then fAPCLogView.Show    else fAPCLogView.Hide ;
  if cbAPCEventsMiniView.Checked then fAPCEventsView.Show else fAPCEventsView.Hide ;
  if cbNUTMiniView.Checked       then fNUTMiniView.Show   else fNUTMiniView.Hide ;
  if cbNUTLogMiniView.Checked    then fNUTLogView.Show    else fNUTLogView.Hide ;
end;

procedure TfUpsMonitorMain.acInitializeExecute(Sender: TObject);
// Initialize the Application
begin
  // show a splash screen and load Version Info
  SplashAbout.ShowSplash ;
  acReadAppVersion.Execute ;

  // set some defaults
  giTest        := 0 ;   // only for Testing
  gdTest        := 0 ;   // only for Testing
  gsTest        := '' ;  // only for Testing

  gsRawData     := '' ;
  gsRawStatus   := '' ;
  gsRawEvents   := '' ;

  gsTimeLeft    := '999' ;
  gsLoadPct     := '100' ;
  gsLoadWtt     := '9999' ;
  gsBCharge     := '100' ;
  gsNomPower    := '9999' ;
  gsStatus      := 'ONLINE' ;
  gsStatusText  := 'connecting ...' ;
  gsLastEvnt    := 'connecting ...' ;
  gsLastConnect := 'connecting ...' ;
  gsAPCFailureFlag := 'OK' ;

  gsNUTRawData  := '' ;
  gsNUTRawStatus:= '' ;
  gsNUTTimeLeft    := '999' ;
  gsNUTLoadPct     := '100' ;
  gsNUTLoadWtt     := '9999' ;
  gsNUTBCharge     := '100' ;
  gsNUTNomPower    := '9999' ;
  gsNUTMaxRuntime  := '999' ;
  gsNUTStatus      := 'OL' ;
  gsNUTStatusText  := 'connecting ...' ;
  gsNUTLastEvnt    := 'connecting ...' ;
  gsNUTLastConnect := 'connecting ...' ;
  gsNUTFailureFlag := 'OK' ;

  giAllFailureFlag := 0 ;
  gsAPCMiniViewShowWhat := 'APC' ;
  gsNUTMiniViewShowWhat := 'NUT' ;

  pcUpsMonitor.ActivePage := tsInfo ;
  giStatusBarFontSize     := Round((- GetFontData(fUpsMonitorMain.Font.Handle).Height * 72 / fUpsMonitorMain.Font.PixelsPerInch)) ;

  // make sure both grids are at this exact position so we can later enlarger/shrink them properly
  sgStatus.Height := tsInfo.Height div 2 ;
  sgEventsS.Top   := tsInfo.Height div 2 ;

  // Load Settings from INI file
  acLoadSettings.Execute ;

  // Load saved Logs
  if cbLoadLogsOnStartup.Checked then
  begin
    mmLog.Lines.LoadFromFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-APC.log' );
    mmNUTLog.Lines.LoadFromFile( ExtractFileNameWithoutExt(ParamStr(0)) + '-NUT.log' );
  end;

  // check if we show the Test-Tabsheet
  if gbShowTestSheet = True then
  begin
    tsTest.TabVisible := True ;
    miTest.Visible := True ;
  end
  else
  begin
    if pcUpsMonitor.ActivePageIndex = ctsTest then pcUpsMonitor.ActivePageIndex := ctsAPCInfo ;
    tsTest.TabVisible := False ;
    miTest.Visible := False ;
  end;

  // start to connect and getData from ApcUpsD
  giTimerStatus := cTiDone ;
  if cbAPCUPSDActive.Checked then
  begin
    if (cbAutoConnect.Checked) = True then
    begin
       giTimerStatus := cTiWaiting ;
       acAPCTimerExecute(self) ;
    end ;
  end;

  // start to connect and getData from NUT
  giNUTTimerStatus := cNUTTiDone ;
  if cbAPCUPSDActive.Checked then
  begin
    if (cbNUTAutoConnect.Checked) = True then
    begin
       giNUTTimerStatus := cNUTTiWaiting ;
       acNUTTimerExecute(self) ;
    end ;
  end;

  // Start Minimized in Taskbar if requested
  if cbStartMinimized.Checked = True then
  begin
    fUpsMonitorMain.Hide ;
  end
  else
  begin
    fUpsMonitorMain.Show ;
  end;
end;

procedure TfUpsMonitorMain.acReadAppVersionExecute(Sender: TObject);
// Read Application Info from exe
begin
  RxVersionInfo.LoadFromFile(Application.ExeName);

   // Display App-Info on the Help-Sheet
  lbTitel.Caption  := RxVersionInfo.ProductName ;
  lbVersion.Caption:= RxVersionInfo.FileLongVersion;
  lbInfo.Caption   := RxVersionInfo.FileDescription ;
//  lbAuthor.Caption := RxVersionInfo.LegalCopyright ;
end;

procedure TfUpsMonitorMain.acLoadSettingsExecute(Sender: TObject);
// Load Settings from INI file
var
  appINI : TIniFile;
  sBoolVal : String ;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) ;
  try     //if no data return a default value
    sBoolVal                     := appINI.ReadString('ApcUpsD','Active', 'True') ;
    if sBoolVal = 'True' then cbAPCUPSDActive.Checked := True else cbAPCUPSDActive.Checked := False ;

    edApcUpsDServer.Caption      := appINI.ReadString('ApcUpsD','Server-IP',  '127.0.0.1') ;
    seApcUpsDPort.Value          := appINI.ReadInteger('ApcUpsD','Server-Port',3551) ;

    seIntervalPoll.Value         := appINI.ReadInteger('ApcUpsD','Polling', 5) ;
    tiUpsDConnect.Interval       := seIntervalPoll.Value * 60000 ;

    sBoolVal                     := appINI.ReadString('ApcUpsD','AutoConnect', 'True') ;
    if sBoolVal = 'True' then cbAutoConnect.Checked := True else cbAutoConnect.Checked := False ;

    sBoolVal                     := appINI.ReadString('ApcUpsD','LogOnlyErrors', 'True') ;
    if sBoolVal = 'True' then cbLogOnlyErrors.Checked := True else cbLogOnlyErrors.Checked := False ;

    sBoolVal                     := appINI.ReadString('ApcUpsD','ShutDownOnLowBatt', 'False') ;
    if sBoolVal = 'True' then cbShutDownOnLowBatt.Checked := True else cbShutDownOnLowBatt.Checked := False ;

    sBoolVal                     := appINI.ReadString('ApcUpsD','UpdateTrayIcon', 'False') ;
    if sBoolVal = 'True' then cbUpdateTrayIcon.Checked := True else cbUpdateTrayIcon.Checked := False ;


    sBoolVal                     := appINI.ReadString('NUT','Active', 'True') ;
    if sBoolVal = 'True' then cbNUTActive.Checked := True else cbNUTActive.Checked := False ;

    edNUTServer.Caption          := appINI.ReadString('NUT','Server-IP',  '127.0.0.1') ;
    seNUTPort.Value              := appINI.ReadInteger('NUT','Server-Port',3493) ;
    edNUTName.Caption            := appINI.ReadString('NUT','Name',  'asustor') ;
    edNUTUser.Caption            := appINI.ReadString('NUT','User',  'admin') ;
    edNUTPassword.Caption        := appINI.ReadString('NUT','Password',  '1111') ;

    seNUTInterval.Value          := appINI.ReadInteger('NUT','Polling', 5) ;
    tiNUTConnect.Interval        := seNUTInterval.Value * 60000 ;

    sBoolVal                     := appINI.ReadString('NUT','AutoConnect', 'True') ;
    if sBoolVal = 'True' then cbNUTAutoConnect.Checked := True else cbNUTAutoConnect.Checked := False ;

    sBoolVal                     := appINI.ReadString('NUT','LogOnlyErrors', 'True') ;
    if sBoolVal = 'True' then cbNUTLogOnlyErrors.Checked := True else cbNUTLogOnlyErrors.Checked := False ;

    sBoolVal                     := appINI.ReadString('NUT','ShutDownOnLowBatt', 'False') ;
    if sBoolVal = 'True' then cbNUTShutDownOnLowBatt.Checked := True else cbNUTShutDownOnLowBatt.Checked := False ;

    sBoolVal                     := appINI.ReadString('NUT','UpdateTrayIcon', 'False') ;
    if sBoolVal = 'True' then cbNUTUpdateTrayIcon.Checked := True else cbNUTUpdateTrayIcon.Checked := False ;


    sBoolVal                     := appINI.ReadString('Application','StartMinimized', 'True') ;
    if sBoolVal = 'True' then cbStartMinimized.Checked := True else cbStartMinimized.Checked := False ;

    sBoolVal                     := appINI.ReadString('Application','CloseToSystemTray', 'True') ;
    if sBoolVal = 'True' then cbCloseToTray.Checked := True else cbCloseToTray.Checked := False ;

    sBoolVal                     := appINI.ReadString('Application','MiniViewSavePos', 'True') ;
    if sBoolVal = 'True' then cbSavePosMiniView.Checked := True else cbSavePosMiniView.Checked := False ;

    sBoolVal                     := appINI.ReadString('Application','AllowManualShutdown', 'True') ;
    if sBoolVal = 'True' then cbAllowManualShutdown.Checked := True else cbAllowManualShutdown.Checked := False ;

    sBoolVal                     := appINI.ReadString('Application','LoadLogsOnStartup', 'True') ;
    if sBoolVal = 'True' then cbLoadLogsOnStartup.Checked := True else cbLoadLogsOnStartup.Checked := False ;

    sBoolVal                     := appINI.ReadString('Application','ShowTestSheet', 'False') ;
    if sBoolVal = 'True' then gbShowTestSheet := True else gbShowTestSheet := False ;


    sBoolVal                     := appINI.ReadString('MiniViewer','APCMiniView', 'True') ;
    if sBoolVal = 'True' then cbAPCMiniView.Checked := True else cbAPCMiniView.Checked := False ;

    sBoolVal                     := appINI.ReadString('MiniViewer','APCEventsMiniView', 'True') ;
    if sBoolVal = 'True' then cbAPCEventsMiniView.Checked := True else cbAPCEventsMiniView.Checked := False ;

    sBoolVal                     := appINI.ReadString('MiniViewer','APCLogMiniView', 'True') ;
    if sBoolVal = 'True' then cbAPCLogMiniView.Checked := True else cbAPCLogMiniView.Checked := False ;

    sBoolVal                     := appINI.ReadString('MiniViewer','NUTMiniView', 'True') ;
    if sBoolVal = 'True' then cbNUTMiniView.Checked := True else cbNUTMiniView.Checked := False ;

    sBoolVal                     := appINI.ReadString('MiniViewer','NUTLogMiniView', 'True') ;
    if sBoolVal = 'True' then cbNUTLogMiniView.Checked := True else cbNUTLogMiniView.Checked := False ;

    sBoolVal                     := appINI.ReadString('MiniViewer','NUTKeepMiniViewOnTop', 'True') ;
    if sBoolVal = 'True' then cbKeepMiniViewOnTop.Checked := True else cbKeepMiniViewOnTop.Checked := False ;

    fUpsMonitorMain.Top          := appINI.ReadInteger('Placement','Top', Top) ;
    fUpsMonitorMain.Left         := appINI.ReadInteger('Placement','Left', Left);
    fUpsMonitorMain.Width        := appINI.ReadInteger('Placement','Width', Width);
    fUpsMonitorMain.Height       := appINI.ReadInteger('Placement','Height', Height);
    pcUpsMonitor.ActivePageIndex := appINI.ReadInteger('Placement','ActivePage', ctsAPCInfo);

    giAPCMiniViewTop             := appINI.ReadInteger('PlacementAPCMiniView','Top', 100) ;
    giAPCMiniViewLeft            := appINI.ReadInteger('PlacementAPCMiniView','Left', 100);

    giAPCLogMiniViewTop          := appINI.ReadInteger('PlacementAPCLogMiniView','Top', 300) ;
    giAPCLogMiniViewLeft         := appINI.ReadInteger('PlacementAPCLogMiniView','Left', 100);

    giAPCEventsMiniViewTop       := appINI.ReadInteger('PlacementAPCEventsMiniView','Top', 100) ;
    giAPCEventsMiniViewLeft      := appINI.ReadInteger('PlacementAPCEventsMiniView','Left', 500);

    giNUTMiniViewTop             := appINI.ReadInteger('PlacementNUTMiniView','Top', 100) ;
    giNUTMiniViewLeft            := appINI.ReadInteger('PlacementNUTMiniView','Left', 260);

    giNUTLogMiniViewTop          := appINI.ReadInteger('PlacementNUTLogMiniView','Top', 300) ;
    giNUTLogMiniViewLeft         := appINI.ReadInteger('PlacementNUTLogMiniView','Left', 600);

  finally
    appINI.Free;
  end;

  // turn on/off PopUp Menu entry for manual Shutdown
  if cbAllowManualShutdown.Checked then miShutdown.Enabled := True else miShutdown.Enabled := False ;
end;

procedure TfUpsMonitorMain.acSaveSettingsExecute(Sender: TObject);
// Save Settings to INI file
var
  appINI : TIniFile;
  sBoolVal : String ;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) ;
  try
    if cbAPCUPSDActive.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'ApcUpsD','Active', sBoolVal) ;

    appINI.WriteString( 'ApcUpsD','Server-IP',   edApcUpsDServer.Caption ) ;
    appINI.WriteInteger('ApcUpsD','Server-Port', seApcUpsDPort.Value) ;
    appINI.WriteInteger('ApcUpsD','Polling',     seIntervalPoll.Value) ;

    if cbLogOnlyErrors.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'ApcUpsD','LogOnlyErrors', sBoolVal) ;

    if cbAutoConnect.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'ApcUpsD','AutoConnect', sBoolVal) ;

    if cbShutDownOnLowBatt.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'ApcUpsD','ShutDownOnLowBatt', sBoolVal) ;

    if cbUpdateTrayIcon.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'ApcUpsD','UpdateTrayIcon', sBoolVal) ;


    if cbNUTActive.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'NUT','Active', sBoolVal) ;

    appINI.WriteString( 'NUT','Server-IP',   edNUTServer.Caption ) ;
    appINI.WriteInteger('NUT','Server-Port', seNUTPort.Value) ;
    appINI.WriteInteger('NUT','Polling',     seNUTInterval.Value) ;
    appINI.WriteString( 'NUT','Name',        edNUTName.Caption ) ;
    appINI.WriteString( 'NUT','User',        edNUTUser.Caption ) ;
    appINI.WriteString( 'NUT','Password',    edNUTPassword.Caption ) ;

    if cbNUTLogOnlyErrors.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'NUT','LogOnlyErrors', sBoolVal) ;

    if cbNUTAutoConnect.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'NUT','AutoConnect', sBoolVal) ;

    if cbNUTShutDownOnLowBatt.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'NUT','ShutDownOnLowBatt', sBoolVal) ;

    if cbNUTUpdateTrayIcon.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'NUT','UpdateTrayIcon', sBoolVal) ;


    if cbStartMinimized.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'Application','StartMinimized', sBoolVal) ;

    if cbCloseToTray.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'Application','CloseToSystemTray', sBoolVal) ;

    if cbSavePosMiniView.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'Application','MiniViewSavePos', sBoolVal) ;

    if cbAllowManualShutdown.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'Application','AllowManualShutdown', sBoolVal) ;

    if cbLoadLogsOnStartup.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'Application','LoadLogsOnStartup', sBoolVal) ;


    if cbAPCMiniView.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'MiniViewer','APCMiniView', sBoolVal) ;

    if cbAPCEventsMiniView.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'MiniViewer','APCEventsMiniView', sBoolVal) ;

    if cbAPCLogMiniView.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'MiniViewer','APCLogMiniView', sBoolVal) ;

    if cbNUTMiniView.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'MiniViewer','NUTMiniView', sBoolVal) ;

    if cbNUTLogMiniView.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'MiniViewer','NUTLogMiniView', sBoolVal) ;

    if cbKeepMiniViewOnTop.Checked then sBoolVal := 'True' else sBoolVal := 'False';
    appIni.WriteString( 'MiniViewer','NUTKeepMiniViewOnTop', sBoolVal) ;

    appINI.WriteInteger('Placement','Top',       fUpsMonitorMain.Top) ;
    appINI.WriteInteger('Placement','Left',      fUpsMonitorMain.Left) ;
    appINI.WriteInteger('Placement','Width',     fUpsMonitorMain.Width) ;
    appINI.WriteInteger('Placement','Height',    fUpsMonitorMain.Height) ;
    appINI.WriteInteger('Placement','ActivePage',pcUpsMonitor.ActivePageIndex);

    appINI.WriteInteger('PlacementAPCMiniView','Top',   giAPCMiniViewTop) ;
    appINI.WriteInteger('PlacementAPCMiniView','Left',  giAPCMiniViewLeft) ;

    appINI.WriteInteger('PlacementAPCLogMiniView','Top',   giAPCLogMiniViewTop) ;
    appINI.WriteInteger('PlacementAPCLogMiniView','Left',  giAPCLogMiniViewLeft) ;

    appINI.WriteInteger('PlacementAPCEventsMiniView','Top',   giAPCEventsMiniViewTop) ;
    appINI.WriteInteger('PlacementAPCEventsMiniView','Left',  giAPCEventsMiniViewLeft) ;

    appINI.WriteInteger('PlacementNUTMiniView','Top',   giNUTMiniViewTop) ;
    appINI.WriteInteger('PlacementNUTMiniView','Left',  giNUTMiniViewLeft) ;

    appINI.WriteInteger('PlacementNUTLogMiniView','Top',   giNUTLogMiniViewTop) ;
    appINI.WriteInteger('PlacementNUTLogMiniView','Left',  giNUTLogMiniViewLeft) ;
  finally
    appIni.Free;
  end;

  if cbAllowManualShutdown.Checked then miShutdown.Enabled := True else miShutdown.Enabled := False ;
end;

procedure TfUpsMonitorMain.acAPCTimerExecute(Sender: TObject);
// call the routine that initiates the Polling Routine to get UPS data
begin
  if (giTimerStatus = cTiWaiting) then
  begin;
    if (not cbLogOnlyErrors.Checked) then
      mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - started by timer' ) ;

    // clear the var that holds the incoming data
    gsRawData := '' ;

    // make sure the DataPort is ready, set server-ip and -port, open the dataport
    if dpUpsDTimer.Active then dpUpsDTimer.Close();
    dpUpsDTimer.RemoteHost:= edApcUpsDServer.Caption;
    dpUpsDTimer.RemotePort:= IntToStr(seApcUpsDPort.Value);
    dpUpsDTimer.Active := True ;
    dpUpsDTimer.Open();

    // the incoming data will now be read via the tiUpsDDataPollTimer Routine
    // which must be activated in the DataPortOpen Routine
  end;
end;

procedure TfUpsMonitorMain.acAPCdpOpenExecute(Sender: TObject);
// once the dataport is open, turn on the poll-timer and send the first msg request
begin
  giTimerStatus := cTiActive ;
  tiUpsDDataPoll.Interval:= 1000 ;
  tiUpsDDataPoll.Enabled := True ;
  // wait for UPS-Status Messages
  dpUpsDTimer.Push(#00+#06+'status');  // send msg.length + msg: 'status'
  if (not cbLogOnlyErrors.Checked) then
    mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - connection established' ) ;
end;

procedure TfUpsMonitorMain.acAPCdpDataExecute(Sender: TObject);
// on receiving data we add it to a global var
begin
  giTimerStatus := cTiActive ;
  gsRawData := gsRawData + dpUpsDTimer.Pull() ;
  if (not cbLogOnlyErrors.Checked) then
    mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - data receiving' ) ;
end;

procedure TfUpsMonitorMain.acAPCTimerDataPollExecute(Sender: TObject);
// here we poll the data from APC
var
  s : String ;
  i : Integer ;
begin
  if (not cbLogOnlyErrors.Checked) then
    mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - data checking ' ) ;

  // disable the timer during timer-runtime first, so it does not call again while executing
  tiUpsDDataPoll.Enabled := False ;

  // check if all msgs are received (#00#00 is EOF)
  if Pos(#00#00, gsRawData) > 0 then
  begin
    // remember when exactly we received the msg.
    gsLastConnect := DateTimeToStr(now) ;
    // check if it is a status msg or an events msg
    if Pos('END APC', gsRawData) > 0 then  //UPS-Status Messages
    begin
      // copy data and clear buffer for next receive
      gsRawStatus := gsRawData ;
      gsRawData   := '' ;
      gsConError  := cConErrorNone ;
      // now request event data msg
      dpUpsDTimer.Push(#00+#06+'events');  // send msg.length + msg: 'events'
      if (not cbLogOnlyErrors.Checked) then
        mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - received status msg' ) ;
    end
    else  // UPS-Events Messages
    begin
      // copy data and clear buffer for next receive
      gsRawEvents := gsRawData ;
      gsRawData   := '' ;
      gsConError  := cConErrorNone ;
      // extract Status and Events and update the StatusBar
      acAPCGenUpsStatusExecute(self) ;
      acAPCGenUpsEventsExecute(self) ;
      if tsNUTInfo.Visible then acAPCUpdateStatusBarExecute(self) ;
      // all msgs received - we can disconnect
      if (not cbLogOnlyErrors.Checked) then
        mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - received events msg' ) ;
      giTimerStatus := cTiDone ;
    end ;
  end
  else
  begin
    // msg is incomplete - we extract what we got so far and log that
    s := '' ;
    for i := 1 to Length(gsRawData) do
    begin
      s := s + IntToStr(Ord(gsRawData[i])) + '-' ;
    end;
    edData.Text := s ;
    gsConError  := cConError ;
    gsLastConnect := DateTimeToStr(now) ;
    mmLog.Append(DateTimeToStr(now) + ' ERROR: TimerConnect APC - received only part of msg: ' + s ) ;
  end;

  // we got all data - disconnect dataport and stop the timer
  if giTimerStatus = cTiDone then
  begin
    dpUpsDTimer.Close ;
    tiUpsDDataPoll.Enabled := False ;
    if (not cbLogOnlyErrors.Checked) then
      mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - ended by timer' )
    else  ;
//      mmLog.Append(DateTimeToStr(now) + ' OK: APC - Status updated' );
  end
  else
  begin
    // after routine is done we enable the timer again
    tiUpsDDataPoll.Enabled := True ;
  end;
end;

procedure TfUpsMonitorMain.acAPCdpCloseExecute(Sender: TObject);
// all data received - connection is closed and ready for re-connect
begin
  giTimerStatus := cTiWaiting ;
  // disable the Polltimer until we open next connection
  tiUpsDDataPoll.Enabled := False ;
  if (not cbLogOnlyErrors.Checked) then
    mmLog.Append(DateTimeToStr(now) + ' TimerConnect APC - closing' ) ;
end;

procedure TfUpsMonitorMain.acAPCGenUpsStatusExecute(Sender: TObject);
// Extract the UPS Status Data from the raw data received
var
  i : LongInt ;
  iBegin, iLength : Integer ;
  sLine, sName, sValue, sUnit : String ;
begin
  // check if we use simulated values from the settings page instead
  acSimStats.Execute;

  // check first if the connection was lost
  if (gsConError = cConError) or (gsConError = cConErrorSim) then
  begin
    gsTimeLeft   := '0' ;
    gsLoadPct    := '0' ;
    gsBCharge    := '0' ;
    gsStatus     := cStatusERROR ;
    gsStatusText := cStatusTextError ;
    gsMaxRuntime := '99' ;
    gsLoadWtt    := '0' ;
    gsRawStatus  := '' ;

    // update the MainForm Elements
    acAPCUpdateMainFormExecute(self) ;

    // update the Mini-Viewer Elements
    acUpdateAPCMiniViewExecute(self) ;

    // update the System-TrayIcon Hint-Text and Icon
    acUpdateSystemTrayExecute(self) ;

    // update the Log file
    mmLog.Append(DateTimeToStr(now) + ' ' + gsConError + ': connection to APC lost' ) ;
  end;

  // manualy assign the parent control for Cindy Components, otherwise the Tabsheets are dissapearing
  cyBatteryCharge.Parent := tsInfo ;
  cyRuntimeLeft.Parent   := tsInfo ;

  // Process the ApcUpsD Status data received via Timer
  if gsRawStatus > '' then
  begin
    // empty the Status StringGrid
    sgStatus.Clean([gzNormal, gzFixedRows]);
    sgStatus.RowCount := 1 ;
    sgStatus.InsertRowWithValues(sgStatus.RowCount,['Last Update: ', gsLastConnect, '']) ;

    // start extracting from the first char after the 2-Byte Length-Info
    iBegin := 3 ;

    // go through the whole data-string, char by char
    for i := 1 to Length(gsRawStatus) do
    begin
      // we found a linefeed -> a msg ends there
      if gsRawStatus[i] = #10 then
      begin
        // we extract that line
        iLength := i - iBegin ;
        sLine := Copy(gsRawStatus,iBegin,iLength) ;

        // separate Status-Name, Value and Unit (if any)
        sName  := Trim( Before(cSeparator,sLine) ) ;

        if Pos(cWatts, After(cSeparator, sLine)) > 0 then
        begin
          sValue := Trim( Before(cWatts, After(cSeparator, sLine) ) ) ;
          sUnit  := cWatts ;
        end
        else if Pos(cVolts, After(cSeparator, sLine)) > 0 then
        begin
          sValue := Trim( Before(cVolts, After(cSeparator, sLine) ) ) ;
          sUnit  := cVolts ;
        end
        else if Pos(cMinutes, After(cSeparator, sLine)) > 0 then
        begin
          sValue := Trim( Before(cMinutes, After(cSeparator, sLine) ) ) ;
          sUnit  := cMinutes ;
        end
        else if Pos(cSeconds, After(cSeparator, sLine)) > 0 then
        begin
          sValue := Trim( Before(cSeconds, After(cSeparator, sLine) ) ) ;
          sUnit  := cSeconds ;
        end
        else if Pos(cPercent, After(cSeparator, sLine)) > 0 then
        begin
          sValue := Trim( Before(cPercent, After(cSeparator, sLine) ) ) ;
          sUnit  := cPercent ;
        end
        else
        begin
          sValue := Trim( After(cSeparator, sLine) ) ;
          sUnit  := '' ;
        end;

        // copy data we frequently need e.g. in the StatusBar to global Vars
        if sName = cTIMELEFT then gsTimeLeft := sValue ;
        if sName = cLOADPCT  then gsLoadPct  := sValue ;
        if sName = cBCHARGE  then gsBCharge  := sValue ;
        if sName = cSTATUS   then gsStatus   := sValue ;
        if sName = cNOMPOWER then gsNomPower := sValue ;
        if sName = cUPSNAME  then gsUpsName  := sValue ;

        // add the UPS-Status info to the grid
        sgStatus.InsertRowWithValues(sgStatus.RowCount,[sName, sValue, sUnit]) ;

        // set the begin of the next msg line - we ignore the first two chars
        // as they contain only the length of the next msg as byte values
        // which contain control codes - we don't want them in our text
        iBegin := i + 3 ;
      end;
    end;

    // check if we have to use simulated values from the settings page instead
    acSimStats.Execute ;

    // update clear-text Status
    if      gsStatus = cStatusONLINE      then gsStatusText := cStatusTextONLINE
    else if gsStatus = cStatusONBATT      then gsStatusText := cStatusTextONBATT
    else if gsStatus = cStatusLOWBATT     then gsStatusText := cStatusTextLOWBATT
    else if gsStatus = cStatusREPLACEBATT then gsStatusText := cStatusTextREPLACEBATT
    else if gsStatus = cStatusNOBATT      then gsStatusText := cStatusTextNOBATT
    else if gsStatus = cStatusOVERLOAD    then gsStatusText := cStatusTextOVERLOAD
    else if gsStatus = cStatusCAL         then gsStatusText := cStatusTextCAL
    else if gsStatus = cStatusTRIM        then gsStatusText := cStatusTextTRIM
    else if gsStatus = cStatusBOOST       then gsStatusText := cStatusTextBOOST
    else gsStatusText := 'Unknown: ' + gsStatus ;

    // update the Log file
    if (gsStatus <> cStatusONLINE) then
    begin
      if gsAPCFailureFlag <> gsStatus then mmLog.Append(DateTimeToStr(now) + ' Warning: ' + gsStatusText ) ;
      gsAPCFailureFlag := gsStatus ;
    end
    else if gsAPCFailureFlag <> 'OK' then
    begin
      mmLog.Append(DateTimeToStr(now) + ' OK: Power restored' ) ;
      gsAPCFailureFlag := 'OK' ;
    end;

    // calculate the LoadWatt (current power load in Watt)
    try
      if (gsNomPower = '') then gsNomPower := '0' ; //avoid FloatError
      gsLoadWtt := StrFloat( StrToFloat(gsNomPower) * StrToFloat(gsLoadPct) / 100 , '0'  ) ;
      if (gsLoadWtt <> '0') then sgStatus.InsertRowWithValues(sgStatus.RowCount,['LOADWATT', gsLoadWtt, 'Watt']) ;
    except
      gsLoadWtt := '999' ;
    end;

    // Calculate the MaxRuntime (runtime left when UPS is on battery)
    try
      gsMaxRuntime := StrFloat( StrToFloat(gsTimeLeft) / StrToFloat(gsBCharge) * 100 , '0'  ) ;
    except
      gsMaxRuntime := '999' ;
    end;

    // update the MainForm Elements
    acAPCUpdateMainFormExecute(self) ;

    // update the Mini-Viewer Elements
    acUpdateAPCMiniViewExecute(self) ;

    // update the System-TrayIcon Hint-Text and Icon
    acUpdateSystemTrayExecute(self) ;

    // Check if we have to shutdown the PC on Low Battery and Time run out
    acCheckShutdownPCExecute(self) ;

    // decrease the timer intervall while the UPS is running on battery
    if (gsStatus = cStatusONBATT) or (gsStatus = cStatusLOWBATT) or (gsStatus = cStatusNOBATT) then
      tiUpsDConnect.Interval := ciTimerOnBattery * 1000
    else
      tiUpsDConnect.Interval := seIntervalPoll.Value * 60000 ;
  end;
end;

procedure TfUpsMonitorMain.acAnimateTrayIconExecute(Sender: TObject);
// quickly show all available Tray Icons
var i : Integer ;
begin
  for i := 0 to ImageListTray.Count-1 do
  begin
    ImageListTray.GetIcon(i, TrayIcon.Icon);
    Sleep(300) ;
  end;
  TrayIcon.Icon := Application.Icon ; ;
end;

procedure TfUpsMonitorMain.FormCloseQuery(Sender: TObject; var CanClose: boolean
  );
// check if we end the app or close to systemtray
begin
  if cbCloseToTray.Checked = True then
  begin
     fUpsMonitorMain.Hide;
     fUpsMonitorMain.ShowInTaskBar := stNever;
     CanClose := False ;
  end
  else
  begin
    CanClose := True ;
    acExit.Execute;
  end;
end;

procedure TfUpsMonitorMain.FormWindowStateChange(Sender: TObject);
// show/hide the app from/to the systemtray
begin
  if fUpsMonitorMain.WindowState = wsMinimized then
  begin
    fUpsMonitorMain.Hide;
    fUpsMonitorMain.ShowInTaskBar := stNever;
  end
  else
  begin
    fUpsMonitorMain.ShowInTaskBar := stDefault;
    fUpsMonitorMain.BringToFront;
    fUpsMonitorMain.Show;
  end;
end;

procedure TfUpsMonitorMain.lbGitHubLinkClick(Sender: TObject);
// Open Link in Browser
begin
  OpenURL('https://github.com/FrankBKK/UPS-Monitor') ;
end;

procedure TfUpsMonitorMain.lbGitHubLinkMouseEnter(Sender: TObject);
// change Mouse Cursor when over HyperLink
begin
  Screen.Cursor := crHandPoint ;
end;

procedure TfUpsMonitorMain.lbGitHubLinkMouseLeave(Sender: TObject);
// change Mouse Cursor to Default
begin
  Screen.Cursor := crDefault ;
end;

procedure TfUpsMonitorMain.mmLogDblClick(Sender: TObject);
// delete logbook entries on DBL-Click
begin
  if MessageDlg('Delete all Logbook Entries ? ', mtConfirmation, [mbOK, mbCancel],0) = mrOk then
  begin
    if Sender = mmLog    then
    begin
      mmLog.Text := '' ;
      fAPCLogView.mmLog.Text := mmLog.Text ;
    end ;
    if Sender = mmNUTLog then
    begin
      mmNUTLog.Text := '' ;
      fNUTLogView.mmNUTLog.Text := mmNUTLog.Text ;
    end;
  end;
end;

procedure TfUpsMonitorMain.dpAPCTimerError(Sender: TObject; const AMsg: string);
// on connection errors we log it
begin
  mmLog.Append(DateTimeToStr(now) + ' ERROR: TimerConnect APC - ' + AMsg );
  dpUpsDTimer.Close() ;

  // set the global error flag
  gsConError := cConError ;
end;

procedure TfUpsMonitorMain.acAPCGenUpsEventsExecute(Sender: TObject);
// Extract the UPS Events Data from the raw data received
var
  i : LongInt ;
  iBegin, iLength : Integer ;
  sLine, sTimeStamp, sEvent : String ;
begin
  if gsRawEvents > '' then
  begin
    // empty the Events StringGrid
    sgEventsS.Clean([gzNormal, gzFixedRows]);
    sgEventsS.RowCount := 1 ;

    // start extracting from the first char
    iBegin := 3 ;

    // go through the whole string, char by char
    for i := 1 to Length(gsRawEvents) do
    begin
      // we found a linefeed -> a msg ends here
      if gsRawEvents[i] = #10 then
      begin
        // we extract that line
        iLength := i - iBegin ;
        sLine := Copy(gsRawEvents,iBegin,iLength) ;

        // separate Timestamp and Event-Text
        sTimeStamp := Copy(sLine, 1, cTsLength ) ;
        sEvent     := Copy(sLine, cTsLength + cTsBlank ) ;

        // add Timestamp and Event to the grid
        sgEventsS.InsertRowWithValues(1,[sTimeStamp, sEvent]) ; // show newest entries first

        // set the begin of the next msg line - we ignore the first two chars
        // as they contain only the length of the next msg as byte values
        // which contain control codes - we don't want them in our text
        iBegin := i + 3 ;
      end;
    end;

    // write the latest event in a global var we can use elsewhere
    gsLastEvnt := Copy(sTimeStamp,1,cTsLength - cTsTzLen) + ' ' + sEvent ;

    // add a line with the timestamp of the latest update and move cursor to that line
    sgEventsS.InsertRowWithValues(1,['Last Update:', gsLastConnect, '']) ;
    sgEventsS.Row := 1 ;
    sgEventsS.ColCount := 2 ;

    // update the Mini-Viewer Elements
    acUpdateAPCMiniViewExecute(self) ;
  end;
end;

procedure TfUpsMonitorMain.acAPCUpdateStatusBarExecute(Sender: TObject);
// update the status bar with APC data
var
  i : Integer ;
begin
  sbStatusBar.Panels[csbUpsName].Text    := 'APC' ;
  sbStatusBar.Panels[csbRuntime].Text    := 'Battery: ' + gsBCharge  + ' % / ' + gsTimeLeft + ' Min.left' ;
  sbStatusBar.Panels[csbBCharge].Text    := '' ;
  sbStatusBar.Panels[csbLoadPerc].Text   := 'Load: '       + gsLoadPct  + ' % / ' + gsLoadWtt  + ' Watt';
  sbStatusBar.Panels[csbLoadWatt].Text   := '';
  sbStatusBar.Panels[csbStatus].Text     := 'Status: '     + gsStatusText ;
  sbStatusBar.Panels[csbLastUpdate].Text := 'Last Update: '+ gsLastConnect ;

  // match text length and panel width
  for i := 0 to sbStatusBar.Panels.Count - 1 do
    sbStatusBar.Panels[i].Width := sbStatusBar.Canvas.TextWidth( sbStatusBar.Panels[i].Text ) + 8;

  // update the form
//  fUpsMonitorMain.Refresh; ;
end;

procedure TfUpsMonitorMain.acAPCUpdateMainFormExecute(Sender: TObject);
// update MainForm APC-InfoSheet
begin
  // update the Load-Gauges on the Info- and Events-TabSheets
  imLoad.ScaleMax    := 100 ;
  imLoad.Position    := StrToFloat(gsLoadPct) ;
  imLoad.Caption     := 'Load: ' + gsLoadPct + ' % - ' + gsLoadWtt + '/' + gsNomPower + ' Watt';

  // update the BatteryCharge-Gauges on the Info- and Events-TabSheets
  // change the Bar-Color depending on the battery charge
  if (StrToFloat(gsBCharge) >= cBatChargeGreen) then  // blue(ish) color on full battery
  begin
    cyBatteryCharge.ItemOnPen.Color  := $00FF8000;
  end
  else if (StrToFloat(gsBCharge) >= cBatChargeYellow) then // yellow Bar on medium charged battery
  begin
    cyBatteryCharge.ItemOnPen.Color  := clYellow ;
  end
  else
  begin                                         // otherwise (low charge) red color bar
    cyBatteryCharge.ItemOnPen.Color  := clRed ;
  end ;
  // update the Battery Bar-Graph on the TabSheets
  cyBatteryCharge.Position  := StrToFloat(gsBCharge) ;

  // update the RuntimeLeft-Gauges on the TabSheets
  // different colors depending on the remaining runtime
  if (StrToFloat(gsTimeLeft) >= cTimeLeftGreen)       then
  begin
    cyRuntimeLeft.ItemOnPen.Color  := clLime ;
  end
  else if (StrToFloat(gsTimeLeft) >= cTimeLeftYellow) then
  begin
    cyRuntimeLeft.ItemOnPen.Color  := clYellow ;
  end
  else
  begin
    cyRuntimeLeft.ItemOnPen.Color  := clRed ;
  end ;
  // update the bar-graphs
  cyRuntimeLeft.Max       := StrToFloat(gsMaxRuntime) ;
  cyRuntimeLeft.Position  := StrToFloat(gsTimeLeft) ;

  //update the Labels on the TabSheets
  lbBatteryCharge.Caption  := gsBCharge + ' %' ;
  lbRuntimeLeft.Caption    := gsTimeLeft + ' Min.';

  // update the Panels on the TabSheets and MiniViewForm for the UPS-Status
  // on line power - green
  if (gsStatus = cStatusONLINE) then
  begin
    pnStatus.Caption    := gsStatusText ;
    pnStatus.Color      := clLime ;
    pnStatus.Font.Color := clBlack ;
  end
  // UPS runing low on battery or other issues - red
  else if (gsStatus = cStatusLOWBATT)
       or (gsStatus = cStatusREPLACEBATT)
       or (gsStatus = cStatusNOBATT)
       or (gsStatus = cStatusERROR)
       or (gsStatus = cStatusOVERLOAD)then
  begin
    pnStatus.Caption    := gsStatusText ;
    pnStatus.Color      := clRed ;
    pnStatus.Font.Color := clWhite ;
  end
  // UPS runing on battery, Calibrate etc. - yellow
  else
  begin
    pnStatus.Caption    := gsStatusText ;
    pnStatus.Color      := clYellow ;
    pnStatus.Font.Color := clBlack ;
  end ;

  // update the RemainingRuntime Graph depending on the time left on battery
  // plenty of runtime left - green
  if (StrToFloat(gsTimeLeft) >= cTimeLeftGreen) then
  begin
    pnRuntime.Color      := clLime ;
    pnRuntime.Font.Color := clBlack ;
  end
  // getting low on runtime - yellow
  else if (StrToFloat(gsTimeLeft) >= cTimeLeftYellow) then
  begin
    pnRuntime.Color      := clYellow ;
    pnRuntime.Font.Color := clBlack ;
  end
  // almost no runtime left - red
  else
  begin
    pnRuntime.Color      := clRed ;
    pnRuntime.Font.Color := clWhite ;
  end ;
  // update the panel with the remaining runtime
  pnRuntime.Caption      := gsTimeLeft + ' Min.left' ;
end;

procedure TfUpsMonitorMain.acUpdateAPCMiniViewExecute(Sender: TObject);
//update the Mini-Viewer Elements and show APC data
var i : Integer ;
begin
  if gsAPCMiniViewShowWhat = 'APC' then
  begin
    // on line power - green Panel
    if (gsStatus = cStatusONLINE) then
    begin
      fAPCMiniView.pnMiniRuntime.Color := clLime ;
      fAPCMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end
    // UPS runing low on battery or other issues - red Panel
    else if (gsStatus = cStatusLOWBATT)
         or (gsStatus = cStatusREPLACEBATT)
         or (gsStatus = cStatusNOBATT)
         or (gsStatus = cStatusERROR)
         or (gsStatus = cStatusOVERLOAD)then
    begin
      fAPCMiniView.pnMiniRuntime.Color := clRed ;
      fAPCMiniView.pnMiniRuntime.Font.Color := clWhite ;
    end
    // UPS runing on battery, Calibrate etc. - yellow Panel
    else
    begin
      fAPCMiniView.pnMiniRuntime.Color := clYellow ;
      fAPCMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end ;

    // change the MiniView Hints
    fAPCMiniView.imLoad.Hint := 'UPS-Monitor ' + RxVersionInfo.FileLongVersion + #13 +
                             'Last updated: ' + gsLastConnect + #13 +
                             'APC: ' + gsStatusText + ' - ' + gsLoadWtt    + '/' + gsNomPower + 'W - Bat.' + Before('.',gsBCharge)  + ' % / ' + gsTimeLeft    + ' Min' + #13 +
                             'NUT: ' + gsNUTStatusText + ' - ' + gsNUTLoadWtt    + '/' + gsNUTNomPower + 'W - Bat.' + gsNUTBCharge    + ' % / ' + gsNUTTimeLeft    + ' Min' ;
    fAPCMiniView.imLoad.ShowHint    := True ;
    fAPCMiniView.cyBattery.Hint     := fAPCMiniView.imLoad.Hint ;
    fAPCMiniView.pnMiniRuntime.Hint := fAPCMiniView.imLoad.Hint ;
    fAPCMiniView.sbStatus.Hint      := 'Switch UPS-View' + #13 +
                                    'APC: ' + gsStatusText + #13 +
                                    'NUT: ' + gsNUTStatusText  ;

    fAPCMiniView.imLoad.ScaleMax      := 100 ;
    fAPCMiniView.imLoad.Position      := StrToFloat(gsLoadPct) ;
    fAPCMiniView.imLoad.Caption       := gsLoadPct + ' %' ;

    fAPCMiniView.cyBattery.Position   := StrToFloat(gsBCharge);

    fAPCMiniView.pnMiniRuntime.Caption:= gsTimeLeft + ' Min.' ;
    fAPCMiniView.lbUPSactive.Caption := 'APC' ;
    fAPCMiniView.lbUPSactive.BringToFront ;

    // change the MiniView StatusSpeedButtonImage depending on the UPS-Status Msg
         if (gsStatus = cStatusONLINE) then fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbOnline
    else if (gsStatus = cStatusONBATT) then fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbBattery
    else  fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbError ;
  end
  else
  begin
    //update the Mini-Viewer Elements and show NUT data
    // on line power - green Panel
    if (gsNUTStatus = cNUTStatusONLINE) then
    begin
      fAPCMiniView.pnMiniRuntime.Color := clLime ;
      fAPCMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end
    // UPS runing low on battery or other issues - red Panel
    else if (gsNUTStatus = cNUTStatusLOWBATT)
         or (gsNUTStatus = cNUTStatusREPLACEBATT)
         or (gsNUTStatus = cNUTStatusNOBATT)
         or (gsNUTStatus = cStatusERROR)
         or (gsNUTStatus = cStatusOVERLOAD)then
    begin
      fAPCMiniView.pnMiniRuntime.Color := clRed ;
      fAPCMiniView.pnMiniRuntime.Font.Color := clWhite ;
    end
    // UPS runing on battery, overload, Calibrate etc. - yellow Panel
    else
    begin
      fAPCMiniView.pnMiniRuntime.Color := clYellow ;
      fAPCMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end ;

    // change the MiniView Hints
    fAPCMiniView.imLoad.Hint := 'UPS-Monitor ' + RxVersionInfo.FileLongVersion + #13 +
                             'Last updated: ' + gsNUTLastConnect + #13 +
                             'APC: ' + gsStatusText + ' - ' + gsLoadWtt    + '/' + gsNomPower + 'W - Bat.' + Before('.',gsBCharge)  + ' % / ' + gsTimeLeft    + ' Min' + #13 +
                             'NUT: ' + gsNUTStatusText + ' - ' + gsNUTLoadWtt    + '/' + gsNUTNomPower + 'W - Bat.' + gsNUTBCharge    + ' % / ' + gsNUTTimeLeft    + ' Min' ;
    fAPCMiniView.imLoad.ShowHint    := True ;
    fAPCMiniView.cyBattery.Hint     := fAPCMiniView.imLoad.Hint ;
    fAPCMiniView.pnMiniRuntime.Hint := fAPCMiniView.imLoad.Hint ;
    fAPCMiniView.sbStatus.Hint      := 'Switch UPS-View' + #13 +
                                    'APC: ' + gsStatusText + #13 +
                                    'NUT: ' + gsNUTStatusText  ;

    fAPCMiniView.imLoad.ScaleMax      := 100 ;
    fAPCMiniView.imLoad.Position      := StrToFloat(gsNUTLoadPct) ;
    fAPCMiniView.imLoad.Caption       := gsLoadPct + ' %' ;

    fAPCMiniView.cyBattery.Position   := StrToFloat(gsNUTBCharge);

    fAPCMiniView.pnMiniRuntime.Caption:= gsNUTTimeLeft + ' Min.' ;
    fAPCMiniView.lbUPSactive.Caption := 'NUT' ;
    fAPCMiniView.lbUPSactive.BringToFront ;

    // change the MiniView StatusSpeedButtonImage depending on the UPS-Status Msg
         if (gsNUTStatus = cNUTStatusONLINE) then fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbOnline
    else if (gsNUTStatus = cNUTStatusONBATT) then fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbBattery
    else  fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbError ;
  end;

  // Update the Log- and Events View data
  fAPCLogView.mmLog.Text            := mmLog.Text ;
  fAPCEventsView.sgEventsS.RowCount := sgEventsS.RowCount ;
  fAPCEventsView.sgEventsS.ColCount := sgEventsS.ColCount ;
  fAPCEventsView.sgEventsS.FixedCols:= sgEventsS.FixedCols ;
  fAPCEventsView.sgEventsS.FixedRows:= sgEventsS.FixedRows ;
  for i := 0 to sgEventsS.RowCount - 1 do
    fAPCEventsView.sgEventsS.Rows[i].Assign(sgEventsS .Rows[i]);
  fAPCEventsView.sgEventsS.Refresh ;
end;

procedure TfUpsMonitorMain.acNUTTimerExecute(Sender: TObject);
// call the routine that initiates the Polling Routine to get UPS data
begin
  if (giNUTTimerStatus = cNUTTiWaiting) then
  begin;
    if (not cbNUTLogOnlyErrors.Checked) then
      mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - started by timer' ) ;

    // clear the var that holds the incoming data
    gsNUTRawData := '' ;

    // make sure the DataPort is ready, set server-ip and -port, open the dataport
    if dpNUTTimer.Active then dpNUTTimer.Close();
    dpNUTTimer.RemoteHost:= edNUTServer.Caption;
    dpNUTTimer.RemotePort:= IntToStr(seNUTPort.Value);
    dpNUTTimer.Active := True ;
    dpNUTTimer.Open();

    // the incoming data will now be read via the tiNUTPollTimer Routine
    // which must be activated in the DataPortOpen Routine
  end
  else
  begin
    mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - started by timer NOT ALLOWED - TimerStatus <> Waiting' ) ;
  end;
end;

procedure TfUpsMonitorMain.acNUTdpOpenExecute(Sender: TObject);
// once the dataport is open, turn on the poll-timer and send the first msg request
begin
  giNUTTimerStatus := cNUTTiActive ;
  tiNUTDataPoll.Interval:= 1000 ;
  tiNUTDataPoll.Enabled := True ;
  // send login- and status-msg-commands to NUT - each command must end with a LF
  dpNUTTimer.Push('USERNAME ' + edNUTUser.Text + #10 +
                  'PASSWORD ' + edNUTPassword.Text + #10 +
                  'LIST VAR ' + edNUTName.Text + #10) ;
  if (not cbNUTLogOnlyErrors.Checked) then
    mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - connection established' ) ;
end;

procedure TfUpsMonitorMain.acNUTdpDataExecute(Sender: TObject);
// on receiving data we add it to a var
begin
  giNUTTimerStatus := cNUTTiActive ;
  gsNUTRawData := gsNUTRawData + dpNUTTimer.Pull() ;
  if (not cbNUTLogOnlyErrors.Checked) then
    mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - data receiving' ) ;
end;

procedure TfUpsMonitorMain.acNUTTimerDataPollExecute(Sender: TObject);
// here we poll the data from NUT
var
  s : String ;
  i : Integer ;
begin
  // disable the timer during timer-runtime first, so it does not call again while executing
  tiNUTDataPoll.Enabled := False ;

  // here we poll the data from NUT
  if (not cbNUTLogOnlyErrors.Checked) then
    mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - data checking ' ) ;

  // check if all msgs are received
  if Pos('END LIST VAR', gsNUTRawData) > 0 then
  begin
    // remember when exactly we received the msg.
    gsNUTLastConnect := DateTimeToStr(now) ;

    if (not cbNUTLogOnlyErrors.Checked) then
      mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - received status msg' ) ;

    // copy data and clear buffer for next receive
    gsNUTRawStatus   := gsNUTRawData ;
    gsNUTRawData     := '' ;
    gsNUTConError  := cConErrorNone ;
    giNUTTimerStatus := cNUTTiDone ;
    acNUTGenUpsStatusExecute(self) ;
    if tsInfo.Visible then acNUTUpdateStatusBarExecute(self) ;
  end
  else
  begin
    // msg is incomplete - we extract what we got so far and log that
    s := '' ;
    for i := 1 to Length(gsNUTRawData) do
    begin
      s := s + IntToStr(Ord(gsNUTRawData[i])) + '-' ;
    end;
    edData.Text := s;
    gsNUTConError  := cConError ;
    gsNUTLastConnect := DateTimeToStr(now) ;
    mmNUTLog.Append(DateTimeToStr(now) + ' ERROR: TimerConnect NUT - received only part of msg: ' + s ) ;
  end;

  // we got all data - disconnect dataport and stop the timer
  if giNUTTimerStatus = cNUTTiDone then
  begin
    dpNUTTimer.Close ;
    tiNUTDataPoll.Enabled := False ;
    if (not cbNUTLogOnlyErrors.Checked) then
      mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - ended by timer' )
    else  ;
//      mmNUTLog.Append(DateTimeToStr(now) + ' OK: NUT - Status updated' );
  end
  else
  begin
    // after routine is done we enable the timer again
    tiNUTDataPoll.Enabled := True ;
  end;
end;

procedure TfUpsMonitorMain.acNUTdpCloseExecute(Sender: TObject);
// all data received - connection is closed and ready for re-connect
begin
  giNUTTimerStatus := cNUTTiWaiting ;
  // disable the Polltimer until we open next connection
  tiNUTDataPoll.Enabled := False ;
  if (not cbNUTLogOnlyErrors.Checked) then
    mmNUTLog.Append(DateTimeToStr(now) + ' TimerConnect NUT - closing' ) ;
end;

procedure TfUpsMonitorMain.dpNUTTimerError(Sender: TObject; const AMsg: string);
// on connection errors we log it
begin
  mmNUTLog.Append(DateTimeToStr(now) + ' ERROR: TimerConnect NUT - ' + AMsg );
  dpNUTTimer.Close() ;
  gsNUTConError := cConError ;
end;

procedure TfUpsMonitorMain.acNUTGenUpsStatusExecute(Sender: TObject);
// Extract the NUT Status Data from the raw data received
var
  i : LongInt ;
  iBegin, iLength : Integer ;
  dTemp : Double ;
  sLine, sName, sValue, sUnit : String ;
begin
  // check if we use simulated values from the settings page instead
  acSimStats.Execute;

  // check first if the connection was lost
  if (gsNUTConError = cConError) or (gsNUTConError = cConErrorSim) then
  begin
    gsNUTTimeLeft   := '99' ;
    gsNUTLoadPct    := '99' ;
    gsNUTBCharge    := '0' ;
    gsNUTStatus     := cNUTStatusERROR ;
    gsNUTStatusText := cStatusTextError ;
    gsNUTMaxRuntime := '99' ;
    gsNUTLoadWtt    := '999' ;
    gsNUTRawStatus  := '' ;

    //update the MainForm Elements
    acNUTUpdateMainForm.Execute ;

    //update the Mini-Viewer Elements
    acNUTUpdateMiniViewExecute(self) ;

    //update the System-TrayIcon Hint-Text and Icon
    acUpdateSystemTrayExecute(self) ;

    // update the Log file
    mmNUTLog.Append(DateTimeToStr(now) + ' ' + gsNUTConError + ': connection to NUT lost' ) ;
  end;

  // manualy assign the parent control for Cindy Components, otherwise the Tabsheets are dissapearing
  cyNUTBatteryCharge.Parent := tsNUTInfo ;
  cyNUTRuntimeLeft.Parent   := tsNUTInfo ;

  // Process the ApcUpsD Status data received via Timer
  if gsNUTRawStatus > '' then
  begin
    // empty the Status StringGrid
    sgNUTStatus.Clean([gzNormal, gzFixedRows]);
    sgNUTStatus.RowCount := 1 ;
    sgNUTStatus.InsertRowWithValues(sgNUTStatus.RowCount,['Last Update: ', gsNUTLastConnect, '']) ;

    // start extracting from the first char after the 2-Byte Length-Info
    iBegin := 1 ;

    // go through the whole data-string, char by char
    for i := 1 to Length(gsNUTRawStatus) do
    begin
      // we found a linefeed -> a msg ends there
      if gsNUTRawStatus[i] = #10 then
      begin
        // we extract that line
        iLength := i - iBegin ;
        sLine := Copy(gsNUTRawStatus,iBegin,iLength) ;

        // separate Status-Name, Value and Unit (if any)
        sName  := Trim( Before(cNUTSeparator, After('VAR ' + Trim(edNUTName.Text) + ' ',sLine)) ) ;
        sValue := Trim( Between('"','"',sLine) ) ;

        // copy data we frequently need e.g. in the StatusBar to global Vars
        if sName = cNUTTIMELEFT then
        begin
          try
            dTemp         := StrToInt(sValue) / 60 ;
            sValue        := FloatToStr(dTemp) ;
            gsNUTTimeLeft := sValue ;
          except
            gsNUTTimeLeft := '999' ;
          end;
          sUnit := cMinutes ;
        end
        else if sName = cNUTLOADPCT  then
        begin
          gsNUTLoadPct  := sValue ;
          sUnit := cPercent ;
        end
        else if sName = cNUTBCHARGE  then
        begin
          gsNUTBCharge  := sValue ;
          sUnit := cPercent ;
        end
        else if sName = cNUTSTATUS   then
        begin
          gsNUTStatus   := sValue ;
        end
        else if sName = cNUTNOMPOWER then
        begin
          gsNUTNomPower  := sValue ;
          sUnit := cWatts ;
        end
        else if sName = cNUTUPSNAME  then
        begin
             gsNUTUpsName  := sValue ;
             sUnit := ''
        end
        else if (sName = 'battery.charge.low')
             or (sName = 'battery.charge.warning')
             then sUnit := cPercent
        else if (sName = 'battery.runtime.low')
             or (sName = 'driver.parameter.pollfreq')
             or (sName = 'driver.parameter.pollinterval')
             or (sName = 'ups.delay.shutdown')
             then sUnit := cSeconds
        else if (sName = 'battery.voltage')
             or (sName = 'battery.voltage.nominal')
             or (sName = 'input.transfer.high')
             or (sName = 'input.transfer.low')
             or (sName = 'input.voltage')
             or (sName = 'input.voltage.nominal')
             then sUnit := cVolts
        else sUnit := '' ;

        // add the UPS-Status info to the grid
        if sName > '' then sgNUTStatus.InsertRowWithValues(sgNUTStatus.RowCount,[sName, sValue, sUnit]) ;

        // set the begin of the next msg line - we ignore the first two chars
        // as they contain only the length of the next msg as byte values
        // which contain control codes - we don't want them in our text
        iBegin := i + 1 ;
      end;
    end;

    // check if we use simulated values from the settings page instead
    acSimStats.Execute;

    // update clear-text Status
    if      gsNUTStatus = cNUTStatusONLINE      then gsNUTStatusText := cStatusTextONLINE
    else if gsNUTStatus = cNUTStatusONBATT      then gsNUTStatusText := cStatusTextONBATT
    else if gsNUTStatus = cNUTStatusLOWBATT     then gsNUTStatusText := cStatusTextLOWBATT
    else if gsNUTStatus = cNUTStatusREPLACEBATT then gsNUTStatusText := cStatusTextREPLACEBATT
    else if gsNUTStatus = cNUTStatusNOBATT      then gsNUTStatusText := cStatusTextNOBATT
    else if gsNUTStatus = cNUTStatusOVERLOAD    then gsNUTStatusText := cStatusTextOVERLOAD
    else if gsNUTStatus = cNUTStatusCAL         then gsNUTStatusText := cStatusTextCAL
    else if gsNUTStatus = cNUTStatusTRIM        then gsNUTStatusText := cStatusTextTRIM
    else if gsNUTStatus = cNUTStatusBOOST       then gsNUTStatusText := cStatusTextBOOST
    else gsNUTStatusText := 'Unknown: ' + gsNUTStatus ;

    // update the Log file
    if (gsNUTStatus <> cNUTStatusONLINE) then
    begin
      if gsNUTFailureFlag <> gsNUTStatus then mmLog.Append(DateTimeToStr(now) + ' Warning: ' + gsNUTStatusText ) ;
      gsNUTFailureFlag := gsNUTStatus ;
    end
    else if gsNUTFailureFlag <> 'OK' then
    begin
      mmNUTLog.Append(DateTimeToStr(now) + ' OK: Power restored' ) ;
      gsNUTFailureFlag := 'OK' ;
    end;

    // calculate the LoadWatt (current power load in Watt)
    try
      if (gsNUTNomPower = '') then gsNUTNomPower := '0' ; //avoid FloatError
      gsNUTLoadWtt := StrFloat( StrToFloat(gsNUTNomPower) * StrToFloat(gsNUTLoadPct) / 100 , '0'  ) ;
      if (gsNUTLoadWtt <> '0') then sgNUTStatus.InsertRowWithValues(sgNUTStatus.RowCount,['ups.load.watt', gsNUTLoadWtt, 'Watt']) ;
    except
      gsNUTLoadWtt := '9999' ;
    end;

    // Calculate the MaxRuntime (runtime left when UPS is on battery)
    try
      gsNUTMaxRuntime := StrFloat( StrToFloat(gsNUTTimeLeft) / StrToFloat(gsNUTBCharge) * 100 , '0'  ) ;
    except
      gsNUTMaxRuntime := '9999' ;
    end;

    //update the MainForm Elements
    acNUTUpdateMainForm.Execute ;

    // update the Mini-Viewer Elements
    acNUTUpdateMiniViewExecute(self) ;

    //update the System-TrayIcon Hint-Text and Icon
    acUpdateSystemTrayExecute(self) ;

    // Check if we have to shutdown the PC on Low Battery and Time run out
    acCheckShutdownPCExecute(self) ;

    // decrease the timer intervall while the UPS is running on battery
    if (gsNUTStatus = cNUTStatusONBATT) or (gsNUTStatus = cNUTStatusLOWBATT) or (gsNUTStatus = cNUTStatusNOBATT) then
      tiNUTConnect.Interval := ciTimerOnBattery * 1000
    else
      tiNUTConnect.Interval := seIntervalPoll.Value * 60000 ;
  end;
end;

procedure TfUpsMonitorMain.acNUTUpdateStatusBarExecute(Sender: TObject);
// update the status bar with NUT status data
var
  i : Integer ;
begin
  sbStatusBar.Panels[csbUpsName].Text    := 'NUT' ;
  sbStatusBar.Panels[csbRuntime].Text    := 'Battery: ' + gsNUTBCharge  + ' % / ' + gsNUTTimeLeft + ' Min.left' ;
  sbStatusBar.Panels[csbBCharge].Text    := '' ;
  sbStatusBar.Panels[csbLoadPerc].Text   := 'Load: '       + gsNUTLoadPct  + ' % / ' + gsNUTLoadWtt  + ' Watt';
  sbStatusBar.Panels[csbLoadWatt].Text   := '';
  sbStatusBar.Panels[csbStatus].Text     := 'Status: '     + gsNUTStatusText ;
  sbStatusBar.Panels[csbLastUpdate].Text := 'Last Update: '+ gsNUTLastConnect ;

  // match text length and panel width
  for i := 0 to sbStatusBar.Panels.Count - 1 do
    sbStatusBar.Panels[i].Width := sbStatusBar.Canvas.TextWidth( sbStatusBar.Panels[i].Text ) + 8;

  // update the form
  fUpsMonitorMain.Refresh; ;
end;

procedure TfUpsMonitorMain.acNUTUpdateMainFormExecute(Sender: TObject);
// update MainForm NUT-InfoSheet
begin
  //update the Load-Gauges on the Info-TabSheets
  imNUTLoad.ScaleMax    := 100 ;
  imNUTLoad.Position    := StrToFloat(gsNUTLoadPct) ;
  imNUTLoad.Caption     := 'Load: ' + gsNUTLoadPct + ' % - ' + gsNUTLoadWtt + '/' + gsNUTNomPower + ' Watt';

  // update the BatteryCharge-Gauges on the Info-TabSheets
  // change the Bar-Color depending on the battery charge
  if (StrToFloat(gsNUTBCharge) >= cBatChargeGreen) then  // blue(ish) color on full battery
  begin
    cyNUTBatteryCharge.ItemOnPen.Color  := $00FF8000;
  end
  else if (StrToFloat(gsNUTBCharge) >= cBatChargeYellow) then // yellow Bar on medium charged battery
  begin
    cyNUTBatteryCharge.ItemOnPen.Color  := clYellow ;
  end
  else
  begin                                         // otherwise (low charge) red color bar
    cyNUTBatteryCharge.ItemOnPen.Color  := clRed ;
  end ;
  // update the Battery Bar-Graph on the TabSheets
  cyNUTBatteryCharge.Position  := StrToFloat(gsNUTBCharge) ;

  // update the RuntimeLeft-Gauges on the TabSheets
  // different colors depending on the remaining runtime
  if (StrToFloat(gsNUTTimeLeft) >= cTimeLeftGreen)       then
  begin
    cyNUTRuntimeLeft.ItemOnPen.Color  := clLime ;
  end
  else if (StrToFloat(gsNUTTimeLeft) >= cTimeLeftYellow) then
  begin
    cyNUTRuntimeLeft.ItemOnPen.Color  := clYellow ;
  end
  else
  begin
    cyNUTRuntimeLeft.ItemOnPen.Color  := clRed ;
  end ;
  // update the bar-graphs
  cyNUTRuntimeLeft.Max       := StrToFloat(gsNUTMaxRuntime) ;
  cyNUTRuntimeLeft.Position  := StrToFloat(gsNUTTimeLeft) ;

  //update the Labels on the TabSheets
  lbNUTBatteryCharge.Caption  := gsNUTBCharge + ' %' ;
  lbNUTRuntimeLeft.Caption    := gsNUTTimeLeft + ' Min.';

  // update the Panels on the TabSheets and MiniViewForm for the UPS-Status
  // on line power - green
  if (gsNUTStatus = cNUTStatusONLINE) then
  begin
    pnNUTStatus.Caption    := gsNUTStatusText ;
    pnNUTStatus.Color      := clLime ;
    pnNUTStatus.Font.Color := clBlack ;
  end
  // UPS runing low on battery or other issues - red
  else if (gsNUTStatus = cNUTStatusLOWBATT)
       or (gsNUTStatus = cNUTStatusREPLACEBATT)
       or (gsNUTStatus = cNUTStatusNOBATT)
       or (gsNUTStatus = cNUTStatusERROR)
       or (gsNUTStatus = cNUTStatusOVERLOAD)then
  begin
    pnNUTStatus.Caption    := gsNUTStatusText ;
    pnNUTStatus.Color      := clRed ;
    pnNUTStatus.Font.Color := clWhite ;
  end
  // UPS runing on battery, overload, Calibrate etc. - yellow
  else
  begin
    pnNUTStatus.Caption    := gsNUTStatusText ;
    pnNUTStatus.Color      := clYellow ;
    pnNUTStatus.Font.Color := clBlack ;
  end ;

  // update the RemainingRuntime Graph depending on the time left on battery
  // plenty of runtime left - green
  if (StrToFloat(gsNUTTimeLeft) >= cTimeLeftGreen) then
  begin
    pnNUTRuntime.Color      := clLime ;
    pnNUTRuntime.Font.Color := clBlack ;
  end
  // getting low on runtime - yellow
  else if (StrToFloat(gsNUTTimeLeft) >= cTimeLeftYellow) then
  begin
    pnNUTRuntime.Color      := clYellow ;
    pnNUTRuntime.Font.Color := clBlack ;
  end
  // almost no runtime left - red
  else
  begin
    pnNUTRuntime.Color      := clRed ;
    pnNUTRuntime.Font.Color := clWhite ;
  end ;
  // update the panel with the remaining runtime
  pnNUTRuntime.Caption      := gsNUTTimeLeft + ' Min.left' ;
end;

procedure TfUpsMonitorMain.acNUTUpdateMiniViewExecute(Sender: TObject);
// update the NUT MiniViewer
begin
  if gsNUTMiniViewShowWhat = 'APC' then
  begin
    // on line power - green Panel
    if (gsStatus = cStatusONLINE) then
    begin
      fNUTMiniView.pnMiniRuntime.Color := clLime ;
      fNUTMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end
    // UPS runing low on battery or other issues - red Panel
    else if (gsStatus = cStatusLOWBATT)
         or (gsStatus = cStatusREPLACEBATT)
         or (gsStatus = cStatusNOBATT)
         or (gsStatus = cStatusERROR)
         or (gsStatus = cStatusOVERLOAD)then
    begin
      fNUTMiniView.pnMiniRuntime.Color := clRed ;
      fNUTMiniView.pnMiniRuntime.Font.Color := clWhite ;
    end
    // UPS runing on battery, Calibrate etc. - yellow Panel
    else
    begin
      fNUTMiniView.pnMiniRuntime.Color := clYellow ;
      fNUTMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end ;

    // change the MiniView Hints
    fNUTMiniView.imLoad.Hint := 'UPS-Monitor ' + RxVersionInfo.FileLongVersion + #13 +
                             'Last updated: ' + gsLastConnect + #13 +
                             'APC: ' + gsStatusText + ' - ' + gsLoadWtt    + '/' + gsNomPower + 'W - Bat.' + Before('.',gsBCharge)  + ' % / ' + gsTimeLeft    + ' Min' + #13 +
                             'NUT: ' + gsNUTStatusText + ' - ' + gsNUTLoadWtt    + '/' + gsNUTNomPower + 'W - Bat.' + gsNUTBCharge    + ' % / ' + gsNUTTimeLeft    + ' Min' ;
    fNUTMiniView.imLoad.ShowHint    := True ;
    fNUTMiniView.cyBattery.Hint     := fNUTMiniView.imLoad.Hint ;
    fNUTMiniView.pnMiniRuntime.Hint := fNUTMiniView.imLoad.Hint ;
    fNUTMiniView.sbStatus.Hint      := 'Switch UPS-View' + #13 +
                                    'APC: ' + gsStatusText + #13 +
                                    'NUT: ' + gsNUTStatusText  ;

    fNUTMiniView.imLoad.ScaleMax      := 100 ;
    fNUTMiniView.imLoad.Position      := StrToFloat(gsLoadPct) ;
    fNUTMiniView.imLoad.Caption       := gsLoadPct + ' %' ;

    fNUTMiniView.cyBattery.Position   := StrToFloat(gsBCharge);

    fNUTMiniView.pnMiniRuntime.Caption:= gsTimeLeft + ' Min.' ;
    fNUTMiniView.lbUPSactive.Caption := 'APC' ;
    fNUTMiniView.lbUPSactive.BringToFront ;

    // change the MiniView StatusSpeedButtonImage depending on the UPS-Status Msg
         if (gsStatus = cStatusONLINE) then fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbOnline
    else if (gsStatus = cStatusONBATT) then fAPCMiniView.sbStatus.ImageIndex := ciMnVwSbBattery
    else  fNUTMiniView.sbStatus.ImageIndex := ciMnVwSbError ;
  end
  else
  begin
    //update the Mini-Viewer Elements and show NUT data
    // on line power - green Panel
    if (gsNUTStatus = cNUTStatusONLINE) then
    begin
      fNUTMiniView.pnMiniRuntime.Color := clLime ;
      fNUTMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end
    // UPS runing low on battery or other issues - red Panel
    else if (gsNUTStatus = cNUTStatusLOWBATT)
         or (gsNUTStatus = cNUTStatusREPLACEBATT)
         or (gsNUTStatus = cNUTStatusNOBATT)
         or (gsNUTStatus = cStatusERROR)
         or (gsNUTStatus = cStatusOVERLOAD)then
    begin
      fNUTMiniView.pnMiniRuntime.Color := clRed ;
      fNUTMiniView.pnMiniRuntime.Font.Color := clWhite ;
    end
    // UPS runing on battery, overload, Calibrate etc. - yellow Panel
    else
    begin
      fNUTMiniView.pnMiniRuntime.Color := clYellow ;
      fNUTMiniView.pnMiniRuntime.Font.Color := clBlack ;
    end ;

    // change the MiniView Hints
    fNUTMiniView.imLoad.Hint := 'UPS-Monitor ' + RxVersionInfo.FileLongVersion + #13 +
                             'Last updated: ' + gsNUTLastConnect + #13 +
                             'APC: ' + gsStatusText + ' - ' + gsLoadWtt    + '/' + gsNomPower + 'W - Bat.' + Before('.',gsBCharge)  + ' % / ' + gsTimeLeft    + ' Min' + #13 +
                             'NUT: ' + gsNUTStatusText + ' - ' + gsNUTLoadWtt    + '/' + gsNUTNomPower + 'W - Bat.' + gsNUTBCharge    + ' % / ' + gsNUTTimeLeft    + ' Min' ;
    fNUTMiniView.imLoad.ShowHint    := True ;
    fNUTMiniView.cyBattery.Hint     := fNUTMiniView.imLoad.Hint ;
    fNUTMiniView.pnMiniRuntime.Hint := fNUTMiniView.imLoad.Hint ;
    fNUTMiniView.sbStatus.Hint      := 'Switch UPS-View' + #13 +
                                    'APC: ' + gsStatusText + #13 +
                                    'NUT: ' + gsNUTStatusText  ;

    fNUTMiniView.imLoad.ScaleMax      := 100 ;
    fNUTMiniView.imLoad.Position      := StrToFloat(gsNUTLoadPct) ;
    fNUTMiniView.imLoad.Caption       := gsLoadPct + ' %' ;

    fNUTMiniView.cyBattery.Position   := StrToFloat(gsNUTBCharge);

    fNUTMiniView.pnMiniRuntime.Caption:= gsNUTTimeLeft + ' Min.' ;
    fNUTMiniView.lbUPSactive.Caption := 'NUT' ;
    fNUTMiniView.lbUPSactive.BringToFront ;

    // change the MiniView StatusSpeedButtonImage depending on the UPS-Status Msg
         if (gsNUTStatus = cNUTStatusONLINE) then fNUTMiniView.sbStatus.ImageIndex := ciMnVwSbOnline
    else if (gsNUTStatus = cNUTStatusONBATT) then fNUTMiniView.sbStatus.ImageIndex := ciMnVwSbBattery
    else  fNUTMiniView.sbStatus.ImageIndex := ciMnVwSbError ;
  end;

  // Update the NUT Log data
  fNUTLogView.mmNUTLog.Text := mmNUTLog.Text ;
end;

procedure TfUpsMonitorMain.acUpdateSystemTrayExecute(Sender: TObject);
// Change the TrayIcon for either NUT or APC depending on the settings
begin
  if cbUpdateTrayIcon.Checked then
  begin
    if      gsStatus = cStatusONLINE   then
    begin
      if      ( StrToFloat(gsBCharge) > cBatCharge75) then ImageListTray.GetIcon(ciSysTrayC100, TrayIcon.Icon)
      else if ( StrToFloat(gsBCharge) > cBatCharge50) then ImageListTray.GetIcon(ciSysTrayC75, TrayIcon.Icon)
      else if ( StrToFloat(gsBCharge) > cBatCharge25) then ImageListTray.GetIcon(ciSysTrayC50, TrayIcon.Icon)
      else                                                 ImageListTray.GetIcon(ciSysTrayC25, TrayIcon.Icon) ;
    end
    else if gsStatus = cStatusONBATT   then
    begin
      if      ( StrToFloat(gsBCharge) > cBatCharge75) then ImageListTray.GetIcon(ciSysTrayB100, TrayIcon.Icon)
      else if ( StrToFloat(gsBCharge) > cBatCharge50) then ImageListTray.GetIcon(ciSysTrayB75, TrayIcon.Icon)
      else if ( StrToFloat(gsBCharge) > cBatCharge25) then ImageListTray.GetIcon(ciSysTrayB50, TrayIcon.Icon)
      else if ( StrToFloat(gsBCharge) > cBatCharge05) then ImageListTray.GetIcon(ciSysTrayB25, TrayIcon.Icon)
      else                                                 ImageListTray.GetIcon(ciSysTrayB0,  TrayIcon.Icon) ;
    end
    else if gsStatus = cStatusLOWBATT  then ImageListTray.GetIcon(ciSysTrayB0, TrayIcon.Icon)
    else if gsStatus = cStatusOVERLOAD then ImageListTray.GetIcon(ciSysTrayWarning, TrayIcon.Icon)
    else ImageListTray.GetIcon(ciSysTrayError, TrayIcon.Icon);
    Application.Icon := TrayIcon.Icon ;
  end
  else if cbNUTUpdateTrayIcon.Checked then
  begin
    if      gsNUTStatus = cNUTStatusONLINE   then
    begin
      if      ( StrToFloat(gsNUTBCharge) > cBatCharge75) then ImageListTray.GetIcon(ciSysTrayC100, TrayIcon.Icon)
      else if ( StrToFloat(gsNUTBCharge) > cBatCharge50) then ImageListTray.GetIcon(ciSysTrayC75, TrayIcon.Icon)
      else if ( StrToFloat(gsNUTBCharge) > cBatCharge25) then ImageListTray.GetIcon(ciSysTrayC50, TrayIcon.Icon)
      else                                                    ImageListTray.GetIcon(ciSysTrayC25, TrayIcon.Icon) ;
    end
    else if gsNUTStatus = cNUTStatusONBATT   then
    begin
      if      ( StrToFloat(gsNUTBCharge) > cBatCharge75) then ImageListTray.GetIcon(ciSysTrayB100, TrayIcon.Icon)
      else if ( StrToFloat(gsNUTBCharge) > cBatCharge50) then ImageListTray.GetIcon(ciSysTrayB75, TrayIcon.Icon)
      else if ( StrToFloat(gsNUTBCharge) > cBatCharge25) then ImageListTray.GetIcon(ciSysTrayB50, TrayIcon.Icon)
      else if ( StrToFloat(gsNUTBCharge) > cBatCharge05) then ImageListTray.GetIcon(ciSysTrayB25, TrayIcon.Icon)
      else                                                    ImageListTray.GetIcon(ciSysTrayB0,  TrayIcon.Icon) ;
    end
    else if gsNUTStatus = cNUTStatusLOWBATT  then ImageListTray.GetIcon(ciSysTrayB0, TrayIcon.Icon)
    else if gsNUTStatus = cNUTStatusOVERLOAD then ImageListTray.GetIcon(ciSysTrayWarning, TrayIcon.Icon)
    else ImageListTray.GetIcon(ciSysTrayError, TrayIcon.Icon);
    Application.Icon := TrayIcon.Icon ;
  end
  else
  begin
    ImageListTray.GetIcon(ciSysTrayLogo, TrayIcon.Icon) ;
    Application.Icon := TrayIcon.Icon ;
  end;

  //update the System-TrayIcon.Hint Text
  TrayIcon.Hint := 'APC: ' + gsStatusText + ' - ' + gsLoadWtt    + '/' + gsNomPower + 'W - Bat.' + Before('.',gsBCharge)  + ' % / ' + gsTimeLeft    + ' Min' + #13 +
                   'NUT: ' + gsNUTStatusText + ' - ' + gsNUTLoadWtt    + '/' + gsNUTNomPower + 'W - Bat.' + gsNUTBCharge    + ' % / ' + gsNUTTimeLeft    + ' Min' ;
  if TrayIcon.Hint.Length < 115 then TrayIcon.Hint := 'UPS-Monitor' + #13 + TrayIcon.Hint ; //TrayIcon.Hint on Win10 is max.127chrs!

  // send a notification to Windows when status not On Line
  if (gsStatus = cStatusERROR) or (gsNUTStatus = cNUTStatusERROR ) then
  begin
     TrayIcon.BalloonFlags := bfWarning ;
     TrayIcon.BalloonTitle := 'CONNECTION TO UPS LOST ' ;
     TrayIcon.BalloonHint  := 'STATUS APC: ' + gsStatusText + #13 +
                              'STATUS NUT: ' + gsNUTStatusText ;
     TrayIcon.ShowBalloonHint ;
     giALLFailureFlag := 1 ;
  end
  else if (gsStatus <> cStatusONLINE) or (gsNUTStatus <> cNUTStatusONLINE ) then
  begin
     TrayIcon.BalloonFlags := bfWarning ;
     TrayIcon.BalloonTitle := 'UPS-POWER FAILURE DETECTED ' ;
     TrayIcon.BalloonHint  := 'STATUS APC: ' + gsStatusText + #13 +
                              'STATUS NUT: ' + gsNUTStatusText ;
     TrayIcon.ShowBalloonHint ;
     giALLFailureFlag := 1 ;
  end;
  if (giAllFailureFlag = 1) and (gsStatus = cStatusONLINE) and (gsNUTStatus = cNUTStatusONLINE ) then
  begin
    TrayIcon.BalloonFlags := bfInfo ;
    TrayIcon.BalloonTitle := 'UPS-POWER RESTORED ' ;
    TrayIcon.BalloonHint  := 'STATUS APC: ' + gsStatusText + #13 +
                             'STATUS NUT: ' + gsNUTStatusText ;
    TrayIcon.ShowBalloonHint ;
    giALLFailureFlag := 0 ;
  end;
end;

procedure TfUpsMonitorMain.acTrayIconClickExecute(Sender: TObject);
// what to do when we click on the system tray icon
var x,y ,iWinTitleBarHeight, iWinBorderWidth : LongInt ;
begin
  // get the position of the Tray-Icon
  x := TrayIcon.GetPosition.X ;
  y := TrayIcon.GetPosition.Y ;

  if cbSavePosMiniView.Checked then
  begin
    // we want to restore the saved position
    fAPCMiniView.Top    := giAPCMiniViewTop ;
    fAPCMiniView.Left   := giAPCMiniViewLeft ;
    fAPCLogView.Top     := giAPCLogMiniViewTop ;
    fAPCLogView.Left    := giAPCLogMiniViewLeft ;
    fAPCEventsView.Top  := giAPCEventsMiniViewTop ;
    fAPCEventsView.Left := giAPCEventsMiniViewLeft ;
    fNUTMiniView.Top    := giNUTMiniViewTop ;
    fNUTMiniView.Left   := giNUTMiniViewLeft ;
    fNUTLogView.Top     := giNUTLogMiniViewTop ;
    fNUTLogView.Left    := giNUTLogMiniViewLeft ;
  end
  else
  begin
    // use default position above the tray icon and save that
    iWinTitleBarHeight := GetSystemMetrics(SM_CXSIZE) ;
    iWinBorderWidth    := GetSystemMetrics(SM_CXFRAME) ;
    y := Screen.WorkAreaHeight ;
    x := Screen.WorkAreaWidth ;

    fAPCMiniView.Top        := y - fAPCMiniView.Height ;
    fAPCMiniView.Left       := x - fAPCMiniView.Width * 2 ;

    fNUTMiniView.Top        := fAPCMiniView.Top ;
    fNUTMiniView.Left       := fAPCMiniView.Left + fAPCMiniView.Width ;

    fNUTLogView.Top         := y - fNUTLogView.Height * 2 ;
    fNUTLogView.Left        := x - fNUTLogView.Width ;

    fAPCLogView.Top         := fNUTLogView.Top ;
    fAPCLogView.Left        := fNUTLogView.Left - fAPCLogView.Width ;

    fAPCEventsView.Top      := fAPCLogView.Top + fAPCLogView.Height ;
    fAPCEventsView.Left     := fAPCMiniView.Left - fAPCEventsView.Width ;

    giAPCMiniViewTop        := fAPCMiniView.Top ;
    giAPCMiniViewLeft       := fAPCMiniView.Left ;
    giNUTMiniViewTop        := fNUTMiniView.Top ;
    giNUTMiniViewLeft       := fNUTMiniView.Left ;
    giAPCLogMiniViewTop     := fAPCLogView.Top ;
    giAPCLogMiniViewLeft    := fAPCLogView.Left ;
    giAPCEventsMiniViewTop  := fAPCEventsView.Top ;
    giAPCEventsMiniViewLeft := fAPCEventsView.Left ;
    giNUTLogMiniViewTop     := fNUTLogView.Top ;
    giNUTLogMiniViewLeft    := fNUTLogView.Left ;
  end;

  // show/hide the APC MiniViewForm
  if cbAPCMiniView.Checked then
  begin
    if fAPCMiniView.Visible then
    begin
      fAPCMiniView.ShowInTaskBar := stNever;
      fAPCMiniView.Hide ;
    end
    else
    begin
      if cbKeepMiniViewOnTop.Checked then fAPCMiniView.FormStyle := fsSystemStayOnTop else fAPCMiniView.FormStyle := fsNormal ;
      fAPCMiniView.ShowInTaskBar := stNever;
      fAPCMiniView.BringToFront ;
      fAPCMiniView.Show ;
    end;
  end
  else
  begin
    fAPCMiniView.ShowInTaskBar := stNever;
    fAPCMiniView.Hide ;
  end;

  // show/hide the APC Log View Form
  if cbAPCLogMiniView.Checked then
  begin
    if fAPCLogView.Visible then
    begin
      fAPCLogView.ShowInTaskBar := stNever;
      fAPCLogView.Hide ;
    end
    else
    begin
      if cbKeepMiniViewOnTop.Checked then fAPCLogView.FormStyle := fsSystemStayOnTop else fAPCLogView.FormStyle := fsNormal ;
      fAPCLogView.ShowInTaskBar := stNever;
      fAPCLogView.BringToFront ;
      fAPCLogView.Show ;
    end;
  end
  else
  begin
    fAPCLogView.ShowInTaskBar := stNever;
    fAPCLogView.Hide ;
  end;

  // show/hide the APC Events View Form
  if cbAPCEventsMiniView.Checked then
  begin
    if fAPCEventsView.Visible then
    begin
      fAPCEventsView.ShowInTaskBar := stNever;
      fAPCEventsView.Hide ;
    end
    else
    begin
      fAPCEventsView.ShowInTaskBar := stNever;
      if cbKeepMiniViewOnTop.Checked then fAPCEventsView.FormStyle := fsSystemStayOnTop else fAPCEventsView.FormStyle := fsNormal ;
      fAPCEventsView.BringToFront ;
      fAPCEventsView.Show ;
    end;
  end
  else
  begin
    fAPCEventsView.ShowInTaskBar := stNever;
    fAPCEventsView.Hide ;
  end;

  // show/hide the NUT MiniViewForm
  if cbNUTMiniView.Checked then
  begin
    if fNUTMiniView.Visible then
    begin
      fNUTMiniView.ShowInTaskBar := stNever;
      fNUTMiniView.Hide ;
    end
    else
    begin
      acNUTUpdateMiniView.Execute ;
      fNUTMiniView.ShowInTaskBar := stNever;
      if cbKeepMiniViewOnTop.Checked then fNUTMiniView.FormStyle := fsSystemStayOnTop else fNUTMiniView.FormStyle := fsNormal ;
      fNUTMiniView.BringToFront ;
      fNUTMiniView.Show ;
    end;
  end
  else
  begin
    fNUTMiniView.ShowInTaskBar := stNever;
    fNUTMiniView.Hide ;
  end;

  // show/hide the NUT Log View Form
  if cbNUTLogMiniView.Checked then
  begin
    if fNUTLogView.Visible then
    begin
      fNUTLogView.ShowInTaskBar := stNever;
      fNUTLogView.Hide ;
    end
    else
    begin
      fNUTLogView.ShowInTaskBar := stNever;
      if cbKeepMiniViewOnTop.Checked then fNUTLogView.FormStyle := fsSystemStayOnTop else fNUTLogView.FormStyle := fsNormal ;
      fNUTLogView.BringToFront ;
      fNUTLogView.Show ;
    end;
  end
  else
  begin
    fNUTLogView.ShowInTaskBar := stNever;
    fNUTLogView.Hide ;
  end;
end;

procedure TfUpsMonitorMain.acTrayIconDblClickExecute(Sender: TObject);
// show/hide the main screen from/to the system tray
begin
  if fUpsMonitorMain.Visible = False then
  begin
    fUpsMonitorMain.Show ;
    fUpsMonitorMain.BringToFront ;
  end
  else
  begin
    fUpsMonitorMain.Hide ;
  end;
end;

procedure TfUpsMonitorMain.acSwitchTabsheetExecute(Sender: TObject);
// switch through all available Tabsheets sequentially
begin
  pcUpsMonitor.ActivePage := pcUpsMonitor.FindNextPage (pcUpsMonitor.ActivePage, True, True);
end;

procedure TfUpsMonitorMain.acGetUpsDataExecute(Sender: TObject);
// get data from UPS manualy by starting the timer
begin
  if cbAPCUPSDActive.Checked then
  begin
    if (giTimerStatus = cTiWaiting) then
    begin
      acAPCTimerExecute(self) ;
    end
    else
    begin
      ShowMessage('Already receiving UPS-Data - please try again in a few sec.') ;
    end;
  end
  else
  begin
    ShowMessage('Receiving of ApcUpsD Data is deactivated in Settings' + #13 + #13 +
                'Please check and try again later !') ;
  end ;

  // get data from NUT manualy by starting the timer
  if cbNUTActive.Checked then
  begin
    if (giNUTTimerStatus = cNUTTiWaiting) then
    begin
      acNUTTimerExecute(self) ;
    end
    else
    begin
      ShowMessage('Already receiving UPS-Data - please try again in a few sec.') ;
    end;
  end
  else
  begin
    ShowMessage('Receiving of NUT Data is deactivated in Settings' + #13 + #13 +
                'Please check and try again later !') ;
  end ;
end;

procedure TfUpsMonitorMain.acSimStatsExecute(Sender: TObject);
// populate the global vars with simulated data so we can run tests with various statis etc.
begin
  if cbSimOnAPC.Checked then
  begin
    gsTimeLeft   := edSimTimeLeft.Text ;
    gsLoadPct    := edSimLoadPct.Text ;
    gsBCharge    := edSimBCharge.Text ;
    gsStatus     := cbSimStatus.Text ;
    if (cbSimStatus.Text = 'CONNECTION-ERROR') then gsConError := cConErrorSim else gsConError := cConErrorNone ;
    if (cbSimStatus.Text = 'CONNECTION-ERROR') then
    begin
      gsStatus     := cStatusError ;
      gsStatusText := cStatusTextError ;
    end;
  end;
  if cbSimOnNUT.Checked then
  begin
    gsNUTTimeLeft:= edSimTimeLeft.Text ;
    gsNUTLoadPct := edSimLoadPct.Text ;
    gsNUTBCharge := edSimBCharge.Text ;
    gsNUTStatus  := cbSimStatus.Text ;
    if (cbSimStatus.Text = 'CONNECTION-ERROR') then gsNUTConError := cConErrorSim else gsNUTConError := cConErrorNone ;
    if (cbSimStatus.Text = 'CONNECTION-ERROR') then
    begin
      gsNUTStatus     := cNUTStatusError ;
      gsNUTStatusText := cStatusTextError ;
    end;
  end;
end;

procedure TfUpsMonitorMain.seIntervalPollChange(Sender: TObject);
// change the timer intervall for the connection, NOT for the data polling timer !
begin
  // Timer can only be activated while waiting !
  tiUpsDConnect.Interval := seIntervalPoll.Value * 60000 ;
  giTimerStatus := cTiWaiting ;
end;

procedure TfUpsMonitorMain.sgStatusDblClick(Sender: TObject);
// minimize / maximize the APC Status and Events StringGrids
begin
  if sender = sgStatus then
  begin
    if (sgStatus.Height = tsInfo.Height ) then
    begin
      sgStatus.Top    := 0 ;
      sgStatus.Height := tsInfo.Height div 2 ;
      sgEventsS.Top   := tsInfo.Height div 2 ;
      sgEventsS.Height:= tsInfo.Height div 2 ;
    end
    else
    begin
      sgStatus.Top    := 0 ;
      sgStatus.Height := tsInfo.Height ;
      sgStatus.BringToFront;
    end;
  end;

  if sender = sgEventsS then
  begin
    if (sgEventsS.Height = tsInfo.Height ) then
    begin
      sgStatus.Top    := 0 ;
      sgStatus.Height := tsInfo.Height div 2 ;
      sgEventsS.Top   := tsInfo.Height div 2 ;
      sgEventsS.Height:= tsInfo.Height div 2 ;
    end
    else
    begin
      sgEventsS.Top    := 0 ;
      sgEventsS.Height := tsInfo.Height ;
      sgEventsS.BringToFront;
    end;
  end;
end;

procedure TfUpsMonitorMain.bbShowMoreClick(Sender: TObject);
// add Version Info to the Splash- and About-Screens
begin
  SplashAbout.UserTitle     := RxVersionInfo.ProductName ;
  SplashAbout.CreditText    := RxVersionInfo.LegalCopyright ;
  SplashAbout.Description   := RxVersionInfo.FileDescription ;
  SplashAbout.ShowAbout ;
end;

procedure TfUpsMonitorMain.bbShowEvenMoreClick(Sender: TObject);
// Show the Lazarus Promotion Form
begin
  LazarusPowered.ShowPoweredByForm ;
end;

procedure TfUpsMonitorMain.bbTestChangeTrayIconClick(Sender: TObject);
// some Tests - can be removed anytime
begin
//  ImageListTray.GetIcon(RandomRange(0,23),   TrayIcon.Icon);
  acAnimateTrayIcon.Execute ;
end;

procedure TfUpsMonitorMain.btTestResetPosClick(Sender: TObject);
// Reset the screen position for all Forms to default (center main screen)
begin
  fUpsMonitorMain.Top   := (Screen.Height - cMainFormHeight) div 2  ;
  fUpsMonitorMain.Left  := (Screen.Width - cMainFormWidth) div 2  ;
  fUpsMonitorMain.Height:= cMainFormHeight ;
  fUpsMonitorMain.Width := cMainFormWidth ;
  fAPCMiniView.Top         := (Screen.Height - cMiniViewHeight) div 2  ;
  fAPCMiniView.Left        := (Screen.Width - cMiniViewWidth) div 2  ;
  fAPCMiniView.Height      := cMiniViewHeight ;
  fAPCMiniView.Width       := cMiniViewWidth ;
  giAPCMiniViewTop         := fAPCMiniView.Top ; ;
  giAPCMiniViewLeft        := fAPCMiniView.Left ;
end;

procedure TfUpsMonitorMain.btTestConnectionClick(Sender: TObject);
// manualy connect to APC via a separate Test Dataport
begin
  if dpUpsDManual.Active then dpUpsDManual.Close();
  dpUpsDManual.RemoteHost:= edApcUpsDServer.Caption;
  dpUpsDManual.RemotePort:= IntToStr(seApcUpsDPort.Value);
  dpUpsDManual.Active := True ;
  dpUpsDManual.Open();
end;

procedure TfUpsMonitorMain.dpUpsDManualOpen(Sender: TObject);
// log what we are doing on test connection
begin
  mmTestLog.Append('DataPort.Open: ' + 'Connection established') ;

  // chose which command we want to send
  // ApcUpsD knows only two commands:
  // status -> Information about the UPS
  // events -> Events logged by the UPS
//  if (rbStatus.Checked) or (giStatStatus = cActive) then
  if (rbStatus.Checked) then
  begin
    dpUpsDManual.Push(#00+#06+'status');  // send msg.length + msg: 'status'
    mmTestLog.Append('DataPort.Push: ' + 'Command <status> sent') ;
  end
  else
//  if (rbEvents.Checked) or (giStatEvents = cActive) then
  if (rbEvents.Checked)  then
  begin
    dpUpsDManual.Push(#00+#06+'events');  // send msg.length + msg: 'events'
    mmTestLog.Append('DataPort.Push: ' + 'Command <events> sent') ;
  end ;
end;

procedure TfUpsMonitorMain.dpUpsDManualDataAppear(Sender: TObject);
// Receive the response from APC on manual connection
begin
  // The response is a series of messages that consist of the first 2 bytes which are the
  // response length, followed by the response itself, followed by a newline (#10).
  // The last message has a zero in the 2 bytes of the response length (#0#0)

  // get all messages in one shot
  gsRawData := gsRawData + dpUpsDManual.Pull() ;

  // Close the connection when all data received
  // When we receive a #00#00 the transmission is completed
  if Pos(#00#00, gsRawData) > 0 then
  begin
    gsLastConnect := DateTimeToStr(now) ;
    dpUpsDManual.Close();
  end;
end;

procedure TfUpsMonitorMain.dpUpsDManualError(Sender: TObject; const AMsg: string
  );
// when there is an error during test connect we log it
begin
  mmTestLog.Append(sLineBreak);
  mmTestLog.Append('DataPort.OnError: ' + AMsg + sLineBreak);
end;

procedure TfUpsMonitorMain.dpUpsDManualClose(Sender: TObject);
// close the test connection
var
  i : LongInt ;
  sLine : AnsiString ;
  iBegin, iLength : Integer ;
begin
  dpUpsDManual.Active := False ;
  // depending on what kind of msgs we received send them
  // to the info-var or events-var for further processing
  if (rbStatus.Checked) and (gsRawData > '') then gsRawStatus := gsRawData;
  if (rbEvents.Checked) and (gsRawData > '') then gsRawEvents := gsRawData;

  // log what we are doing
  mmTestLog.Append('DataPort.OnDataAppear: ' + 'Receiving data') ;
  mmTestLog.Append('DataPort.OnClose: ' + 'Connection closed');
  mmTestLog.Append('DataPort.DataReceived: '  + sLineBreak);

  // show the received data - only for testing
  iBegin := 3 ;
  sLine  := '' ;
  for i := 1 to Length(gsRawData) do
  begin
    edData.Text := edData.Text + IntToStr(Ord(gsRawData[i])) + '.' ;

    // we found a linefeed char this means the msg line ends here
    if gsRawData[i] = #10 then
    begin
      // we extract that line
      iLength := i - iBegin ;
      sLine := sLine + Copy(gsRawData,iBegin,iLength) + #13#10 ;

      // set the begin of the next msg line - we ignore the first two chars
      // as they contain only the length of the next msg as byte values
      // which contain control codes - we don't want them in our text
      iBegin := i + 3 ;
    end;
  end;
  mmTestLog.Append(sLine) ;

  // Proccess the received data - same as regular data
  gsRawData := '' ;
  acAPCGenUpsStatus.Execute ;
  acAPCGenUpsEvents.Execute ;
  acAPCUpdateStatusBar.Execute ;
end;

procedure TfUpsMonitorMain.mmTestLogDblClick(Sender: TObject);
// clear the test logbook
begin
  if MessageDlg('Delete all Logbook Entries ? ', mtConfirmation, [mbOK, mbCancel],0) = mrOk then
  begin
    mmTestLog.Text := '' ;
  end;
end;

procedure TfUpsMonitorMain.btTestNUTConnectClick(Sender: TObject);
// manualy connect to NUT via a separate Test Dataport
begin
  if dpTestNUT.Active then dpTestNUT.Close();
  dpTestNUT.RemoteHost:= '192.168.2.35';
  dpTestNUT.RemotePort:= '3493';
  gsTest := 'USERNAME admin' + #10 + 'PASSWORD 1111' + #10 + 'LIST VAR asustor' + #10 ;
  mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.Start: ' + 'Connecting ...') ;
  dpTestNUT.Active := True ;
  dpTestNUT.Open();
end;

procedure TfUpsMonitorMain.dpTestNUTOpen(Sender: TObject);
// log what we are doing on manual NUT connection
begin
  mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.Open: ' + 'Connection established') ;

  // chose which command we want to send
  if cbTestSendLogin.Checked then
  begin
    dpTestNUT.Push(gstest + #10) ;
    mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.Push: ' + gsTest + ' sent') ;
  end;
end;

procedure TfUpsMonitorMain.dpTestNUTDataAppear(Sender: TObject);
// Receive the response from manual NUT connection
var s : String ;
begin
  // get all messages in one shot
  s := dpTestNUT.Pull() ;
  gsRawData := gsRawData + s ;

  if not cbTestSendLogin.Checked then
  begin
    mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.OnDataAppear: ' + s + sLineBreak) ;
  end
  else
  begin
    mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.OnDataAppear: ' + 'start receiving data') ;

    // When we receive a 'END LIST VAR' the transmission is completed
    if Pos('END LIST VAR', gsRawData) > 0 then
    begin
      mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.OnDataAppear: ' + 'stopped receiving data ') ;
      dpTestNUT.Close();
    end;
  end ;
end;

procedure TfUpsMonitorMain.dpTestNUTError(Sender: TObject; const AMsg: string);
// when there is an error on manual NOT connection we log it
begin
  mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.OnError: ' + AMsg );
end;

procedure TfUpsMonitorMain.dpTestNUTClose(Sender: TObject);
// close manual NUT connection
var
  i : LongInt ;
  sLine : AnsiString ;
  iBegin, iLength : Integer ;
begin
  dpTestNUT.Active := False ;

  // log what we are doing
  mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.OnClose: ' + 'Connection closed' + #13 );
  mmTestLog.Append(DateTimeToStr(now) + ' NUTDataPort.End: RawData received: ' + #13 );

  // show the received data - only for testing
  sLine  := '' ;
  iBegin := 0 ;
  for i := 1 to Length(gsRawData) do
  begin
    edData.Text := edData.Text + IntToStr(Ord(gsRawData[i])) + '.' ;

    // we found a linefeed char this means the msg line ends here
    if gsRawData[i] = #10 then
    begin
      // we extract that line
      iLength := i - iBegin ;
      sLine := sLine + Copy(gsRawData,iBegin,iLength) + #13#10 ;

      // set the begin of the next msg line - we ignore the first two chars
      // as they contain only the length of the next msg as byte values
      // which contain control codes - we don't want them in our text
      iBegin := i + 1 ;
    end;
  end;
  mmTestLog.Append(sLine) ;

  // Proccess the received data - same as regular data
  gsRawData := '' ;
end;

procedure TfUpsMonitorMain.btNUTSendClick(Sender: TObject);
// manualy send data TO the NUT connection
begin
  dpTestNUT.Push(edTest.Text);
  mmTestLog.Append('NUTDataPort.Push via SendClick: ' + edTest.Text) ;
end;

procedure TfUpsMonitorMain.btNUTDisconnectClick(Sender: TObject);
// manualy close the NUT connection
begin
  dpTestNUT.Close();
  mmTestLog.Append('NUTDataPort.Close via CloseClick ') ;
end;

procedure TfUpsMonitorMain.edTestExit(Sender: TObject);
// when sending NUT commands they must be terminated with a LF
begin
   edTest.Text := edTest.Text + #10 ;
end;

function Before(const SubStr : String; const s : String; Position : Integer = 1) : String;
// Returns a string before a SubString
var p : Integer;
begin
  p := Pos(SubStr, s, Position);
  if p<=0
    then Result := s
    else Result := System.Copy(s, 1, p-1);
end;

function After(const SubStr : String; const s : String; Position : Integer = 1) : String;
// Returns a string AFTER a substr
var p : Integer;
begin
  p := Pos(SubStr, s, Position);
  if p<=0
    then Result := ''
    else Result := System.Copy(s, p+Length(SubStr), Length(s));
end;

function Between(const SubStr1, SubStr2 : String; const s : String; StartPos : Integer ) : String;
// Returns a string BETWEEN two substr
var EndPos : Integer;
begin
  EndPos := -1 ; //added FW - avoid Compiler Warning
  if PosBetween(SubStr1, SubStr2, s, StartPos, EndPos)>0
    then Result := System.Copy(s, StartPos, (EndPos-StartPos)+1)
    else Result := '';
end;

function PosBetween(const SubStr1, SubStr2 : String; const s : String; var StartPos, EndPos : Integer; IgnoreCase : Boolean = False) : Integer;
//*PosBetween - Scans s for the start/end combination of SubStr1, SubStr2 and
// returns the StartPos and EndPos of the text between them.
// If a combination is found StartPos/Result will be the first character
// after SubStr1, and EndPos the character before SubStr2.
// If not found then StartPos will be unaffected and EndPos/Result will be -1
// If SubStr2 is empty SubStr2 will be regarded as identical to SubStr1.
var    i,p1 : Integer;
          c : Integer;
  Identical : Boolean;
       SLen : Integer;
    SubLen1 : Integer;
    SubLen2 : Integer;
  Sub1, Sub2 : PString;

   function IPos(ps : PString; SubLen : Integer) : Boolean;
   var  j : Integer;
       si : Integer;
   begin
     Result := False;
     si := i;
     if IgnoreCase
      then begin if gaANSIUpperArray[s[si]] <> gaANSIUpperArray[ps^[1]] then Exit; end
      else begin if s[si] <> ps^[1] then Exit; end;
     if SubLen>1 then
     begin
       if si+SubLen > SLen+1 then
       begin
         Exit;
       end;
       if IgnoreCase then
       begin
         for j := 2 to SubLen do
         begin
           Inc(si);
           if gaANSIUpperArray[ps^[j]] <> gaANSIUpperArray[s[si]] then
           begin
             i := si-1;
             Exit;
           end;
         end;
       end else
       begin
         for j := 2 to SubLen do
         begin
           Inc(si);
           if ps^[j] <> s[si] then
           begin
             i := si-1;
             Exit;
           end;
         end;
       end;
     end;
     Result := True;
   end;

begin
  EndPos := -1;
  Result := -1;
  Slen := Length(s);
  SubLen1:=Length(SubStr1);
  if SubLen1=0 then Exit;
  if SubLen1>SLen then Exit;
  SubLen2:=Length(SubStr2);
  Identical := SubLen2=0;
  EndPos := -1;
  Sub1:=@SubStr1;
  if Identical then
  begin
    SubLen2:=SubLen1;
    Sub2:=@SubStr1;
  end else Sub2:=@SubStr2;
  if StartPos<1
    then i := 1
    else i := StartPos;
  c  := 0;
  p1 := 0;
  while i<=SLen do
  begin
    if IPos(Sub2, SubLen2) then
    begin
      if c=0 then
      begin
        if IPos(Sub1, SubLen1) then
        begin
          p1 := i;
          Inc(c);
        end else Break;
      end else
      begin
        Dec(c);
        if c=0 then
        begin
          StartPos := p1 + SubLen1;
          Result := StartPos;
          EndPos := i-1;
          Break;
        end;
      end;
    end else if IPos(Sub1, SubLen1) then
    begin
      if c=0 then p1 := i;
      Inc(c);
    end;
    Inc(i);
  end;
end;

function StrFloat(Value : Extended; aFormatStr : String = '0.00###'; Padlen : SmallInt = 0; PadChar : Char = ' ') : String;
// Convert FloatToStr
begin
  try
    Result := SysUtils.FormatFloat(aFormatStr, Value);
  except
    Result := '';
  end;
  if PadLen<>0 then Result := Pad(Result, -PadLen, PadChar)
end;

function Pad(const s : String; PadLen : SmallInt; c : Char = ' ') : String;
// Ads a character at the end of the string until the length is equal to PadLen.
// If PadLen is negative the character will be inserted to the left.
var  i : Integer;
  More : Integer;
  Slen : Integer;
begin
  Result := '' ; //added FW - avoid Compiler Warning
  SLen := Length(s);
  More := Abs(PadLen) - Slen;
  if More>0 then
  begin
    if PadLen<0 then
    begin
      SetLength(Result, Abs(PadLen));
      if Slen>0 then System.Move(s[1], Result[More+1], Slen);
      for i := 1 to More do Result[i] := c;
    end else
    begin
      Result := s;
      SetLength(Result, Abs(PadLen));
      for i := SLen+1 to Slen+More do Result[i] := c;
    end;
  end else Result := s;
end;


end.

