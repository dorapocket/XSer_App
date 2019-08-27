from bs4 import BeautifulSoup
from urllib.request import urlopen
import re
import json

def NewsContent(NewsID):
    NewsUrl = "https://www.nbxiaoshi.net/ReadNews.asp?NewsId="+str(NewsID)
    html = urlopen(NewsUrl).read().decode('utf-8')
    soup = BeautifulSoup(html, features='lxml')
    # 文章信息
    pv = soup.find_all('font', {"color" : 'red'})[0].get_text()
    title = soup.find_all('strong')[1].get_text()
    [year,month,day] = re.findall(r'\d+', re.findall(r'发表日期：\d+年\d+月\d+日',html)[0])
    author = soup.find_all('a', {'class':'class'})[1].get_text()
    # 权限标识
    if "如果你还没注册，请赶紧点此" in html:
        rank = re.findall(r'\d+', re.findall(r'文章级别：\d+级',html)[0])[0]
        content = "Permission denied!" 
    else:
        rank = 0
        content = str(soup.find_all('td', {'id':'fontzoom'})[0]).replace("/ewebeditor", "https://www.nbxiaoshi.net/ewebeditor")
    dict = {}
    dict['rank'] = rank
    dict['pv'] = pv
    dict['title'] = title
    dict['time'] = {'year':year, 'month':month, 'day':day}
    dict['author'] = author
    dict['content'] = content
    j = json.dumps(dict, ensure_ascii=0)
    return j

def BoardContent(BoardID):
    BoardUrl = "https://www.nbxiaoshi.net/Board_news.asp?ID="+str(BoardID)
    html = urlopen(BoardUrl).read().decode('utf-8')
    soup = BeautifulSoup(html, features='lxml')
    # 文章信息
    pv = re.findall(r'\d+', re.findall(r'点击：\d+次',html)[0])[0]
    title = soup.find_all('strong')[1].get_text()[5:]
    [year,month,day] = re.findall(r'\d+', re.findall(r'录入日期：\d+年\d+月\d+日',html)[0])
    author = soup.find_all('a', {'class':'class'})[1].get_text()
    # 权限标识
    if "如果你还没注册，请赶紧点此" in html:
        rank = re.findall(r'\d+', re.findall(r'文章级别：\d+级',html)[0])[0]
        content = "Permission denied!" 
    else:
        rank = 0
        content = str(soup.find_all('td', {'id':'fontzoom'})[0]).replace("/ewebeditor", "https://www.nbxiaoshi.net/ewebeditor")
    dict = {}
    dict['rank'] = rank
    dict['pv'] = pv
    dict['title'] = title
    dict['time'] = {'year':year, 'month':month, 'day':day}
    dict['author'] = author
    dict['content'] = content
    j = json.dumps(dict, ensure_ascii=0)
    return j

# print(LatestArticle(0,3))
# print(NewsContent(15914))
# print(BoardContent(15904))