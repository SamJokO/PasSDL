unit SDL.gpu;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.pixels,
  SDL.properties,
  SDL.rect,
  SDL.surface,
  SDL.video;

type
  TSDL_GPUDevice = record end;
  PSDL_GPUDevice = ^TSDL_GPUDevice;

  TSDL_GPUBuffer = record end;
  PSDL_GPUBuffer = ^TSDL_GPUBuffer;
  PPSDL_GPUBuffer = ^PSDL_GPUBuffer;

  TSDL_GPUTransferBuffer = record end;
  PSDL_GPUTransferBuffer = ^TSDL_GPUTransferBuffer;
  PPSDL_GPUTransferBuffer = ^PSDL_GPUTransferBuffer;

  TSDL_GPUTexture = record end;
  PSDL_GPUTexture = ^TSDL_GPUTexture;
  PPSDL_GPUTexture = ^PSDL_GPUTexture;

  TSDL_GPUSampler = record end;
  PSDL_GPUSampler = ^TSDL_GPUSampler;
  PPSDL_GPUSampler = ^PSDL_GPUSampler;

  TSDL_GPUShader = record end;
  PSDL_GPUShader = ^TSDL_GPUShader;
  PPSDL_GPUShader = ^PSDL_GPUShader;

  TSDL_GPUComputePipeline = record end;
  PSDL_GPUComputePipeline = ^TSDL_GPUComputePipeline;
  PPSDL_GPUComputePipeline = ^PSDL_GPUComputePipeline;

  TSDL_GPUGraphicsPipeline = record end;
  PSDL_GPUGraphicsPipeline = ^TSDL_GPUGraphicsPipeline;
  PPSDL_GPUGraphicsPipeline = ^PSDL_GPUGraphicsPipeline;

  TSDL_GPUCommandBuffer = record end;
  PSDL_GPUCommandBuffer = ^TSDL_GPUCommandBuffer;
  PPSDL_GPUCommandBuffer = ^PSDL_GPUCommandBuffer;

  TSDL_GPURenderPass = record end;
  PSDL_GPURenderPass = ^TSDL_GPURenderPass;
  PPSDL_GPURenderPass = ^PSDL_GPURenderPass;

  TSDL_GPUComputePass = record end;
  PSDL_GPUComputePass = ^TSDL_GPUComputePass;
  PPSDL_GPUComputePass = ^PSDL_GPUComputePass;

  TSDL_GPUCopyPass = record end;
  PSDL_GPUCopyPass = ^TSDL_GPUCopyPass;
  PPSDL_GPUCopyPass = ^PSDL_GPUCopyPass;

  TSDL_GPUFence = record end;
  PSDL_GPUFence = ^TSDL_GPUFence;
  PPSDL_GPUFence = ^PSDL_GPUFence;

  TSDL_GPUPrimitiveType       = (
                                  SDL_GPU_PRIMITIVETYPE_TRIANGLELIST,
                                  SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP,
                                  SDL_GPU_PRIMITIVETYPE_LINELIST,
                                  SDL_GPU_PRIMITIVETYPE_LINESTRIP,
                                  SDL_GPU_PRIMITIVETYPE_POINTLIST
                                );
  PSDL_GPUPrimitiveType       = ^TSDL_GPUPrimitiveType;

  TSDL_GPULoadOp              = (
                                  SDL_GPU_LOADOP_LOAD,
                                  SDL_GPU_LOADOP_CLEAR,
                                  SDL_GPU_LOADOP_DONT_CARE
                                );
  PSDL_GPULoadOp              = ^TSDL_GPULoadOp;

  TSDL_GPUStoreOp             = (
                                  SDL_GPU_STOREOP_STORE,
                                  SDL_GPU_STOREOP_DONT_CARE,
                                  SDL_GPU_STOREOP_RESOLVE,
                                  SDL_GPU_STOREOP_RESOLVE_AND_STORE
                                );
  PSDL_GPUStoreOp             = ^TSDL_GPUStoreOp;

  TSDL_GPUIndexElementSize    = (
                                  SDL_GPU_INDEXELEMENTSIZE_16BIT,
                                  SDL_GPU_INDEXELEMENTSIZE_32BIT
                                );
  PSDL_GPUIndexElementSize    = ^TSDL_GPUIndexElementSize;

  TSDL_GPUTextureFormat       = (
                                  SDL_GPU_TEXTUREFORMAT_INVALID,

                                  { Unsigned Normalized Float Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_A8_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_R8_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_R8G8_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_R16_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
                                  { Compressed Unsigned Normalized Float Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM,
                                  { Compressed Signed Float Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT,
                                  { Compressed Unsigned Float Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT,
                                  { Signed Normalized Float Color Formats   }
                                  SDL_GPU_TEXTUREFORMAT_R8_SNORM,
                                  SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
                                  SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
                                  SDL_GPU_TEXTUREFORMAT_R16_SNORM,
                                  SDL_GPU_TEXTUREFORMAT_R16G16_SNORM,
                                  SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM,
                                  { Signed Float Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
                                  { Unsigned Float Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT,
                                  { Unsigned Integer Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_R8_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R16_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R32_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R32G32_UINT,
                                  SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT,
                                  { Signed Integer Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_R8_INT,
                                  SDL_GPU_TEXTUREFORMAT_R8G8_INT,
                                  SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT,
                                  SDL_GPU_TEXTUREFORMAT_R16_INT,
                                  SDL_GPU_TEXTUREFORMAT_R16G16_INT,
                                  SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT,
                                  SDL_GPU_TEXTUREFORMAT_R32_INT,
                                  SDL_GPU_TEXTUREFORMAT_R32G32_INT,
                                  SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT,
                                  { SRGB Unsigned Normalized Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB,
                                  { Compressed SRGB Unsigned Normalized Color Formats  }
                                  SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB,
                                  { Depth Formats  }
                                  SDL_GPU_TEXTUREFORMAT_D16_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_D24_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
                                  SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT,
                                  { Compressed ASTC Normalized Float Color Formats }
                                  SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM,
                                  { Compressed SRGB ASTC Normalized Float Color Formats }
                                  SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB,
                                  { Compressed ASTC Signed Float Color Formats }
                                  SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT,
                                  SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT
                                );
  PSDL_GPUTextureFormat       = ^TSDL_GPUTextureFormat;

  TSDL_GPUTextureUsageFlags   = Uint32;

const
  SDL_GPU_TEXTUREUSAGE_SAMPLER                                  = 1 shl 0;
  SDL_GPU_TEXTUREUSAGE_COLOR_TARGET                             = 1 shl 1;
  SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET                     = 1 shl 2;
  SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ                    = 1 shl 3;
  SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ                     = 1 shl 4;
  SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE                    = 1 shl 5;
  SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE  = 1 shl 6;

type
  TSDL_GPUTextureType         = (
                                  SDL_GPU_TEXTURETYPE_2D,
                                  SDL_GPU_TEXTURETYPE_2D_ARRAY,
                                  SDL_GPU_TEXTURETYPE_3D,
                                  SDL_GPU_TEXTURETYPE_CUBE,
                                  SDL_GPU_TEXTURETYPE_CUBE_ARRAY
                                );
  PSDL_GPUTextureType         = ^TSDL_GPUTextureType;

  TSDL_GPUSampleCount         = (
                                  SDL_GPU_SAMPLECOUNT_1,
                                  SDL_GPU_SAMPLECOUNT_2,
                                  SDL_GPU_SAMPLECOUNT_4,
                                  SDL_GPU_SAMPLECOUNT_8
                                );
  PSDL_GPUSampleCount         = ^TSDL_GPUSampleCount;

  TSDL_GPUCubeMapFace         = (
                                  SDL_GPU_CUBEMAPFACE_POSITIVEX,
                                  SDL_GPU_CUBEMAPFACE_NEGATIVEX,
                                  SDL_GPU_CUBEMAPFACE_POSITIVEY,
                                  SDL_GPU_CUBEMAPFACE_NEGATIVEY,
                                  SDL_GPU_CUBEMAPFACE_POSITIVEZ,
                                  SDL_GPU_CUBEMAPFACE_NEGATIVEZ
                                );
  PSDL_GPUCubeMapFace         = ^TSDL_GPUCubeMapFace;

  TSDL_GPUBufferUsageFlags    = Uint32;

const
  SDL_GPU_BUFFERUSAGE_VERTEX                                  = 1 shl 0;
  SDL_GPU_BUFFERUSAGE_INDEX                                   = 1 shl 1;
  SDL_GPU_BUFFERUSAGE_INDIRECT                                = 1 shl 2;
  SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ                   = 1 shl 3;
  SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ                    = 1 shl 4;
  SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE                   = 1 shl 5;

type
  TSDL_GPUTransferBufferUsage = (
                                  SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD,
                                  SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD
                                );
  PSDL_GPUTransferBufferUsage = ^TSDL_GPUTransferBufferUsage;

  TSDL_GPUShaderStage         = (
                                  SDL_GPU_SHADERSTAGE_VERTEX,
                                  SDL_GPU_SHADERSTAGE_FRAGMENT
                                );
  PSDL_GPUShaderStage         = ^TSDL_GPUShaderStage;

  TSDL_GPUShaderFormat        = Uint32;

const
  SDL_GPU_SHADERFORMAT_INVALID                      = 0;
  SDL_GPU_SHADERFORMAT_PRIVATE                      = 1 shl 0;
  SDL_GPU_SHADERFORMAT_SPRIV                        = 1 shl 1;
  SDL_GPU_SHADERFORMAT_DXBC                         = 1 shl 2;
  SDL_GPU_SHADERFORMAT_DXIL                         = 1 shl 3;
  SDL_GPU_SHADERFORMAT_MSL                          = 1 shl 4;
  SDL_GPU_SHADERFORMAT_METALLIB                     = 1 shl 5;

type
  TSDL_GPUVertexElementFormat = (
                                  SDL_GPU_VERTEXELEMENTFORMAT_INVALID,

                                  { 32-bit Signed Integers  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_INT,
                                  SDL_GPU_VERTEXELEMENTFORMAT_INT2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_INT3,
                                  SDL_GPU_VERTEXELEMENTFORMAT_INT4,

                                  { 32-bit Unsigned Integers  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_UINT,
                                  SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
                                  SDL_GPU_VERTEXELEMENTFORMAT_UINT4,

                                  { 32-bit Floats  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
                                  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
                                  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,

                                  { 8-bit Signed Integers  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,

                                  { 8-bit Unsigned Integers  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,

                                  { 8-bit Signed Normalized  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM,
                                  SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM,

                                  { 8-bit Unsigned Normalized  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM,
                                  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM,

                                  { 16-bit Signed Integers  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,

                                  { 16-bit Unsigned Integers  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,

                                  { 16-bit Signed Normalized  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM,
                                  SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM,

                                  { 16-bit Unsigned Normalized  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM,
                                  SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM,

                                  { 16-bit Floats  }
                                  SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
                                  SDL_GPU_VERTEXELEMENTFORMAT_HALF4
                                );
  PSDL_GPUVertexElementFormat = ^TSDL_GPUVertexElementFormat;

  TSDL_GPUVertexInputRate     = (
                                  SDL_GPU_VERTEXINPUTRATE_VERTEX,
                                  SDL_GPU_VERTEXINPUTRATE_INSTANCE
                                );
  PSDL_GPUVertexInputRate     = ^TSDL_GPUVertexInputRate;

  TSDL_GPUFillMode            = (
                                  SDL_GPU_FILLMODE_FILL,
                                  SDL_GPU_FILLMODE_LINE
                                );
  PSDL_GPUFillMode            = ^TSDL_GPUFillMode;


  TSDL_GPUCullMode            = (
                                  SDL_CPU_CULLMODE_NONE,
                                  SDL_CPU_CULLMODE_FRONT,
                                  SDL_CPU_CULLMODE_BACK
                                );
  PSDL_GPUCullMode            = ^TSDL_GPUCullMode;

  TSDL_GPUFrontFace           = (
                                  SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE,
                                  SDL_GPU_FRONTFACE_CLOCKWISE
                                );
  PSDL_GPUFrontFace           = ^TSDL_GPUFrontFace;

  TSDL_GPUCompareOp           = (
                                  SDL_GPU_COMPAREOP_INVALID,
                                  SDL_GPU_COMPAREOP_NEVER,
                                  SDL_GPU_COMPAREOP_LESS,
                                  SDL_GPU_COMPAREOP_EQUAL,
                                  SDL_GPU_COMPAREOP_LESS_OR_EQUAL,
                                  SDL_GPU_COMPAREOP_GREATER,
                                  SDL_GPU_COMPAREOP_NOT_EQUAL,
                                  SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,
                                  SDL_GPU_COMPAREOP_ALWAYS
                                );
  PSDL_GPUCompareOp           = ^TSDL_GPUCompareOp;

  TSDL_GPUStencilOp           = (
                                  SDL_GPU_STENCILOP_INVALID,
                                  SDL_GPU_STENCILOP_KEEP,
                                  SDL_GPU_STENCILOP_ZERO,
                                  SDL_GPU_STENCILOP_REPLACE,
                                  SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,
                                  SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,
                                  SDL_GPU_STENCILOP_INVERT,
                                  SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,
                                  SDL_GPU_STENCILOP_DECREMENT_AND_WRAP
                                );
  PSDL_GPUStencilOp           = ^TSDL_GPUStencilOp;

  TSDL_GPUBlendOp             = (
                                  SDL_GPU_BLENDOP_INVALID,
                                  SDL_GPU_BLENDOP_ADD,
                                  SDL_GPU_BLENDOP_SUBTRACT,
                                  SDL_GPU_BLENDOP_REVERSE_SUBTRACT,
                                  SDL_GPU_BLENDOP_MIN,
                                  SDL_GPU_BLENDOP_MAX
                                );
  PSDL_GPUBlendOp             = ^TSDL_GPUBlendOp;

  TSDL_GPUBlendFactor         = (
                                  SDL_GPU_BLENDFACTOR_INVALID,
                                  SDL_GPU_BLENDFACTOR_ZERO,
                                  SDL_GPU_BLENDFACTOR_ONE,
                                  SDL_GPU_BLENDFACTOR_SRC_COLOR,
                                  SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
                                  SDL_GPU_BLENDFACTOR_DST_COLOR,
                                  SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,
                                  SDL_GPU_BLENDFACTOR_SRC_ALPHA,
                                  SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
                                  SDL_GPU_BLENDFACTOR_DST_ALPHA,
                                  SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
                                  SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,
                                  SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,
                                  SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE
                                );
  PSDL_GPUBlendFactor         = ^TSDL_GPUBlendFactor;

  TSDL_GPUColorComponentflags = Uint8;

const
  SDL_GPU_COLORCOMPONENT_R    = 1 shl 0;
  SDL_GPU_COLORCOMPONENT_G    = 1 shl 1;
  SDL_GPU_COLORCOMPONENT_B    = 1 shl 2;
  SDL_GPU_COLORCOMPONENT_A    = 1 shl 3;

type
  TSDL_GPUFilter              = (
                                  SDL_GPU_FILTER_NEAREST,
                                  SDL_GPU_FILTER_LINEAR
                                );
  PSDL_GPUFilter              = ^TSDL_GPUFilter;

  TSDL_GPUSamplerMipmapMode   = (
                                  SDL_GPU_SAMPLERMIPMAPMODE_NEAREST,
                                  SDL_GPU_SAMPLERMIPMAPMODE_LINEAR
                                );
  PSDL_GPUSamplerMipmapMode   = ^TSDL_GPUSamplerMipmapMode;

  TSDL_GPUSamplerAddressMode  = (
                                  SDL_GPU_SAMPLERADDRESSMODE_REPEAT,
                                  SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT,
                                  SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
                                );
  PSDL_GPUSamplerAddressMode  = ^TSDL_GPUSamplerAddressMode;

  TSDL_GPUPresentMode         = (
                                  SDL_GPU_PRESENTMODE_VSYNC,
                                  SDL_GPU_PRESENTMODE_IMMEDIATE,
                                  SDL_GPU_PRESENTMODE_MAILBOX
                                );
  PSDL_GPUPresentMode         = ^TSDL_GPUPresentMode;

  TSDL_GPUSwapchainComposition= (
                                  SDL_GPU_SWAPCHAINCOMPOSITION_SDR,
                                  SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR,
                                  SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR,
                                  SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084
                                );
  PSDL_GPUSwapchainComposition= ^TSDL_GPUSwapchainComposition;

  TSDL_GPUViewport = record
    x                           : float;
    y                           : float;
    w                           : float;
    h                           : float;
    min_depth                   : float;
    max_depth                   : float;
  end;
  PSDL_GPUViewport = ^TSDL_GPUViewport;

  TSDL_GPUTextureTransferInfo = record
    transfer_buffer             : PSDL_GPUTransferBuffer;
    offset                      : Uint32;
    pixels_per_row              : Uint32;
    rows_per_layer              : Uint32;
  end;
  PSDL_GPUTextureTransferInfo = ^TSDL_GPUTextureTransferInfo;

  TSDL_GPUTransferBufferLocation = record
    transfer_buffer             : PSDL_GPUTransferBuffer;
    offset                      : Uint32;
  end;
  PSDL_GPUTransferBufferLocation = ^TSDL_GPUTransferBufferLocation;

  TSDL_GPUTextureLocation = record
    texture                     : PSDL_GPUTexture;
    mip_level                   : Uint32;
    layer                       : Uint32;
    x                           : Uint32;
    y                           : Uint32;
    z                           : Uint32;
  end;
  PSDL_GPUTextureLocation = ^TSDL_GPUTextureLocation;

  TSDL_GPUTextureRegion = record
    texture                     : PSDL_GPUTexture;
    mip_level                   : Uint32;
    layer                       : Uint32;
    x                           : Uint32;
    y                           : Uint32;
    z                           : Uint32;
    w                           : Uint32;
    h                           : Uint32;
    d                           : Uint32;
  end;
  PSDL_GPUTextureRegion = ^TSDL_GPUTextureRegion;

  TSDL_GPUBlitRegion = record
    texture                     : PSDL_GPUTexture;
    mip_level                   : Uint32;
    layer_or_depth_plane        : Uint32;
    x                           : Uint32;
    y                           : Uint32;
    w                           : Uint32;
    h                           : Uint32;
  end;
  PSDL_GPUBlitRegion = ^TSDL_GPUBlitRegion;

  TSDL_GPUBufferLocation = record
    buffer                      : PSDL_GPUBuffer;
    offset                      : Uint32;
  end;
  PSDL_GPUBufferLocation = ^TSDL_GPUBufferLocation;

  TSDL_GPUBufferRegion = record
    buffer                      : PSDL_GPUBuffer;
    offset                      : Uint32;
    size                        : Uint32;
  end;
  PSDL_GPUBufferRegion = ^TSDL_GPUBufferRegion;

  TSDL_GPUIndirectDrawCommand = record
    num_vertices                : Uint32;
    num_instances               : Uint32;
    first_vertex                : Uint32;
    first_instance              : Uint32;
  end;
  PSDL_GPUIndirectDrawCommand = ^TSDL_GPUIndirectDrawCommand;

  TSDL_GPUIndexedIndirectDrawCommand = record
    num_indices                 : Uint32;
    num_instances               : Uint32;
    first_index                 : Uint32;
    vertex_offset               : Sint32;
    first_instance              : Uint32;
  end;
  PSDL_GPUIndexedIndirectDrawCommand = ^TSDL_GPUIndexedIndirectDrawCommand;

  TSDL_GPUIndirectDispatchCommand = record
    groupcount_x                : Uint32;
    groupcount_y                : Uint32;
    groupcount_z                : Uint32;
  end;
  PSDL_GPUIndirectDispatchCommand = ^TSDL_GPUIndirectDispatchCommand;

  TSDL_GPUSamplerCreateInfo = record
    min_filter                  : TSDL_GPUFilter;
    mag_filter                  : TSDL_GPUFilter;
    mipmap_mode                 : TSDL_GPUSamplerMipmapMode;
    address_mode_u              : TSDL_GPUSamplerAddressMode;
    address_mode_v              : TSDL_GPUSamplerAddressMode;
    address_mode_w              : TSDL_GPUSamplerAddressMode;
    mip_lod_bias                : float;
    max_anisotropy              : float;
    compare_op                  : TSDL_GPUCompareOp;
    min_lod                     : float;
    max_lod                     : float;
    enable_anisotropy           : bool;
    enable_compare              : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;

    props                       : TSDL_PropertiesID;
  end;
  PSDL_GPUSamplerCreateInfo = ^TSDL_GPUSamplerCreateInfo;

  TSDL_GPUVertexBufferDescription = record
    slot                        : Uint32;
    pitch                       : Uint32;
    input_rate                  : TSDL_GPUVertexInputRate;
    instance_step_rate          : Uint32;
  end;
  PSDL_GPUVertexBufferDescription = ^TSDL_GPUVertexBufferDescription;

  TSDL_GPUVertexAttribute = record
    location                    : Uint32;
    buffer_slot                 : Uint32;
    format                      : TSDL_GPUVertexElementFormat;
    offset                      : Uint32;
  end;
  PSDL_GPUVertexAttribute = ^TSDL_GPUVertexAttribute;

  TSDL_GPUVertexInputState = record
    vertex_buffer_descriptions  : PSDL_GPUVertexBufferDescription;
    num_vertex_buffers          : Uint32;
    vertex_attributes           : PSDL_GPUVertexAttribute;
    num_vertex_attributes       : Uint32;
  end;
  PSDL_GPUVertexInputState = ^TSDL_GPUVertexInputState;

  TSDL_GPUStencilOpState = record
    fail_op                     : TSDL_GPUStencilOp;
    pass_op                     : TSDL_GPUStencilOp;
    depth_fail_op               : TSDL_GPUStencilOp;
    compare_op                  : TSDL_GPUCompareOp;
  end;
  PSDL_GPUStencilOpState = ^TSDL_GPUStencilOpState;

  TSDL_GPUColorTargetBlendState = record
    src_color_blendfactor       : TSDL_GPUBlendFactor;
    dst_color_blendfactor       : TSDL_GPUBlendFactor;
    color_blend_op              : TSDL_GPUBlendOp;
    src_alpha_blendfactor       : TSDL_GPUBlendFactor;
    dst_alpha_blendfactor       : TSDL_GPUBlendFactor;
    alpha_blend_op              : TSDL_GPUBlendOp;
    color_write_mask            : TSDL_GPUColorComponentFlags;
    enable_blend                : bool;
    enable_color_write_mask     : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
  end;
  PSDL_GPUColorTargetBlendState = ^TSDL_GPUColorTargetBlendState;

  TSDL_GPUShaderCreateInfo = record
    code_size                   : size_t;
    code                        : PUint8;
    entrypoint                  : PAnsiChar;
    format                      : TSDL_GPUShaderFormat;
    stage                       : TSDL_GPUShaderStage;
    num_sampler                 : Uint32;
    num_storage_textures        : Uint32;
    num_storage_buffers         : Uint32;
    num_uniform_buffers         : Uint32;
  end;
  PSDL_GPUShaderCreateInfo = ^TSDL_GPUShaderCreateInfo;

  TSDL_GPUTextureCreateInfo = record
    &type                       : TSDL_GPUTextureType;
    format                      : TSDL_GPUTextureFormat;
    usage                       : TSDL_GPUTextureUsageFlags;
    width                       : Uint32;
    height                      : Uint32;
    layer_count_or_depth        : Uint32;
    num_levels                  : Uint32;
    sample_count                : TSDL_GPUSampleCount;
    props                       : TSDL_PropertiesID;
  end;
  PSDL_GPUTextureCreateInfo = ^TSDL_GPUTextureCreateInfo;

  TSDL_GPUBufferCreateInfo = record
    usage                       : TSDL_GPUBufferUsageFlags;
    size                        : Uint32;
    props                       : TSDL_PropertiesID;
  end;
  PSDL_GPUBufferCreateInfo = ^TSDL_GPUBufferCreateInfo;

  TSDL_GPUTransferBufferCreateInfo = record
    usage                       : TSDL_GPUTransferBufferUsage;
    size                        : Uint32;
    props                       : TSDL_PropertiesID;
  end;
  PSDL_GPUTransferBufferCreateInfo = ^TSDL_GPUTransferBufferCreateInfo;

  TSDL_GPURasterizerState = record
    fill_mode                   : TSDL_GPUFillMode;
    cull_mode                   : TSDL_GPUCullMode;
    front_face                  : TSDL_GPUFrontFace;
    depth_bias_constant_factor  : float;
    depth_bias_clamp            : float;
    depth_bias_slope_factor     : float;
    enable_depth_bias           : bool;
    enable_depth_clip           : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
  end;
  PSDL_GPURasterizerState = ^TSDL_GPURasterizerState;

  TSDL_GPUMultisampleState = record
    sample_count                : TSDL_GPUSampleCount;
    sample_mask                 : Uint32;
    enable_mask                 : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_GPUMultisampleState = ^TSDL_GPUMultisampleState;

  TSDL_GPUDepthStencilState = record
    compare_op                  : TSDL_GPUCompareOp;
    back_stencil_state          : TSDL_GPUStencilOpState;
    front_stencil_state         : TSDL_GPUStencilOpState;
    compare_mask                : Uint8;
    write_mask                  : Uint8;
    enable_depth_test           : bool;
    enable_depth_write          : bool;
    enable_stencil_test         : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_GPUDepthStencilState = ^TSDL_GPUDepthStencilState;

  TSDL_GPUColorTargetDescription = record
    format                      : TSDL_GPUTextureFormat;
    blend_state                 : TSDL_GPUColorTargetBlendState;
  end;
  PSDL_GPUColorTargetDescription = ^TSDL_GPUColorTargetDescription;

  TSDL_GPUGraphicsPipelineTargetInfo = record
    color_target_description    : TSDL_GPUColorTargetDescription;
    num_color_targets           : Uint32;
    has_depth_stencil_type      : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_GPUGraphicsPipelineTargetInfo = ^TSDL_GPUGraphicsPipelineTargetInfo;

  TSDL_GPUGraphicsPipelineCreateInfo = record
    vertex_shader               : TSDL_GPUShader;
    fragment_shader             : TSDL_GPUShader;
    vertex_input_state          : TSDL_GPUVertexInputState;
    primitive_type              : TSDL_GPUPrimitiveType;
    rasterizer_state            : TSDL_GPURasterizerState;
    multisample_state           : TSDL_GPUMultisampleState;
    depth_stencil_state         : TSDL_GPUDepthStencilState;
    target_info                 : TSDL_GPUGraphicsPipelineTargetInfo;
    props                       : TSDL_PropertiesID;
  end;
  PSDL_GPUGraphicsPipelineCreateInfo = &TSDL_GPUGraphicsPipelineCreateInfo;

  TSDL_GPUComputePipelineCreateInfo = record
    code_size                   : size_t;
    code                        : PUint8;
    entrypoint                  : PAnsiChar;
    format                      : TSDL_GPUShaderFormat;
    num_samplers                : Uint8;
    num_readonly_storage_textures
                                : Uint32;
    num_readonly_storage_buffers: Uint32;
    num_readwrite_storage_textures
                                : Uint32;
    numreadwrite_storage_buffers: Uint32;
    num_uniform_buffers         : Uint32;
    threadcount_x               : Uint32;
    threadcount_y               : Uint32;
    threadcount_z               : Uint32;
    props                       : TSDL_PropertiesID;
  end;
  PSDL_GPUComputePipelineCreateInfo = ^TSDL_GPUComputePipelineCreateInfo;

  TSDL_GPUColorTargetInfo = record
    texture                     : PSDL_GPUTexture;
    mip_level                   : Uint32;
    layer_or_depth_plane        : Uint32;
    clear_color                 : TSDL_FColor;
    load_op                     : TSDL_GPULoadOp;
    store_op                    : TSDL_GPUStoreOp;
    resolve_texture             : PSDL_GPUTexture;
    resolve_mip_level           : Uint32;
    resolve_layer               : Uint32;
    cycle                       : bool;
    cycle_resolve_texture       : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
  end;
  PSDL_GPUColorTargetInfo = ^TSDL_GPUColorTargetInfo;

  TSDL_GPUDepthStencilTargetInfo = record
    texture                     : PSDL_GPUTexture;
    clear_depth                 : float;
    load_op                     : TSDL_GPULoadOp;
    store_op                    : TSDL_GPUStoreOp;
    stencil_load_op             : TSDL_GPULoadOp;
    stencil_store_op            : TSDL_GPUStoreOp;
    cycle                       : bool;
    clear_stencil               : Uint8;
    padding1                    : Uint8;
    padding2                    : Uint8;
  end;
  PSDL_GPUDepthStencilTargetInfo = ^TSDL_GPUDepthStencilTargetInfo;

  TSDL_GPUBlitInfo = record
    source                      : TSDL_GPUBlitRegion;
    destination                 : TSDL_GPUBlitRegion;
    load_op                     : TSDL_GPULoadOp;
    clear_color                 : TSDL_FColor;
    flip_mode                   : TSDL_FlipMode;
    filter                      : TSDL_GPUFilter;
    cycle                       : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_GPUBlitInfo = ^TSDL_GPUBlitInfo;

  TSDL_GPUBufferBinding = record
    buffer                      : PSDL_GPUBuffer;
    offset                      : Uint32;
  end;
  PSDL_GPUBufferBinding = ^TSDL_GPUBufferBinding;

  TSDL_GPUTextureSamplerBinding = record
    texture                     : PSDL_GPUTexture;
    sampler                     : PSDL_GPUSampler;
  end;
  PSDL_GPUTextureSamplerBinding = ^TSDL_GPUTextureSamplerBinding;

  TSDL_GPUStorageBufferReadWriteBinding = record
    buffer                      : PSDL_GPUBuffer;
    cycle                       : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_GPUStorageBufferReadWriteBinding = ^TSDL_GPUStorageBufferReadWriteBinding;

  TSDL_GPUStorageTextureReadWriteBinding = record
    texture                     : PSDL_GPUTexture;
    mip_level                   : Uint32;
    layer                       : Uint32;
    cycle                       : bool;
    padding1                    : Uint8;
    padding2                    : Uint8;
    padding3                    : Uint8;
  end;
  PSDL_GPUStorageTextureReadWriteBinding = ^TSDL_GPUStorageTextureReadWriteBinding;

  /// <summary>
  ///  Checks for GPU runtime support.
  /// </summary>
  TSDL_GPUSupportsShaderFormats
                              = function (AformaT_flags: TSDL_GPUShaderFormat; const Aname: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Checks for GPU runtime support.
  /// </summary>
  TSDL_GPUSupportsProperties  = function (Aprops: TSDL_PropertiesID): bool; cdecl;

  /// <summary>
  ///  Creates a GPU context.
  /// </summary>
  TSDL_CreateGPUDevice        = function (Aformat_flags: TSDL_GPUShaderFormat; Adebug_mode: bool; const Aname: PAnsiChar): PSDL_GPUDevice; cdecl;

  /// <summary>
  ///  Creates a GPU context.
  /// </summary>
  TSDL_CreateGPUDeviceWithProperties
                              = function (Aprops: TSDL_PropertiesID): PSDL_GPUDevice; cdecl;

const
  SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN          = 'SDL.gpu.device.create.debugmode';
  SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN     = 'SDL.gpu.device.create.preferlowpower';
  SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING                = 'SDL.gpu.device.create.name';
  SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN    = 'SDL.gpu.device.create.shaders.private';
  SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN      = 'SDL.gpu.device.create.shaders.spirv';
  SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN       = 'SDL.gpu.device.create.shaders.dxbc';
  SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN       = 'SDL.gpu.device.create.shaders.dxil';
  SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN        = 'SDL.gpu.device.create.shaders.msl';
  SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN   = 'SDL.gpu.device.create.shaders.metallib';
  SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING = 'SDL.gpu.device.create.d3d12.semantic';

type
  /// <summary>
  ///  Destroys a GPU context previously returned by SDL_CreateGPUDevice.
  /// </summary>
  TSDL_DestroyGPUDevice       = procedure (Adevice: PSDL_GPUDevice); cdecl;

  /// <summary>
  ///  Get the number of GPU drivers compiled into SDL.
  /// </summary>
  TSDL_GetNumGPUDrivers       = function (): int; cdecl;

  /// <summary>
  ///  Get the name of a built in GPU driver.
  /// </summary>
  TSDL_GetGPUDriver           = function (Aindex: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Returns the name of the backend used to create this GPU context.
  /// </summary>
  TSDL_GetGPUDeviceDriver     = function (Adevice: PSDL_GPUDevice): PAnsiChar; cdecl;

  /// <summary>
  ///  Returns the supported shader formats for this GPU context.
  /// </summary>
  TSDL_GetGPUShaderFormats    = function (Adevice: PSDL_GPUDevice): TSDL_GPUShaderFormat; cdecl;

  /// <summary>
  ///  Creates a pipeline object to be used in a compute workflow.
  /// </summary>
  TSDL_CreateGPUComputePipeline
                              = function (Adevice: PSDL_GPUDevice; const Acreateinfo: PSDL_GPUComputePipelineCreateInfo): PSDL_GPUComputePipeline; cdecl;

const
  SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING  = 'SDL.gpu.computepipeline.create.name';

type
  /// <summary>
  ///  Creates a pipeline object to be used in a graphics workflow.
  /// </summary>
  TSDL_CreateGPUGraphicsPipeline
                              = function (Adevice: PSDL_GPUDevice; const Acreateinfo: PSDL_GPUGraphicsPipelineCreateInfo): PSDL_GPUGraphicsPipeline; cdecl;

const
  SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING = 'SDL.gpu.graphicspipeline.create.name';

type
  /// <summary>
  ///  Creates a sampler object to be used when binding textures in a graphics
  ///  workflow.
  /// </summary>
  TSDL_CreateGPUSampler       = function (Adevice: PSDL_GPUDevice; const Acreateinfo: PSDL_GPUSamplerCreateInfo): PSDL_GPUSampler; cdecl;

const
  SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING   = 'SDL.gpu.sampler.create.name';

type
  /// <summary>
  ///  Creates a shader to be used when creating a graphics pipeline.
  /// </summary>
  TSDL_CreateGPUShader        = function (Adevice: PSDL_GPUDevice; const Acreateinfo: PSDL_GPUShaderCreateInfo): PSDL_GPUShader; cdecl;

const
  SDL_PROP_GPU_SHADER_CREATE_NAME_STRING  = 'SDL.gpu.shader.create.name';

type
  /// <summary>
  ///  Creates a texture object to be used in graphics or compute workflows.
  /// </summary>
  TSDL_CreateGPUTexture       = function (Adevice: PSDL_GPUDevice; const Acreateinfo: PSDL_GPUTextureCreateInfo): PSDL_GPUTexture; cdecl;

const
  SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT       = 'SDL.gpu.texture.create.d3d12.clear.r';
  SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT       = 'SDL.gpu.texture.create.d3d12.clear.g';
  SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT       = 'SDL.gpu.texture.create.d3d12.clear.b';
  SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT       = 'SDL.gpu.texture.create.d3d12.clear.a';
  SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT   = 'SDL.gpu.texture.create.d3d12.clear.depth';
  SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_UINT8 = 'SDL.gpu.texture.create.d3d12.clear.stencil';
  SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING               = 'SDL.gpu.texture.create.name';

type
  /// <summary>
  ///  Creates a buffer object to be used in graphics or compute workflows.
  /// </summary>
  TSDL_CreateGPUBuffer        = function (Adevice: PSDL_GPUDevice; const Acreateinfo: PSDL_GPUBufferCreateInfo): PSDL_GPUBuffer; cdecl;

const
  SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING  = 'SDL.gpu.buffer.create.name';

type
  /// <summary>
  ///  Creates a transfer buffer to be used when uploading to or downloading from
  ///  graphics resources.
  /// </summary>
  TSDL_CreateGPUTransferBuffer= function (Adevice: PSDL_GPUDevice; const Acreateinfo: PSDL_GPUTransferBufferCreateInfo): PSDL_GPUTransferBuffer; cdecl;

const
  SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING  = 'SDL.gpu.transferbuffer.create.name';

type
  /// <summary>
  ///  Sets an arbitrary string constant to label a buffer.
  /// </summary>
  TSDL_SetGPUBufferName       = procedure (Adevice: PSDL_GPUDevice; Abuffer: PSDL_GPUBuffer; const Atext: PAnsiChar); cdecl;

  /// <summary>
  ///  Sets an arbitrary string constant to label a texture.
  /// </summary>
  TSDL_SetGPUTextureName      = procedure (Adevice: PSDL_GPUDevice; Atexture: PSDL_GPUTexture; const Atext: PAnsiChar); cdecl;

  /// <summary>
  ///  Inserts an arbitrary string label into the command buffer callstream.
  /// </summary>
  TSDL_InsertGPUDebugLabel    = procedure (Acommand_buffer: PSDL_GPUCommandBuffer; const Atext: PAnsiChar); cdecl;

  /// <summary>
  ///  Begins a debug group with an arbitary name.
  /// </summary>
  TSDL_PushGPUDebugGroup      = procedure (Acommand_buffer: PSDL_GPUCommandBuffer; const Aname: PAnsiChar); cdecl;

  /// <summary>
  ///  Ends the most-recently pushed debug group.
  /// </summary>
  TSDL_PopGPUDebugGroup       = procedure (Acommand_buffer: PSDL_GPUCommandBuffer); cdecl;

  /// <summary>
  ///  Frees the given texture as soon as it is safe to do so.
  /// </summary>
  TSDL_ReleaseGPUTexture      = procedure (Adevice: PSDL_GPUDevice; Atexture: PSDL_GPUTexture); cdecl;

  /// <summary>
  ///  Frees the given sampler as soon as it is safe to do so.
  /// </summary>
  TSDL_ReleaseGPUSampler      = procedure (Adevice: PSDL_GPUDevice; Asampler: PSDL_GPUSampler); cdecl;

  /// <summary>
  ///  Frees the given buffer as soon as it is safe to do so.
  /// </summary>
  TSDL_ReleaseGPUBuffer       = procedure (Adevice: PSDL_GPUDevice; Abuffer: PSDL_GPUBuffer); cdecl;

  /// <summary>
  ///  Frees the given transfer buffer as soon as it is safe to do so.
  /// </summary>
  TSDL_ReleaseGPUTransferBuffer
                              = procedure (Adevice: PSDL_GPUDevice; Atransfer_buffer: PSDL_GPUTransferBuffer); cdecl;

  /// <summary>
  ///  Frees the given compute pipeline as soon as it is safe to do so.
  /// </summary>
  TSDL_ReleaseGPUComputePipeline
                              = procedure (Adevice: PSDL_GPUDevice; Acompute_pipeline: PSDL_GPUComputePipeline); cdecl;

  /// <summary>
  ///  Frees the given shader as soon as it is safe to do so.
  /// </summary>
  TSDL_ReleaseGPUShader       = procedure (Adevice: PSDL_GPUDevice; Ashader: PSDL_GPUShader); cdecl;

  /// <summary>
  ///  Frees the given graphics pipeline as soon as it is safe to do so.
  /// </summary>
  TSDL_ReleaseGPUGraphicsPipeline
                              = procedure (Adevice: PSDL_GPUDevice; Agraphics_pipeline: PSDL_GPUGraphicsPipeline); cdecl;

  /// <summary>
  ///  Acquire a command buffer.
  /// </summary>
  TSDL_AcquireGPUCommandBuffer= function (Adevice: PSDL_GPUDevice): PSDL_GPUCommandBuffer; cdecl;

  /// <summary>
  ///  Pushes data to a vertex uniform slot on the command buffer.
  /// </summary>
  TSDL_PushGPUVertexUniformData
                              = procedure (Acommand_buffer: PSDL_GPUCommandBuffer; Aslot_index: Uint32; const Adata: Pointer; Alength: Uint32); cdecl;

  /// <summary>
  ///  Pushes data to a fragment uniform slot on the command buffer.
  /// </summary>
  TSDL_PushGPUFragmentUniformData
                              = procedure (Acommand_buffer: PSDL_GPUCommandBuffer; Aslot_index: Uint32; const Adata: Pointer; Alength: Uint32); cdecl;

  /// <summary>
  ///  Pushes data to a uniform slot on the command buffer.
  /// </summary>
  TSDL_PushGPUComputeUniformData
                              = procedure (Acommand_buffer: PSDL_GPUCommandBuffer; Aslot_index: Uint32; const Adata: Pointer; Alength: Uint32); cdecl;

  /// <summary>
  ///  Begins a render pass on a command buffer.
  /// </summary>
  TSDL_BeginGPURenderPass     = function (Acommand_buffer: PSDL_GPUCommandBuffer; const Acolor_target_infos: PSDL_GPUColorTargetInfo; Anum_color_targets: Uint32; const Adepth_stencil_target_info: PSDL_GPUDepthStencilTargetInfo): PSDL_GPURenderPass; cdecl;

  /// <summary>
  ///  Binds a graphics pipeline on a render pass to be used in rendering.
  /// </summary>
  TSDL_BindGPUGraphicsPipeline= procedure (Arender_pass: PSDL_GPURenderPass; Agraphics_pipeline: PSDL_GPUGraphicsPipeline); cdecl;

  /// <summary>
  ///  Sets the current viewport state on a command buffer.
  /// </summary>
  TSDL_SetGPUViewport         = procedure (Arender_pass: PSDL_GPURenderPass; const Aviewport: PSDL_GPUViewport); cdecl;

  /// <summary>
  ///  Sets the current scissor state on a command buffer.
  /// </summary>
  TSDL_SetGPUScissor          = procedure (Arender_pass: PSDL_GPURenderPass; const Ascissor: PSDL_Rect); cdecl;

  /// <summary>
  ///  Sets the current blend constants on a command buffer.
  /// </summary>
  TSDL_SetGPUBlendConstants   = procedure (Arender_pass: PSDL_GPURenderPass; Ablend_constants: TSDL_FColor); cdecl;

  /// <summary>
  ///  Sets the current stencil reference value on a command buffer.
  /// </summary>
  TSDL_SetGPUStencilReference = procedure (Arender_pass: PSDL_GPURenderPass; Areference: Uint8); cdecl;

  /// <summary>
  ///  Binds vertex buffers on a command buffer for use with subsequent draw
  ///  calls.
  /// </summary>
  TSDL_BindGPUVertexBuffers   = procedure (Arender_pass: PSDL_GPURenderPass; Afirst_slot: Uint32; const Abindings: PSDL_GPUBufferBinding; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds an index buffer on a command buffer for use with subsequent draw
  ///  calls.
  /// </summary>
  TSDL_BindGPUIndexBuffer     = procedure (Arender_pass: PSDL_GPURenderPass; const Abinding: PSDL_GPUBufferBinding; Aindex_element_size: TSDL_GPUIndexElementSize); cdecl;

  /// <summary>
  ///  Binds texture-sampler pairs for use on the vertex shader.
  /// </summary>
  TSDL_BindGPUVertexSamplers  = procedure (ArendeR_pass: PSDL_GPURenderPass; Afirst_slot: Uint32; const Atexture_sampler_bindings: PSDL_GPUTextureSamplerBinding; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds storage textures for use on the vertex shader.
  /// </summary>
  TSDL_BindGPUVertexStorageTextures
                              = procedure (Arender_pass: PSDL_GPURenderPass; Afirst_slot: Uint32; const Astorage_textures: PPSDL_GPUTexture; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds storage buffers for use on the vertex shader.
  /// </summary>
  TSDL_BindGPUVertexStorageBuffers
                              = procedure (Arender_pass: PSDL_GPURenderPass; Afirst_slot: Uint32; const Astorage_buffers: PPSDL_GPUBuffer; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds texture-sampler pairs for use on the fragment shader.
  /// </summary>
  TSDL_BindGPUFragmentSamplers= procedure (Arender_pass: PSDL_GPURenderPass; Afirst_slot: Uint32; const Atexture_sampler_bindings: PSDL_GPUTextureSamplerBinding; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds storage textures for use on the fragment shader.
  /// </summary>
  TSDL_BindGPUFragmentStorageTextures
                              = procedure (Arender_pass: PSDL_GPURenderPass; Afirst_slot: Uint32; const Astorage_texture: PPSDL_GPUTexture; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds storage buffers for use on the fragment shader.
  /// </summary>
  TSDL_BindGPUFragmentStorageBuffers
                              = procedure (Arender_pass: PSDL_GPURenderPass; Afirst_slot: Uint32; const Astorage_buffers: PPSDL_GPUBuffer; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Draws data using bound graphics state with an index buffer and instancing
  ///  enabled.
  /// </summary>
  TSDL_DrawGPUIndexedPrimitives
                              = procedure (Arender_pass: PSDL_GPURenderPass; Anum_indices: Uint32; Anum_instances: Uint32; Afirst_index: Uint32; Avertex_offset: Sint32; Afirst_instance: Uint32); cdecl;

  /// <summary>
  ///  Draws data using bound graphics state.
  /// </summary>
  TSDL_DrawGPUPrimitives      = procedure (Arender_pass: PSDL_GPURenderPass; Anum_vertices: Uint32; Anum_instances: Uint32; Afirst_vertex: Uint32; Afirst_instance: Uint32); cdecl;

  /// <summary>
  ///  Draws data using bound graphics state and with draw parameters set from a
  ///  buffer.
  /// </summary>
  TSDL_DrawGPUPrimitivesIndirect
                              = procedure (Arender_pass: PSDL_GPURenderPass; Abuffer: PSDL_GPUBuffer; Aoffset: Uint32; Adraw_count: Uint32); cdecl;

  /// <summary>
  ///  Draws data using bound graphics state with an index buffer enabled and with
  ///  draw parameters set from a buffer.
  /// </summary>
  TSDL_DrawGPUIndexedPrimitivesIndirect
                              = procedure (Arender_pass: PSDL_GPURenderPass; Abuffer: PSDL_GPUBuffer; Aoffset: Uint32; Adraw_count: Uint32); cdecl;

  /// <summary>
  ///  Ends the given render pass.
  /// </summary>
  TSDL_EndGPURenderPass       = procedure (Arender_pass: PSDL_GPURenderPass); cdecl;

  /// <summary>
  ///  Begins a compute pass on a command buffer.
  /// </summary>
  TSDL_BeginGPUComputePass    = function (Acommand_buffer: PSDL_GPUCommandBuffer; const Astorage_texture_bindings: PSDL_GPUStorageTextureReadWriteBinding; Anum_storage_texture_bindings: Uint32; const Astorage_buffer_bindings: PSDL_GPUStorageBufferReadWriteBinding; Anum_storage_buffer_bindings: Uint32): PSDL_GPUComputePass; cdecl;

  /// <summary>
  ///  Binds a compute pipeline on a command buffer for use in compute dispatch.
  /// </summary>
  TSDL_BindGPUComputePipeline = procedure (Acompute_pass: PSDL_GPUComputePass; Acompute_pipeline: PSDL_GPUComputePipeline); cdecl;

  /// <summary>
  ///  Binds texture-sampler pairs for use on the compute shader.
  /// </summary>
  TSDL_BindGPUComputeSamplers = procedure (Acompute_pass: PSDL_GPUComputePass; Afirst_slot: Uint32; const Atexture_sampler_bindings: PSDL_GPUTextureSamplerBinding; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds storage textures as readonly for use on the compute pipeline.
  /// </summary>
  TSDL_BindGPUComputeStorageTextures
                              = procedure (Acompute_pass: PSDL_GPUComputePass; Afirst_slot: Uint32; const Astorage_textures: PPSDL_GPUTexture; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Binds storage buffers as readonly for use on the compute pipeline.
  /// </summary>
  TSDL_BindGPUComputeStorageBuffers
                              = procedure (Acompute_pass: PSDL_GPUComputePass; Afirst_slot: Uint32; const Astorage_buffers: PPSDL_GPUBuffer; Anum_bindings: Uint32); cdecl;

  /// <summary>
  ///  Dispatches compute work.
  /// </summary>
  TSDL_DispatchGPUCompute     = procedure (Acompute_pass: PSDL_GPUComputePass; Agroupcount_x: Uint32; Agroupcount_y: Uint32; Agroupcount_z: Uint32); cdecl;

  /// <summary>
  ///  Dispatches compute work with parameters set from a buffer.
  /// </summary>
  TSDL_DispatchGPUComputeIndirect
                              = procedure (Acompute_pass: PSDL_GPUComputePass; Abuffer: PSDL_GPUBuffer; Aoffset: Uint32); cdecl;

  /// <summary>
  ///  Ends the current compute pass.
  /// </summary>
  TSDL_EndGPUComputePass      = procedure (Acompute_pass: PSDL_GPUComputePass); cdecl;

  /// <summary>
  ///  Maps a transfer buffer into application address space.
  /// </summary>
  TSDL_MapGPUTransferBuffer   = function (Adevice: PSDL_GPUDevice; Atransfer_buffer: PSDL_GPUTransferBuffer; Acycle: bool): Pointer; cdecl;

  /// <summary>
  ///  Unmaps a previously mapped transfer buffer.
  /// </summary>
  TSDL_UnmapGPUTransferBuffer = procedure (Adevice: PSDL_GPUDevice; Atransfer_buffer: PSDL_GPUTransferBuffer); cdecl;

  /// <summary>
  ///  Begins a copy pass on a command buffer.
  /// </summary>
  TSDL_BeginGPUCopyPass       = function (Acommand_buffer: PSDL_GPUCommandBuffer): PSDL_GPUCopyPass; cdecl;

  /// <summary>
  ///  Uploads data from a transfer buffer to a texture.
  /// </summary>
  TSDL_UploadToGPUTexture     = procedure (Acopy_pass: PSDL_GPUCopyPass; const Asource: PSDL_GPUTextureTransferInfo; const Adestination: PSDL_GPUTextureRegion; Acycle: bool); cdecl;

  /// <summary>
  ///  Uploads data from a transfer buffer to a buffer.
  /// </summary>
  TSDL_UploadToGPUBuffer      = procedure (Acopy_pass: PSDL_GPUCopyPass; const Asource: PSDL_GPUTransferBufferLocation; const Adestination: PSDL_GPUBufferRegion; Acycle: bool); cdecl;

  /// <summary>
  ///  Performs a texture-to-texture copy.
  /// </summary>
  TSDL_CopyGPUTextureToTexture= procedure (Acopy_pass: PSDL_GPUCopyPass; const Asource: PSDL_GPUTextureLocation; const Adestination: PSDL_GPUTextureLocation; Aw: Uint32; Ah: Uint32; Ad: Uint32; Acycle: bool); cdecl;

  /// <summary>
  ///  Performs a buffer-to-buffer copy.
  /// </summary>
  TSDL_CopyGPUBufferToBuffer  = procedure (Acopy_pass: PSDL_GPUCopyPass; const Asource: PSDL_GPUBufferLocation; const Adestination: PSDL_GPUBufferLocation; Asize: Uint32; Acycle: bool); cdecl;

  /// <summary>
  ///  Copies data from a texture to a transfer buffer on the GPU timeline.
  /// </summary>
  TSDL_DownloadFromGPUTexture = procedure (Acopy_pass: PSDL_GPUCopyPass; const Asource: PSDL_GPUTextureRegion; const Adestination: PSDL_GPUTextureTransferInfo); cdecl;

  /// <summary>
  ///  Copies data from a buffer to a transfer buffer on the GPU timeline.
  /// </summary>
  TSDL_DownloadFromGPUBuffer  = procedure (Acopy_pass: PSDL_GPUCopyPass; const Asource: PSDL_GPUBufferRegion; const Adestination: PSDL_GPUTransferBufferLocation); cdecl;

  /// <summary>
  ///  Ends the current copy pass.
  /// </summary>
  TSDL_EndGPUCopyPass         = procedure (Acopy_pass: PSDL_GPUCopyPass); cdecl;

  /// <summary>
  ///  Generates mipmaps for the given texture.
  /// </summary>
  TSDL_GenerateMipmapsForGPUTexture
                              = procedure (Acommand_buffer: PSDL_GPUCommandBuffer; Atexture: PSDL_GPUTexture); cdecl;

  /// <summary>
  ///  Blits from a source texture region to a destination texture region.
  /// </summary>
  TSDL_BlitGPUTexture         = procedure (Acommand_buffer: PSDL_GPUCommandBuffer; const Ainfo: PSDL_GPUBlitInfo); cdecl;

  /// <summary>
  ///  Determines whether a swapchain composition is supported by the window.
  /// </summary>
  TSDL_WindowSupportsGPUSwapchainComposition
                              = function (Adevice: PSDL_GPUDevice; Awindow: PSDL_Window; Aswapchain_composition: TSDL_GPUSwapchainComposition): bool; cdecl;

  /// <summary>
  ///  Determines whether a presentation mode is supported by the window.
  /// </summary>
  TSDL_WindowSupportsGPUPresentMode
                              = function (Adevice: PSDL_GPUDevice; Awindow: PSDL_Window; Apresent_mode: TSDL_GPUPresentMode): bool; cdecl;

  /// <summary>
  ///  Claims a window, creating a swapchain structure for it.
  /// </summary>
  TSDL_ClaimWindowForGPUDevice= function (Adevice: PSDL_GPUDevice; Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Unclaims a window, destroying its swapchain structure.
  /// </summary>
  TSDL_ReleaseWindowFromGPUDevice
                              = procedure (Adevice: PSDL_GPUDevice; Awindow: PSDL_Window); cdecl;

  /// <summary>
  ///  Changes the swapchain parameters for the given claimed window.
  /// </summary>
  TSDL_SetGPUSwapchainParameters
                              = function (Adevice: PSDL_GPUDevice; Awindow: PSDL_Window; Aswapchain_composition: TSDL_GPUSwapchainComposition; Apresent_mode: TSDL_GPUPresentMode): bool; cdecl;

  /// <summary>
  ///  Configures the maximum allowed number of frames in flight.
  /// </summary>
  TSDL_SetGPUAllowedFramesInFlight
                              = function (Adevice: PSDL_GPUDevice; Aallowed_frames_in_flight: Uint32): bool; cdecl;

  /// <summary>
  ///  Obtains the texture format of the swapchain for the given window.
  /// </summary>
  TSDL_GetGPUSwapchainTextureFormat
                              = function (Adevice: PSDL_GPUDevice; Awindow: PSDL_Window): TSDL_GPUTextureFormat; cdecl;

  /// <summary>
  ///  Acquire a texture to use in presentation.
  /// </summary>
  TSDL_AcquireGPUSwapchainTexture
                              = function (Acommand_buffer: PSDL_GPUCommandBuffer; Awindow: PSDL_Window; Aswapchain_texture: PPSDL_GPUTexture; Aswapchain_texture_width: PUint32; Aswapchain_texture_height: PUint32): bool; cdecl;

  /// <summary>
  ///  Blocks the thread until a swapchain texture is available to be acquired.
  /// </summary>
  TSDL_WaitForGPUSwapchain    = function (Adevice: PSDL_GPUDevice; Awindow: PSDL_Window): bool; cdecl;

  /// <summary>
  ///  Blocks the thread until a swapchain texture is available to be acquired,
  ///  and then acquires it.
  /// </summary>
  TSDL_WaitAndAcquireGPUSwapchainTexture
                              = function (Acommand_buffer: PSDL_GPUCommandBuffer; Awindow: PSDL_Window; Aswapchain_texture: PPSDL_GPUTexture; Aswapchain_texture_width: PUint32; Aswapchain_texture_height: PUint32): bool; cdecl;

  /// <summary>
  ///  Submits a command buffer so its commands can be processed on the GPU.
  /// </summary>
  TSDL_SubmitGPUCommandBuffer = function (Acommand_buffer: PSDL_GPUCommandBuffer): bool; cdecl;

  /// <summary>
  ///  Submits a command buffer so its commands can be processed on the GPU, and
  ///  acquires a fence associated with the command buffer.
  /// </summary>
  TSDL_SubmitGPUCommandBufferAndAcquireFence
                              = function (Acommand_buffer: PSDL_GPUCommandBuffer): PSDL_GPUFence; cdecl;

  /// <summary>
  ///  Cancels a command buffer.
  /// </summary>
  TSDL_CancelGPUCommandBuffer = function (Acommand_buffer: PSDL_GPUCommandBuffer): bool; cdecl;

  /// <summary>
  ///  Blocks the thread until the GPU is completely idle.
  /// </summary>
  TSDL_WaitForGPUIdle         = function (Adevice: PSDL_GPUDevice): bool; cdecl;

  /// <summary>
  ///  Blocks the thread until the given fences are signaled.
  /// </summary>
  TSDL_WaitForGPUFences       = function (Adevice: PSDL_GPUDevice; Await_all: bool; const Afences: PPSDL_GPUFence; Anum_fences: Uint32): bool; cdecl;

  /// <summary>
  ///  Checks the status of a fence.
  /// </summary>
  TSDL_QueryGPUFence          = function (Adevice: PSDL_GPUDevice; Afence: PSDL_GPUFence): bool; cdecl;

  /// <summary>
  ///  Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
  /// </summary>
  TSDL_ReleaseGPUFence        = procedure (Adevice: PSDL_GPUDevice; Afence: PSDL_GPUFence); cdecl;

  /// <summary>
  ///  Obtains the texel block size for a texture format.
  /// </summary>
  TSDL_GPUTextureFormatTexelBlockSize
                              = function (Aformat: TSDL_GPUTextureFormat): Uint32; cdecl;

  /// <summary>
  ///  Determines whether a texture format is supported for a given type and
  ///  usage.
  /// </summary>
  TSDL_GPUTextureSupportsFormat
                              = function (Adevice: PSDL_GPUDevice; Aformat: TSDL_GPUTextureFormat; Atype: TSDL_GPUTextureType; Ausage: TSDL_GPUTextureUsageFlags): bool; cdecl;

  /// <summary>
  ///  Determines if a sample count for a texture format is supported.
  /// </summary>
  TSDL_GPUTextureSupportsSampleCount
                              = function (Adevice: PSDL_GPUDevice; Aformat: TSDL_GPUTextureFormat; Asample_count: TSDL_GPUSampleCount): bool; cdecl;

  /// <summary>
  ///  Calculate the size in bytes of a texture format with dimensions.
  /// </summary>
  TSDL_CalculateGPUTextureFormatSize
                              = function (Aformat: TSDL_GPUTextureFormat; Awidth: Uint32; Aheight: Uint32; Adepth_or_layer_count: Uint32): Uint32; cdecl;

{$IFDEF SDL_PLATFORM_GDK}
  /// <summary>
  ///  Call this to suspend GPU operation on Xbox when you receive the
  ///  SDL_EVENT_DID_ENTER_BACKGROUND event.
  /// </summary>
  TSDL_GDKSuspendGPU          = procedure (Adevice: PSDL_GPUDevice); cdecl;

  /// <summary>
  ///  Call this to resume GPU operation on Xbox when you receive the
  ///  SDL_EVENT_WILL_ENTER_FOREGROUND event.
  /// </summary>
  TSDL_GDKResumeGPU           = procedure (Adevice: PSDL_GPUDevice); cdecl;
{$ENDIF}


var
  SDL_GPUSupportsShaderFormats
                              : TSDL_GPUSupportsShaderFormats;
  SDL_GPUSupportsProperties   : TSDL_GPUSupportsProperties;
  SDL_CreateGPUDevice         : TSDL_CreateGPUDevice;
  SDL_CreateGPUDeviceWithProperties
                              : TSDL_CreateGPUDeviceWithProperties;
  SDL_DestroyGPUDevice        : TSDL_DestroyGPUDevice;
  SDL_GetNumGPUDrivers        : TSDL_GetNumGPUDrivers;
  SDL_GetGPUDriver            : TSDL_GetGPUDriver;
  SDL_GetGPUDeviceDriver      : TSDL_GetGPUDeviceDriver;
  SDL_GetGPUShaderFormats     : TSDL_GetGPUShaderFormats;
  SDL_CreateGPUComputePipeline
                              : TSDL_CreateGPUComputePipeline;
  SDL_CreateGPUGraphicsPipeline
                              : TSDL_CreateGPUGraphicsPipeline;
  SDL_CreateGPUSampler        : TSDL_CreateGPUSampler;
  SDL_CreateGPUShader         : TSDL_CreateGPUShader;
  SDL_CreateGPUTexture        : TSDL_CreateGPUTexture;
  SDL_CreateGPUBuffer         : TSDL_CreateGPUBuffer;
  SDL_CreateGPUTransferBuffer : TSDL_CreateGPUTransferBuffer;
  SDL_SetGPUBufferName        : TSDL_SetGPUBufferName;
  SDL_SetGPUTextureName       : TSDL_SetGPUTextureName;
  SDL_InsertGPUDebugLabel     : TSDL_InsertGPUDebugLabel;
  SDL_PushGPUDebugGroup       : TSDL_PushGPUDebugGroup;
  SDL_PopGPUDebugGroup        : TSDL_PopGPUDebugGroup;
  SDL_ReleaseGPUTexture       : TSDL_ReleaseGPUTexture;
  SDL_ReleaseGPUSampler       : TSDL_ReleaseGPUSampler;
  SDL_ReleaseGPUBuffer        : TSDL_ReleaseGPUBuffer;
  SDL_ReleaseGPUTransferBuffer
                              : TSDL_ReleaseGPUTransferBuffer;
  SDL_ReleaseGPUComputePipeline
                              : TSDL_ReleaseGPUComputePipeline;
  SDL_ReleaseGPUShader        : TSDL_ReleaseGPUShader;
  SDL_ReleaseGPUGraphicsPipeline
                              : TSDL_ReleaseGPUGraphicsPipeline;
  SDL_AcquireGPUCommandBuffer : TSDL_AcquireGPUCommandBuffer;
  SDL_PushGPUVertexUniformData
                              : TSDL_PushGPUVertexUniformData;
  SDL_PushGPUFragmentUniformData
                              : TSDL_PushGPUFragmentUniformData;
  SDL_PushGPUComputeUniformData
                              : TSDL_PushGPUComputeUniformData;
  SDL_BeginGPURenderPass      : TSDL_BeginGPURenderPass;
  SDL_BindGPUGraphicsPipeline : TSDL_BindGPUGraphicsPipeline;
  SDL_SetGPUViewport          : TSDL_SetGPUViewport;
  SDL_SetGPUScissor           : TSDL_SetGPUScissor;
  SDL_SetGPUBlendConstants    : TSDL_SetGPUBlendConstants;
  SDL_SetGPUStencilReference  : TSDL_SetGPUStencilReference;
  SDL_BindGPUVertexBuffers    : TSDL_BindGPUVertexBuffers;
  SDL_BindGPUIndexBuffer      : TSDL_BindGPUIndexBuffer;
  SDL_BindGPUVertexSamplers   : TSDL_BindGPUVertexSamplers;
  SDL_BindGPUVertexStorageTextures
                              : TSDL_BindGPUVertexStorageTextures;
  SDL_BindGPUVertexStorageBuffers
                              : TSDL_BindGPUVertexStorageBuffers;
  SDL_BindGPUFragmentSamplers : TSDL_BindGPUFragmentSamplers;
  SDL_BindGPUFragmentStorageTextures
                              : TSDL_BindGPUFragmentStorageTextures;
  SDL_BindGPUFragmentStorageBuffers
                              : TSDL_BindGPUFragmentStorageBuffers;
  SDL_DrawGPUIndexedPrimitives
                              : TSDL_DrawGPUIndexedPrimitives;
  SDL_DrawGPUPrimitives       : TSDL_DrawGPUPrimitives;
  SDL_DrawGPUPrimitivesIndirect
                              : TSDL_DrawGPUPrimitivesIndirect;
  SDL_DrawGPUIndexedPrimitivesIndirect
                              : TSDL_DrawGPUIndexedPrimitivesIndirect;
  SDL_EndGPURenderPass        : TSDL_EndGPURenderPass;
  SDL_BeginGPUComputePass     : TSDL_BeginGPUComputePass;
  SDL_BindGPUComputePipeline  : TSDL_BindGPUComputePipeline;
  SDL_BindGPUComputeSamplers  : TSDL_BindGPUComputeSamplers;
  SDL_BindGPUComputeStorageTextures
                              : TSDL_BindGPUComputeStorageTextures;
  SDL_BindGPUComputeStorageBuffers
                              : TSDL_BindGPUComputeStorageBuffers;
  SDL_DispatchGPUCompute      : TSDL_DispatchGPUCompute;
  SDL_DispatchGPUComputeIndirect
                              : TSDL_DispatchGPUComputeIndirect;
  SDL_EndGPUComputePass       : TSDL_EndGPUComputePass;
  SDL_MapGPUTransferBuffer    : TSDL_MapGPUTransferBuffer;
  SDL_UnmapGPUTransferBuffer  : TSDL_UnmapGPUTransferBuffer;
  SDL_BeginGPUCopyPass        : TSDL_BeginGPUCopyPass;
  SDL_UploadToGPUTexture      : TSDL_UploadToGPUTexture;
  SDL_UploadToGPUBuffer       : TSDL_UploadToGPUBuffer;
  SDL_CopyGPUTextureToTexture : TSDL_CopyGPUTextureToTexture;
  SDL_CopyGPUBufferToBuffer   : TSDL_CopyGPUBufferToBuffer;
  SDL_DownloadFromGPUTexture  : TSDL_DownloadFromGPUTexture;
  SDL_DownloadFromGPUBuffer   : TSDL_DownloadFromGPUBuffer;
  SDL_EndGPUCopyPass          : TSDL_EndGPUCopyPass;
  SDL_GenerateMipmapsForGPUTexture
                              : TSDL_GenerateMipmapsForGPUTexture;
  SDL_BlitGPUTexture          : TSDL_BlitGPUTexture;
  SDL_WindowSupportsGPUSwapchainComposition
                              : TSDL_WindowSupportsGPUSwapchainComposition;
  SDL_WindowSupportsGPUPresentMode
                              : TSDL_WindowSupportsGPUPresentMode;
  SDL_ClaimWindowForGPUDevice : TSDL_ClaimWindowForGPUDevice;
  SDL_ReleaseWindowFromGPUDevice
                              : TSDL_ReleaseWindowFromGPUDevice;
  SDL_SetGPUSwapchainParameters
                              : TSDL_SetGPUSwapchainParameters;
  SDL_SetGPUAllowedFramesInFlight
                              : TSDL_SetGPUAllowedFramesInFlight;
  SDL_GetGPUSwapchainTextureFormat
                              : TSDL_GetGPUSwapchainTextureFormat;
  SDL_AcquireGPUSwapchainTexture
                              : TSDL_AcquireGPUSwapchainTexture;
  SDL_WaitForGPUSwapchain     : TSDL_WaitForGPUSwapchain;
  SDL_WaitAndAcquireGPUSwapchainTexture
                              : TSDL_WaitAndAcquireGPUSwapchainTexture;
  SDL_SubmitGPUCommandBuffer  : TSDL_SubmitGPUCommandBuffer;
  SDL_SubmitGPUCommandBufferAndAcquireFence
                              : TSDL_SubmitGPUCommandBufferAndAcquireFence;
  SDL_CancelGPUCommandBuffer  : TSDL_CancelGPUCommandBuffer;
  SDL_WaitForGPUIdle          : TSDL_WaitForGPUIdle;
  SDL_WaitForGPUFences        : TSDL_WaitForGPUFences;
  SDL_QueryGPUFence           : TSDL_QueryGPUFence;
  SDL_ReleaseGPUFence         : TSDL_ReleaseGPUFence;
  SDL_GPUTextureFormatTexelBlockSize
                              : TSDL_GPUTextureFormatTexelBlockSize;
  SDL_GPUTextureSupportsFormat
                              : TSDL_GPUTextureSupportsFormat;
  SDL_GPUTextureSupportsSampleCount
                              : TSDL_GPUTextureSupportsSampleCount;
  SDL_CalculateGPUTextureFormatSize
                              : TSDL_CalculateGPUTextureFormatSize;
{$IFDEF SDL_PLATFORM_GDK}
  SDL_GDKSuspendGPU           : TSDL_GDKSuspendGPU;
  SDL_GDKResumeGPU            : TSDL_GDKResumeGPU;
{$ENDIF}


procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GPUSupportsShaderFormats
                              := BindProcedure(AHandle, 'SDL_GPUSupportsShaderFormats');
  @SDL_GPUSupportsProperties  := BindProcedure(AHandle, 'SDL_GPUSupportsProperties');
  @SDL_CreateGPUDevice        := BindProcedure(AHandle, 'SDL_CreateGPUDevice');
  @SDL_CreateGPUDeviceWithProperties
                              := BindProcedure(AHandle, 'SDL_CreateGPUDeviceWithProperties');
  @SDL_DestroyGPUDevice       := BindProcedure(AHandle, 'SDL_DestroyGPUDevice');
  @SDL_GetNumGPUDrivers       := BindProcedure(AHandle, 'SDL_GetNumGPUDrivers');
  @SDL_GetGPUDriver           := BindProcedure(AHandle, 'SDL_GetGPUDriver');
  @SDL_GetGPUDeviceDriver     := BindProcedure(AHandle, 'SDL_GetGPUDeviceDriver');
  @SDL_GetGPUShaderFormats    := BindProcedure(AHandle, 'SDL_GetGPUShaderFormats');
  @SDL_CreateGPUComputePipeline
                              := BindProcedure(AHandle, 'SDL_CreateGPUComputePipeline');
  @SDL_CreateGPUGraphicsPipeline
                              := BindProcedure(AHandle, 'SDL_CreateGPUGraphicsPipeline');
  @SDL_CreateGPUSampler       := BindProcedure(AHandle, 'SDL_CreateGPUSampler');
  @SDL_CreateGPUShader        := BindProcedure(AHandle, 'SDL_CreateGPUShader');
  @SDL_CreateGPUTexture       := BindProcedure(AHandle, 'SDL_CreateGPUTexture');
  @SDL_CreateGPUBuffer        := BindProcedure(AHandle, 'SDL_CreateGPUBuffer');
  @SDL_CreateGPUTransferBuffer:= BindProcedure(AHandle, 'SDL_CreateGPUTransferBuffer');
  @SDL_SetGPUBufferName       := BindProcedure(AHandle, 'SDL_SetGPUBufferName');
  @SDL_SetGPUTextureName      := BindProcedure(AHandle, 'SDL_SetGPUTextureName');
  @SDL_InsertGPUDebugLabel    := BindProcedure(AHandle, 'SDL_InsertGPUDebugLabel');
  @SDL_PushGPUDebugGroup      := BindProcedure(AHandle, 'SDL_PushGPUDebugGroup');
  @SDL_PopGPUDebugGroup       := BindProcedure(AHandle, 'SDL_PopGPUDebugGroup');
  @SDL_ReleaseGPUTexture      := BindProcedure(AHandle, 'SDL_ReleaseGPUTexture');
  @SDL_ReleaseGPUSampler      := BindProcedure(AHandle, 'SDL_ReleaseGPUSampler');
  @SDL_ReleaseGPUBuffer       := BindProcedure(AHandle, 'SDL_ReleaseGPUBuffer');
  @SDL_ReleaseGPUTransferBuffer
                              := BindProcedure(AHandle, 'SDL_ReleaseGPUTransferBuffer');
  @SDL_ReleaseGPUComputePipeline
                              := BindProcedure(AHandle, 'SDL_ReleaseGPUComputePipeline');
  @SDL_ReleaseGPUShader       := BindProcedure(AHandle, 'SDL_ReleaseGPUShader');
  @SDL_ReleaseGPUGraphicsPipeline
                              := BindProcedure(AHandle, 'SDL_ReleaseGPUGraphicsPipeline');
  @SDL_AcquireGPUCommandBuffer:= BindProcedure(AHandle, 'SDL_AcquireGPUCommandBuffer');
  @SDL_PushGPUVertexUniformData
                              := BindProcedure(AHandle, 'SDL_PushGPUVertexUniformData');
  @SDL_PushGPUFragmentUniformData
                              := BindProcedure(AHandle, 'SDL_PushGPUFragmentUniformData');
  @SDL_PushGPUComputeUniformData
                              := BindProcedure(AHandle, 'SDL_PushGPUComputeUniformData');
  @SDL_BeginGPURenderPass     := BindProcedure(AHandle, 'SDL_BeginGPURenderPass');
  @SDL_BindGPUGraphicsPipeline:= BindProcedure(AHandle, 'SDL_BindGPUGraphicsPipeline');
  @SDL_SetGPUViewport         := BindProcedure(AHandle, 'SDL_SetGPUViewport');
  @SDL_SetGPUScissor          := BindProcedure(AHandle, 'SDL_SetGPUScissor');
  @SDL_SetGPUBlendConstants   := BindProcedure(AHandle, 'SDL_SetGPUBlendConstants');
  @SDL_SetGPUStencilReference := BindProcedure(AHandle, 'SDL_SetGPUStencilReference');
  @SDL_BindGPUVertexBuffers   := BindProcedure(AHandle, 'SDL_BindGPUVertexBuffers');
  @SDL_BindGPUIndexBuffer     := BindProcedure(AHandle, 'SDL_BindGPUIndexBuffer');
  @SDL_BindGPUVertexSamplers  := BindProcedure(AHandle, 'SDL_BindGPUVertexSamplers');
  @SDL_BindGPUVertexStorageTextures
                              := BindProcedure(AHandle, 'SDL_BindGPUVertexStorageTextures');
  @SDL_BindGPUVertexStorageBuffers
                              := BindProcedure(AHandle, 'SDL_BindGPUVertexStorageBuffers');
  @SDL_BindGPUFragmentSamplers:= BindProcedure(AHandle, 'SDL_BindGPUFragmentSamplers');
  @SDL_BindGPUFragmentStorageTextures
                              := BindProcedure(AHandle, 'SDL_BindGPUFragmentStorageTextures');
  @SDL_BindGPUFragmentStorageBuffers
                              := BindProcedure(AHandle, 'SDL_BindGPUFragmentStorageBuffers');
  @SDL_DrawGPUIndexedPrimitives
                              := BindProcedure(AHandle, 'SDL_DrawGPUIndexedPrimitives');
  @SDL_DrawGPUPrimitives      := BindProcedure(AHandle, 'SDL_DrawGPUPrimitives');
  @SDL_DrawGPUPrimitivesIndirect
                              := BindProcedure(AHandle, 'SDL_DrawGPUPrimitivesIndirect');
  @SDL_DrawGPUIndexedPrimitivesIndirect
                              := BindProcedure(AHandle, 'SDL_DrawGPUIndexedPrimitivesIndirect');
  @SDL_EndGPURenderPass       := BindProcedure(AHandle, 'SDL_EndGPURenderPass');
  @SDL_BeginGPUComputePass    := BindProcedure(AHandle, 'SDL_BeginGPUComputePass');
  @SDL_BindGPUComputePipeline := BindProcedure(AHandle, 'SDL_BindGPUComputePipeline');
  @SDL_BindGPUComputeSamplers := BindProcedure(AHandle, 'SDL_BindGPUComputeSamplers');
  @SDL_BindGPUComputeStorageTextures
                              := BindProcedure(AHandle, 'SDL_BindGPUComputeStorageTextures');
  @SDL_BindGPUComputeStorageBuffers
                              := BindProcedure(AHandle, 'SDL_BindGPUComputeStorageBuffers');
  @SDL_DispatchGPUCompute     := BindProcedure(AHandle, 'SDL_DispatchGPUCompute');
  @SDL_DispatchGPUComputeIndirect
                              := BindProcedure(AHandle, 'SDL_DispatchGPUComputeIndirect');
  @SDL_EndGPUComputePass      := BindProcedure(AHandle, 'SDL_EndGPUComputePass');
  @SDL_MapGPUTransferBuffer   := BindProcedure(AHandle, 'SDL_MapGPUTransferBuffer');
  @SDL_UnmapGPUTransferBuffer := BindProcedure(AHandle, 'SDL_UnmapGPUTransferBuffer');
  @SDL_BeginGPUCopyPass       := BindProcedure(AHandle, 'SDL_BeginGPUCopyPass');
  @SDL_UploadToGPUTexture     := BindProcedure(AHandle, 'SDL_UploadToGPUTexture');
  @SDL_UploadToGPUBuffer      := BindProcedure(AHandle, 'SDL_UploadToGPUBuffer');
  @SDL_CopyGPUTextureToTexture:= BindProcedure(AHandle, 'SDL_CopyGPUTextureToTexture');
  @SDL_CopyGPUBufferToBuffer  := BindProcedure(AHandle, 'SDL_CopyGPUBufferToBuffer');
  @SDL_DownloadFromGPUTexture := BindProcedure(AHandle, 'SDL_DownloadFromGPUTexture');
  @SDL_DownloadFromGPUBuffer  := BindProcedure(AHandle, 'SDL_DownloadFromGPUBuffer');
  @SDL_EndGPUCopyPass         := BindProcedure(AHandle, 'SDL_EndGPUCopyPass');
  @SDL_GenerateMipmapsForGPUTexture
                              := BindProcedure(AHandle, 'SDL_GenerateMipmapsForGPUTexture');
  @SDL_BlitGPUTexture         := BindProcedure(AHandle, 'SDL_BlitGPUTexture');
  @SDL_WindowSupportsGPUSwapchainComposition
                              := BindProcedure(AHandle, 'SDL_WindowSupportsGPUSwapchainComposition');
  @SDL_WindowSupportsGPUPresentMode
                              := BindProcedure(AHandle, 'SDL_WindowSupportsGPUPresentMode');
  @SDL_ClaimWindowForGPUDevice:= BindProcedure(AHandle, 'SDL_ClaimWindowForGPUDevice');
  @SDL_ReleaseWindowFromGPUDevice
                              := BindProcedure(AHandle, 'SDL_ReleaseWindowFromGPUDevice');
  @SDL_SetGPUSwapchainParameters
                              := BindProcedure(AHandle, 'SDL_SetGPUSwapchainParameters');
  @SDL_SetGPUAllowedFramesInFlight
                              := BindProcedure(AHandle, 'SDL_SetGPUAllowedFramesInFlight');
  @SDL_GetGPUSwapchainTextureFormat
                              := BindProcedure(AHandle, 'SDL_GetGPUSwapchainTextureFormat');
  @SDL_AcquireGPUSwapchainTexture
                              := BindProcedure(AHandle, 'SDL_AcquireGPUSwapchainTexture');
  @SDL_WaitForGPUSwapchain    := BindProcedure(AHandle, 'SDL_WaitForGPUSwapchain');
  @SDL_WaitAndAcquireGPUSwapchainTexture
                              := BindProcedure(AHandle, 'SDL_WaitAndAcquireGPUSwapchainTexture');
  @SDL_SubmitGPUCommandBuffer := BindProcedure(AHandle, 'SDL_SubmitGPUCommandBuffer');
  @SDL_SubmitGPUCommandBufferAndAcquireFence
                              := BindProcedure(AHandle, 'SDL_SubmitGPUCommandBufferAndAcquireFence');
  @SDL_CancelGPUCommandBuffer := BindProcedure(AHandle, 'SDL_CancelGPUCommandBuffer');
  @SDL_WaitForGPUIdle         := BindProcedure(AHandle, 'SDL_WaitForGPUIdle');
  @SDL_WaitForGPUFences       := BindProcedure(AHandle, 'SDL_WaitForGPUFences');
  @SDL_QueryGPUFence          := BindProcedure(AHandle, 'SDL_QueryGPUFence');
  @SDL_ReleaseGPUFence        := BindProcedure(AHandle, 'SDL_ReleaseGPUFence');
  @SDL_GPUTextureFormatTexelBlockSize
                              := BindProcedure(AHandle, 'SDL_GPUTextureFormatTexelBlockSize');
  @SDL_GPUTextureSupportsFormat
                              := BindProcedure(AHandle, 'SDL_GPUTextureSupportsFormat');
  @SDL_GPUTextureSupportsSampleCount
                              := BindProcedure(AHandle, 'SDL_GPUTextureSupportsSampleCount');
  @SDL_CalculateGPUTextureFormatSize
                              := BindProcedure(AHandle, 'SDL_CalculateGPUTextureFormatSize');
{$IFDEF SDL_PLATFORM_GDK}
  @SDL_GDKSuspendGPU          := BindProcedure(AHandle, 'SDL_GDKSuspendGPU');
  @SDL_GDKResumeGPU           := BindProcedure(AHandle, 'SDL_GDKResumeGPU');
{$ENDIF}
end;

end.
