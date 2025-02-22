unit SDL.hidapi;

interface

uses
  SDL.PascalEntry,
  SDL.stdinc,
  SDL.error;

type
  TSDL_hid_device = record end;
  PSDL_hid_device = ^TSDL_hid_device;

  TSDL_hid_bus_type           = (
                                  SDL_HID_API_BUS_UNKNOWN         = $00,
                                  SDL_HID_API_BUS_USB             = $01,
                                  SDL_HID_API_BUS_BLUETOOTH       = $02,
                                  SDL_HID_API_BUS_I2C             = $03,
                                  SDL_HID_API_BUS_SPI             = $04
                                );
  PSDL_hid_bus_type = ^TSDL_hid_bus_type;

  PSDL_hid_device_info = ^TSDL_hid_device_info;
  TSDL_hid_device_info = record
    path                        : PAnsiChar;
    vendor_id                   : u_short;
    product_id                  : u_short;
    serial_number               : PWideChar;
    release_number              : u_short;
    manufacturer_string         : PWideChar;
    product_string              : PWideChar;
    usage_page                  : u_short;
    usage                       : u_short;

    interface_number            : int;

    interface_class             : int;
    interface_subclass          : int;
    interface_protocol          : int;

    bus_type                    : TSDL_hid_bus_type;
    next                        : PSDL_hid_device_info;
  end;

  /// <summary>
  ///  Initialize the HIDAPI library.
  /// </summary>
  TSDL_hid_init               = function (): int; cdecl;

  /// <summary>
  ///  Finalize the HIDAPI library.
  /// </summary>
  TSDL_hid_exit               = function (): int; cdecl;

  /// <summary>
  ///  Check to see if devices may have been added or removed.
  /// </summary>
  TSDL_hid_device_change_count= function (): Uint32; cdecl;

  /// <summary>
  ///  Enumerate the HID Devices.
  /// </summary>
  TSDL_hid_enumerate          = function (Avendor_id: u_short; Aproduct_id: u_short): PSDL_hid_device_info; cdecl;

  /// <summary>
  ///  Free an enumeration linked list.
  /// </summary>
  TSDL_hid_free_enumeration   = procedure (Adevs: PSDL_hid_device_info); cdecl;

  /// <summary>
  ///  Open a HID device using a Vendor ID (VID), Product ID (PID) and optionally
  ///  a serial number.
  /// </summary>
  TSDL_hid_open               = function (Avendor_id: u_short; Aproduct_id: u_short; const Aserial_number: PWideChar): PSDL_hid_device; cdecl;

  /// <summary>
  ///  Open a HID device by its path name.
  /// </summary>
  TSDL_hid_open_path          = function (const Apath: PAnsiChar): PSDL_hid_device; cdecl;

  /// <summary>
  ///  Write an Output report to a HID device.
  /// </summary>
  TSDL_hid_write              = function (Adev: PSDL_hid_device; const Adata: Pointer; Alength: size_t): int; cdecl;

  /// <summary>
  ///  Read an Input report from a HID device with timeout.
  /// </summary>
  TSDL_hid_read_timeout       = function (Adev: PSDL_hid_device; Adata: Pointer; Alength: size_t; Amilliseconds: int): int; cdecl;

  /// <summary>
  ///  Read an Input report from a HID device.
  /// </summary>
  TSDL_hid_read               = function (Adev: PSDL_hid_device; Adata: Pointer; Alength: size_t): int; cdecl;

  /// <summary>
  ///  Set the device handle to be non-blocking.
  /// </summary>
  TSDL_hid_set_nonblocking    = function (Adev: PSDL_hid_device; Anonblock: int): int; cdecl;

  /// <summary>
  ///  Send a Feature report to the device.
  /// </summary>
  TSDL_hid_send_feature_report= function (Adev: PSDL_hid_device; const Adata: Pointer; Alength: size_t): int; cdecl;

  /// <summary>
  ///  Get a feature report from a HID device.
  /// </summary>
  TSDL_hid_get_feature_report = function (Adev: PSDL_hid_device; Adata: Pointer; Alength: size_t): int; cdecl;

  /// <summary>
  ///  Get an input report from a HID device.
  /// </summary>
  TSDL_hid_get_input_report   = function (Adev: PSDL_hid_device; Adata: Pointer; Alength: size_t): int; cdecl;

  /// <summary>
  ///  Close a HID device.
  /// </summary>
  TSDL_hid_close              = function (Adev: PSDL_hid_device): int; cdecl;

  /// <summary>
  ///  Get The Manufacturer String from a HID device.
  /// </summary>
  TSDL_hid_get_manufacturer_string
                              = function (Adev: PSDL_hid_device; Astring: PWideChar; Amaxlen: size_t): int; cdecl;

  /// <summary>
  ///  Get The Product String from a HID device.
  /// </summary>
  TSDL_hid_get_product_string = function (Adev: PSDL_hid_device; Astring: PWideChar; Amaxlen: size_t): int; cdecl;

  /// <summary>
  ///  Get The Serial Number String from a HID device.
  /// </summary>
  TSDL_hid_get_serial_number_string
                              = function (Adev: PSDL_hid_device; Astring: PWideChar; Amaxlen: size_t): int; cdecl;

  /// <summary>
  ///  Get a string from a HID device, based on its string index.
  /// </summary>
  TSDL_hid_get_indexed_string = function (Adev: PSDL_hid_device; Astring_index: int; Astring: PWideChar; Amaxlen: size_t): int; cdecl;

  /// <summary>
  ///  Get the device info from a HID device.
  /// </summary>
  TSDL_hid_get_device_info    = function (Adev: PSDL_hid_device): PSDL_hid_device_info; cdecl;

  /// <summary>
  ///  Get a report descriptor from a HID device.
  /// </summary>
  TSDL_hid_get_report_descriptor
                              = function (Adev: PSDL_hid_device; Abuf: Pointer; Abuf_size: size_t): int; cdecl;

  /// <summary>
  ///  Start or stop a BLE scan on iOS and tvOS to pair Steam Controllers.
  /// </summary>
  TSDL_hid_ble_scan           = procedure (Aactive: bool); cdecl;

