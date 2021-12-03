import pandas as pd


v1 = [11, 12, 12, 14, 16, 19, 19, 20, 21, 21]
v2 = [16, 16, 16, 17, 18, 19, 22, 24, 25, 32]

foo = pd.DataFrame({'v1': v1, 'v2': v2})

del v1, v2

corr = foo.corr()
cov = foo.cov()

1+1
