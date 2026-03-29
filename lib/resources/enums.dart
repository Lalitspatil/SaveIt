
enum HttpStatusCode { success, error, warning }


const poppins = 'Poppins';


enum HttpMethod {
  GET,
  POST,
  POSTFORM,
  PUT,
  DELETE;

  String get value => name;
}
