unit SDL.filesystem;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.error;

type
  /// <summary>
  ///  Get the directory where the application was run from.
  /// </summary>
  TSDL_GetBasePath            = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the user-and-app-specific path where files can be written.
  /// </summary>
  TSDL_GetPrefPath            = function (const Aorg: PAnsiChar; const Aapp: PAnsiChar): PAnsiChar; cdecl;

  TSDL_Folder                 = (
                                  SDL_FOLDER_HOME,
                                  SDL_FOLDER_DESKTOP,
                                  SDL_FOLDER_DOCUMENTS,
                                  SDL_FOLDER_DONWLOADS,
                                  SDL_FOLDER_MUSIC,
                                  SDL_FOLDER_PICTURES,
                                  SDL_FOLDER_PUBLICSHARE,
                                  SDL_FOLDER_SAVEDGAMES,
                                  SDL_FOLDER_SCREENSHOTS,
                                  SDL_FOLDER_TEMPLATES,
                                  SDL_FOLDER_VIDEOS,
                                  SDL_FOLDER_COUNT
                                );
  PSDL_Folder                 = ^TSDL_Folder;

  /// <summary>
  ///  Finds the most suitable user folder for a specific purpose.
  /// </summary>
  TSDL_GetUserFolder          = function (Afolder: TSDL_Folder): PAnsiChar; cdecl;

  TSDL_PathType               = (
                                  SDL_PATHTYPE_NONE,
                                  SDL_PATHTYPE_FILE,
                                  SDL_PATHTYPE_DIRECTORY,
                                  SDL_PATHTYPE_OTHER
                                );
  PSDL_PathType               = ^TSDL_PathType;

  TSDL_PathInfo = record
    &type                       : TSDL_PathType;
    size                        : Uint64;
    create_time                 : TSDL_Time;
    modify_time                 : TSDL_Time;
    access_time                 : TSDL_Time;
  end;
  PSDL_PathInfo = ^TSDL_PathInfo;

  TSDL_GlobFlags              = Uint32;

const
  SDL_GLOB_CASEINSENSITIVE    = 1 shl 0;

type
  /// <summary>
  ///  Create a directory, and any missing parent directories.
  /// </summary>
  TSDL_CreateDirectory        = function (const Apath: PAnsiChar): bool; cdecl;

  TSDL_EnumerationResult      = (
                                  SDL_ENUM_CONTINUE,
                                  SDL_ENUM_SUCCESS,
                                  SDL_ENUM_FAILURE
                                );
  PSDL_EnumerationResult      = ^TSDL_EnumerationResult;

  /// <summary>
  ///  Callback for directory enumeration.
  /// </summary>
  TSDL_EnumerateDirectoryCallback
                              = function (Auserdata: Pointer; const Adirname: PAnsiChar; const Afname: PAnsiChar): TSDL_EnumerationResult; cdecl;

  /// <summary>
  ///  Enumerate a directory through a callback function.
  /// </summary>
  TSDL_EnumerateDirectory     = function (const Apath: PAnsiChar; Acallback: TSDL_EnumerateDirectoryCallback; Auserdata: Pointer): bool; cdecl;

  /// <summary>
  ///  Remove a file or an empty directory.
  /// </summary>
  TSDL_RemovePath             = function (const Apath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Rename a file or directory.
  /// </summary>
  TSDL_RenamePath             = function (const Aoldpath: PAnsiChar; const Anewpath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Copy a file.
  /// </summary>
  TSDL_CopyFile               = function (const Aoldpath: PAnsiChar; const Anewpath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get information about a filesystem path.
  /// </summary>
  TSDL_GetPathInfo            = function (const Apath: PAnsiChar; var Ainfo: TSDL_PathInfo): bool; cdecl;

  /// <summary>
  ///  Enumerate a directory tree, filtered by pattern, and return a list.
  /// </summary>
  TSDL_GlobDirectory          = function (const Apath: PAnsiChar; const Apattern: PAnsiChar; Aflags: TSDL_GlobFlags; var Acount: int): PPAnsiChar; cdecl;

  /// <summary>
  ///  Get what the system believes is the "current working directory."
  /// </summary>
  TSDL_GetCurrentDirectory    = function (): PAnsiChar; cdecl;

var
  SDL_GetBasePath             : TSDL_GetBasePath;
  SDL_GetPrefPath             : TSDL_GetPrefPath;
  SDL_GetUserFolder           : TSDL_GetUserFolder;
  SDL_CreateDirectory         : TSDL_CreateDirectory;
  SDL_EnumerateDirectory      : TSDL_EnumerateDirectory;
  SDL_RemovePath              : TSDL_RemovePath;
  SDL_RenamePath              : TSDL_RenamePath;
  SDL_CopyFile                : TSDL_CopyFile;
  SDL_GetPathInfo             : TSDL_GetPathInfo;
  SDL_GlobDirectory           : TSDL_GlobDirectory;
  SDL_GetCurrentDirectory     : TSDL_GetCurrentDirectory;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetBasePath            := BindProcedure(AHandle, 'SDL_GetBasePath');
  @SDL_GetPrefPath            := BindProcedure(AHandle, 'SDL_GetPrefPath');
  @SDL_GetUserFolder          := BindProcedure(AHandle, 'SDL_GetUserFolder');
  @SDL_CreateDirectory        := BindProcedure(AHandle, 'SDL_CreateDirectory');
  @SDL_EnumerateDirectory     := BindProcedure(AHandle, 'SDL_EnumerateDirectory');
  @SDL_RemovePath             := BindProcedure(AHandle, 'SDL_RemovePath');
  @SDL_RenamePath             := BindProcedure(AHandle, 'SDL_RenamePath');
  @SDL_CopyFile               := BindProcedure(AHandle, 'SDL_CopyFile');
  @SDL_GetPathInfo            := BindProcedure(AHandle, 'SDL_GetPathInfo');
  @SDL_GlobDirectory          := BindProcedure(AHandle, 'SDL_GlobDirectory');
  @SDL_GetCurrentDirectory    := BindProcedure(AHandle, 'SDL_GetCurrentDirectory');
end;

end.
