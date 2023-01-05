import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/read_write_file/read_write_file_bloc.dart';
import '../../logging/log.dart';
import '../widgets/result_widget.dart';

class ReadWriteFile extends StatelessWidget {
  const ReadWriteFile({super.key});

  Widget _readFromFile({required String fileName, required readWriteFileBloc}) {
    return kIsWeb
        ? const Text('Web Not Available')
        : TextButton(
            onPressed: () {
              readWriteFileBloc.add(ReadFromFileEvent(fileName: fileName));
            },
            child: Text('Read from File: $fileName'),
          );
  }

  Widget _getDocsDirButton(readWriteFileBloc) {
    return kIsWeb
        ? Container()
        : TextButton(
            onPressed: () {
              readWriteFileBloc.add(GetDocumentsDirectoryEvent());
            },
            child: const Text('Get Document Directory'),
          );
  }

  Widget _getFileRefButton(String docsPath, readWriteFileBloc) {
    return kIsWeb
        ? Container()
        : TextButton(
            onPressed: () {
              readWriteFileBloc.add(GetFileRefFromDocsDirEvent(
                  documentsDirectory: docsPath,
                  fileName: 'my_counter',
                  fileExtension: 'txt'));
            },
            child: const Text('Get File Reference'),
          );
  }

  Widget _writeToFile({required String fileName, required readWriteFileBloc}) {
    return TextButton(
      onPressed: () async {
        readWriteFileBloc.add(WriteToFileEvent(
            fileName: fileName,
            stringToWrite: DateTime.now().toIso8601String()));
      },
      child: Text('Write to File: $fileName'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final readWriteFileBloc = context.read<ReadWriteFileBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Write BloC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Read Write File'),
          BlocConsumer<ReadWriteFileBloc, ReadWriteFileState>(
            builder: (context, state) {
              /* if (state is ReadWriteFileInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }*/
              if (state is ErrorGetDocsDirState) {
                return ResultWidget(
                    textToDisplay: state.errorMessage,
                    sibling: _getDocsDirButton(readWriteFileBloc));
              }

              if (state is HomeSuccessfulGetDocsDirState) {
                return ResultWidget(
                    textToDisplay: state.path,
                    sibling: _getFileRefButton(state.path, readWriteFileBloc));
              }

              if (state is SuccessCreateFileInDocsDirState) {
                return ResultWidget(
                    textToDisplay: state.fileName,
                    sibling: _writeToFile(
                        fileName: 'tuesday.txt',
                        readWriteFileBloc: readWriteFileBloc));
              }

              if (state is SuccessWriteDataToFile) {
                return ResultWidget(
                    textToDisplay: 'File Updated',
                    sibling: _readFromFile(
                        fileName: 'my_counter.txt',
                        readWriteFileBloc: readWriteFileBloc));
              }

              if (state is SuccessReadFromFile) {
                return ResultWidget(
                  textToDisplay: state.contents,
                );
              }

              if (state is ErrorCreateFileInDocsDirState) {
                return ResultWidget(textToDisplay: state.errorMessage);
              }

              if (state is ErrorReadFromFile) {
                return ResultWidget(textToDisplay: state.errorMessage);
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _getDocsDirButton(readWriteFileBloc),
                  _readFromFile(
                      fileName: 'my_counter.txt',
                      readWriteFileBloc: readWriteFileBloc),
                  TextButton(
                      onPressed: () async {
                        /*    await Log.i(
                              'New Logging!',
                              className: 'main.dart',
                              methodName: 'onPressed Write Log To File',
                            );
                            await Log.d(
                              '14 December!',
                            );
                            await Log.e('Week 3!',
                                overrideExisting: false,
                                className: 'HomeSreen',
                                methodName: 'onPressed',
                                exception: const FormatException());
                            await Log.w('Speak up!', false);
                            await Log.v('This is a log message!'); */
                        await Log.v('Verbose');
                        await Log.i('Info');
                        await Log.d('Debug');
                        await Log.e('Error');
                        await Log.w('Warn');
                        await Log.f('Fatal');
                      },
                      child: const Text('Write Log To File'))
                ],
              );
            },
            listener: (context, state) {},
          ),
        ],
      ),
    );
  }
}
