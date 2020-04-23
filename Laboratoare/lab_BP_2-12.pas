Type
  Date = record
    d:1..31;
    m:1..12;
    y:word;
  end;
  Passengers = record
    name: string;
    distanation: string;
    departureDate: Date;
  end;
  Stack = ^Node;
  Node = record
    Info: Passengers;
    Next: Stack;
  end;
Var
  ListOfPassengers, tmp: Stack;
  key:integer;
  datePoint: Date;
Begin
  
  // Создание списка пассажиров
  
  ListOfPassengers := nil;
  key := 1;
  While ( key = 1 ) do
    begin
      new(tmp);
      Writeln('Добавьте данные пассажира:');
      Writeln('Введите имя пассажира: ');
      Readln(tmp^.Info.name);
      Writeln('Направление(Страна): ');
      Readln(tmp^.Info.distanation);
      Writeln('Дата отправления: ');
      Readln(tmp^.Info.departureDate.d, tmp^.Info.departureDate.m, tmp^.Info.departureDate.y);
      tmp^.Next := ListOfPassengers;
      ListOfPassengers := tmp;
      Write('Есть еще пассажиры?: ');
      Readln(key);
    end;
  
  // Какие пассажиры остались после n даты вылета
  
  Write('Введите дату вылета:' );
  Readln(datePoint.d, datePoint.m, datePoint.y);
  tmp := ListOfPassengers;
  Writeln('Имена пассажиров, которые остались после вылета самолета ', datePoint.d,'.', datePoint.m,'.', datePoint.y );
  While ( tmp <> nil ) do
    begin
      if (tmp^.Info.departureDate.d > datePoint.d) and (tmp^.Info.departureDate.m >= datePoint.m) and (tmp^.Info.departureDate.y >= datePoint.y) then
        Writeln(tmp^.Info.name)
      else
        if (tmp^.Info.departureDate.m > datePoint.m) and (tmp^.Info.departureDate.y >= datePoint.y) then
          Writeln(tmp^.Info.name)
        else
          if (tmp^.Info.departureDate.y > datePoint.y) then
            Writeln(tmp^.Info.name);
      tmp := tmp^.Next;
    end;
End.