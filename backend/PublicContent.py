import requests
import re
from PIL import Image
from bs4 import BeautifulSoup
from urllib.request import urlopen
import math

# 家校互动

def Comments(page):
    url = "https://www.nbxiaoshi.net/xyfw.liuyan.asp?flag=&item=&search=1&page="+str(page)
    html = urlopen(url).read().decode('utf-8')
    soup = BeautifulSoup(html, features='lxml')
    ques = []
    time = []
    reply = []
    isreplied = []
    department = []
    data = []
    all_p = soup.find_all('p')
    for i in all_p:
        if i.get_text() == ' ' or i.get_text() == '\xa0':
            pass
        else:
            ques.append(i.get_text())
    all_time = soup.find_all('td', {'width':"14%", 'bgcolor':"#FFFFFF"})
    for i in all_time:
        time.append(i.get_text())
    all_reply = soup.find_all('div', {'align':"left", 'style':"color: #FF0000"})
    for i in all_reply:
        reply.append(i.get_text())
    for i in reply:
        if '请耐心等待' in i:
            isreplied.append(0)
            endpoint = i.find('还未回复')
            department.append(i[0:endpoint])
        else:
            isreplied.append(1)
            endpoint = i.find('回复')
            department.append(i[0:endpoint])
    for i in range(0,len(ques)):
        data.append([ques[i],time[i],reply[i],isreplied[i],department[i]])
    return data

def CommentsMaxQuantity():
    html = urlopen("https://www.nbxiaoshi.net/xyfw.liuyan.asp?flag=&item=&search=1&page=1").read().decode('utf-8')
    PageNum = re.findall(r'\d+', re.findall(r'当前第 \d+/\d+ 页',html)[0])[1]
    RecordNum = re.findall(r'\d+', re.findall(r'共 \d+',html)[0])[0]
    return [RecordNum,PageNum]

def CommentsQuantityProc(page, num):
    page = int(page)
    num = int(num)
    RecordNum = int(CommentsMaxQuantity()[0])
    PageNum = int(CommentsMaxQuantity()[1])
    StartNum = (page-1)*num+1
    EndNum = page*num
    if EndNum > RecordNum:
        EndNum = RecordNum
    StartPage = math.ceil(StartNum/10)
    EndPage = math.ceil(EndNum/10)
    StartPageIndex = StartNum % 10
    EndPageIndex = EndNum % 10
    if EndPageIndex == 0:
        EndPageIndex = 10
    print(RecordNum,PageNum,StartNum,EndNum,StartPage,EndPage,StartPageIndex,EndPageIndex)
    data = []
    if StartPage == EndPage:
        data = Comments(StartPage)[StartPageIndex-1:EndPageIndex]
        return data
    else:
        # 首页
        data = data + Comments(StartPage)[StartPageIndex-1:]
        for i in range(StartPage+1,EndPage+1):
            data = data + Comments(i)
        # 尾页
        data = data + Comments(EndPage)[:EndPageIndex]
        return data

# 公告

def Board(page):
    url = "https://www.nbxiaoshi.net/board.asp?page="+str(page)
    html = urlopen(url).read().decode('utf-8')
    soup = BeautifulSoup(html, features='lxml')
    title = []
    time = []
    boardid = []
    data = []
    all_href = soup.find_all('a', {'class':'class'})
    print(len(all_href))
    for i in range(4,len(all_href)):
        title.append(all_href[i].get_text())
        tempid = re.findall(r'\d+', re.findall(r'ID=\d+',all_href[i]['href'])[0])[0]
        boardid.append(tempid)
    time = re.findall(r'\d+-\d+-\d+',html)
    for i in range(0,len(time)):
        data.append([title[i],time[i],boardid[i]])
    return data

def BoardMaxQuantity():
    html = urlopen("https://www.nbxiaoshi.net/board.asp?page=1").read().decode('utf-8')
    PageNum = re.findall(r'\d+', re.findall(r'当前第 \d+/\d+ 页',html)[0])[1]
    RecordNum = re.findall(r'\d+', re.findall(r'共 \d+',html)[0])[0]
    return [RecordNum,PageNum]

def BoardQuantityProc(page, num):
    page = int(page)
    num = int(num)
    RecordNum = int(BoardMaxQuantity()[0])
    PageNum = int(BoardMaxQuantity()[1])
    StartNum = (page-1)*num+1
    EndNum = page*num
    if EndNum > RecordNum:
        EndNum = RecordNum
    StartPage = math.ceil(StartNum/10)
    EndPage = math.ceil(EndNum/10)
    StartPageIndex = StartNum % 10
    EndPageIndex = EndNum % 10
    if EndPageIndex == 0:
        EndPageIndex = 10
    print(RecordNum,PageNum,StartNum,EndNum,StartPage,EndPage,StartPageIndex,EndPageIndex)
    data = []
    if StartPage == EndPage:
        data = Board(StartPage)[StartPageIndex-1:EndPageIndex]
        return data
    else:
        # 首页
        data = data + Board(StartPage)[StartPageIndex-1:]
        for i in range(StartPage+1,EndPage+1):
            data = data + Board(i)
        # 尾页
        data = data + Board(EndPage)[:EndPageIndex]
        return data

