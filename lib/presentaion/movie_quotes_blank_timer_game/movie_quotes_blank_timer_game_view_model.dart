import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_two_three_ddaeng_fe/domain/model/count_model.dart';
import 'package:one_two_three_ddaeng_fe/domain/model/movie_line_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/dialog/title_content_one_button_dialog.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/dialog/title_content_two_button_dialog.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_game_result/movie_quotes_blank_game_result_view.dart';

class MovieQuotesBlankTimerGameViewModel extends ChangeNotifier {
  int _step = 1;
  int get step => _step;

  int _quizCount = 5;
  int get quizCount => _quizCount;

  int _leftTime = 0;
  int get leftTime => _leftTime;

  int get leftQuiz => _quizCount - _oCount - _xCount;

  int _oCount = 0;
  int _xCount = 0;

  final List<String> _quiz = [];
  List<String> get quiz => _quiz;

  final List<int> _hintIndex = [];
  List<int> get hintIndex => _hintIndex;

  final List<int> _randomIndex = [];
  List<int> get randomIndex => _randomIndex;

  final List<int> _alreadyQuiz = [];

  String _movieName = '';
  String get movieName => _movieName;

  bool _isProgress = false;
  bool get isProgress => _isProgress;

  Timer? timer;

  Future<bool> clickBack(BuildContext context) async {
    if (step == 1) {
      return true;
    } else {
      var result = await titleContentTwoButtonDialog(
        context: context,
        content: '정말로 게임에서 나가시겠습니까?',
        buttonText1: '취소',
        buttonText2: '확인',
      );
      if (result != null) {
        if (result) {
          if (_isProgress = false) {
            timer?.cancel();
          }
          return true;
        }
      }
      return false;
    }
  }

  void clickMinus() {
    if (_quizCount == 1) {
      return;
    }
    _quizCount--;
    notifyListeners();
  }

  void clickPlus(BuildContext context) async {
    if (_quizCount == 10) {
      await titleContentOneButtonDialog(
        context: context,
        content: '문제 개수는 최대 10개입니다',
        buttonText: '확인',
      );
      return;
    }
    _quizCount++;
    notifyListeners();
  }

  void clickStart(BuildContext context) {
    _step = 2;
    getMovie(context);
  }

  void getMovie(BuildContext context) async {
    _isProgress = true;
    notifyListeners();
    _movieName = '';
    _quiz.clear();
    _randomIndex.clear();
    _hintIndex.clear();
    _leftTime = 30;

    var result = await getMovieCount();

    var countModel = CountModel.fromJson(jsonDecode(result));

    int number = Random().nextInt(countModel.data[0].count);

    if (_alreadyQuiz.contains(number)) {
      if (context.mounted) {
        getMovie(context);
        return;
      }
    } else {
      _alreadyQuiz.add(number);
    }

    var result2 = await getMovieLineContent(number.toString());

    var movieModel = MovieLineModel.fromJson(jsonDecode(result2));

    _movieName = movieModel.data[0].movieName;
    _quiz.addAll(movieModel.data[0].line.split(''));

    for (int i = 0; i < _quiz.length; i++) {
      if (_quiz[i] != '!' && _quiz[i] != ',' && _quiz[i] != '?' && _quiz[i] != '√' && _quiz[i] != '.') {
        _randomIndex.add(i);
      }
    }

    _randomIndex.shuffle();

    _hintIndex.addAll(_randomIndex.sublist(0, (_randomIndex.length / 10).round()));

    _isProgress = false;

    if (context.mounted) {
      startTimer(context);
    }
  }

  void startTimer(BuildContext context) async {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_leftTime > 0) {
        _leftTime -= 1;
        if (_leftTime == 20) {
          _hintIndex.clear();
          _hintIndex.addAll(_randomIndex.sublist(0, (_randomIndex.length * 2 / 10).round()));
        } else if (_leftTime == 15) {
          _hintIndex.clear();
          _hintIndex.addAll(_randomIndex.sublist(0, (_randomIndex.length * 3 / 10).round()));
        }
        notifyListeners();
      } else {
        clickViewAnswer(context);
      }
    });
  }

  void clickViewAnswer(BuildContext context) async {
    timer?.cancel();
    String answer = '';

    for (int i = 0; i < _quiz.length; i++) {
      answer += _quiz[i] == '√' ? ' ' : _quiz[i];
    }

    var result = await titleContentTwoButtonDialog(
      context: context,
      content: answer,
      buttonText1: '오답',
      buttonText2: '정답',
    );

    if (result == null) {
      if (_leftTime == 0) {
        return;
      } else {
        if (context.mounted) {
          startTimer(context);
        }
      }
    } else {
      if (result) {
        _oCount++;
      } else {
        _xCount++;
      }
      if (leftQuiz != 0) {
        if (context.mounted) {
          getMovie(context);
        }
      } else {
        if (context.mounted) {
          goResultPage(context);
        }
      }
    }
  }

  void goResultPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MovieQuotesBlankGameResultView(
          timer: true,
          oCount: _oCount,
          xCount: _xCount,
        ),
      ),
    );
  }

  Future<dynamic> getMovieCount() async {
    try {
      final response = await http.get(Uri.parse('http://54.180.81.222/api/movie/line/count'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.statusCode);
      }
    } on TimeoutException catch (_) {
      print('탐아웃');
    } catch (e) {
      print('네트워크에러');
    }
  }

  Future<dynamic> getMovieLineContent(String lineSeq) async {
    try {
      final response = await http.get(Uri.parse('http://54.180.81.222/api/movie/line/$lineSeq'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.statusCode);
      }
    } on TimeoutException catch (_) {
      print('탐아웃');
    } catch (e) {
      print('네트워크에러');
    }
  }
}
