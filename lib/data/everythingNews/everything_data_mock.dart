import 'dart:async';
import 'everything_data.dart';


class MockEverythingRepository implements EverythingNewsRepository{
  @override
  Future<List<EverythingNews>> fetch() {
    // TODO: implement fetch
    return new  Future.value(KEverything);
  }

}


const KEverything = const <EverythingNews>[
  const EverythingNews(
      title: "'Star Trek: Discovery' mini episodes arrive this fall",
      description: "CBS premiered the season two trailer for 'Star Trek: Discovery' at Comic-Con, and announced four 'Short Trek' episodes.",
      urlToImage: "https://o.aolcdn.com/images/dims?thumbnail=1200%2C630&quality=80&image_uri=https%3A%2F%2Fs.aolcdn.com%2Fhss%2Fstorage%2Fmidas%2Ffeb1013890e88952739a3ea602521209%2F206543282%2F112617_6509b.JPG&client=cbc79c14efcebee57402&signature=a558ce357474c6b4ee192c03af2fe7866033e5a5",
      url: "https://www.engadget.com/2018/07/20/star-trek-discovery-s2-trailer-short-trek/",
      publishedAt: "2018-07-21T00:32:00Z",
      author: "Richard Lawler"
  ),
  const EverythingNews(
      title: "Wearable gauges fitness through stress hormones in your sweat",
      description: "A new sensor can measure the stress hormones in your sweat, helping you track of fitness and even catch diseases.",
      urlToImage: "https://o.aolcdn.com/images/dims?thumbnail=1200%2C630&quality=80&image_uri=https%3A%2F%2Fo.aolcdn.com%2Fimages%2Fdims%3Fcrop%3D5351%252C3431%252C0%252C0%26quality%3D85%26format%3Djpg%26resize%3D1600%252C1026%26image_uri%3Dhttp%253A%252F%252Fo.aolcdn.com%252Fhss%252Fstorage%252Fmidas%252F6168935bc46369afb79bf42668dc6bf6%252F205377248%252Flady-doing-push-ups-by-the-board-walk-picture-id586121455%26client%3Da1acac3e1b3290917d92%26signature%3Dc9af7c3830e8c0ca6658dcf061a7eb6c887bcd6b&client=cbc79c14efcebee57402&signature=69ab2a72c9df3000bb722b321045fc918b231ac2",
      url: "https://www.engadget.com/2018/07/20/sensor-measures-stress-hormones-in-your-sweat/",
      publishedAt: "2018-07-20T21:13:00Z",
      author: "Jon Fingas"
  ),
  const EverythingNews(
      title: "Magic Leap’s lackluster AR demo proves hardware is still hard",
      description: "AR is way more difficult than it seems.",
      urlToImage: "https://o.aolcdn.com/images/dims?thumbnail=1200%2C630&quality=80&image_uri=https%3A%2F%2Fs.aolcdn.com%2Fhss%2Fstorage%2Fmidas%2F19a6c3944f735ebda0db19a64610eef6%2F206542700%2FMagic-Leap-One-1340x754.jpg&client=cbc79c14efcebee57402&signature=1a3e075e618d5ad606b09aaa66c931f1d6dcd00c",
      url: "https://www.engadget.com/2018/07/20/magic-leap-ar-hardware-is-hard/",
      publishedAt: "2018-07-20T19:00:00Z",
      author: "Nicole Lee"
  ),

];