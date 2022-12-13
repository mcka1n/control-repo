plan solarch::pdbq(
){
  $query_results = puppetdb_query("nodes[]{}")
  out::message("Hello world from PDBQ, query results: ${query_results}")
}
