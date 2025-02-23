unit SDL.tray;

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
  SDL.surface,
  SDL.video;

type
  TSDL_Tray = record end;
  PSDL_Tray = ^TSDL_Tray;
  PPSDL_Tray = ^PSDL_Tray;

  TSDL_TrayMenu = record end;
  PSDL_TrayMenu = TSDL_TrayMenu;
  PPSDL_TrayMenu = ^PSDL_TrayMenu;

  TSDL_TrayEntry = record end;
  PSDL_TrayEntry = ^TSDL_TrayEntry;
  PPSDL_TrayEntry = ^PSDL_TrayEntry;

  TSDL_TrayEntryFlags         = Uint32;
  PSDL_TrayEntryFlags         = ^TSDL_TrayEntryFlags;

const
  SDL_TRAYENTRY_BUTTON              = $00000001;
  SDL_TRAYENTRY_CHECKBOX            = $00000002;
  SDL_TRAYENTRY_SUBMENU             = $00000004;
  SDL_TRAYENTRY_DISABLED            = $80000000;
  SDL_TRAYENTRY_CHECKED             = $40000000;

type
  /// <summary>
  ///  A callback that is invoked when a tray entry is selected.
  /// </summary>
  TSDL_TrayCallback           = procedure (Auserdata: Pointer; Aentry: PSDL_TrayEntry); cdecl;

  /// <summary>
  ///  Create an icon to be placed in the operating system's tray, or equivalent.
  /// </summary>
  TSDL_CreateTray             = function (Aicon: PSDL_Surface; const Atooltip: PAnsiChar): PSDL_Tray; cdecl;

  /// <summary>
  ///  Updates the system tray icon's icon.
  /// </summary>
  TSDL_SetTrayIcon            = procedure (Atray: PSDL_Tray; Aicon: PSDL_Surface); cdecl;

  /// <summary>
  ///  Updates the system tray icon's tooltip.
  /// </summary>
  TSDL_SetTrayTooltip         = procedure (Atray: PSDL_Tray; const Atooltip: PAnsiChar); cdecl;

  /// <summary>
  ///  Create a menu for a system tray.
  /// </summary>
  TSDL_CreateTrayMenu         = function (Atray: PSDL_Tray): PSDL_TrayMenu; cdecl;

  /// <summary>
  ///  Create a submenu for a system tray entry.
  /// </summary>
  TSDL_CreateTraySubmenu      = function (Aentry: PSDL_TrayEntry): PSDL_TrayMenu; cdecl;

  /// <summary>
  ///  Create a submenu for a system tray entry.
  /// </summary>
  TSDL_GetTrayMenu            = function (Atray: PSDL_Tray): PSDL_TrayMenu; cdecl;

  /// <summary>
  ///  Gets a previously created tray entry submenu.
  /// </summary>
  TSDL_GetTraySubmenu         = function (Aentry: PSDL_TrayEntry): PSDL_TrayMenu; cdecl;

  /// <summary>
  ///  Returns a list of entries in the menu, in order.
  /// </summary>
  TSDL_GetTrayEntries         = function (Amenu: PSDL_TrayMenu; var Asize: int): PPSDL_TrayEntry; cdecl;

  /// <summary>
  ///  Removes a tray entry.
  /// </summary>
  TSDL_RemoveTrayEntry        = procedure (Aentry: PSDL_TrayEntry); cdecl;

  /// <summary>
  ///  Insert a tray entry at a given position.
  /// </summary>
  TSDL_InsertTrayEntryAt      = function (Amenu: PSDL_TrayMenu; Apos: int; const Alabel: PAnsiChar; Aflags: TSDL_TrayEntryFlags): PSDL_TrayEntry; cdecl;

  /// <summary>
  ///  Sets the label of an entry.
  /// </summary>
  TSDL_SetTrayEntryLabel      = procedure (Aentry: PSDL_TrayEntry; const Alabel: PAnsiChar); cdecl;

  /// <summary>
  ///  Gets the label of an entry.
  /// </summary>
  TSDL_GetTrayEntryLabel      = function (Aentry: PSDL_TrayEntry): PAnsiChar; cdecl;

  /// <summary>
  ///  Sets whether or not an entry is checked.
  /// </summary>
  TSDL_SetTrayEntryChecked    = procedure (Aentry: PSDL_TrayEntry; Achecked: bool); cdecl;

  /// <summary>
  ///  Gets whether or not an entry is checked.
  /// </summary>
  TSDL_GetTrayEntryChecked    = function (Aentry: PSDL_TrayEntry): bool; cdecl;

  /// <summary>
  ///  Sets whether or not an entry is enabled.
  /// </summary>
  TSDL_SetTrayEntryEnabled    = procedure (Aentry: PSDL_TrayEntry; Aenbled: bool); cdecl;

  /// <summary>
  ///  Gets whether or not an entry is enabled.
  /// </summary>
  TSDL_GetTrayEntryEnabled    = function (Aentry: PSDL_TrayEntry): bool; cdecl;

  /// <summary>
  ///  Sets a callback to be invoked when the entry is selected.
  /// </summary>
  TSDL_SetTrayEntryCallback   = procedure (Aentry: PSDL_TrayEntry; Acallback: TSDL_TrayCallback; Auserdata: Pointer); cdecl;

  /// <summary>
  ///  Simulate a click on a tray entry.
  /// </summary>
  TSDL_ClickTrayEntry         = procedure (Aentry: PSDL_TrayEntry); cdecl;

  /// <summary>
  ///  Destroys a tray object.
  /// </summary>
  TSDL_DestroyTray            = procedure (Atray: PSDL_Tray); cdecl;

  /// <summary>
  ///  Gets the menu containing a certain tray entry.
  /// </summary>
  TSDL_GetTrayEntryParent     = function (Aentry: PSDL_TrayEntry): PSDL_TrayMenu; cdecl;

  /// <summary>
  ///  Gets the entry for which the menu is a submenu, if the current menu is a
  ///  submenu.
  /// </summary>
  TSDL_GetTrayMenuParentEntry = function (Amenu: PSDL_TrayMenu): PSDL_TrayEntry; cdecl;

  /// <summary>
  ///  Gets the tray for which this menu is the first-level menu, if the current
  ///  menu isn't a submenu.
  /// </summary>
  TSDL_GetTrayMenuParentTray  = function (Amenu: PSDL_TrayMenu): PSDL_Tray; cdecl;

  /// <summary>
  ///  Update the trays.
  /// </summary>
  TSDL_UpdateTrays            = procedure (); cdecl;

