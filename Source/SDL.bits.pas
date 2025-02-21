unit SDL.bits;

interface

uses
  SDL.Types,
  SDL.stdinc;

  function SDL_MostSignificantBitIndex32(AValue: Uint32): int; inline;
  function SDL_HasExactlyOneBitSet32(AValue: Uint32): bool; inline;

implementation

function SDL_MostSignificantBitIndex32(AValue: Uint32): int; inline;
var
  b                           : array[0..4] of Uint32;// = ($2, $C, $F0, $FF00, $FFFF0000);
  s                           : array[0..4] of int;// = (1, 2, 4, 8, 16);
  i                           : Integer;
begin
  Result                      := 0;

  b[0]                        := $2;
  b[1]                        := $C;
  b[2]                        := $F0;
  b[3]                        := $FF00;
  b[4]                        := $FFFF0000;
  s[0]                        := 1;
  s[1]                        := 2;
  s[2]                        := 4;
  s[3]                        := 8;
  s[4]                        := 16;

  if AValue = 0 then
    Exit(-1);

  for i := 4 downto 0 do
  begin
    if (AValue and b[i]) <> 0 then
    begin
      AValue                      := AValue shr s[i];
      Result                      := Result or s[i];
    end;
  end;
end;

function SDL_HasExactlyOneBitSet32(AValue: Uint32): bool; inline;
begin
  if (AValue <> 0) and not (AValue and (AValue - 1) = 0) then
    Result                      := True
  else
    Result                      := False;
end;

end.
