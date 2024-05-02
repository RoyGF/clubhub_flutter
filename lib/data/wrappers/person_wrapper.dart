import 'package:clubhub/core/base/base_wrapper.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/data/remote/models/person_model.dart';

class PersonWraper implements BaseWrapper<PersonModel, Person> {
  @override
  Person transform(PersonModel input) {
    return Person(
      name: "John Doe", //TODO implement this
    );
  }
}
