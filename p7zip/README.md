# readme


``` bash
docker run --rm -it devops/p7zip 7z --help
```

== Examples ==

{{Warning|Do not use 7z format for backup purposes, because it doesn't save owner/group of files. See {{man|1|7z}} for more details.}}

Add file/directory to the archive (or create a new one):

 $ 7z a <archive name> <file name>

Also it is possible to set password with flag {{ic|-p}} and hide structure of the archive with flag {{ic|1=-mhe=on}}:

 $ 7z a <archive name> <file name> -p -mhe=on

Update existing files in the archive or add new ones:

 $ 7z u <archive name> <file name>

List the content of an archive:

 $ 7z l <archive name>

Extract all files from an archive to the current directory without using directory names:

 $ 7z e <archive name>

Extract with full paths:

 $ 7z x <archive name>

Extract into a new directory:

 $ 7z x -o<folder name> <archive name>

Check integrity of the archive:

 $ 7z t <archive name>

