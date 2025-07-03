import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/game_description/game_description_view.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_rotate_game/movie_quotes_blank_rotate_game_view.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_rotate_game/movie_quotes_blank_rotate_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view.dart';
import 'package:one_two_three_ddaeng_fe/presentaion/movie_quotes_blank_timer_game/movie_quotes_blank_timer_game_view_model.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_radius.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_shadow.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';
import 'package:provider/provider.dart';

class GameListView extends StatelessWidget {
  const GameListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          double width = MediaQuery.of(context).size.width;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      '하나둘셋 땡',
                      style: customTextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: width / 2,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      '하고 싶은 게임을 선택해보세요',
                      style: customTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              gameCard(
                title: '영화 명대사 맞추기',
                description: '시간내에 명대사 빈칸을 맞춰요',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => MovieQuotesBlankTimerGameViewModel(),
                        child: const MovieQuotesBlankTimerGameView(),
                      ),
                    ),
                  );
                },
                context: context,
              ),

              const SizedBox(
                height: 20,
              ),
              gameCard(
                title: '영화 제목 맞추기',
                description: '카드를 뒤집어서 빈칸을 확인해 제목을 맞춰요',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (_) => MovieQuotesBlankRotateGameViewModel(),
                        child: const MovieQuotesBlankRotateGameView(),
                      ),
                    ),
                  );
                },
                context: context,
              ),
              const SizedBox(
                height: 40,
              ),

              // gameCard(
              //   title: '미정',
              //   onTap: () {},
              // ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 0,
              ),
              const Text(
                '하나둘셋 땡!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                '하고 싶은 게임을 선택해보세요',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.greyColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: gameCard(
                      title: '영화 명대사 맞추기',
                      description: '시간내에 명대사 빈칸을 맞춰요',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (_) => MovieQuotesBlankTimerGameViewModel(),
                              child: const MovieQuotesBlankTimerGameView(),
                            ),
                          ),
                        );
                      },
                      context: context,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: gameCard(
                      title: '영화 제목 맞추기',
                      description: '카드를 뒤집어서 빈칸을 확인해 제목을 맞춰요',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (_) => MovieQuotesBlankRotateGameViewModel(),
                              child: const MovieQuotesBlankRotateGameView(),
                            ),
                          ),
                        );
                      },
                      context: context,
                    ),
                  ),
                ],
              )
            ],
          );
        }
      }),
    );
  }

  Widget gameCard({
    required String title,
    required String description,
    required void Function() onTap,
    required BuildContext context,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: customRadius(12),
              color: Colors.white,
              boxShadow: [
                customBoxShadow(
                  blurRadius: 20,
                  offsetY: 5,
                  offsetX: 3,
                  color: CustomColor.shadowColor,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: customTextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        title == '영화 명대사 맞추기'
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameDescriptionView(
                                    title: title,
                                    subTitle: '조금씩 공개되는 명대사를 시간 내에 맞춰보세요!',
                                    ruleList: const [
                                      '문제당 주어지는 시간 안에 명대사를 맞춰야 해요.',
                                      '정답을 더 많이 맞추면 이기는 단순한 게임이에요!',
                                    ],
                                    gameDescriptionList: const [
                                      '맞출 문제의 개수를 설정할 수 있어요! (5~10개)',
                                      '처음에 명대사의 일부만 화면에 공개 된답니다!',
                                      '시간이 흐를수록 명대사의 일부가 추가로 자동 공개돼요!',
                                      "정답일 경우엔 '정답' 버튼을, 오답일 경우엔 '오답'버튼을 클릭하면 최종 결과에 반영됩니다.\n(잘 못 누르지 않도록 주의해요!)",
                                    ],
                                    moreEnjoyList: const [
                                      "'정답 보기' 버튼으로 미리 정답을 보고 자체 힌트를 제공해보세요!",
                                      '외래어 금지와 같은 룰과 함께 플레이 해보세요!',
                                      '팀 전 게임으로도 즐길 수도 있어요!',
                                    ],
                                  ),
                                ),
                              )
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameDescriptionView(
                                    title: title,
                                    subTitle: '명대사의 글자 카드를 직접 공개하고 영화 제목을 맞춰보세요!',
                                    ruleList: const [
                                      '문제당 주어지는 카드뒤집기 횟수를 잘 활용하여 명대사를 맞춰야해요. (시간제한 x)',
                                      '단, 카드뒤집기는 뒤집기가 활성화 된 글자만 가능!',
                                      '정답을 더 많이 맞추면 이기는 단순한 게임이에요!',
                                    ],
                                    gameDescriptionList: const [
                                      '맞출 문제의 개수를 설정할 수 있어요! (5~10개)',
                                      '처음엔 명대사 글자 카드가 모두 뒤집어져 있어요!',
                                      '문제당 카드 뒤집기 횟수가 주어지며, 횟수에 맞게 신중하게 글자 카드를 뒤집어 공개해 보세요!\n(글자에는 문장부호도 포함되어 있어요. ㅋ 신중하시길 바랍니다)',
                                      "횟수를 사용하여 모든 글자 카드를 뒤집었다면 정답을 맞춰보세요!",
                                      "‘정답 보기’버튼을 통해 정답을 확인하고, 정답일 경우엔 ‘정답’버튼을, 오답일 경우엔 ‘오답’버튼을 클릭하면 최종 결과에 반영됩니다!\n(잘 못 누르지 않도록 주의해요!)",
                                    ],
                                    moreEnjoyList: const [
                                      "‘정답 보기’ 버튼으로 미리 정답을 보고 자체 힌트를 제공해보세요!\n(힌트 줄 땐 주더라도 술 한 잔 먹입시다",
                                      '문장부호를 열게 되면 한 잔 마시기 규칙을 추가해보세요!',
                                    ],
                                  ),
                                ),
                              );
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 20,
                          bottom: 10,
                        ),
                        child: const Icon(
                          Icons.info_outline_rounded,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 20,
                  child: FittedBox(
                    child: Text(
                      description,
                      style: customTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.greyColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
