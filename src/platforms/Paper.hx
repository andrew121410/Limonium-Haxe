package platforms;

import haxe.Json;
import sys.Http;

class Paper implements IPlaftform {
    
    public function new() {
        
    }

	public function getDownloadLink(project:String, version:String, build:String):String {
        var jarName = getJarName(project, version, build);

        return "https://api.papermc.io/v2/projects/" + project + "/versions/" + version + "/builds/" + build + "/downloads/" + jarName;
	}

	public function getJarName(project:String, version:String, build:String):String {
		return project + "-" + version + "-" + build + ".jar";
	}

	public function getLatestBuild(project:String, version:String):String {
        var theUrl:String = "https://api.papermc.io/v2/projects/" + project + "/versions/" + version;

        var raw:String = Http.requestUrl(theUrl);
        var json:BuildsInfo = Json.parse(raw);

        json.builds.reverse();

        return json.builds[0] + "";
	}

	public function getJarHash(project:String, version:String, build:String):String {
		throw new haxe.exceptions.NotImplementedException();
	}
}

typedef BuildsInfo = {
    var builds:Array<Int>;
} 