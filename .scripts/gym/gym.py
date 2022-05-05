from dateutil.relativedelta import relativedelta
import datetime
today = datetime.date.today()
rd = relativedelta(datetime.date(2022,5,13),today)

if rd.days > 0:
    print(f"{rd.days} dage tilbage!")
else:
    print("Du er FÆRDIG med at have timer i gym! wuhuuuuuuuu! Aaaaaaldig mer!")
