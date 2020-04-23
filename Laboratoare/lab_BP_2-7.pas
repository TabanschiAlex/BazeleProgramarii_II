Type
   Coord = record
    x: real;
    y: real;
    length: real;
  end;
  Stack = ^Node;
  Node = record
    Info: Coord;
    Next: Stack;
  end;
Var
  coordList, tmp: Stack;
  key:integer;
  maxLength: real;
Begin
  
  // Создание списка координат
  
  coordList := nil;
  key := 1;
  While ( key = 1 ) do
    begin
      new(tmp);
      Writeln('Добавьте данные координат:');
      Writeln('Введите значение X: ');
      Readln(tmp^.Info.x);
      Writeln('Введите значение Y: ');
      Readln(tmp^.Info.y);
      
      // Вычисление длины отрезков (Правильнее было бы сделать вычесление через теорему Пифагора)
      
      if (tmp^.Info.x < 0) and (tmp^.Info.y < 0) then
        tmp^.Info.length := (tmp^.Info.x*(-1)) + (tmp^.Info.y*(-1))
      else
        if (tmp^.Info.y < 0) then
          tmp^.Info.length := tmp^.Info.x + tmp^.Info.y*(-1)
        else
          if (tmp^.Info.x < 0) then
            tmp^.Info.length := tmp^.Info.x*(-1) + tmp^.Info.y
          else
            tmp^.Info.length := tmp^.Info.x + tmp^.Info.y;
            
      tmp^.Next := coordList;
      coordList := tmp;
      Write('Есть еще координаты?: ');
      Readln(key);
    end;
    
    // Поиск максимальной длины у координат
    
    tmp := coordList;
    While ( tmp^.Next <> nil ) do
      begin
        if (tmp^.Info.length < tmp^.Next^.Info.length) then
          maxLength := tmp^.Next^.Info.length
        else
          maxLength := tmp^.Info.length;
        tmp := tmp^.Next;
      end;
    Write('Максимальный отрезок = ', maxLength)
End.