var
  SDL_CreateTray              : TSDL_CreateTray;
  SDL_SetTrayIcon             : TSDL_SetTrayIcon;
  SDL_SetTrayTooltip          : TSDL_SetTrayTooltip;
  SDL_CreateTrayMenu          : TSDL_CreateTrayMenu;
  SDL_CreateTraySubmenu       : TSDL_CreateTraySubmenu;
  SDL_GetTrayMenu             : TSDL_GetTrayMenu;
  SDL_GetTraySubmenu          : TSDL_GetTraySubmenu;
  SDL_GetTrayEntries          : TSDL_GetTrayEntries;
  SDL_RemoveTrayEntry         : TSDL_RemoveTrayEntry;
  SDL_InsertTrayEntryAt       : TSDL_InsertTrayEntryAt;
  SDL_SetTrayEntryLabel       : TSDL_SetTrayEntryLabel;
  SDL_GetTrayEntryLabel       : TSDL_GetTrayEntryLabel;
  SDL_SetTrayEntryChecked     : TSDL_SetTrayEntryChecked;
  SDL_GetTrayEntryChecked     : TSDL_GetTrayEntryChecked;
  SDL_SetTrayEntryEnabled     : TSDL_SetTrayEntryEnabled;
  SDL_GetTrayEntryEnabled     : TSDL_GetTrayEntryEnabled;
  SDL_SetTrayEntryCallback    : TSDL_SetTrayEntryCallback;
  SDL_ClickTrayEntry          : TSDL_ClickTrayEntry;
  SDL_DestroyTray             : TSDL_DestroyTray;
  SDL_GetTrayEntryParent      : TSDL_GetTrayEntryParent;
  SDL_GetTrayMenuParentEntry  : TSDL_GetTrayMenuParentEntry;
  SDL_GetTrayMenuParentTray   : TSDL_GetTrayMenuParentTray;
  SDL_UpdateTrays             : TSDL_UpdateTrays;


procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_CreateTray             := BindProcedure(AHandle, 'SDL_CreateTray');
  @SDL_SetTrayIcon            := BindProcedure(AHandle, 'SDL_SetTrayIcon');
  @SDL_SetTrayTooltip         := BindProcedure(AHandle, 'SDL_SetTrayTooltip');
  @SDL_CreateTrayMenu         := BindProcedure(AHandle, 'SDL_CreateTrayMenu');
  @SDL_CreateTraySubmenu      := BindProcedure(AHandle, 'SDL_CreateTraySubmenu');
  @SDL_GetTrayMenu            := BindProcedure(AHandle, 'SDL_GetTrayMenu');
  @SDL_GetTraySubmenu         := BindProcedure(AHandle, 'SDL_GetTraySubmenu');
  @SDL_GetTrayEntries         := BindProcedure(AHandle, 'SDL_GetTrayEntries');
  @SDL_RemoveTrayEntry        := BindProcedure(AHandle, 'SDL_RemoveTrayEntry');
  @SDL_InsertTrayEntryAt      := BindProcedure(AHandle, 'SDL_InsertTrayEntryAt');
  @SDL_SetTrayEntryLabel      := BindProcedure(AHandle, 'SDL_SetTrayEntryLabel');
  @SDL_GetTrayEntryLabel      := BindProcedure(AHandle, 'SDL_GetTrayEntryLabel');
  @SDL_SetTrayEntryChecked    := BindProcedure(AHandle, 'SDL_SetTrayEntryChecked');
  @SDL_GetTrayEntryChecked    := BindProcedure(AHandle, 'SDL_GetTrayEntryChecked');
  @SDL_SetTrayEntryEnabled    := BindProcedure(AHandle, 'SDL_SetTrayEntryEnabled');
  @SDL_GetTrayEntryEnabled    := BindProcedure(AHandle, 'SDL_GetTrayEntryEnabled');
  @SDL_SetTrayEntryCallback   := BindProcedure(AHandle, 'SDL_SetTrayEntryCallback');
  @SDL_ClickTrayEntry         := BindProcedure(AHandle, 'SDL_ClickTrayEntry');
  @SDL_DestroyTray            := BindProcedure(AHandle, 'SDL_DestroyTray');
  @SDL_GetTrayEntryParent     := BindProcedure(AHandle, 'SDL_GetTrayEntryParent');
  @SDL_GetTrayMenuParentEntry := BindProcedure(AHandle, 'SDL_GetTrayMenuParentEntry');
  @SDL_GetTrayMenuParentTray  := BindProcedure(AHandle, 'SDL_GetTrayMenuParentTray');
  @SDL_UpdateTrays            := BindProcedure(AHandle, 'SDL_UpdateTrays');
end;

end.
