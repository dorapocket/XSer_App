from flask import Flask, Response
from flask import request
import json
import LatestArticle
import PublicContent
import LoginManage

xsapi = Flask(__name__)

@xsapi.route('/')
def hello_world():
    return 'Hello World!'

# 公开内容相关

# 获取公告/文章内容
@xsapi.route('/article/', methods=['POST', 'GET'])
def get_article():
    '''
    根据ID获取文章内容。
    使用GET方法请求。
    id:
        文章ID
    type:
        0 - 文章
        1 - 公告
    '''
    if request.method == 'GET':
        id = request.args.get('id')
        type = request.args.get('type')
        if str(type) == '0':
            json = LatestArticle.NewsContent(id)
        elif str(type) == '1':
            json = LatestArticle.BoardContent(id)
        else:
            json = 'Wrong Type!'
    return Response(json, mimetype='application/json')

# 获取家校互动内容

@xsapi.route('/publiccontent/comments/bypage/', methods=['POST', 'GET'])
def get_comments():
    '''
    按页获取家校互动内容（每页十个）。
    使用GET方法请求。
    page:
        页码
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        data = PublicContent.Comments(page)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "ques" : i[0],
            "time" : i[1],
            "reply" : i[2],
            "isreplied" : i[3],
            "department" : i[4]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

@xsapi.route('/publiccontent/comments/bypn/', methods=['POST', 'GET'])
def get_comments_pn():
    '''
    根据每页条数和页码获取家校互动内容。
    使用GET方法请求。
    page:
        页码
    n:
        每页条数
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        n = request.args.get('n')
        data = PublicContent.CommentsQuantityProc(page,n)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "ques" : i[0],
            "time" : i[1],
            "reply" : i[2],
            "isreplied" : i[3],
            "department" : i[4]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

# 获取公告列表

@xsapi.route('/publiccontent/board/bypage/', methods=['POST', 'GET'])
def get_board():
    '''
    按页获取公告列表（每页十个）。
    使用GET方法请求。
    page:
        页码
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        data = PublicContent.Board(page)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "title" : i[0],
            "time" : i[1],
            "id" : i[2]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

@xsapi.route('/publiccontent/board/bypn/', methods=['POST', 'GET'])
def get_board_pn():
    '''
    根据每页条数和页码获取公告列表。
    使用GET方法请求。
    page:
        页码
    n:
        每页条数
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        n = request.args.get('n')
        data = PublicContent.BoardQuantityProc(page,n)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "title" : i[0],
            "time" : i[1],
            "id" : i[2]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

# 获取最新文章列表

@xsapi.route('/publiccontent/alllatest/bypage/', methods=['POST', 'GET'])
def get_alllatest():
    '''
    按页获取全部板块最新文章列表（每页十个）。
    使用GET方法请求。
    page:
        页码
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        data = PublicContent.AllLatest(page)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "title" : i[0],
            "time" : i[1],
            "id" : i[2]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

@xsapi.route('/publiccontent/alllatest/bypn/', methods=['POST', 'GET'])
def get_alllatest_pn():
    '''
    根据每页条数和页码获取全部板块最新文章列表。
    使用GET方法请求。
    page:
        页码
    n:
        每页条数
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        n = request.args.get('n')
        data = PublicContent.AllLatestQuantityProc(page,n)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "title" : i[0],
            "time" : i[1],
            "id" : i[2]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

# 获取校务公开列表

@xsapi.route('/publiccontent/schoolaffair/bypage/', methods=['POST', 'GET'])
def get_schoolaffair():
    '''
    按页获取校务公开列表（每页十个）。
    使用GET方法请求。
    page:
        页码
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        data = PublicContent.SchoolAffair(page)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "title" : i[0],
            "time" : i[1],
            "id" : i[2]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

@xsapi.route('/publiccontent/schoolaffair/bypn/', methods=['POST', 'GET'])
def get_schoolaffair_pn():
    '''
    根据每页条数和页码获取校务公开列表。
    使用GET方法请求。
    page:
        页码
    n:
        每页条数
    '''
    if request.method == 'GET':
        page = request.args.get('page')
        n = request.args.get('n')
        data = PublicContent.SchoolAffairQuantityProc(page,n)
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "title" : i[0],
            "time" : i[1],
            "id" : i[2]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

# 首页摘要
@xsapi.route('/publiccontent/homepagebrief/', methods=['POST', 'GET'])
def get_homepagebrief():
    if request.method == 'GET':
        data = PublicContent.HomePageBrief()
    jsondict = {
        "code" : 200,
        "data" : {
            "cnt" : len(data),
            "list" : []
        }
    }
    for i in data:
        listmem = {
            "title" : i[0],
            "time" : i[1],
            "id" : i[2]
        }
        jsondict['data']['list'].append(listmem)
    j = json.dumps(jsondict, ensure_ascii=0)
    return Response(j, mimetype='application/json')

# 登录及用户相关

@xsapi.route('/user/userinfo', methods=['POST', 'GET'])
# /user/userinfo
def userinfo():
    #
    #使用GET方法请求。
    #secret:
    #    AppSecret
    #
    if request.method == 'GET':
        secret = request.args.get('secret')
        data = LoginManage.getUserInf(secret)
    infstat = json.dumps(data, ensure_ascii=0)
    return Response(infstat, mimetype='application/json')

@xsapi.route('/login/student', methods=['POST', 'GET'])
def login():
    '''
    使用GET方法请求。
    user:
        用户
    password:
        密码
    method：
        身份
    '''
    if request.method == 'GET':
        user = request.args.get('user')
        pwd = request.args.get('password')
        method = request.args.get('method')
        data = LoginManage.Login(user,pwd,method)
    loginstat = json.dumps(data, ensure_ascii=0)
    return Response(loginstat, mimetype='application/json')

@xsapi.route('/login/status', methods=['POST', 'GET'])
def loginStatus():
    '''
    使用GET方法请求。
    secret:
        AppSecret
    '''
    if request.method == 'GET':
        secret = request.args.get('secret')
        data = LoginManage.ChickAuth(LoginManage.PickCookie(secret)["data"])
        if data:
            stat={"code":200}
        else:
            stat={"code":400}
    status = json.dumps(stat, ensure_ascii=0)
    return Response(status, mimetype='application/json')

if __name__ == '__main__':
    xsapi.debug = True
    xsapi.run(host="0.0.0.0")