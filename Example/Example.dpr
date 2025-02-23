﻿program Example;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Main in 'Forms\Form.Main.pas' {Form1},
  SDL.assert in '..\Source\SDL.assert.pas',
  SDL.asyncio in '..\Source\SDL.asyncio.pas',
  SDL.atomic in '..\Source\SDL.atomic.pas',
  SDL.audio in '..\Source\SDL.audio.pas',
  SDL.bits in '..\Source\SDL.bits.pas',
  SDL.blendmode in '..\Source\SDL.blendmode.pas',
  SDL.camera in '..\Source\SDL.camera.pas',
  SDL.clipboard in '..\Source\SDL.clipboard.pas',
  SDL.copying in '..\Source\SDL.copying.pas',
  SDL.cpuinfo in '..\Source\SDL.cpuinfo.pas',
  SDL.dialog in '..\Source\SDL.dialog.pas',
  SDL.egl in '..\Source\SDL.egl.pas',
  SDL.endian in '..\Source\SDL.endian.pas',
  SDL.error in '..\Source\SDL.error.pas',
  SDL.events in '..\Source\SDL.events.pas',
  SDL.filesystem in '..\Source\SDL.filesystem.pas',
  SDL.gamepad in '..\Source\SDL.gamepad.pas',
  SDL.gpu in '..\Source\SDL.gpu.pas',
  SDL.guid in '..\Source\SDL.guid.pas',
  SDL.haptic in '..\Source\SDL.haptic.pas',
  SDL.hidapi in '..\Source\SDL.hidapi.pas',
  SDL.hints in '..\Source\SDL.hints.pas',
  SDL.init in '..\Source\SDL.init.pas',
  SDL.intrin in '..\Source\SDL.intrin.pas',
  SDL.iostream in '..\Source\SDL.iostream.pas',
  SDL.joystick in '..\Source\SDL.joystick.pas',
  SDL.keyboard in '..\Source\SDL.keyboard.pas',
  SDL.keycode in '..\Source\SDL.keycode.pas',
  SDL.loadso in '..\Source\SDL.loadso.pas',
  SDL.locale in '..\Source\SDL.locale.pas',
  SDL.log in '..\Source\SDL.log.pas',
  SDL.main in '..\Source\SDL.main.pas',
  SDL.messagebox in '..\Source\SDL.messagebox.pas',
  SDL.metal in '..\Source\SDL.metal.pas',
  SDL.misc in '..\Source\SDL.misc.pas',
  SDL.mouse in '..\Source\SDL.mouse.pas',
  SDL.mutex in '..\Source\SDL.mutex.pas',
  SDL.pen in '..\Source\SDL.pen.pas',
  SDL.pixels in '..\Source\SDL.pixels.pas',
  SDL.platform in '..\Source\SDL.platform.pas',
  SDL.power in '..\Source\SDL.power.pas',
  SDL.process in '..\Source\SDL.process.pas',
  SDL.properties in '..\Source\SDL.properties.pas',
  SDL.stdinc in '..\Source\SDL.stdinc.pas',
  SDL.PascalEntry in '..\Source\SDL.PascalEntry.pas',
  SDL.version in '..\Source\SDL.version.pas',
  SDL.rect in '..\Source\SDL.rect.pas',
  SDL.render in '..\Source\SDL.render.pas',
  SDL.revisions in '..\Source\SDL.revisions.pas',
  SDL.scancode in '..\Source\SDL.scancode.pas',
  SDL.sensor in '..\Source\SDL.sensor.pas',
  SDL.storage in '..\Source\SDL.storage.pas',
  SDL.surface in '..\Source\SDL.surface.pas',
  SDL.thread in '..\Source\SDL.thread.pas',
  SDL.time in '..\Source\SDL.time.pas',
  SDL.timer in '..\Source\SDL.timer.pas',
  SDL.touch in '..\Source\SDL.touch.pas',
  SDL.video in '..\Source\SDL.video.pas',
  SDL.vulkan in '..\Source\SDL.vulkan.pas',
  SDL.system in '..\Source\SDL.system.pas',
  SDL.tray in '..\Source\SDL.tray.pas',
  Form.Audio in 'Forms\Form.Audio.pas' {FormAudio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormAudio, FormAudio);
  Application.Run;
end.
