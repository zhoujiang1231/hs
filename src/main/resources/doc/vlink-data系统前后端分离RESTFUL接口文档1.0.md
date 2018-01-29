#    vlink-data接口文档设计1.0

# 目录

[数据结构返回示例](#返回数据结构示例)

[&emsp;&emsp;请求参数格式](#请求参数格式)

[&emsp;&emsp;返回数据结构说明](#返回数据结构说明)

[&emsp;&emsp;page详细说明](#page详细说明)

[公共接口](#公共接口)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户对应应用初始化](#客户对应应用初始化)

[&emsp;&emsp;删除企业帐号](#删除企业帐号)

[&emsp;&emsp;获取上传文件列表](#获取上传文件列表)

[&emsp;&emsp;上传文件](#上传文件)

[&emsp;&emsp;删除文件相关数据](#删除文件相关数据)

[&emsp;&emsp;下载文件](#下载文件)

[预留接口](#预留接口)

[&emsp;&emsp;删除扣费日志](#删除扣费日志)

[登录相关接口](#登录相关接口)

[&emsp;&emsp;获取验证码](#获取验证码)

[&emsp;&emsp;登录](#登录)

[首页相关接口](#首页相关接口)

[&emsp;&emsp;获取当前登录用户所有app信息](#获取当前登录用户所有app信息)

[&emsp;&emsp;扣费](#扣费)

[&emsp;&emsp;预扣费](#预扣费)

[应用报表相关接口](#应用报表相关接口)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户对应应用初始化](#客户对应应用初始化)

[&emsp;&emsp;获取报表数据](#获取报表数据)

[通话记录相关接口](#通话记录相关接口)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户对应应用初始化](#客户对应应用初始化)

[&emsp;&emsp;获取通话记录数据](#获取通话记录数据)

[&emsp;&emsp;导出功能](#导出功能)

[直销部门管理相关接口](#直销部门管理相关接口)

[&emsp;&emsp;获取所有直销部门](#获取所有直销部门)

[&emsp;&emsp;获取直销部门详细信息](#获取直销部门详细信息)

[&emsp;&emsp;新建直销部门](#新建直销部门)

[&emsp;&emsp;删除直销部门](#删除直销部门)

[&emsp;&emsp;修改直销部门信息](#修改直销部门信息)

[直销经理管理相关接口](#直销经理管理相关接口)

[&emsp;&emsp;初始化所属部门下拉框](#初始化所属部门下拉框)

[&emsp;&emsp;获取直销部门详细信息](#获取直销部门详细信息)

[&emsp;&emsp;查询](#查询)

[&emsp;&emsp;获取直销经理详细信息](#获取直销经理详细信息)

[&emsp;&emsp;删除直销经理](#删除直销经理)

[&emsp;&emsp;新建直销经理](#新建直销经理)

[&emsp;&emsp;修改直销经理信息](#修改直销经理信息)

[企业管理相关接口](#企业管理相关接口)

[&emsp;&emsp;初始化所属部门下拉框](#初始化所属部门下拉框)

[&emsp;&emsp;获取所属部门所属经理](#获取所属部门所属经理)

[&emsp;&emsp;根据条件查询企业](#根据条件查询企业)

[&emsp;&emsp;获取企业信息](#获取企业信息)

[&emsp;&emsp;&emsp;&emsp;企业基本信息](#企业基本信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取企业基本信息](#获取企业基本信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取上传文件列表](#获取上传文件列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;上传文件](#上传文件)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改企业基本信息](#修改企业基本信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除文件相关数据](#删除文件相关数据)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;下载文件](#下载文件)

[&emsp;&emsp;&emsp;&emsp;企业业务信息](#企业业务信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取企业基本信息](#获取企业基本信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;初始化所属部门下拉框](#初始化所属部门下拉框)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取所属部门所属经理](#获取所属部门所属经理)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改企业基本信息](#修改企业基本信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改企业月消费](#修改企业月消费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改本月折扣](#修改本月折扣)

[&emsp;&emsp;&emsp;&emsp;企业应用管理](#企业应用管理)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;新建应用](#新建应用)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除应用](#删除应用)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取账户对应的应用](#获取账户对应的应用)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;查看应用信息](#查看应用信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除文件相关数据](#删除文件相关数据)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取上传文件列表](#获取上传文件列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;上传文件](#上传文件)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改应用信息](#修改应用信息)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;配置应用](#配置应用)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;呼入资费](#呼入资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取呼入资费列表](#获取呼入资费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条呼入资费](#删除一条呼入资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;增加一条呼入资费](#增加一条呼入资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改呼入资费](#修改呼入资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;呼入转接资费](#呼入转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取呼入转接资费列表](#获取呼入转接资费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条呼入转接资费](#删除一条呼入转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;增加一条呼入转接资费](#增加一条呼入转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改呼入转接资费](#修改呼入转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;外呼资费](#外呼资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取外呼资费列表](#获取外呼资费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条外呼资费](#删除一条外呼资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;增加一条外呼资费](#增加一条外呼资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改外呼资费](#修改外呼资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;外呼转接资费](#外呼转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取外呼转接资费列表](#获取外呼转接资费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条外呼转接资费](#删除一条外呼转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;增加一条外呼转接资费](增加一条外呼转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改外呼转接资费](#修改外呼转接资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;短信资费](#短信资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取短信资费列表](#获取短信资费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条短信资费](#删除一条短信资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;增加一条短信资费](#增加一条短信资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改短信资费](#修改短信资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;ussd资费](#ussd资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取ussd资费列表](#获取ussd资费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条ussd资费](#删除一条ussd资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;增加一条ussd资费](#增加一条ussd资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改ussd资费](#修改ussd资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;vnc资费](#vnc资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取vnc资费列表](#获取vnc资费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条vnc资费](#删除一条vnc资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;增加一条vnc资费](#增加一条vnc资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改vnc资费](#修改vnc资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;vos资费](#vos资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取vos资费](#获取vos资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改vos资费](#修改vos资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;应用最低月消费](#应用最低月消费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取应用最低月消费](#获取应用最低月消费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改应用最低月消费](#修改应用最低月消费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;应用低消配置](#应用低消配置)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取应用当前月低消](#获取应用当前月低消)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;呼入低消资费](#呼入低消资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取/搜索呼入低消资费](#获取/搜索呼入低消资费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改一条呼入低消资费/批量修改](#修改一条呼入低消资费/批量修改)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;同步](#同步)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;号码功能费](#号码功能费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取/搜索号码功能费](#获取/搜索号码功能费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改一条号码功能费/批量修改](#修改一条号码功能费/批量修改)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;同步](#同步)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;功能费](#功能费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;获取功能费列表](#获取功能费列表)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;修改一条功能费/批量修改](#修改一条功能费/批量修改)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;添加一条功能费](#添加一条功能费)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;删除一条功能费](#删除一条功能费)

[&emsp;&emsp;删除企业](#删除企业)

[&emsp;&emsp;新建企业](#新建企业)

[应用管理相关接口](#应用管理相关接口)

[&emsp;&emsp;查询功能](#查询功能)

[&emsp;&emsp;修改资费设置](#修改资费设置)

[&emsp;&emsp;&emsp;&emsp;初始化页面](#初始化页面)

[&emsp;&emsp;&emsp;&emsp;修改自定义应用配置](#修改自定义应用配置)

[&emsp;&emsp;&emsp;&emsp;修改短信应用配置](#修改短信应用配置)

[&emsp;&emsp;&emsp;&emsp;修改总分机应用配置](#修改总分机应用配置)

[&emsp;&emsp;&emsp;&emsp;修改两端回呼应用配置](#修改两端回呼应用配置)

[&emsp;&emsp;&emsp;&emsp;修改ussd应用配置](#修改ussd应用配置)

[&emsp;&emsp;&emsp;&emsp;修改语音通知应用配置](#修改语音通知应用配置)

[&emsp;&emsp;&emsp;&emsp;修改语音验证码应用配置](#修改语音验证码应用配置)

[&emsp;&emsp;&emsp;&emsp;修改vos应用配置](#修改vos应用配置)

[消费日志相关接口](#消费日志相关接口)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户简称下拉框初始化](#客户简称下拉框初始化)

[&emsp;&emsp;查询消费日志](#查询消费日志)

[&emsp;&emsp;&emsp;&emsp;查看应用扣费日志](#查看应用扣费日志)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;查看应用扣费详情](#查看应用扣费详情)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;查看呼入扣费日志](#查看呼入扣费日志)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;查看号码功能费日志](#查看号码功能费日志)

[预消费日志相关接口](#预消费日志相关接口)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户简称下拉框初始化](#客户简称下拉框初始化)

[&emsp;&emsp;查询预消费日志](#查询预消费日志)

[&emsp;&emsp;&emsp;&emsp;查看应用扣费日志](#查看应用扣费日志)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;查看应用扣费详情](#查看应用扣费详情)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;查看呼入扣费日志](#查看呼入预扣费日志)

[&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;查看号码功能费日志](#查看号码功能费预扣费日志)

[&emsp;&emsp;导出功能](#导出功能)

[账单统计相关接口](#账单统计相关接口)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户简称下拉框初始化](#客户简称下拉框初始化)

[&emsp;&emsp;查询账单](#查询账单)

[外呼统计](#外呼统计)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户简称下拉框初始化](#客户简称下拉框初始化)

[&emsp;&emsp;查询](#查询)

[呼入统计](#呼入统计)

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

[&emsp;&emsp;客户简称下拉框初始化](#客户简称下拉框初始化)

[&emsp;&emsp;查询](#查询)

[查询操作日志](#查询操作日志)



# 数据结构示例

## 请求参数格式

Content-Type:application/json

## 返回数据结构说明：

| 字段          | 说明                          |
| ----------- | --------------------------- |
| result      | 请求状态码：0表示成功；1表示失败；10表示当前未登录 |
| description | 状态描述如请求成功或者密码错误等信息          |
| list        | 具体数据                        |
| data        | 具体数据                        |
| page        | 用于分页等功能的参数如页数、记录总数          |

请求成功返回示例：

	{
		"result": "0",
		"description": "success",
		"list": null,
		"data": null,
		"page": null
	}

请求失败返回示例：

	{
		"result": "1",
		"description": "系统发生异常",
		"list": null,
		"data": null,
		"page": null
	}
## page详细说明：

| 字段名            | 字段类型    | 说明     |
| -------------- | ------- | ------ |
| start          | Integer | 开始记录数  |
| pageSize       | Integer | 页面记录总数 |
| totalCount     | Integer | 总记录数   |
| currentPageNo  | Integer | 当前页面编号 |
| totalPageCount | Integer | 总页数    |

# 公共接口

## 客户下拉框初始化

| 接口地址 | /vlinkAccount |
| ---- | ------------- |
| 方法   | GET           |
| 请求参数 | 无             |

- 返回结果

      {
          "result": "0",
          "description": "success",
          "list": [
              {
                  "id": 1289,
                  "accountName": null,
                  "accountPwd": null,
                  "type": null,
                  "level": null,
                  "accountFullName": null,
                  "fullName": "彪洋科技（北京）有限公司",
                  "shortName": null,
                  "principal": null,
                  "mobile": null,
                  "tel": null,
                  "email": null,
                  "status": null,
                  "parentId": null,
                  "parentName": null,
                  "parentParentId": null,
                  "parentParentName": null,
                  "currentMoney": null,
                  "rebate": null,
                  "minCost": null,
                  "minCostStartMonth": null,
                  "currentMinCost": null,
                  "createTime": null,
                  "uptime": null,
                  "appCount": null,
                  "businessNo": null,
                  "legalPerson": null,
                  "registAddress": null,
                  "businessUpFlag": null
              }
              ···
                 ],
          "data": null,
          "page": null
      }

list详细说明：

| 字段       | 数据类型    | 说明   |
| -------- | ------- | ---- |
| id       | Integer | 企业id |
| fullName | String  | 企业名称 |



## 客户对应应用初始化

| 接口地址 | /vlinkAccount/vlinkApps |
| ---- | ----------------------- |
| 方法   | GET                     |

- 请求参数（json）

  | 字段        | 是否必须 | 数据类型    | 说明   |
  | --------- | ---- | ------- | ---- |
  | accountId | 是    | Integer | 企业id |

- 返回结果

  ```
  {
  "result": "0",
  "description": "success",
  "list": [
      {
          "id": 623,
          "vlinkAccountId": 1289,
          "vlinkAccountShortName": null,
          "appId": 5000551,
          "appName": "总分机",
          "createTime": 1498794122659,
          "data": null,
          "webCallTotal": null,
          "answeredCount": null,
          "answerRate": null,
          "uptime": null,
          "type": "总分机",
          "safetyLevel": null,
          "status": 4,
          "contractCount": null,
          "minCost": null
      }
  ],
  "data": null,
  "page": null
  }
  ```
  list详细说明：

  | 字段             | 数据类型     | 说明                           |
  | -------------- | -------- | ---------------------------- |
  | id             | Integer  | 主键                           |
  | vlinkAccountId | Integer  | 企业id                         |
  | appId          | Integer  | 应用Id                         |
  | appName        | String   | 应用名称                         |
  | createTime     | Date     | 创建时间                         |
  | uptime         | Date     | 上线时间                         |
  | type           | String   | 账号类型 1管理员2 直销部门3直销经理4 客户（企业） |
  | safetyLevel    | Integer  | 安全等级                         |
  | status         | Integer  | 实体状态：1正常，2暂停，3锁定，4注销 只用于控制登录 |
  | data           | JsonNode |                              |

## 删除企业帐号

| 接口地址 | /vlinkAccount |
| ---- | ------------- |
| 方法   | DELETE        |

- 请求参数

  | 字段名       | 是否必须 | 字段类型   | 说明   |
  | --------- | ---- | ------ | ---- |
  | accountId | 是    | String | 企业id |


- 返回结果

```
{
	"result": "0",
 	 "description": "success",
 	 "list": null,
 	 "data": null,
 	 "page": null
}
```



## 获取上传文件列表

| 请求地址 | /customer/files |
| ---- | --------------- |
| 请求方法 | GET             |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明   |
| --------- | ---- | ------- | ---- |
| accountId | 是    | Integer | 企业id |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": [
          {
              "id": 1732,
              "type": "1",
              "accountId": 1316,
              "appId": null,
              "fileName": "法人身份证(货拉拉).jpg",
              "path": "/uploadFiles/20170913161439.jpg",
              "description": null,
              "createTime": 1505290479626
          },
          {
              "id": 1733,
              "type": "1",
              "accountId": 1316,
              "appId": null,
              "fileName": "经办人身份证(货拉拉).jpg",
              "path": "/uploadFiles/20170913161455.jpg",
              "description": null,
              "createTime": 1505290495520
          }
      ],
   	 "data": null,
   	 "page": null
  }
  ```

## 上传文件

| 请求地址 | /customer/file |
| ---- | -------------- |
| 请求方法 | POST           |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明   |
| --------- | ---- | ------- | ---- |
| accountId | 是    | Integer | 企业id |
| appId     | 否    | Integer | 应用id |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
## 删除文件相关数据

| 请求地址 | /customer/file |
| ---- | -------------- |
| 请求方法 | DELETE         |

- 请求参数

| 字段名  | 是否必须 | 字段类型    | 说明            |
| ---- | ---- | ------- | ------------- |
| id   | 是    | Integer | filePath表主键id |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

## 下载文件

| 请求地址 | /customer/file |
| ---- | -------------- |
| 请求方法 | GET            |
| 返回结果 | 图片             |

- 请求参数

| 字段名  | 是否必须 | 字段类型    | 说明            |
| ---- | ---- | ------- | ------------- |
| id   | 是    | Integer | filePath表主键id |

# 预留接口

## 删除扣费日志

| 接口地址 | /paylog |
| ---- | ------- |
| 请求方法 | DELETE  |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明     |
| --------- | ---- | ------- | ------ |
| accountId | 是    | Integer | 企业id   |
| logId     | 是    | Integer | 日志记录id |

- 返回结果

```
{
	"result": "0",
 	 "description": "success",
 	 "list": null,
 	 "data": null,
 	 "page": null
}
```

# 登录相关接口

## 获取验证码

| 接口地址 | /securityCode |
| ---- | ------------- |
| 方法   | GET           |
| 请求参数 | 无             |
| 返回结果 | 验证码图片         |

## 登录

| 接口地址 | /login |
| ---- | ------ |
| 方法   | POST   |

- 请求参数：

| 参数名          | 是否必须 | 数据类型   | 说明       |
| ------------ | ---- | ------ | -------- |
| userName     | 是    | String | 用户名      |
| password     | 是    | String | 密码       |
| securityCode | 是    | String | 用户输入的验证码 |

- 返回结果：

      {
      "result": "0",
      "description": "success",
      "list": [
        {
        	"id":1316,
        	"accountName":huolala,
          "accountPwd":****,
          "type":3,
          "accountFullName":广州依时货拉拉科技有限公司,
          "fullName":广州依时货拉拉科技有限公司,
          "shortName":货拉拉,
          "principal":1,
          "mobile":null,
          "tel":null,
          "email":null,
          "status":5,
          "parentId":1021,
          "currentMoney":110000,
          "createTime":2017-09-13 16:08:32,
          "legalPperson":邓康乔,
          "registAddress":广州市海珠区琶洲大道东8号904房、905房（仅限办公用途）,
          "businessNo":91440101329527377D,
          "uptime":2017-12-25 11:12:49
          }
          ···
      ],
      "data": null,
      "page": null
      }
- 返回结果字段详细说明：

| 字段              | 数据类型       | 说明                           |
| --------------- | ---------- | ---------------------------- |
| id              | Integer    | 帐号id                         |
| accountName     | String     | 登录名                          |
| accountPwd      | String     | 密码                           |
| type            | Integer    | 账号类型 1管理员2 直销部门3直销经理4 客户（企业） |
| accountFullName | String     | 账户全称                         |
| fullName        | String     | vlink帐号对应企业名称                |
| shortName       | String     | 简称                           |
| principal       | String     | 负责人姓名                        |
| mobile          | String     | 移动电话                         |
| tel             | String     | 固定电话                         |
| email           | String     | 电子信箱                         |
| status          | Integer    | 实体状态：1正常，2暂停，3锁定，4注销 只用于控制登录 |
| parentId        | Integer    | 上级id                         |
| currentMoney    | BigDecimal | 当前金额，即充值后余额                  |
| createTime      | Date       | 创建时间                         |
| legalPperson    | String     | 法人代表                         |
| registAddress   | String     | 注册地址                         |
| businessNo      | String     | 营业执照号码                       |
| uptime          | Date       | 上线时间                         |

# 首页相关接口

## 获取当前登录用户所有app信息

| 接口地址 | /vlinkAccount/app |
| ---- | ----------------- |
| 方法   | GET               |

请求参数：

| 字段        | 是否必须 | 数据类型    | 说明           |
| --------- | ---- | ------- | ------------ |
| accountId | 是    | Integer | 必须为当前登录企业的id |

- 返回结果

      {
          "result": "0",
          "description": "success",
          "list": [
              {
                  "id": 672,
                  "vlinkAccountId": 1288,
                  "vlinkAccountShortName": null,
                  "appId": 5000592,
                  "appName": "两端呼测试",
                  "createTime": 1505707091285,
                  "data": null,
                  "webCallTotal": null,
                  "answeredCount": null,
                  "answerRate": null,
                  "uptime": null,
                  "type": "双向回呼",
                  "safetyLevel": null,
                  "status": 2,
                  "contractCount": null,
                  "minCost": null
              }
              ···
          ],
          "data": null,
          "page": null
      }

  list详细说明:

  | 字段                    | 数据类型     | 说明             |
  | --------------------- | -------- | -------------- |
  | id                    | Integer  | 主键Id           |
  | vlinkAccountId        | Integer  | 企业id           |
  | vlinkAccountShortName | String   | 企业简称           |
  | appId                 | Integer  | 应用Id           |
  | appName               | String   | 应用名称           |
  | createTime            | Date     | 创建时间           |
  | data                  | JsonNode | app对应token     |
  | webCallTotal          | Integer  | 今日呼叫量          |
  | answeredCount         | Integer  | 今日接通量          |
  | answerRate            | String   | 今日接通率          |
  | uptime                | Date     | 上线时间           |
  | type                  | String   | 应用类型           |
  | safetyLevel           | Integer  | 安全等级 1安全2一般3危险 |
  | status                | Integer  | 应用状态           |
  | contractCount         | Integer  | 合同数量           |
  | minCost               | String   | 应用月低消          |

## 扣费


| 接口地址 | /customerDeductLog |
| ---- | ------------------ |
| 方法   | POST               |

- 请求参数（json）

  | 字段         | 是否必须 | 数据类型     | 说明         |
  | ---------- | ---- | -------- | ---------- |
  | customerId | 否    | String[] | 企业id，以逗号分隔 |


- 返回结果
```
    {
    		"result": "0",
    		"description": "success",
    		"list": null,
    		"data": null,
    		"page": null
    	}

```
## 预扣费

| 接口地址 | /preDeduct |
| ---- | ---------- |
| 方法   | POST       |

- 请求参数（json）

  | 字段         | 是否必须 | 数据类型     | 说明         |
  | ---------- | ---- | -------- | ---------- |
  | customerId | 否    | String[] | 企业id，以逗号分隔 |


- 返回结果
```
   {
   	    "result": "0",
   	    "description": "success",
   	    "list": null,
   	    "data": null,
   	    "page": null
   	}
```
# 应用报表相关接口

## 客户下拉框初始化

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

## 客户对应应用初始化

[&emsp;&emsp;客户对应应用初始化](#客户对应应用初始化)

## 获取报表数据

| 接口地址 | /useTables |
| ---- | ---------- |
| 方法   | GET        |

- 请求参数

  | 字段        | 是否必须 | 数据类型   | 说明                  |
  | --------- | ---- | ------ | ------------------- |
  | accountId | 是    | String | 企业id                |
  | appId     | 是    | String | 应用Id                |
  | rptType   | 是    | String | 报表类型1：日报表2：周报表3：月报表 |
  | startTime | 是    | String | 开始日期                |
  | endTime   | 是    | String | 结束日期                |
  | rptOut    | 是    | String | 显示方式0分时1分日2汇总       |
  | start     | 否    | String | 分页参数：开始记录数          |
  | limit     | 否    | String | 分页参数：页面总记录数         |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "appId": null,
              "appName": null,
              "createTime": null,
              "webCallTotal": null,
              "answeredCount": null,
              "lostCallOffered": null,
              "answerRate": null,
              "totalDuration": null,
              "billDuration": null,
              "bridgeDuration": null,
              "dateTime": null,
              "callCharge": null
          }
      ],
      "data": null,
      "page": {
          "start": 0,
          "pageSize": 0,
          "totalCount": 0,
          "currentPageNo": 1,
          "totalPageCount": 0
      }
  }
  ```

  list详细说明：

  | 字段              | 数据类型    | 说明   |
  | --------------- | ------- | ---- |
  | appId           | String  | 应用id |
  | appName         | String  | 应用名称 |
  | createTime      | String  | 创建时间 |
  | dateTime        | String  | 统计时段 |
  | webCallTotal    | Integer | 呼叫数量 |
  | answeredCount   | Integer | 接通数量 |
  | lostCallOffered | Integer | 未接数量 |
  | answerRate      | String  | 接通率  |
  | totalDuration   | String  | 通话时长 |
  | billDuration    | String  | 接听时长 |
  | bridgeDuration  | String  | 桥接时长 |
  | callCharge      | String  | 话费   |


# 通话记录相关接口

## 客户下拉框初始化

[&emsp;&emsp;客户下拉框初始化](#客户下拉框初始化)

## 客户对应应用初始化

[&emsp;&emsp;客户对应应用初始化](#客户对应应用初始化)

## 获取通话记录数据

| 接口地址 | /callRecords |
| ---- | ------------ |
| 方法   | GET          |

- 请求参数（json）

  | 字段               | 是否必须 | 数据类型    | 说明                                       |
  | ---------------- | ---- | ------- | ---------------------------------------- |
  | appId            | 是    | Integer | 应用id                                     |
  | cdrInstance      | 否    | String  | 号码类型                                     |
  | cdrInstanceValue | 否    | String  | 号码                                       |
  | callType         | 是    | Integer | 呼叫类型1呼出2呼入                               |
  | status           | 是    | Integer | 接听状态21未接通22已接通23已呼转24呼转已桥接1呼转接听2已呼转未接听3系统接听4系统未接听 |
  | startTime        | 是    | String  | 开始时间                                     |
  | endTime          | 是    | String  | 结束时间                                     |
  | searchDate       | 否    | String  | 快捷查询0：今天-1：昨天-6：一周-29：一月                 |
  | start            | 否    | Integer | 分页参数：开始记录数                               |
  | limit            | 否    | Integer | 分页参数：页面大小                                |

  ​

- 返回结果(外呼)

    	   ｛
    	   "result": "0",
    	    "description": "success",
    	    "list": [
    	        {
    	            "appId": 5000039,
    	            "customerNumber": "13264506545",
    	            "customerAreaCode": "010",
    	            "customerAddress": "北京-北京",
    	            "customerOperators": "",
    	            "customerClidNumber": "02180206526",
    	            "customerClidAreaCode": "",
    	            "customerClidAddress": "",
    	            "bridgeNumber": "",
    	            "bridgeAreaCode": "",
    	            "bridgeAddress": "",
    	            "bridgeOperators": "",
    	            "bridgeClidNumber": "",
    	            "bridgeClidAreaCode": "",
    	            "bridgeClidAddress": "",
    	            "requestTime": 1514379838,
    	            "requestTimeStr": "2017-12-27 21:03:58",
    	            "startTime": 1514379838,
    	            "startTimeStr": "2017-12-27 21:03:58",
    	            "answerTime": 1514379847,
    	            "answerTimeStr": "2017-12-27 21:04:07",
    	            "dialTime": 0,
    	            "dialTimeStr": "",
    	            "bridgeTime": 0,
    	            "bridgeTimeStr": "",
    	            "outEndTime": 1514379848,
    	            "bridgeEndTime": 1514379848,
    	            "endTime": 1514379848,
    	            "endTimeStr": "2017-12-27 21:04:08",
    	            "customerDurationS": 1,
    	            "customerDuration": 1,
    	            "bridgeDurationS": 1514379848,
    	            "bridgeDuration": 25239665,
    	            "totalDurationS": 10,
    	            "ivrName": "gzh_直呼测试",
    	            "status": 23,
    	            "statusDesc": "已呼转",
    	            "endPerson": "",
    	            "endReason": 1001,
    	            "monitorDurationS": 1,
    	            "telsetName": "",
    	            "recordFile": "record/20171227/5000039-20171227210358-13264506545-01012345678-record-jbe-1-1514379838.612.mp3",
    	            "customerRecordFile": "",
    	            "customerStatus": "",
    	            "asrRecordFile": "",
    	            "sipCause": 200,
    	            "callType": 2,
    	            "uniqueId": "jbe-1-1514379838.612",
    	            "userField": "",
    	            "createTime": null
    	        }
    	        ···
    	    ],
    	    "data": {
    	        "billDurationsTotal": 35,
    	        "bridgeDurationsTotal": 27,
    	        "totalNum": 38,
    	        "appId": "5000039",
    	        "timestamp": "1515031586",
    	        "sign": "ce6012cd0cc3d6b97f684d77173a6b67"
    	    },
    	    "page": {
    	        "start": 0,
    	        "pageSize": 10,
    	        "totalCount": 38,
    	        "currentPageNo": 1,
    	        "totalPageCount": 4
    	    }
    	}
     list详细说明（外呼）

| 字段                   | 数据类型       | 说明                             |
| -------------------- | ---------- | ------------------------------ |
| appId                | Integer    | 应用id                           |
| customerNumber       | String     | 外呼号码                           |
| customerAreaCode     | String     | 外呼号码区号                         |
| customerAddress      | String     | 外呼号码所属地                        |
| customerOperators    | String     | 外呼号码所属运营商                      |
| customerClidNumber   | String     | 外呼外显号码                         |
| customerClidAreaCode | String     | 外呼外显号码区号                       |
| customerClidAddress  | String     | 外呼外显号码所属地                      |
| bridgeNumber         | String     | 转接号码                           |
| bridgeAreaCode       | String     | 转接号码区号                         |
| bridgeAddress        | String     | 转接号码所属地                        |
| bridgeOperators      | String     | 转接号码所属运营商                      |
| bridgeClidNumber     | String     | 转接外显号码                         |
| bridgeClidAreaCode   | String     | 转接外显号码区号                       |
| bridgeClidAddress    | String     | 转接外显号码所属地                      |
| requestTime          | BigInteger | 外呼开始时间                         |
| requestTimeStr       | String     | 外呼开始时间yyyy-MM-dd HH:mm:ss字符串格式 |
| startTime            | BigInteger | 会话开始时间                         |
| startTimeStr         | String     | 会话开始时间字符串格式                    |
| answerTime           | BigInteger | 外呼接通时间                         |
| answerTimeStr        | String     | 外呼接通时间字符串格式                    |
| dialTime             | BigInteger | 转接开始时间                         |
| dialTimeStr          | String     | 转接开始时间字符串格式                    |
| bridgeTime           | BigInteger | 转接接通时间                         |
| bridgeTimeStr        | String     | 转接接通时间字符串格式                    |
| outEndTime           | BigInteger | 外呼号码挂机时间                       |
| bridgeEndTime        | BigInteger | 转接号码挂机时间                       |
| endTime              | BigInteger | 通话结束时间                         |
| endTimeStr           | String     | 通话结束时间字符串格式                    |
| customerDurationS    | Integer    | 外呼通话时长                         |
| customerDuration     | Integer    | 外呼通话分钟                         |
| bridgeDurationS      | Integer    | 转接通话时长                         |
| bridgeDuration       | Integer    | 转接通话分钟                         |
| totalDurationS       | Integer    | 总时长                            |
| ivrName              | String     | 语音导航名称                         |
| status               | Integer    | 通话状态                           |
| statusDesc           | String     | 通话状态汉字描述                       |
| endPerson            | String     | 桥接挂断方                          |
| endReason            | Integer    | 通话结束原因                         |
| monitorDurationS     | Integer    | 录音时长                           |
| telsetName           | String     | 电话组名                           |
| recordFile           | String     | 通话录音                           |
| customerRecordFile   | String     | 外呼彩铃录音                         |
| customerStatus       | String     | 外呼号码状态                         |
| asrRecordFile        | String     | 转接彩铃录音                         |
| sipCause             | Integer    | 转接号码状态                         |
| callType             | Integer    | 呼叫类型                           |
| uniqueId             | String     | 通话唯一标识                         |
| userField            | String     | 自定义字段                          |
| createTime           | Date       | 创建时间                           |

list详细说明（呼入）

| 字段                | 数据类型       | 说明                             |
| ----------------- | ---------- | ------------------------------ |
| appId             | Integer    | 应用id                           |
| customerNumber    | String     | 呼入号码                           |
| customerAreaCode  | String     | 呼入号码区号                         |
| customerAddress   | String     | 呼入号码所属地                        |
| customerOperators | String     | 外呼号码所属运营商                      |
| accessNumber      | String     | 接入号码                           |
| accessAreaCode    | String     | 接入号码区号                         |
| accessAddress     | String     | 接入号码所属地                        |
| bridgeNumber      | String     | 转接号码                           |
| bridgeAreaCode    | String     | 转接号码区号                         |
| bridgeAddress     | String     | 转接号码所属地                        |
| bridgeOperators   | String     | 转接号码所属运营商                      |
| clidNumber        | String     | 转接外显号码                         |
| clidAreaCode      | String     | 转接外显号码区号                       |
| clidAddress       | String     | 转接外显号码所属地                      |
| startTime         | BigInteger | 进入系统时间                         |
| startTimeStr      | String     | 进入系统时间yyyy-MM-dd HH:mm:ss字符串格式 |
| answerTime        | BigInteger | 系统应答时间                         |
| answerTimeStr     | String     | 系统应答时间字符串格式                    |
| dialTime          | BigInteger | 转接开始时间                         |
| dialTimeStr       | String     | 转接开始时间字符串格式                    |
| bridgeTime        | BigInteger | 转接接通时间                         |
| bridgeTimeStr     | String     | 转接接通时间字符串格式                    |
| customerEndTime   | BigInteger | 呼入号码挂机时间                       |
| bridgeEndTime     | BigInteger | 转接号码挂机时间                       |
| endTime           | BigInteger | 通话结束时间                         |
| endTimeStr        | String     | 通话结束时间字符串格式                    |
| customerDurationS | Integer    | 呼入通话时长                         |
| customerDuration  | Integer    | 呼入通话时长                         |
| bridgeDurationS   | Integer    | 转接通话时长                         |
| bridgeDuration    | Integer    | 转接通话分钟                         |
| totalDurationS    | Integer    | 总时长                            |
| ivrName           | String     | 语音导航名称                         |
| status            | Integer    | 通话状态                           |
| statusDesc        | String     | 通话状态汉字描述                       |
| endPerson         | String     | 桥接挂断方                          |
| endReason         | Integer    | 通话结束原因                         |
| monitorDurationS  | Integer    | 录音时长                           |
| telsetName        | String     | 电话组名                           |
| recordFile        | String     | 通话录音                           |
| asrRecordFile     | String     | 转接彩铃录音                         |
| sipCause          | Integer    | 转接号码状态                         |
| callType          | Integer    | 呼叫类型                           |
| uniqueId          | String     | 通话唯一标识                         |
| userField         | String     | 自定义字段                          |
| createTime        | Date       | 创建时间                           |

data详细说明

| 字段名                  | 字段类型    | 说明      |
| -------------------- | ------- | ------- |
| billDurationsTotal   | long    | 账单总时长   |
| bridgeDurationsTotal | long    | 转接通话总时长 |
| totalNum             | long    | 总记录数    |
| appId                | Integer | 应用id    |
| timestamp            | String  | 时间戳     |
| sign                 | String  | 标记      |

## 导出功能

| 接口地址 | /callRecord/file |
| ---- | ---------------- |
| 方法   | GET              |

- 请求参数

  | 字段       | 是否必须 | 数据类型    | 说明              |
  | -------- | ---- | ------- | --------------- |
  | appId    | 是    | String  | 应用id            |
  | callType | 是    | Integer | 呼叫类型1呼出2呼入      |
  | selectId | 是    | Integer | 类型1：按日2：按月      |
  | chkDate  | 是    | Integer | 开始时间格式：20180101 |

- 返回结果

      {
      "result": "0",
      "description": "success",
      "list": null,
      "data": "http://54.222.162.136:8089?appId=5100046",
      "page": null
      }
  | 字段   | 数据类型   | 说明     |
  | ---- | ------ | ------ |
  | data | String | 文件下载地址 |

  ​

# 直销部门管理相关接口

## 获取所有直销部门

| 接口地址 | /directDepartments |
| ---- | ------------------ |
| 方法   | GET                |

- 请求参数

  | 字段名      | 是否必须 | 字段类型    | 说明        |
  | -------- | ---- | ------- | --------- |
  | start    | 否    | String  | 分页参数：开始   |
  | limit    | 否    | String  | 分页参数：页面大小 |
  | fullName | 否    | String  | 企业名称      |
  | status   | 否    | Integer | 企业状态      |


- 返回结果

  ```
  {
    "result": "0",
    "description": "success",
    "list": [{
            accountName:"damiweilai"
            accountPwd:null
            appNum:0
            createTime:1499159406771
            customerNum:0
            email:""
            fullName:"北京大米未来科技有限公司"
            id:1290
            managerNum:0
            mobile:""
            status:5
            tel:""
            type:"4" }],
    "data": null,
    "page": 
    ｛	
    		currentPageNo:1
  		pageSize:10
          start:0
          totalCount:12
          totalPageCount:2
          ｝
  }
  ```

  ​

## 获取直销部门详细信息

| 接口地址 | /directDepartment |
| ---- | ----------------- |
| 请求方法 | GET               |

- 请求参数

  | 字段名       | 是否必须 | 字段类型    | 说明   |
  | --------- | ---- | ------- | ---- |
  | accountId | 是    | Integer | 企业id |


- 返回结果

```
{
	"result": "0",
 	 "description": "success",
 	 "list":null
     "page": null，
 	 "data": ｛
 	 		accountFullName:null
            accountName:"damiweilai"
            accountPwd:"6898454ac3fe49feb35bd59c5719ae59"
            businessNo:91110108396039429X
            createTime:1499159406771
            currentMoney:-7495.2
            email:""
            fullName:"北京大米未来科技有限公司"
            id:1290
            legalPperson:米雯
            mobile:""
            parentId:1042
            principal:"1"
            registAddress:"北京市海淀区中关村大街19号5层508"
            shortName:"大米未来"
            status:5
            tel:""
            type:4
            uptime:1499160708000
			｝
}
```



## 新建直销部门

| 接口地址 | /directDepartment |
| ---- | ----------------- |
| 方法   | POST              |

- 请求参数

  | 字段名         | 是否必须 | 字段类型   | 说明   |
  | ----------- | ---- | ------ | ---- |
  | accountName | 是    | String | 登录名  |
  | fullName    | 否    | String | 全称   |
  | principal   | 否    | String | 负责人  |
  | email       | 否    | String | 邮箱   |
  | mobile      | 否    | String | 手机   |
  | tel         | 否    | String | 电话   |
  | password    | 是    | String | 密码   |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

## 删除直销部门

[&emsp;&emsp;删除企业帐号](#删除企业帐号)

## 修改直销部门信息

| 接口地址 | /directDepartment |
| ---- | ----------------- |
| 方法   | PUT               |

- 请求参数

  | 字段名         | 是否必须 | 字段类型    | 说明   |
  | ----------- | ---- | ------- | ---- |
  | accountId   | 是    | Integer | 账户id |
  | fullName    | 否    | String  | 全称   |
  | accountName | 否    | String  | 登录名  |
  | email       | 否    | String  | 邮箱   |
  | mobile      | 否    | String  | 手机   |
  | tel         | 否    | String  | 电话   |
  | accountPwd  | 否    | String  | 密码   |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

  ​

# 直销经理管理相关接口

## 初始化所属部门下拉框

| 接口地址 | /directDepartmentIdAndName |
| ---- | -------------------------- |
| 请求方法 | GET                        |
| 请求参数 | 无                          |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list":[ 
   	 		{accountName:null
              accountPwd:null
              appNum:null
              createTime:null
              customerNum:null
              email:null
              fullName:"产品运营部"
              id:1100
              managerNum:null
              mobile:null
              status:null
              tel:null
              type:null }
              ···
              ],
   	 "data": null,
   	 "page": null
  }
  ```

## 查询

| 接口地址 | /directManagers |
| ---- | --------------- |
| 请求方法 | GET             |

- 请求参数

  | 字段名      | 是否必须 | 字段类型    | 说明         |
  | -------- | ---- | ------- | ---------- |
  | fullName | 否    | String  | 直销经理名称     |
  | parentId | 否    | Integer | 所属部门id     |
  | start    | 否    | Integer | 分页参数：开始记录数 |
  | limit    | 否    | Integer | 分页参数：页面大小  |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list":[ 
   	 		{"liulf"
                accountPwd:null
                appNum:1
                createTime:1468396033729
                customerNum:1
                email:"liulf@ti-net.com.cn"
                fullName:"刘丽芳"
                id:1101
                mobile:""
                parentId:1100
                parentName:"产品运营部"
                status:1
                tel:""
                type:"5"
                }
              ···
              ],
       "data": null，
   	 "page": ｛
   	 		currentPageNo:3
                pageSize:10
                start:20
                totalCount:56
                totalPageCount:6
  			｝
  }
  ```

## 获取直销经理详细信息

| 接口地址 | /directManager |
| ---- | -------------- |
| 请求方法 | GET            |

- 请求参数

  | 字段名       | 是否必须 | 字段类型    | 说明   |
  | --------- | ---- | ------- | ---- |
  | accountId | 是    | Integer | 企业id |


- 返回结果

  ```

  {
  	"result": "0",
   	 "description": "success",
   	 "list":null
       "page": null，
   	 "data": ｛
   	 		accountFullName:null
              accountName:"hezj"
              accountPwd:"afdd0b4ad2ec172c586e2150770fbf9e"
              businessNo:null
              createTime:1499665642195
              currentMoney:null
              email:"hezj@ti-net.com.cn"
              fullName:"和子健"
              id:1293
              legalPperson:null
              mobile:""
              parentId:1100
              principal:null
              registAddress:null
              shortName:null
              status:1
              tel:""
              type:5
              uptime:null
  			｝
  }
  ```

## 删除直销经理

[&emsp;&emsp;删除企业帐号](#删除企业帐号)

## 新建直销经理

| 接口地址 | /directManager |
| ---- | -------------- |
| 请求方法 | POST           |

- 请求参数

  | 字段名         | 是否必须 | 字段类型    | 说明     |
  | ----------- | ---- | ------- | ------ |
  | accountName | 是    | String  | 登录名    |
  | fullName    | 是    | String  | 直销经理全称 |
  | parentId    | 是    | Integer | 所属部门id |
  | email       | 否    | String  | 邮箱     |
  | mobile      | 否    | String  | 手机号    |
  | tel         | 否    | String  | 固定电话   |
  | password    | 是    | String  | 密码     |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

## 修改直销经理信息

| 接口地址 | /directManager |
| ---- | -------------- |
| 方法   | PUT            |

- 请求参数

  | 字段名         | 是否必须 | 字段类型    | 说明     |
  | ----------- | ---- | ------- | ------ |
  | accountId   | 是    | Integer | 账户id   |
  | fullName    | 否    | String  | 全称     |
  | accountName | 否    | String  | 登录名    |
  | email       | 否    | String  | 邮箱     |
  | mobile      | 否    | String  | 手机     |
  | tel         | 否    | String  | 电话     |
  | accountPwd  | 否    | String  | 密码     |
  | parentId    | 是    | Integer | 所属部门id |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

  ​

# 企业管理相关接口

## 初始化所属部门下拉框

[&emsp;&emsp;初始化所属部门下拉框](#初始化所属部门下拉框)

## 获取所属部门所属经理

| 接口地址 | /directDepartment/directManager |
| ---- | ------------------------------- |
| 请求方法 | GET                             |

- 请求参数

  | 字段名                | 是否必须 | 字段类型    | 说明                         |
  | ------------------ | ---- | ------- | -------------------------- |
  | directDepartmentId | 是    | Integer | 直销部门id                     |
  | directManagerId    | 否    | Integer | 如果当前登录账户为直销经理则传入直销经理id否则不传 |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": [
         {
           accountName:null
            accountPwd:null
            appNum:null
            createTime:null
            customerNum:null
            email:null
            fullName:"和子健"
            id:1293
            mobile:null
            parentId:null
            parentName:null
            status:null
            tel:null
            type:null
         }
         ···
   	 ],
   	 "data": null,
   	 "page": null
  }
  ```

  ​

## 根据条件查询企业

| 接口地址 | /customers |
| ---- | ---------- |
| 方法   | GET        |

- 请求参数

  | 字段名            | 是否必须 | 字段类型    | 说明                      |
  | -------------- | ---- | ------- | ----------------------- |
  | fullName       | 否    | String  | 企业名称                    |
  | balanceType    | 否    | String  | 余额类型normal：正常overdue：欠费 |
  | status         | 否    | Integer | 账户状态1正常2暂停3锁定4注销5上线6测试  |
  | businessUpFlag | 否    | Integer | 营业执照0未上传1已上传            |
  | departmentId   | 否    | Integer | 直销部门id                  |
  | managerId      | 否    | Integer | 直销经理id                  |
  | start          | 否    | Integer | 分页参数：开始记录数              |
  | limit          | 否    | Integer | 分页参数：页面大小               |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": [
         {
           	"id": 1316,
              "accountName": "huolala",
              "accountPwd": null,
              "type": 3,
              "level": 1,
              "accountFullName": "广州依时货拉拉科技有限公司",
              "fullName": "广州依时货拉拉科技有限公司",
              "shortName": "货拉拉",
              "principal": "1",
              "mobile": "",
              "tel": "",
              "email": "",
              "status": 5,
              "parentId": 1021,
              "parentName": "王冠",
              "parentParentId": 1014,
              "parentParentName": "广东分公司",
              "currentMoney": 100000,
              "rebate": "0",
              "minCost": "10000",
              "minCostStartMonth": "2017-10",
              "currentMinCost": "0.000",
              "createTime": "2017-09-13 16:08:32",
              "uptime": "2017-12-25 11:12:49",
              "appCount": 2,
              "businessNo": "91440101329527377D",
              "legalPerson": "邓康乔",
              "registAddress": "广州市海珠区琶洲大道东8号904房、905房（仅限办公用途）",
              "businessUpFlag": 2
         }
         ···
   	 ],
   	 "data": null,
   	 "page": ｛
                 currentPageNo:1
                  pageSize:10
                  start:0
                  totalCount:210
                  totalPageCount:21
                  ｝
  }
  ```

  ​

## 获取企业信息

### 企业基本信息

#### 获取企业基本信息

| 请求地址 | /customer |
| ---- | --------- |
| 请求方法 | GET       |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明   |
| --------- | ---- | ------- | ---- |
| accountId | 是    | Integer | 企业id |

- 返回结果

```
{
	"result": "0",
 	 "description": "success",
 	 "list": null,
 	 "data": {
       "id": 1316,
        "accountName": "huolala",
        "accountPwd": null,
        "type": 3,
        "level": 1,
        "accountFullName": "广州依时货拉拉科技有限公司",
        "fullName": "广州依时货拉拉科技有限公司",
        "shortName": "货拉拉",
        "principal": "1",
        "mobile": "",
        "tel": "",
        "email": "",
        "status": 5,
        "parentId": 1021,
        "parentName": "王冠",
        "parentParentId": 1014,
        "parentParentName": "广东分公司",
        "currentMoney": 100000,
        "rebate": "0",
        "minCost": "10000",
        "minCostStartMonth": "2017-10",
        "currentMinCost": "0.000",
        "createTime": "2017-09-13 16:08:32",
        "uptime": "2017-12-25 11:12:49",
        "appCount": 2,
        "businessNo": "91440101329527377D",
        "legalPerson": "邓康乔",
        "registAddress": "广州市海珠区琶洲大道东8号904房、905房（仅限办公用途）",
        "businessUpFlag": 2
 	 },
 	 "page": null
}
```

#### 获取上传文件列表

[获取上传文件列表](#获取上传文件列表)

#### 上传文件

[上传文件](#上传文件)

#### 修改企业基本信息

| 请求地址 | /customer |
| ---- | --------- |
| 请求方法 | PUT       |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明       |
| --------- | ---- | ------- | -------- |
| accountId | 是    | Integer | 企业id     |
| appId     | 否    | Integer | 应用id     |
| name      | 否    | String  | 需要修改的字段名 |
| value     | 否    | String  | 需要修改的字段值 |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

#### 删除文件相关数据

[删除文件相关数据](#删除文件相关数据)

#### 下载文件

[下载文件](#下载文件)

### 企业业务信息

#### 获取企业基本信息

[获取企业基本信息](#获取企业基本信息)

#### 初始化所属部门下拉框

[初始化所属部门下拉框](#初始化所属部门下拉框)

#### 获取所属部门所属经理

[获取所属部门所属经理](#获取所属部门所属经理)

#### 修改企业基本信息

[修改企业基本信息](#修改企业基本信息)

#### 修改企业月消费

| 请求地址 | /customerCostSetting/minCost |
| ---- | ---------------------------- |
| 请求方法 | PUT                          |

- 请求参数

| 字段名               | 是否必须 | 字段类型    | 说明      |
| ----------------- | ---- | ------- | ------- |
| accountId         | 是    | Integer | 企业id    |
| minCost           | 是    | String  | 企业月最低消费 |
| minCostStartMonth | 是    | String  | 开始时间    |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

#### 修改本月折扣

| 请求地址 | /customerCostSetting/currentRebate |
| ---- | ---------------------------------- |
| 请求方法 | PUT                                |

- 请求参数

| 字段名           | 是否必须 | 字段类型    | 说明   |
| ------------- | ---- | ------- | ---- |
| accountId     | 是    | Integer | 企业id |
| currentRebate | 是    | String  | 本月折扣 |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

### 企业应用管理

#### 新建应用

| 请求地址 | /vlinkApp |
| ---- | --------- |
| 请求方法 | POST      |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明   |
| --------- | ---- | ------- | ---- |
| accountId | 是    | Integer | 企业id |
| type      | 是    | String  | 应用类型 |
| appName   | 是    | String  | 应用名称 |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

  ​

#### 删除应用

| 请求地址 | /vlinkApp |
| ---- | --------- |
| 请求方法 | DELETE    |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明   |
| --------- | ---- | ------- | ---- |
| accountId | 是    | Integer | 企业id |
| appId     | 是    | Integer | 应用id |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

#### 获取账户对应的应用

| 请求地址 | /customer/app |
| ---- | ------------- |
| 请求方法 | GET           |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明   |
| --------- | ---- | ------- | ---- |
| accountId | 是    | Integer | 企业id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 675,
              "vlinkAccountId": 1316,
              "vlinkAccountShortName": null,
              "appId": 5600020,
              "appName": "VNC测试",
              "createTime": 1510648088919,
              "data": null,
              "webCallTotal": null,
              "answeredCount": null,
              "answerRate": null,
              "uptime": 1510648088919,
              "type": "VNC",
              "safetyLevel": 0,
              "status": 1,
              "contractCount": null,
              "minCost": null
          },
          {
              "id": 671,
              "vlinkAccountId": 1316,
              "vlinkAccountShortName": null,
              "appId": 5000591,
              "appName": "语音通知",
              "createTime": 1505290531031,
              "data": null,
              "webCallTotal": null,
              "answeredCount": null,
              "answerRate": null,
              "uptime": 1514173851859,
              "type": "语音通知",
              "safetyLevel": null,
              "status": 1,
              "contractCount": null,
              "minCost": null
          }
      ],
      "data": null,
      "page": null
  }
  ```

#### 查看应用信息

##### 删除文件相关数据

[删除文件相关数据](#删除文件相关数据)

##### 获取上传文件列表

[获取上传文件列表](#获取上传文件列表)

##### 上传文件

[上传文件](#上传文件)

#### 修改应用信息

| 请求地址 | /vlinkApp |
| ---- | --------- |
| 请求方法 | PUT       |

- 请求参数

| 字段名         | 是否必须 | 字段类型    | 说明               |
| ----------- | ---- | ------- | ---------------- |
| accountId   | 是    | Integer | 企业id             |
| appId       | 是    | Integer | 应用id             |
| id          | 是    | Integer | vlink_app表主键id   |
| appName     | 否    | String  | 应用名称             |
| type        | 否    | String  | 应用类型             |
| status      | 否    | Integer | 应用状态1上线2测试3注销4停机 |
| safetyLevel | 否    | Integer | 安全等级1安全2一般3危险    |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

#### 配置应用

##### 呼入资费

###### 获取呼入资费列表

| 请求地址 | /appCostSetting/inSetting |
| ---- | ------------------------- |
| 请求方法 | GET                       |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 59,
              "appId": 5600020,
              "hotline": "400*",
              "unitCost": 0.99,
              "priority": 1,
              "createTime": 1514865520822
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 删除一条呼入资费

| 请求地址 | /appCostSetting/inSetting |
| ---- | ------------------------- |
| 请求方法 | DELETE                    |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_in_setting表主键id                      |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

operationStr示例:"zj,饿了么,语音通知,热线号码:111* 单价:11,热线号码:123* 单价:2,修改呼入资费"

说明：1当操作企业时应用名称为空

​	    2当操作为删除时，操作之后数据为空

​	    3当操作为添加时，操作之前数据为空

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 增加一条呼入资费

| 请求地址 | /appCostSetting/inSetting |
| ---- | ------------------------- |
| 请求方法 | POST                      |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| appId        | 是    | Integer | 应用id                                     |
| hotline      | 是    | String  | 热线号码                                     |
| unitCost     | 是    | String  | 单价                                       |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 修改呼入资费

| 请求地址 | /appCostSetting/inSetting |
| ---- | ------------------------- |
| 请求方法 | PUT                       |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_in_setting表主键id                      |
| appId        | 是    | Integer | 应用id                                     |
| hotline      | 是    | String  | 热线号码                                     |
| unitCost     | 是    | String  | 单价                                       |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

##### 呼入转接资费

###### 获取呼入转接资费列表

| 请求地址 | /appCostSetting/inBridgeSetting |
| ---- | ------------------------------- |
| 请求方法 | GET                             |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 48,
              "appId": 5600020,
              "hotline": "*",
              "clidNumber": "*",
              "calleeNumber": "*",
              "unitCost": 1,
              "priority": 1,
              "createTime": 1514865734458
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 删除一条呼入转接资费

| 请求地址 | /appCostSetting/inBridgeSetting |
| ---- | ------------------------------- |
| 请求方法 | DELETE                          |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_in_bridge_setting表主键id               |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 增加一条呼入转接资费

| 请求地址 | /appCostSetting/inBridgeSetting |
| ---- | ------------------------------- |
| 请求方法 | POST                            |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | appId        | 是    | Integer | 应用id                                     |
  | hotline      | 是    | String  | 热线号码                                     |
  | unitCost     | 是    | String  | 单价                                       |
  | clidNumber   | 是    | String  | 外显号码                                     |
  | calleeNumber | 是    | String  | 被叫号码                                     |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 修改呼入转接资费

| 请求地址 | /appCostSetting/inBridgeSetting |
| ---- | ------------------------------- |
| 请求方法 | PUT                             |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_in_setting表主键id                      |
| appId        | 是    | Integer | 应用id                                     |
| hotline      | 是    | String  | 热线号码                                     |
| unitCost     | 是    | String  | 单价                                       |
| clidNumber   | 是    | String  | 外显号码                                     |
| calleeNumber | 是    | String  | 被叫号码                                     |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```


##### 外呼资费

###### 获取外呼资费列表

| 请求地址 | /appCostSetting/outSetting |
| ---- | -------------------------- |
| 请求方法 | GET                        |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 252,
              "appId": 5600020,
              "clidNumber": "*",
              "calleeNumber": "*",
              "unitCost": 1,
              "priority": 1,
              "createTime": 1514865762494
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 删除一条外呼资费

| 请求地址 | /appCostSetting/outSetting |
| ---- | -------------------------- |
| 请求方法 | DELETE                     |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_out_setting表主键id                     |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 增加一条外呼资费

| 请求地址 | /appCostSetting/outSetting |
| ---- | -------------------------- |
| 请求方法 | POST                       |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| appId        | 是    | Integer | 应用id                                     |
| clidNumber   | 是    | String  | 外显号码                                     |
| calleeNumber | 是    | String  | 被叫号码                                     |
| unitCost     | 是    | String  | 单价                                       |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 修改外呼资费

| 请求地址 | /appCostSetting/outSetting |
| ---- | -------------------------- |
| 请求方法 | PUT                        |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_out_setting表主键id                     |
| appId        | 是    | Integer | 应用id                                     |
| clidNumber   | 是    | String  | 外显号码                                     |
| calleeNumber | 是    | String  | 被叫号码                                     |
| unitCost     | 是    | String  | 单价                                       |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```

##### 外呼转接资费

###### 获取外呼转接资费列表

| 请求地址 | /appCostSetting/outBridgeSetting |
| ---- | -------------------------------- |
| 请求方法 | GET                              |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 62,
              "appId": 5600020,
              "clidNumber": "*",
              "calleeNumber": "*",
              "unitCost": 1,
              "priority": 1,
              "createTime": 1514865776293
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 删除一条外呼转接资费

| 请求地址 | /appCostSetting/outBridgeSetting |
| ---- | -------------------------------- |
| 请求方法 | DELETE                           |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_out_bridge_setting表主键id              |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 增加一条外呼转接资费

| 请求地址 | /appCostSetting/outBridgeSetting |
| ---- | -------------------------------- |
| 请求方法 | POST                             |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | appId        | 是    | Integer | 应用id                                     |
  | clidNumber   | 是    | String  | 外显号码                                     |
  | calleeNumber | 是    | String  | 被叫号码                                     |
  | unitCost     | 是    | String  | 单价                                       |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 修改外呼转接资费

| 请求地址 | /appCostSetting/outBridgeSetting |
| ---- | -------------------------------- |
| 请求方法 | PUT                              |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | id           | 是    | Integer | app_out_setting表主键id                     |
  | appId        | 是    | Integer | 应用id                                     |
  | clidNumber   | 是    | String  | 外显号码                                     |
  | calleeNumber | 是    | String  | 被叫号码                                     |
  | unitCost     | 是    | String  | 单价                                       |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```


##### 短信资费

###### 获取短信资费列表

| 请求地址 | /appCostSetting/messageCostSetting |
| ---- | ---------------------------------- |
| 请求方法 | GET                                |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 1050,
              "appId": 5600020,
              "name": "message_fee",
              "value": "1",
              "remark": "0,1111",
              "createTime": 1514962493114
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 删除一条短信资费

| 请求地址 | /appCostSetting/messageCostSetting |
| ---- | ---------------------------------- |
| 请求方法 | DELETE                             |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_cost_setting表主键id                    |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 增加一条短信资费

| 请求地址 | /appCostSetting/messageCostSetting |
| ---- | ---------------------------------- |
| 请求方法 | POST                               |

- 请求参数

  | 字段名                | 是否必须 | 字段类型    | 说明                                       |
  | ------------------ | ---- | ------- | ---------------------------------------- |
  | appId              | 是    | Integer | 应用id                                     |
  | messageStartAmount | 是    | String  | 开始条数                                     |
  | messageEndAmount   | 是    | String  | 结束条数                                     |
  | messageUnitCost    | 是    | String  | 单价                                       |
  | operationStr       | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 修改短信资费

| 请求地址 | /appCostSetting/messageCostSetting |
| ---- | ---------------------------------- |
| 请求方法 | PUT                                |

- 请求参数

  | 字段名                | 是否必须 | 字段类型    | 说明                                       |
  | ------------------ | ---- | ------- | ---------------------------------------- |
  | id                 | 是    | Integer | app_cost_setting主键id                     |
  | messageStartAmount | 是    | String  | 开始条数                                     |
  | messageEndAmount   | 是    | String  | 结束条数                                     |
  | messageUnitCost    | 是    | String  | 单价                                       |
  | operationStr       | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
##### ussd资费

###### 获取ussd资费列表

| 请求地址 | /appCostSetting/ussdCostSetting |
| ---- | ------------------------------- |
| 请求方法 | GET                             |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 1051,
              "appId": 5600020,
              "name": "USSD",
              "value": "1",
              "remark": "0,1111",
              "createTime": 1514962493114
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 删除一条ussd资费

| 请求地址 | /appCostSetting/ussdCostSetting |
| ---- | ------------------------------- |
| 请求方法 | DELETE                          |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_cost_setting表主键id                    |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 增加一条ussd资费

| 请求地址 | /appCostSetting/ussdCostSetting |
| ---- | ------------------------------- |
| 请求方法 | POST                            |

- 请求参数

  | 字段名             | 是否必须 | 字段类型    | 说明                                       |
  | --------------- | ---- | ------- | ---------------------------------------- |
  | appId           | 是    | Integer | 应用id                                     |
  | ussdStartAmount | 是    | String  | 开始条数                                     |
  | ussdEndAmount   | 是    | String  | 结束条数                                     |
  | ussdUnitCost    | 是    | String  | 单价                                       |
  | operationStr    | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 修改ussd资费

| 请求地址 | /appCostSetting/ussdCostSetting |
| ---- | ------------------------------- |
| 请求方法 | PUT                             |

- 请求参数

  | 字段名             | 是否必须 | 字段类型    | 说明                                       |
  | --------------- | ---- | ------- | ---------------------------------------- |
  | id              | 是    | Integer | app_cost_setting主键id                     |
  | ussdStartAmount | 是    | String  | 开始条数                                     |
  | ussdEndAmount   | 是    | String  | 结束条数                                     |
  | ussdUnitCost    | 是    | String  | 单价                                       |
  | operationStr    | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
##### vnc资费

###### 获取vnc资费列表

| 请求地址 | /appCostSetting/vncCostSetting |
| ---- | ------------------------------ |
| 请求方法 | GET                            |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 1050,
              "appId": 5600020,
              "name": "VNC",
              "value": "1",
              "remark": "0,1111",
              "createTime": 1514962493114
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 删除一条vnc资费

| 请求地址 | /appCostSetting/vncCostSetting |
| ---- | ------------------------------ |
| 请求方法 | DELETE                         |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_cost_setting表主键id                    |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 增加一条vnc资费

| 请求地址 | /appCostSetting/vncCostSetting |
| ---- | ------------------------------ |
| 请求方法 | POST                           |

- 请求参数

  | 字段名            | 是否必须 | 字段类型    | 说明                                       |
  | -------------- | ---- | ------- | ---------------------------------------- |
  | appId          | 是    | Integer | 应用id                                     |
  | vncStartAmount | 是    | String  | 开始条数                                     |
  | vncEndAmount   | 是    | String  | 结束条数                                     |
  | vncUnitCost    | 是    | String  | 单价                                       |
  | operationStr   | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 修改vnc资费

| 请求地址 | /appCostSetting/vncCostSetting |
| ---- | ------------------------------ |
| 请求方法 | PUT                            |

- 请求参数

  | 字段名            | 是否必须 | 字段类型    | 说明                                       |
  | -------------- | ---- | ------- | ---------------------------------------- |
  | id             | 是    | Integer | app_cost_setting主键id                     |
  | vncStartAmount | 是    | String  | 开始条数                                     |
  | vncEndAmount   | 是    | String  | 结束条数                                     |
  | vncUnitCost    | 是    | String  | 单价                                       |
  | operationStr   | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
##### vos资费

###### 获取vos资费

| 请求地址 | /appCostSetting/vosCostSetting |
| ---- | ------------------------------ |
| 请求方法 | GET                            |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 1047,
              "appId": 5600020,
              "name": "VOS",
              "value": "1",
              "remark": null,
              "createTime": 1514962493114
          }
      ],
      "data": null,
      "page": null
  }
  ```


###### 修改vos资费

| 请求地址 | /appCostSetting/vosCostSetting |
| ---- | ------------------------------ |
| 请求方法 | PUT                            |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | appId        | 是    | Integer | 应用id                                     |
  | vosUnitCost  | 是    | String  | 单价                                       |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```
##### 应用最低月消费

###### 获取应用最低月消费

| 请求地址 | /appCostSetting/minCost |
| ---- | ----------------------- |
| 请求方法 | GET                     |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 1047,
              "appId": 5600020,
              "name": "min_cost",
              "value": "1",
              "remark": 2017-11,
              "createTime": 1514962493114
          }
      ],
      "data": null,
      "page": null
  }
  ```


###### 修改应用最低月消费

| 请求地址 | /appCostSetting/minCost |
| ---- | ----------------------- |
| 请求方法 | PUT                     |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | appId        | 是    | Integer | 应用id                                     |
  | minCost      | 是    | String  | 最低消费                                     |
  | startTime    | 是    | String  | 开始时间格式： 2017-11                          |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```
##### 应用低消配置

###### 获取应用当前月低消

| 请求地址 | /appCostSetting/currentMinCost |
| ---- | ------------------------------ |
| 请求方法 | GET                            |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": null,
      "data": {
          "id": 1049,
          "appId": 5600020,
          "name": "current_min_cost",
          "value": "0.000",
          "remark": null,
          "createTime": 1514871703270
      },
      "page": null
  }

  ```

##### 呼入低消资费

###### 获取/搜索呼入低消资费

| 请求地址 | /numberCostSetting/inMinCostSetting |
| ---- | ----------------------------------- |
| 请求方法 | GET                                 |

- 请求参数


| 字段名     | 是否必须 | 字段类型    | 说明         |
| ------- | ---- | ------- | ---------- |
| appId   | 是    | Integer | 应用id       |
| hotline | 否    | String  | 热线号码       |
| start   | 否    | Integer | 分页参数：开始记录数 |
| limit   | 否    | Integer | 分页参数：页面大小  |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 43020,
              "appId": 5000331,
              "hotline": "4000076622",
              "minCost": 2000,
              "startMonth": "2016-09",
              "createTime": 1472815207253
          }
      ],
      "data": null,
      "page": {
          "start": 0,
          "pageSize": 10,
          "totalCount": 1,
          "currentPageNo": 1,
          "totalPageCount": 1
      }
  }

  ```

###### 修改一条呼入低消资费/批量修改

| 接口地址 | /numberCostSetting/inMinCostSetting |
| ---- | ----------------------------------- |
| 请求方法 | PUT                                 |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | appId        | 是    | Integer | 应用id                                     |
  | hotline      | 是    | String  | 热线号码                                     |
  | minCost      | 是    | String  | 最低消费                                     |
  | startTime    | 是    | String  | 开始时间                                     |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

说明：

​	1修改一条记录时hotline为当前需要修改的记录的hotline，minCost、startTime同理

​	2批量修改时hotline为批量修改的热线号码、minCost、startTime同理

​	3批量修改时operationStr修改之前数据可为空

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 同步

| 请求地址 | /numberCostSetting/numberFromVlink |
| ---- | ---------------------------------- |
| 请求方法 | GET                                |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```
##### 号码功能费

###### 获取/搜索号码功能费

| 请求地址 | /numberCostSetting/numberFunctionSetting |
| ---- | ---------------------------------------- |
| 请求方法 | GET                                      |

- 请求参数


| 字段名        | 是否必须 | 字段类型    | 说明         |
| ---------- | ---- | ------- | ---------- |
| appId      | 是    | Integer | 应用id       |
| areaNumber | 否    | String  | 区号         |
| number     | 否    | String  | 号码         |
| start      | 否    | Integer | 分页参数：开始记录数 |
| limit      | 否    | Integer | 分页参数：页面大小  |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 41048,
              "appId": 5000331,
              "areaCode": "400",
              "trunk": "4000076622",
              "area": null,
              "cost": 0,
              "startMonth": "2017-11",
              "createTime": 1472815207269
          }
      ],
      "data": null,
      "page": {
          "start": 0,
          "pageSize": 10,
          "totalCount": 1,
          "currentPageNo": 1,
          "totalPageCount": 1
      }
  }

  ```

###### 修改一条号码功能费/批量修改

| 接口地址 | /numberCostSetting/numberFunctionSetting |
| ---- | ---------------------------------------- |
| 请求方法 | PUT                                      |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | appId        | 是    | Integer | 应用id                                     |
  | areaNumber   | 否    | String  | 区号                                       |
  | number       | 否    | String  | 号码                                       |
  | minCost      | 否    | String  | 功能费                                      |
  | startTime    | 否    | String  | 开始时间                                     |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

  说明：

  ​	1修改一条记录时areaNumber为当前需要修改的记录的areaNumber，number、minCost、startTime	同理

  ​	2批量修改时areaNumber为批量修改的热线号码areaNumber，number、minCost、startTime同理

  ​	3批量修改时operationStr修改之前数据可为空

​	 

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###### 同步

[同步](#同步)

##### 功能费

###### 获取功能费列表

| 请求地址 | /numberCostSetting/appFunctionSetting |
| ---- | ------------------------------------- |
| 请求方法 | GET                                   |

- 请求参数


| 字段名   | 是否必须 | 字段类型    | 说明   |
| ----- | ---- | ------- | ---- |
| appId | 是    | Integer | 应用id |

- 返回结果

  ```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 12,
              "appId": 5000247,
              "name": "补扣5月费用",
              "cost": 1848.36,
              "startMonth": "2017-07",
              "createTime": 1501653643621
          }
      ],
      "data": null,
      "page": null
  }
  ```

###### 修改一条功能费/批量修改

| 接口地址 | /numberCostSetting/appFunctionSetting |
| ---- | ------------------------------------- |
| 请求方法 | PUT                                   |

- 请求参数

  | 字段名          | 是否必须 | 字段类型    | 说明                                       |
  | ------------ | ---- | ------- | ---------------------------------------- |
  | id           | 是    | Integer | app_function_cost_setting表主键             |
  | name         | 是    | String  | 功能费名称                                    |
  | cost         | 是    | String  | 功能费用                                     |
  | startTime    | 是    | String  | 开始时间                                     |
  | operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |


  说明：

  1修改一条记录时areaNumber为当前需要修改的记录的areaNumber，number、minCost、startTime	同理

​	2批量修改时areaNumber为批量修改的热线号码areaNumber，number、minCost、startTime同理

​	3批量修改时operationStr修改之前数据可为空

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```

###### 添加一条功能费

| 请求地址 | /numberCostSetting/appFunctionSetting |
| ---- | ------------------------------------- |
| 请求方法 | POST                                  |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| appId        | 是    | Integer | 应用id                                     |
| name         | 是    | String  | 功能费名称                                    |
| cost         | 是    | String  | 功能费用                                     |
| startTime    | 是    | String  | 开始时间                                     |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```
###### 删除一条功能费

| 请求地址 | /numberCostSetting/appFunctionSetting |
| ---- | ------------------------------------- |
| 请求方法 | DELETE                                |

- 请求参数

| 字段名          | 是否必须 | 字段类型    | 说明                                       |
| ------------ | ---- | ------- | ---------------------------------------- |
| id           | 是    | Integer | app_function_cost_setting表主键             |
| operationStr | 是    | String  | 操作记录格式为：“操作人名称,操作企业名称，操作应用名称,操作之前数据,操作之后数据,操作类型” |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

## 删除企业

[删除企业帐号](#删除企业帐号)

## 新建企业

| 请求地址 | /customer |
| ---- | --------- |
| 请求方法 | POST      |

- 请求参数

| 字段名             | 是否必须 | 字段类型    | 说明     |
| --------------- | ---- | ------- | ------ |
| accountName     | 是    | String  | 登录名    |
| parentId        | 是    | Integer | 所属直销经理 |
| mail            | 否    | String  | 遇邮件    |
| tel             | 否    | String  | 固定电话   |
| mobile          | 否    | String  | 手机     |
| password        | 是    | String  | 密码     |
| accountFullName | 是    | String  | 账户全称   |
| fullName        | 是    | String  | 企业全称   |
| shortName       | 是    | String  | 企业简称   |
| principal       | 是    | String  | 姓名     |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }

  ```


# 应用管理相关接口

## 查询功能

| 接口地址 | /vlinkApps |
| ---- | ---------- |
| 接口方法 | GET        |

- 请求参数

  | 字段名             | 是否必须 | 字段类型    | 说明               |
  | --------------- | ---- | ------- | ---------------- |
  | appId           | 否    | Integer | 应用id             |
  | appName         | 否    | String  | 应用名称             |
  | type            | 否    | String  | 应用类型             |
  | status          | 否    | Integer | 应用状态1上线2测试3注销4停机 |
  | safetyLevel     | 否    | Integer | 安全等级1安全2一般3危险    |
  | createStartTime | 否    | String  | 创建开始时间           |
  | createEndTime   | 否    | String  | 创建结束时间           |
  | upStartTime     | 否    | String  | 上线开始时间           |
  | upEndTime       | 否    | String  | 上线结束时间           |
  | contractFlag    | 否    | Integer | 合同状态0未上传1已上传     |
  | start           | 否    | Integer | 分页参数：开始记录数       |
  | limit           | 否    | Integer | 分页参数：页面大小        |

- 返回结果

```
{
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 119,
            "vlinkAccountId": 74,
            "vlinkAccountShortName": "天润销售工具",
            "appId": 5000133,
            "appName": "验证码",
            "createTime": 1451015557368,
            "data": null,
            "webCallTotal": null,
            "answeredCount": null,
            "answerRate": null,
            "uptime": 1464782160691,
            "type": "语音验证码",
            "safetyLevel": 1,
            "status": 2,
            "contractCount": 0,
            "minCost": ""
        },
        {
            "id": 4,
            "vlinkAccountId": 4,
            "vlinkAccountShortName": "无忧停车",
            "appId": 5000004,
            "appName": "语音验证码",
            "createTime": 1441855602248,
            "data": null,
            "webCallTotal": null,
            "answeredCount": null,
            "answerRate": null,
            "uptime": 1464782160691,
            "type": "语音验证码",
            "safetyLevel": 1,
            "status": 2,
            "contractCount": 2,
            "minCost": "0"
        },
        {
            "id": 3,
            "vlinkAccountId": 3,
            "vlinkAccountShortName": "天润融通",
            "appId": 5000003,
            "appName": "语音验证码",
            "createTime": 1441703648956,
            "data": null,
            "webCallTotal": null,
            "answeredCount": null,
            "answerRate": null,
            "uptime": 1464782160691,
            "type": "语音验证码",
            "safetyLevel": 1,
            "status": 2,
            "contractCount": 0,
            "minCost": ""
        }
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 3,
        "currentPageNo": 1,
        "totalPageCount": 1
    }
}
```

## 修改资费设置

### 初始化页面

[获取企业基本信息](#获取企业基本信息)

### 修改自定义应用配置

| 请求地址 | /vlinkApp/customApplicationsApp |
| ---- | ------------------------------- |
| 请求方法 | PUT                             |

- 请求参数

| 字段名           | 是否必须 | 字段类型       | 说明     |
| ------------- | ---- | ---------- | ------ |
| appId         | 是    | Integer    | 应用id   |
| remark        | 是    | String     | 备注     |
| inCost        | 是    | BigDecimal | 呼入资费   |
| inBridgeCost  | 是    | BigDecimal | 呼入转接资费 |
| outCost       | 是    | BigDecimal | 外呼资费   |
| outBridgeCost | 是    | BigDecimal | 外呼转接资费 |
| appMinCost    | 是    | BigDecimal | 应用低消   |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
### 修改短信应用配置

| 请求地址 | /vlinkApp/shortMessageApp |
| ---- | ------------------------- |
| 请求方法 | PUT                       |

- 请求参数

| 字段名        | 是否必须 | 字段类型       | 说明   |
| ---------- | ---- | ---------- | ---- |
| appId      | 是    | Integer    | 应用id |
| start      | 是    | String     | 开始条数 |
| end        | 是    | String     | 结束条数 |
| unitCost   | 是    | String     | 单价   |
| appMinCost | 是    | BigDecimal | 应用低消 |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

###修改总分机应用配置

| 请求地址 | /vlinkApp/totalExtensionApp |
| ---- | --------------------------- |
| 请求方法 | PUT                         |

- 请求参数

  | 字段名                 | 是否必须 | 字段类型       | 说明     |
  | ------------------- | ---- | ---------- | ------ |
  | appId               | 是    | Integer    | 应用id   |
  | inNumber            | 是    | String     | 呼入号码   |
  | inBridgeNumber      | 是    | String     | 转接外显号码 |
  | inCostSetting       | 是    | BigDecimal | 呼入资费   |
  | inBridgeCostSetting | 是    | BigDecimal | 呼入转接资费 |
  | inMinCost           | 是    | BigDecimal | 号码呼入低消 |
  | numberFunctionCost  | 是    | BigDecimal | 号码使用费  |
  | appMinCost          | 是    | BigDecimal | 应用低消   |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
### 修改两端回呼应用配置

| 请求地址 | /vlinkApp/twoWayCallBackApp |
| ---- | --------------------------- |
| 请求方法 | PUT                         |

- 请求参数

  ​

  | 字段名                | 是否必须 | 字段类型       | 说明     |
  | ------------------ | ---- | ---------- | ------ |
  | appId              | 是    | Integer    | 应用id   |
  | numberFunctionCost | 是    | BigDecimal | 号码使用费  |
  | outUnitCost        | 是    | BigDecimal | 外呼资费   |
  | outBridgeUnitCost  | 是    | BigDecimal | 外呼转接资费 |
  | inBridgeUnitCost   | 是    | BigDecimal | 回呼转接资费 |
  | appMinCost         | 是    | BigDecimal | 应用低消   |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
### 修改ussd应用配置

| 请求地址 | /vlinkApp/ussdApp |
| ---- | ----------------- |
| 请求方法 | PUT               |

- 请求参数

  | 字段名        | 是否必须 | 字段类型       | 说明   |
  | ---------- | ---- | ---------- | ---- |
  | appId      | 是    | Integer    | 应用id |
  | start      | 是    | String     | 开始条数 |
  | end        | 是    | String     | 结束条数 |
  | unitCost   | 是    | String     | 单价   |
  | appMinCost | 是    | BigDecimal | 应用低消 |


- 返回结果
  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

| 字段名           | 是否必须 | 字段类型       | 说明     |
| ------------- | ---- | ---------- | ------ |
| appId         | 是    | Integer    | 应用id   |
| remark        | 是    | String     | 备注     |
| inCost        | 是    | BigDecimal | 呼入资费   |
| inBridgeCost  | 是    | BigDecimal | 呼入转接资费 |
| outCost       | 是    | BigDecimal | 外呼资费   |
| outBridgeCost | 是    | BigDecimal | 外呼转接资费 |
| appMinCost    | 是    | BigDecimal | 应用低消   |

- ​

### 修改语音通知应用配置

| 请求地址 | /vlinkApp/voiceNotificationApp |
| ---- | ------------------------------ |
| 请求方法 | PUT                            |

- 请求参数

  | 字段名        | 是否必须 | 字段类型       | 说明   |
  | ---------- | ---- | ---------- | ---- |
  | appId      | 是    | Integer    | 应用id |
  | unitCost   | 是    | BigDecimal | 外呼资费 |
  | appMinCost | 是    | BigDecimal | 应用低消 |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
### 修改语音验证码应用配置

| 请求地址 | /vlinkApp/vertificationCodeApp |
| ---- | ------------------------------ |
| 请求方法 | PUT                            |

- 请求参数

  | 字段名        | 是否必须 | 字段类型       | 说明   |
  | ---------- | ---- | ---------- | ---- |
  | appId      | 是    | Integer    | 应用id |
  | unitCost   | 是    | BigDecimal | 外呼资费 |
  | appMinCost | 是    | BigDecimal | 应用低消 |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```
### 修改vos应用配置

| 请求地址 | /vlinkApp/vosApp |
| ---- | ---------------- |
| 请求方法 | PUT              |

- 请求参数

  | 字段名        | 是否必须 | 字段类型       | 说明   |
  | ---------- | ---- | ---------- | ---- |
  | appId      | 是    | Integer    | 应用id |
  | unitCost   | 是    | BigDecimal | 外呼费  |
  | appMinCost | 是    | BigDecimal | 应用低消 |


- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

# 消费日志相关接口

## 客户下拉框初始化

[客户下拉框初始化](#客户下拉框初始化)

## 客户简称下拉框初始化

| 请求地址 | /vlinkAccount/shortName |
| ---- | ----------------------- |
| 请求方法 | GET                     |
| 请求参数 | 无                       |

- 返回结果

  ```
  {
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 1308,
            "accountName": null,
            "accountPwd": null,
            "type": null,
            "level": null,
            "accountFullName": null,
            "fullName": null,
            "shortName": "美锦互联",
            "principal": null,
            "mobile": null,
            "tel": null,
            "email": null,
            "status": null,
            "parentId": null,
            "parentName": null,
            "parentParentId": null,
            "parentParentName": null,
            "currentMoney": null,
            "rebate": null,
            "minCost": null,
            "minCostStartMonth": null,
            "currentMinCost": null,
            "createTime": null,
            "uptime": null,
            "appCount": null,
            "businessNo": null,
            "legalPerson": null,
            "registAddress": null,
            "businessUpFlag": null
        }
        ···
    ],
    "data": null,
    "page": null
  }
  ```

## 查询消费日志

| 请求地址 | /paylogs |
| ---- | -------- |
| 请求方法 | GET      |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明         |
| --------- | ---- | ------- | ---------- |
| accountId | 是    | Integer | 企业id       |
| start     | 否    | Integer | 分页参数：开始记录数 |
| limit     | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
{
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 1977,
            "vlinkAccountId": 17,
            "vlinkAccountFullName": "众安在线财产保险股份有限公司",
            "operateType": 4,
            "realCost": 0,
            "minCost": 0,
            "rebate": 0,
            "previousMoney": 19672.6,
            "opearteMoney": 0,
            "currentMoney": 19672.6,
            "operatDetails": null,
            "remark": null,
            "createTime": 1513934404607
        }
        ···
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 24,
        "currentPageNo": 1,
        "totalPageCount": 3
    }
}
```

### 查看应用扣费日志

| 请求地址 | /paylogs/appDeduct |
| ---- | ------------------ |
| 请求方法 | GET                |

- 请求参数

| 字段名        | 是否必须 | 字段类型    | 说明         |
| ---------- | ---- | ------- | ---------- |
| accountId  | 是    | Integer | 企业id       |
| createTime | 是    | Long    | 创建时间       |
| start      | 否    | Integer | 分页参数：开始记录数 |
| limit      | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 3480,
              "vlinkAccountId": 17,
              "appId": 5000102,
              "appName": "还款提醒",
              "appType": "",
              "deductMoney": 0,
              "realCost": 0,
              "minCost": 0,
              "deductMonth": "2017-11"
          }
          ···
      ],
      "data": null,
      "page": {
          "start": 0,
          "pageSize": 10,
          "totalCount": 4,
          "currentPageNo": 1,
          "totalPageCount": 1
      }
  }
```



#### 查看应用扣费详情

| 请求地址 | /appDeductDetailLog |
| ---- | ------------------- |
| 请求方法 | GET                 |

- 请求参数

| 字段名         | 是否必须 | 字段类型    | 说明         |
| ----------- | ---- | ------- | ---------- |
| appId       | 是    | Integer | 应用id       |
| deductMonth | 是    | String  | 扣费日期       |
| start       | 否    | Integer | 分页参数：开始记录数 |
| limit       | 否    | Integer | 分页参数：页面大小  |

- 返回结果

  ```
  {
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 10823,
            "appId": 5000102,
            "costType": "out",
            "condition": "外显号码为*且被叫号码为* ",
            "amount": 0,
            "unitCost": 0.1,
            "totalCost": 0,
            "month": "2017-11",
            "createTime": null
        }
        ···
    ],
    "data": null,
    "page": null
  }
  ```


##### 查看呼入扣费日志

| 请求地址 | /numberInCostLog |
| ---- | ---------------- |
| 请求方法 | GET              |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明         |
| ----- | ---- | ------- | ---------- |
| appId | 是    | Integer | 应用id       |
| month | 是    | String  | 扣费日期       |
| start | 否    | Integer | 分页参数：开始记录数 |
| limit | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 35,
              "appId": 5000037,
              "number": "26891694",
              "minCost": 0,
              "unitCost": 0,
              "duration": 0,
              "totalCost": 0,
              "realCost": 0,
              "month": "2016-06",
              "startMonth": "2016-01",
              "createTime": 1467604478218
          }
          ···
      ],
      "data": null,
      "page": {
          "start": 0,
          "pageSize": 10,
          "totalCount": 38,
          "currentPageNo": 1,
          "totalPageCount": 4
      }
  }
```

##### 查看号码功能费日志

| 请求地址 | /numberFunctionCostLog |
| ---- | ---------------------- |
| 请求方法 | GET                    |

- 请求参数

| 字段名   | 是否必须 | 字段类型    | 说明         |
| ----- | ---- | ------- | ---------- |
| appId | 是    | Integer | 应用id       |
| month | 是    | String  | 扣费日期       |
| start | 否    | Integer | 分页参数：开始记录数 |
| limit | 否    | Integer | 分页参数：页面大小  |

- 返回结果

  ```
  {
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 58,
            "appId": 5000037,
            "number": "86828069",
            "area": "黔江",
            "unitCost": 23,
            "totalCost": 23,
            "month": "2016-06",
            "startMonth": "2016-01",
            "createTime": 1467604478141
        }
        ···
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 38,
        "currentPageNo": 1,
        "totalPageCount": 4
    }
  }
  ```


# 预消费日志相关接口

## 客户下拉框初始化

[客户下拉框初始化](#客户下拉框初始化)

## 客户简称下拉框初始化

[客户简称下拉框初始化](#客户简称下拉框初始化)

## 查询预消费日志

| 请求地址 | /preDeductLog |
| ---- | ------------- |
| 请求方法 | GET           |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明         |
| --------- | ---- | ------- | ---------- |
| accountId | 是    | Integer | 企业id       |
| start     | 否    | Integer | 分页参数：开始记录数 |
| limit     | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
{
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 8197,
            "vlinkAccountId": 1171,
            "vlinkAccountFullName": "跟谁学",
            "operateType": 4,
            "operateTypeDesc": null,
            "realCost": 50,
            "minCost": 0,
            "rebate": 0,
            "previousMoney": 16228.784,
            "opearteMoney": 50,
            "currentMoney": 16178.784,
            "operatDetails": null,
            "remark": null,
            "createTime": 1514736000000
        }
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 1,
        "currentPageNo": 1,
        "totalPageCount": 1
    }
}
```

### 查询应用扣费日志

| 请求地址 | /preDeductLog/preAppDeductLog |
| ---- | ----------------------------- |
| 请求方法 | GET                           |

- 请求参数

| 字段名         | 是否必须 | 字段类型    | 说明         |
| ----------- | ---- | ------- | ---------- |
| accountId   | 是    | Integer | 企业id       |
| deductMonth | 是    | String  | 扣费日期       |
| start       | 否    | Integer | 分页参数：开始记录数 |
| limit       | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
{
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 15071,
            "vlinkAccountId": 1171,
            "appId": 5000260,
            "appName": "两端呼",
            "appType": "",
            "deductMoney": 0,
            "realCost": 0,
            "minCost": 0,
            "deductMonth": "2017-12"
        }
        ···
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 2,
        "currentPageNo": 1,
        "totalPageCount": 1
    }
}
```

#### 查看应用扣费详情

| 请求地址 | /preDeductLog/preAppDeductDetailLog |
| ---- | ----------------------------------- |
| 请求方法 | GET                                 |

- 请求参数

| 字段名         | 是否必须 | 字段类型    | 说明   |
| ----------- | ---- | ------- | ---- |
| accountId   | 是    | Integer | 企业id |
| deductMonth | 是    | String  | 扣费日期 |

- 返回结果

```
{
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 49138,
            "appId": 5000260,
            "costType": "in_bridge",
            "condition": "热线号码为*且外显号码为*且被叫号码为*",
            "amount": 0,
            "unitCost": 0.052,
            "totalCost": 0,
            "deductMonth": "2017-12",
            "createTime": null
        }
        ···
    ],
    "data": null,
    "page": null
}
```

##### 查看呼入预扣费日志

| 请求地址 | /preDeductLog/preNumberInCostLog |
| ---- | -------------------------------- |
| 请求方法 | GET                              |

- 请求参数

| 字段名         | 是否必须 | 字段类型    | 说明         |
| ----------- | ---- | ------- | ---------- |
| appId       | 是    | Integer | 应用id       |
| deductMonth | 是    | String  | 扣费日期       |
| start       | 否    | Integer | 分页参数：开始记录数 |
| limit       | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 251365,
              "appId": 5000472,
              "number": "01060648932",
              "minCost": 0,
              "unitCost": 0,
              "duration": 0,
              "totalCost": 0,
              "realCost": 0,
              "deductMonth": "2017-08",
              "startMonth": "2017-04",
              "createTime": 1504258417135
          }
          ···
      ],
      "data": null,
      "page": {
          "start": 0,
          "pageSize": 10,
          "totalCount": 3,
          "currentPageNo": 1,
          "totalPageCount": 1
      }
  }

```

##### 查看号码功能费预扣费日志

| 请求地址 | /preDeductLog/preNumberFunctionCostLog |
| ---- | -------------------------------------- |
| 请求方法 | GET                                    |

- 请求参数

| 字段名         | 是否必须 | 字段类型    | 说明         |
| ----------- | ---- | ------- | ---------- |
| appId       | 是    | Integer | 应用id       |
| deductMonth | 是    | String  | 扣费日期       |
| start       | 否    | Integer | 分页参数：开始记录数 |
| limit       | 否    | Integer | 分页参数：页面大小  |

- 返回结果

  ```
  {
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 309589,
            "appId": 5000533,
            "number": "01086445694",
            "area": null,
            "unitCost": 30,
            "totalCost": 30,
            "deductMonth": "2017-12",
            "startMonth": "2017-08",
            "createTime": 1514877206700
        }
        ···
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 5,
        "currentPageNo": 1,
        "totalPageCount": 1
    }
  }

  ```

## 导出功能

| 请求地址 | /preDeductLog/exportPreCustomerDeductLog |
| ---- | ---------------------------------------- |
| 请求方法 | GET                                      |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明   |
| --------- | ---- | ------- | ---- |
| accountId | 是    | Integer | 企业id |

- 返回结果

  ```
  {
  	"result": "0",
   	 "description": "success",
   	 "list": null,
   	 "data": null,
   	 "page": null
  }
  ```

# 账单统计相关接口

## 客户下拉框初始化

[客户下拉框初始化](#客户下拉框初始化)

## 客户简称下拉框初始化

[客户简称下拉框初始化](#客户简称下拉框初始化)

## 查询账单

| 请求地址 | /billStatistics |
| ---- | --------------- |
| 请求方法 | GET             |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明         |
| --------- | ---- | ------- | ---------- |
| accountId | 是    | Integer | 企业id       |
| start     | 否    | Integer | 分页参数：开始记录数 |
| limit     | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
{
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": null,
            "vlinkAccountId": 9,
            "fullName": "爱吉（上海）房地产经纪有限公司",
            "initialBalance": -4182.54,
            "rechargeMoney": 0,
            "consumeMoney": 0,
            "endingBalance": -4182.54,
            "countMonth": "2017-11",
            "createTime": 1515028378017
        }
        ···
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 6,
        "currentPageNo": 1,
        "totalPageCount": 1
    }
}
```

list详细说明:

| 字段名            | 字段类型       | 说明    |
| -------------- | ---------- | ----- |
| id             | Integer    | 主键id  |
| vlinkAccountId | Integer    | 企业id  |
| fullName       | String     | 企业全称  |
| initialBalance | BigDecimal | 期初余额  |
| rechargeMoney  | BigDecimal | 当月总充值 |
| consumeMoney   | BigDecimal | 当月总消费 |
| endingBalance  | BigDecimal | 期末余额  |
| countMonth     | String     | 统计月份  |
| createTime     | Date       | 创建时间  |

# 外呼统计

## 客户下拉框初始化

[客户下拉框初始化](#客户下拉框初始化)

## 客户对应应用初始化

[客户对应应用初始化](#客户对应应用初始化)

## 查询

| 请求地址 | /cdrDetail/cdrob |
| ---- | ---------------- |
| 请求方法 | GET              |

- 请求参数

| 字段名     | 是否必须 | 字段类型    | 说明         |
| ------- | ---- | ------- | ---------- |
| appId   | 是    | Integer | 企业id       |
| rptDate | 是    | String  | 查询日期       |
| start   | 否    | Integer | 分页参数：开始记录数 |
| limit   | 否    | Integer | 分页参数：页面大小  |

- 返回结果

```
  {
      "result": "0",
      "description": "success",
      "list": [
          {
              "id": 31504,
              "appId": 5000193,
              "day": "2016-07-03",
              "timePeriods": "2016-07-03 23:55:00 2016-07-04 00:00:00",
              "obOffered": 1,
              "obAnswered": 0,
              "obAnsweredRate": "0.00%",
              "obAnsweredAvgDuration": 0,
              "obBridged": 0,
              "obBridgedAnswered": 0,
              "obBridgedAnsweredRate": "--",
              "obBridgedAnsweredAvgDuration": 0,
              "createTime": 1467572540908
          }
          ···
      ],
      "data": null,
      "page": {
          "start": 0,
          "pageSize": 10,
          "totalCount": 246,
          "currentPageNo": 1,
          "totalPageCount": 25
      }
  }
```

list详细说明：

| 字段名                          | 字段类型    | 说明             |
| ---------------------------- | ------- | -------------- |
| id                           | Integer | 主键id           |
| appId                        | Integer | 应用id           |
| day                          | String  | 统计日期yyyy-MM-dd |
| timePeriods                  | String  | 统计时段           |
| obOffered                    | Integer | 呼出数            |
| obAnswered                   | Integer | 外呼接通数          |
| obAnsweredRate               | String  | 外呼接通率          |
| obAnsweredAvgDuration        | Integer | 接通平均时长         |
| obBridged                    | Integer | 转接数            |
| obBridgedAnswered            | Integer | 转接接通数          |
| obBridgedAnsweredRate        | String  | 外呼转接接通率        |
| obBridgedAnsweredAvgDuration | Integer | 转接平均时长         |
| createTime                   | Date    | 创建时间           |

# 呼入统计

## 客户下拉框初始化

[客户下拉框初始化](#客户下拉框初始化)

## 客户对应应用初始化

[客户对应应用初始化](#客户对应应用初始化)

## 查询

| 请求地址 | /cdrDetail/cdrIb |
| ---- | ---------------- |
| 请求方法 | GET              |

- 请求参数

| 字段名     | 是否必须 | 字段类型    | 说明         |
| ------- | ---- | ------- | ---------- |
| appId   | 是    | Integer | 企业id       |
| rptDate | 是    | String  | 查询日期       |
| start   | 否    | Integer | 分页参数：开始记录数 |
| limit   | 否    | Integer | 分页参数：页面大小  |

- 返回结果

  ```
  {
    "result": "0",
    "description": "success",
    "list": [
        {
            "id": 15174,
            "appId": 5000017,
            "day": "2016-07-03",
            "timePeriods": "2016-07-03 00:05:00 2016-07-03 00:10:00",
            "ibOffered": 1,
            "ibAnswered": 0,
            "ibAnsweredRate": "0.00",
            "ibAnsweredAvgDuration": 0,
            "ibBridged": 0,
            "ibBridgedAnswered": 0,
            "ibBridgedAnsweredRate": "--",
            "ibBridgedAnsweredAvgDuration": 0,
            "createTime": 1467569197205
        }
        ···
    ],
    "data": null,
    "page": {
        "start": 0,
        "pageSize": 10,
        "totalCount": 182,
        "currentPageNo": 1,
        "totalPageCount": 19
    }
  }
  ```

list详细说明：

| 字段名                          | 字段类型    | 说明             |
| ---------------------------- | ------- | -------------- |
| id                           | Integer | 主键id           |
| appId                        | Integer | 应用id           |
| day                          | String  | 统计日期yyyy-MM-dd |
| timePeriods                  | String  | 统计时段           |
| ibOffered                    | Integer | 呼入数            |
| ibAnswered                   | Integer | 呼入接通数          |
| ibAnsweredRate               | String  | 呼入接通率          |
| ibAnsweredAvgDuration        | Integer | 接通平均时长         |
| ibBridged                    | Integer | 转接数            |
| ibBridgedAnswered            | Integer | 转接接通数          |
| ibBridgedAnsweredRate        | String  | 外呼转接接通率        |
| ibBridgedAnsweredAvgDuration | Integer | 转接平均时长         |
| createTime                   | Date    | 创建时间           |

# 查询操作日志

查询操作日志

| 请求地址 | /operationLogs |
| ---- | -------------- |
| 请求方法 | GET            |

- 请求参数

| 字段名       | 是否必须 | 字段类型    | 说明         |
| --------- | ---- | ------- | ---------- |
| start     | 否    | Integer | 分页参数：开始记录数 |
| limit     | 否    | Integer | 分页参数：页面大小  |
| startTime | 是    | String  | 开始日期       |
| endTime   | 是    | String  | 结束日期       |

- 返回结果：

      ｛
          "result": "0",
          "description": "success",
          "list": [
              {
                  "id": 217,
                  "operater_name": "ZJ",
                  "operation_account": "111",
                  "operation_app_name": "语音通知",
                  "operation_type": "删除呼入资费",
                  "operation_before": "热线号码:111* 单价:131313",
                  "operation_after": "",
                  "operation_date": 1516271370056,
                  "operation_id": 217
              }
              ···
          ],
          "data": null,
          "page": {
              "start": 0,
              "pageSize": 10,
              "totalCount": 7,
              "currentPageNo": 1,
              "totalPageCount": 1
          }
      ｝


list详细说明:

| 字段名                | 字段类型    | 说明              |
| ------------------ | ------- | --------------- |
| id                 | Integer | 主键id            |
| operater_name      | String  | 操作人姓名           |
| operation_account  | String  | 被操作企业名称         |
| operation_app_name | String  | 被操作应用名称 操作企业时为空 |
| operation_type     | String  | 具体操作 如修改资费      |
| operation_before   | String  | 操作之前的数据         |
| operation_after    | String  | 操作之后的数据         |
| operation_date     | Date    | 操作日期            |
