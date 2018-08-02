package com.tinet.vnc.inc;


public class Const {
    public static final String UPDATE = "0";//更新
    public static final String INSERT = "1";//新增

    /**
     * 返回信息 成功
     **/
    public static final int RETURN_SUCCESS = 0;
    /**
     * 返回信息 失败
     **/
    public static final int RETURN_ERROR = 1;
    /**
     * http返回200
     **/
    public static final int RETURN_HTTP_STATUS_200 = 200;
    /**
     * 网络请求超时
     **/
    public static final int RETURN_HTTP_CONNECT_TIMEOUT = 408;
    /**
     * 网络读取超时
     **/
    public static final int RETURN_HTTP_READ_TIMEOUT = 503;
    /**
     * 返回状态非200
     **/
    public static final int RETURN_HTTP_STATUS_CODE_NO_200 = 400;
    /**
     * url为空
     **/
    public static final int RETURN_HTTP_URL_ISNULL = 406;
    /**
     * 地址无法解析
     **/
    public static final int RETURN_HTTP_ADDRESS_REEOR = 505;


    /**
     * 创建被叫通道失败
     **/
    public static final int STATUS_CODE_CREATE_CALLEE_CHANNEL_FAIL = 8;
    /**
     * 开始拨打被叫
     **/
    public static final int STATUS_CODE_CALLING_CALLEE = 9;
    /**
     * 被叫响铃
     **/
    public static final int STATUS_CODE_CALLEE_RINGING = 10;
    /**
     * 被叫忙
     **/
    public static final int STATUS_CODE_CALLEE_BUSY = 11;
    /**
     * 被叫无应答
     **/
    public static final int STATUS_CODE_CALLEE_NO_ANSWER = 12;
    /**
     * 被叫接听
     **/
    public static final int STATUS_CODE_CALLEE_ANSWER = 13;
    /**
     * 拨打被叫失败
     **/
    public static final int STATUS_CODE_CALL_CALLEE_FAIL = 14;
    /**
     * 呼叫结束
     **/
    public static final int STATUS_CODE_CALL_FINISHED = 15;
    /**
     * 主叫挂机
     **/
    public static final int STATUS_CODE_CALLER_HANGUP = 7;


    /**********************语音识别 通话状态******************************/
    /**
     * 语音识别总状态
     **/
    public static final int SPEECH_RECOGNITION_STATUS = 700;
    /**
     * 被叫忙
     **/
    public static final int SPEECH_RECOGNITION_BUSY = 710;
    /**
     * 被叫拒接
     **/
    public static final int SPEECH_RECOGNITION_REJECT = 712;
    /**
     * 被叫空号
     **/
    public static final int SPEECH_RECOGNITION_INVALID_NUMBER = 713;
    /**
     * 被叫关机
     **/
    public static final int SPEECH_RECOGNITION_POWER_OFF = 714;
    /**
     * 被叫暂时无法接通
     **/
    public static final int SPEECH_RECOGNITION_UNAVAILABLE = 715;
    /**
     * 被叫暂时无法接通
     **/
    public static final int SPEECH_RECOGNITION_SUSPEND = 716;

    /**
     * 通话每分钟计费 单位：元
     **/
    public static final double CALL_BILL_DURATION_COST = 0.05;

    /**
     * redis 相关配置
     */
    public static final String REDIS_SET_RETURN_OK = "OK";
    public static final Integer REDIS_SCAN_MAX_TIMES = 10000;
    public static final int REDIS_DB_NON_CONFIGURE_INDEX = 2;
    public static final int REDIS_DB_AREA_CODE_INDEX = 5;
    public static final int REDIS_DB_SAVE_TIME_LIMIT = 600;
    public static final int REDIS_DB_V1_INDEX = 6;
    public static final int REDIS_DB_V3_INDEX = 7;
    public static final int REDIS_DB_V3_BIND_NUM_INDEX = 8;
    public static final int REDIS_DB_V3_REF_VAP_CALLIN_INDEX = 9;
    public static final int REIDS_DB_V3_X_COUNT_INDEX = 10;


