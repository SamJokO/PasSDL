unit SDL_power;

interface

uses
  SDL.Types,
  SDL_stdinc;

type
  TSDL_PowerState             = (
                                  SDL_POWERSTATE_ERROR = -1,
                                  SDL_POWERSTATE_UNKNOWN,
                                  SDL_POWERSTATE_ON_BATTERY,
                                  SDL_POWERSTATE_NO_BATTERY,
                                  SDL_POWERSTATE_CHARGING,
                                  SDL_POWERSTATE_CHARGED
                                );
  PSDL_PowerState             = ^TSDL_PowerState;

  /// <summary>
  ///  Get the current power supply details.
  /// </summary>
  TSDL_GetPowerInfo           = function (var Aseconds: int; var Apercent: int): TSDL_PowerState; cdecl;

var
  SDL_GetPowerInfo            : TSDL_GetPowerInfo;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetPowerInfo           := BindProcedure(AHandle, 'SDL_GetPowerInfo');
end;

end.
