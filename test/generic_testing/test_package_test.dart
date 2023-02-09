import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late HttpServer? server;
  late Uri? url;

  // The setUp() callback will run before every test in a group or test suite
  setUp(() async {
    server = await HttpServer.bind('localhost', 2023);
    url = Uri.parse('http://${server!.address.host}:${server!.port}');
  });

  // tearDown() will run even if a test fails, to ensure that it has a chance to clean up after itself
  tearDown(() async {
    await server?.close(force: true);
    server = null;
    url = null;
  });

  // Tests can be grouped together using the group() function.
  group('String methods', () {
    // Tests are specified using the top-level test() function
    test(
      'String.split() splits the string on the delimiter',
      () {
        var aString = 'Dumelang,Hola,Sawubona';
        // Test assertions are made using expect()
        expect(aString.split(','), equals(['Dumelang', 'Hola', 'Sawubona']));
      },
    );

    test(
      'String.trim() removes surrounding whitespace',
      () {
        var aString = '   Dumelang ';
        expect(aString.trim(), equals('Dumelang'));
      },
    );
  });

  group('int methods', () {
    test(
      '.remainder() returns the remainder of division',
      () {
        expect(11.remainder(7), equals(4));
      },
    );

    test('.toRadixString() returns a hex string', () {
      expect(31.toRadixString(2), equals('11111'));
    });
  });

  // Any matchers from the matcher package can be used with expect()
  // to do complex validations
  test('.split() splits the string on the delimiter', () {
    expect(
        'Dumelang,Hola,Sawubona',
        allOf([
          contains('Sawubona'),
          isNot(endsWith('Hola')),
          startsWith('Dumelang')
        ]));
  });

  test('.parse() fails on invalid input', () {
    expect(() => int.parse('O'), throwsFormatException);
  });

  // The completion() matcher can be used to test Futures;
  // it ensures that the test doesn't finish until the Future completes,
  // and runs a matcher against that Future's value.
  test('Future.value() returns the value',
      () => expect(Future<int>.value(30), completion(equals(30))));

  // The throwsA() matcher and the various throwsExceptionType matchers work with both synchronous callbacks and asynchronous Futures.
  // They ensure that a particular type of exception is thrown
  test('Future.error() throws the error', () {
    expect(Future.error('Oh no, an error!'), throwsA('Oh no, an error!'));
    expect(Future.error(Exception('Error occured')), throwsException);
    expect(Future.error(StateError('Bad State')), throwsStateError);
  });

  // The expectAsync() function wraps another function and has two jobs.
  // First, it asserts that the wrapped function is called a certain number of times,
  // and will cause the test to fail if it's called too often; second, it keeps the
  // test from finishing until the function is called the requisite number of times.
  test('Stream.fromIterable() emits the values in the iterable', () {
    var stream = Stream.fromIterable([2, 4, 6, 8]);

    stream.listen(
      (event) {
        expectAsync1(
            (number) => expect(
                  number,
                  inInclusiveRange(2, 8),
                ),
            count: 4);
      },
    );
  });
}
