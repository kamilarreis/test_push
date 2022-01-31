class Failure implements Exception {}

class DatasourceResultNull extends Failure {}

class ErrorSearch extends Failure {}

class EmptyList extends Failure {}

class ErrorJsonConvert extends Failure {}