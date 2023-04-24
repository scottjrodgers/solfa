import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../midi/midi_interface.dart';

class MidiWidget extends StatefulWidget {
  const MidiWidget({
    super.key,
  });

  @override
  State<MidiWidget> createState() => MidiWidgetState();
}

class MidiWidgetState extends State<MidiWidget> {
  int ticks = 0;
  double ticksPerBeat = 36;
  double beatTickCounter = 0.0;
  int beat = 0;
  late final Ticker ticker;
  final MidiInterface midi = MidiInterface();

  MidiWidgetState() {
    ticker = Ticker(tickCallback);
    ticker.start();
  }

  void tickCallback(Duration duration) {
    setState(() {
      ticks += 1;
      beatTickCounter += 1;
      if (beatTickCounter > ticksPerBeat) {
        beat += 1;
        beatTickCounter -= ticksPerBeat;
      }
    });
    midi.tick(ticks);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SizedBox(
        width: 100,
        height: double.infinity,
        child: CustomPaint(
          painter: CustomImagePainter(this),
        ),
      ),
    );
  }
}

class CustomImagePainter extends CustomPainter {
  final Paint blue = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;
  final Paint white = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;
  final Paint pendulumHead = Paint()
    ..color = const Color(0xFF8090A0)
    ..style = PaintingStyle.fill;

  final MidiWidgetState state;
  CustomImagePainter(this.state);

  @override
  void paint(Canvas canvas, Size size) {
    double pendulumPos = (state.midi.timer % 2);
    double ox = size.width / 2;
    double oy = size.height - 25;
    double ang = pendulumPos * pi;
    double sinAng = sin(ang);

    double ticksX = (size.width - 70) / 2;
    double ticksHeight = 5;
    double ticksY = size.height - 5 - ticksHeight;
    canvas.drawRect(Rect.fromLTWH(ticksX, ticksY, 3, ticksHeight), blue);
    canvas.drawRect(Rect.fromLTWH(ticksX + 65, ticksY, 3, ticksHeight), blue);
    double tickPos = ticksX + 3 + 1 + state.ticks % 60;
    canvas.drawRect(Rect.fromLTWH(tickPos, ticksY, 1, ticksHeight), white);

    // Metronome
    canvas.drawLine(Offset(ox - 35, oy), Offset(ox + 35, oy), blue);
    canvas.drawLine(Offset(ox, oy - 5), Offset(ox, oy + 5), white);

    // When it crosses zero
    double thresh = 0.2;
    if (sinAng >= -thresh && sinAng <= thresh) {
      canvas.drawCircle(
        Offset(ox, oy),
        6,
        Paint()
          ..color = const Color(0xFFa0a0F0)
          ..style = PaintingStyle.fill,
      );
    }

    // the metronome marker
    double scale = pow(cos(ang), 8) * 2 + 3;
    canvas.drawCircle(Offset(ox + 30 * sin(ang), oy), scale, pendulumHead);
  }

  @override
  bool shouldRepaint(covariant CustomImagePainter oldDelegate) {
    return true;
  }
}
