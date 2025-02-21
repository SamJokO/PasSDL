unit SDL_time;

interface

uses
  SDL.Types,
  SDL.error,
  SDL.stdinc;

type
  TSDL_DateTime = record
    year                        : int;
    month                       : int;
    day                         : int;
    hour                        : int;
    minute                      : int;
    second                      : int;
    nanosecond                  : int;
    day_of_week                 : int;
    utc_offset                  : int;
  end;
  PSDL_DateTime = ^TSDL_DateTime;

  TSDL_DateFormat             = (
                                  SDL_DATE_FORMAT_YYYYMMDD = 0,
                                  SDL_DATE_FORMAT_DDMMYYYY = 1,
                                  SDL_DATE_FORMAT_MMDDYYYY = 2
                                );
  PSDL_DateFormat             =  TSDL_DateFormat;

  TSDL_TimeFormat             = (
                                  SDL_TIME_FORMAT_24HR = 0,
                                  SDL_TIME_FORMAT_12HR = 1
                                );
  PSDL_TimeFormat             = ^TSDL_TimeFormat;

  /// <summary>
  ///  Gets the current preferred date and time format for the system locale.
  /// </summary>
  TSDL_GetDateTimeLocalePreferences
                              = function (var AdateFormat: TSDL_DateFormat; var AtimeFormat: TSDL_TimeFormat): bool; cdecl;

  /// <summary>
  ///  Gets the current value of the system realtime clock in nanoseconds since
  ///  Jan 1, 1970 in Universal Coordinated Time (UTC).
  /// </summary>
  TSDL_GetCurrentTime         = function (var Aticks: TSDL_Time): bool; cdecl;

  /// <summary>
  ///  Converts an SDL_Time in nanoseconds since the epoch to a calendar time in
  ///  the SDL_DateTime format.
  /// </summary>
  TSDL_TimeToDateTime         = function (Aticks: TSDL_Time; var Adt: TSDL_DateTime; AlocalTime: bool): bool; cdecl;

  /// <summary>
  ///  Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
  /// </summary>
  TSDL_DateTimeToTime         = function (const Adt: PSDL_DateTime; var Aticks: TSDL_Time): bool; cdecl;

  /// <summary>
  ///  Converts an SDL time into a Windows FILETIME (100-nanosecond intervals
  ///  since January 1, 1601).
  /// </summary>
  TSDL_TimeToWindows          = procedure (Aticks: TSDL_Time; var AdwlowDateTime: Uint32; var AdwHighDateTime: Uint32); cdecl;

  /// <summary>
  ///  Converts a Windows FILETIME (100-nanosecond intervals since January 1,
  ///  1601) to an SDL time.
  /// </summary>
  TSDL_TimeFromWindows        = function (AdwLowDateTime: Uint32; AHighDateTime: Uint32): TSDL_Time; cdecl;

  /// <summary>
  ///  Get the number of days in a month for a given year.
  /// </summary>
  TSDL_GetDaysInMonth         = function (Ayear: int; Amonth: int): int; cdecl;

  /// <summary>
  ///  Get the day of year for a calendar date.
  /// </summary>
  TSDL_GetDayOfYear           = function (Ayear: int; Amonth: int; Aday: int): int; cdecl;

  /// <summary>
  ///  Get the day of week for a calendar date.
  /// </summary>
  TSDL_GetDayOfWeek           = function (Ayear: int; Amonth: int; Aday: int): int; cdecl;

var
  SDL_GetDateTimeLocalePreferences
                              : TSDL_GetDateTimeLocalePreferences;
  SDL_GetCurrentTime          : TSDL_GetCurrentTime;
  SDL_TimeToDateTime          : TSDL_TimeToDateTime;
  SDL_DateTimeToTime          : TSDL_DateTimeToTime;
  SDL_TimeToWindows           : TSDL_TimeToWindows;
  SDL_TimeFromWindows         : TSDL_TimeFromWindows;
  SDL_GetDaysInMonth          : TSDL_GetDaysInMonth;
  SDL_GetDayOfYear            : TSDL_GetDayOfYear;
  SDL_GetDayOfWeek            : TSDL_GetDayOfWeek;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetDateTimeLocalePreferences
                              := BindProcedure(AHandle, 'SDL_GetDateTimeLocalePreferences');
  @SDL_GetCurrentTime         := BindProcedure(AHandle, 'SDL_GetCurrentTime');
  @SDL_TimeToDateTime         := BindProcedure(AHandle, 'SDL_TimeToDateTime');
  @SDL_DateTimeToTime         := BindProcedure(AHandle, 'SDL_DateTimeToTime');
  @SDL_TimeToWindows          := BindProcedure(AHandle, 'SDL_TimeToWindows');
  @SDL_TimeFromWindows        := BindProcedure(AHandle, 'SDL_TimeFromWindows');
  @SDL_GetDaysInMonth         := BindProcedure(AHandle, 'SDL_GetDaysInMonth');
  @SDL_GetDayOfYear           := BindProcedure(AHandle, 'SDL_GetDayOfYear');
  @SDL_GetDayOfWeek           := BindProcedure(AHandle, 'SDL_GetDayOfWeek');
end;

end.
