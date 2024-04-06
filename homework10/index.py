from pyspark.sql import SparkSession

def process_csv(spark, file_path):
    # Зчитуємо дані з CSV файлу
    df = spark.read.csv(file_path, header=True, inferSchema=True)

    # Рахуємо кількість рядків
    row_count = df.count()

    # Виводимо результат
    print(f"Кількість рядків у CSV файлі: {row_count}")

if __name__ == "__main__":
    # Створюємо SparkSession
    spark = SparkSession.builder.appName("SparkExample").getOrCreate()

    # Зазначте шлях до вашого CSV файлу
    csv_file_path = "/app/data/PS_20174392719_1491204439457_log.csv"

    # Викликаємо функцію обробки
    process_csv(spark, csv_file_path)

    # Закриваємо SparkSession
    spark.stop()
