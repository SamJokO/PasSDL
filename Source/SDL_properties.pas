unit SDL_properties;

interface

uses
  SDL.Types,
  SDL_stdinc;

type
  TSDL_PropertiesID           = Uint32;
  PSDL_PropertiesID           = ^TSDL_PropertiesID;

  TSDL_PropertyType           = (
                                  SDL_PROPERTY_TYPE_INVALID,
                                  SDL_PROPERTY_TYPE_POINTER,
                                  SDL_PROPERTY_TYPE_STRING,
                                  SDL_PROPERTY_TYPE_NUMBER,
                                  SDL_PROPERTY_TYPE_FLOAT,
                                  SDL_PROPERTY_TYPE_BOOLEAN
                                );
  PSDL_PropertyType           = ^TSDL_PropertyType;

  /// <summary>
  ///  Get the global SDL properties.
  /// </summary>
  TSDL_GetGlobalProperties    = function (): TSDL_PropertiesID; cdecl;

  /// <summary>
  ///  Create a group of properties.
  /// </summary>
  TSDL_CreateProperties       = function (): TSDL_PropertiesID; cdecl;

  /// <summary>
  ///  Copy a group of properties.
  /// </summary>
  TSDL_CopyProperties         = function (Asrc: TSDL_PropertiesID; Adst: TSDL_PropertiesID): bool; cdecl;

  /// <summary>
  ///  Lock a group of properties.
  /// </summary>
  TSDL_LockProperties         = function (Aprops: TSDL_PropertiesID): bool; cdecl;

  /// <summary>
  ///  Unlock a group of properties.
  /// </summary>
  TSDL_UnlockProperties       = procedure (Aprops: TSDL_PropertiesID); cdecl;

  /// <summary>
  ///  A callback used to free resources when a property is deleted.
  /// </summary>
  TSDL_CleanupPropertyCallback= procedure (Auserdata: Pointer; Avalue: Pointer); cdecl;

  /// <summary>
  ///  Set a pointer property in a group of properties with a cleanup function
  ///  that is called when the property is deleted.
  /// </summary>
  TSDL_SetPointerPropertyWithCleanup
                              = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Avalue: Pointer; Acleanup: TSDL_CleanupPropertyCallback; Auserdata: Pointer): bool; cdecl;

  /// <summary>
  ///  Set a pointer property in a group of properties.
  /// </summary>
  TSDL_SetPointerProperty     = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Avalue: Pointer): bool; cdecl;

  /// <summary>
  ///  Set a string property in a group of properties.
  /// </summary>
  TSDL_SetStringProperty      = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; const Avalue: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Set an integer property in a group of properties.
  /// </summary>
  TSDL_SetNumberProperty      = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Avalue: Sint64): bool; cdecl;

  /// <summary>
  ///  Set a floating point property in a group of properties.
  /// </summary>
  TSDL_SetFloatProperty       = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Avalue: float): bool; cdecl;

  /// <summary>
  ///  Set a boolean property in a group of properties.
  /// </summary>
  TSDL_SetBooleanProperty     = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Avalue: bool): bool; cdecl;

  /// <summary>
  ///  Return whether a property exists in a group of properties.
  /// </summary>
  TSDL_HasProperty            = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Get the type of a property in a group of properties.
  /// </summary>
  TSDL_GetPropertyType        = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar): TSDL_PropertyType; cdecl;

  /// <summary>
  ///  Get a pointer property from a group of properties.
  /// </summary>
  TSDL_GetPointerProperty     = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Adefault_value: Pointer): Pointer; cdecl;

  /// <summary>
  ///  Get a string property from a group of properties.
  /// </summary>
  TSDL_GetStringProperty      = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; const Adefault_value: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Get a number property from a group of properties.
  /// </summary>
  TSDL_GetNumberProperty      = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Adefault_value: Sint64): Sint64; cdecl;

  /// <summary>
  ///  Get a floating point property from a group of properties.
  /// </summary>
  TSDL_GetFloatProperty       = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Adefault_value: float): float; cdecl;

  /// <summary>
  ///  Get a boolean property from a group of properties.
  /// </summary>
  TSDL_GetBooleanProperty     = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar; Adefault_value: bool): bool; cdecl;

  /// <summary>
  ///  Clear a property from a group of properties.
  /// </summary>
  TSDL_ClearProperty          = function (Aprops: TSDL_PropertiesID; const Aname: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  A callback used to enumerate all the properties in a group of properties.
  /// </summary>
  TSDL_EnumeratePropertiesCallback
                              = procedure (Auserdata: Pointer; Aprops: TSDL_PropertiesID; const Aname: PAnsiChar); cdecl;

  /// <summary>
  ///  Enumerate the properties contained in a group of properties.
  /// </summary>
  TSDL_EnumerateProperties    = function (Aprops: TSDL_PropertiesID; Acallback: TSDL_EnumeratePropertiesCallback; Auserdata: Pointer): bool; cdecl;

  /// <summary>
  ///  Destroy a group of properties.
  /// </summary>
  TSDL_DestroyProperties      = procedure (Aprops: TSDL_PropertiesID); cdecl;

var
  SDL_GetGlobalProperties     : TSDL_GetGlobalProperties;
  SDL_CreateProperties        : TSDL_CreateProperties;
  SDL_CopyProperties          : TSDL_CopyProperties;
  SDL_LockProperties          : TSDL_LockProperties;
  SDL_UnlockProperties        : TSDL_UnlockProperties;
  SDL_SetPointerPropertyWithCleanup
                              : TSDL_SetPointerPropertyWithCleanup;
  SDL_SetPointerProperty      : TSDL_SetPointerProperty;
  SDL_SetStringProperty       : TSDL_SetStringProperty;
  SDL_SetNumberProperty       : TSDL_SetNumberProperty;
  SDL_SetFloatProperty        : TSDL_SetFloatProperty;
  SDL_SetBooleanProperty      : TSDL_SetBooleanProperty;
  SDL_HasProperty             : TSDL_HasProperty;
  SDL_GetPropertyType         : TSDL_GetPropertyType;
  SDL_GetPointerProperty      : TSDL_GetPointerProperty;
  SDL_GetStringProperty       : TSDL_GetStringProperty;
  SDL_GetNumberProperty       : TSDL_GetNumberProperty;
  SDL_GetFloatProperty        : TSDL_GetFloatProperty;
  SDL_GetBooleanProperty      : TSDL_GetBooleanProperty;
  SDL_ClearProperty           : TSDL_ClearProperty;
  SDL_EnumerateProperties     : TSDL_EnumerateProperties;
  SDL_DestroyProperties       : TSDL_DestroyProperties;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetGlobalProperties    := BindProcedure(AHandle, 'SDL_GetGlobalProperties');
  @SDL_CreateProperties       := BindProcedure(AHandle, 'SDL_CreateProperties');
  @SDL_CopyProperties         := BindProcedure(AHandle, 'SDL_CopyProperties');
  @SDL_LockProperties         := BindProcedure(AHandle, 'SDL_LockProperties');
  @SDL_UnlockProperties       := BindProcedure(AHandle, 'SDL_UnlockProperties');
  @SDL_SetPointerPropertyWithCleanup
                              := BindProcedure(AHandle, 'SDL_SetPointerPropertyWithCleanup');
  @SDL_SetPointerProperty     := BindProcedure(AHandle, 'SDL_SetPointerProperty');
  @SDL_SetStringProperty      := BindProcedure(AHandle, 'SDL_SetStringProperty');
  @SDL_SetNumberProperty      := BindProcedure(AHandle, 'SDL_SetNumberProperty');
  @SDL_SetFloatProperty       := BindProcedure(AHandle, 'SDL_SetFloatProperty');
  @SDL_SetBooleanProperty     := BindProcedure(AHandle, 'SDL_SetBooleanProperty');
  @SDL_HasProperty            := BindProcedure(AHandle, 'SDL_HasProperty');
  @SDL_GetPropertyType        := BindProcedure(AHandle, 'SDL_GetPropertyType');
  @SDL_GetPointerProperty     := BindProcedure(AHandle, 'SDL_GetPointerProperty');
  @SDL_GetStringProperty      := BindProcedure(AHandle, 'SDL_GetStringProperty');
  @SDL_GetNumberProperty      := BindProcedure(AHandle, 'SDL_GetNumberProperty');
  @SDL_GetFloatProperty       := BindProcedure(AHandle, 'SDL_GetFloatProperty');
  @SDL_GetBooleanProperty     := BindProcedure(AHandle, 'SDL_GetBooleanProperty');
  @SDL_ClearProperty          := BindProcedure(AHandle, 'SDL_ClearProperty');
  @SDL_EnumerateProperties    := BindProcedure(AHandle, 'SDL_EnumerateProperties');
  @SDL_DestroyProperties      := BindProcedure(AHandle, 'SDL_DestroyProperties');
end;

end.
