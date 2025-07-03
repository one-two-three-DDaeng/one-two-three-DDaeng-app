import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_rotate_game/movie_quotes_blank_rotate_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/widget/progress_widget.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';
import 'package:provider/provider.dart';

class MovieQuotesBlankRotateGameView extends StatelessWidget {
  const MovieQuotesBlankRotateGameView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieQuotesBlankRotateGameViewModel>();

    return WillPopScope(
      onWillPop: () => viewModel.clickBack(context),
      child: Scaffold(
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
        body: viewModel.step == 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      '문제 갯수를 설정해주세요',
                      style: customTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: viewModel.clickMinus,
                        child: const Icon(
                          CupertinoIcons.minus,
                          size: 60,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          viewModel.quizCount.toString(),
                          style: customTextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () => viewModel.clickPlus(context),
                        child: const Icon(
                          CupertinoIcons.plus,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 36,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50),
                      ),
                      onPressed: () => viewModel.clickStart(context),
                      child: const Text(
                        '시작하기',
                      ),
                    ),
                  ),
                ],
              )
            : viewModel.isProgress
                ? progressWidget()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '남은 문제 개수: ${viewModel.leftQuiz}개',
                              style: customTextStyle(),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              '열 수 있는 칸: ${viewModel.maxOpenCount - viewModel.openIndex.length}칸',
                              style: customTextStyle(),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Center(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 4,
                              spacing: 4,
                              alignment: WrapAlignment.center,
                              children: [
                                ...List.generate(
                                  viewModel.quiz.length,
                                  (index) => GestureDetector(
                                    onTap: () {},
                                    child: FlipCard(
                                      side: CardSide.BACK,
                                      flipOnTouch: viewModel.openIndex.contains(index) ||
                                              viewModel.openIndex.length >= viewModel.maxOpenCount ||
                                              viewModel.disableClickIndex.contains(index)
                                          ? false
                                          : true,
                                      onFlip: () => viewModel.clickBox(index),
                                      direction: FlipDirection.HORIZONTAL,
                                      front: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.black,
                                          ),
                                          color: viewModel.disableClickIndex.contains(index) ? CustomColor.backgroundColor : Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          viewModel.quiz[index],
                                          style: customTextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      back: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.black,
                                          ),
                                          color: viewModel.disableClickIndex.contains(index) ? CustomColor.backgroundColor : Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '',
                                          style: customTextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50),
                          ),
                          onPressed: () => viewModel.clickViewAnswer(context),
                          child: const Text('정답보기'),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
