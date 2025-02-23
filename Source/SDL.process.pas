unit SDL.process;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.error,
  SDL.iostream,
  SDL.properties;

type
  TSDL_Process = record end;
  PSDL_Process = ^TSDL_Process;

  /// <summary>
  ///  Create a new process.
  /// </summary>
  TSDL_CreateProcess          = function (const Aargs: PPAnsiChar; Apipe_stdio: bool): PSDL_Process; cdecl;

  TSDL_ProcessID              = (
                                  SDL_PROCESS_STDIO_INHERITED,
                                  SDL_PROCESS_STDIO_NULL,
                                  SDL_PROCESS_STDIO_APP,
                                  SDL_PROCESS_STDIO_REDIRECT
                                );
  PSDL_ProcessID              = ^TSDL_ProcessID;

  /// <summary>
  ///  Create a new process with the specified properties.
  /// </summary>
  TSDL_CreateProcessWithProperties
                              = function (Aprops: TSDL_PropertiesID): PSDL_Process; cdecl;

const
  SDL_PROP_PROCESS_CREATE_ARGS_POINTER                = 'SDL.process.create.args';
  SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER         = 'SDL.process.create.environment';
  SDL_PROP_PROCESS_CREATE_STDIN_NUMBER                = 'SDL.process.create.stdin_option';
  SDL_PROP_PROCESS_CREATE_STDIN_POINTER               = 'SDL.process.create.stdin_source';
  SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER               = 'SDL.process.create.stdout_option';
  SDL_PROP_PROCESS_CREATE_STDOUT_POINTER              = 'SDL.process.create.stdout_source';
  SDL_PROP_PROCESS_CREATE_STDERR_NUMBER               = 'SDL.process.create.stderr_option';
  SDL_PROP_PROCESS_CREATE_STDERR_POINTER              = 'SDL.process.create.stderr_source';
  SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN    = 'SDL.process.create.stderr_to_stdout';
  SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN          = 'SDL.process.create.background';

type
  /// <summary>
  ///  Get the properties associated with a process.
  /// </summary>
  TSDL_GetProcessProperties   = function (Aprocess: PSDL_Process): TSDL_PropertiesID; cdecl;

const
  SDL_PROP_PROCESS_PID_NUMBER               = 'SDL.process.pid';
  SDL_PROP_PROCESS_STDIN_POINTER            = 'SDL.process.stdin';
  SDL_PROP_PROCESS_STDOUT_POINTER           = 'SDL.process.stdout';
  SDL_PROP_PROCESS_STDERR_POINTER           = 'SDL.process.stderr';
  SDL_PROP_PROCESS_BACKGROUND_BOOLENA       = 'SDL.process.background';

type
  /// <summary>
  ///  Read all the output from a process.
  /// </summary>
  TSDL_ReadProcess            = function (Aprocess: PSDL_Process; var Adatasize: size_t; var Aexitcode: int): Pointer; cdecl;

  /// <summary>
  ///  Get the SDL_IOStream associated with process standard input.
  /// </summary>
  TSDL_GetProcessInput        = function (Aprocess: PSDL_Process): PSDL_IOStream; cdecl;

  /// <summary>
  ///  Get the SDL_IOStream associated with process standard output.
  /// </summary>
  TSDL_GetProcessOutput       = function (Aprocess: PSDL_Process): PSDL_IOStream; cdecl;

  /// <summary>
  ///  Stop a process.
  /// </summary>
  TSDL_KillProcess            = function (Aprocess: PSDL_Process; Aforce: bool): bool; cdecl;

  /// <summary>
  ///  Wait for a process to finish.
  /// </summary>
  TSDL_WaitProcess            = function (Aprocess: PSDL_Process; Ablock: bool; var AexitcodE: int): bool; cdecl;

  /// <summary>
  ///  Destroy a previously created process object.
  /// </summary>
  TSDL_DestroyProcess         = procedure (Aprocess: PSDL_Process); cdecl;

var
  SDL_CreateProcess           : TSDL_CreateProcess;
  SDL_CreateProcessWithProperties
                              : TSDL_CreateProcessWithProperties;
  SDL_GetProcessProperties    : TSDL_GetProcessProperties;
  SDL_ReadProcess             : TSDL_ReadProcess;
  SDL_GetProcessInput         : TSDL_GetProcessInput;
  SDL_GetProcessOutput        : TSDL_GetProcessOutput;
  SDL_KillProcess             : TSDL_KillProcess;
  SDL_WaitProcess             : TSDL_WaitProcess;
  SDL_DestroyProcess          : TSDL_DestroyProcess;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_CreateProcess          := BindProcedure(AHandle, 'SDL_CreateProcess');
  @SDL_CreateProcessWithProperties
                              := BindProcedure(AHandle, 'SDL_CreateProcessWithProperties');
  @SDL_GetProcessProperties   := BindProcedure(AHandle, 'SDL_GetProcessProperties');
  @SDL_ReadProcess            := BindProcedure(AHandle, 'SDL_ReadProcess');
  @SDL_GetProcessInput        := BindProcedure(AHandle, 'SDL_GetProcessInput');
  @SDL_GetProcessOutput       := BindProcedure(AHandle, 'SDL_GetProcessOutput');
  @SDL_KillProcess            := BindProcedure(AHandle, 'SDL_KillProcess');
  @SDL_WaitProcess            := BindProcedure(AHandle, 'SDL_WaitProcess');
  @SDL_DestroyProcess         := BindProcedure(AHandle, 'SDL_DestroyProcess');
end;

end.
