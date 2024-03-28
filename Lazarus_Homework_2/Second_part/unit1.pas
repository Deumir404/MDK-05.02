unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, math, Graphics, Dialogs, StdCtrls,
  Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    answer_d: TLabel;
    answer_S1: TLabel;
    BitBtn1: TBitBtn;
    Button_math: TButton;
    Edit_S: TEdit;
    Label1: TLabel;
    answer_a: TLabel;
    Label2: TLabel;
    Label_a: TLabel;
    Label_a1: TLabel;
    Label_a2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button_mathClick(Sender: TObject);
    procedure Label_a1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label_a1Click(Sender: TObject);
begin

end;

procedure TForm1.Button_mathClick(Sender: TObject);
var s, a,d, S1 :float;
begin
     s := StrToFloat(Edit_S.text);
     a := sqrt(s);
     d := sqrt(2 * power(a,2));
     S1 := pi()*power((d/2),2);
     answer_a.Caption:= FloatTostr(a)+ ' см';
     answer_d.Caption:= FloatTostr(d)+' см';
     answer_S1.Caption:= FloatTostr(S1)+' см^2';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

end;

end.

