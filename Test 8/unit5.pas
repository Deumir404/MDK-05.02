unit Unit5;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TCircle }

  TCircle = class(TForm)
    answer_memo: TMemo;
    Button_math: TButton;
    Edit_a: TEdit;
    Qeustion: TLabel;
    cm: TLabel;
    procedure Button_mathClick(Sender: TObject);
  private

  public

  end;

var
  Circle: TCircle;

implementation

{$R *.lfm}

{ TCircle }

procedure TCircle.Button_mathClick(Sender: TObject);
var a : real;
begin
  a := StrtoFloat(Edit_a.text);
  if (a>0) then
     answer_memo.Lines.add('Площадь равна '+ Floattostr(a*a * pi()) + ' cm')
  else answer_memo.Lines.add('Круг не существует')
end;

end.

