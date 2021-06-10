program UPSMonitor;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, rxnew, poweredby, uUpsMonitorMain, uNUTminiview, uAPCMiniView, uAPCLogView, uNUTLogView, uAPCEventsView;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='UPS-Monitor';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfUpsMonitorMain, fUpsMonitorMain);
  Application.CreateForm(TfAPCMiniView, fAPCMiniView);
  Application.CreateForm(TfNUTMiniView, fNUTMiniView);
  Application.CreateForm(TfAPCLogView, fAPCLogView);
  Application.CreateForm(TfNUTLogView, fNUTLogView);
  Application.CreateForm(TfAPCEventsView, fAPCEventsView);
  Application.ShowMainForm := False ;
  Application.Run;
end.

