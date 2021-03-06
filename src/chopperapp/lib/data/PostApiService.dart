import 'package:chopper/chopper.dart';

import 'MobileDataInterceptor.dart';

part 'PostApiService.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response> getPosts();

  @Get(path: "/{id}")
  Future<Response> getPost(@Path("id") int id);

  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: "https://jsonplaceholder.typicode.com",
      services: [
        _$PostApiService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'cache-control':'no-cache'}),
        //HttpLoggingInterceptor(),
        CurlInterceptor(),
        (Request request) async {
          if(request.method==HttpMethod.Post){
            chopperLogger.info("Post Request");
          }
          return request;
        },
        MobileDataInterceptor()
      ],
    );

    return _$PostApiService(client);
  }
}
