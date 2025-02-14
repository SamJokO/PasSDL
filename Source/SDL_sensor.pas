unit SDL_sensor;

interface

uses
  SDL.Types,
  SDL_stdinc,
  SDL_properties;

type
  TSDL_Sensor = record end;
  PSDL_Sensor = ^TSDL_Sensor;

  TSDL_SensorID               = Uint32;
  PSDL_SensorID               = ^TSDL_SensorID;

const
  SDL_STANDARD_GRAVITY        = 9.80665;

type
  TSDL_SensorType             = (
                                  SDL_SENSOR_INVALID = -1,
                                  SDL_SENSOR_UNKNOWN,
                                  SDL_SENSOR_ACCEL,
                                  SDL_SENSOR_GYRO,
                                  SDL_SENSOR_ACCEL_L,
                                  SDL_SENSOR_GYRO_L,
                                  SDL_SENSOR_ACCEL_R,
                                  SDL_SENSOR_GYRO_R
                                );
  PSDL_SensorType             = ^TSDL_SensorType;

  /// <summary>
  ///  Get a list of currently connected sensors.
  /// </summary>
  TSDL_GetSensors             = function (var Acount: int): PSDL_SensorID; cdecl;

  /// <summary>
  ///  Get the implementation dependent name of a sensor.
  /// </summary>
  TSDL_GetSensorNameForID     = function (Ainstance_id: TSDL_SensorID): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the type of a sensor.
  /// </summary>
  TSDL_GetSensorTypeForID     = function (Ainstance_id: TSDL_SensorID): TSDL_SensorType; cdecl;

  /// <summary>
  ///  Get the platform dependent type of a sensor.
  /// </summary>
  TSDL_GetSensorNonPortableTypeForID
                              = function (Ainstance_id: TSDL_SensorID): int; cdecl;

  /// <summary>
  ///  Open a sensor for use.
  /// </summary>
  TSDL_OpenSensor             = function (Ainstance_id: TSDL_SensorID): PSDL_Sensor; cdecl;

  /// <summary>
  ///  Return the SDL_Sensor associated with an instance ID.
  /// </summary>
  TSDL_GetSensorFromID        = function (Ainstance_id: TSDL_SensorID): PSDL_Sensor; cdecl;

  /// <summary>
  ///  Get the properties associated with a sensor.
  /// </summary>
  TSDL_GetSensorProperties    = function (Asensor: PSDL_Sensor): TSDL_PropertiesID; cdecl;

  /// <summary>
  ///  Get the implementation dependent name of a sensor.
  /// </summary>
  TSDL_GetSensorName          = function (Asensor: PSDL_Sensor): PAnsiChar; cdecl;

  /// <summary>
  ///  Get the type of a sensor.
  /// </summary>
  TSDL_GetSensorType          = function (Asensor: PSDL_Sensor): TSDL_SensorType; cdecl;

  /// <summary>
  ///  Get the platform dependent type of a sensor.
  /// </summary>
  TSDL_GetSensorNonPortableType
                              = function (Asensor: PSDL_Sensor): int; cdecl;

  /// <summary>
  ///  Get the instance ID of a sensor.
  /// </summary>
  TSDL_GetSensorID            = function (Asensor: PSDL_Sensor): TSDL_SensorID; cdecl;

  /// <summary>
  ///  Get the current state of an opened sensor.
  /// </summary>
  TSDL_GetSensorData          = function (Asensor: PSDL_Sensor; var Adata: float; Anum_values: int): bool; cdecl;

  /// <summary>
  ///  Close a sensor previously opened with SDL_OpenSensor().
  /// </summary>
  TSDL_CloseSensor            = procedure (Asensor: PSDL_Sensor); cdecl;

  /// <summary>
  ///  Update the current state of the open sensors.
  /// </summary>
  TSDL_UpdateSensors          = procedure (); cdecl;

var
  SDL_GetSensors              : TSDL_GetSensors;
  SDL_GetSensorNameForID      : TSDL_GetSensorNameForID;
  SDL_GetSensorTypeForID      : TSDL_GetSensorTypeForID;
  SDL_GetSensorNonPortableTypeForID
                              : TSDL_GetSensorNonPortableTypeForID;
  SDL_OpenSensor              : TSDL_OpenSensor;
  SDL_GetSensorFromID         : TSDL_GetSensorFromID;
  SDL_GetSensorProperties     : TSDL_GetSensorProperties;
  SDL_GetSensorName           : TSDL_GetSensorName;
  SDL_GetSensorType           : TSDL_GetSensorType;
  SDL_GetSensorNonPortableType
                              : TSDL_GetSensorNonPortableType;
  SDL_GetSensorID             : TSDL_GetSensorID;
  SDL_GetSensorData           : TSDL_GetSensorData;
  SDL_CloseSensor             : TSDL_CloseSensor;
  SDL_UpdateSensors           : TSDL_UpdateSensors;

procedure InitLibrary(const AHandle: THandle);

implementation

procedure InitLibrary(const AHandle: THandle);
begin
  @SDL_GetSensors             := BindProcedure(AHandle, 'SDL_GetSensors');
  @SDL_GetSensorNameForID     := BindProcedure(AHandle, 'SDL_GetSensorNameForID');
  @SDL_GetSensorTypeForID     := BindProcedure(AHandle, 'SDL_GetSensorTypeForID');
  @SDL_GetSensorNonPortableTypeForID
                              := BindProcedure(AHandle, 'SDL_GetSensorNonPortableTypeForID');
  @SDL_OpenSensor             := BindProcedure(AHandle, 'SDL_OpenSensor');
  @SDL_GetSensorFromID        := BindProcedure(AHandle, 'SDL_GetSensorFromID');
  @SDL_GetSensorProperties    := BindProcedure(AHandle, 'SDL_GetSensorProperties');
  @SDL_GetSensorName          := BindProcedure(AHandle, 'SDL_GetSensorName');
  @SDL_GetSensorType          := BindProcedure(AHandle, 'SDL_GetSensorType');
  @SDL_GetSensorNonPortableType
                              := BindProcedure(AHandle, 'SDL_GetSensorNonPortableType');
  @SDL_GetSensorID            := BindProcedure(AHandle, 'SDL_GetSensorID');
  @SDL_GetSensorData          := BindProcedure(AHandle, 'SDL_GetSensorData');
  @SDL_CloseSensor            := BindProcedure(AHandle, 'SDL_CloseSensor');
  @SDL_UpdateSensors          := BindProcedure(AHandle, 'SDL_UpdateSensors');
end;

end.
