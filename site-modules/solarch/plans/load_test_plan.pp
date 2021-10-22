plan solarch::load_test_plan (
  String $message,
) {
  out::message("Running solarch::load_test_plan, message: ${message}")
  out::message('|_ 1st 30 sec sleep')
  ctrl::sleep(30)
  out::message('|_ 2nd 30 sec sleep')
  ctrl::sleep(30)
  out::message('|_ 3rd 30 sec sleep')
  ctrl::sleep(30)
}
