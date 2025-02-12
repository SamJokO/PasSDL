unit SDL_iostream;

interface

uses
  SDL.Types,
  SDL_stdinc;

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

implementation

end.