    /**
     * 查询limit限制
     **/
    public static final int QUERY_CDR_MAX_LIMIT = 1000;

    /**
     * 链家话务查询接口无绑定关系返回code
     **/
    public static final int QUERY_VIRTUAL_TP_NO_BINDING = 230004;
    /**
     * 链家话务查询接口json格式错误返回code
     **/
    public static final int QUERY_VIRTUAL_JSON_ERROR = 230005;

    /**
     * 电信查询成功code
     **/
    public static final int QUERY_CALL_CDR_PARTNER_SUCCESS_CODE = 0000000000;
    /**
     * 电信查询成功 但无数据返回code
     **/
    public static final int QUERY_CALL_CDR_PARTNER_SUCCESS_NODATA_CODE = 0002020001;
    /**
     * 电信成功code
     **/
    public static final String PARTNER_SUCCESS_CODE = "0000000000";
    /**
     * 电信成功code
     **/
    public static final String PARTNER_ERROR_CODE = "0000000001";

    /**
     * 默认推送线程
     **/
    public static final Integer DEFAULT_PUSH_THREAD = 5;

    /**
     * 双方接听状态
     **/
    public static final String ANSWER_STATUS_CODE = "13";
    /**
     * 初始化重试状态
     **/
    public static final boolean INC_RETRY_STATUS = false;
    /**
     * 初始化重试开始次数
     **/
    public static final int INC_RETRY_COUNT = 1;
    /**
     * 初始化重试开始时间
     **/
    public static final int INC_RETRY_WAIT_TIME = 60;

    /**
     * 请求方法 post
     **/
    public static final String HTTP_REQUEST_METHOD_POST = "POST";
    /**
     * 请求超时 时间
     **/
    public static final int HTTP_REQUEST_TIMEOUT = 5;

    /**
     * 通话等待ivr 彩铃 caller
     **/
    public static final int CALL_VIOCE_IVE_CALLER = 1;
    /**
     * 通话等待ivr 录音 callee
     **/
    public static final int CALL_VIOCE_IVE_CALLEE = 0;

    /**
     * 电信service_type 录音地址推送
     **/
    public static final String CALL_VOICE_SERVICE_TYPE = "1";
    /**
     * 电信service_type 通话时长推送
     **/
    public static final String CALL_DURATION_SERVICE_TYPE = "2";
    /**
     * 电信service_type 通话状态推送
     **/
    public static final String CALL_STATUS_SERCICE_TYPE = "3";
    /**
     * 电信service_type 下行短信状态回推
     **/
    public static final String SMS_CALLBACK_STATUS_SERVICE_TYPE = "9";
    /**
     * 电信service_type 上行短信推送
     **/
    public static final String SMS_UP_SERVICE_TYPE = "10";


    /**
     * hotline 空闲
     **/
    public static final int HOTLINE_OR_CLID_STATUS_FREE = 0;
    /**
     * hotline 已使用
     **/
    public static final int HOTLINE_OR_CLID_STATUS_USEING = 1;

    /**
     * 绑定号码关系subtel为空默认值
     **/
    public static final String BIND_SUBTEL_DEFULT = "00000001";
    /**
     * 绑定号码关系 expiredTime默认值
     **/
    public static final String BIND_EXPIRE_TIME_DEFULT = "0";

    /**
     * 时间戳超时时间设置
     **/
    public static final int INTERFACE_TIMESTAMP_SESSION_TIME = 30;

    /**
     * 开户默认vncAppId
     **/
    public static final String DEFULT_VNC_APP_ID = "5400000";

    /**
     * 绑定
     **/
    public static final int BIND_NUM_STATUS = 1;
    /**
     * 更新绑定
     **/
    public static final int UPDATE_BIND_NUM_STATUS = 2;
    /**
     * 解除绑定
     **/
    public static final int UN_BIND_NUM_STATUS = 3;
    /**
     * 在线语音主叫请求和响应
     **/
    public static final int ONLINE_CALL_STATUS = 4;
    /**
     * 外呼转接配置设置请求和响应
     **/
    public static final int OUTTRANSFER = 5;
    /**
     * 外呼转接配置删除请求和响应
     **/
    public static final int UN_BIND_OUTTRANSFER = 6;

