unit uNUTMiniView;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls, Menus, Buttons, ExtCtrls, A3nalogGauge,
  cySimpleGauge;

type

  { TfNUTMiniView }

  TfNUTMiniView = class(TForm)
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
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
  fNUTMiniView: TfNUTMiniView;
  MouseIsDown: boolean;
  PX, PY: integer;

implementation

{$R *.lfm}

{ TfNUTMiniView }

uses uUpsMonitorMain ;

procedure SaveFormPosition ;
// save the current MiniView position
begin
  fUpsMonitorMain.giNUTMiniViewTop  := fNUTMiniView.Top ;
  fUpsMonitorMain.giNUTMiniViewLeft := fNUTMiniView.Left ;
  fUpsMonitorMain.acSaveSettings.Execute ;
end;

procedure TfNUTMiniView.FormCreate(Sender: TObject);
// initialize the form
begin
  Top                 := fUpsMonitorMain.giNUTMiniViewTop ;
  Left                := fUpsMonitorMain.giNUTMiniViewLeft ;
  imLoad.OnClick      := fNUTMiniView.OnDblClick ;
  imLoad.PopupMenu    := fUpsMonitorMain.pmUpsMonitor;
  cyBattery.PopupMenu := fUpsMonitorMain.pmUpsMonitor;
end;

procedure TfNUTMiniView.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  SaveFormPosition ;
end;

procedure TfNUTMiniView.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  SaveFormPosition ;
end;

procedure TfNUTMiniView.FormDblClick(Sender: TObject);
// switch MiniView on/off
begin
  SaveFormPosition ;
  if fNUTMiniView.Visible then fNUTMiniView.Hide else fNUTMiniView.Show ;
end;

procedure TfNUTMiniView.FormHide(Sender: TObject);
begin
  SaveFormPosition ;
end;

procedure TfNUTMiniView.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Start to move around the MiniView
begin
  if Button = mbLeft then begin
    MouseIsDown := True;
    PX := X;
    PY := Y;
  end;
end;

procedure TfNUTMiniView.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// move the MiniView around while LMB is down
begin
  if MouseIsDown then begin
    SetBounds(Left + (X - PX), Top + (Y - PY), Width, Height);
  end;
end;

procedure TfNUTMiniView.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Show the MiniView at the current mouse coordinates
begin
  MouseIsDown:=False;
  Show ;
  SaveFormPosition ;
end;

procedure TfNUTMiniView.sbNUTInfoClick(Sender: TObject);
// show the mainform and go to the NUT data sheet
begin
  if (fUpsMonitorMain.Visible and fUpsMonitorMain.tsNUTInfo.Visible)
  then fUpsMonitorMain.Hide
  else fUpsMonitorMain.acNUTInfoExecute(self);
end;

procedure TfNUTMiniView.sbAPCInfoClick(Sender: TObject);
// show the mainform and go to the APC data sheet
begin
  if (fUpsMonitorMain.Visible and fUpsMonitorMain.tsInfo.Visible)
  then fUpsMonitorMain.Hide
  else fUpsMonitorMain.acAPCInfoExecute(self);
end;

procedure TfNUTMiniView.sbMinimizeClick(Sender: TObject);
// Hide the Mainform and switch Miniview on/off
begin
  SaveFormPosition ;
  fUpsMonitorMain.Hide ;
  if fNUTMiniView.Visible then fNUTMiniView.Hide else fNUTMiniView.Show ;
end;

procedure TfNUTMiniView.sbStatusClick(Sender: TObject);
// switch MiniView between APC and NUT
begin
  with fUpsMonitorMain do
  begin
     if gsNUTMiniViewShowWhat = 'APC' then gsNUTMiniViewShowWhat := 'NUT' else gsNUTMiniViewShowWhat := 'APC' ;
     acNUTUpdateMiniViewExecute(self) ;
  end;
end;

end.

