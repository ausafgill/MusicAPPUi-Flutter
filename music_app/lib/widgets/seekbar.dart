import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SeekBarData {
  final Duration position;
  final Duration duration;
  SeekBarData(this.position, this.duration);
}

class SeekBar extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final Duration postion;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEnd;
  SeekBar(
      {required this.duration,
      required this.postion,
      this.onChanged,
      this.onChangedEnd,
      required this.audioPlayer});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragval;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_formatDuration(widget.postion)),
        Expanded(
          child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: 4,
                  thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 4,
                    enabledThumbRadius: 4,
                  ),
                  overlayShape: RoundSliderOverlayShape(
                    overlayRadius: 10,
                  ),
                  activeTrackColor: Colors.white.withOpacity(0.2),
                  inactiveTrackColor: Colors.white,
                  overlayColor: Colors.white,
                  thumbColor: Colors.white),
              child: Slider(
                min: 0.0,
                max: widget.duration.inMilliseconds.toDouble(),
                value: min(
                  _dragval ?? widget.postion.inMilliseconds.toDouble(),
                  widget.duration.inMilliseconds.toDouble(),
                ),
                onChanged: (value) {
                  setState(() {
                    _dragval = value;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(Duration(milliseconds: value.round()));
                  }
                },
                onChangeEnd: (value) {
                  if (widget.onChangedEnd != null) {
                    widget.onChangedEnd!(Duration(
                      milliseconds: value.round(),
                    ));
                  }
                  _dragval = null;
                  widget.audioPlayer
                      .seek(Duration(milliseconds: value.round()));
                },
              )),
        ),
        Text(_formatDuration(widget.duration)),
      ],
    );
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return "--:--";
    } else {
      String min = duration.inMinutes.toString().padLeft(2, '0');
      String sec = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return "${min}:${sec}";
    }
  }
}
