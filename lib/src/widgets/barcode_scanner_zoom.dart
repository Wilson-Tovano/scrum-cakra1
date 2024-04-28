import 'package:cakra_asset_management/src/widgets/scanner/scanned_barcode_label.dart';
import 'package:cakra_asset_management/src/widgets/scanner/scanner_button_widget.dart';
import 'package:cakra_asset_management/src/widgets/scanner/scanner_error_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerZoom extends StatefulWidget {
  const BarcodeScannerZoom({super.key});

  @override
  State<BarcodeScannerZoom> createState() => _BarcodeScannerZoomState();
}

class _BarcodeScannerZoomState extends State<BarcodeScannerZoom> {
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
  );

  double _zoomFactor = 0.0;

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  Widget _buildZoomScaleSlider() {
    return ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, state, child) {
          if (!state.isInitialized || !state.isRunning) {
            return const SizedBox.shrink();
          }

          final TextStyle labelStyle =
              Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                  );
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  '0%',
                  overflow: TextOverflow.fade,
                  style: labelStyle,
                ),
                Expanded(
                  child: Slider(
                    value: _zoomFactor,
                    onChanged: (value) {
                      setState(() {
                        _zoomFactor = value;
                        controller.setZoomScale(value);
                      });
                    },
                  ),
                ),
                Text(
                  '100%',
                  overflow: TextOverflow.fade,
                  style: labelStyle,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')), 
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            fit: BoxFit.contain,
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Column(
                children: [
                  if (!kIsWeb) _buildZoomScaleSlider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ToggleFlashlightButton(controller: controller),
                      StartStopMobileScannerButton(controller: controller),
                      Expanded(
                        child: Center(
                          child: ScannedBarcodeLabel(
                            barcodes: controller.barcodes,
                          ),
                        ),
                      ),
                      SwitchCameraButton(controller: controller),
                      AnalyzeImageFromGalleryButton(controller: controller),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}
