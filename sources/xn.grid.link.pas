unit xn.grid.link;

interface

uses xn.grid.common, xn.grid.data;

type
  TxnGridLink = class(TInterfacedObject, IxnGridData)
  private
    fDataSort: TxnGridDataSort;
    fDataFilter: TxnGridDataFilter;
  public
    constructor Create(aGridData: IxnGridData; aFilterItems: IxnGridFilterItems; aSortItems: IxnGridSortItems);
    destructor Destroy; override;
    procedure Fill; virtual;
    procedure Sort; overload;
    function Seek1(aKeys: TArray<variant>): integer;
    function Seek2(aKeys: TArray<variant>): integer;

    function RowCountGet: integer; virtual;
    function AsDebug: String; virtual;
    function ValueString(aCol, aRow: integer): String; virtual;
    function ValueFloat(aCol, aRow: integer): Double; virtual;
  end;

implementation

function TxnGridLink.AsDebug: String;
begin
  Result := fDataSort.AsDebug;
end;

constructor TxnGridLink.Create(aGridData: IxnGridData; aFilterItems: IxnGridFilterItems; aSortItems: IxnGridSortItems);
begin
  fDataFilter := TxnGridDataFilter.Create(aGridData, aFilterItems);
  fDataSort := TxnGridDataSort.Create(fDataFilter, aSortItems);
end;

destructor TxnGridLink.Destroy;
begin
  fDataSort.Free;
  inherited;
end;

procedure TxnGridLink.Fill;
begin
  fDataFilter.Fill;
  fDataSort.Fill;
end;

function TxnGridLink.RowCountGet: integer;
begin
  Result := fDataSort.RowCountGet;
end;

function TxnGridLink.Seek1(aKeys: TArray<variant>): integer;
begin
  Result := fDataSort.Seek1(aKeys);
end;

function TxnGridLink.Seek2(aKeys: TArray<variant>): integer;
begin
  Result := fDataSort.Seek2(aKeys);
end;

procedure TxnGridLink.Sort;
begin
  fDataSort.Sort;
end;

function TxnGridLink.ValueFloat(aCol, aRow: integer): Double;
begin
  Result := fDataSort.ValueFloat(aCol, aRow)
end;

function TxnGridLink.ValueString(aCol, aRow: integer): String;
begin
  Result := fDataSort.ValueString(aCol, aRow)
end;

end.