    /**
     * 需要定时解绑
     **/
    public static final int IS_TIMER_UN_BIND_NUM = 0;
    /**
     * 不需要定时解绑
     **/
    public static final int NO_TIMER_UN_BIND_NUM = 1;

    /**
     * 陕西联通返回成功标识 200
     **/
    public static final int SX_UNICOM_SUCCESS_CODE = 200;

    /**
     * AX serviceType
     **/
    public static final String AX_SERVICE_TYPE = "AX";
    /**
     * AXB serviceType
     **/
    public static final String AXB_SERVICE_TYPE = "AXB";
    /**
     * AXYB serviceType
     **/
    public static final String AXYB_SERVICE_TYPE = "AXYB";
    /**
     * AXN serviceType
     **/
    public static final String AXN_SERVICE_TYPE = "AXN";

    /**
     * 虚拟小号 AX 空闲
     **/
    public static final int VIRTUAL_STATUS_FREE = 0;
    /**
     * 虚拟小号 AX 占用
     **/
    public static final int VIRTUAL_STATUS_USEING = 1;

    /**
     * AX挂机解绑标识
     **/
    public static final String UNBIND_TYPE_DEFAULT = "1";
    public static final String UNBIND_TYPE_KEY = "vnc.v3.unbindtype.";

    /**
     * 生成陕西联通需求subid
     **/
    public final static String SUB_ID_KEY = "vnc.v3.subid";

    /**
     * 正则表达式 判断是否是固话号
     **/
    public final static String PHONE = "^400\\d{7}$|^010\\d{8}$|^02\\d{9}$|^0[3,4,5,6,7,8,9][0-9]\\d{8,9}$";
    /**
     * 正则表达式 判断是否是手机号
     **/
    public final static String MOBILEPHONE = "^(13|14|15|16|17|18|19)\\d{9}$";

    /**
     * 广西联通所需常量
     **/
    // 测试
//	public static final String APP_KEY = "JDPT_1234";
//	public static final String APP_KEY = "JDPT_";
//	public static final String SECRET_KEY = "dfjr_jdpt_100";

    // 正式
//	public static final String APP_KEY = "TRRT_0001"; // 0001 为VNC自定义，可见接口文档中appkey的描述
//	public static final String APP_KEY = "TRRT_"; // 0001 为VNC自定义，可见接口文档中appkey的描述
//	public static final String SECRET_KEY = "dfjr_trrt_112";

    public static final String PUSH_TYPE_CALLIN = "callin";
    public static final String PUSH_TYPE_FINISH = "finish";

