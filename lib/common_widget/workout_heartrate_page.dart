import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final flutterReactiveBle = FlutterReactiveBle();

  final Uuid heartRateService = Uuid.parse("0000180D-0000-1000-8000-00805f9b34fb");
  final Uuid heartRateCharacteristic = Uuid.parse("00002A37-0000-1000-8000-00805f9b34fb");

  DiscoveredDevice? strapDevice;
  late QualifiedCharacteristic hrCharacteristic;

  bool connected = false;
  bool workoutStarted = false;

  int lastBpm = 0;
  List<int> bpmHistory = [];

  @override
  void initState() {
    super.initState();
    scanForStrap();
  }

  void scanForStrap() {
    flutterReactiveBle.scanForDevices(withServices: [heartRateService]).listen((device) {
      if (device.name.contains("MoveWithHer Strap")) {
        strapDevice = device;
        connectToStrap();
      }
    });
  }

  void connectToStrap() async {
    if (strapDevice == null) return;

    flutterReactiveBle.connectToDevice(id: strapDevice!.id).listen((connectionState) {
      if (connectionState.connectionState == DeviceConnectionState.connected) {
        setState(() => connected = true);

        hrCharacteristic = QualifiedCharacteristic(
          serviceId: heartRateService,
          characteristicId: heartRateCharacteristic,
          deviceId: strapDevice!.id,
        );

        subscribeHeartRate();
      } else {
        setState(() => connected = false);
      }
    });
  }

  void subscribeHeartRate() {
    flutterReactiveBle.subscribeToCharacteristic(hrCharacteristic).listen((data) {
      if (!workoutStarted) return; // hanya update BPM saat workout
      if (data.isNotEmpty) {
        int bpm = data[1];
        setState(() {
          lastBpm = bpm;
          bpmHistory.add(bpm);
        });
      }
    });
  }

  double getAverageBpm() {
    if (bpmHistory.isEmpty) return 0;
    return bpmHistory.reduce((a, b) => a + b) / bpmHistory.length;
  }

  void startWorkout() {
    setState(() {
      workoutStarted = true;
      bpmHistory.clear();
    });
  }

  void stopWorkout() async {
    setState(() {
      workoutStarted = false;
    });

    double avgBpm = getAverageBpm();

    // Simpan rata-rata BPM ke SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('lastWorkoutAvgBpm', avgBpm);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Workout selesai! Rata-rata BPM: ${avgBpm.toStringAsFixed(1)}")),
    );
  }

  Future<double> getLastWorkoutAvgBpm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('lastWorkoutAvgBpm') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MoveWithHer Workout")),
      body: Center(
        child: connected
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(workoutStarted ? "❤️ BPM Real-time" : "💤 Workout Belum Dimulai",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Text("$lastBpm",
                      style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: workoutStarted ? Colors.red : Colors.grey)),
                  SizedBox(height: 40),
                  Text("Average BPM: ${getAverageBpm().toStringAsFixed(1)}",
                      style: TextStyle(fontSize: 20)),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: workoutStarted ? null : startWorkout,
                        child: const Text("Start Workout"),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: workoutStarted ? stopWorkout : null,
                        child: const Text("Stop Workout"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  FutureBuilder<double>(
                    future: getLastWorkoutAvgBpm(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return Container();
                      return Text("BPM Workout Terakhir: ${snapshot.data!.toStringAsFixed(1)}",
                          style: TextStyle(fontSize: 16, color: Colors.blueGrey));
                    },
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text("🔍 Mencari MoveWithHer Strap..."),
                ],
              ),
      ),
    );
  }
}
