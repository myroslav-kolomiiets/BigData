const { SparkSession } = require('pyspark');

const spark = SparkSession.builder.appName('example').getOrCreate();

const dataPath = 'path/to/your/csv/file.csv';

const data = spark.read.csv(dataPath, {
  header: true,
  inferSchema: true
});

const rowCount = data.count();
console.log('Number of rows:', rowCount);

spark.stop();
