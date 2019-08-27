import requests
import re
from PIL import Image
from bs4 import BeautifulSoup
import FeiFeiOCR
import json
import datetime
import hashlib
import sqlite3
import os

# 数据库操作相关

def CheckUser(Account, Method):
    '''
    检查数据库中是否有登录记录
    In: 
        Account - 帐号
        Method - 身份
    Out: 
        0 - 当不存在记录
        n - 当存在记录
    '''
    # conn = sqlite3.connect('xsspider.db')
    conn = sqlite3.connect(os.path.join(os.path.dirname(__file__), 'xsspider.db'))
    cursor = conn.cursor()
    sqlstr = "select account,method from login where account='"+str(Account)+"' and method='"+Method+"'"
    cursor.execute(sqlstr)
    values = cursor.fetchall()
    cursor.close()
    conn.close()
    return len(values)

def ModifyCookie(Account, Method, Cookie,AppSecret):
    '''
    更改数据库中的Cookie值
    In:
        Account - 帐号
        Method - 身份
        Cookie - Cookie字符串
    Out:
        1 - 当无异常
    '''
    timestring = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
    conn = sqlite3.connect(os.path.join(os.path.dirname(__file__), 'xsspider.db'))
    cursor = conn.cursor()
    sqlstr_cookie = "update login set cookie='" + Cookie + "' where account='"+str(Account)+"' and method='"+Method+"'"
    sqlstr_time = "update login set updatetime='" + timestring + "' where account='"+str(Account)+"' and method='"+Method+"'"
    sqlstr_secret = "update login set secret='" + AppSecret + "' where account='"+str(Account)+"' and method='"+Method+"'"
    cursor.execute(sqlstr_cookie)
    cursor.execute(sqlstr_time)
    cursor.execute(sqlstr_secret)
    conn.commit()
    cursor.close()
    conn.close()
    return 1

def AddUser(Account, Method, CookieStr,AppSecret):
    timestring = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S")
    conn = sqlite3.connect(os.path.join(os.path.dirname(__file__), 'xsspider.db'))
    cursor = conn.cursor()
    sqlstr = "INSERT INTO login (account,method,updatetime,cookie,secret) VALUES ('%s','%s','%s','%s','%s')" % (str(Account),str(Method),str(timestring),str(CookieStr),str(AppSecret))
    cursor.execute(sqlstr)
    conn.commit()
    cursor.close()
    conn.close()
    return 1

def PickCookie(AppSecret):
    try:
        conn = sqlite3.connect(os.path.join(os.path.dirname(__file__), 'xsspider.db'))
        cursor = conn.cursor()
        sqlstr = "select cookie from login where secret='"+str(AppSecret)+"'"
        cursor.execute(sqlstr)
        values = cursor.fetchall()
        cursor.close()
        conn.close()
        val=values[0][0]
    except:
        return {
            "code":403,
            "msg":"Invalid Secret",
            "data":{}
        }
    else:
        return {
            "code":200,
            "msg":"success",
            "data":val
        }

# 登录操作相关
def Login(Account, Password, Method):
    '''
    登录并获取Cookie
    In:
        Account - 帐号
        Password - 密码
        Method - 身份
    Out:
        Cookie - 当成功获取cookie
    '''
    if (Account=="") or (Password=="") or (Method=="") or (Account is None) or (Password is None) or (Method is None):
        return {
            "code":400,
            "msg":"缺少必要参数，请重试",
            "secret":"",
            "inf":""
        }

    try:
        s = requests.session()
        LoginUrl = 'https://www.nbxiaoshi.net/xsfw.2010.login.asp'
        LoginPostUrl = 'https://www.nbxiaoshi.net/xsfw.2010.login.chk.asp?action_word=ok'
        LoginHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive'}
        res1 = s.get(url = LoginUrl, headers = LoginHeaders)
        res1.encoding = 'utf-8'
        html1 = res1.text
        CaptchaUrl = 'https://www.nbxiaoshi.net/inc/xycode.xuesheng.asp'
        res2 = s.get(url=CaptchaUrl, headers=LoginHeaders)
        #with open('code.jpg','wb') as fp:
        #    fp.write(res2.content)
        #img = Image.open('code.jpg')
        #img.show()
        sbjg = FeiFeiOCR.TestFunc(res2.content)
        textCode = sbjg[0]
        #print(textCode)
        CaptchaCode = textCode
        # CaptchaCode = input('请输入验证码：')
        LoginHeaders['Referer'] = 'https://www.nbxiaoshi.net/xsfw.2010.login.asp'
        data = {
            'studentid' : Account,
            'studentpasword' : Password,
            'dengluleixing' : Method,
            'wsbmcodelogin' : CaptchaCode,
            }
        res3 = s.post(url=LoginPostUrl, data=data, headers=LoginHeaders)
        if "验证码" in res3.text:
            FeiFeiOCR.HuanQian(sbjg[1])
            return {
                "code":403,
                "msg":"验证码错误",
                "secret":"",
                "inf":""
            }
        # print(res3.text)
        res3.encoding = 'utf-8'
        cookie = json.dumps(s.cookies.get_dict())
    except:
        return {
            "code":403,
            "msg":"服务器请求错误",
            "secret":"",
            "inf":""
        }
    else:
        if ChickAuth(cookie):
            if CheckUser(Account, Method):
                sec=GenerateAppSecret(cookie)
                ModifyCookie(Account, Method, cookie,sec)
            else:
                sec=GenerateAppSecret(cookie)
                AddUser(Account, Method, cookie,sec)
            return {
                "code":200,
                "msg":"登陆成功",
                "secret":sec,
                "inf":getUserInf(sec)["data"]["name"]
            }
        else:
            return {
                "code":403,
                "msg":"用户名或密码错误",
                "secret":"",
                "inf":""
            }

