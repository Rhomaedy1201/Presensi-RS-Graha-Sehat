import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/selesai_lembur_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class CameraLembur extends StatefulWidget {
  const CameraLembur({super.key});

  @override
  State<CameraLembur> createState() => _CameraLemburState();
}

class _CameraLemburState extends State<CameraLembur> {
  SelesaiLemburController selesaiLemburC = Get.find<SelesaiLemburController>();
  CameraController? _controller;
  List<CameraDescription>? cameras;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(
      cameras!.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front),
      ResolutionPreset.high,
    );
    await _controller!.initialize();
    setState(() {});
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    final image = await _controller!.takePicture();
    setState(() {
      _imageFile = image;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              text: "Camera Absen Lembur",
              color: cGrey_900,
              fontSize: 15,
              fontWeight: FontWeight.w500)),
      body: _controller == null || !_controller!.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SizedBox.expand(
                child: Column(
                  children: [
                    _imageFile == null
                        ? SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            width: Get.width,
                            child: CameraPreview(_controller!),
                          )
                        : SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            width: Get.width,
                            child: Image.file(File(_imageFile!.path)),
                          ),
                    SizedBox(
                      height: Get.height * 0.2,
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _imageFile == null
                              ? Container(
                                  width: 55,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: cBlack, width: 3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: _takePicture,
                                    icon: const Icon(Icons.camera_alt_outlined,
                                        size: 25, color: cGrey_900),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    spaceWidth(35),
                                    SizedBox(
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: cPrimary_400,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: cBlack, width: 2),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ), // Mengatur border radius menjadi 0
                                          ),
                                        ),
                                        onPressed: () {
                                          selesaiLemburC.postAbsenFOTO(
                                              Get.arguments['id'].toString(),
                                              _imageFile!.path,
                                              Get.arguments['absen'] == "Pulang"
                                                  ? "KELUAR"
                                                  : "MASUK");
                                        },
                                        child: Text(
                                          "Presensi ${Get.arguments['absen']}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: cBlack,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: cBlack, width: 3),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _imageFile = null;
                                          });
                                        },
                                        icon: const Icon(Icons.delete_forever,
                                            size: 18, color: cRed),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
