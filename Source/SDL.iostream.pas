unit SDL.iostream;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.error,
  SDL.properties;

type
  TSDL_IOStatus               = (
                                  SDL_IO_STATUS_READY,
                                  SDL_IO_STATUS_ERROR,
                                  SDL_IO_STATUS_EOF,
                                  SDL_IO_STATUS_NOT_READY,
                                  SDL_IO_STATUS_READONLY,
                                  SDL_IO_STATUS_WRITEONLY
                                );
  PSDL_IOStatus = ^TSDL_IOStatus;

  TSDL_IOWhence               = (
                                  SDL_IO_SEEK_SET,
                                  SDL_IO_SEEK_CUR,
                                  SDL_IO_SEEK_END
                                );
  PSDL_IOWhence = ^TSDL_IOWhence;

  TSDL_IOStreamInterface = record
    version                     : Uint32;

    size                        : function (AUserData: Pointer): Sint64; cdecl;
    seek                        : function (AUserData: Pointer; AOffset: Sint64; AWhence: TSDL_IOWhence): Sint64; cdecl;
    read                        : function (AUserData: Pointer; APtr: Pointer; ASize: size_t; AStatus: PSDL_IOStatus): size_t; cdecl;
    write                       : function (AUserData: Pointer; const APtr: Pointer; ASize: size_t; AStatus: PSDL_IOStatus): size_t; cdecl;
    flush                       : function (AUserData: Pointer; AStatus: PSDL_IOStatus): bool; cdecl;
    close                       : function (AUserData: Pointer): bool; cdecl;
  end;
  PSDL_IOStreamInterface = ^TSDL_IOStreamInterface;

  TSDL_IOStream = record end;
  PSDL_IOStream = ^TSDL_IOStream;

  /// <summary>
  ///  Use this function to create a new SDL_IOStream structure for reading from
  ///  and/or writing to a named file.
  /// </summary>
  TSDL_IOFromFile             = function (const Afile: PAnsiChar; const Amode: PAnsiChar): PSDL_IOStream; cdecl;

const
  SDL_PROP_IOSTREAM_WINDOWS_HANDLE_POINTER    = 'SDL.iostream.windows.handle';
  SDL_PROP_IOSTREAM_STDIO_FILE_POINTER        = 'SDL.iostream.stdio.file';
  SDL_PROP_IOSTREAM_FILE_DESCRIPTOR_NUMBER    = 'SDL.iostream.file_descriptor';
  SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER    = 'SDL.iostream.android.aasset';

type
  /// <summary>
  ///  Use this function to prepare a read-write memory buffer for use with
  ///  SDL_IOStream.
  /// </summary>
  TSDL_IOFromMem              = function (Amem: Pointer; Asize: size_t): PSDL_IOStream; cdecl;

const
  SDL_PROP_IOSTREAM_MEMORY_POINTER          = 'SDL.iostream.memory.base';
  SDL_PROP_IOSTREAM_MEMORY_SIZE_NUMBER      = 'SDL.iostream.memory.size';

type
  /// <summary>
  ///  Use this function to prepare a read-only memory buffer for use with
  ///  SDL_IOStream.
  /// </summary>
  TSDL_IOFromConstMem         = function (const Amem: Pointer; Asize: size_t): PSDL_IOStream; cdecl;

  /// <summary>
  ///  Use this function to create an SDL_IOStream that is backed by dynamically
  ///  allocated memory.
  /// </summary>
  TSDL_IOFromDynamicMem       = function (): PSDL_IOStream; cdecl;

const
  SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER    = 'SDL.iostream.dynamic.memory';
  SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER  = 'SDL.iostream.dynamic.chunksize';

