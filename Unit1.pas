unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Threading, Vcl.ComCtrls,
  Vcl.StdCtrls,StrUtils;

type
  TFrmPrincipal = class(TForm)
    Timer1: TTimer;
    DateTimePicker1: TDateTimePicker;
    Memo1: TMemo;
    Button1: TButton;
    lbResult: TLabel;
    lbMemoryLeack: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function CPF_LGPD(ACpf: String): String;
  public
    { Public declarations }
   i : integer;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  FTask: ITask;

implementation

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  if Button1.Caption = 'Ativa' then
  begin
    Timer1.Enabled := true;
    Button1.Caption := 'Desativa';
    FrmPrincipal.Caption := 'Task - Start';
  end else
   if Button1.Caption = 'Desativa' then
  begin
    Timer1.Enabled := false;
    Button1.Caption := 'Ativa';
    FrmPrincipal.Caption := 'Task - Stop';
  end;
end;

function TFrmPrincipal.CPF_LGPD(ACpf: String): String;
var x: Integer;
begin
  Result := ACpf;
  if trim(ACpf) = '' then
    exit;
  for x := 1 to 7 do
  begin
    if (Result[x] in ['0'..'9']) then
      Result[x] := '*';
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  i := 0;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  FTask := TTask.Run(procedure
    begin
      if Timer1.Interval <> 0 then
        TThread.Synchronize(TThread.CurrentThread,procedure
          begin
            FTask.CheckCanceled;
            DateTimePicker1.DateTime := Now;
            Memo1.Lines.Add(CPF_LGPD('115.456.980-23'));
            Inc(i);

            lbResult.Caption := lbResult.Caption + i.ToString + ' - ';

            case AnsiIndexStr(UpperCase(i.ToString), ['10', '20','30','40']) of
              0 : lbMemoryLeack.Caption := 'Ainda';
              1 : lbMemoryLeack.Caption := lbMemoryLeack.Caption + ' N?o';
              2 : lbMemoryLeack.Caption := lbMemoryLeack.Caption + ' Achamos';
              3 : lbMemoryLeack.Caption := lbMemoryLeack.Caption + ' Memory Leaks';
            end;

          end);
    end);
end;
end.
