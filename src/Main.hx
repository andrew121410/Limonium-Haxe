class Main {
    static function main() {
        new Main();
    }

    public function new() {
        var args = Sys.args();

        if(args.length < 2) {
            trace("\033[31mMissing args! Example of correct way -> ./program paper 1.19.2");
            Sys.println("\033[0;37m");
            Sys.exit(1);
            return;
        }

        var i = 0;
        var our_args:Map<String, String> = [];
        while (i < args.length) {
            var element:String = args[i];
            if(element == "--o" || element == "--n") {
                our_args.set(element, args[i + 1]);
                i += 2;
            }else {
                our_args.set(element, "");
                i += 1;
            }
        }

        // Handle path
        var path:String = "";
        if(our_args.exists("--o")) {
            path = our_args.get("--o");
        }
        if(our_args.exists("--n")) {
            path += our_args.get("--n");
        }

        var project:String = args[0];
        var version:String = args[1];

        var platform:IPlaftform = Utils.getPlatform(args[0]);
        var build = platform.getLatestBuild(project, version);

        if(path == "") {
            path = platform.getJarName(project, version, build);
        }

        // Download the jar
        var file:String = Utils.download(platform.getDownloadLink(project, version, build));

        // Future verify the hash?
        //..

        Utils.copyToDest(file, path);
        Sys.println("Downloaded file to " + path);
    }
  }