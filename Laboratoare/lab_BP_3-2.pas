Type
  Phrase = record
    phrase: string;
  end;
  Node = record
    info: Phrase;
    next: ^Node;
  end;
Var
  listOfWord, x: ^Node;
  
  Procedure CreateList;
  var
    option: integer;
  Begin
    option := 1;
    While ( option = 1 ) do
      begin
        new(x);
        Writeln('Введите слово: ');
        Readln(x^.info.phrase);
        x^.next := listOfWord;
        listOfWord := x;
        Write('Добавить слово?: ');
        Readln(option);
      end;
  End;
  
  Procedure IsPalindrome;
  var
    flag, i: integer;
  Begin
    x := listOfWord;
    While ( x <> nil ) do
      begin
        flag := 0;
        for i := 1 to length(x^.info.phrase) div 2 do
          begin
            if x^.info.phrase[i] <> x^.info.phrase[length(x^.info.phrase)-i+1] then 
              begin
                writeln('Слово ', x^.info.phrase, ' не палиндром');
                flag := 1;
                break;
              end
            else
              begin
                 writeln('Слово ', x^.info.phrase, ' палиндром');
                 break;
              end;
          end;
        x := x^.next;
      end;
  End;
  
Begin
  CreateList;
  IsPalindrome;
End.