# learning-hadoop
This repository contain docker compose for you to learning hadoop

## Step 1
### Install Docker in your local environtment and verify your installation
Follow guidance provide in bellow URL

* Windows :  https://docs.docker.com/desktop/windows/install/
* Mac     :  https://docs.docker.com/desktop/mac/install/



#### 

#### a. Docker installation can be verified by <br/>
 
> $ docker --version 

#### b. Check for Docker-Compose installation. It can be verified by <br/>
> $ docker-compose --version

if not installed, you can follow this guidance https://docs.docker.com/compose/install/ to install the docker compose. 
<br/>
<br/>
c. Check for git installation
> $ git -version

If not installed follow this link, to install GIT (https://www.linode.com/docs/development/version-control/how-to-install-git-on-linux-mac-and-windows/)

## Step 2 Download docker compose 

Git clone docker compose
> $ git clone https://github.com/rizqinugroho/learning-hadoop.git <br>
> $ cd learning-hadoop

Download hadoop images and start container
> $ docker-compose up -d

This step will takes about 15-30 minutes depends on your network speed for docker to download all the images and configure the hadoop settings. 

## Step 3 Verifying 

When it done, we need to make sure all the container are running with issue the following command
> $ docker ps

Verify the name node
> http://localhost:50070

Verify Hue
> http://localhost:8888/

Default userid / passwod : admin/admin


# learning-mapreduce

We provide sample map reduce wordcount code and java jar in /leraning-hadop path


## Step 1 
in  /leraning-hadoop path we provide sample hadoop text and .jar file. Or you can build jar by yourself using provided java wordcount source code. 
<br/>
Jar File
> https://github.com/rizqinugroho/learning-hadoop/blob/main/hdfs-command/hadoop-mapreduce-examples-2.7.1-sources.jar

<br/>
Java Source Code

> https://github.com/rizqinugroho/learning-hadoop/blob/main/hdfs-command/WordCount.java

## Step 2
Copy the jar file to the container. For this instance, we will use the namenode container to run a test job; feel free to use any you want.

> $ cd learning-hadoop <br>
> $ docker cp /hadoop-mapreduce-examples-2.7.1-sources.jar namenode:/tmp/

## Step 3
copy the .txt file to the namenode container
> $ docker cp simple-text.txt namenode:/tmp/

This will make the file accessible by the container to use and upload it to HDFS and run a Hadoop MapReduce Job.

## Step 4
Navigate to the container and execute it in an interactive way using the following command, with <b>/bin/bash</b> will raise an interactive bash terminal

> $ docker exec -it namenode /bin/bash

## Step 5
we need to create an input folder to host our sample-text.txt file. To do so, we will use hdfs command as follows;

>hdfs dfs -mkdir -p /user/root/input

We added -p because we are creating a parent folder with its subsequent children.

## Step 6
Copy the sample-text.txt file to the created folder using hdfs as follows;

>hdfs dfs -put sample-text.txt /user/root/input

## Step 7
Run the MapReduce job on our jar file using Hadoop jar to test the local cluster

> hadoop jar hadoop-mapreduce-examples-2.7.1-sources.jar org.apache.hadoop.examples.WordCount input output

Command Explanation : 
- <b>org.apache.hadoop.examples</b> is the class.
- WordCount is the function.
- input is the directory where we have our file.
- output where the files will be generated.


It will take time to run the process, let's wait until it done

## Step 8
Verify the result
> hadoop dfs -ls /user/root/output

You should see the result similiar like this. 
> Found 2 items <br>
> -rw-r--r--   3 root supergroup          0 2022-01-09 05:15 /user/root/output/_SUCCESS <br>
-rw-r--r--   3 root supergroup        165 2022-01-09 05:15 /user/root/output/part-r-00000

Check the content of <b>part-r-00000</b>
> hadoop fs -cat /user/root/output/part-r-00000

Now you can see the wordcount result