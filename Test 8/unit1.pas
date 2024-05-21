unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image_logo: TImage;
    Open_button: TButton;
    Figure_combo: TComboBox;
    name_program: TLabel;
    procedure Open_buttonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses Unit2, Unit3, Unit4, Unit5;

{$R *.lfm}

{ TForm1 }



procedure TForm1.Open_buttonClick(Sender: TObject);
begin
  case Figure_combo.ItemIndex of
  0: Triangle_1.Show();
  1: Square.Show();
  2: Rectangle.Show();
  3: Circle.Show();
  end;
end;

end.

