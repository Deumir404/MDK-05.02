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
    CBNote: TComboBox;
    eName: TEdit;
    eTelephone: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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

