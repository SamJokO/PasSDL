unit SDL.storage;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.error,
  SDL.filesystem,
  SDL.properties;

type
  TSDL_StorageInterface = record
    version                     : Uint32;

    close                       : function (Auserdata: Pointer): bool; cdecl;
    ready                       : function (Auserdata: Pointer): bool; cdecl;
    enumerate                   : function (Auserdata: Pointer; const Apath: PAnsiChar; Acallback: TSDL_EnumeratedirectoryCallback; Acallback_userdata: Pointer): bool; cdecl;
    info                        : function (Auserdata: Pointer; const Apath: PAnsiChar; Ainfo: PSDL_PathInfo): bool; cdecl;
    read_file                   : function (Auserdata: Pointer; const Apath: PAnsiChar; Adestination: Pointer; Alength: Uint64): bool; cdecl;
    write_file                  : function (Auserdata: Pointer; const Apath: PAnsiChar; const Asource: Pointer; Alength: Uint64): bool; cdecl;
    mkdir                       : function (Auserdata: Pointer; const Apath: PAnsiChar): bool; cdecl;
    remove                      : function (Auserdata: Pointer; const Apath: PAnsiChar): bool; cdecl;
    rename                      : function (Auserdata: Pointer; const Aoldpath: PAnsiChar; const AnewPath: PAnsiChar): bool; cdecl;
    copy                        : function (Auserdata: Pointer; const Aoldpath: PAnsiChar; const Anewpath: PAnsiChar): bool; cdecl;
    space_remaining             : function (Auserdata: PPointer): Uint64; cdecl;
  end;
  PSDL_StorageInterface = ^TSDL_StorageInterface;

  TSDL_Storage = record end;
  PSDL_Storage = ^TSDL_Storage;

  /// <summary>
  ///  Opens up a read-only container for the application's filesystem.
  /// </summary>
  TSDL_OpenTitleStorage       = function (const Aoverride: PAnsiChar; Aprops: TSDL_PropertiesID): PSDL_Storage; cdecl;

  /// <summary>
  ///  Opens up a container for a user's unique read/write filesystem.
  /// </summary>
  TSDL_OpenUserStorage        = function (const Aorg: PAnsiChar; const Aapp: PAnsiChar; Aprops: TSDL_PropertiesID): PSDL_Storage; cdecl;

  /// <summary>
  ///  Opens up a container for local filesystem storage.
  /// </summary>
  TSDL_OpenFileStorage        = function (const Apath: PAnsiChar): PSDL_Storage; cdecl;

  /// <summary>
  ///  Opens up a container using a client-provided storage interface.
  /// </summary>
  TSDL_OpenStorage            = function (const Aiface: PSDL_StorageInterface; Auserdata: Pointer): PSDL_Storage; cdecl;

  /// <summary>
  ///  Closes and frees a storage container.
  /// </summary>
  TSDL_CloseStorage           = function (Astorage: PSDL_Storage): bool; cdecl;

  /// <summary>
  ///  Checks if the storage container is ready to use.
  /// </summary>
  TSDL_StorageReady           = function (Astorage: PSDL_Storage): bool; cdecl;

  /// <summary>
  ///  Query the size of a file within a storage container.
  /// </summary>
  TSDL_GetStorageFileSize     = function (Astorage: PSDL_Storage; const Apath: PAnsiChar; var Alengt: Uint64): bool; cdecl;

  /// <summary>
  ///  Synchronously read a file from a storage container into a client-provided
  ///  buffer.
  /// </summary>
  TSDL_ReadStorageFile        = function (Astorage: PSDL_Storage; const Apath: PAnsiChar; Adestination: Pointer; Alength: Uint64): bool; cdecl;

  /// <summary>
  ///  Synchronously write a file from client memory into a storage container.
  /// </summary>
  TSDL_WriteStorageFile       = function (Astorage: PSDL_Storage; const Apath: PAnsiChar; const Asource: Pointer; Alength: Uint64): bool; cdecl;

  /// <summary>
  ///  Create a directory in a writable storage container.
  /// </summary>
  TSDL_CreateStorageDirectory = function (Astorage: PSDL_Storage; const Apath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Enumerate a directory in a storage container through a callback function.
  /// </summary>
  TSDL_EnumerateStorageDirectory
                              = function (Astorage: PSDL_Storage; const Apath: PAnsiChar; Acallback: TSDL_EnumerateDirectoryCallback; Auserdata: Pointer): bool; cdecl;

  /// <summary>
  ///  Remove a file or an empty directory in a writable storage container.
  /// </summary>
  TSDL_RemoveStoragePath      = function (Astorage: PSDL_Storage; const Apath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Rename a file or directory in a writable storage container.
  /// </summary>
  TSDL_RenameStoragePath      = function (Astorage: PSDL_Storage; const Aoldpath: PAnsiChar; const Anewpath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Copy a file in a writable storage container.
  /// </summary>
  TSDL_CopyStorageFile        = function (Astorage: PSDL_Storage; const Aoldpath: PAnsiChar; Anewpath: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get information about a filesystem path in a storage container.
  /// </summary>
  TSDL_GetStoragePathInfo     = function (Astorage: PSDL_Storage; const Apath: PAnsiChar; var Ainfo: TSDL_PathInfo): bool; cdecl;

  /// <summary>
  ///  Queries the remaining space in a storage container.
  /// </summary>
  TSDL_GetStorageSpaceRemaining
                              = function (Astorage: PSDL_Storage): Uint64; cdecl;

  /// <summary>
  ///  Enumerate a directory tree, filtered by pattern, and return a list.
  /// </summary>
  TSDL_GlobStorageDirectory   = function (Astorage: PSDL_Storage; const Apath: PAnsiChar; const Apattern: PAnsiChar; Aflags: TSDL_GlobFlags; var Acount: int): PPAnsiChar; cdecl;

var
  SDL_OpenTitleStorage        : TSDL_OpenTitleStorage;
  SDL_OpenUserStorage         : TSDL_OpenUserStorage;
  SDL_OpenFileStorage         : TSDL_OpenFileStorage;
  SDL_OpenStorage             : TSDL_OpenStorage;
  SDL_CloseStorage            : TSDL_CloseStorage;
  SDL_StorageReady            : TSDL_StorageReady;
  SDL_GetStorageFileSize      : TSDL_GetStorageFileSize;
  SDL_ReadStorageFile         : TSDL_ReadStorageFile;
  SDL_WriteStorageFile        : TSDL_WriteStorageFile;
  SDL_CreateStorageDirectory  : TSDL_CreateStorageDirectory;
  SDL_EnumerateStorageDirectory
                              : TSDL_EnumerateStorageDirectory;
  SDL_RemoveStoragePath       : TSDL_RemoveStoragePath;
  SDL_RenameStoragePath       : TSDL_RenameStoragePath;
  SDL_CopyStorageFile         : TSDL_CopyStorageFile;
  SDL_GetStoragePathInfo      : TSDL_GetStoragePathInfo;
  SDL_GetStorageSpaceRemaining
                              : TSDL_GetStorageSpaceRemaining;
  SDL_GlobStorageDirectory    : TSDL_GlobStorageDirectory;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_OpenTitleStorage       := BindProcedure(AHandle, 'SDL_OpenTitleStorage');
  @SDL_OpenUserStorage        := BindProcedure(AHandle, 'SDL_OpenUserStorage');
  @SDL_OpenFileStorage        := BindProcedure(AHandle, 'SDL_OpenFileStorage');
  @SDL_OpenStorage            := BindProcedure(AHandle, 'SDL_OpenStorage');
  @SDL_CloseStorage           := BindProcedure(AHandle, 'SDL_CloseStorage');
  @SDL_StorageReady           := BindProcedure(AHandle, 'SDL_StorageReady');
  @SDL_GetStorageFileSize     := BindProcedure(AHandle, 'SDL_GetStorageFileSize');
  @SDL_ReadStorageFile        := BindProcedure(AHandle, 'SDL_ReadStorageFile');
  @SDL_WriteStorageFile       := BindProcedure(AHandle, 'SDL_WriteStorageFile');
  @SDL_CreateStorageDirectory := BindProcedure(AHandle, 'SDL_CreateStorageDirectory');
  @SDL_EnumerateStorageDirectory
                              := BindProcedure(AHandle, 'SDL_EnumerateStorageDirectory');
  @SDL_RemoveStoragePath      := BindProcedure(AHandle, 'SDL_RemoveStoragePath');
  @SDL_RenameStoragePath      := BindProcedure(AHandle, 'SDL_RenameStoragePath');
  @SDL_CopyStorageFile        := BindProcedure(AHandle, 'SDL_CopyStorageFile');
  @SDL_GetStoragePathInfo     := BindProcedure(AHandle, 'SDL_GetStoragePathInfo');
  @SDL_GetStorageSpaceRemaining
                              := BindProcedure(AHandle, 'SDL_GetStorageSpaceRemaining');
  @SDL_GlobStorageDirectory   := BindProcedure(AHandle, 'SDL_GlobStorageDirectory');
end;

end.
