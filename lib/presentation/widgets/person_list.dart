import 'package:clubhub/core/design/dimens.dart';
import 'package:clubhub/presentation/widgets/person_card.dart';
import 'package:flutter/material.dart';
import 'package:clubhub/data/local/models/person.dart';

class PersonList extends StatelessWidget {
  const PersonList({
    super.key,
    required this.personList,
  });

  final List<Person> personList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(Dimens.space12),
      physics: const BouncingScrollPhysics(),
      itemCount: personList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Dimens.space12,
        mainAxisSpacing: Dimens.space12,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final person = personList[index];
        return PersonCard(person: person);
      },
    );
  }
}
