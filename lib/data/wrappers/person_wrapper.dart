import 'package:clubhub/core/base/base_wrapper.dart';
import 'package:clubhub/data/local/models/person.dart';
import 'package:clubhub/data/remote/models/person_model.dart';

class PersonWraper implements BaseWrapper<PersonModel, Person> {
  @override
  Person transform(PersonModel input) {
    return Person(
      id: input.login?.uuid ?? '',
      name: input.name?.first ?? '',
      surname: input.name?.last ?? '',
      email: input.email ?? '',
      phone: input.phone ?? '',
      cell: input.cell ?? '',
      age: input.dob?.age ?? 0,
      imageURL: input.picture?.large ?? '',
    );
  }
}