type
  /// <summary>
  ///  Create a custom SDL_IOStream.
  /// </summary>
  TSDL_OpenIO                 = function (const Aiface: PSDL_IOStreamInterface; Auserdata: Pointer): PSDL_IOStream; cdecl;

  /// <summary>
  ///  Close and free an allocated SDL_IOStream structure.
  /// </summary>
  TSDL_CloseIO                = function (Acontext: PSDL_IOStream): bool; cdecl;

  /// <summary>
  ///  Get the properties associated with an SDL_IOStream.
  /// </summary>
  TSDL_GetIOProperties        = function (Acontext: PSDL_IOStream): TSDL_PropertiesID; cdecl;

  /// <summary>
  ///  Query the stream status of an SDL_IOStream.
  /// </summary>
  TSDL_GetIOStatus            = function (Acontext: PSDL_IOStream): TSDL_IOStatus; cdecl;

  /// <summary>
  ///  Use this function to get the size of the data stream in an SDL_IOStream.
  /// </summary>
  TSDL_GetIOSize              = function (Acontext: PSDL_IOStream): Sint64; cdecl;

  /// <summary>
  ///  Seek within an SDL_IOStream data stream.
  /// </summary>
  TSDL_SeekIO                 = function (Acontext: PSDL_IOStream; Aoffset: Sint64; Awhence: TSDL_IOWhence): Sint64; cdecl;

  /// <summary>
  ///  Determine the current read/write offset in an SDL_IOStream data stream.
  /// </summary>
  TSDL_TellIO                 = function (Acontext: PSDL_IOStream): Sint64; cdecl;

  /// <summary>
  ///  Read from a data source.
  /// </summary>
  TSDL_ReadIO                 = function (Acontext: PSDL_IOStream; Aptr: Pointer; Asize: size_t): size_t; cdecl;

  /// <summary>
  ///  Write to an SDL_IOStream data stream.
  /// </summary>
  TSDL_WriteIO                = function (Acontext: PSDL_IOStream; const Aptr: Pointer; Asize: size_t): size_t; cdecl;

  /// <summary>
  ///  Print to an SDL_IOStream data stream.
  /// </summary>
  TSDL_IOprintf               = function (Accontext: PSDL_IOStream; const Afmt: PAnsiChar; Aargs: array of const): size_t; cdecl;

  /// <summary>
  ///  Print to an SDL_IOStream data stream.
  /// </summary>
  TSDL_IOvprintf              = function (Acontext: PSDL_IOStream; const Afmt: PAnsiChar; Aargs: array of const): size_t; cdecl;

  /// <summary>
  ///  Flush any buffered data in the stream.
  /// </summary>
  TSDL_FlushIO                = function (Acontext: PSDL_IOStream): bool; cdecl;

  /// <summary>
  ///  Load all the data from an SDL data stream.
  /// </summary>
  TSDL_LoadFile_IO            = function (Asrc: PSDL_IOStream; var Adatasize: size_t; Acloseio: bool): Pointer; cdecl;

  /// <summary>
  ///  Load all the data from a file path.
  /// </summary>
  TSDL_LoadFile               = function (const Afile: PAnsiChar; var Adatasize: size_t): Pointer; cdecl;

  /// <summary>
  ///  Save all the data into an SDL data stream.
  /// </summary>
  TSDL_SaveFile_IO            = function (Asrc: PSDL_IOStream; const Adata: Pointer; Adatasize: size_t; Acloseio: bool): bool; cdecl;

  /// <summary>
  ///  Save all the data into a file path.
  /// </summary>
  TSDL_SaveFile               = function (const Afile: PAnsiChar; const Adata: Pointer; Adatasize: size_t): bool; cdecl;

  /// <summary>
  ///  Use this function to read a byte from an SDL_IOStream.
  /// </summary>
  TSDL_ReadU8                 = function (Asrc: PSDL_IOStream; var Avalue: Uint8): bool; cdecl;

  /// <summary>
  ///  Use this function to read a signed byte from an SDL_IOStream.
  /// </summary>
  TSDL_ReadS8                 = function (Asrc: PSDL_IOStream; var Avalue: Sint8): bool; cdecl;

  /// <summary>
  ///  Use this function to read 16 bits of little-endian data from an
  ///  SDL_IOStream and return in native format.
  /// </summary>
  TSDL_ReadU16LE              = function (Asrc: PSDL_IOStream; var Avalue: Uint16): bool; cdecl;

  /// <summary>
  ///  Use this function to read 16 bits of little-endian data from an
  ///  SDL_IOStream and return in native format.
  /// </summary>
  TSDL_ReadS16LE              = function (Asrc: PSDL_IOStream; var Avalue: Sint16): bool; cdecl;

  /// <summary>
  ///  Use this function to read 16 bits of big-endian data from an SDL_IOStream
  ///  and return in native format.
  /// </summary>
  TSDL_ReadU16BE              = function (Asrc: PSDL_IOStream; var Avalue: Uint16): bool; cdecl;

  /// <summary>
  ///  Use this function to read 16 bits of big-endian data from an SDL_IOStream
  ///  and return in native format.
  /// </summary>
  TSDL_ReadS16BE              = function (Asrc: PSDL_IOStream; var Avalue: Sint16): bool; cdecl;

  /// <summary>
  ///  Use this function to read 32 bits of little-endian data from an
  ///  SDL_IOStream and return in native format.
  /// </summary>
  TSDL_ReadU32LE              = function (Asrc: PSDL_IOStream; var Avalue: Uint32): bool; cdecl;

  /// <summary>
  ///  Use this function to read 32 bits of little-endian data from an
  ///  SDL_IOStream and return in native format.
  /// </summary>
  TSDL_ReadS32LE              = function (Asrc: PSDL_IOStream; var Avalue: Sint32): bool; cdecl;

  /// <summary>
  ///  Use this function to read 32 bits of big-endian data from an SDL_IOStream
  ///  and return in native format.
  /// </summary>
  TSDL_ReadU32BE              = function (Asrc: PSDL_IOStream; var Avalue: Uint32): bool; cdecl;

  /// <summary>
  ///  Use this function to read 32 bits of big-endian data from an SDL_IOStream
  ///  and return in native format.
  /// </summary>
  TSDL_ReadS32BE              = function (Asrc: PSDL_IOStream; var Avalue: Sint32): bool; cdecl;

  /// <summary>
  ///  Use this function to read 64 bits of little-endian data from an
  ///  SDL_IOStream and return in native format.
  /// </summary>
  TSDL_ReadU64LE              = function (Asrc: PSDL_IOStream; var Avalue: Uint64): bool; cdecl;

  /// <summary>
  ///  Use this function to read 64 bits of little-endian data from an
  ///  SDL_IOStream and return in native format.
  /// </summary>
  TSDL_ReadS64LE              = function (Asrc: PSDL_IOStream; var Avalue: Sint64): bool; cdecl;

  /// <summary>
  ///  Use this function to read 64 bits of big-endian data from an SDL_IOStream
  ///  and return in native format.
  /// </summary>
  TSDL_ReadU64BE              = function (Asrc: PSDL_IOStream; var Avalue: Uint64): bool; cdecl;

  /// <summary>
  ///  Use this function to read 64 bits of big-endian data from an SDL_IOStream
  ///  and return in native format.
  /// </summary>
  TSDL_ReadS64BE              = function (Asrc: PSDL_IOStream; var Avalue: Sint64): bool; cdecl;

  /// <summary>
  ///  Use this function to write a byte to an SDL_IOStream.
  /// </summary>
  TSDL_WriteU8                = function (Adst: PSDL_IOStream; Avalue: Uint8): bool; cdecl;

  /// <summary>
  ///  Use this function to write a signed byte to an SDL_IOStream.
  /// </summary>
  TSDL_WriteS8                = function (Adst: PSDL_IOStream; Avalue: Sint8): bool; cdecl;

  /// <summary>
  ///  Use this function to write 16 bits in native format to an SDL_IOStream as
  ///  little-endian data.
  /// </summary>
  TSDL_WriteU16LE             = function (Adst: PSDL_IOStream; Avalue: Uint16): bool; cdecl;

  /// <summary>
  ///  Use this function to write 16 bits in native format to an SDL_IOStream as
  ///  little-endian data.
  /// </summary>
  TSDL_WriteS16LE             = function (Adst: PSDL_IOStream; Avalue: Sint16): bool; cdecl;

  /// <summary>
  ///  Use this function to write 16 bits in native format to an SDL_IOStream as
  ///  big-endian data.
  /// </summary>
  TSDL_WriteU16BE             = function (Adst: PSDL_IOStream; Avalue: Uint16): bool; cdecl;

  /// <summary>
  ///  Use this function to write 16 bits in native format to an SDL_IOStream as
  ///  big-endian data.
  /// </summary>
  TSDL_WriteS16BE             = function (Adst: PSDL_IOStream; Avalue: Sint16): bool; cdecl;

  /// <summary>
  ///  Use this function to write 32 bits in native format to an SDL_IOStream as
  ///  little-endian data.
  /// </summary>
  TSDL_WriteU32LE             = function (Adst: PSDL_IOStream; Avalue: Uint32): bool; cdecl;

  /// <summary>
  ///  Use this function to write 32 bits in native format to an SDL_IOStream as
  ///  little-endian data.
  /// </summary>
  TSDL_WriteS32LE             = function (Adst: PSDL_IOStream; Avalue: Sint32): bool; cdecl;

  /// <summary>
  ///  Use this function to write 32 bits in native format to an SDL_IOStream as
  ///  big-endian data.
  /// </summary>
  TSDL_WriteU32BE             = function (Adst: PSDL_IOStream; Avalue: Uint32): bool; cdecl;

  /// <summary>
  ///  Use this function to write 32 bits in native format to an SDL_IOStream as
  ///  big-endian data.
  /// </summary>
  TSDL_WriteS32BE             = function (Adst: PSDL_IOStream; Avalue: Sint32): bool; cdecl;

  /// <summary>
  ///  Use this function to write 64 bits in native format to an SDL_IOStream as
  ///  little-endian data.
  /// </summary>
  TSDL_WriteU64LE             = function (Adst: PSDL_IOStream; Avalue: Uint64): bool; cdecl;

  /// <summary>
  ///  Use this function to write 64 bits in native format to an SDL_IOStream as
  ///  little-endian data.
  /// </summary>
  TSDL_WriteS64LE             = function (Adst: PSDL_IOStream; Avalue: Sint64): bool; cdecl;

  /// <summary>
  ///  Use this function to write 64 bits in native format to an SDL_IOStream as
  ///  big-endian data.
  /// </summary>
  TSDL_WriteU64BE             = function (Adst: PSDL_IOStream; Avalue: Uint64): bool; cdecl;

  /// <summary>
  ///  Use this function to write 64 bits in native format to an SDL_IOStream as
  ///  big-endian data.
  /// </summary>
  TSDL_WriteS64BE             = function (Adst: PSDL_IOStream; Avalue: Sint64): bool; cdecl;

