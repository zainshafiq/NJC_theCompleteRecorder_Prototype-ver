




  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.center,
      child: Container(
        //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
            gradient: new LinearGradient(
              colors: [Colors.purple[800], Colors.red[800]],
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3.0, 3.0),
                blurRadius: 7.0,
                spreadRadius: 3.0,
              ),
            ]),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 7.0,
                        spreadRadius: 4.0,
                      ),
                    ]),
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () async {
                    await _onRecordButtonPressed();
                    setState(() {});
                  },
                  shape: CircleBorder(
                      //borderRadius: BorderRadius.circular(30),
                      //side: BorderSide(color: Colors.white, width: 2.0)
                      ),
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Icon(
                      _recordIcon,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                child: Text(
                  _recordText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold),
                ),
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5)
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onRecordButtonPressed() async {
    switch (_recordingState) {
      case RecordingState.Set:
        await _recordVoice();
        break;

      case RecordingState.Recording:
        await _stopRecording();
        _recordingState = RecordingState.Stopped;
        _recordIcon = Icons.mic;
        _recordText = 'Record new one';
        break;

      case RecordingState.Stopped:
        await _recordVoice();
        break;

      case RecordingState.UnSet:
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Please allow recording from settings.'),
        ));
        break;
    }
  }

  Future<void> _recordVoice() async {
    if (await FlutterAudioRecorder.hasPermissions) {
      await _initRecorder();

      await _startRecording();
      _recordingState = RecordingState.Recording;
      _recordIcon = Icons.stop;
      _recordText = 'Recording';
    } else {
      Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please allow recording from settings.'),
      ));
    }
  }

  _initRecorder() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String filePath = appDirectory.path +
        '/' +
        DateTime.now().millisecondsSinceEpoch.toString() +
        '.aac';

    audioRecorder =
        FlutterAudioRecorder(filePath, audioFormat: AudioFormat.AAC);
    await audioRecorder.initialized;
  }

  _startRecording() async {
    await audioRecorder.start();
    // await audioRecorder.current(channel: 0);
  }

  _stopRecording() async {
    await audioRecorder.stop();
    widget.onSaved();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SplashScreenRecording()));
  }
}
