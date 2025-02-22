unit SDL.audio;

{$I SDL.inc}

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.iostream,
  SDL.properties;

const
  SDL_AUDIO_MASK_BITSIZE      = $FF;
  SDL_AUDIO_MASK_FLOAT        = (1 shl 8);
  SDL_AUDIO_MASK_BIG_ENDIAN   = (1 shl 12);
  SDL_AUDIO_MASK_SIGNED       = (1 shl 15);

type
  TSDL_AudioFormat            = UInt32;
  PSDL_AudioFormat            = ^TSDL_AudioFormat;

const
  SDL_AUDIO_UNKNOWN           = $0000;
  SDL_AUDIO_U8                = $0008;
  SDL_AUDIO_S8                = $8008;
  SDL_AUDIO_S16LE             = $8010;
  SDL_AUDIO_S16BE             = $9010;
  SDL_AUDIO_S32LE             = $8020;
  SDL_AUDIO_S32BE             = $9020;
  SDL_AUDIO_F32LE             = $8120;
  SDL_AUDIO_F32BE             = $9120;

// System byte order is Little-endian
{$IF DEFINED(LITTLE_ENDIAN)}
  SDL_AUDIO_S16               = SDL_AUDIO_S16LE;
  SDL_AUDIO_S32               = SDL_AUDIO_S32LE;
  SDL_AUDIO_F32               = SDL_AUDIO_F32LE;
{$ELSE}
  SDL_AUDIO_S16               = SDL_AUDIO_S16BE;
  SDL_AUDIO_S32               = SDL_AUDIO_S32BE;
  SDL_AUDIO_F32               = SDL_AUDIO_F32BE;
{$ENDIF}

  function SDL_AUDIO_BITSIZE(AValue: TSDL_AudioFormat): TSDL_AudioFormat; inline;
  function SDL_AUDIO_BYTESIZE(AValue: TSDL_AudioFormat): TSDL_AudioFormat; inline;
  function SDL_AUDIO_ISFLOAT(AValue: TSDL_AudioFormat): TSDL_AudioFormat; inline;
  function SDL_AUDIO_ISBIGENDIAN(AValue: TSDL_AudioFormat): UInt32; inline;
  function SDL_AUDIO_ISLITTLEENDIAN(AValue: TSDL_AudioFormat): UInt32; inline;
  function SDL_AUDIO_ISSIGNED(AValue: TSDL_AudioFormat): UInt32; inline;
  function SDL_AUDIO_ISINT(AValue: TSDL_AudioFormat): UInt32; inline;
  function SDL_AUDIO_ISUNSIGNED(AValue: TSDL_AudioFormat): UInt32; inline;

type
  TSDL_AudioDeviceID          = UInt32;
  PSDL_AudioDeviceID          = ^TSDL_AudioDeviceID;

const
  SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK
                              = $FFFFFFFF;
  SDL_AUDIO_DEVICE_DEFAULT_RECORDING
                              = $FFFFFFFE;

type
  TSDL_AudioSpec = record
    format                      : TSDL_AudioFormat;
    channels                    : int;
    freq                        : int;
  end;
  PSDL_AudioSpec = ^TSDL_AudioSpec;

  function SDL_AUDIO_FRAMESIZE(AValue: TSDL_AudioSpec): UInt32; inline;

