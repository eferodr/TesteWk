unit uFuncoes;

interface

uses uDM, FireDAC.Comp.Client;


function CriaQuery(Script: String): TFDQuery;

implementation

function CriaQuery(Script: String): TFDQuery;
begin
   Result := TFDQuery.Create(nil);
   Result.SQL.Text := Script;
   Result.Connection := Dm.FDConnection1;
end;

end.
