import requests
import re
from PIL import Image
from bs4 import BeautifulSoup
import FeiFeiOCR
import pandas as pd
import numpy

s = requests.session()
def Login(Account, Password, Mode):
    LoginUrl = 'https://www.nbxiaoshi.net/xsfw.2010.login.asp'
    LoginPostUrl = 'https://www.nbxiaoshi.net/xsfw.2010.login.chk.asp?action_word=ok'
    LoginHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive'}
    res1 = s.get(url = LoginUrl, headers = LoginHeaders)
    res1.encoding = 'utf-8'
    html1 = res1.text
    CaptchaUrl = 'https://www.nbxiaoshi.net/inc/xycode.xuesheng.asp'
    res2 = s.get(url=CaptchaUrl, headers=LoginHeaders)
    with open('code.jpg','wb') as fp:
        fp.write(res2.content)
    img = Image.open('code.jpg')
    img.show()
    # textCode = FeiFeiOCR.TestFunc()
    # print(textCode)
    # CaptchaCode = textCode
    CaptchaCode = input('请输入验证码：')
    LoginHeaders['Referer'] = 'https://www.nbxiaoshi.net/xsfw.2010.login.asp'
    data = {
        'studentid' : Account,
        'studentpasword' : Password,
        'dengluleixing' : Mode,
        'wsbmcodelogin' : CaptchaCode,
        }
    res3 = s.post(url=LoginPostUrl, data=data, headers=LoginHeaders)
    res3.encoding = 'utf-8'

# 饭卡
def Card():
    CardHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
    CardUrl = 'https://www.nbxiaoshi.net/xsfw.zytk35.student.xiaofeijilu.list.asp'
    CardRes = s.get(url=CardUrl, headers=CardHeaders)
    CardRes.encoding = 'utf-8'
    CardHtml = CardRes.text
    CardSoup = BeautifulSoup(CardHtml, features='lxml')
    CardID = re.findall(r'\d+', re.findall(r'饭卡系统编号：\d+（微信支付使用）',CardHtml)[0])[0]
    CardAllCell = CardSoup.find_all('td', {"height" : '30'})
    CardBalance = float(CardAllCell[3].get_text().strip())
    return [CardID, CardBalance]

def CardRecord(req):
    '''
    req: 0 - 返回记录页数/记录数
         n - 返回第n页记录
    '''
    if req == 0:
        CardRecordHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
        CardRecordUrl = 'https://www.nbxiaoshi.net/xsfw.zytk35.student.xiaofeijilu.list.asp'
        CardRecordRes = s.get(url=CardRecordUrl, headers=CardRecordHeaders)
        CardRecordRes.encoding = 'utf-8'
        CardRecordHtml = CardRecordRes.text
        CardRecordSoup = BeautifulSoup(CardRecordHtml, features='lxml')
        PageNum = re.findall(r'\d+', re.findall(r'当前第 \d+/\d+ 页',CardRecordHtml)[0])[1]
        RecordNum = re.findall(r'\d+', re.findall(r'共 \d+',CardRecordHtml)[0])[0]
        return [PageNum, RecordNum]
    else:
        max = CardRecord(0)[0]
        if req > int(max) or req < 0 :
            return 'Input Error!'
        CardRecordHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
        CardRecordUrl = 'https://www.nbxiaoshi.net/xsfw.zytk35.student.xiaofeijilu.list.asp?page='+str(req)
        CardRecordRes = s.get(url=CardRecordUrl, headers=CardRecordHeaders)
        CardRecordRes.encoding = 'utf-8'
        CardRecordHtml = CardRecordRes.text
        CardRecordSoup = BeautifulSoup(CardRecordHtml, features='lxml')
        CardRecordTable = CardRecordSoup.find_all('table')[1]
    
        df = pd.read_html(str(CardRecordTable))[0]
        df = df.dropna(axis=0,how='all').dropna(axis=1,how='all')
        df = df.fillna(value='-')
        dfjson = df.to_json(orient='values',force_ascii=False)
        return dfjson

# 个人成绩查询
def Score(isOptional):
    if isOptional == 0:
        ScoreUrl = 'https://www.nbxiaoshi.net/cjcx/cjcx_kaoshi.asp'
    else:
        ScoreUrl = 'https://www.nbxiaoshi.net/cjcx/cjcx_kaoshi.zbxk.asp'
    ScoreHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
    
    ScoreRes = s.get(url=ScoreUrl, headers=ScoreHeaders)
    ScoreRes.encoding = 'utf-8'
    ScoreHtml = ScoreRes.text
    ScoreSoup = BeautifulSoup(ScoreHtml, features='lxml')
    ScoreAllExamCell = ScoreSoup.find_all('option')
    ScoreAllExam = []
    for l in ScoreAllExamCell:
        ScoreAllExam.append([l.get_text().strip(),l['value'].strip()])
    return ScoreAllExam

