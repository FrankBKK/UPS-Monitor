unit uAPCLogView;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type

  { TfAPCLogView }

  TfAPCLogView = class(TForm)
    mmLog: TMemo;
    Panel1: TPanel;
    sbMinimize: TSpeedButton;
    sbMove: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbMinimizeClick(Sender: TObject);
    procedure sbMoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbMoveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure sbMoveMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

procedure SaveFormPosition ;

var
  fAPCLogView: TfAPCLogView;
  MouseIsDown: boolean;
  PX, PY: integer;

implementation

{$R *.lfm}

uses uUpsMonitorMain ;

procedure SaveFormPosition ;
begin
  // save the current MiniView position
  fUpsMonitorMain.giAPCLogMiniViewTop  := fAPCLogView.Top ;
  fUpsMonitorMain.giAPCLogMiniViewLeft := fAPCLogView.Left ;
end;

{ TfAPCLogView }

procedure TfAPCLogView.FormCreate(Sender: TObject);
// initialize the form
begin
  Top  := fUpsMonitorMain.giAPCLogMiniViewTop ;
  Left := fUpsMonitorMain.giAPCLogMiniViewLeft ;
end;

procedure TfAPCLogView.sbMinimizeClick(Sender: TObject);
// switch MiniView on/off
begin
  SaveFormPosition ;
  if fAPCLogView.Visible then fAPCLogView.Hide else fAPCLogView.Show ;
end;

procedure TfAPCLogView.sbMoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Start to move around the MiniView
begin
  if Button = mbLeft then begin
    MouseIsDown := True;
    PX := X;
    PY := Y;
  end;
end;

procedure TfAPCLogView.sbMoveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// move the MiniView around while LMB is down
begin
  if MouseIsDown then begin
    SetBounds(Left + (X - PX), Top + (Y - PY), Width, Height);
  end;
end;

procedure TfAPCLogView.sbMoveMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Show the MiniView at the current mouse coordinates
begin
  MouseIsDown:=False;
  Show ;
  SaveFormPosition ;
end;

end.

