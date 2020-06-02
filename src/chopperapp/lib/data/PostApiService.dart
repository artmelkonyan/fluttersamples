import 'package:chopper/chopper.dart';

part 'PostApiService.chopper.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts')
abstract class PostApiServie extends ChopperService {
  
  @Get()
  Future<Response> getPosts();

  @Get(path: "/{id}")
  Future<Response> getPost(@Path("id")int id);

  @Post()
  Future<Response> postPost(
    @Body() Map<String,dynamic> body,
  );

  
}