unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, math, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var num_1, num_2, num_3 : integer;
  k : float;
begin
  me
  num_1 :=  StrtoInt(Edit1.text);
  num_2 :=  StrtoInt(Edit2.text);
  num_3 :=  StrtoInt(Edit3.text);
  while num_1 < num_2 do
  begin
       k := power(num_1, 2);
       memo1.Lines.add('число '+ InttoStr(num_1)+' в степени 2 равно: '+FloatToStr(k));
       num_1 := num_1 + num_3;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close();
end;

end.