    /**
     * EnterpriseSetting
     **/
    public static final String ENTERPRISE_SETTING_NAME_PUSH_CURL = "push_curl";
    public static final String ENTERPRISE_SETTING_NAME_PUSH_CALLIN_CURL = "push_callin_curl";
    public static final String ENTERPRISE_SETTING_NAME_IS_UNBIND = "is_unbind";//0 需要解绑
    public static final String ENTERPRISE_SETTING_NAME_UNBIND = "0";//0 需要解绑
    public static final String ENTERPRISE_SETTING_NAME_FINISH_IS_BIND = "finish_is_bind";//1 需要绑定
    public static final String ENTERPRISE_SETTING_NAME_FINISH_BIND = "1";//1 需要绑定
    public static final String ENTERPRISE_SETTING_NAME_FINISH_IS_UNBIND = "finish_is_unbind";//0 需要解绑
    public static final String ENTERPRISE_SETTING_NAME_FINISH_UNBIND = "0";//0 需要解绑
    public static final String ENTERPRISE_SETTING_NAME_IS_UNBIND_FOR_OUTTRANSFERDEL = "is_unbind_for_outtransferdel";//0需要解绑
    public static final String ENTERPRISE_SETTING_NAME_UNBIND_FOR_OUTTRANSFERDEL = "0";// 0 需要解绑
    public static final String ENTERPRISE_SETTING_NAME_OPEN_FINISH_BING_CALLRECORDING = "finish_bind_callrecording";// 1需要录音
    public static final String ENTERPRISE_SETTING_NAME_FINISH_BING_CALLRECORDING = "1";// 1需要录音
    public static final String ENTERPRISE_SETTING_NAME_USER_FIELD = "user_field";// 1开启
    public static final String ENTERPRISE_SETTING_NAME_OPEN_USER_FIELD = "1";// 1开启
    public static final String ENTERPRISE_SETTING_NAME_SHORT_CALL_STATISTICS = "short_call_statistics"; // 企业开启RMS短通统计功能 1 代表开启
    public static final String ENTERPRISE_SETTING_NAME_NUMBER_RESTRICT_DETECTION = "number_restrict_detection"; // 企业开启RMS号码受限检测
    public static final String ENTERPRISE_SETTING_NAME_FINISH_UNBIND_WAIT_TIME = "finish_unbind_wait_time";
    public static final String ENTERPRISE_SETTING_NAME_ANUCODE_AXB = "anucode_axb";
    public static final String ENTERPRISE_SETTING_NAME_ANUCODE_AXYB = "anucode_axyb";
    public static final String ENTERPRISE_SETTING_NAME_ANUCODE_AXN = "anucode_axn";
    public static final String ENTERPRISE_SETTING_NAME_REF_VAP_CALLIN_ADAPTER = "ref_vap_callin_adapter"; // 关联vap的callinAdapter接口

    public static final String SYSTEM_SETTING_NAME_INSIDE_AUTHENTIFICATION_TOKEN = "inside_authentification_token"; // 内部接口鉴权使用token
    public static final String SYSTEM_SETTING_NAME_IP_WHITE_LIST = "ip_white_list"; // ip白名单
    public static final String SYSTEM_SETTING_NAME_RMS_NUMBER_CALL_LIMIT_CHECK = "rms_number_call_limit_check"; // 全局配置是否开启RMS号码受限检测 1开启
    public static final String SYSTEM_SETTING_NAME_CALLBACK_AND_LOG_RECORD_RESERVE_MONTH = "callback_and_log_record_reserve_month"; // 话单回调和日志记录保留期限，格式为{"unit":"month","number":"1"}
    public static final String SYSTEM_SETTING_NAME_LOG_CURL_RESERVE_MONTH = "log_curl_reserve_month"; // 请求记录表保留期限，格式为{"unit":"month","number":"1"}

    /**
     * 告警地址
     */
    public static final String SYSTEM_SETTING_NAME_ALERT_EMAIL = "alter_email"; // 告警邮箱，多个以英文逗号隔开
    public static final String SYSTEM_SETTING_NAME_ALERT_PHONE = "alter_phone"; //告警电话联系人，多个以英文逗号隔开
    public static final String SYSTEM_SETTING_NAME_ALERT_SMS = "alter_sms"; //告警短信联系人，多个以英文逗号隔开
    public static final String SYSTEM_SETTING_NAME_ALERT_DINGDING = "alter_dingding"; // 钉钉告警地址，多个以英文逗号隔开

    public static final int CALLBACK_AND_LOG_RECORD_NO_REMOVE_AT_LEAST_MONTH = 6; // 业务日志和回调表最低保留期限6个月
    public static final int LOG_CURL_REMOVE_AT_LEAST_MONTH = 3; // 请求记录最低保留期限3天

    public static final Integer LOG_CURL_TYPE_FINISH = 1;
    public static final Integer LOG_CURL_TYPE_CALLIN = 2;

    public static final String FINISH_BIND_SUBID = ".finish.bind.subid";
    public static final String FINISH_UNBIND_TASK_QUEUE = "finish.unbind.task.queue"; // finish解绑中 任务队列
    public static final String FINISH_UNBIND_TMP_QUEUE = "finish.unbind.tmp.queue"; // finish解绑中 暂存队列

    public static final String PUSH_CALL_TYPE = "10";

