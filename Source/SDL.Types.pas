{================================================================================

  SDL(3) for Delphi

  https://github.com/SamJokO/PasSDL

  BSD 2-Clause License

  Copyright (c) 2025, SamJokO

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice, this
     list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright notice,
     this list of conditions and the following disclaimer in the documentation
     and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

================================================================================}
unit SDL.Types;

interface

const
{$IF DEFINED(MSWINDOWS)}
  LIB_SDL_NAME                = 'SDL3.dll';
{$ELSEIF DEFINED(MACOS)}
  LIB_SDL_NAME                = 'SDL3.dylib';
  {$IF DEFINED(IOS)}
  {$ELSE}
  {$ENDIF}
{$ELSEIF DEFINED(LINUX)}
  LIB_SDL_NAME                = 'SDL3.so';
{$ELSEIF DEFINED(ANDROID)}
  LIB_SDL_NAME                = 'SDL3.so';
{$ENDIF}

//type


function BindProcedure(const AHandle: THandle; const AFuncName: AnsiString): Pointer;
function IsLittleEndian: Boolean;



implementation

uses
  SDL_stdinc,
  SDL_assert,
  SDL_asyncio,
  SDL_audio,
  SDL_blendmode,
  SDL_camera,
  SDL_clipboard,
  SDL_pixels,
  SDL_inits,

  SDL_keyboard,

  SDL_surface,
  SDL_events,
  SDL_error,
{$IF DEFINED(MSWINDOWS)}
  Winapi.Windows,
{$ENDIF}
  System.SysUtils;

var
  FHandle                     : THandle;

function BindProcedure(const AHandle: THandle; const AFuncName: AnsiString): Pointer;
begin
  Result                      := GetProcAddress(AHandle, PAnsiChar(AFuncName));
  if Result = nil then
    raise Exception.CreateFmt('Can not bind SDL procedure [%s]', [AFuncName]);
end;

function IsLittleEndian: Boolean;
var
  vValue                      : Word;
  vByte                       : PByte;
begin
  vValue                      := $0102;
  vByte                       := @vValue;
  Result                      := vByte^ = $02;
end;

procedure InitDLL;
begin
  FHandle                     := LoadLibrary(LIB_SDL_NAME);
  if (FHandle <> 0) and (FHandle <> INVALID_HANDLE_VALUE) then
  begin
    SDL_stdinc.InitLibrary(FHandle);
    SDL_assert.InitLibrary(FHandle);
    SDL_asyncio.InitLibrary(FHandle);
    SDL_audio.InitLibrary(FHandle);
    SDL_blendmode.InitLibrary(FHandle);
    SDL_camera.InitLibrary(FHandle);
    SDL_clipboard.InitLibrary(FHandle);

    SDL_surface.InitLibrary(FHandle);
    SDL_events.InitLibrary(FHandle);
    SDL_pixels.InitLibrary(FHandle);

    SDL_keyboard.InitLibrary(FHandle);

    SDL_inits.InitLibrary(FHandle);

    SDL_error.InitLibrary(FHandle);
  end
  else
  begin
    raise Exception.CreateFmt('Can not load [%s] library', [LIB_SDL_NAME]);
  end;
end;

procedure ReleaseDLL;
begin
  if (FHandle <> 0) and (FHandle <> INVALID_HANDLE_VALUE) then
  begin
    FreeLibrary(FHandle);
  end;

end;

initialization
  InitDLL;

end.
