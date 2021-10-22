plan solarch::load_test_plan (
  String $message,
) {
  out::message("Running solarch::load_test_plan, message: ${message}")
  out::message('|_ 1st 7 min sleep')
  ctrl::sleep(420)
  out::message('|_ 2nd 7 min sleep')
  ctrl::sleep(420)
  out::message('|_ 3rd 7 min sleep')
  ctrl::sleep(420)
}
