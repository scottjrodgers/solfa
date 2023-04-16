// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:flutter_midi_command/flutter_midi_command.dart';

class MidiInterface {
  final mc = MidiCommand();
  final List<String> devices = [];
  final HeapPriorityQueue eventQueue = HeapPriorityQueue((a, b) {
    // priority queue gives highest priority, so our comparison is reversed
    if (a.time > b.time) {
      return 1;
    } else if (a.time < b.time) {
      return -1;
    }
    return 0;
  });

  // for playback
  int lastTick = 0;

  factory MidiInterface() {
    // ignore: prefer_conditional_assignment
    if (_instance == null) {
      _instance = MidiInterface._();
    }
    return _instance!;
  }

  MidiInterface._() {
    initDevices();
    print("Done with midi constructor");
  }

  static MidiInterface? _instance;

  Future<void> initDevices() async {
    List<MidiDevice> devList = [];
    List<MidiDevice>? data = await mc.devices;
    print("$data");
    if (data != null) {
      devList = data;
    }
    devList.sort((a, b) => a.name.compareTo(b.name));
    for (var dev in devList) {
      if (!dev.connected) {
        devices.add(dev.id);

        await mc.connectToDevice(dev);
        print("Connect to device: ${dev.id} - ${dev.name}");
      }
    }
    print("Midi Interfaces: $devices");
  }

  void queue(MidiEvent event) {
    eventQueue.add(event);
  }

  void tick(int t) {
    lastTick = t;
    // if (t % 6 == 0) {
    //   String queue = "";
    //   for (var e in eventQueue.toList()) {
    //     queue = "$queue${e.time}, ";
    //   }
    //   print("tick: $t  queue: [$queue]");
    while (eventQueue.isNotEmpty && eventQueue.first.time <= t) {
      MidiEvent e = eventQueue.removeFirst();
      if (e is NoteOnEvent) {
        noteOn(dev: e.device, ch: e.channel, note: e.note, vel: e.vel);
      } else if (e is NoteOffEvent) {
        noteOff(dev: e.device, ch: e.channel, note: e.note, vel: e.vel);
      }
      // }
    }
  }

  void noteOn({int dev = 0, required int ch, required int note, required int vel}) {
    assert(dev >= 0 && dev < devices.length);
    assert(ch >= 1 && ch <= 16);
    assert(note >= 0 && note <= 127);
    assert(vel >= 0 && vel <= 127);

    var data = Uint8List(3);
    data[0] = 0x90 + (ch - 1);
    data[1] = note;
    data[2] = vel;

    String deviceId = devices[(dev)];
    mc.sendData(data, deviceId: deviceId);
  }

  void noteOff({int dev = 0, required int ch, required int note, required int vel}) {
    assert(dev >= 0 && dev < devices.length);
    assert(ch >= 1 && ch <= 16);
    assert(note >= 0 && note <= 127);
    assert(vel >= 0 && vel <= 127);

    var data = Uint8List(3);
    data[0] = 0x80 + (ch - 1);
    data[1] = note;
    data[2] = vel;

    String deviceId = devices[dev];
    mc.sendData(data, deviceId: deviceId);
  }

  void controlChange({int dev = 0, required int ch, required int control, required int value}) {
    assert(dev >= 0 && dev < devices.length);
    assert(ch >= 1 && ch <= 16);
    assert(control >= 0 && control <= 127);
    assert(value >= 0 && value <= 127);

    var data = Uint8List(3);
    data[0] = 0xB0 + (ch - 1);
    data[1] = control;
    data[2] = value;

    String deviceId = devices[dev];
    mc.sendData(data, deviceId: deviceId);
  }

  void nrpn4ControlChange({int dev = 0, required int ch, required int param, required int value}) {
    assert(dev >= 0 && dev < devices.length);
    assert(ch >= 1 && ch <= 16);
    assert(param >= 0 && param <= 16383);
    assert(value >= 0 && value <= 16383);

    int parameter = param.clamp(0, 16383);
    int parameterMSB = parameter ~/ 128;
    int parameterLSB = parameter & 0x7F;

    value = value.clamp(0, 16383);
    int valueMSB = value ~/ 128;
    int valueLSB = value & 0x7F;

    Uint8List data = Uint8List(9);
    // Data Entry MSB
    data[0] = 0xB0 + (ch - 1);
    data[1] = 0x63;
    data[2] = parameterMSB;

    // Data Entry LSB
    data[3] = 0x62;
    data[4] = parameterLSB;

    // Data Value MSB
    data[5] = 0x06;
    data[6] = valueMSB;

    // Data Value LSB
    data[7] = 0x26;
    data[8] = valueLSB;

    String deviceId = devices[dev];
    mc.sendData(data, deviceId: deviceId);
  }

  void pitchBend({int dev = 0, required int ch, required double bend, required int value}) {
    assert(dev >= 0 && dev < devices.length);
    assert(ch >= 1 && ch <= 16);

    double clampedBend = (bend.clamp(-1, 1) + 1) / 2.0;
    int targetValue = (clampedBend * 0x3FFF).round();

    int bendMSB = targetValue >> 7;
    int bendLSB = targetValue & 0x7F;

    var data = Uint8List(3);
    data[0] = 0xE0 + (ch - 1);
    data[1] = bendLSB;
    data[2] = bendMSB;

    String deviceId = devices[dev];
    mc.sendData(data, deviceId: deviceId);
  }

  void afterTouch({int dev = 0, required int ch, required int note, required int pressure}) {
    assert(dev >= 0 && dev < devices.length);
    assert(ch >= 1 && ch <= 16);
    assert(note >= 0 && note <= 127);
    assert(pressure >= 0 && pressure <= 127);

    var data = Uint8List(3);
    data[0] = 0xA0 + (ch - 1);
    data[1] = note;
    data[2] = pressure;

    String deviceId = devices[dev];
    mc.sendData(data, deviceId: deviceId);
  }
}

abstract class MidiEvent {
  final int time;
  final int device;
  final int channel;

  MidiEvent(this.time, {required this.device, required this.channel});
}

class NoteOnEvent extends MidiEvent {
  final int note;
  final int vel;

  NoteOnEvent(super.time, this.note, this.vel, {required super.device, required super.channel});
}

class NoteOffEvent extends MidiEvent {
  final int note;
  final int vel;

  NoteOffEvent(super.time, this.note, this.vel, {required super.device, required super.channel});
}
