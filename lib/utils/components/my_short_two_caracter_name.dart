String shortTwoCaracterName(String fullName) {
  List<String> nameSplit = fullName.split(" ");
  String initials = "";

  for (var name in nameSplit) {
    initials += name[0];
    if (initials.length == 2) {
      break;
    }
  }

  return initials;
}
