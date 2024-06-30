class MyLink {
  static const String _baseLink = 'http://10.0.2.2:8012/instagramclonebend';
  static const String profileScreen = "$_baseLink/profilepage.php";
  static const String profileScreenother = "$_baseLink/otherprofilepage.php";
  static const String mainScreen = "$_baseLink/mainpage.php";
  //Auth
  static const String login = "$_baseLink/auth/login.php";
  static const String signup = "$_baseLink/auth/signup.php";
  //--
  static const String addPost = "$_baseLink/post_image/add.php";
  static const String searchPage = "$_baseLink/search.php";
  static const String imagesLink = "$_baseLink/images/";
  //-----follow
  static const String followAdd = "$_baseLink/follow/add.php";
  static const String followRemove = "$_baseLink/follow/remove.php";
  //-----like
  static const String likeTry = "$_baseLink/like/add.php";
  //--profile pic
  static const String profilePicAdd = "$_baseLink/profilepic/changepic.php";
  static const String profilePicDelete = "$_baseLink/profilepic/delete.php";
  //===comment
  static const String commentAdd = "$_baseLink/comment/add.php";
  static const String commentView = "$_baseLink/comment/view.php";
}
