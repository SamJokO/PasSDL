unit SDL.stdinc;

interface

uses
  SDL.PascalEntry;

type
  bool                        = Boolean;
  Pbool                       = ^bool;

  size_t                      = NativeUInt;
  Psize_t                     = ^size_T;

  int                         = NativeInt;          // int
  Pint                        = ^int;               // int *
  u_int                       = NativeUInt;         // unsigned int
  Pu_int                      = ^u_int;             // unsigned int *

  long                        = NativeInt;
  Plong                       = ^long;    
  u_long                      = NativeUint;
  Pu_long                     = ^u_long;
  long_long                   = Int64;
  Plong_long                  = ^long_long;
  u_long_long                 = UInt64;
  Pu_long_long                = ^u_long_long;

  intptr_t                    = IntPtr;
  uintptr_t                   = UIntPtr;

  float                       = Single;
  Pfloat                      = ^float;

  Sint64                      = Int64;
  Sint32                      = Int32;
  Sint16                      = Int16;
  Sint8                       = Int8;

  Pint8                       = ^Int8;
  PPint8                      = ^PInt8;
  PUint8                      = ^UInt8;
  PPUint8                     = ^PUint8;
  Pint16                      = ^int16;
  PPint16                     = ^Pint16;
  PUint16                     = ^Uint16;
  PPUint16                    = ^PUint16;

  u_short                     = Uint16;
  Pu_short                    = ^u_short;
  short                       = int16;
  Pshort                      = ^short;

const
  SDL_MAX_SINT8               = $7F;
  SDL_MIN_SING8               = not $7F;

  SDL_MAX_UINT8               = $FF;
  SDL_MIN_UINT8               = $00;

  SDL_MAX_SINT16              = $7FFF;
  SDL_MIN_SINT16              = not $7FFF;

  SDL_MAX_UINT16              = $FFFF;
  SDL_MIN_UINT16              = $0000;

  SDL_MAX_SINT32              = $7FFFFFFF;
  SDL_MIN_SINT32              = not $7FFFFFFF;

  SDL_MAX_UINT32              = $FFFFFFFF;
  SDL_MIN_UINT32              = $00000000;

  SDL_MAX_SINT64              = $7FFFFFFFFFFFFFFF;
  SDL_MIN_SINT64              = not $7FFFFFFFFFFFFFFF;

  SDL_MAX_UINT64              = $FFFFFFFFFFFFFFFF;
  SDL_MIN_UINT64              = $0000000000000000;

//  SDL_SIZE_MAX                = SizeOf(NativeInt) - 1;   //<-- Wrong! $FFFFFFFF or $FFFFFFFFFFFFFFFF

type
  TSDL_Time                   = Sint64;

  function                    SDL_SIZE_MAX: size_t; inline;

const
  SDL_MAX_TIME                = SDL_MAX_SINT64;
  SDL_MIN_TIME                = SDL_MIN_SINT64;


  SDL_FLT_EPSILON             = 1.1920928955078125e-07;


