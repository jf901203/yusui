import Mock from "mockjs";
import util from "@/libs/util.js";

const success = {
  code: 200,
  message: "success",
  result: {},
  success: true
};

/**
 * @param {String} url 请求地址
 * @param {Array} data 返回的数据列表
 */
Mock.get = (url, data) => {
  return Mock.mock(url, "get", {
    ...success,
    result: {
      records: data,
      total: data.length
    }
  });
};

/**
 * @param {String} url 请求地址
 * @param {Array} oData 原始数据列表
 */
Mock.post = (url, oData) => {
  return Mock.mock(url, "post", opt => {
    let data = util.deserialize(opt.body);
    data.id = new Date().getTime() + "";
    oData.push(data);
    return success;
  });
};

/**
 * @param {String} url 请求地址
 * @param {Array} oData 原始数据列表
 */
Mock.put = (url, oData) => {
  return Mock.mock(url, "put", opt => {
    let data = util.deserialize(opt.body);
    oData.forEach((item, i) => {
      if (item.id === data.id) {
        oData[i] = data;
      }
    });
    return success;
  });
};

/**
 * @param {String} url 请求地址
 * @param {Array} oData 原始数据列表
 */
Mock.delete = (url, oData) => {
  return Mock.mock(url, "delete", opt => {
    let ids = opt.url.substr(opt.url.lastIndexOf("/") + 1);
    oData.forEach((item, i) => {
      if (ids.includes(item.id)) {
        oData.splice(i);
      }
    });
    return success;
  });
};

export default Mock;