def ScoreQuery(isOptional,ExamID):
    if isOptional == 0:
        ScoreQueryUrl = 'https://www.nbxiaoshi.net/cjcx/mes_student_cjcx.asp'
    else:
        ScoreQueryUrl = 'https://www.nbxiaoshi.net/cjcx/mes_student_cjcx.zbxk.asp'
    ScoreHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/cjcx/cjcx_kaoshi.asp'}
    
    data = {'select_exam':ExamID}
    ScoreQueryRes = s.post(url=ScoreQueryUrl, data=data, headers=ScoreHeaders)
    ScoreQueryRes.encoding = 'utf-8'
    ScoreQueryHtml = ScoreQueryRes.text
    ScoreQuerySoup = BeautifulSoup(ScoreQueryHtml, features='lxml')
    ScoreTable = ScoreQuerySoup.find_all('table')[2]
    
    df = pd.read_html(str(ScoreTable))[0]
    df = df.dropna(axis=0,how='all').dropna(axis=1,how='all')
    df = df.fillna(value='-').T
    dfjson = df.to_json(orient='values',force_ascii=False)
    return dfjson

# 家校联系单
def Contact(req):
    '''
    req: 0 - 返回记录页数/记录数
         n - 返回第n页记录
    '''
    if req == 0:
        ContactHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
        ContactUrl = 'https://www.nbxiaoshi.net/cjcx/jxlx.jxlxd.student.namelist.asp'
        ContactRes = s.get(url=ContactUrl, headers=ContactHeaders)
        ContactRes.encoding = 'utf-8'
        ContactHtml = ContactRes.text
        ContactSoup = BeautifulSoup(ContactHtml, features='lxml')
        PageNum = re.findall(r'\d+', re.findall(r'当前第 \d+/\d+ 页',ContactHtml)[0])[1]
        RecordNum = re.findall(r'\d+', re.findall(r'共 \d+',ContactHtml)[0])[0]
        return [PageNum, RecordNum]
    else:
        max = Contact(0)[0]
        if req > int(max) or req < 0 :
            return 'Input Error!'
        ContactHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
        ContactUrl = 'https://www.nbxiaoshi.net/cjcx/jxlx.jxlxd.student.namelist.asp?page='+str(req)
        ContactRes = s.get(url=ContactUrl, headers=ContactHeaders)
        ContactRes.encoding = 'utf-8'
        ContactHtml = ContactRes.text
        ContactSoup = BeautifulSoup(ContactHtml, features='lxml')
        # table
        ContactTable = ContactSoup.find_all('table')[1]
        df = pd.read_html(str(ContactTable))[0]
        df = df.dropna(axis=0,how='all').dropna(axis=1,how='all')
        df = df.fillna(value='-')
        dfjson = df.to_json(orient='values',force_ascii=False)
        dfarray = df.values.tolist()
        # link
        AllACell = ContactSoup.find_all('a')
        ContactLink = []
        for l in range(0,df.shape[0]):
            link = 'https://www.nbxiaoshi.net/cjcx/'+AllACell[l]['href']
            id = re.findall(r'\d+', re.findall(r'jxlx_detail_id=\d+',link)[0])[0]
            dfarray[l].append(link)
            dfarray[l].append(id)
        return dfarray

def ContactContent(id):
    pass

def Attendence():
    AttendenceUrl = 'https://www.nbxiaoshi.net/xsfw.mj.kaoqing.list.asp'
    AttendenceHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/cjcx/cjcx_kaoshi.asp'}
    AttendenceRes = s.get(url=AttendenceUrl, headers=AttendenceHeaders)
    AttendenceRes.encoding = 'utf-8'
    AttendenceHtml = AttendenceRes.text
    AttendenceSoup = BeautifulSoup(AttendenceHtml, features='lxml')
    AttendenceTable = AttendenceSoup.find_all('table')[0]
    
    df = pd.read_html(str(AttendenceTable))[0]
    df = df.dropna(axis=0,how='all').dropna(axis=1,how='all')
    df = df.fillna(value='-')
    # dfjson = df.to_json(orient='values',force_ascii=False)
    dfarray = df.values.tolist()
    return dfarray

def temp(Account, Password, Mode):
    LoginUrl = 'https://www.nbxiaoshi.net/xsfw.2010.login.asp'
    LoginPostUrl = 'https://www.nbxiaoshi.net/xsfw.2010.login.chk.asp?action_word=ok'
    LoginHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive'}
    res1 = s.get(url = LoginUrl, headers = LoginHeaders)
    res1.encoding = 'utf-8'
    html1 = res1.text
    CaptchaUrl = 'https://www.nbxiaoshi.net/inc/xycode.xuesheng.asp'
    res2 = s.get(url=CaptchaUrl, headers=LoginHeaders)
    with open('code.jpg','wb') as fp:
        fp.write(res2.content)
    img = Image.open('code.jpg')
    img.show()
    textCode = FeiFeiOCR.TestFunc()
    print(textCode)
    CaptchaCode = textCode
    # CaptchaCode = input('请输入验证码：')
    LoginHeaders['Referer'] = 'https://www.nbxiaoshi.net/xsfw.2010.login.asp'
    data = {
        'studentid' : Account,
        'studentpasword' : Password,
        'dengluleixing' : Mode,
        'wsbmcodelogin' : CaptchaCode,
        }
    res3 = s.post(url=LoginPostUrl, data=data, headers=LoginHeaders)
    res3.encoding = 'utf-8'
    Url = 'https://www.nbxiaoshi.net/xsfw_index.asp'
    Headers = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/cjcx/cjcx_kaoshi.asp'}
    Res = s.get(url=Url, headers=Headers)
    Res.encoding = 'utf-8'
    Html = Res.text
    Soup = BeautifulSoup(Html, features='lxml')
    Cell = Soup.find_all('b')[1].get_text().split(' ')[0]
    return Cell