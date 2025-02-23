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
unit SDL.PascalEntry;

interface

const
{$IF DEFINED(MSWINDOWS)}
  LIB_SDL_NAME                = 'SDL3.dll';
{$ELSEIF DEFINED(MACOS)}
  LIB_SDL_NAME                = 'libSDL3.0.dylib';
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
  SDL.stdinc,
  SDL.assert,
  SDL.asyncio,
  SDL.atomic,
  SDL.audio,
  SDL.blendmode,
  SDL.camera,
  SDL.clipboard,
  SDL.cpuinfo,

  SDL.dialog,

  SDL.error,
  SDL.events,

  SDL.filesystem,

  SDL.gamepad,
  SDL.gpu,
  SDL.guid,

  SDL.haptic,
  SDL.hidapi,
  SDL.hints,

  SDL.init,
  SDL.iostream,

  SDL.joystick,

  SDL.keyboard,
  SDL.keycode,

  SDL.loadso,
  SDL.locale,
  SDL.log,

  SDL.main,
  SDL.messagebox,
  SDL.metal,
  SDL.misc,
  SDL.mouse,
  SDL.mutex,

  SDL.pen,
  SDL.pixels,
  SDL.platform,
  SDL.power,
  SDL.process,
  SDL.properties,

  SDL.rect,
  SDL.render,
  SDL.revisions,

  SDL.sensor,
  SDL.storage,
  SDL.surface,
  SDL.system,

  SDL.thread,
  SDL.time,
  SDL.timer,
  SDL.touch,
  SDL.tray,

  SDL.version,
  SDL.video,
  SDL.vulkan,

{$IF DEFINED(MSWINDOWS)}
  Winapi.Windows,
{$ENDIF}
  System.SysUtils;

var
  FHandle                     : THandle;

function BindProcedure(const AHandle: THandle; const AFuncName: AnsiString): Pointer;
begin
{$IF DEFINED(OSX)}
  Result                      := GetProcAddress(AHandle, PChar(string(AFuncName)));
{$ELSE}
  Result                      := GetProcAddress(AHandle, PAnsiChar(AFuncName));
{$ENDIF}
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
    SDL.stdinc.InitLibrary(FHandle);

    SDL.assert.InitLibrary(FHandle);
    SDL.asyncio.InitLibrary(FHandle);
    SDL.atomic.InitLibrary(FHandle);
    SDL.audio.InitLibrary(FHandle);

    SDL.blendmode.InitLibrary(FHandle);
    SDL.camera.InitLibrary(FHandle);
    SDL.clipboard.InitLibrary(FHandle);
    SDL.cpuinfo.InitLibrary(FHandle);

    SDL.dialog.InitLibrary(FHandle);

    SDL.error.InitLibrary(FHandle);
    SDL.events.InitLibrary(FHandle);

    SDL.filesystem.InitLibrary(FHandle);

    SDL.gpu.InitLibrary(FHandle);
    SDL.guid.InitLibrary(FHandle);

    SDL.haptic.InitLibrary(FHandle);
    SDL.hidapi.InitLibrary(FHandle);
    SDL.hints.InitLibrary(FHandle);

    SDL.init.InitLibrary(FHandle);
    SDL.iostream.InitLibrary(FHandle);

    SDL.joystick.InitLibrary(FHandle);

    SDL.keyboard.InitLibrary(FHandle);

    SDL.loadso.InitLibrary(FHandle);
    SDL.locale.InitLibrary(FHandle);
    SDL.log.InitLibrary(FHandle);

    SDL.main.InitLibrary(FHandle);
    SDL.messagebox.InitLibrary(FHandle);
    SDL.metal.InitLibrary(FHandle);
    SDL.misc.InitLibrary(FHandle);
    SDL.mouse.InitLibrary(FHandle);
    SDL.mutex.InitLibrary(FHandle);

    SDL.pixels.InitLibrary(FHandle);
    SDL.platform.InitLibrary(FHandle);
    SDL.power.InitLibrary(FHandle);
    SDL.process.InitLibrary(FHandle);
    SDL.properties.InitLibrary(FHandle);

    SDL.rect.InitLibrary(FHandle);
    SDL.render.InitLibrary(FHandle);

    SDL.sensor.InitLibrary(FHandle);
    SDL.storage.InitLibrary(FHandle);
    SDL.surface.InitLibrary(FHandle);
    SDL.system.InitLibrary(FHandle);

    SDL.thread.InitLibrary(FHandle);
    SDL.time.InitLibrary(FHandle);
    SDL.timer.InitLibrary(FHandle);
    SDL.touch.InitLibrary(FHandle);
    SDL.tray.InitLibrary(FHandle);

    SDL.version.InitLibrary(FHandle);
    SDL.video.InitLibrary(FHandle);
    SDL.vulkan.InitLibrary(FHandle);

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
