object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Form Task-Thread'
  ClientHeight = 421
  ClientWidth = 664
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object lbResult: TLabel
    Left = 228
    Top = 72
    Width = 428
    Height = 341
    AutoSize = False
    WordWrap = True
  end
  object lbMemoryLeack: TLabel
    Left = 282
    Top = 13
    Width = 374
    Height = 44
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 8
    Width = 186
    Height = 23
    Date = 44495.000000000000000000
    Format = 'dd/MM/yyyy   HH:ss:'
    Time = 0.361082175928459000
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 8
    Top = 37
    Width = 216
    Height = 371
    TabOrder = 1
  end
  object Button1: TButton
    Left = 200
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Ativa'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 144
    Top = 136
  end
end
