## parket file

import os
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
import s3fs

path = 's3://.../file_name.gz.parquet'
fp = s3fs.S3FileSystem().open(path)
parquet_file = pq.ParquetFile(fp)

parquet_file.num_row_groups			# nombre de groupes de colonnes
parquet_file.schema					# liste des colonnes avec leur type
parquetFile.metadata				# shape, size

temp_name = os.tempnam()
client = boto3.client('s3')
client.download_file(bucket, s3_url, temp_name)
df = pq.read_pandas(temp_name).to_pandas()

table = pa.Table.from_pandas(df, preserve_index=False)
