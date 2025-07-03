import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_rotate_game/movie_quotes_blank_rotate_game_view.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_rotate_game/movie_quotes_blank_rotate_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';
import 'package:provider/provider.dart';

class MovieQuotesBlankGameResultView extends StatelessWidget {
  final bool timer;
  final int oCount;
  final int xCount;
  const MovieQuotesBlankGameResultView({
    super.key,
    required this.timer,
    required this.oCount,
    required this.xCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '하나둘셋 땡!',
          style: customTextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            '결과 확인',
            style: customTextStyle(),
          ),
          Expanded(
            child: Center(
              child: Container(
                child: Lottie.asset(
                  'assets/lottie/trophy.json',
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '총점',
                    style: customTextStyle(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${(oCount / (oCount + xCount) * 100).round()}점',
                    style: customTextStyle(),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Text(
                    '맞은 개수',
                    style: customTextStyle(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$oCount개',
                    style: customTextStyle(),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Text(
                    '틀린 개수',
                    style: customTextStyle(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$xCount개',
                    style: customTextStyle(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      '다시하기',
                      style: customTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      timer
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (_) => MovieQuotesBlankTimerGameViewModel(),
                                  child: const MovieQuotesBlankTimerGameView(),
                                ),
                              ),
                            )
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                  create: (_) => MovieQuotesBlankRotateGameViewModel(),
                                  child: const MovieQuotesBlankRotateGameView(),
                                ),
                              ),
                            );
                    },
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      '홈으로',
                      style: customTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
