unit SDL.dialog;

interface

uses
  SDL.Types,
  SDL.stdinc,
  SDL.error,
  SDL.properties,
  SDL.video;

type
  TSDL_DialogFileFilter = record
    name                        : PAnsiChar;
    pattern                     : PAnsiChar;
  end;
  PSDL_DialogFileFilter = ^TSDL_DialogFileFilter;

  /// <summary>
  ///  Callback used by file dialog functions.
  /// </summary>
  TSDL_DialogFileCallback     = procedure (Auserdata: Pointer; const Afilelist: PPAnsiChar; Afilter: int); cdecl;

  /// <summary>
  ///  Displays a dialog that lets the user select a file on their filesystem.
  /// </summary>
  TSDL_ShowOpenFileDialog     = procedure (Acallback: TSDL_DialogFileCallback; Auserdata: Pointer; Awindow: PSDL_Window; const Afilters: PSDL_DialogFileFilter; Anfilters: int; const Adefault_location: PAnsiChar; Aallow_many: bool); cdecl;

  /// <summary>
  ///  Displays a dialog that lets the user choose a new or existing file on their
  ///  filesystem.
  /// </summary>
  TSDL_ShowSaveFileDialog     = procedure (Acallback: TSDL_DialogFileCallback; Auserdata: Pointer; Awindow: PSDL_Window; const Afilters: PSDL_DialogFileFilter; Anfilters: int; const Adefault_location: PAnsiChar); cdecl;

  /// <summary>
  ///  Displays a dialog that lets the user select a folder on their filesystem.
  /// </summary>
  TSDL_ShowOpenFolderDialog   = procedure (Acallback: TSDL_DialogFileCallback; Auserdata: Pointer; Awindow: PSDL_Window; const Adefault_location: PAnsiChar; Aallow_many: bool); cdecl;

  TSDL_FileDialogType         = (
                                  SDL_FILEDIALOG_OPENFILE,
                                  SDL_FILEDIALOG_SAVEFILE,
                                  SDL_FILEDIALOG_OPENFOLER
                                );
  PSDL_FileDialogType         = ^TSDL_FileDialogType;

  /// <summary>
  ///  Create and launch a file dialog with the specified properties.
  /// </summary>
  TSDL_ShowFileDialogWithProperties
                              = procedure (Atype: TSDL_FileDialogType; Acallback: TSDL_DialogFileCallback; Auserdata: Pointer; Aprops: TSDL_PropertiesID); cdecl;

const
  SDL_PROP_FILE_DIALOG_FILTERS_POINTER     = 'SDL.filedialog.filters';
  SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER     = 'SDL.filedialog.nfilters';
  SDL_PROP_FILE_DIALOG_WINDOW_POINTER      = 'SDL.filedialog.window';
  SDL_PROP_FILE_DIALOG_LOCATION_STRING     = 'SDL.filedialog.location';
  SDL_PROP_FILE_DIALOG_MANY_BOOLEAN        = 'SDL.filedialog.many';
  SDL_PROP_FILE_DIALOG_TITLE_STRING        = 'SDL.filedialog.title';
  SDL_PROP_FILE_DIALOG_ACCEPT_STRING       = 'SDL.filedialog.accept';
  SDL_PROP_FILE_DIALOG_CANCEL_STRING       = 'SDL.filedialog.cancel';

var
  SDL_ShowOpenFileDialog      : TSDL_ShowOpenFileDialog;
  SDL_ShowSaveFileDialog      : TSDL_ShowSaveFileDialog;
  SDL_ShowOpenFolderDialog    : TSDL_ShowOpenFolderDialog;
  SDL_ShowFileDialogWithProperties
                              : TSDL_ShowFileDialogWithProperties;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_ShowOpenFileDialog     := BindProcedure(AHandle, 'SDL_ShowOpenFileDialog');
  @SDL_ShowSaveFileDialog     := BindProcedure(AHandle, 'SDL_ShowSaveFileDialog');
  @SDL_ShowOpenFolderDialog   := BindProcedure(AHandle, 'SDL_ShowOpenFolderDialog');
  @SDL_ShowFileDialogWithProperties
                              := BindProcedure(AHandle, 'SDL_ShowFileDialogWithProperties');
end;

end.
