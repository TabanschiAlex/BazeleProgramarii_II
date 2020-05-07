// Станция обслуживания должна обслужить N кликнтов. Время обслуживания каждого клиента
// известно заранее: клиенту I необходимо время T(i), 1 <= i <= n. Если хотим
// сократить общее время ожидания, тогда:
// a) всегда выбираем клиента с максимальным временем обслуживания, из оставшихся
// b) всегда выбираем клиента с минимальным временем обслуживания, из оставшихся

Program Service;
var
  clients: array of integer;
  quantity: integer;

procedure createArray (var clients: array of integer; var quantity: integer);
var
  i, serviceTimeMinute: integer;
begin
  Writeln('Введите количество клиентов: ');
  Readln(quantity);
  clients := new integer[quantity];
  
  for i := 0 to quantity - 1 do
    begin
      Write('Время обслуживания ', i + 1, ' клиента = ');
      Readln(serviceTimeMinute);
      clients[i] := serviceTimeMinute;
    end;
end;

procedure sortArray ( var clients: array of integer; option: integer);
var
  i, j, temp:integer;
begin
  begin
    for i := 0 to quantity - 1 do
      for j := i + 1 to quantity - 1 do
        if (option = 0) then
          if clients[i] > clients[j] then 
            begin
              temp := clients[i];
              clients[i] := clients[j];
              clients[j] := temp;
            end;
  end
  else
    if (option = 1) then
      begin
        for i := 0 to quantity - 1 do
          for j := i + 1 to quantity - 1 do
            if clients[i] < clients[j] then 
              begin
                temp := clients[i];
                clients[i] := clients[j];
                clients[j] := temp;
              end;
      end;
end;

procedure clientMaxTime(clientsMaxT: array of integer);
var
  i, amount: integer;
begin
  sortArray(clientsMaxT, 1);
  amount := 0;
  for i := 0 to quantity - 2 do
    begin
      amount := amount + clientsMaxT[i];
    end;
  Writeln('Общее время ожидания при сортировке с макс. временем = ', amount, ' мин или ', amount / 60, ' часов' );
end;

procedure clientMinTime(clientsMinT: array of integer);
var
  i, amount: integer;
begin
  sortArray(clientsMinT, 0);
  amount := 0;
  for i := 0 to quantity - 2 do
    begin
      amount := amount + clientsMinT[i];
    end;
  Writeln('Общее время ожидания при сортировке с мин. временем = ', amount, ' мин или ', amount / 60, ' часов' );
end;

Begin 
  createArray(clients, quantity);
  clientMaxTime(clients);
  clientMinTime(clients);
End.
  
  