    /**
     * RMS的redis配置项
     */
    public static final String cdrCallBackListForRms = "cdr:callback";
    public static final Integer RMS_CDR_CALLBACK_INDEX = 1;

    /**
     * http交互节点推送类型
     **/
    public static final Integer ENTERPRISE_PUSH_TYPE = 1;
    /**
     * ivr中http交互节点请求VNC 适用运营商广西联通，AX业务
     **/
    public static final String AX_V3_ONLINE_CALL = "http://vnc.vlink.cn/interface/v3/ax/onlinecall/";

    public static final String APPID_AXB_BIND_COUNT_BY_DAY = ".axb.bind.day";
    public static final String APPID_AXB_UPDATE_COUNT_BY_DAY = ".axb.update.day";

    public static final String APPID_AXB_BIND_COUNT_BY_MONTH = ".axb.bind.month";
    public static final String APPID_AXB_UPDATE_COUNT_BY_MONTH = ".axb.update.month";

    public static final String SYSTEM_AXB_BIND_COUNT_BY_DAY = "system.axb.bind.day";
    public static final String SYSTEM_AXB_UPDATE_COUNT_BY_DAY = "system.axb.update.day";

    public static final String SYSTEM_AXB_BIND_COUNT_BY_MONTH = "system.axb.bind.month";
    public static final String SYSTEM_AXB_UPDATE_COUNT_BY_MONTH = "system.axb.update.month";

    public static final String APPID_AX_BIND_COUNT_BY_DAY = ".ax.bind.day";
    public static final String APPID_AX_UPDATE_COUNT_BY_DAY = ".ax.update.day";

    public static final String APPID_AX_BIND_COUNT_BY_MONTH = ".ax.bind.month";
    public static final String APPID_AX_UPDATE_COUNT_BY_MONTH = ".ax.update.month";

    public static final String SYSTEM_AX_BIND_COUNT_BY_DAY = "system.ax.bind.day";
    public static final String SYSTEM_AX_UPDATE_COUNT_BY_DAY = "system.ax.update.day";

    public static final String SYSTEM_AX_BIND_COUNT_BY_MONTH = "system.ax.bind.month";
    public static final String SYSTEM_AX_UPDATE_COUNT_BY_MONTH = "system.ax.update.month";

    public static final String APPID_AXYB_BIND_COUNT_BY_DAY = ".axyb.bind.day";
    public static final String APPID_AXYB_UPDATE_COUNT_BY_DAY = ".axyb.update.day";

    public static final String APPID_AXYB_BIND_COUNT_BY_MONTH = ".axyb.bind.month";
    public static final String APPID_AXYB_UPDATE_COUNT_BY_MONTH = ".axyb.update.month";

    public static final String SYSTEM_AXYB_BIND_COUNT_BY_DAY = "system.axyb.bind.day";
    public static final String SYSTEM_AXYB_UPDATE_COUNT_BY_DAY = "system.axyb.update.day";

    public static final String SYSTEM_AXYB_BIND_COUNT_BY_MONTH = "system.axyb.bind.month";
    public static final String SYSTEM_AXYB_UPDATE_COUNT_BY_MONTH = "system.axyb.update.month";

    public static final String APPID_AXN_BIND_COUNT_BY_DAY = ".axn.bind.day";
    public static final String APPID_AXN_UPDATE_COUNT_BY_DAY = ".axn.update.day";

    public static final String APPID_AXN_BIND_COUNT_BY_MONTH = ".axn.bind.month";
    public static final String APPID_AXN_UPDATE_COUNT_BY_MONTH = ".axn.update.month";

    public static final String SYSTEM_AXN_BIND_COUNT_BY_DAY = "system.axn.bind.day";
    public static final String SYSTEM_AXN_UPDATE_COUNT_BY_DAY = "system.axn.update.day";

    public static final String SYSTEM_AXN_BIND_COUNT_BY_MONTH = "system.axn.bind.month";
    public static final String SYSTEM_AXN_UPDATE_COUNT_BY_MONTH = "system.axn.update.month";

