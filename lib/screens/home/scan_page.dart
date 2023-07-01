import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:pharmakilivre/config/constants/constants.dart';
import 'package:pharmakilivre/screens/home/dashboard_screen.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late CameraController _cameraController;
  Future<void>? _cameraInitialized;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    _cameraController = CameraController(camera, ResolutionPreset.high);
    await _cameraController.initialize();
    if (mounted) {
      setState(() {
        _cameraInitialized = Future.value();
      });
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textColor,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
        ),
      ),
      body: FutureBuilder<void>(
        future: _cameraInitialized,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _cameraInitialized;
            final image = await _cameraController.takePicture();
            // Handle the scanned image (e.g., save it)
            print('Scanned image: ${image.path}');
          } catch (e) {
            print('Error during scanning: $e');
          }
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
