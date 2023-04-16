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
  final Paint metroBody = Paint()
    ..color = const Color(0xFF503018)
    ..style = PaintingStyle.fill;
  final Paint pendulumBar = Paint()
    ..color = const Color(0xFF708090)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3.0;
  final Paint scaleNormal = Paint()
    ..color = const Color(0xFF402010)
    ..style = PaintingStyle.fill;

  final MidiWidgetState state;
  CustomImagePainter(this.state);

  @override
  void paint(Canvas canvas, Size size) {
    double pendulumPos = (state.ticks % 72) / 36.0;
    double ox = size.width / 2;
    double oy = size.height - 50;
    double angle = 30 * pi / 180 * sin(pendulumPos * pi);
    double length = 90;
    double length2 = 60;
    double px = ox + sin(angle) * length;
    double py = oy - cos(angle) * length;
    double cx = ox + sin(angle) * length2;
    double cy = oy - cos(angle) * length2;

    double ticksX = (size.width - 70) / 2;
    double ticksHeight = 5;
    double ticksY = size.height - 5 - ticksHeight;
    canvas.drawRect(Rect.fromLTWH(ticksX, ticksY, 3, ticksHeight), blue);
    canvas.drawRect(Rect.fromLTWH(ticksX + 65, ticksY, 3, ticksHeight), blue);
    double tickPos = ticksX + 3 + 1 + state.ticks % 60;
    canvas.drawRect(Rect.fromLTWH(tickPos, ticksY, 1, ticksHeight), white);

    // Pendulum
    Path p = Path();
    double hw = 30;
    p.moveTo(ox - hw, oy + 20);
    p.lineTo(ox - hw, oy + 10);
    p.lineTo(ox - hw / 3, oy - 110);
    p.lineTo(ox + hw / 3, oy - 110);
    p.lineTo(ox + hw, oy + 10);
    p.lineTo(ox + hw, oy + 20);

    canvas.drawPath(p, metroBody);
    double sw = 5;
    canvas.drawRect(Rect.fromLTRB(ox - sw, oy - 95, ox + sw, oy - 5), scaleNormal);
    canvas.drawCircle(Offset(ox, oy), 12, scaleNormal);

    double ang = 0.1;
    if (angle >= -ang && angle <= ang) {
      canvas.drawCircle(
        Offset(ox, oy - 88),
        10,
        Paint()
          ..color = const Color(0xA0c0b040)
          ..style = PaintingStyle.fill,
      );
    }

    canvas.drawLine(Offset(ox, oy), Offset(px, py), pendulumBar);
    canvas.drawCircle(Offset(cx, cy), 4, pendulumHead);
  }

  @override
  bool shouldRepaint(covariant CustomImagePainter oldDelegate) {
    return true;
  }
}
