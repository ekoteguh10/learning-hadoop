### 1 ls: This command is used to list all the files. Use lsr for recursive approach. It is useful when we want a hierarchy of a folder.
Syntax:

>bin/hdfs dfs -ls  <path>

Example:

> bin/hdfs dfs -ls /  

It will print all the directories present in HDFS. bin directory contains executables so, bin/hdfs means we want the executables of hdfs particularly dfs(Distributed File System) commands.

###  2 To create a directory. In Hadoop dfs there is no home directory by default. So let’s first create it

> bin/hdfs dfs -mkdir <folder name> </br>
 creating home directory:
<br>
hdfs/bin -mkdir /user
hdfs/bin -mkdir /user/username -> write the username of your computer 

Example:

>bin/hdfs dfs -mkdir  /geeks  =>  '/' means absolute path
bin/hdfs dfs -mkdir  geeks2  =>   Relative path -> the folder will be 
                                  created relative to the home directory.

### touchz: It creates an empty file.
Syntax:

>bin/hdfs dfs  -touchz  <file_path>

Example:

>bin/hdfs dfs -touchz  /geeks/myfile.txt 

### copyFromLocal (or) put: To copy files/folders from local file system to hdfs store. This is the most important command. Local filesystem means the files present on the OS.

Syntax:

>bin/hdfs dfs -copyFromLocal <local file path>  <dest(present on hdfs)>

Example: Let’s suppose we have a file AI.txt on Desktop which we want to copy to folder geeks present on hdfs.

> bin/hdfs dfs -copyFromLocal ../Desktop/AI.txt /geeks

(OR)

> bin/hdfs dfs -put ../Desktop/AI.txt /geeks

### cat: To print file contents.

Syntax:

> bin/hdfs dfs -cat <path>

Example:

> // print the content of AI.txt present
// inside geeks folder.
bin/hdfs dfs -cat /geeks/AI.txt ->

### CopyToLocal (or) get: To copy files/folders from hdfs store to local file system.

Syntax:

> bin/hdfs dfs -copyToLocal  <<srcfile(on hdfs)> <local file dest>

Example:

> bin/hdfs dfs -copyToLocal  /geeks   ../Desktop/hero  

(OR)

> bin/hdfs dfs -get /geeks/myfile.txt  ../Desktop/hero


### moveFromLocal: This command will move file from local to hdfs.

Syntax:

> bin/hdfs dfs -moveFromLocal <local src>   <dest(on hdfs)> 

Example:

> bin/hdfs dfs -moveFromLocal  ../Desktop/cutAndPaste.txt   /geeks


### cp: This command is used to copy files within hdfs. Lets copy folder geeks to geeks_copied.

Syntax:

> bin/hdfs dfs -cp  <src(on hdfs)>  <dest(on hdfs)>

Example:

> bin/hdfs -cp /geeks  /geeks_copied

### rmr: This command deletes a file from HDFS recursively. It is very useful command when you want to delete a non-empty directory.

Syntax:

> bin/hdfs dfs -rmr <filename/directoryName>

Example:

> bin/hdfs dfs -rmr  /geeks_copied -> It will delete all the content inside the directory then the directory itself.