unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TSquare }

  TSquare = class(TForm)
    Button_math: TButton;
    Edit_a: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button_mathClick(Sender: TObject);
  private

  public

  end;

var
  Square: TSquare;

implementation

{$R *.lfm}

{ TSquare }

procedure TSquare.Button_mathClick(Sender: TObject);
var a: real;
begin
  a := StrtoFloat(Edit_a.text);
  if (a>0) then
     Memo1.Lines.add('Площадь равна '+ Floattostr(a*a) + ' cm')
  else Memo1.Lines.add('Квадрат не существует')
end;

end.

