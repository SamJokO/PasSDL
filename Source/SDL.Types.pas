﻿{================================================================================

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

  SDL_pixels,
  SDL_inits,

  SDL_keyboard,
  SDL_mouse,
  SDL_joystick,
  SDL_touch,

  SDL_power,
  SDL_sensor,



  SDL_vulkan,
  SDL_metal,

  SDL_locale,

  SDL_surface,


  SDL_logs,
  SDL_mains,

  SDL_messagebox,
  SDL_misc,
  SDL_thread,
  SDL_mutex,
  SDL_platform,
  SDL_process,
  SDL_properties,
  SDL_rect,
  SDL_render,
  SDL_revisions,

  SDL_storage,
  SDL_timer,

  SDL_time,

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

    SDL_surface.InitLibrary(FHandle);

    SDL_pixels.InitLibrary(FHandle);

    SDL_keyboard.InitLibrary(FHandle);
    SDL_mouse.InitLibrary(FHandle);
    SDL_joystick.InitLibrary(FHandle);
    SDL_touch.InitLibrary(FHandle);

    SDL_power.InitLibrary(FHandle);
    SDL_sensor.InitLibrary(FHandle);


    SDL_vulkan.InitLibrary(FHandle);
    SDL_metal.InitLibrary(FHandle);

    SDL_locale.InitLibrary(FHandle);

    SDL_inits.InitLibrary(FHandle);


    SDL_logs.InitLibrary(FHandle);

    SDL_mains.InitLibrary(FHandle);
    SDL_misc.InitLibrary(FHandle);
    SDL_thread.InitLibrary(FHandle);
    SDL_mutex.InitLibrary(FHandle);
    SDL_platform.InitLibrary(FHandle);
    SDL_process.InitLibrary(FHandle);
    SDL_properties.InitLibrary(FHandle);
    SDL_rect.InitLibrary(FHandle);
    SDL_render.InitLibrary(FHandle);

    SDL_storage.InitLibrary(FHandle);

    SDL_timer.InitLibrary(FHandle);

    SDL_time.InitLibrary(FHandle);
    SDL_messagebox.InitLibrary(FHandle);
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
