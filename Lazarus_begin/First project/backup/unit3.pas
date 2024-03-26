unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, math, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm3 }

  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Edit1Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Edit1Change(Sender: TObject);
begin

end;

procedure TForm3.Memo1Change(Sender: TObject);
var K1,K2:integer;
  k3:float;
  K4:string;
begin
  K1:=StrToInt(Edit1.Text);
  K2:=StrToInt(Edit2.Text);
  K3 := power(k1,k2);
  K4 := IntToStr(k3);
  memo1.Lines.add('число '+Edit1.Text+' в степени '+Edit2.Text+' равно: '+ K4);
end;

end.

