unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { Tf_Edit }

  Tf_Edit = class(TForm)
    bSave: TBitBtn;
    bCancel: TBitBtn;
    CB_stock: TCheckBox;
    eName: TEdit;
    eDesc: TEdit;
    eProperty: TEdit;
    ePrice: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
  private

  public

  end;



var
  fEdit: Tf_Edit;

implementation

{$R *.lfm}

{ Tf_Edit }

procedure Tf_Edit.FormShow(Sender: TObject);
begin
  eName.SetFocus;
end;


end.

