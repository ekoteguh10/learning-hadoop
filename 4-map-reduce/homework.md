## Homework - Deep Dive Hadoop: MapReduce

Dari code `PartitionerExample.java`:

* Rubah script tersebut untuk membuat output dari reducer merupakan Nama employee yang memiliki gaji tertinggi dari setiap gender yang dikelompokan berdasarkan 
  ```bash
  Usia <=20 tahun 
  Usia 20-30 Tahun
  Usia > 30 Tahun 
  ```

  ```java
  public static class ReduceClass extends Reducer<Text,Text,Text,Text> { // ganti tipe data Text dari IntWritable
      
      public int max = -1;
      
      public void reduce(Text key, Iterable <Text> values, Context context) throws IOException, InterruptedException {
         
         max = -1;
         String nama = ""; // variabel baru
			
         for (Text val : values) {
            String [] str = val.toString().split("\t", -3);
            if(Integer.parseInt(str[4])>max) {
               max=Integer.parseInt(str[4]);
               nama = str[1]; // masukkan nama
            }
         }
			
         context.write(new Text(key), new Text(nama)); // tulis namanya
      }
  }
  ```

  Detil keseluruhan codingan ada di dalam file `PartitionerExample.java`

* Buat `jar file` dengan nama `PartitionerExample{NamaSisawa}.jar`, tuliskan step nya 
  
  1. Siapkan file-file yang dibutuhkan, yaitu `PartitionerExample.java` dan `hadoop-core-1.2.1.jar`
  2. Compile file `PartitionerExample.java` ke dalam bentuk `jar` dengan menggunakan command berikut.
     
     ```bash
     javac -classpath hadoop-core-1.2.1.jar -d . PartitionerExample.java

     jar cfm PartitionerExampleEkoTeguh.jar manifest.txt digitalskola/*.class 
     ```

  3. Untuk menjalankannya, bisa dengan mengikuti langkah pada folder `1-intro-hadoop-operation`