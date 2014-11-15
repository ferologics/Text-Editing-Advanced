unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { private declarations }
    var str,word:string;
    var ch,unevenChar:char;
    var numOfWords,desiredIndex,inWord:integer;
  public
    { public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var i:integer;
procedure TForm1.Button1Click(Sender: TObject);
begin // swap big characters with small characters
   str:= Form1.Edit1.Text;
   for i:=0 to length(str) do
       begin
            ch:= str[i];
            case ch of
                 'A'..'Z': str[i]:= char( (ord(ch) + 32) );
            end;
       end;
Form1.Memo1.Lines.Add(str);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin // clear memo
   Form1.Memo1.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin // swap small characters with big characters
   str:= Form1.Edit1.Text;
   for i:=0 to length(str) do
       begin
            ch:= str[i];
            case ch of
                 'a'..'z': str[i]:= char( (ord(ch) - 32) );
            end;
       end;
Form1.Memo1.Lines.Add(str);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin // swap characters at even position with uneven in string
   str:= Form1.Edit1.Text;
   for i:=0 to length(str) do
       begin
            ch:= str[i];
       end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin // count number of words in string
   str       := Form1.Edit1.Text;
   inWord    := 0;
   numOfWords:= 0;

   for i:=0 to length(str) do
       begin
            ch:= str[i];
            case ch of
                 'a'..'z','A'..'Z','0'..'9': if (inWord = 0) then
                                                begin
                                                     numOfWords +=1;
                                                     inWord     :=1;
                                                end;

                                        ' ': if (inWord = 1) then
                                                     inWord:=0;
            end;
       end;
   Form1.Memo1.Lines.Add('Number of words in the text: ' + IntToStr(numOfWords));
end;

procedure TForm1.Button6Click(Sender: TObject);
begin // write out words according to theyr index in string
   str         := (Form1.Edit1.Text + '  ');
   word        := '';
   inWord      := 0;
   numOfWords  := 0;
   desiredIndex:= StrToInt(Form1.Edit2.Text);

   for i:=0 to length(str) do

       if (desiredIndex = numOfWords) then
           begin
                Form1.Memo1.Lines.Add('The ' + IntToStr(desiredIndex) + '. word in the string is "' + word +'"');
                Break;
           end
       else
           begin
                ch:= str[i];
                case ch of
                     'a'..'z','A'..'Z','0'..'9': begin
                                                    if ( (desiredIndex = (numOfWords + 1)) ) then word += string(ch);
                                                    if (inWord = 0) then inWord:=1;
                                                 end;

                                            ' ': if (inWord = 1) then
                                                    begin
                                                       numOfWords +=1;
                                                       inWord     :=0;
                                                    end;
                end;
           end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin // write each word in string on new line
   str         := (Form1.Edit1.Text + '  ');
   inWord      := 0;
   numOfWords  := 0;

   for i:= 0 to length(str) do
       ch:= str[i];
       case ch of
            'a'..'z','A'..'Z','0'..'9': begin
                                           word += string(ch);
                                           if (inWord = 0) then inWord:= 1;
                                        end;

                                   ' ': begin
                                           if (inWord = 1) then
                                              begin
                                                 Form1.Memo1.Lines.Add(word);
                                                 //word:= '';
                                                 inWord:= 0;
                                              end;
                                        end;
       end;
end;
end.

