    public static final String SYSTEM_NOW_REQUEST_GX_TOTAL_COUNT = "system.now.request.gx.total.count";
    public static final String SYSTEM_NOW_REQUEST_GX_SUCCESS_COUNT = "system.now.request.gx.success.count";

    /**
     * 存储需要告警的X号码
     */
    public static final String ALARM_TO_X_NUMBER_APP_ID = "vnc.alarm.to.x.number.%s";

    public static final String VNC_X_REQUEST_TOTAL = ".vnc.x.request.total";
    public static final String VNC_X_REQUEST_SUCCESS = ".vnc.x.request.success";

    /**
     * TRM接口地址
     */
    public static final String SYSTEM_SETTING_NAME_TRM_URL = "trm_url";

    /**
     * TRM接口TOKEN
     */
    public static final String SYSTEM_SETTING_NAME_TRM_TOKEN = "trm_token";

    /**
     * TRM接口 鉴权的appKey
     */
    public static final String SYSTEM_SETTING_NAME_TRM_APP_KEY = "trm_app_key";

    /**
     * TRM接口proxyId
     */
    public static final String SYSTEM_SETTING_NAME_TRM_PROXY = "trm_proxy_id";

    public static final Integer TRM_QUERY_SIZE = 100;

    /**
     * 选择的号码不改变TRM中号码的状态
     **/
    public static final Integer TRM_STATUS_UNCHANGE = -6;
    /* 空闲状态**/
    public static final Integer TRM_STATUS_UNBOUND = 1;
    /* 已绑定状态**/
    public static final Integer TRM_STATUS_BOUND = 2;
    /* 使用中状态**/
    public static final Integer TRM_STATUS_INUSE = 3;
    /* 冻结状态**/
    public static final Integer TRM_STATUS_FREEZE = 5;
    /**
     * 根据此参数值判断选号是否需要改变状态
     **/
    public static final String TRM_UNCHANGE_TRUNK_STATUS = "true";

    /* TRM查询目的码的接口地址**/
    public static final String TRM_QUERY_ALL = "/open-api/trunks";
    /* TRM选号的接口地址**/
    public static final String TRM_ALLOCATE_CHOOSE = "/open-api/trunks/status/inuse";
    /* TRM取消选号的接口地址**/
    public static final String TRM_ALLOCATE_CANCEL = "/open-api/trunks/status/freeze";

    /* v3接口访问东盟接口的socket超时时间**/
    public static final Integer V3_SOCKET_TIMEOUT = 2000;

    /* v3接口访问东盟接口的connect超时时间**/
    public static final Integer V3_CONNECT_TIMEOUT = 2000;


    /**
     * 发送短信的接口地址
     */
    public static final String SYSTEM_SETTING_NAME_SEND_MSG_URL = "send_msg_url";
    /**
     * 发送短信的account
     */
    public static final String SYSTEM_SETTING_NAME_SEND_MSG_ACCOUNT = "send_msg_account";
    /**
     * 发送短信的pswd
     */
    public static final String SYSTEM_SETTING_NAME_SEND_MSG_PSWD = "send_msg_pswd";
    /**
     * 打电话的接口地址
     */
    public static final String SYSTEM_SETTING_NAME_CALL_URL = "call_url";
    /**
     * 打电话的Appid
     */
    public static final String SYSTEM_SETTING_NAME_CALL_APPID = "call_appid";
    /*** 打电话的token*/
    public static final String SYSTEM_SETTING_NAME_CALL_TOKEN = "call_token";
    /*** 打电话的ivrId*/
    public static final String SYSTEM_SETTING_NAME_CALL_IVRID = "ivrId";
    /*** 打电话的动态参数名*/
    public static final String SYSTEM_SETTING_NAME_CALL_DYNAMIC_NAME = "dynamic_name";

    public static final String ALARM_SETTING_TYPE_X_CONNECTION_2 = "2";//X号码接通率告警类型
    public static final String ALARM_SETTING_TYPE_REQUEST_GX_1 = "1";//请求东盟接口告警类型

}