'''
def CheckCookie(CookieStr):
    
    使用指定的Cookie登录
    In:
        完整Cookie字符串
    Out:

    
    cookiedict = json.loads(CookieStr)
    CardHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
    CardUrl = 'https://www.nbxiaoshi.net/xsfw.zytk35.student.xiaofeijilu.list.asp'
    CardRes = requests.get(url=CardUrl, headers=CardHeaders, cookies=cookiedict)
    CardRes.encoding = 'utf-8'
    CardHtml = CardRes.text
    CardSoup = BeautifulSoup(CardHtml, features='lxml')
    CardID = re.findall(r'\d+', re.findall(r'饭卡系统编号：\d+（微信支付使用）',CardHtml)[0])[0]
    CardAllCell = CardSoup.find_all('td', {"height" : '30'})
    CardBalance = float(CardAllCell[3].get_text().strip())
    return [CardID, CardBalance]
'''
'''
def LoginProc(Account, Password, Method, Auth):
    if CheckUser(Account, Method):
        cookie = PickCookie(Account, Method)
    else:
        AddUser(Account, Password, Method, Auth, cookie)
'''
def getUserInf(AppSecret):
    CookieStr=PickCookie(AppSecret)
    if CookieStr['code']==200 and ChickAuth(CookieStr['data']):
        try:
            BasicInfoUrl='https://www.nbxiaoshi.net/cjcx/xsfw.updatestudent.asp'
            cookiedict = json.loads(CookieStr['data'])
            CardHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
            CardRes = requests.get(url=BasicInfoUrl, headers=CardHeaders, cookies=cookiedict)
            CardRes.encoding = 'utf-8'
            CardHtml = CardRes.text
            CardSoup = BeautifulSoup(CardHtml, features='lxml')
            TempHtml=CardSoup.find_all("tr",class_='td_bg_module')[0]
            StuName=TempHtml.find_all("td")[1].string
            StuNation=CardSoup.select('option[selected]')[0].string
            StuParty=CardSoup.select('option[selected]')[1].string
            StuHealth=CardSoup.select('option[selected]')[2].string
            StuBirthday=CardSoup.select('input[id=bf_borndate]')[0]['value']
            StuSchool=CardSoup.select('input[id=gradschool]')[0]['value']
            StuHometown=CardSoup.select('input[name="bf_NativePlace"]')[0]['value']
            StuResidencePlace=CardSoup.select('input[name="bf_ResidencePlace"]')[0]['value']
            StuID=CardSoup.select('input[name="bf_IdentityID"]')[0]['value']
            StuAdd=CardSoup.select('input[name="bf_HomeAddress"]')[0]['value']
            StuInScore=CardSoup.select('input[name="bf_EnTotalScore"]')[0]['value']
            StuHomeTel=CardSoup.select('input[name="bf_HomeTel"]')[0]['value']
            StuCellPhone=CardSoup.select('input[name="bf_cellphone"]')[0]['value']
            StuZip=CardSoup.select('input[name="bf_HomeZipcode"]')[0]['value']
            StuEmail=CardSoup.select('input[name="bf_email"]')[0]['value']
            StuQQ=CardSoup.select('input[name="bf_QQ"]')[0]['value']
        except:
            return {
                "code":500,
                "msg":"学生数据解析失败",
                "data":{}
            }
        else:    
            return {
                "code":200,
                "msg":"成功",
                "data":{
                    "name":StuName,
                    "nation":StuNation,
                    "party":StuParty,
                    "health":StuHealth,
                    "birthday":StuBirthday,
                    "preschool":StuSchool,
                    "hometown":StuHometown,
                    "residence":StuResidencePlace,
                    "id":StuID,
                    "address":StuAdd,
                    "inscore":StuInScore,
                    "hometel":StuHomeTel,
                    "cellphone":StuCellPhone,
                    "zip":StuZip,
                    "email":StuEmail,
                    "qq":StuQQ
                }
            }
    else :
        if CookieStr['code']==403 :
            msg=CookieStr['msg']
            code=403
        else:
            msg="failed read student information"
            code=404
        return {
            "code":code,
            "msg":msg,
            "data":{}
        }

def ChickAuth(CookieStr):
    '''
    获取Cookie有效性
    In:
        完整Cookie字符串
    Out:
        0 - Cookie失效 重新登陆
        1 - Cookie有效
    '''
    BasicInfoUrl='https://www.nbxiaoshi.net/cjcx/xsfw.updatestudent.asp'
    cookiedict = json.loads(CookieStr)
    CardHeaders = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/55.0.2883.103 Safari/537.36', 'Connection':'keep-alive', 'Referer':'https://www.nbxiaoshi.net/xsfw_index.asp'}
    CardRes = requests.get(url=BasicInfoUrl, headers=CardHeaders, cookies=cookiedict)
    CardRes.encoding = 'utf-8'
    CardHtml = CardRes.text
    CardSoup = BeautifulSoup(CardHtml, features='lxml')
    try:
        TempHtml=CardSoup.find_all("tr",class_='td_bg_module')[0]
        StuName=TempHtml.find_all("td")[1].string
    except:
        #print("登陆失败，请重试")
        return 0
    else:
        #print(StuName)
        return 1

def GenerateAppSecret(CookieStr):
    m2 = hashlib.md5()   
    m2.update((CookieStr+"XSerAppSecret").encode("utf8"))   
    return m2.hexdigest()
    # StuRemark=CardSoup.select('textarea[name="bf_Remark"]')[0]['value']
    # TempHtml=CardSoup.find_all("tr",class_='td_bg_module')[1]