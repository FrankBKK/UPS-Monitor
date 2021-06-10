unit uAPCMiniView;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls, A3nalogGauge,
  cySimpleGauge;

type

  { TfAPCMiniView }

  TfAPCMiniView = class(TForm)
    cyBattery: TcySimpleGauge;
    imLoad: TA3nalogGauge;
    lbUPSactive: TLabel;
    pnMiniRuntime: TPanel;
    sbMinimize: TSpeedButton;
    sbAPCInfo: TSpeedButton;
    sbMove: TSpeedButton;
    sbStatus: TSpeedButton;
    sbNUTInfo: TSpeedButton;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbNUTInfoClick(Sender: TObject);
    procedure sbAPCInfoClick(Sender: TObject);
    procedure sbMinimizeClick(Sender: TObject);
    procedure sbStatusClick(Sender: TObject);
  private
  public

  end;

procedure SaveFormPosition ;

var
  fAPCMiniView: TfAPCMiniView;
  MouseIsDown: boolean;
  PX, PY: integer;

implementation

{$R *.lfm}

{ TfAPCMiniView }

uses uUpsMonitorMain ;

procedure SaveFormPosition ;
// save the current MiniView position
begin
  fUpsMonitorMain.giAPCMiniViewTop  := fAPCMiniView.Top ;
  fUpsMonitorMain.giAPCMiniViewLeft := fAPCMiniView.Left ;
  fUpsMonitorMain.acSaveSettings.Execute ;
end;

procedure TfAPCMiniView.FormCreate(Sender: TObject);
// initialize the form
begin
  Top                 := fUpsMonitorMain.giAPCMiniViewTop ;
  Left                := fUpsMonitorMain.giAPCMiniViewLeft ;
  imLoad.OnClick      := fAPCMiniView.OnDblClick ;
  imLoad.PopupMenu    := fUpsMonitorMain.pmUpsMonitor;
  cyBattery.PopupMenu := fUpsMonitorMain.pmUpsMonitor;
end;

procedure TfAPCMiniView.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  SaveFormPosition ;
end;

procedure TfAPCMiniView.FormDblClick(Sender: TObject);
// switch MiniView on/off
begin
  SaveFormPosition ;
  if fAPCMiniView.Visible then fAPCMiniView.Hide else fAPCMiniView.Show ;
end;

procedure TfAPCMiniView.FormHide(Sender: TObject);
begin
  SaveFormPosition ;
end;

procedure TfAPCMiniView.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Start to move around the MiniView
begin
  if Button = mbLeft then begin
    MouseIsDown := True;
    PX := X;
    PY := Y;
  end;
end;

procedure TfAPCMiniView.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// move the MiniView around while LMB is down
begin
  if MouseIsDown then begin
    SetBounds(Left + (X - PX), Top + (Y - PY), Width, Height);
  end;
end;

procedure TfAPCMiniView.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Show the MiniView at the current mouse coordinates
begin
  MouseIsDown:=False;
  Show ;
  SaveFormPosition ;
end;

procedure TfAPCMiniView.sbNUTInfoClick(Sender: TObject);
// show the mainform and go to the NUT data sheet
begin
  if (fUpsMonitorMain.Visible and fUpsMonitorMain.tsNUTInfo.Visible)
  then fUpsMonitorMain.Hide
  else fUpsMonitorMain.acNUTInfoExecute(self);
end;

procedure TfAPCMiniView.sbAPCInfoClick(Sender: TObject);
// show the mainform and go to the APC data sheet
begin
  if (fUpsMonitorMain.Visible and fUpsMonitorMain.tsInfo.Visible)
  then fUpsMonitorMain.Hide
  else fUpsMonitorMain.acAPCInfoExecute(self);
end;

procedure TfAPCMiniView.sbMinimizeClick(Sender: TObject);
// Hide the Mainform and switch Miniview on/off
begin
  SaveFormPosition ;
  fUpsMonitorMain.Hide ;
  if fAPCMiniView.Visible then fAPCMiniView.Hide else fAPCMiniView.Show ;
end;

procedure TfAPCMiniView.sbStatusClick(Sender: TObject);
// switch MiniView between APC and NUT
begin
  with fUpsMonitorMain do
  begin
     if gsAPCMiniViewShowWhat = 'APC' then gsAPCMiniViewShowWhat := 'NUT' else gsAPCMiniViewShowWhat := 'APC' ;
     acUpdateAPCMiniViewExecute(self) ;
  end;
end;

end.

