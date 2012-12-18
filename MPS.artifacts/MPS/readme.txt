CODE ORCHESTRA README FILE

Thank you for downloading Code Orchestra!

CONTENTS
	ActionScript/     ActionScript language files
	bin/              startup files
	Contents/         configuration directory for Mac OS X (in Mac Os X distributions only)
	core/             core languages 
	flex_sdk/         Flex SDK files
	lib/              libraries
	license/          license files
	platform/         platform languages
	plugin/           MPS plugin for IntelliJ IDEA
	plugins/          plugins for MPS
	workbench/        workbench languages
	about.txt         about software included in Code Orchestra
	build.number      file with information about current build
	rase.bat          bat-file for starting Code Orchestra on Windows (may not be present for some distributions)
	rase.sh           sh-file for starting Code Orchestra on Unix (may not be present for some distributions) 
	readme.txt        this file

SYSTEM REQUIREMENTS
    To run CodeOrchestra you need JDK 6.0.

HOW TO START
    1. Unpack the Code Orchestra distribution file to whenever you wish to install the program.
       We will refer to this destination location as your {installation home} below.
    2. a) [WINDOWS] Open console window and start rase.bat file, located in {installation home}.
    2. b) [MAC OS X] Execute Code Orchestra application.
    2. c) [UNIX] Open console window and start rase.sh file, located in {installation home}.
    3. [OPTIONAL] Add the "{installation home}" to your PATH environmental
       variable so that you may start Code Orchestra from any directory.

HOW TO ADJUST JVM OPTIONS
    1. [MAC OS X]
       If you run Code Orchestra by clicking on Code Orchestra.app folder, you should change Info.plist file,
       located in {installation home}/Contents/ folder. Open it and find a line

       <key>VMOptions</key>

       The line next to this contains JVM options between "string" tags.
       To adjust JVM heap size modify -Xms and -Xmx parameters in it.

       If you run Code Orchestra with rase.sh script, consider next section.

    2. [OTHER PLATFORMS]
       JVM options are located in {installation home}/bin/mps.vmoptions file.
       To adjust the value of JVM heap size modify the -Xms and -Xmx parameters.

GETTING HELP AND REPORTING BUGS
    For getting help you can visit several locations:
	- CodeOrchestra site http://codeorchestra.com/
    - Issue tracker http://realaxy.myjetbrains.com/
    - JetBrains MPS site http://www.jetbrains.com/mps/
    - JetBrains MPS space http://www.jetbrains.net/confluence/display/MPS/Welcome+to+JetBrains+MPS+Space