# 最新文章

def LatestArticle(ModuleID, OutputNum):
    '''
    +───────────+──────────+
    | ModuleID  | 对应板块  |
    +───────────+──────────+
    | 0         | 所有板块  |
    | 1         | 校园公告  |
    | 2         | 校园新闻  |
    | 3         | 资源中心  |
    | 4         | 德育天地  |
    | 5         | 国际中心  |
    | 6         | 教学科研  |
    | 7         | 校园生活  |
    | 8         | 每周菜单  |
    | 9         | 班级主页  |
    | 10        | 体艺特色  |
    | 11        | DD90     |
    | 12        | 信息关注  |
    +───────────+──────────+
    OutputNum: 不大于6的数字，控制输出数量。
    '''
    if ModuleID>12 or ModuleID<0 or OutputNum>6 or OutputNum<0:
        return "Input is not correct."
    html = urlopen("https://www.nbxiaoshi.net/news.new.asp").read().decode('utf-8')
    soup = BeautifulSoup(html, features='lxml')
    all_href = soup.find_all('a', {"target" : '_blank'})
    all_time = soup.find_all('td', {"height" : '30'})
    all_article = [[],[]]
    for l in all_href:
        if l.has_attr('title'):
            all_article[0].append(l['title'])
    for l in all_time:
        if re.match(r'\d{4}\-\d{1,2}\-\d{1,2}', l.get_text()):
            all_article[1].append(l.get_text())
    titlerange = [ModuleID*6,ModuleID*6+OutputNum]
    return [all_article[0][titlerange[0]:titlerange[1]],all_article[1][titlerange[0]:titlerange[1]]]

def AllLatest(page):
    url = "https://www.nbxiaoshi.net/newest.asp?page="+str(page)
    html = urlopen(url).read().decode('utf-8')
    soup = BeautifulSoup(html, features='lxml')
    title = []
    time = []
    boardid = []
    data = []
    all_href = soup.find_all('a', {'class':'middle'})
    # print(len(all_href))
    for i in range(9,len(all_href)):
        title.append(all_href[i].get_text())
        tempid = re.findall(r'ID=\d+',all_href[i]['href'])
        if len(tempid)==0:
            boardid.append('0')
        else:
            tempid = re.findall(r'\d+', re.findall(r'ID=\d+',all_href[i]['href'])[0])[0]
            boardid.append(tempid)
    time = re.findall(r'\d+年\d+月\d+日',html)
    for i in range(0,len(time)):
        data.append([title[i],time[i],boardid[i]])
    return data

def AllLatestMaxQuantity():
    html = urlopen("https://www.nbxiaoshi.net/newest.asp?page=1").read().decode('utf-8')
    PageNum = re.findall(r'\d+', re.findall(r'当前第 \d+/\d+ 页',html)[0])[1]
    RecordNum = re.findall(r'\d+', re.findall(r'共 \d+',html)[0])[0]
    return [RecordNum,PageNum]

def AllLatestQuantityProc(page, num):
    page = int(page)
    num = int(num)
    RecordNum = int(AllLatestMaxQuantity()[0])
    PageNum = int(AllLatestMaxQuantity()[1])
    StartNum = (page-1)*num+1
    EndNum = page*num
    if EndNum > RecordNum:
        EndNum = RecordNum
    StartPage = math.ceil(StartNum/20)
    EndPage = math.ceil(EndNum/20)
    StartPageIndex = StartNum % 20
    EndPageIndex = EndNum % 20
    if EndPageIndex == 0:
        EndPageIndex = 20
    print(RecordNum,PageNum,StartNum,EndNum,StartPage,EndPage,StartPageIndex,EndPageIndex)
    data = []
    if StartPage == EndPage:
        data = AllLatest(StartPage)[StartPageIndex-1:EndPageIndex]
        return data
    else:
        # 首页
        data = data + AllLatest(StartPage)[StartPageIndex-1:]
        for i in range(StartPage+1,EndPage+1):
            data = data + AllLatest(i)
        # 尾页
        data = data + AllLatest(EndPage)[:EndPageIndex]
        return data

# 校务公开

