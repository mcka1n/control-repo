plan solarch::delay (
  Integer $delay = 5,
) {
  out::message("Running the local load_plan, waiting for ${delay} secs")
  ctrl::sleep($delay)
  out::message('load_plan finished waiting')
}
