import sys.FileSystem;
import haxe.io.BytesOutput;
import sys.Http;
import sys.io.File;
import uuid.*;

import platforms.*;

class Utils {

    public static function getPlatform(platform:String):IPlaftform {
        if(platform == "purpur") {
            return new Purpur();
        }else {
            return new Paper();
        }
    }

    // returns the file name
    public static function download(theUrl:String): String {
        var http = new Http(theUrl);
        var output:BytesOutput = new BytesOutput();
        http.customRequest(false, output);

        var fileName = Uuid.v4() + ".tmp";

        File.saveBytes(fileName, output.getBytes());
        return fileName;
    }

   public static function copyToDest(theFile:String, thePath:String) {
    File.copy(theFile, thePath);
    FileSystem.deleteFile(theFile);
	}
}