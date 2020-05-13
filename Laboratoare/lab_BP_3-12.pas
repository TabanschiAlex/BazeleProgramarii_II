Type
  Cars = record
    regNumber: string;
    brand: string;
    color: string;
    numOfSeats: integer;
    pH:integer;
    typeOfFuel: string;
  end;
  List = ^Node;
  Node = record
    info: Cars;
    next: List;
  end;
Var
  first, last, listOfCars: List;
  command: string;
  
  Procedure EnterCar;
  var
    option: integer;
  Begin
    option := 1;
    While ( option = 1 ) do
      begin
        if ( first = nil ) then
          begin
            new(first);
            Writeln('Регистрационные номера: ');
            Readln(first^.info.regNumber);
            Writeln('Марка авто: ');
            Readln(first^.info.brand);
            Writeln('Цвет машины: ');
            Readln(first^.info.color);
            Writeln('Количество мест: ');
            Readln(first^.info.numOfSeats);
            Writeln('Мощность: ');
            Readln(first^.info.pH);
            Writeln('Тип топлива: ');
            Readln(first^.info.typeOfFuel);
            Write('Есть еще машина в очереди на въезд?: ');
            Readln(option);
            first^.next := nil;
            last := first;
          end
        else
          begin
            new(listOfCars);
            Writeln('Регистрационные номера: ');
            Readln(listOfCars^.info.regNumber);
            Writeln('Марка авто: ');
            Readln(listOfCars^.info.brand);
            Writeln('Цвет машины: ');
            Readln(listOfCars^.info.color);
            Writeln('Количество мест: ');
            Readln(listOfCars^.info.numOfSeats);
            Writeln('Мощность: ');
            Readln(listOfCars^.info.pH);
            Writeln('Тип топлива: ');
            Readln(listOfCars^.info.typeOfFuel);
            listOfCars^.next := nil;
            last^.next := listOfCars;
            last := listOfCars;
            Write('Есть еще машина в очереди на въезд?: ');
            Readln(option);
          end;  
      end;
  End;
  
  Procedure ExitCar;
  var
    regNumber: string;
  Begin
    if ( first = nil ) then
      Writeln('Нет машин')
    else
      begin
        listOfCars := first;
        first := first^.next;
        dispose(listOfCars);
      end;
  End;
  
  Procedure ShowList;
  Begin
    if ( first = nil ) then
      Writeln('Нет машин')
    else
      begin
        Writeln('Список машин, в порядке заезда: ');
        listOfCars := first;
        While ( listOfCars <> nil ) do
          begin
            Writeln(listOfCars^.info.regNumber, ' ', listOfCars^.info.brand, ' ',
                    listOfCars^.info.color, ' ',  listOfCars^.info.numOfSeats, ' ',
                    listOfCars^.info.pH, ' ', listOfCars^.info.typeOfFuel);
            listOfCars := listOfCars^.next;
          end;
      end;
  End;
  
Begin
  first := nil;
  repeat
    Writeln('"enter" - Добавить машину');
    Writeln('"delete" - Удалить машину 1 в списке');
    Writeln('"show" - Показать список');
    Writeln('"stop" - выход из программы');
    Readln(command);
    case command of
      'enter': EnterCar;
      'delete' : ExitCar;
      'show' : ShowList;
    else
      Writeln('Неправильная команда');
    end;
  until command = 'stop';
End.