var
  SDL_IOFromFile              : TSDL_IOFromFile;
  SDL_IOFromMem               : TSDL_IOFromMem;
  SDL_IOFromConstMem          : TSDL_IOFromConstMem;
  SDL_IOFromDynamicMem        : TSDL_IOFromDynamicMem;
  SDL_OpenIO                  : TSDL_OpenIO;
  SDL_CloseIO                 : TSDL_CloseIO;
  SDL_GetIOProperties         : TSDL_GetIOProperties;
  SDL_GetIOStatus             : TSDL_GetIOStatus;
  SDL_GetIOSize               : TSDL_GetIOSize;
  SDL_SeekIO                  : TSDL_SeekIO;
  SDL_TellIO                  : TSDL_TellIO;
  SDL_ReadIO                  : TSDL_ReadIO;
  SDL_WriteIO                 : TSDL_WriteIO;
  SDL_IOprintf                : TSDL_IOprintf;
  SDL_IOvprintf               : TSDL_IOvprintf;
  SDL_FlushIO                 : TSDL_FlushIO;
  SDL_LoadFile_IO             : TSDL_LoadFile_IO;
  SDL_LoadFile                : TSDL_LoadFile;
  SDL_SaveFile_IO             : TSDL_SaveFile_IO;
  SDL_SaveFile                : TSDL_SaveFile;
  SDL_ReadU8                  : TSDL_ReadU8;
  SDL_ReadS8                  : TSDL_ReadS8;
  SDL_ReadU16LE               : TSDL_ReadU16LE;
  SDL_ReadS16LE               : TSDL_ReadS16LE;
  SDL_ReadU16BE               : TSDL_ReadU16BE;
  SDL_ReadS16BE               : TSDL_ReadS16BE;
  SDL_ReadU32LE               : TSDL_ReadU32LE;
  SDL_ReadS32LE               : TSDL_ReadS32LE;
  SDL_ReadU32BE               : TSDL_ReadU32BE;
  SDL_ReadS32BE               : TSDL_ReadS32BE;
  SDL_ReadU64LE               : TSDL_ReadU64LE;
  SDL_ReadS64LE               : TSDL_ReadS64LE;
  SDL_ReadU64BE               : TSDL_ReadU64BE;
  SDL_ReadS64BE               : TSDL_ReadS64BE;
  SDL_WriteU8                 : TSDL_WriteU8;
  SDL_WriteS8                 : TSDL_WriteS8;
  SDL_WriteU16LE              : TSDL_WriteU16LE;
  SDL_WriteS16LE              : TSDL_WriteS16LE;
  SDL_WriteU16BE              : TSDL_WriteU16BE;
  SDL_WriteS16BE              : TSDL_WriteS16BE;
  SDL_WriteU32LE              : TSDL_WriteU32LE;
  SDL_WriteS32LE              : TSDL_WriteS32LE;
  SDL_WriteU32BE              : TSDL_WriteU32BE;
  SDL_WriteS32BE              : TSDL_WriteS32BE;
  SDL_WriteU64LE              : TSDL_WriteU64LE;
  SDL_WriteS64LE              : TSDL_WriteS64LE;
  SDL_WriteU64BE              : TSDL_WriteU64BE;
  SDL_WriteS64BE              : TSDL_WriteS64BE;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_IOFromFile             := BindProcedure(AHandle, 'SDL_IOFromFile');
  @SDL_IOFromMem              := BindProcedure(AHandle, 'SDL_IOFromMem');
  @SDL_IOFromConstMem         := BindProcedure(AHandle, 'SDL_IOFromConstMem');
  @SDL_IOFromDynamicMem       := BindProcedure(AHandle, 'SDL_IOFromDynamicMem');
  @SDL_OpenIO                 := BindProcedure(AHandle, 'SDL_OpenIO');
  @SDL_CloseIO                := BindProcedure(AHandle, 'SDL_CloseIO');
  @SDL_GetIOProperties        := BindProcedure(AHandle, 'SDL_GetIOProperties');
  @SDL_GetIOStatus            := BindProcedure(AHandle, 'SDL_GetIOStatus');
  @SDL_GetIOSize              := BindProcedure(AHandle, 'SDL_GetIOSize');
  @SDL_SeekIO                 := BindProcedure(AHandle, 'SDL_SeekIO');
  @SDL_TellIO                 := BindProcedure(AHandle, 'SDL_TellIO');
  @SDL_ReadIO                 := BindProcedure(AHandle, 'SDL_ReadIO');
  @SDL_WriteIO                := BindProcedure(AHandle, 'SDL_WriteIO');
  @SDL_IOprintf               := BindProcedure(AHandle, 'SDL_IOprintf');
  @SDL_IOvprintf              := BindProcedure(AHandle, 'SDL_IOvprintf');
  @SDL_FlushIO                := BindProcedure(AHandle, 'SDL_FlushIO');
  @SDL_LoadFile_IO            := BindProcedure(AHandle, 'SDL_LoadFile_IO');
  @SDL_LoadFile               := BindProcedure(AHandle, 'SDL_LoadFile');
  @SDL_SaveFile_IO            := BindProcedure(AHandle, 'SDL_SaveFile_IO');
  @SDL_SaveFile               := BindProcedure(AHandle, 'SDL_SaveFile');
  @SDL_ReadU8                 := BindProcedure(AHandle, 'SDL_ReadU8');
  @SDL_ReadS8                 := BindProcedure(AHandle, 'SDL_ReadS8');
  @SDL_ReadU16LE              := BindProcedure(AHandle, 'SDL_ReadU16LE');
  @SDL_ReadS16LE              := BindProcedure(AHandle, 'SDL_ReadS16LE');
  @SDL_ReadU16BE              := BindProcedure(AHandle, 'SDL_ReadU16BE');
  @SDL_ReadS16BE              := BindProcedure(AHandle, 'SDL_ReadS16BE');
  @SDL_ReadU32LE              := BindProcedure(AHandle, 'SDL_ReadU32LE');
  @SDL_ReadS32LE              := BindProcedure(AHandle, 'SDL_ReadS32LE');
  @SDL_ReadU32BE              := BindProcedure(AHandle, 'SDL_ReadU32BE');
  @SDL_ReadS32BE              := BindProcedure(AHandle, 'SDL_ReadS32BE');
  @SDL_ReadU64LE              := BindProcedure(AHandle, 'SDL_ReadU64LE');
  @SDL_ReadS64LE              := BindProcedure(AHandle, 'SDL_ReadS64LE');
  @SDL_ReadU64BE              := BindProcedure(AHandle, 'SDL_ReadU64BE');
  @SDL_ReadS64BE              := BindProcedure(AHandle, 'SDL_ReadS64BE');
  @SDL_WriteU8                := BindProcedure(AHandle, 'SDL_WriteU8');
  @SDL_WriteS8                := BindProcedure(AHandle, 'SDL_WriteS8');
  @SDL_WriteU16LE             := BindProcedure(AHandle, 'SDL_WriteU16LE');
  @SDL_WriteS16LE             := BindProcedure(AHandle, 'SDL_WriteS16LE');
  @SDL_WriteU16BE             := BindProcedure(AHandle, 'SDL_WriteU16BE');
  @SDL_WriteS16BE             := BindProcedure(AHandle, 'SDL_WriteS16BE');
  @SDL_WriteU32LE             := BindProcedure(AHandle, 'SDL_WriteU32LE');
  @SDL_WriteS32LE             := BindProcedure(AHandle, 'SDL_WriteS32LE');
  @SDL_WriteU32BE             := BindProcedure(AHandle, 'SDL_WriteU32BE');
  @SDL_WriteS32BE             := BindProcedure(AHandle, 'SDL_WriteS32BE');
  @SDL_WriteU64LE             := BindProcedure(AHandle, 'SDL_WriteU64LE');
  @SDL_WriteS64LE             := BindProcedure(AHandle, 'SDL_WriteS64LE');
  @SDL_WriteU64BE             := BindProcedure(AHandle, 'SDL_WriteU64BE');
  @SDL_WriteS64BE             := BindProcedure(AHandle, 'SDL_WriteS64BE');
end;

end.
