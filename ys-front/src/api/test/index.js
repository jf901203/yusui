import { getRequest, postRequest, putRequest, deleteRequest, uploadFileRequest } from "@/libs/axios";

// 获取全部测试数据
export const getTestData = params => {
  return getRequest("/test/find", params);
};
// 添加测试数据
export const saveTest = params => {
  return postRequest("/test/save", params);
};
// 编辑测试数据
export const updateTest = params => {
  return putRequest("/test/update", params);
};
// 删除测试数据
export const deleteTest = (ids, params) => {
  return deleteRequest(`/test/del/${ids}`, params);
};
