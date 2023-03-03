import 'package:volume_controller/volume_controller.dart';

import '../../core/states/torch_state.dart';
import '../../core/states/whistle_state.dart';
import 'tool_row_button.dart';

// import 'package:volume_control/volume_control.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:torch_light/torch_light.dart';

class ToolRow extends StatefulWidget {
  const ToolRow({Key? key}) : super(key: key);

  @override
  State<ToolRow> createState() => _ToolRowState();
}

class _ToolRowState extends State<ToolRow> {
  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);
    AudioPlayer player = playerProvider.player;
    final torchProvider = Provider.of<TorchProvider>(context);
    bool isLighthOn = torchProvider.isLightOn;
    final whistleProvider = Provider.of<WhistleProvider>(context);
    bool isWhitsleOn = whistleProvider.iswhistleOn;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ToolRowButton(
          onPressed: () async {
            // try {
            if (isWhitsleOn) {
              await player.stop();
            } else {
              VolumeController().setVolume(1);
              await player.setVolume(1);
              await player.setReleaseMode(ReleaseMode.loop);
              await player.setSourceAsset("sound/alarm.wav");
              player.play(player.source!);
            }
            whistleProvider.iswhistleOn = !isWhitsleOn;
            // } on Exception catch (_) {
            //   // Handle error
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("Düdük kullanılabilir değil!")));
            // }
          },
          text: 'DÜDÜK',
          icon: isWhitsleOn ? Icons.stop_outlined : Icons.play_arrow_outlined,
          color: Colors.deepPurple,
        ),
        ToolRowButton(
          onPressed: () async {
            try {
              final isTorchAvailable = await TorchLight.isTorchAvailable();
              if (isTorchAvailable) {
                if (isLighthOn) {
                  try {
                    await TorchLight.disableTorch();
                    torchProvider.isLightOn = false;
                  } on Exception catch (_) {
                    // Handle error
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Işık kapatılamadı!")));
                  }
                } else {
                  try {
                    await TorchLight.enableTorch();
                    torchProvider.isLightOn = true;
                  } on Exception catch (_) {
                    // Handle error
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Işık açılamadı!")));
                  }
                }
              }
            } on Exception catch (_) {
              // Handle error
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Işık kullanılabilir değil!")));
            }
          },
          text: 'IŞIK',
          icon:
              isLighthOn ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          color: Colors.orangeAccent,
        )
      ],
    );
  }
}
