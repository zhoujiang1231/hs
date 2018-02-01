# vlink-data接口文档设计

# 数据结构示例

| 字段          | 说明                 |
| ----------- | ------------------ |
| result      | 请求状态码：0表示成功；1表示失败  |
| description | 状态描述如请求成功或者密码错误等信息 |
| list        | 具体数据               |
| data        | 时间戳等信息             |
| page        | 用于分页等功能的参数如页数、记录总数 |

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
# 公共接口

## 获取客户信息

| 接口地址 | /vlinkAccounts |
| ---- | -------------- |
| 方法   | GET            |

- 请求参数（json）

  | 字段   | 是否必须 | 数据类型   | 说明   |
  | ---- | ---- | ------ | ---- |
  | type | 是    | String | 必须为1 |

  ​

- 返回结果

      {
      "result": "0",
      "description": "success",
      "list": [{
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
      ],
      "data":null,
      "page":null
      }

list详细说明：

| 字段       | 数据类型    | 说明   |
| -------- | ------- | ---- |
| id       | Integer | 企业id |
| fullName | String  | 企业名称 |



## 获取客户对应应用

| 接口地址 | /vlinkApps |
| ---- | ---------- |
| 方法   | GET        |

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

# 1登录相关接口

## 1.获取验证码

| 接口地址 | /securityCode |
| ---- | ------------- |
| 方法   | GET           |
| 请求参数 | 无             |
| 返回结果 | 验证码图片         |

## 2.登录

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



# 2首页相关接口

## 1.获取APP信息

| 接口地址 | /vlinkApps |
| ---- | ---------- |
| 方法   | GET        |

请求参数：

| 字段             | 是否必须 | 数据类型    | 说明           |
| -------------- | ---- | ------- | ------------ |
| vlinkAccountId | 是    | Integer | 必须为当前登录企业的id |



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
              },
              {
                  "id": 619,
                  "vlinkAccountId": 1288,
                  "vlinkAccountShortName": null,
                  "appId": 5000547,
                  "appName": "总分机",
                  "createTime": 1498470174614,
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

  list详细说明:

  | 字段            | 数据类型    | 说明    |
  | ------------- | ------- | ----- |
  | appName       | String  | 应用名称  |
  | createTime    | String  | 创建时间  |
  | webCallTotal  | Integer | 今日呼叫量 |
  | answeredCount | Integer | 今日接通量 |
  | answerRate    | String  | 今日接通率 |

## 2.扣费


| 接口地址 | /CustomerDeductLog |
| ---- | ------------------ |
| 方法   | POST               |

- 请求参数（json）

  | 字段         | 是否必须 | 数据类型     | 说明         |
  | ---------- | ---- | -------- | ---------- |
  | customerId | 可空   | String[] | 企业id，以逗号分隔 |


- 返回结果

    {
    		"result": "0",
    		"description": "success",
    		"list": null,
    		"data": null,
    		"page": null
    	}


## 3.预扣费

| 接口地址 | /PreDeductLog |
| ---- | ------------- |
| 方法   | POST          |

- 请求参数（json）

  | 字段         | 是否必须 | 数据类型     | 说明         |
  | ---------- | ---- | -------- | ---------- |
  | customerId | 可空   | String[] | 企业id，以逗号分隔 |


- 返回结果

   {
   	    "result": "0",
   	    "description": "success",
   	    "list": null,
   	    "data": null,
   	    "page": null
   	}

# 3应用报表相关接口

## 1.客户下拉框初始化

[#获取客户信息]: (#获取客户信息)



## 2.获取客户对应应用



## 3.获取报表数据

| 接口地址 | useTables |
| ---- | --------- |
| 方法   | GET       |

- 请求参数

  | 字段        | 是否必须 | 数据类型   | 说明                  |
  | --------- | ---- | ------ | ------------------- |
  | accountId | 是    | String | 企业id                |
  | appId     | 是    | String | 应用Id                |
  | rptType   | 是    | String | 报表类型1：日报表2：周报表3：月报表 |
  | rptDate   | 是    | String | 日期1：今天2：昨天          |
  | rptOut    | 是    | String | 显示方式                |
  | start     | 否    | String |                     |
  | limit     | 否    | String |                     |

- 返回结果（json）

  list详细说明：

  | 字段              | 数据类型    | 说明   |
  | --------------- | ------- | ---- |
  | dateTime        | String  | 统计时段 |
  | webCallTotal    | Integer | 呼叫数量 |
  | answeredCount   | Integer | 接通数量 |
  | lostCallOffered | Integer | 未接数量 |
  | totalDuration   | String  | 通话时长 |
  | billDuration    | String  | 接听时长 |
  | bridgeDuration  | String  | 桥接时长 |

  page详细说明：

  | 字段             | 数据类型    | 说明    |
  | -------------- | ------- | ----- |
  | totalCount     | Integer | 总记录数  |
  | pageSize       | Integer | 页面记录数 |
  | start          | Integer | 开始页数  |
  | currentPageNo  | Integer | 当前页数  |
  | totalPageCount | Integer | 总页数   |

  ​

# 4通话记录相关接口

## 1.客户初始化

## 2.获取客户对应应用

## 3.获取通话记录数据

| 接口地址 | callRecords |
| ---- | ----------- |
| 方法   | POST        |

- 请求参数（json）

  | 字段               | 是否必须 | 数据类型    | 说明   |
  | ---------------- | ---- | ------- | ---- |
  | appId            | 必须   | Integer | 应用id |
  | number           |      | String  | 号码类型 |
  | cdrInstanceValue |      | String  |      |
  | callType         |      | Integer | 呼叫类型 |
  | obStatus         |      | Integer | 接听状态 |
  | ibStatus         |      | String  |      |
  | dateFrom         |      | String  |      |
  | dateTo           |      | String  |      |
  | searchDate       |      | String  |      |
  | start            |      | Integer |      |
  | limit            |      | Integer |      |

  ​

- 返回结果（json）

  | 字段                      | 数据类型 | 说明     |
  | ----------------------- | ---- | ------ |
  | customerNumber          |      | 外呼号码   |
  | customerClidNumber      |      | 外呼外显号码 |
  | bridgeNumber            |      | 转接号码   |
  | bridgeClidNumber        |      | 呼转外显号码 |
  | requestTimeStr          |      | 外呼请求时间 |
  | answerTimeStr           |      | 外呼接通时间 |
  | bridgeTimeStr           |      | 转接接通时间 |
  | endTimeStr              |      | 通话结束时间 |
  | statusDesc              |      | 通话状态   |
  | recordFile              |      | 录音     |
  | recordAppCustomerNumber |      |        |
  | timestamp               |      |        |
  | sign                    |      |        |

## 4.导出

| 接口地址 | callRecord/file |
| ---- | --------------- |
| 方法   | POST            |

- 请求参数

  | 字段       | 数据类型    | 说明   |
  | -------- | ------- | ---- |
  | appId    | String  |      |
  | callType | Integer |      |
  | selectId | Integer |      |
  | chkDate  | Integer |      |

- 返回结果

  | 字段   | 数据类型   | 说明     |
  | ---- | ------ | ------ |
  | url  | String | 文件下载地址 |

  ​

# 5权限管理相关接口

## 1.获取所有权限



# 6直销部门管理相关接口

## 1.获取所有直销部门

## 2.获取直销部门详细信息

## 3.删除直销部门

## 4.新建直销部门

## 5.修改直销部门信息

# 7直销经理管理相关接口

## 1.初始化所属部门

## 2.获取直销经理详细信息

## 3.删除直销经理

## 4.新建直销经理

## 5.修改直销经理信息

# 8企业管理相关接口

## 1.初始化所属部门

## 2.获取所属部门所属经理

## 3.根据条件查询企业

## 4.获取企业信息

### 1.企业基本信息

#### 1.获取企业基本信息

#### 2.获取上传文件列表信息

#### 3.修改企业基本信息

#### 4.删除文件相关数据

### 2.企业业务信息

#### 1.获取企业基本信息

#### 2.初始化所属部门

#### 3.获取所属部门的所属经理

#### 4.修改直销经理

#### 5.修改企业月消费

#### 6.修改本月折扣

### 3.企业应用管理

#### 1.新建应用

#### 2.删除应用

#### 3.获取账户对应的应用

#### 4.查看应用信息

##### 1.删除文件相关数据

##### 2.获取上传文件列表信息

##### 3.上传文件

#### 5.修改应用信息

#### 6.配置应用

##### 1.呼入资费

###### 1.获取呼入资费列表

###### 2.删除一条呼入资费

###### 3.增加一条呼入资费

###### 4.修改呼入资费

##### 2.呼入转接资费

###### 1.获取呼入转接资费列表

###### 2.删除一条呼入转接资费

###### 3.增加一条呼入转接资费

###### 4.修改呼入转接资费

##### 3.外呼资费

###### 1.获取外呼资费列表

###### 2.删除一条外呼资费

###### 3.增加一条外呼资费

###### 4.修改外呼资费

##### 4.外呼转接资费

###### 1.获取外呼转接资费列表

###### 2.删除一条外呼转接资费

###### 3.增加一条外呼转接资费

###### 4.修改呼入资费

##### 5.其他资费设置

###### 1.获取短信资费

###### 2.修改短信资费

###### 3.删除短信资费

###### 4.添加短信资费

#### 7.删除应用

## 5.删除企业

## 6.新建企业

## 7.修改企业信息