type
  TSDL_AudioStream = record end;
  PSDL_AudioStream = ^TSDL_AudioStream;
  PPSDL_AudioStream = ^PSDL_AudioStream;

  /// <summary>
  ///  Use this function to get the number of built-in audio drivers.
  /// </summary>
  TSDL_GetNumAudioDrivers     = function (): int; cdecl;

  /// <summary>
  ///  Use this function to get the name of a built in audio driver.
  /// </summary>
  TSDL_GetAudioDriver         = function (AIndex: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the name of the current audio driver.
  /// </summary>
  TSDL_GetCurrentAudioDriver  = function (): PAnsiChar; cdecl;

  /// <summary>
  ///  Get a list of currently-connected audio playback devices.
  /// </summary>
  TSDL_GetAudioPlaybackDevices= function (var ACount: int): PSDL_AudioDeviceID; cdecl;

  /// <summary>
  ///  Get a list of currently-connected audio recording devices.
  /// </summary>
  TSDL_GetAudioRecordingDevices
                              = function (var ACount: int): PSDL_AudioDeviceID; cdecl;

  /// <summary>
  ///  Get the human-readable name of a specific audio device.
  /// </summary>
  TSDL_GetAudioDeviceName     = function (ADevId: TSDL_AudioDeviceID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the current audio format of a specific audio device.
  /// </summary>
  TSDL_GetAudioDeviceFormat   = function (ADevId: TSDL_AudioDeviceID; ASpec: PSDL_AudioSpec; ASample_frames: Pint): bool; cdecl;

  /// <summary>
  ///  Get the current channel map of an audio device.
  /// </summary>
  TSDL_GetAudioDeviceChannelMap
                              = function (ADevId: TSDL_AudioDeviceID; var ACount: int): Pint; cdecl;

  /// <summary>
  ///  Open a specific audio device.
  /// </summary>
  TSDL_OpenAudioDevice        = function (ADevId: TSDL_AudioDeviceID; const ASpec: PSDL_AudioSpec): TSDL_AudioDeviceID; cdecl;

  /// <summary>
  ///  Determine if an audio device is physical (instead of logical).
  /// </summary>
  TSDL_IsAudioDevicePhysical  = function (ADevId: TSDL_AudioDeviceID): bool; cdecl;

  /// <summary>
  ///  Determine if an audio device is a playback device (instead of recording).
  /// </summary>
  TSDL_IsAudioDevicePlayback  = function (ADevId: TSDL_AudioDeviceID): bool; cdecl;

  /// <summary>
  ///  Use this function to pause audio playback on a specified device.
  /// </summary>
  TSDL_PauseAudioDevice       = function (ADev: TSDL_AudioDeviceID): bool; cdecl;

  /// <summary>
  ///  Use this function to unpause audio playback on a specified device.
  /// </summary>
  TSDL_ResumeAudioDevice      = function (ADev: TSDL_AudioDeviceID): bool; cdecl;

  /// <summary>
  ///  Use this function to query if an audio device is paused.
  /// </summary>
  TSDL_AudioDevicePaused      = function (ADev: TSDL_AudioDeviceID): bool; cdecl;

  /// <summary>
  ///  Get the gain of an audio device.
  /// </summary>
  TSDL_GetAudioDeviceGain     = function (ADevId: TSDL_AudioDeviceID): float; cdecl;

  /// <summary>
  ///  Change the gain of an audio device.
  /// </summary>
  TSDL_SetAudioDeviceGain     = function (ADevId: TSDL_AudioDeviceID; AGain: float): bool; cdecl;

  /// <summary>
  ///  Close a previously-opened audio device.
  /// </summary>
  TSDL_CloseAudioDevice       = procedure (ADevId: TSDL_AudioDeviceID); cdecl;

  /// <summary>
  ///  Bind a list of audio streams to an audio device.
  /// </summary>
  TSDL_BindAudioStreams       = function (ADevId: TSDL_AudioDeviceID; const AStreams: PPSDL_AudioStream; ANumStreams: int): bool; cdecl;

  /// <summary>
  ///  Bind a single audio stream to an audio device.
  /// </summary>
  TSDL_BindAudioStream        = function (ADevId: TSDL_AudioDeviceID; AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  Unbind a list of audio streams from their audio devices.
  /// </summary>
  TSDL_UnbindAudioStreams     = procedure (const AStreams: PPSDL_AudioStream; ANumStreams: int); cdecl;

  /// <summary>
  ///  Unbind a single audio stream from its audio device.
  /// </summary>
  TSDL_UnbindAudioStream      = procedure (AStream: PSDL_AudioStream); cdecl;

  /// <summary>
  ///  Query an audio stream for its currently-bound device.
  /// </summary>
  TSDL_GetAudioStreamDevice   = function (AStream: PSDL_AudioStream): TSDL_AudioDeviceID; cdecl;

  /// <summary>
  ///  Create a new audio stream.
  /// </summary>
  TSDL_CreateAudioStream      = function (const ASrc_spec: PSDL_AudioSpec; const ADst_spec: PSDL_AudioSpec): PSDL_AudioStream; cdecl;

  /// <summary>
  ///  Get the properties associated with an audio stream.
  /// </summary>
  TSDL_GetAudioStreamProperties
                              = function (AStream: PSDL_AudioStream): TSDL_PropertiesID; cdecl;
  /// <summary>
  ///  Query the current format of an audio stream.
  /// </summary>
  TSDL_GetAudioStreamFormat   = function (AStream: PSDL_AudioStream; ASrc_spec: PSDL_AudioSpec; ADst_spec: PSDL_AudioSpec): bool; cdecl;

  /// <summary>
  ///  Change the input and output formats of an audio stream.
  /// </summary>
  TSDL_SetAudioStreamFormat   = function (AStream: PSDL_AudioStream; const ASrc_spec: PSDL_AudioSpec; const ADst_spec: PSDL_AudioSpec): bool; cdecl;

  /// <summary>
  ///  Get the frequency ratio of an audio stream.
  /// </summary>
  TSDL_GetAudioStreamFrequencyRatio
                              = function (AStream: PSDL_AudioStream): float; cdecl;

  /// <summary>
  ///  Change the frequency ratio of an audio stream.
  /// </summary>
  TSDL_SetAudioStreamFrequencyRatio
                              = function (AStream: PSDL_AudioStream; ARatio: float): bool; cdecl;

  /// <summary>
  ///  Get the gain of an audio stream.
  /// </summary>
  TSDL_GetAudioStreamGain     = function (AStream: PSDL_AudioStream): float; cdecl;

  /// <summary>
  ///  Change the gain of an audio stream.
  /// </summary>
  TSDL_SetAudioStreamGain     = function (AStream: PSDL_AudioStream; AGain: float): bool; cdecl;

  /// <summary>
  ///  Get the current input channel map of an audio stream.
  /// </summary>
  TSDL_GetAudioStreamInputChannelMap
                              = function (AStream: PSDL_AudioStream; var ACount: int): Pint; cdecl;

  /// <summary>
  ///  Get the current output channel map of an audio stream.
  /// </summary>
  TSDL_GetAudioStreamOutputChannelMap
                              = function (AStream: PSDL_AudioStream; var ACount: int): Pint; cdecl;

  /// <summary>
  ///  Set the current input channel map of an audio stream.
  /// </summary>
  TSDL_SetAudioStreamInputChannelMap
                              = function (AStream: PSDL_AudioStream; const AChmap: Pint; ACount: int): bool; cdecl;

  /// <summary>
  ///  Set the current output channel map of an audio stream.
  /// </summary>
  TSDL_SetAudioStreamOutputChannelMap
                              = function (AStream: PSDL_AudioStream; const AChmap: Pint; ACount: int): bool; cdecl;

  /// <summary>
  ///  Add data to the stream.
  /// </summary>
  TSDL_PutAudioStreamData     = function (AStream: PSDL_AudioStream; const ABuf: Pointer; ALen: int): bool; cdecl;

  /// <summary>
  ///  Get converted/resampled data from the stream.
  /// </summary>
  TSDL_GetAudioStreamData     = function (AStream: PSDL_AudioStream; ABuf: Pointer; ALen: int): int; cdecl;

  /// <summary>
  ///  Get the number of converted/resampled bytes available.
  /// </summary>
  TSDL_GetAudioStreamAvailable= function (AStream: PSDL_AudioStream): int; cdecl;

  /// <summary>
  ///  Get the number of bytes currently queued.
  /// </summary>
  TSDL_GetAudioStreamQueued   = function (AStream: PSDL_AudioStream): int; cdecl;

  /// <summary>
  ///  Tell the stream that you're done sending data, and anything being buffered
  ///  should be converted/resampled and made available immediately.
  /// </summary>
  TSDL_FlushAudioStream       = function (AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  Clear any pending data in the stream.
  /// </summary>
  TSDL_ClearAudioStream       = function (AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  Use this function to pause audio playback on the audio device associated
  ///  with an audio stream.
  /// </summary>
  TSDL_PauseAudioStreamDevice = function (AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  Use this function to unpause audio playback on the audio device associated
  ///  with an audio stream.
  /// </summary>
  TSDL_ResumeAudioStreamDevice= function (AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  Use this function to query if an audio device associated with a stream is
  ///  paused.
  /// </summary>
  TSDL_AudioStreamDevicePaused= function (AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  Lock an audio stream for serialized access.
  /// </summary>
  TSDL_LockAudioStream        = function (AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  Unlock an audio stream for serialized access.
  /// </summary>
  TSDL_UnlockAudioStream      = function (AStream: PSDL_AudioStream): bool; cdecl;

  /// <summary>
  ///  A callback that fires when data passes through an SDL_AudioStream.
  /// </summary>
  TSDL_AudioStreamCallback    = procedure (AUserData: Pointer; AStream: PSDL_AudioStream; AAdditional_amount: int; ATotal_amount: int); cdecl;

  /// <summary>
  ///  Set a callback that runs when data is requested from an audio stream.
  /// </summary>
  TSDL_SetAudioStreamGetCallback
                              = function (AStream: PSDL_AudioStream; ACallback: TSDL_AudioStreamCallback; AUserData: Pointer): bool; cdecl;

  /// <summary>
  ///  Set a callback that runs when data is added to an audio stream.
  /// </summary>
  TSDL_SetAudioStreamPutCallback
                              = function (AStream: PSDL_AudioStream; ACallback: TSDL_AudioStreamCallback; AUserData: Pointer): bool; cdecl;

  /// <summary>
  ///  Free an audio stream.
  /// </summary>
  TSDL_DestroyAudioStream     = procedure (AStream: PSDL_AudioStream); cdecl;

  /// <summary>
  ///  Convenience function for straightforward audio init for the common case.
  /// </summary>
  TSDL_OpenAudioDeviceStream  = function (ADevId: TSDL_AudioDeviceID; const ASpec: PSDL_AudioSpec; ACallback: TSDL_AudioStreamCallback; AUserData: Pointer): PSDL_AudioStream; cdecl;

  /// <summary>
  ///  A callback that fires when data is about to be fed to an audio device.
  /// </summary>
  TSDL_AudioPostmixCallback   = procedure (AUserData: Pointer; const ASpec: PSDL_AudioSpec; ABuffer: float; ABuflen: int); cdecl;

  /// <summary>
  ///  Set a callback that fires when data is about to be fed to an audio device.
  /// </summary>
  TSDL_SetAudioPostmixCallback= function (ADevId: TSDL_AudioDeviceID; ACallback: TSDL_AudioPostmixCallback; AUserData: Pointer): bool; cdecl;

  /// <summary>
  ///  Load the audio data of a WAVE file into memory.
  /// </summary>
  TSDL_LoadWAV_IO             = function (ASrc: PSDL_IOStream; ACloseio: bool; ASpec: PSDL_AudioSpec; AAudio_buf: PPUint8; AAudio_len: PUint32): bool; cdecl;

  /// <summary>
  ///  Loads a WAV from a file path.
  /// </summary>
  TSDL_LoadWAV                = function (const APath: PAnsiChar; ASpec: PSDL_AudioSpec; AAudio_buf: PPUint8; AAudio_len: PUint32): bool; cdecl;

  /// <summary>
  ///  Mix audio data in a specified format.
  /// </summary>
  TSDL_MixAudio               = function (ADst: PUint8; const ASrc: PUint8; AFormat: TSDL_AudioFormat; ALen: Uint32; AVolume: float): bool; cdecl;

  /// <summary>
  ///  Convert some audio data of one format to another format.
  /// </summary>
  TSDL_ConvertAudioSamples    = function (const ASrc_spec: PSDL_AudioSpec; const ASrc_data: PUint8; ASrc_len: int; const ADst_spec: PSDL_AudioSpec; ADst_data: PPUint8; ADst_len: Pint): bool; cdecl;

  /// <summary>
  ///  Get the human readable name of an audio format.
  /// </summary>
  TSDL_GetAudioFormatName     = function (AFormat: TSDL_AudioFormat): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the appropriate memset value for silencing an audio format.
  /// </summary>
  TSDL_GetSilenceValueForFormat
                              = function (AFormat: TSDL_AudioFormat): int; cdecl;

var
  SDL_GetNumAudioDrivers      : TSDL_GetNumAudioDrivers;
  SDL_GetAudioDriver          : TSDL_GetAudioDriver;
  SDL_GetCurrentAudioDriver   : TSDL_GetCurrentAudioDriver;
  SDL_GetAudioPlaybackDevices : TSDL_GetAudioPlaybackDevices;
  SDL_GetAudioRecordingDevices
                              : TSDL_GetAudioRecordingDevices;
  SDL_GetAudioDeviceName      : TSDL_GetAudioDeviceName;
  SDL_GetAudioDeviceFormat    : TSDL_GetAudioDeviceFormat;
  SDL_GetAudioDeviceChannelMap
                              : TSDL_GetAudioDeviceChannelMap;
  SDL_OpenAudioDevice         : TSDL_OpenAudioDevice;
  SDL_IsAudioDevicePhysical   : TSDL_IsAudioDevicePhysical;
  SDL_IsAudioDevicePlayback   : TSDL_IsAudioDevicePlayback;
  SDL_PauseAudioDevice        : TSDL_PauseAudioDevice;
  SDL_ResumeAudioDevice       : TSDL_ResumeAudioDevice;
  SDL_AudioDevicePaused       : TSDL_AudioDevicePaused;
  SDL_GetAudioDeviceGain      : TSDL_GetAudioDeviceGain;
  SDL_SetAudioDeviceGain      : TSDL_SetAudioDeviceGain;
  SDL_CloseAudioDevice        : TSDL_CloseAudioDevice;
  SDL_BindAudioStreams        : TSDL_BindAudioStreams;
  SDL_BindAudioStream         : TSDL_BindAudioStream;
  SDL_UnbindAudioStreams      : TSDL_UnbindAudioStreams;
  SDL_UnbindAudioStream       : TSDL_UnbindAudioStream;
  SDL_GetAudioStreamDevice    : TSDL_GetAudioStreamDevice;
  SDL_CreateAudioStream       : TSDL_CreateAudioStream;
  SDL_GetAudioStreamProperties: TSDL_GetAudioStreamProperties;
  SDL_SetAudioStreamFormat    : TSDL_SetAudioStreamFormat;
  SDL_GetAudioStreamFrequencyRatio
                              : TSDL_GetAudioStreamFrequencyRatio;
  SDL_SetAudioStreamFrequencyRatio
                              : TSDL_SetAudioStreamFrequencyRatio;
  SDL_GetAudioStreamGain      : TSDL_GetAudioStreamGain;
  SDL_SetAudioStreamGain      : TSDL_SetAudioStreamGain;
  SDL_GetAudioStreamInputChannelMap
                              : TSDL_GetAudioStreamInputChannelMap;
  SDL_GetAudioStreamOutputChannelMap
                              : TSDL_GetAudioStreamOutputChannelMap;
  SDL_SetAudioStreamInputChannelMap
                              : TSDL_SetAudioStreamInputChannelMap;
  SDL_SetAudioStreamOutputChannelMap
                              : TSDL_SetAudioStreamOutputChannelMap;
  SDL_PutAudioStreamData      : TSDL_PutAudioStreamData;
  SDL_GetAudioStreamData      : TSDL_GetAudioStreamData;
  SDL_GetAudioStreamAvailable : TSDL_GetAudioStreamAvailable;
  SDL_GetAudioStreamQueued    : TSDL_GetAudioStreamQueued;
  SDL_FlushAudioStream        : TSDL_FlushAudioStream;
  SDL_ClearAudioStream        : TSDL_ClearAudioStream;
  SDL_PauseAudioStreamDevice  : TSDL_PauseAudioStreamDevice;
  SDL_ResumeAudioStreamDevice : TSDL_ResumeAudioStreamDevice;
  SDL_AudioStreamDevicePaused : TSDL_AudioStreamDevicePaused;
  SDL_LockAudioStream         : TSDL_LockAudioStream;
  SDL_UnlockAudioStream       : TSDL_UnlockAudioStream;
//  TSDL_AudioStreamCallback    = procedure (AUserData: Pointer; AStream: PSDL_AudioStream; AAdditional_amount: int; ATotal_amount: int); cdecl;
  SDL_SetAudioStreamGetCallback
                              : TSDL_SetAudioStreamGetCallback;
  SDL_SetAudioStreamPutCallback
                              : TSDL_SetAudioStreamPutCallback;
  SDL_DestroyAudioStream      : TSDL_DestroyAudioStream;
  SDL_OpenAudioDeviceStream   : TSDL_OpenAudioDeviceStream;
//  TSDL_AudioPostmixCallback   = procedure (AUserData: Pointer; const ASpec: PSDL_AudioSpec; ABuffer: float; ABuflen: int); cdecl;
  SDL_SetAudioPostmixCallback : TSDL_SetAudioPostmixCallback;
  SDL_LoadWAV_IO              : TSDL_LoadWAV_IO;
  SDL_LoadWAV                 : TSDL_LoadWAV;
  SDL_MixAudio                : TSDL_MixAudio;
  SDL_ConvertAudioSamples     : TSDL_ConvertAudioSamples;
  SDL_GetAudioFormatName      : TSDL_GetAudioFormatName;
  SDL_GetSilenceValueForFormat: TSDL_GetSilenceValueForFormat;

procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_AUDIO_BITSIZE(AValue: TSDL_AudioFormat): TSDL_AudioFormat; inline;
begin
  Result                      := AValue and SDL_AUDIO_MASK_BITSIZE;
end;

function SDL_AUDIO_BYTESIZE(AValue: TSDL_AudioFormat): TSDL_AudioFormat; inline;
begin
  Result                      := SDL_AUDIO_BITSIZE(AValue) div 8;
end;

function SDL_AUDIO_ISFLOAT(AValue: TSDL_AudioFormat): TSDL_AudioFormat; inline;
begin
  Result                      := AValue and SDL_AUDIO_MASK_FLOAT;
end;

function SDL_AUDIO_ISBIGENDIAN(AValue: TSDL_AudioFormat): UInt32; inline;
begin
  Result                      := AValue and SDL_AUDIO_MASK_BIG_ENDIAN;
end;

function SDL_AUDIO_ISLITTLEENDIAN(AValue: TSDL_AudioFormat): UInt32; inline;
begin
  Result                      := not SDL_AUDIO_ISBIGENDIAN(AValue);
end;

function SDL_AUDIO_ISSIGNED(AValue: TSDL_AudioFormat): UInt32; inline;
begin
  Result                      := AValue and SDL_AUDIO_MASK_SIGNED;
end;

function SDL_AUDIO_ISINT(AValue: TSDL_AudioFormat): UInt32; inline;
begin
  Result                      := not SDL_AUDIO_ISFLOAT(AValue);
end;

function SDL_AUDIO_ISUNSIGNED(AValue: TSDL_AudioFormat): UInt32; inline;
begin
  Result                      := not SDL_AUDIO_ISSIGNED(AValue);
end;

function SDL_AUDIO_FRAMESIZE(AValue: TSDL_AudioSpec): UInt32; inline;
begin
  Result                      := SDL_AUDIO_BYTESIZE(AValue.format) * AValue.channels;
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetNumAudioDrivers     := BindProcedure(AHandle, 'SDL_GetNumAudioDrivers');
  @SDL_GetAudioDriver         := BindProcedure(AHandle, 'SDL_GetAudioDriver');
  @SDL_GetCurrentAudioDriver  := BindProcedure(AHandle, 'SDL_GetCurrentAudioDriver');
  @SDL_GetAudioPlaybackDevices:= BindProcedure(AHandle, 'SDL_GetAudioPlaybackDevices');
  @SDL_GetAudioRecordingDevices
                              := BindProcedure(AHandle, 'SDL_GetAudioRecordingDevices');
  @SDL_GetAudioDeviceName     := BindProcedure(AHandle, 'SDL_GetAudioDeviceName');
  @SDL_GetAudioDeviceFormat   := BindProcedure(AHandle, 'SDL_GetAudioDeviceFormat');
  @SDL_GetAudioDeviceChannelMap
                              := BindProcedure(AHandle, 'SDL_GetAudioDeviceChannelMap');
  @SDL_OpenAudioDevice        := BindProcedure(AHandle, 'SDL_OpenAudioDevice');
  @SDL_IsAudioDevicePhysical  := BindProcedure(AHandle, 'SDL_IsAudioDevicePhysical');
  @SDL_IsAudioDevicePlayback  := BindProcedure(AHandle, 'SDL_IsAudioDevicePlayback');
  @SDL_PauseAudioDevice       := BindProcedure(AHandle, 'SDL_PauseAudioDevice');
  @SDL_ResumeAudioDevice      := BindProcedure(AHandle, 'SDL_ResumeAudioDevice');
  @SDL_AudioDevicePaused      := BindProcedure(AHandle, 'SDL_AudioDevicePaused');
  @SDL_GetAudioDeviceGain     := BindProcedure(AHandle, 'SDL_GetAudioDeviceGain');
  @SDL_SetAudioDeviceGain     := BindProcedure(AHandle, 'SDL_SetAudioDeviceGain');
  @SDL_CloseAudioDevice       := BindProcedure(AHandle, 'SDL_CloseAudioDevice');
  @SDL_BindAudioStreams       := BindProcedure(AHandle, 'SDL_BindAudioStreams');
  @SDL_BindAudioStream        := BindProcedure(AHandle, 'SDL_BindAudioStream');
  @SDL_UnbindAudioStreams     := BindProcedure(AHandle, 'SDL_UnbindAudioStreams');
  @SDL_UnbindAudioStream      := BindProcedure(AHandle, 'SDL_UnbindAudioStream');
  @SDL_GetAudioStreamDevice   := BindProcedure(AHandle, 'SDL_GetAudioStreamDevice');
  @SDL_CreateAudioStream      := BindProcedure(AHandle, 'SDL_CreateAudioStream');
  @SDL_GetAudioStreamProperties
                              := BindProcedure(AHandle, 'SDL_GetAudioStreamProperties');
  @SDL_SetAudioStreamFormat   := BindProcedure(AHandle, 'SDL_SetAudioStreamFormat');
  @SDL_GetAudioStreamFrequencyRatio
                              := BindProcedure(AHandle, 'SDL_GetAudioStreamFrequencyRatio');
  @SDL_SetAudioStreamFrequencyRatio
                              := BindProcedure(AHandle, 'SDL_SetAudioStreamFrequencyRatio');
  @SDL_GetAudioStreamGain     := BindProcedure(AHandle, 'SDL_GetAudioStreamGain');
  @SDL_SetAudioStreamGain     := BindProcedure(AHandle, 'SDL_SetAudioStreamGain');
  @SDL_GetAudioStreamInputChannelMap
                              := BindProcedure(AHandle, 'SDL_GetAudioStreamInputChannelMap');
  @SDL_GetAudioStreamOutputChannelMap
                              := BindProcedure(AHandle, 'SDL_GetAudioStreamOutputChannelMap');
  @SDL_SetAudioStreamInputChannelMap
                              := BindProcedure(AHandle, 'SDL_SetAudioStreamInputChannelMap');
  @SDL_SetAudioStreamOutputChannelMap
                              := BindProcedure(AHandle, 'SDL_SetAudioStreamOutputChannelMap');
  @SDL_PutAudioStreamData     := BindProcedure(AHandle, 'SDL_PutAudioStreamData');
  @SDL_GetAudioStreamData     := BindProcedure(AHandle, 'SDL_GetAudioStreamData');
  @SDL_GetAudioStreamAvailable:= BindProcedure(AHandle, 'SDL_GetAudioStreamAvailable');
  @SDL_GetAudioStreamQueued   := BindProcedure(AHandle, 'SDL_GetAudioStreamQueued');
  @SDL_FlushAudioStream       := BindProcedure(AHandle, 'SDL_FlushAudioStream');
  @SDL_ClearAudioStream       := BindProcedure(AHandle, 'SDL_ClearAudioStream');
  @SDL_PauseAudioStreamDevice := BindProcedure(AHandle, 'SDL_PauseAudioStreamDevice');
  @SDL_ResumeAudioStreamDevice:= BindProcedure(AHandle, 'SDL_ResumeAudioStreamDevice');
  @SDL_AudioStreamDevicePaused:= BindProcedure(AHandle, 'SDL_AudioStreamDevicePaused');
  @SDL_LockAudioStream        := BindProcedure(AHandle, 'SDL_LockAudioStream');
  @SDL_UnlockAudioStream      := BindProcedure(AHandle, 'SDL_UnlockAudioStream');
//  TSDL_AudioStreamCallback    = procedure (AUserData: Pointer; AStream: PSDL_AudioStream; AAdditional_amount: int; ATotal_amount: int); cdecl;
  @SDL_SetAudioStreamGetCallback
                              := BindProcedure(AHandle, 'SDL_SetAudioStreamGetCallback');
  @SDL_SetAudioStreamPutCallback
                              := BindProcedure(AHandle, 'SDL_SetAudioStreamPutCallback');
  @SDL_DestroyAudioStream     := BindProcedure(AHandle, 'SDL_DestroyAudioStream');
  @SDL_OpenAudioDeviceStream  := BindProcedure(AHandle, 'SDL_OpenAudioDeviceStream');
//  TSDL_AudioPostmixCallback   = procedure (AUserData: Pointer; const ASpec: PSDL_AudioSpec; ABuffer: float; ABuflen: int); cdecl;
  @SDL_SetAudioPostmixCallback:= BindProcedure(AHandle, 'SDL_SetAudioPostmixCallback');
  @SDL_LoadWAV_IO             := BindProcedure(AHandle, 'SDL_LoadWAV_IO');
  @SDL_LoadWAV                := BindProcedure(AHandle, 'SDL_LoadWAV');
  @SDL_MixAudio               := BindProcedure(AHandle, 'SDL_MixAudio');
  @SDL_ConvertAudioSamples    := BindProcedure(AHandle, 'SDL_ConvertAudioSamples');
  @SDL_GetAudioFormatName     := BindProcedure(AHandle, 'SDL_GetAudioFormatName');
  @SDL_GetSilenceValueForFormat
                              := BindProcedure(AHandle, 'SDL_GetSilenceValueForFormat');
end;



end.
