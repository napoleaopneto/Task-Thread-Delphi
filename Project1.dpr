program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FrmPrincipal};

{$R *.res}

begin
  Application.Initialize;

  ReportMemoryLeaksOnShutdown := true;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
