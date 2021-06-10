unit uNUTLogView;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Buttons;

type

  { TfNUTLogView }

  TfNUTLogView = class(TForm)
    mmNUTLog: TMemo;
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
  fNUTLogView: TfNUTLogView;
  MouseIsDown: boolean;
  PX, PY: integer;

implementation

{$R *.lfm}

uses uUpsMonitorMain ;

procedure SaveFormPosition ;
begin
  // save the current MiniView position
  fUpsMonitorMain.giNUTLogMiniViewTop  := fNUTLogView.Top ;
  fUpsMonitorMain.giNUTLogMiniViewLeft := fNUTLogView.Left ;
end;

{ TfNUTLogView }

procedure TfNUTLogView.FormCreate(Sender: TObject);
// initialize the form
begin
  Top  := fUpsMonitorMain.giNUTLogMiniViewTop ;
  Left := fUpsMonitorMain.giNUTLogMiniViewLeft ;
end;

procedure TfNUTLogView.sbMinimizeClick(Sender: TObject);
// switch MiniView on/off
begin
  SaveFormPosition ;
  if fNUTLogView.Visible then fNUTLogView.Hide else fNUTLogView.Show ;
end;

procedure TfNUTLogView.sbMoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Start to move around the MiniView
begin
  if Button = mbLeft then begin
    MouseIsDown := True;
    PX := X;
    PY := Y;
  end;
end;

procedure TfNUTLogView.sbMoveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// move the MiniView around while LMB is down
begin
  if MouseIsDown then begin
    SetBounds(Left + (X - PX), Top + (Y - PY), Width, Height);
  end;
end;

procedure TfNUTLogView.sbMoveMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Show the MiniView at the current mouse coordinates
begin
  MouseIsDown:=False;
  Show ;
  SaveFormPosition ;
end;

end.

