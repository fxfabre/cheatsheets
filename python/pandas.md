A tester : Modin et Dask


pd.options.mode.chained_assignment = 'raise'

```
>>> import timeit
>>> timeit.timeit(
       'pd.DataFrame(list(db.collection_name.find()))', 
       setup="import pandas as pd; from pymongo import MongoClient; client = MongoClient(HOST, PORT); db = client.db_name",
       number=500)
29.600714206695557
>>> timeit.timeit(
       'pd.DataFrame.from_records(db.collection_name.find())', 
       setup="import pandas as pd; from pymongo import MongoClient; client = MongoClient(HOST, PORT); db = client.db_name",
       number=500)
29.189693927764893
```
