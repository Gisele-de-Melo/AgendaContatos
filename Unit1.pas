//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections;

type

  TContato = record
    Nome: string;
    Telefone: string;
    Email: string;
  end;

  TForm1 = class(TForm)
    ListBoxContatos: TListBox;
    btnAdicionar: TButton;
    edtNome: TEdit;
    lblNome: TLabel;
    btnEditar: TButton;
    btnRemover: TButton;
    btnBuscar: TButton;
    edtTelefone: TEdit;
    lblTelefone: TLabel;
    edtEmail: TEdit;
    lblEmail: TLabel;
    edtBuscar: TEdit;
    lblBuscar: TLabel;
    btnAtualizar: TButton;
    lblListaContatos: TLabel;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
  private
    { Private declarations }
    ListaContatos: TList<TContato>;
    procedure AdicionarContato;
    procedure AtualizarListaContatos;
    procedure EditarContato;
    procedure RemoverContato;
    procedure BuscarContato;
    procedure SalvarContatos;
    procedure CarregarContatos;
    procedure LimparCampos;
    procedure LimparBusca;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.AtualizarListaContatos;
var
  Contato: TContato;
begin
  ListBoxContatos.Items.Clear;
  for Contato in ListaContatos do
    ListBoxContatos.Items.Add(Contato.Nome + ' - ' + Contato.Telefone + ' - ' + Contato.Email);
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
begin
  AdicionarContato;
  LimparCampos;
end;

procedure TForm1.btnAtualizarClick(Sender: TObject);
begin
  AtualizarListaContatos;
end;

procedure TForm1.btnBuscarClick(Sender: TObject);
begin
  BuscarContato;
  LimparBusca;
end;

procedure TForm1.btnEditarClick(Sender: TObject);
begin
  EditarContato;
end;

procedure TForm1.btnRemoverClick(Sender: TObject);
begin
  RemoverContato;
end;

procedure TForm1.AdicionarContato;
var
  Contato: TContato;
begin
  Contato.Nome := edtNome.Text;
  Contato.Telefone := edtTelefone.Text;
  Contato.Email := edtEmail.Text;
  ListaContatos.Add(Contato);
  SalvarContatos;
  AtualizarListaContatos;
end;

procedure TForm1.EditarContato;
var
  Contato: TContato;
  Index: Integer;
begin
  Index := ListBoxContatos.ItemIndex;
  if Index <> -1 then
  begin
    Contato := ListaContatos[Index];
    Contato.Nome := edtNome.Text;
    Contato.Telefone := edtTelefone.Text;
    Contato.Email := edtEmail.Text;
    ListaContatos[Index] := Contato;
    SalvarContatos;
    AtualizarListaContatos;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListaContatos := TList<TContato>.Create;
  CarregarContatos;
end;

procedure TForm1.LimparBusca;
begin
  edtBuscar.Clear;
  edtBuscar.SetFocus;
end;

procedure TForm1.LimparCampos;
begin
  edtNome.Clear;
  edtTelefone.Clear;
  edtEmail.Clear;
  edtNome.SetFocus;
end;

procedure TForm1.RemoverContato;
var
  Index: Integer;
  Nome, Telefone, Email: String;
begin
  if ListBoxContatos.Count <> ListaContatos.Count then
  begin
    ShowMessage('Atualize a lista antes de remover.');
    Exit;
  end;

  Index := ListBoxContatos.ItemIndex;

  if Index <> -1 then
  begin
    ListaContatos.Delete(Index);
    SalvarContatos;
    AtualizarListaContatos;
  end;
end;

procedure TForm1.BuscarContato;
var
  Contato: TContato;
  NomeBusca: string;
begin
  NomeBusca := edtBuscar.Text;
  ListBoxContatos.Items.Clear;
  for Contato in ListaContatos do
    if Pos(LowerCase(NomeBusca), LowerCase(Contato.Nome)) > 0 then
      ListBoxContatos.Items.Add(Contato.Nome + ' - ' + Contato.Telefone + ' - ' + Contato.Email);
end;

procedure TForm1.SalvarContatos;
var
  Contato: TContato;
  ContatoFile: TextFile;
  FileName: String;

begin
  FileName := ExtractFilePath(Application.ExeName) + 'Contatos.txt';
  AssignFile(ContatoFile, FileName);
  Rewrite(ContatoFile);
  for Contato in ListaContatos do
    Writeln(ContatoFile, Contato.Nome + '|' + Contato.Telefone + '|' + Contato.Email);
  CloseFile(ContatoFile);
end;

procedure TForm1.CarregarContatos;
var
  Contato: TContato;
  ContatoFile: TextFile;
  Linha: string;
  FileName: String;

begin
  FileName := ExtractFilePath(Application.ExeName) + 'Contatos.txt';

  if FileExists(FileName) then
  begin
    AssignFile(ContatoFile, FileName);
    Reset(ContatoFile);
    while not Eof(ContatoFile) do
    begin
      Readln(ContatoFile, Linha);
      Contato.Nome := Copy(Linha, 1, Pos('|', Linha) - 1);
      Delete(Linha, 1, Pos('|', Linha));
      Contato.Telefone := Copy(Linha, 1, Pos('|', Linha) - 1);
      Delete(Linha, 1, Pos('|', Linha));
      Contato.Email := Linha;
      ListaContatos.Add(Contato);
    end;
    CloseFile(ContatoFile);
    AtualizarListaContatos;
  end;
end;

end.
