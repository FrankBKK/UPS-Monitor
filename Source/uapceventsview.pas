unit uAPCEventsView;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, ExtCtrls, Buttons;

type

  { TfAPCEventsView }

  TfAPCEventsView = class(TForm)
    Panel1: TPanel;
    sbMinimize: TSpeedButton;
    sbMove: TSpeedButton;
    sgEventsS: TStringGrid;
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
  fAPCEventsView: TfAPCEventsView;
  MouseIsDown: boolean;
  PX, PY: integer;

implementation

{$R *.lfm}

uses uUpsMonitorMain ;

procedure SaveFormPosition ;
begin
  // save the current MiniView position
  fUpsMonitorMain.giAPCEventsMiniViewTop  := fAPCEventsView.Top ;
  fUpsMonitorMain.giAPCEventsMiniViewLeft := fAPCEventsView.Left ;
end;

{ TfAPCEventsView }

procedure TfAPCEventsView.FormCreate(Sender: TObject);
// initialize the form
begin
  Top  := fUpsMonitorMain.giAPCEventsMiniViewTop ;
  Left := fUpsMonitorMain.giAPCEventsMiniViewLeft ;
end;

procedure TfAPCEventsView.sbMinimizeClick(Sender: TObject);
// switch MiniView on/off
begin
  SaveFormPosition ;
  if fAPCEventsView.Visible then fAPCEventsView.Hide else fAPCEventsView.Show ;
end;

procedure TfAPCEventsView.sbMoveMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Start to move around the MiniView
begin
  if Button = mbLeft then begin
    MouseIsDown := True;
    PX := X;
    PY := Y;
  end;
end;

procedure TfAPCEventsView.sbMoveMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
// move the MiniView around while LMB is down
begin
  if MouseIsDown then begin
    SetBounds(Left + (X - PX), Top + (Y - PY), Width, Height);
  end;
end;

procedure TfAPCEventsView.sbMoveMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
// Show the MiniView at the current mouse coordinates
begin
  MouseIsDown:=False;
  Show ;
  SaveFormPosition ;
end;

end.

