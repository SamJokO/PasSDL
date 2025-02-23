unit SDL.blendmode;

(*==============================================================================

  - PasSDL (Based on SDL)

  - Author  : samjoko@gmail.com (https://github.com/SamJokO/PasSDL)

  - License : BSD-2-Caluse license

=============================================================================*)

interface

uses
  SDL.PascalEntry,
  SDL.stdinc;

type
  TSDL_BlendMode              = Uint32;
  PSDL_BlendMode              = ^TSDL_BlendMode;

const
  SDL_BLENDMODE_NONE          = $00000000;
  SDL_BLENDMODE_BLEND         = $00000001;
  SDL_BLENDMODE_BLEND_PREMULTIPLIED
                              = $00000010;
  SDL_BLENDMODE_ADD           = $00000002;
  SDL_BLENDMODE_ADD_PREMULTIPLIED
                              = $00000020;
  SDL_BLENDMODE_MOD           = $00000004;
  SDL_BLENDMODE_MUL           = $00000008;
  SDL_BLENDMODE_INVALID       = $7FFFFFFF;

type
  TSDL_BlendOperation         = (
                                  SDL_BLENDOPERATION_ADD          = $1,
                                  SDL_BLENDOPERATION_SUBTRACT     = $2,
                                  SDL_BLENDOPERATION_REV_SUBTRACT = $3,
                                  SDL_BLENDOPERATION_MINIMUM      = $4,
                                  SDL_BLENDOPERATION_MAXIMUM      = $5
                                );
  PSDL_BlendOperation = ^TSDL_BlendOperation;

  TSDL_BlendFactor            = (
                                  SDL_BLENDFACTOR_ZERO            = $1,
                                  SDL_BLENDFACTOR_ONE             = $2,
                                  SDL_BLENDFACTOR_SRC_COLOR       = $3,
                                  SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR   = $4,
                                  SDL_BLENDFACTOR_SRC_ALPHA       = $5,
                                  SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA   = $6,
                                  SDL_BLENDFACTOR_DST_COLOR       = $7,
                                  SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR   = $8,
                                  SDL_BLENDFACTOR_DST_ALPHA       = $9,
                                  SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA   = $A
                                );
  PSDL_BlendFactor = ^TSDL_BlendFactor;

  /// <summary>
  ///  Compose a custom blend mode for renderers.
  /// </summary>
  TSDL_ComposeCustomBlendMode = function (ASrcColorFactor: TSDL_BlendFactor; ADstColorFactor: TSDL_BlendFactor; AColorOperation: TSDL_BlendOperation; ASrcAlphaFactor: TSDL_BlendFactor; ADstAlphaFactor: TSDL_BlendFactor; AAlphaOperation: TSDL_BlendOperation): TSDL_BlendMode; cdecl;

var
  SDL_ComposeCustomBlendMode  : TSDL_ComposeCustomBlendMode;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_ComposeCustomBlendMode := BindProcedure(AHandle, 'SDL_ComposeCustomBlendMode');
end;

end.