type
  /// <summary>
  ///  Allocate uninitialized memory.
  /// </summary>
  TSDL_malloc                 = function (Asize: size_t): Pointer; cdecl;

  /// <summary>
  ///  Allocate a zero-initialized array.
  /// </summary>
  TSDL_calloc                 = function (Anmemb: size_t; Asize: size_t): Pointer; cdecl;

  /// <summary>
  ///  Change the size of allocated memory.
  /// </summary>
  TSDL_realloc                = function (Amem: Pointer; Asize: size_t): Pointer; cdecl;

  /// <summary>
  ///  Free allocated memory.
  /// </summary>
  TSDL_free                   = procedure (Amem: Pointer); cdecl;

  TSDL_malloc_func            = function (Asize: size_t): Pointer; cdecl;
  PSDL_malloc_func            = ^TSDL_malloc_func;
  TSDL_calloc_func            = function (Anmemb: size_t; Asize: size_t): Pointer; cdecl;
  PSDL_calloc_func            = ^TSDL_calloc_func;
  TSDL_realloc_func           = function (Amem: Pointer; Asize: size_t): Pointer; cdecl;
  PSDL_realloc_func           = ^TSDL_realloc_func;
  TSDL_free_func              = procedure (Amem: Pointer); cdecl;
  PSDL_free_func              = ^TSDL_free_func;

  /// <summary>
  ///  Get the original set of SDL memory functions.
  /// </summary>
  TSDL_GetOriginalMemoryFunctions
                              = procedure (var Amalloc_func: TSDL_malloc_func; var Acalloc_func: TSDL_calloc_func; var Arealloc_func: TSDL_realloc_func; var Afree_func: TSDL_free_func); cdecl;

  /// <summary>
  ///  Get the current set of SDL memory functions.
  /// </summary>
  TSDL_GetMemoryFunctions     = procedure (var Amalloc_func: TSDL_malloc_func; var Acalloc_func: TSDL_calloc_func; var Arealloc_func: TSDL_realloc_func; var Afree_func: TSDL_free_func); cdecl;

  /// <summary>
  ///  Replace SDL's memory allocation functions with a custom set.
  /// </summary>
  TSDL_SetMemoryFunctions     = function (Amalloc_func: PSDL_malloc_func; Acalloc_func: PSDL_calloc_func; Arealloc_func: PSDL_realloc_func; Afree_func: PSDL_free_func): bool; cdecl;

  /// <summary>
  ///  Allocate memory aligned to a specific alignment.
  /// </summary>
  TSDL_aligned_alloc          = function (Aalignment: size_t; Asize: size_t): Pointer; cdecl;

  /// <summary>
  ///  Free memory allocated by SDL_aligned_alloc().
  /// </summary>
  TSDL_aligned_free           = procedure (Amem: Pointer); cdecl;

  /// <summary>
  ///  Get the number of outstanding (unfreed) allocations.
  /// </summary>
  TSDL_GetNumAllocations      = function (): int; cdecl;

  TSDL_Environment = record end;
  PSDL_Environment = ^TSDL_Environment;

  /// <summary>
  ///  Get the process environment
  /// </summary>
  TSDL_GetEnvironment         = function (): PSDL_Environment; cdecl;

  /// <summary>
  ///  Create a set of environment variables
  /// </summary>
  TSDL_CreateEnvironment      = function (Apopulated: bool): PSDL_Environment; cdecl;

  /// <summary>
  ///  Get the value of a variable in the environment.
  /// </summary>
  TSDL_GetEnvironmentVariable = function (Aenv: PSDL_Environment; const Aname: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Get all variables in the environment.
  /// </summary>
  TSDL_GetEnvironmentVariables= function (Aenv: PSDL_Environment): PPAnsiChar; cdecl;

  /// <summary>
  ///  Set the value of a variable in the environment.
  /// </summary>
  TSDL_SetEnvironmentVariable = function (Aenv: PSDL_Environment; const Aname: PAnsiChar; const Avalue: PAnsiChar; Aoverwrite: bool): bool; cdecl;

  /// <summary>
  ///  Clear a variable from the environment.
  /// </summary>
  TSDL_UnsetEnvironmentVariable
                              = function (Aenv: PSDL_Environment; const Aname: PAnsiChar): bool; cdecl;

  /// <summary>
  ///  Destroy a set of environment variables.
  /// </summary>
  TSDL_DestroyEnvironment     = procedure (Aenv: PSDL_Environment); cdecl;

  /// <summary>
  ///  Get the value of a variable in the environment.
  /// </summary>
  TSDL_getenv                 = function (const Aname: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the value of a variable in the environment.
  /// </summary>
  TSDL_getenv_unsafe          = function (const Aname: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Set the value of a variable in the environment.
  /// </summary>
  TSDL_setenv_unsafe          = function (const Aname: PAnsiChar; const Avalue: PAnsiChar; Aoverwrite: int): int; cdecl;

  /// <summary>
  ///  Clear a variable from the environment.
  /// </summary>
  TSDL_unsetenv_unsafe        = function (const Aname: PAnsiChar): int; cdecl;

  /// <summary>
  ///  A callback used with SDL sorting and binary search functions.
  /// </summary>
  TSDL_CompareCallback        = function (const Aa: Pointer; const Ab: Pointer): int; cdecl;

  /// <summary>
  ///  Sort an array.
  /// </summary>
  TSDL_qsort                  = procedure (Abase: Pointer; Anmemb: size_t; Asize: size_t; Acompare: TSDL_CompareCallback); cdecl;

  /// <summary>
  ///  Perform a binary search on a previously sorted array.
  /// </summary>
  TSDL_bsearch                = function (const Akey: Pointer; const Abase: Pointer; Anmemb: size_t; Asize: size_t; Acompare: TSDL_CompareCallback): Pointer; cdecl;

  /// <summary>
  ///  A callback used with SDL sorting and binary search functions.
  /// </summary>
  TSDL_CompareCallback_r      = function (Auserdata: Pointer; const Aa: Pointer; const Ab: Pointer): int; cdecl;

  /// <summary>
  ///  Sort an array, passing a userdata pointer to the compare function.
  /// </summary>
  TSDL_qsort_r                = procedure (Abase: Pointer; Anmemb: size_t; Asize: size_t; Acompare: TSDL_CompareCallback_r; Auserdata: Pointer); cdecl;

  /// <summary>
  ///  Perform a binary search on a previously sorted array, passing a userdata
  ///  pointer to the compare function.
  /// </summary>
  TSDL_bsearch_r              = function (const Akey: Pointer; const Abase: Pointer; Anmemb: size_t; Asize: size_t; Acompare: TSDL_CompareCallback_r; Auserdata: Pointer): Pointer; cdecl;

  /// <summary>
  ///  Compute the absolute value of `x`.
  /// </summary>
  TSDL_abs                    = function (Ax: int): int; cdecl;

// c macro
//  function SDL_min(
//  function SDL_max(
//  function SDL_clamp(

  /// <summary>
  ///  Query if a character is alphabetic (a letter).
  /// </summary>
  TSDL_isalpha                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Query if a character is alphabetic (a letter) or a number.
  /// </summary>
  TSDL_isalnum                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is blank (a space or tab).
  /// </summary>
  TSDL_isblank                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is a control character.
  /// </summary>
  TSDL_iscntrl                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is a numeric digit.
  /// </summary>
  TSDL_isdigit                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is a hexadecimal digit.
  /// </summary>
  TSDL_isxdigit               = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is a punctuation mark.
  /// </summary>
  TSDL_ispunct                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is whitespace.
  /// </summary>
  TSDL_isspace                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is upper case.
  /// </summary>
  TSDL_isupper                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is lower case.
  /// </summary>
  TSDL_islower                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is "printable".
  /// </summary>
  TSDL_isprint                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Report if a character is any "printable" except space.
  /// </summary>
  TSDL_isgraph                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Convert low-ASCII English letters to uppercase.
  /// </summary>
  TSDL_toupper                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Convert low-ASCII English letters to lowercase.
  /// </summary>
  TSDL_tolower                = function (Ax: int): int; cdecl;

  /// <summary>
  ///  Calculate a CRC-16 value.
  /// </summary>
  TSDL_crc16                  = function (Acrc: Uint16; const Adata: Pointer; Alen: size_t): UInt16; cdecl;  

  /// <summary>
  ///  Calculate a CRC-32 value.
  /// </summary>
  TSDL_crc32                  = function (Acrc: Uint32; const Adata: Pointer; Alen: size_t): Uint32; cdecl;   

  /// <summary>
  ///  Calculate a 32-bit MurmurHash3 value for a block of data.
  /// </summary>
  TSDL_murmur3_32             = function (const AData: Pointer; Alen: size_t; Aseed: Uint32): Uint32; cdecl;

  /// <summary>
  ///  Copy non-overlapping memory.
  /// </summary>
  TSDL_memcpy                 = function (Adst: Pointer; const Asrc: Pointer; Alen: size_t): Pointer; cdecl;   

//  function SDL_copyp(                          

  /// <summary>
  ///  Copy memory ranges that might overlap.
  /// </summary>
  TSDL_memmove                = function (Adst: Pointer; const Asrc: Pointer; Alen: size_t): Pointer; cdecl;

  /// <summary>
  ///  Initialize all bytes of buffer of memory to a specific value.
  /// </summary>
  TSDL_memset                 = function (Adst: Pointer; Ac: int; Alen: size_t): Pointer; cdecl;

  /// <summary>
  ///  Initialize all 32-bit words of buffer of memory to a specific value.
  /// </summary>
  TSDL_memset4                = function (Adst: Pointer; Aval: Uint32; Adwords: size_t): Pointer; cdecl;


//  SDL_zero(x)
//  SDL_zerop(x)
//  SDL_zeroa(x)

  /// <summary>
  ///  Compare two buffers of memory.
  /// </summary>
  TSDL_memcmp                 = function (const As1: Pointer; const As2: Pointer; Alen: size_t): int; cdecl;

  /// <summary>
  ///  This works exactly like wcslen() but doesn't require access to a C runtime.
  /// </summary>
  TSDL_wcslen                 = function (const Awstr: PWideChar): size_t; cdecl;

  /// <summary>
  ///  This works exactly like wcsnlen() but doesn't require access to a C
  ///  runtime.
  /// </summary>
  TSDL_wcsnlen                = function (const Awstr: PWideChar; Amaxlen: size_t): size_t; cdecl;

  /// <summary>
  ///  Copy a wide string.
  /// </summary>
  TSDL_wcslcpy                = function (Adst: PWideChar; const Asrc: PWideChar; Amaxlen: size_t): size_t; cdecl;

  /// <summary>
  ///  Concatenate wide strings.
  /// </summary>
  TSDL_wcslcat                = function (Adst: PWideChar; const Asrc: PWideChar; Amaxlen: size_t): size_t; cdecl;

  /// <summary>
  ///  Allocate a copy of a wide string.
  /// </summary>
  TSDL_wcsdup                 = function (const Awstr: PWideChar): PWideChar; cdecl;

  /// <summary>
  ///  Search a wide string for the first instance of a specific substring.
  /// </summary>
  TSDL_wcsstr                 = function (const Ahaystack: PWideChar; const Aneedle: PWideChar): PWideChar; cdecl;

  /// <summary>
  ///  Search a wide string, up to n wide chars, for the first instance of a
  ///  specific substring.
  /// </summary>
  TSDL_wcsnstr                = function (const Ahaystack: PWideChar; const Aneedle: PWideChar; Amaxlen: size_t): PWideChar; cdecl;

  /// <summary>
  ///  Compare two null-terminated wide strings.
  /// </summary>
  TSDL_wcscmp                 = function (const Astr1: PWideChar; const Astr2: PWideChar): int; cdecl;

  /// <summary>
  ///  Compare two wide strings up to a number of wchar_t values.
  /// </summary>
  TSDL_wcsncmp                = function (const Astr1: PWideChar; const Astr2: PWideChar; Amaxlen: size_t): int; cdecl;

  /// <summary>
  ///  Compare two null-terminated wide strings, case-insensitively.
  /// </summary>
  TSDL_wcscasecmp             = function (const Astr1: PWideChar; const Astr2: PWideChar): int; cdecl;

  /// <summary>
  ///  Compare two wide strings, case-insensitively, up to a number of wchar_t.
  /// </summary>
  TSDL_wcsncasecmp            = function (const Astr1: PWideChar; const Astr2: PWideChar; Amaxlen: size_t): int; cdecl;

  /// <summary>
  ///  Parse a `long` from a wide string.
  /// </summary>
  TSDL_wcstol                 = function (const Astr: PWideChar; Aendp: PPWideChar; Abase: int): long; cdecl;

  /// <summary>
  ///  This works exactly like strlen() but doesn't require access to a C runtime.
  /// </summary>
  TSDL_strlen                 = function (const Astr: PAnsiChar): size_t; cdecl;

  /// <summary>
  ///  This works exactly like strnlen() but doesn't require access to a C
  ///  runtime.
  /// </summary>         
  TSDL_strnlen                = function (const Astr: PAnsiChar; Amaxlen: size_t): size_t; cdecl;

  /// <summary>
  ///  Copy a string.
  /// </summary>         
  TSDL_strlcpy                = function (Adst: PAnsiChar; const Asrc: PAnsiChar; Amaxlen: size_t): size_t; cdecl;

  /// <summary>
  ///  Copy an UTF-8 string.
  /// </summary>    
  TSDL_utf8strlcpy            = function (Adst: PAnsiChar; const Asrc: PAnsiChar; Adst_bytes: size_t): size_t; cdecl;

  /// <summary>
  ///  Concatenate strings.
  /// </summary>    
  TSDL_strlcat                = function (Adst: PAnsiChar; const Asrc: PAnsichar; Amaxlen: size_t): size_t; cdecl;

  /// <summary>
  ///  Allocate a copy of a string.
  /// </summary>  
  TSDL_strdup                 = function (const Astr: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Allocate a copy of a string, up to n characters.
  /// </summary>  
  TSDL_strndup                = function (const Astr: PAnsiChar; Amaxlen: size_t): PAnsiChar; cdecl;

  /// <summary>
  ///  Reverse a string's contents.
  /// </summary> 
  TSDL_strrev                 = function (Astr: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Convert a string to uppercase.
  /// </summary> 
  TSDL_strupr                 = function (Astr: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Convert a string to lowercase.
  /// </summary> 
  TSDL_strlwr                 = function (Astr: PAnsiChar): PAnsiChar; cdecl;  

  /// <summary>
  ///  Search a string for the first instance of a specific byte.
  /// </summary> 
  TSDL_strchr                 = function (const Astr: PAnsiChar; Ac: int): PAnsiChar; cdecl;  

  /// <summary>
  ///  Search a string for the last instance of a specific byte.
  /// </summary> 
  TSDL_strrchr                = function (const Astr: PAnsiChar; Ac: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Search a string for the first instance of a specific substring.
  /// </summary> 
  TSDL_strstr                 = function (const Ahaystack: PAnsiChar; const Aneedle: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Search a string, up to n bytes, for the first instance of a specific
  ///  substring.
  /// </summary> 
  TSDL_strnstr                = function (const Ahaystack: PAnsiChar; const Aneedle: PAnsiChar; Amaxlen: size_t): PAnsiChar; cdecl;

  /// <summary>
  ///  Search a UTF-8 string for the first instance of a specific substring,
  ///  case-insensitively.
  /// </summary> 
  TSDL_strcasestr             = function (const Ahaystack: PAnsiChar; const Aneedle: PAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  This works exactly like strtok_r() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_strtok_r               = function (Astr: PAnsiChar; const Adelim: PAnsiChar; Asaveptr: PPAnsiChar): PAnsiChar; cdecl;

  /// <summary>
  ///  Count the number of codepoints in a UTF-8 string.
  /// </summary> 
  TSDL_utf8strlen             = function (const Astr: PAnsiChar): size_t; cdecl;

  /// <summary>
  ///  Count the number of codepoints in a UTF-8 string, up to n bytes.
  /// </summary> 
  TSDL_utf8strnlen            = function (const Astr: PAnsiChar; Abytes: size_t): size_t; cdecl;

  /// <summary>
  ///  Convert an integer into a string.
  /// </summary> 
  TSDL_itoa                   = function (Avalue: int; Astr: PAnsiChar; Aradix: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Convert an unsigned integer into a string.
  /// </summary> 
  TSDL_uitoa                  = function (Avalue: u_int; Astr: PAnsiChar; Aradix: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Convert a long integer into a string.
  /// </summary> 
  TSDL_ltoa                   = function (Avalue: long; Astr: PAnsiChar; Aradix: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Convert an unsigned long integer into a string.
  /// </summary> 
  TSDL_ultoa                  = function (Avalue: u_long; Astr: PAnsiChar; Aradix: int): PAnsiChar; cdecl;

  /// <summary>
  ///  Convert a long long integer into a string.
  /// </summary> 
  TSDL_lltoa                  = function (Avalue: long_long; Astr: PAnsiChar; Aradix: int): PAnsiChar; cdecl;  

  /// <summary>
  ///  Convert an unsigned long long integer into a string.
  /// </summary> 
  TSDL_ulltoa                 = function (Avalue: u_long_long; Astr: PAnsiChar; Aradix: int): PAnsiChar; cdecl;  

  /// <summary>
  ///  Parse an `int` from a string.
  /// </summary> 
  TSDL_atoi                   = function (const Astr: PAnsiChar): int; cdecl;  

  /// <summary>
  ///  Parse a `double` from a string.
  /// </summary> 
  TSDL_atof                   = function (const Astr: PAnsiChar): double; cdecl;

  /// <summary>
  ///  Parse a `long` from a string.
  /// </summary> 
  TSDL_strtol                 = function (const Astr: PAnsiChar; Aendp: PPAnsiChar; Abase: int): long; cdecl;

  /// <summary>
  ///  Parse an `unsigned long` from a string.
  /// </summary> 
  TSDL_strtoul                = function (const Astr: PAnsiChar; Aendp: PPAnsiChar; Abase: int): u_long; cdecl;

  /// <summary>
  ///  Parse a `long long` from a string.
  /// </summary> 
  TSDL_strtoll                = function (const Astr: PAnsiChar; Aendp: PPAnsiChar; Abase: int): long_long; cdecl;
  
  /// <summary>
  ///  Parse an `unsigned long long` from a string.
  /// </summary> 
  TSDL_strtoull               = function (const Astr: PAnsiChar; Aendp: PPAnsiChar; Abase: int): u_long_long; cdecl;

  /// <summary>
  ///  Parse a `double` from a string.
  /// </summary> 
  TSDL_strtod                 = function (const Astr: PAnsiChar; Aendp: PPAnsiChar): double; cdecl;

  /// <summary>
  ///  Compare two null-terminated UTF-8 strings.
  /// </summary> 
  TSDL_strcmp                 = function (const Astr1: PAnsiChar; const Astr2: PAnsiChar): int; cdecl;

  /// <summary>
  ///  Compare two UTF-8 strings up to a number of bytes.
  /// </summary> 
  TSDL_strncmp                = function (const Astr1: PAnsiChar; const Astr2: PAnsiChar; Amaxlen: size_t): int; cdecl;  

  /// <summary>
  ///  Compare two null-terminated UTF-8 strings, case-insensitively.
  /// </summary> 
  TSDL_strcasecmp             = function (const Astr1: PAnsiChar; const Astr2: PAnsiChar): int; cdecl;

  /// <summary>
  ///  Compare two UTF-8 strings, case-insensitively, up to a number of bytes.
  /// </summary> 
  TSDL_strncasecmp            = function (const Astr1: PAnsiChar; const Astr2: PAnsiChar): int; cdecl;

  /// <summary>
  ///  Searches a string for the first occurence of any character contained in a
  ///  breakset, and returns a pointer from the string to that character.
  /// </summary> 
  TSDL_strpbrk                = function (const Astr: PAnsiChar; const Abreakset: PAnsiChar): PAnsiChar; cdecl;

const
  SDL_INVALID_UNICODE_CODEPOINT
                              = $FFFD;

type
  /// <summary>
  ///  Decode a UTF-8 string, one Unicode codepoint at a time.
  /// </summary> 
  TSDL_StepUTF8               = function (const Apstr: PPAnsiChar; Apslen: Psize_t): Uint32; cdecl;

  /// <summary>
  ///  Decode a UTF-8 string in reverse, one Unicode codepoint at a time.
  /// </summary> 
  TSDL_StepBackUTF8           = function (const Astart: PAnsiChar; const Apstr: PPAnsiChar): Uint32; cdecl;

  /// <summary>
  ///  Convert a single Unicode codepoint to UTF-8.
  /// </summary> 
  TSDL_UCS4ToUTF8             = function (Acodepoint: Uint32; Adst: PAnsiChar): PAnsiChar; cdecl;  

  /// <summary>
  ///  This works exactly like sscanf() but doesn't require access to a C runtime.
  /// </summary> 
  TSDL_sscanf                 = function (const Atext: PAnsiChar; const Afmt: PAnsiChar; Aargs: array of const): int; cdecl;

  /// <summary>
  ///  This works exactly like vsscanf() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_vsscanf                = function (const Atext: PAnsiChar; const Afmt: PAnsiChar; Aargs: array of const): int; cdecl;

  /// <summary>
  ///  This works exactly like snprintf() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_snprintf               = function (Atext: PAnsiChar; Amaxlen: size_t; const Afmt: PAnsiChar; Aargs: array of const): int; cdecl;

  /// <summary>
  ///  This works exactly like swprintf() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_swprintf               = function (Atext: PWideChar; Amaxlen: size_t; const Afmt: PWideChar; Aargs: array of const): int; cdecl;

  /// <summary>
  ///  This works exactly like vsnprintf() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_vsnprintf              = function (Atext: PAnsiChar; Amaxlen: size_t; const Afmt: PAnsiChar; Aargs: array of const): int; cdecl;

  /// <summary>
  ///  This works exactly like vswprintf() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_vswprintf              = function (Atext: PWideChar; Amaxlen: size_t; const Afmt: PWideChar; Aargs: array of const): int; cdecl;

  /// <summary>
  ///  This works exactly like asprintf() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_asprintf               = function (Astrp: PPAnsiChar; const Afmt: PAnsiChar; Aargs: array of const): int; cdecl;

  /// <summary>
  ///  This works exactly like vasprintf() but doesn't require access to a C
  ///  runtime.
  /// </summary> 
  TSDL_vasprintf              = function (Astrp: PPAnsiChar; const Afmt: PAnsiChar; Aargs: array of const): int; cdecl;
  
  /// <summary>
  ///  Seeds the pseudo-random number generator.
  /// </summary> 
  TSDL_srand                  = procedure (Aseed: Uint64); cdecl;      

  /// <summary>
  ///  Generate a pseudo-random number less than n for positive n
  /// </summary> 
  TSDL_rand                   = function (An: Sint32): Sint32; cdecl;  

  /// <summary>
  ///  Generate a uniform pseudo-random floating point number less than 1.0
  /// </summary> 
  TSDL_randf                  = function (): float; cdecl;

  /// <summary>
  ///  Generate 32 pseudo-random bits.
  /// </summary> 
  TSDL_rand_bits              = function (): Uint32; cdecl;

  /// <summary>
  ///  Generate a pseudo-random number less than n for positive n
  /// </summary>
  TSDL_rand_r                 = function (Astate: PUint64; An: Sint32): Sint32; cdecl;

  /// <summary>
  ///  Generate a uniform pseudo-random floating point number less than 1.0
  /// </summary>
  TSDL_randf_r                = function (Astate: PUint64): float; cdecl;

  /// <summary>
  ///  Generate 32 pseudo-random bits.
  /// </summary>
  TSDL_rand_bits_r            = function (Astate: PUint64): Uint32; cdecl;

const
  SDL_PI_D                    = 3.141592653589793238462643383279502884;
  SDL_PI_F                    = 3.141592653589793238462643383279502884;

type
  /// <summary>
  ///  Compute the arc cosine of `x`.
  /// </summary>
  TSDL_acos                   = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the arc cosine of `x`.
  /// </summary>
  TSDL_acosf                  = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the arc sine of `x`.
  /// </summary>
  TSDL_asin                   = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the arc sine of `x`.
  /// </summary>
  TSDL_asinf                  = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the arc tangent of `x`.
  /// </summary>
  TSDL_atan                   = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the arc tangent of `x`.
  /// </summary>
  TSDL_atanf                  = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the arc tangent of `y / x`, using the signs of x and y to adjust
  ///  the result's quadrant.
  /// </summary>
  TSDL_atan2                  = function (Ay: Double; Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the arc tangent of `y / x`, using the signs of x and y to adjust
  ///  the result's quadrant.
  /// </summary>
  TSDL_atan2f                 = function (Ay: float; Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the ceiling of `x`.
  /// </summary>
  TSDL_ceil                   = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the ceiling of `x`.
  /// </summary>
  TSDL_ceilf                  = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Copy the sign of one floating-point value to another.
  /// </summary>
  TSDL_copysign               = function (Ax: Double; Ay: Double): Double; cdecl;

  /// <summary>
  ///  Copy the sign of one floating-point value to another.
  /// </summary>
  TSDL_copysignf              = function (Ax: float; Ay: float): float; cdecl;

  /// <summary>
  ///  Compute the cosine of `x`.
  /// </summary>
  TSDL_cos                    = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the cosine of `x`.
  /// </summary>
  TSDL_cosf                   = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the exponential of `x`.
  /// </summary>
  TSDL_exp                    = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the exponential of `x`.
  /// </summary>
  TSDL_expf                   = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the absolute value of `x`
  /// </summary>
  TSDL_fabs                   = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the absolute value of `x`
  /// </summary>
  TSDL_fabsf                  = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the floor of `x`.
  /// </summary>
  TSDL_floor                  = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the floor of `x`.
  /// </summary>
  TSDL_floorf                 = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Truncate `x` to an integer.
  /// </summary>
  TSDL_trunc                  = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Truncate `x` to an integer.
  /// </summary>
  TSDL_truncf                 = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Return the floating-point remainder of `x / y`
  /// </summary>
  TSDL_fmod                   = function (Ax: Double; Ay: Double): Double; cdecl;

  /// <summary>
  ///  Return the floating-point remainder of `x / y`
  /// </summary>
  TSDL_fmodf                  = function (Ax: float; Ay: float): float; cdecl;

  /// <summary>
  ///  Return whether the value is infinity.
  /// </summary>
  TSDL_isinf                  = function (Ax: Double): int; cdecl;

  /// <summary>
  ///  Return whether the value is infinity.
  /// </summary>
  TSDL_isinff                 = function (Ax: float): int; cdecl;

  /// <summary>
  ///  Return whether the value is NaN.
  /// </summary>
  TSDL_isnan                  = function (Ax: Double): int; cdecl;

  /// <summary>
  ///  Return whether the value is NaN.
  /// </summary>
  TSDL_isnanf                 = function (Ax: float): int; cdecl;

  /// <summary>
  ///  Compute the natural logarithm of `x`.
  /// </summary>
  TSDL_log                    = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the natural logarithm of `x`.
  /// </summary>
  TSDL_logf                   = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the base-10 logarithm of `x`.
  /// </summary>
  TSDL_log10                  = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the base-10 logarithm of `x`.
  /// </summary>
  TSDL_log10f                 = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Split `x` into integer and fractional parts
  /// </summary>
  TSDL_modf                   = function (Ax: Double; var Ay: Double): Double; cdecl;

  /// <summary>
  ///  Split `x` into integer and fractional parts
  /// </summary>
  TSDL_modff                  = function (Ax: float; var Ay: float): float; cdecl;

  /// <summary>
  ///  Raise `x` to the power `y`
  /// </summary>
  TSDL_pow                    = function (Ax: Double; Ay: Double): Double; cdecl;

  /// <summary>
  ///  Raise `x` to the power `y`
  /// </summary>
  TSDL_powf                   = function (Ax: float; Ay: float): float; cdecl;

  /// <summary>
  ///  Round `x` to the nearest integer.
  /// </summary>
  TSDL_round                  = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Round `x` to the nearest integer.
  /// </summary>
  TSDL_roundf                 = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Round `x` to the nearest integer representable as a long
  /// </summary>
  TSDL_lround                 = function (Ax: Double): long; cdecl;

  /// <summary>
  ///  Round `x` to the nearest integer representable as a long
  /// </summary>
  TSDL_lroundf                = function (Ax: float): long; cdecl;

  /// <summary>
  ///  Scale `x` by an integer power of two.
  /// </summary>
  TSDL_scalbn                 = function (Ax: Double; An: int): Double; cdecl;

  /// <summary>
  ///  Scale `x` by an integer power of two.
  /// </summary>
  TSDL_scalbnf                = function (Ax: float; An: int): float; cdecl;

  /// <summary>
  ///  Compute the sine of `x`.
  /// </summary>
  TSDL_sin                    = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the sine of `x`.
  /// </summary>
  TSDL_sinf                   = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the square root of `x`.
  /// </summary>
  TSDL_sqrt                   = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the square root of `x`.
  /// </summary>
  TSDL_sqrtf                  = function (Ax: float): float; cdecl;

  /// <summary>
  ///  Compute the tangent of `x`.
  /// </summary>
  TSDL_tan                    = function (Ax: Double): Double; cdecl;

  /// <summary>
  ///  Compute the tangent of `x`.
  /// </summary>
  TSDL_tanf                   = function (Ax: float): float; cdecl;

  TSDL_iconv_data_t = record end;
  PSDL_iconv_t = ^TSDL_iconv_data_t;

  /// <summary>
  ///  This function allocates a context for the specified character set
  ///  conversion.
  /// </summary>
  TSDL_iconv_open             = function (const Atocode: PAnsiChar; const Afromcode: PAnsiChar): PSDL_iconv_t;

  /// <summary>
  ///  This function frees a context used for character set conversion.
  /// </summary>
  TSDL_iconv_close            = function (Acd: PSDL_iconv_t): int; cdecl;

  /// <summary>
  ///  This function converts text between encodings, reading from and writing to
  ///  a buffer.
  /// </summary>
  TSDL_iconv                  = function (Acd: PSDL_iconv_t; const Ainbuf: PPAnsiChar; Ainbytesleft: Psize_t; var Aoutbuf: PAnsiChar; var Aoutbytesleft: size_t): size_t; cdecl;

  /// <summary>
  ///  Helper function to convert a string's encoding in one call.
  /// </summary>
  TSDL_iconv_string           = function (const Atocode: PAnsiChar; const Afromcode: PAnsiChar; const Ainbuf: PAnsiChar; Ainbytesleft: size_t): PAnsiChar; cdecl;

  function SDL_iconv_utf8_locale(Abuf: PAnsiChar): PAnsiChar; inline;
  function SDL_iconv_utf8_ucs2(Abuf: PAnsiChar): PAnsiChar; inline;
  function SDL_iconv_utf8_ucs4(Abuf: PAnsiChar): PAnsiChar; inline;
  function SDL_iconv_wchar_utf8(Abuf: PWideChar): PAnsiChar; inline;


  function SDL_size_mul_check_overflow(Aa: size_t; Ab: size_t; var Aret: size_t): bool; inline;
//  function SDL_size_mul_check_overflow_builtin(Aa: size_t; Ab: size_t; var Aret: size_t): bool; inline;
  function SDL_size_add_check_overflow(Aa: size_t; Ab: size_t; var Aret: size_t): bool; inline;
//  function SDL_size_add_check_overflow_buildin(Aa: size_t; Ab: size_t; var Aret: size_t): bool; inline;

  function SDL_FOURCC(A: AnsiChar; B: AnsiChar; C: AnsiChar; D: AnsiChar): Uint32;

type
  TSDL_FunctionPointer        = procedure; cdecl;

var
  SDL_malloc                  : TSDL_malloc;
  SDL_calloc                  : TSDL_calloc;
  SDL_realloc                 : TSDL_realloc;
  SDL_free                    : TSDL_free;
  SDL_GetOriginalMemoryFunctions
                              : TSDL_GetOriginalMemoryFunctions;
  SDL_GetMemoryFunctions      : TSDL_GetMemoryFunctions;
  SDL_SetMemoryFunctions      : TSDL_SetMemoryFunctions;
  SDL_aligned_alloc           : TSDL_aligned_alloc;
  SDL_aligned_free            : TSDL_aligned_free;
  SDL_GetNumAllocations       : TSDL_GetNumAllocations;
  SDL_GetEnvironment          : TSDL_GetEnvironment;
  SDL_CreateEnvironment       : TSDL_CreateEnvironment;
  SDL_GetEnvironmentVariable  : TSDL_GetEnvironmentVariable;
  SDL_GetEnvironmentVariables : TSDL_GetEnvironmentVariables;
  SDL_SetEnvironmentVariable  : TSDL_SetEnvironmentVariable;
  SDL_UnsetEnvironmentVariable
                              : TSDL_UnsetEnvironmentVariable;
  SDL_DestroyEnvironment      : TSDL_DestroyEnvironment;
  SDL_getenv                  : TSDL_getenv;
  SDL_getenv_unsafe           : TSDL_getenv_unsafe;
  SDL_setenv_unsafe           : TSDL_setenv_unsafe;
  SDL_unsetenv_unsafe         : TSDL_unsetenv_unsafe;
  SDL_qsort                   : TSDL_qsort;
  SDL_bsearch                 : TSDL_bsearch;
  SDL_qsort_r                 : TSDL_qsort_r;
  SDL_bsearch_r               : TSDL_bsearch_r;
  SDL_abs                     : TSDL_abs;
  SDL_isalpha                 : TSDL_isalpha;
  SDL_isalnum                 : TSDL_isalnum;
  SDL_isblank                 : TSDL_isblank;
  SDL_iscntrl                 : TSDL_iscntrl;
  SDL_isdigit                 : TSDL_isdigit;
  SDL_isxdigit                : TSDL_isxdigit;
  SDL_ispunct                 : TSDL_ispunct;
  SDL_isspace                 : TSDL_isspace;
  SDL_isupper                 : TSDL_isupper;
  SDL_islower                 : TSDL_islower;
  SDL_isprint                 : TSDL_isprint;
  SDL_isgraph                 : TSDL_isgraph;
  SDL_toupper                 : TSDL_toupper;
  SDL_tolower                 : TSDL_tolower;
  SDL_crc16                   : TSDL_crc16;
  SDL_crc32                   : TSDL_crc32;
  SDL_murmur3_32              : TSDL_murmur3_32;
  SDL_memcpy                  : TSDL_memcpy;
  SDL_memmove                 : TSDL_memmove;
  SDL_memset                  : TSDL_memset;
  SDL_memset4                 : TSDL_memset4;
  SDL_memcmp                  : TSDL_memcmp;
  SDL_wcslen                  : TSDL_wcslen;
  SDL_wcsnlen                 : TSDL_wcsnlen;
  SDL_wcslcpy                 : TSDL_wcslcpy;
  SDL_wcslcat                 : TSDL_wcslcat;
  SDL_wcsdup                  : TSDL_wcsdup;
  SDL_wcsstr                  : TSDL_wcsstr;
  SDL_wcsnstr                 : TSDL_wcsnstr;
  SDL_wcscmp                  : TSDL_wcscmp;
  SDL_wcsncmp                 : TSDL_wcsncmp;
  SDL_wcscasecmp              : TSDL_wcscasecmp;
  SDL_wcsncasecmp             : TSDL_wcsncasecmp;
  SDL_wcstol                  : TSDL_wcstol;
  SDL_strlen                  : TSDL_strlen;
  SDL_strnlen                 : TSDL_strnlen;
  SDL_strlcpy                 : TSDL_strlcpy;
  SDL_utf8strlcpy             : TSDL_utf8strlcpy;
  SDL_strlcat                 : TSDL_strlcat;
  SDL_strdup                  : TSDL_strdup;
  SDL_strndup                 : TSDL_strndup;
  SDL_strrev                  : TSDL_strrev;
  SDL_strupr                  : TSDL_strupr;
  SDL_strlwr                  : TSDL_strlwr;
  SDL_strchr                  : TSDL_strchr;
  SDL_strrchr                 : TSDL_strrchr;
  SDL_strstr                  : TSDL_strstr;
  SDL_strnstr                 : TSDL_strnstr;
  SDL_strcasestr              : TSDL_strcasestr;
  SDL_strtok_r                : TSDL_strtok_r;
  SDL_utf8strlen              : TSDL_utf8strlen;
  SDL_utf8strnlen             : TSDL_utf8strnlen;
  SDL_itoa                    : TSDL_itoa;
  SDL_uitoa                   : TSDL_uitoa;
  SDL_ltoa                    : TSDL_ltoa;
  SDL_ultoa                   : TSDL_ultoa;
  SDL_lltoa                   : TSDL_lltoa;
  SDL_ulltoa                  : TSDL_ulltoa;
  SDL_atoi                    : TSDL_atoi;
  SDL_atof                    : TSDL_atof;
  SDL_strtol                  : TSDL_strtol;
  SDL_strtoul                 : TSDL_strtoul;
  SDL_strtoll                 : TSDL_strtoll;
  SDL_strtoull                : TSDL_strtoull;
  SDL_strtod                  : TSDL_strtod;
  SDL_strcmp                  : TSDL_strcmp;
  SDL_strncmp                 : TSDL_strncmp;
  SDL_strcasecmp              : TSDL_strcasecmp;
  SDL_strncasecmp             : TSDL_strncasecmp;
  SDL_strpbrk                 : TSDL_strpbrk;
  SDL_StepUTF8                : TSDL_StepUTF8;
  SDL_StepBackUTF8            : TSDL_StepBackUTF8;
  SDL_UCS4ToUTF8              : TSDL_UCS4ToUTF8;
  SDL_sscanf                  : TSDL_sscanf;
  SDL_vsscanf                 : TSDL_vsscanf;
  SDL_snprintf                : TSDL_snprintf;
  SDL_swprintf                : TSDL_swprintf;
  SDL_vsnprintf               : TSDL_vsnprintf;
  SDL_vswprintf               : TSDL_vswprintf;
  SDL_asprintf                : TSDL_asprintf;
  SDL_vasprintf               : TSDL_vasprintf;
  SDL_srand                   : TSDL_srand;
  SDL_rand                    : TSDL_rand;
  SDL_randf                   : TSDL_randf;
  SDL_rand_bits               : TSDL_rand_bits;
  SDL_rand_r                  : TSDL_rand_r;
  SDL_randf_r                 : TSDL_randf_r;
  SDL_rand_bits_r             : TSDL_rand_bits_r;
  SDL_acos                    : TSDL_acos;
  SDL_acosf                   : TSDL_acosf;
  SDL_asin                    : TSDL_asin;
  SDL_asinf                   : TSDL_asinf;
  SDL_atan                    : TSDL_atan;
  SDL_atanf                   : TSDL_atanf;
  SDL_atan2                   : TSDL_atan2;
  SDL_atan2f                  : TSDL_atan2f;
  SDL_ceil                    : TSDL_ceil;
  SDL_ceilf                   : TSDL_ceilf;
  SDL_copysign                : TSDL_copysign;
  SDL_copysignf               : TSDL_copysignf;
  SDL_cos                     : TSDL_cos;
  SDL_cosf                    : TSDL_cosf;
  SDL_exp                     : TSDL_exp;
  SDL_expf                    : TSDL_expf;
  SDL_fabs                    : TSDL_fabs;
  SDL_fabsf                   : TSDL_fabsf;
  SDL_floor                   : TSDL_floor;
  SDL_floorf                  : TSDL_floorf;
  SDL_trunc                   : TSDL_trunc;
  SDL_truncf                  : TSDL_truncf;
  SDL_fmod                    : TSDL_fmod;
  SDL_fmodf                   : TSDL_fmodf;
  SDL_isinf                   : TSDL_isinf;
  SDL_isinff                  : TSDL_isinff;
  SDL_isnan                   : TSDL_isnan;
  SDL_isnanf                  : TSDL_isnanf;
  SDL_log                     : TSDL_log;
  SDL_logf                    : TSDL_logf;
  SDL_log10                   : TSDL_log10;
  SDL_log10f                  : TSDL_log10f;
  SDL_modf                    : TSDL_modf;
  SDL_modff                   : TSDL_modff;
  SDL_pow                     : TSDL_pow;
  SDL_powf                    : TSDL_powf;
  SDL_round                   : TSDL_round;
  SDL_roundf                  : TSDL_roundf;
  SDL_lround                  : TSDL_lround;
  SDL_lroundf                 : TSDL_lroundf;
  SDL_scalbn                  : TSDL_scalbn;
  SDL_scalbnf                 : TSDL_scalbnf;
  SDL_sin                     : TSDL_sin;
  SDL_sinf                    : TSDL_sinf;
  SDL_sqrt                    : TSDL_sqrt;
  SDL_sqrtf                   : TSDL_sqrtf;
  SDL_tan                     : TSDL_tan;
  SDL_tanf                    : TSDL_tanf;
  SDL_iconv_open              : TSDL_iconv_open;
  SDL_iconv_close             : TSDL_iconv_close;
  SDL_iconv                   : TSDL_iconv;
  SDL_iconv_string            : TSDL_iconv_string;

procedure InitLibrary(const AHandle: THandle);

implementation

function SDL_SIZE_MAX: size_t;
begin
  Result                      := High(size_t);
//  if SizeOf(NativeInt) = 32 then
//    Result                      := SDL_MAX_UINT32
//  else
//    Result                      := SDL_MAX_UINT64;
end;

function SDL_iconv_utf8_locale(Abuf: PAnsiChar): PAnsiChar;
begin
  Result                      := SDL_iconv_string('', 'UTF-8', Abuf, SDL_strlen(Abuf) + 1);
end;

function SDL_iconv_utf8_ucs2(Abuf: PAnsiChar): PAnsiChar;
begin
  Result                      := SDL_iconv_string('UCS-2', 'UTF-8', Abuf, SDL_strlen(Abuf) + 1);
end;

function SDL_iconv_utf8_ucs4(Abuf: PAnsiChar): PAnsiChar;
begin
  Result                      := SDL_iconv_string('UCS-4', 'UTF-8', Abuf, SDL_strlen(Abuf) + 1);
end;

function SDL_iconv_wchar_utf8(Abuf: PWideChar): PAnsiChar;
begin
  Result                      := SDL_iconv_string('UTF-8', 'WCHAR_T', PAnsiChar(Abuf), SDL_wcslen(Abuf) + 1 + SizeOf(WideChar));
end;

function SDL_size_mul_check_overflow(Aa: size_t; Ab: size_t; var Aret: size_t): bool;
begin
  if (Aa <> 0) and (Ab > SDL_SIZE_MAX / Aa) then
    Exit(False);

  Aret                        := Aa * Ab;
  Result                      := True;
end;
//
//function SDL_size_mul_check_overflow_builtin(Aa: size_t; Ab: size_t; var Aret: size_t): bool;
//begin
//  __builtin_mul_overflow
//end;

function SDL_size_add_check_overflow(Aa: size_t; Ab: size_t; var Aret: size_t): bool;
begin
  if (Ab > SDL_SIZE_MAX - Aa) then
    Exit(False);

  Aret                        := Aa + Ab;
  Result                      := True;
end;
//
//function SDL_size_add_check_overflow_buildin(Aa: size_t; Ab: size_t; var Aret: size_t): bool;
//begin
//
//end;

function SDL_FOURCC(A: AnsiChar; B: AnsiChar; C: AnsiChar; D: AnsiChar): Uint32;
begin
  Result                      := (Ord(A) shl 0) or (Ord(B) shl 8) or (Ord(C) shl 16) or (Ord(D) shl 24);
end;

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_malloc                 := BindProcedure(AHandle, 'SDL_malloc');
  @SDL_calloc                 := BindProcedure(AHandle, 'SDL_calloc');
  @SDL_realloc                := BindProcedure(AHandle, 'SDL_realloc');
  @SDL_free                   := BindProcedure(AHandle, 'SDL_free');
  @SDL_GetOriginalMemoryFunctions
                              := BindProcedure(AHandle, 'SDL_GetOriginalMemoryFunctions');
  @SDL_GetMemoryFunctions     := BindProcedure(AHandle, 'SDL_GetMemoryFunctions');
  @SDL_SetMemoryFunctions     := BindProcedure(AHandle, 'SDL_SetMemoryFunctions');
  @SDL_aligned_alloc          := BindProcedure(AHandle, 'SDL_aligned_alloc');
  @SDL_aligned_free           := BindProcedure(AHandle, 'SDL_aligned_free');
  @SDL_GetNumAllocations      := BindProcedure(AHandle, 'SDL_GetNumAllocations');
  @SDL_GetEnvironment         := BindProcedure(AHandle, 'SDL_GetEnvironment');
  @SDL_CreateEnvironment      := BindProcedure(AHandle, 'SDL_CreateEnvironment');
  @SDL_GetEnvironmentVariable := BindProcedure(AHandle, 'SDL_GetEnvironmentVariable');
  @SDL_GetEnvironmentVariables:= BindProcedure(AHandle, 'SDL_GetEnvironmentVariables');
  @SDL_SetEnvironmentVariable := BindProcedure(AHandle, 'SDL_SetEnvironmentVariable');
  @SDL_UnsetEnvironmentVariable
                              := BindProcedure(AHandle, 'SDL_UnsetEnvironmentVariable');
  @SDL_DestroyEnvironment     := BindProcedure(AHandle, 'SDL_DestroyEnvironment');
  @SDL_getenv                 := BindProcedure(AHandle, 'SDL_getenv');
  @SDL_getenv_unsafe          := BindProcedure(AHandle, 'SDL_getenv_unsafe');
  @SDL_setenv_unsafe          := BindProcedure(AHandle, 'SDL_setenv_unsafe');
  @SDL_unsetenv_unsafe        := BindProcedure(AHandle, 'SDL_unsetenv_unsafe');
  @SDL_qsort                  := BindProcedure(AHandle, 'SDL_qsort');
  @SDL_bsearch                := BindProcedure(AHandle, 'SDL_bsearch');
  @SDL_qsort_r                := BindProcedure(AHandle, 'SDL_qsort_r');
  @SDL_bsearch_r              := BindProcedure(AHandle, 'SDL_bsearch_r');
  @SDL_abs                    := BindProcedure(AHandle, 'SDL_abs');
  @SDL_isalpha                := BindProcedure(AHandle, 'SDL_isalpha');
  @SDL_isalnum                := BindProcedure(AHandle, 'SDL_isalnum');
  @SDL_isblank                := BindProcedure(AHandle, 'SDL_isblank');
  @SDL_iscntrl                := BindProcedure(AHandle, 'SDL_iscntrl');
  @SDL_isdigit                := BindProcedure(AHandle, 'SDL_isdigit');
  @SDL_isxdigit               := BindProcedure(AHandle, 'SDL_isxdigit');
  @SDL_ispunct                := BindProcedure(AHandle, 'SDL_ispunct');
  @SDL_isspace                := BindProcedure(AHandle, 'SDL_isspace');
  @SDL_isupper                := BindProcedure(AHandle, 'SDL_isupper');
  @SDL_islower                := BindProcedure(AHandle, 'SDL_islower');
  @SDL_isprint                := BindProcedure(AHandle, 'SDL_isprint');
  @SDL_isgraph                := BindProcedure(AHandle, 'SDL_isgraph');
  @SDL_toupper                := BindProcedure(AHandle, 'SDL_toupper');
  @SDL_tolower                := BindProcedure(AHandle, 'SDL_tolower');
  @SDL_crc16                  := BindProcedure(AHandle, 'SDL_crc16');
  @SDL_crc32                  := BindProcedure(AHandle, 'SDL_crc32');
  @SDL_murmur3_32             := BindProcedure(AHandle, 'SDL_murmur3_32');
  @SDL_memcpy                 := BindProcedure(AHandle, 'SDL_memcpy');
  @SDL_memmove                := BindProcedure(AHandle, 'SDL_memmove');
  @SDL_memset                 := BindProcedure(AHandle, 'SDL_memset');
  @SDL_memset4                := BindProcedure(AHandle, 'SDL_memset4');
  @SDL_memcmp                 := BindProcedure(AHandle, 'SDL_memcmp');
  @SDL_wcslen                 := BindProcedure(AHandle, 'SDL_wcslen');
  @SDL_wcsnlen                := BindProcedure(AHandle, 'SDL_wcsnlen');
  @SDL_wcslcpy                := BindProcedure(AHandle, 'SDL_wcslcpy');
  @SDL_wcslcat                := BindProcedure(AHandle, 'SDL_wcslcat');
  @SDL_wcsdup                 := BindProcedure(AHandle, 'SDL_wcsdup');
  @SDL_wcsstr                 := BindProcedure(AHandle, 'SDL_wcsstr');
  @SDL_wcsnstr                := BindProcedure(AHandle, 'SDL_wcsnstr');
  @SDL_wcscmp                 := BindProcedure(AHandle, 'SDL_wcscmp');
  @SDL_wcsncmp                := BindProcedure(AHandle, 'SDL_wcsncmp');
  @SDL_wcscasecmp             := BindProcedure(AHandle, 'SDL_wcscasecmp');
  @SDL_wcsncasecmp            := BindProcedure(AHandle, 'SDL_wcsncasecmp');
  @SDL_wcstol                 := BindProcedure(AHandle, 'SDL_wcstol');
  @SDL_strlen                 := BindProcedure(AHandle, 'SDL_strlen');
  @SDL_strnlen                := BindProcedure(AHandle, 'SDL_strnlen');
  @SDL_strlcpy                := BindProcedure(AHandle, 'SDL_strlcpy');
  @SDL_utf8strlcpy            := BindProcedure(AHandle, 'SDL_utf8strlcpy');
  @SDL_strlcat                := BindProcedure(AHandle, 'SDL_strlcat');
  @SDL_strdup                 := BindProcedure(AHandle, 'SDL_strdup');
  @SDL_strndup                := BindProcedure(AHandle, 'SDL_strndup');
  @SDL_strrev                 := BindProcedure(AHandle, 'SDL_strrev');
  @SDL_strupr                 := BindProcedure(AHandle, 'SDL_strupr');
  @SDL_strlwr                 := BindProcedure(AHandle, 'SDL_strlwr');
  @SDL_strchr                 := BindProcedure(AHandle, 'SDL_strchr');
  @SDL_strrchr                := BindProcedure(AHandle, 'SDL_strrchr');
  @SDL_strstr                 := BindProcedure(AHandle, 'SDL_strstr');
  @SDL_strnstr                := BindProcedure(AHandle, 'SDL_strnstr');
  @SDL_strcasestr             := BindProcedure(AHandle, 'SDL_strcasestr');
  @SDL_strtok_r               := BindProcedure(AHandle, 'SDL_strtok_r');
  @SDL_utf8strlen             := BindProcedure(AHandle, 'SDL_utf8strlen');
  @SDL_utf8strnlen            := BindProcedure(AHandle, 'SDL_utf8strnlen');
  @SDL_itoa                   := BindProcedure(AHandle, 'SDL_itoa');
  @SDL_uitoa                  := BindProcedure(AHandle, 'SDL_uitoa');
  @SDL_ltoa                   := BindProcedure(AHandle, 'SDL_ltoa');
  @SDL_ultoa                  := BindProcedure(AHandle, 'SDL_ultoa');
  @SDL_lltoa                  := BindProcedure(AHandle, 'SDL_lltoa');
  @SDL_ulltoa                 := BindProcedure(AHandle, 'SDL_ulltoa');
  @SDL_atoi                   := BindProcedure(AHandle, 'SDL_atoi');
  @SDL_atof                   := BindProcedure(AHandle, 'SDL_atof');
  @SDL_strtol                 := BindProcedure(AHandle, 'SDL_strtol');
  @SDL_strtoul                := BindProcedure(AHandle, 'SDL_strtoul');
  @SDL_strtoll                := BindProcedure(AHandle, 'SDL_strtoll');
  @SDL_strtoull               := BindProcedure(AHandle, 'SDL_strtoull');
  @SDL_strtod                 := BindProcedure(AHandle, 'SDL_strtod');
  @SDL_strcmp                 := BindProcedure(AHandle, 'SDL_strcmp');
  @SDL_strncmp                := BindProcedure(AHandle, 'SDL_strncmp');
  @SDL_strcasecmp             := BindProcedure(AHandle, 'SDL_strcasecmp');
  @SDL_strncasecmp            := BindProcedure(AHandle, 'SDL_strncasecmp');
  @SDL_strpbrk                := BindProcedure(AHandle, 'SDL_strpbrk');
  @SDL_StepUTF8               := BindProcedure(AHandle, 'SDL_StepUTF8');
  @SDL_StepBackUTF8           := BindProcedure(AHandle, 'SDL_StepBackUTF8');
  @SDL_UCS4ToUTF8             := BindProcedure(AHandle, 'SDL_UCS4ToUTF8');
  @SDL_sscanf                 := BindProcedure(AHandle, 'SDL_sscanf');
  @SDL_vsscanf                := BindProcedure(AHandle, 'SDL_vsscanf');
  @SDL_snprintf               := BindProcedure(AHandle, 'SDL_snprintf');
  @SDL_swprintf               := BindProcedure(AHandle, 'SDL_swprintf');
  @SDL_vsnprintf              := BindProcedure(AHandle, 'SDL_vsnprintf');
  @SDL_vswprintf              := BindProcedure(AHandle, 'SDL_vswprintf');
  @SDL_asprintf               := BindProcedure(AHandle, 'SDL_asprintf');
  @SDL_vasprintf              := BindProcedure(AHandle, 'SDL_vasprintf');
  @SDL_srand                  := BindProcedure(AHandle, 'SDL_srand');
  @SDL_rand                   := BindProcedure(AHandle, 'SDL_rand');
  @SDL_randf                  := BindProcedure(AHandle, 'SDL_randf');
  @SDL_rand_bits              := BindProcedure(AHandle, 'SDL_rand_bits');
  @SDL_rand_r                 := BindProcedure(AHandle, 'SDL_rand_r');
  @SDL_randf_r                := BindProcedure(AHandle, 'SDL_randf_r');
  @SDL_rand_bits_r            := BindProcedure(AHandle, 'SDL_rand_bits_r');
  @SDL_acos                   := BindProcedure(AHandle, 'SDL_acos');
  @SDL_acosf                  := BindProcedure(AHandle, 'SDL_acosf');
  @SDL_asin                   := BindProcedure(AHandle, 'SDL_asin');
  @SDL_asinf                  := BindProcedure(AHandle, 'SDL_asinf');
  @SDL_atan                   := BindProcedure(AHandle, 'SDL_atan');
  @SDL_atanf                  := BindProcedure(AHandle, 'SDL_atanf');
  @SDL_atan2                  := BindProcedure(AHandle, 'SDL_atan2');
  @SDL_atan2f                 := BindProcedure(AHandle, 'SDL_atan2f');
  @SDL_ceil                   := BindProcedure(AHandle, 'SDL_ceil');
  @SDL_ceilf                  := BindProcedure(AHandle, 'SDL_ceilf');
  @SDL_copysign               := BindProcedure(AHandle, 'SDL_copysign');
  @SDL_copysignf              := BindProcedure(AHandle, 'SDL_copysignf');
  @SDL_cos                    := BindProcedure(AHandle, 'SDL_cos');
  @SDL_cosf                   := BindProcedure(AHandle, 'SDL_cosf');
  @SDL_exp                    := BindProcedure(AHandle, 'SDL_exp');
  @SDL_expf                   := BindProcedure(AHandle, 'SDL_expf');
  @SDL_fabs                   := BindProcedure(AHandle, 'SDL_fabs');
  @SDL_fabsf                  := BindProcedure(AHandle, 'SDL_fabsf');
  @SDL_floor                  := BindProcedure(AHandle, 'SDL_floor');
  @SDL_floorf                 := BindProcedure(AHandle, 'SDL_floorf');
  @SDL_trunc                  := BindProcedure(AHandle, 'SDL_trunc');
  @SDL_truncf                 := BindProcedure(AHandle, 'SDL_truncf');
  @SDL_fmod                   := BindProcedure(AHandle, 'SDL_fmod');
  @SDL_fmodf                  := BindProcedure(AHandle, 'SDL_fmodf');
  @SDL_isinf                  := BindProcedure(AHandle, 'SDL_isinf');
  @SDL_isinff                 := BindProcedure(AHandle, 'SDL_isinff');
  @SDL_isnan                  := BindProcedure(AHandle, 'SDL_isnan');
  @SDL_isnanf                 := BindProcedure(AHandle, 'SDL_isnanf');
  @SDL_log                    := BindProcedure(AHandle, 'SDL_log');
  @SDL_logf                   := BindProcedure(AHandle, 'SDL_logf');
  @SDL_log10                  := BindProcedure(AHandle, 'SDL_log10');
  @SDL_log10f                 := BindProcedure(AHandle, 'SDL_log10f');
  @SDL_modf                   := BindProcedure(AHandle, 'SDL_modf');
  @SDL_modff                  := BindProcedure(AHandle, 'SDL_modff');
  @SDL_pow                    := BindProcedure(AHandle, 'SDL_pow');
  @SDL_powf                   := BindProcedure(AHandle, 'SDL_powf');
  @SDL_round                  := BindProcedure(AHandle, 'SDL_round');
  @SDL_roundf                 := BindProcedure(AHandle, 'SDL_roundf');
  @SDL_lround                 := BindProcedure(AHandle, 'SDL_lround');
  @SDL_lroundf                := BindProcedure(AHandle, 'SDL_lroundf');
  @SDL_scalbn                 := BindProcedure(AHandle, 'SDL_scalbn');
  @SDL_scalbnf                := BindProcedure(AHandle, 'SDL_scalbnf');
  @SDL_sin                    := BindProcedure(AHandle, 'SDL_sin');
  @SDL_sinf                   := BindProcedure(AHandle, 'SDL_sinf');
  @SDL_sqrt                   := BindProcedure(AHandle, 'SDL_sqrt');
  @SDL_sqrtf                  := BindProcedure(AHandle, 'SDL_sqrtf');
  @SDL_tan                    := BindProcedure(AHandle, 'SDL_tan');
  @SDL_tanf                   := BindProcedure(AHandle, 'SDL_tanf');
  @SDL_iconv_open             := BindProcedure(AHandle, 'SDL_iconv_open');
  @SDL_iconv_close            := BindProcedure(AHandle, 'SDL_iconv_close');
  @SDL_iconv                  := BindProcedure(AHandle, 'SDL_iconv');
  @SDL_iconv_string           := BindProcedure(AHandle, 'SDL_iconv_string');
end;

end.