var
  SDL_hid_init                : TSDL_hid_init;
  SDL_hid_exit                : TSDL_hid_exit;
  SDL_hid_device_change_count : TSDL_hid_device_change_count;
  SDL_hid_enumerate           : TSDL_hid_enumerate;
  SDL_hid_free_enumeration    : TSDL_hid_free_enumeration;
  SDL_hid_open                : TSDL_hid_open;
  SDL_hid_open_path           : TSDL_hid_open_path;
  SDL_hid_write               : TSDL_hid_write;
  SDL_hid_read_timeout        : TSDL_hid_read_timeout;
  SDL_hid_read                : TSDL_hid_read;
  SDL_hid_set_nonblocking     : TSDL_hid_set_nonblocking;
  SDL_hid_send_feature_report : TSDL_hid_send_feature_report;
  SDL_hid_get_feature_report  : TSDL_hid_get_feature_report;
  SDL_hid_get_input_report    : TSDL_hid_get_input_report;
  SDL_hid_close               : TSDL_hid_close;
  SDL_hid_get_manufacturer_string
                              : TSDL_hid_get_manufacturer_string;
  SDL_hid_get_product_string  : TSDL_hid_get_product_string;
  SDL_hid_get_serial_number_string
                              : TSDL_hid_get_serial_number_string;
  SDL_hid_get_indexed_string  : TSDL_hid_get_indexed_string;
  SDL_hid_get_device_info     : TSDL_hid_get_device_info;
  SDL_hid_get_report_descriptor
                              : TSDL_hid_get_report_descriptor;
  SDL_hid_ble_scan            : TSDL_hid_ble_scan;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_hid_exit               := BindProcedure(AHandle, 'SDL_hid_exit');
  @SDL_hid_device_change_count:= BindProcedure(AHandle, 'SDL_hid_device_change_count');
  @SDL_hid_enumerate          := BindProcedure(AHandle, 'SDL_hid_enumerate');
  @SDL_hid_free_enumeration   := BindProcedure(AHandle, 'SDL_hid_free_enumeration');
  @SDL_hid_open               := BindProcedure(AHandle, 'SDL_hid_open');
  @SDL_hid_open_path          := BindProcedure(AHandle, 'SDL_hid_open_path');
  @SDL_hid_write              := BindProcedure(AHandle, 'SDL_hid_write');
  @SDL_hid_read_timeout       := BindProcedure(AHandle, 'SDL_hid_read_timeout');
  @SDL_hid_read               := BindProcedure(AHandle, 'SDL_hid_read');
  @SDL_hid_set_nonblocking    := BindProcedure(AHandle, 'SDL_hid_set_nonblocking');
  @SDL_hid_send_feature_report:= BindProcedure(AHandle, 'SDL_hid_send_feature_report');
  @SDL_hid_get_feature_report := BindProcedure(AHandle, 'SDL_hid_get_feature_report');
  @SDL_hid_get_input_report   := BindProcedure(AHandle, 'SDL_hid_get_input_report');
  @SDL_hid_close              := BindProcedure(AHandle, 'SDL_hid_close');
  @SDL_hid_get_manufacturer_string
                              := BindProcedure(AHandle, 'SDL_hid_get_manufacturer_string');
  @SDL_hid_get_product_string := BindProcedure(AHandle, 'SDL_hid_get_product_string');
  @SDL_hid_get_serial_number_string
                              := BindProcedure(AHandle, 'SDL_hid_get_serial_number_string');
  @SDL_hid_get_indexed_string := BindProcedure(AHandle, 'SDL_hid_get_indexed_string');
  @SDL_hid_get_device_info    := BindProcedure(AHandle, 'SDL_hid_get_device_info');
  @SDL_hid_get_report_descriptor
                              := BindProcedure(AHandle, 'SDL_hid_get_report_descriptor');
  @SDL_hid_ble_scan           := BindProcedure(AHandle, 'SDL_hid_ble_scan');
end;

end.
