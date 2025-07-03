import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/widget/progress_widget.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';
import 'package:provider/provider.dart';

class MovieQuotesBlankTimerGameView extends StatefulWidget {
  const MovieQuotesBlankTimerGameView({super.key});

  @override
  State<MovieQuotesBlankTimerGameView> createState() => _MovieQuotesBlankTimerGameViewState();
}

class _MovieQuotesBlankTimerGameViewState extends State<MovieQuotesBlankTimerGameView> {
  late dynamic model;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model = Provider.of<MovieQuotesBlankTimerGameViewModel>(context, listen: false);
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      model.timer?.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final viewModel = context.watch<MovieQuotesBlankTimerGameViewModel>();

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
                      Stack(
                        children: [
                          Positioned(
                            left: 170,
                            right: 170,
                            child: Container(
                              alignment: Alignment.center,
                              width: 10,
                              height: 30,
                              child: Text(
                                viewModel.leftTime.toString(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: viewModel.leftTime / 30 * width,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: CustomColor.redColor.withOpacity(.3),
                                ),
                              ),
                              SizedBox(
                                width: 360 - viewModel.leftTime / 30 * 360,
                                height: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          '남은 문제 개수: ${viewModel.leftQuiz}',
                          style: customTextStyle(),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Wrap(
                              //   crossAxisAlignment: WrapCrossAlignment.center,
                              //   runSpacing: 4.w,
                              //   spacing: 4.w,
                              //   alignment: WrapAlignment.center,
                              //   children: [
                              //     ...List.generate(
                              //       viewModel.quiz.length,
                              //       (index) => Container(
                              //         width: 36.w,
                              //         height: 36.w,
                              //         decoration: const BoxDecoration(
                              //           border: Border(
                              //             bottom: BorderSide(
                              //               width: 3,
                              //               color: Colors.black,
                              //             ),
                              //           ),
                              //         ),
                              //         alignment: Alignment.center,
                              //         child: Text(
                              //           viewModel.hintIndex.contains(index) ||
                              //                   viewModel.quiz[index] == '!' ||
                              //                   viewModel.quiz[index] == ',' ||
                              //                   viewModel.quiz[index] == '?' ||
                              //                   viewModel.quiz[index] == '√'
                              //               ? viewModel.quiz[index]
                              //               : '',
                              //           style: customTextStyle(
                              //             fontSize: 20,
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runSpacing: 4,
                                spacing: 4,
                                alignment: WrapAlignment.center,
                                children: [
                                  ...List.generate(
                                    viewModel.quiz.length,
                                    (index) => viewModel.quiz[index] == '!' ||
                                            viewModel.quiz[index] == ',' ||
                                            viewModel.quiz[index] == '?' ||
                                            viewModel.quiz[index] == '√' ||
                                            viewModel.quiz[index] == '.'
                                        ? Text(
                                            viewModel.quiz[index] == '√' ? '  ' : viewModel.quiz[index],
                                            style: customTextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : Container(
                                            width: 36,
                                            height: 36,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  width: 3,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              viewModel.hintIndex.contains(index) ? viewModel.quiz[index] : '',
                                              style: customTextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              viewModel.leftTime <= 10
                                  ? Center(
                                      child: Text(
                                        '[${viewModel.movieName}]',
                                        style: customTextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
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
