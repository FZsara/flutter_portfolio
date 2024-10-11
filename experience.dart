import 'package:flutter/material.dart';

class QualificationTimeline extends StatefulWidget {
  const QualificationTimeline({super.key});

  @override
  State<QualificationTimeline> createState() => _QualificationTimelineState();
}

class _QualificationTimelineState extends State<QualificationTimeline> {
  bool isEducationButton = true;
  List<Education> educationList = [];
  List<Experience> experienceList = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Sample data for demonstration
    educationList = [
      Education('Agrabad Balika Bidyalay', 'SSC', 'Science', '2015 - 2017'),
      Education('Agrabad Mohila College', 'HSC', 'Science', '2017 - 2019'),
      Education(
          'International Islamic University of Chittagong',
          'Computer Science & Engineering',
          'Bachelor of Engineering',
          '2020 - present')
    ];
    experienceList = [
      Experience('Requin BD', 'Web Developer', 'July 2024 - Aug 2024'),
      Experience('Requin BD', 'Content Writer', 'Oct 2020 - Jan 2023'),
      Experience('UY Lab', 'Graphic Designer', 'Jan 2022 - Jan 2023'),
      Experience(
          'Teaching Assistant',
          'International Islamic University of Chittagong',
          'Jan 2024 - June 2024'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var isMobile = screenSize.width < 600;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align title and navbar
          children: [
            const Text(
              'Qualifications',
              style: TextStyle(
                color: Colors.redAccent,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20), // Add space between title and navbar
            Expanded(
              child: Align(
                alignment: Alignment.centerRight, // Align navbar to the right
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _navButton(context, 'Home', '/'),
                      _navButton(context, 'About me', '/personal_info'),
                      _navButton(context, 'Skills', '/skills'),
                      _navButton(context, 'Projects', '/projects'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerWidget(title: 'Qualification', subtitle: 'My journey'),
              const SizedBox(height: 20),
              textButtonWidget(),
              isEducationButton
                  ? qualificationListWidget(
                      listDatum: educationList,
                      stepperLength: isMobile ? 40 : 60)
                  : experienceListWidget(
                      listDatum: experienceList,
                      stepperLength: isMobile ? 40 : 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget({required String title, required String subtitle}) {
    var isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        Text(title,
            style: TextStyle(
                fontSize: isMobile ? 20 : 24, fontWeight: FontWeight.bold)),
        Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget textButtonWidget() {
    var isMobile = MediaQuery.of(context).size.width < 600;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttonWidget(
          iconData: Icons.school_rounded,
          titleHeader: 'Education',
          color: isEducationButton ? Colors.orange : Colors.grey,
          onPressed: () {
            setState(() {
              isEducationButton = true;
            });
          },
        ),
        SizedBox(width: isMobile ? 10 : 20),
        buttonWidget(
          iconData: Icons.work_rounded,
          titleHeader: 'Work',
          color: !isEducationButton ? Colors.orange : Colors.grey,
          onPressed: () {
            setState(() {
              isEducationButton = false;
            });
          },
        ),
      ],
    );
  }

  Widget buttonWidget({
    required IconData iconData,
    required String titleHeader,
    required Color? color,
    required void Function()? onPressed,
  }) {
    var isMobile = MediaQuery.of(context).size.width < 600;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 6.0 : 8.0,
          horizontal: isMobile ? 12.0 : 16.0,
        ),
        backgroundColor: Colors.black,
      ),
      child: Row(
        children: [
          Icon(iconData, color: color),
          SizedBox(width: isMobile ? 6 : 8),
          Text(
            titleHeader,
            style: TextStyle(color: color, fontSize: isMobile ? 14 : 16),
          ),
        ],
      ),
    );
  }

  Widget qualificationListWidget({
    required List<Education> listDatum,
    required double stepperLength,
  }) {
    var isMobile = MediaQuery.of(context).size.width < 600;
    return Center(
      child: SizedBox(
        width: isMobile ? double.infinity : 600,
        child: ListView.builder(
          itemCount: listDatum.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          itemBuilder: (context, index) {
            final data = listDatum[index];
            return listViewWidget(
              title: data.collegeName,
              subTitle: data.degree,
              subTitle1: data.course,
              durationPeriod: data.duration,
              stepperLength: stepperLength,
              currentIndex: index,
              currentLength: listDatum.length,
            );
          },
        ),
      ),
    );
  }

  Widget experienceListWidget({
    required List<Experience> listDatum,
    required double stepperLength,
  }) {
    var isMobile = MediaQuery.of(context).size.width < 600;
    return Center(
      child: SizedBox(
        width: isMobile ? double.infinity : 600,
        child: ListView.builder(
          itemCount: listDatum.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          itemBuilder: (context, index) {
            final data = listDatum[index];
            return listViewWidget(
              title: data.companyName,
              subTitle: data.position,
              durationPeriod: data.duration,
              stepperLength: stepperLength,
              currentIndex: index,
              currentLength: listDatum.length,
            );
          },
        ),
      ),
    );
  }

  Widget listViewWidget({
    required String title,
    required String subTitle,
    String subTitle1 = '',
    String durationPeriod = '',
    required double stepperLength,
    int? currentIndex,
    int? currentLength,
  }) {
    var isMobile = MediaQuery.of(context).size.width < 600;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold)),
                Text(subTitle, style: const TextStyle(color: Colors.white70)),
                if (subTitle1.isNotEmpty)
                  Text(subTitle1,
                      style: const TextStyle(color: Colors.white38)),
                if (durationPeriod.isNotEmpty)
                  Text(durationPeriod,
                      style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
          SizedBox(width: isMobile ? 2 : 4),
          Column(
            children: [
              const Icon(Icons.circle_rounded, color: Colors.orange),
              SizedBox(
                width: 2,
                height: stepperLength,
                child:
                    const VerticalDivider(color: Colors.orange, thickness: 2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        title,
        style: const TextStyle(color: Colors.orangeAccent, fontSize: 16),
      ),
    );
  }
}

// Define education and experience model classes
class Education {
  final String collegeName;
  final String course;
  final String degree;
  final String duration;

  Education(this.collegeName, this.course, this.degree, this.duration);
}

class Experience {
  final String companyName;
  final String position;
  final String duration;

  Experience(this.companyName, this.position, this.duration);
}
