unit uUpsMonitorAbout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Buttons, ExtCtrls,
  StdCtrls ;

type

  { TfAbout }

  TfAbout = class(TForm)
    BitBtn1: TBitBtn;
    imgAbout: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbTitel: TLabel;
    lbAuthor: TLabel;
    lbVersion: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgAboutClick(Sender: TObject);
  private

  public

  end;

var
  fAbout: TfAbout;

implementation

uses uUpsMonitorMain ;

{$R *.lfm}

{ TfAbout }

procedure TfAbout.BitBtn1Click(Sender: TObject);
begin
  Close ;
end;

procedure TfAbout.FormShow(Sender: TObject);
begin
   lbTitel.Caption  := fUpsMonitorMain.gsAppTitel ;
   lbVersion.Caption:= fUpsMonitorMain.gsAppVersion ;
   lbAuthor.Caption := fUpsMonitorMain.gsAppAuthor ;
end;

procedure TfAbout.imgAboutClick(Sender: TObject);
begin

end;

end.

