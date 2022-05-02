from dateutil.relativedelta import relativedelta
import datetime
today = datetime.date.today()
rd = relativedelta(datetime.date(2022,5,13),today)
print(rd.days)
