package platforms;

class Purpur implements IPlaftform {
    
    public function new() {
        
    }

	public function getDownloadLink(project:String, version:String, build:String):String {
        return "https://api.purpurmc.org/v2/purpur/" + version + "/" + build + "/download";
	}

	public function getJarName(project:String, version:String, build:String):String {
        return "purpur-" + version + "-" + build + ".jar";
	}

	public function getLatestBuild(project:String, version:String):String {
        return "latest";
	}

	public function getJarHash(project:String, version:String, build:String):String {
		throw new haxe.exceptions.NotImplementedException();
	}
}