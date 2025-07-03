import 'package:flutter/material.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_color.dart';
import 'package:one_two_three_ddaeng_fe/utils/custom_text.dart';

class GameDescriptionView extends StatefulWidget {
  final String title;
  final String subTitle;
  final List<String> ruleList;
  final List<String> gameDescriptionList;
  final List<String> moreEnjoyList;
  const GameDescriptionView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.ruleList,
    required this.gameDescriptionList,
    required this.moreEnjoyList,
  });

  @override
  State<GameDescriptionView> createState() => _GameDescriptionViewState();
}

class _GameDescriptionViewState extends State<GameDescriptionView> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: orientation == Orientation.portrait ? 50 : 20,
                  ),
                  Text(
                    '게임 설명',
                    style: customTextStyle(
                      fontSize: 36,
                      color: CustomColor.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: orientation == Orientation.portrait ? 40 : 10,
                  ),
                  orientation == Orientation.portrait
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                widget.title,
                                style: customTextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                widget.subTitle,
                                style: customTextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title,
                              style: customTextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              widget.subTitle,
                              style: customTextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      width: 1,
                      color: CustomColor.greyColor2,
                    ),
                  ),
                  child: Scrollbar(
                    thickness: 1,
                    interactive: true,
                    scrollbarOrientation: ScrollbarOrientation.right,
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '★Rule★',
                            style: customTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            widget.ruleList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                widget.ruleList[index],
                                style: customTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '★게임 설명★',
                            style: customTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            widget.gameDescriptionList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                '${index + 1}. ${widget.gameDescriptionList[index]}',
                                style: customTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '★★★게임 더욱 즐기는 법★★★',
                            style: customTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            widget.moreEnjoyList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                '${index + 1}. ${widget.moreEnjoyList[index]}',
                                style: customTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(78, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    '알겠어요!',
                    style: customTextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                )
              ],
            ),
            SizedBox(
              height: orientation == Orientation.portrait ? 40 : 20,
            )
          ],
        ),
      ),
    );
  }
}