def SchoolAffair(page):
    url = "https://www.nbxiaoshi.net/xiaowugongkai.asp?page="+str(page)
    html = urlopen(url).read().decode('utf-8')
    soup = BeautifulSoup(html, features='lxml')
    title = []
    time = []
    boardid = []
    data = []
    all_href = soup.find_all('a', {'class':'middle'})
    # print(len(all_href))
    for i in range(9,len(all_href)):
        title.append(all_href[i].get_text())
        tempid = re.findall(r'ID=\d+',all_href[i]['href'])
        if len(tempid)==0:
            boardid.append('0')
        else:
            tempid = re.findall(r'\d+', re.findall(r'ID=\d+',all_href[i]['href'])[0])[0]
            boardid.append(tempid)
    time = re.findall(r'\d+年\d+月\d+日',html)
    for i in range(0,len(time)):
        data.append([title[i],time[i],boardid[i]])
    return data

def SchoolAffairMaxQuantity():
    html = urlopen("https://www.nbxiaoshi.net/newest.asp?page=1").read().decode('utf-8')
    PageNum = re.findall(r'\d+', re.findall(r'当前第 \d+/\d+ 页',html)[0])[1]
    RecordNum = re.findall(r'\d+', re.findall(r'共 \d+',html)[0])[0]
    return [RecordNum,PageNum]

def SchoolAffairQuantityProc(page, num):
    page = int(page)
    num = int(num)
    RecordNum = int(SchoolAffairMaxQuantity()[0])
    PageNum = int(SchoolAffairMaxQuantity()[1])
    StartNum = (page-1)*num+1
    EndNum = page*num
    if EndNum > RecordNum:
        EndNum = RecordNum
    StartPage = math.ceil(StartNum/20)
    EndPage = math.ceil(EndNum/20)
    StartPageIndex = StartNum % 20
    EndPageIndex = EndNum % 20
    if EndPageIndex == 0:
        EndPageIndex = 20
    print(RecordNum,PageNum,StartNum,EndNum,StartPage,EndPage,StartPageIndex,EndPageIndex)
    data = []
    if StartPage == EndPage:
        data = SchoolAffair(StartPage)[StartPageIndex-1:EndPageIndex]
        return data
    else:
        # 首页
        data = data + SchoolAffair(StartPage)[StartPageIndex-1:]
        for i in range(StartPage+1,EndPage+1):
            data = data + SchoolAffair(i)
        # 尾页
        data = data + SchoolAffair(EndPage)[:EndPageIndex]
        return data

def HomePageBrief():
    url = "https://www.nbxiaoshi.net/index.main.asp"
    html = urlopen(url).read().decode('utf-8')
    # url = "D:\\2019年02暑假\XSSpider\index.html"
    # htmlfile = open(url, 'r', encoding='utf-8')
    # html = htmlfile.read()
    soup = BeautifulSoup(html, features='lxml')
    # 气象信息
    hasweather = -1
    all_weather = soup.find_all('a',{'href':'qixiang_web.asp'})
    # all_weather = soup.find_all('a',{'href':'https://www.nbxiaoshi.net/qixiang_web.asp'})
    if len(all_weather)==2:
        hasweather = 0
        weathercontent = ''
    else:
        hasweather = 1
        weathercontent = all_weather[1]['title']
        weather_time = re.findall(r'\d+/\d+/\d+ \d+:\d+:\d+',html)[1]
    # 标题
    title_temp1 = []
    title_temp2 = []
    title = []
    time = []
    id = []
    id_temp1 = []
    id_temp2 = []
    data = []
    all_title = soup.find_all('a',{'target':'_blank'})
    for i in all_title:
        if i.has_attr('title'):
            if 'Board_news.asp?ID=' in i['href']:
                title_temp1.append(i['title'])
                tempid = re.findall(r'\d+', re.findall(r'ID=\d+',i['href'])[0])[0]
                id_temp1.append(tempid)
            elif 'ReadNews.asp?NewsId=' in i['href']:
                title_temp2.append(i['title'])
                tempid = re.findall(r'\d+', re.findall(r'Id=\d+',i['href'])[0])[0]
                id_temp2.append(tempid)
    title = title_temp1[0:2]+title_temp2[0:2]+title_temp2[5:7]
    id = id_temp1[0:2]+id_temp2[0:2]+id_temp2[5:7]
    # 时间
    all_time = re.findall(r'\d+-\d+-\d+',html)
    if hasweather==1:
        time = all_time[0:2]+all_time[4:6]+all_time[9:11]
    else:
        time = all_time[0:2]+all_time[5:7]+all_time[10:12]
    for i in range(0,6):
        data.append([title[i],time[i],id[i]])
    if hasweather==1:
        data.append([weathercontent,weather_time,''])
    return data

# print(Comments(1))
# print(CommentsMaxQuantity())
# print(CommentsQuantityProc(1,20))
# print(BoardQuantityProc(3,2))
# print(AllLatest(1))
# print(len(SchoolAffairQuantityProc(1,20)))
# print(HomePageBrief())
# print(SchoolAffair(2))