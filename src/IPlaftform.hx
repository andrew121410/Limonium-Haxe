interface IPlaftform {
    public function getDownloadLink(project:String, version:String, build:String):String;
    public function getJarName(project:String, version:String, build:String):String;
    public function getLatestBuild(project:String, version:String):String;
    public function getJarHash(project:String, version:String, build:String):String;
}