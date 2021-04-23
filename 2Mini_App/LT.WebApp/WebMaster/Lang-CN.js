/***登录界面Login***/
var loginStr = {
    winTitle: '登录窗口',
    name: '用户名',
    pwd: '密码',
    btnLogin: '登录',
    btnCancel: '取消',
    loginError: '用户登录失败',
    validFail: '输入内容有误，请检查',
    confirmLogout: '确定注销系统？',
    logoutSuccess: '注销成功',
    logoutError: '注销失败',
    simplePwd: '密码为初始密码，修改密码？'
};

/***公共的字符串***/
var commonStr = {
    title: '提示',
    towDataError: '开始日期和结束日期要同时填写！',
    towDataCompareError: '开始日期必须小于结束日期！',
    towNumError: '数量的最大值和最小值必须同时填写！',
    towNumCompareError: '数量最小值必须小于最大值！',
    formDataError: '填写内容不规范！',

    noPermission: '无相应的权限',

    queryError: '查询失败',
    addSuccess: '添加成功',
    addError: '添加失败',
    noSelectUpdate: '请选择要进行修改的项',
    updateSuccess: '修改成功',
    updateError: '修改失败',
    noSelectDelete: '请选择要进行删除的项',
    confirmDelete: '确定要删除选择的项',
    deleteSuccess: '删除成功',
    deleteError: '删除失败',
    noSelectAssign: '请选择要进行分派的单据',
    noSelectStart: '请选择要查看的单据',
    noSelectVideo: "请选择要进行查看视频的单据",
    assignSuccess: '单据分派成功',
    assignError: '单据分派失败',
    cancelSuccess: "取消单据成功！",
    commonSelectShelve: "所选择的两个库位相同",

    noSelectCheck: '请选择要进行审核的项',
    checkSuccess: '审核添加成功',
    checkError: '审核添加失败',
    noReasonOfCheckNo: '审核未通过时，必须填写原因。',
    submitSuccess: '提交成功',
    submitError: '提交失败',
    startSuccess: "开始执行成功！",
    startError: "单据开始出错。",
    endSuccess: "结束执行成功！",
    endError: "单据结束出错。",
    pauseSuccess: "单据已暂停！",
    pauseError: "单据暂停出错！",
    stopSuccess: "单据强制执行完成成功！",
    stopError: "单据强制完成出现错误！"
};

/***组织架构信息***/
var orgStructure = {
    getOneCompanyError: '获取分公司详情失败！',
    getOneWarehouseError: '获取仓库详情失败！',
    getOneShelvesError: '获取库位详情失败！',
    confirmDeleteCompanyHasWarehouse: '分公司下存在仓库，确定要删除选择的项',
    confirmDeleteOtherModuleHasWarehouse: '该仓库已被其他模块占用，确定要删除选择的项'
};

var baseData = {
    getOneProductError: '获取产品详情失败！',
    getOneAccountError: '获取客户详情失败！',
    getOneForkliftError: '获取叉车详情失败！'
};

/***系统管理***/
var sysManager = {
    getOneDictionaryError: '获取数据字典失败！',
    getOneRoleError: '获取角色信息失败！',
    noSelectReset: '请选择要进行重置的项',
    confirmReset: '是否确定重置所选的密码',
    resetSuccess: '重置成功',
    resetError: '重置失败',

    getRoleTypeError: '获取用户角色失败！',
    noSelectReset: '请选择要进行重置的项',
    confirmReset: '是否确定重置所选想的密码',
    resetSuccess: '重置成功',
    resetError: '重置失败',

    getPermissionTypeError: '获取角色权限失败！',
    selectPermissionError: '请选择角色权限！',

    confirmRestore: '确定要还原选择的项',
    restoreSuccess: '还原成功',
    restoreError: '还原失败',

    pwdError: '两次输入的密码不一致',
    updatePwdSuccess: '密码修改成功！请重新登录系统。',
    getOneSysUserError: '获取用户详情失败！'
};

/***查询统计***/
var queryCount = {
    getCountWork: '获取工作统计失败！',
    getCountMonWarehouseInOrOut: '获取当月出入库数量失败！',
    getCountFRID: '获取当前库存总数失败！'
};
