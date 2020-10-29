<style lang="less">
@import "./own-space.less";
</style>

<template>
  <div class="own-space">
    <Card>
      <Tabs :animated="false">
        <TabPane label="基本信息" name="info">
          <Form
            ref="userForm"
            :model="userForm"
            :label-width="100"
            label-position="right"
            :rules="validate"
          >
            <FormItem label="用户头像：">
              <div class="upload-list" v-for="item in uploadList" :key="item.url">
                <template v-if="item.status === 'finished'">
                  <img :src="item.url">
                  <div class="upload-list-cover">
                    <Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
                    <Icon type="ios-trash-outline" @click.native="handleRemove(item)"></Icon>
                  </div>
                </template>
                <template v-else>
                  <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
                </template>
              </div>
              <Upload
                ref="upload"
                :show-upload-list="false"
                :default-file-list="defaultList"
                :on-success="handleSuccess"
                :on-error="handleError"
                :format="['jpg','jpeg','png','gif']"
                :max-size="5120"
                :on-format-error="handleFormatError"
                :on-exceeded-size="handleMaxSize"
                :before-upload="handleBeforeUpload"
                type="drag"
                :action="uploadFileUrl"
                :headers="accessToken"
                style="display: inline-block;width:58px;"
              >
                <div style="width: 58px;height:58px;line-height: 58px;">
                  <Icon type="md-camera" size="20"></Icon>
                </div>
              </Upload>
            </FormItem>
            <FormItem label="用户账号：">
              <span>{{userForm.username}}</span>
            </FormItem>
            <FormItem label="性别：">
              <RadioGroup v-model="userForm.sex">
                <Radio
                  v-for="(item, i) in dictSex"
                  :key="i"
                  :label="Number(item.value)"
                >{{item.title}}</Radio>
              </RadioGroup>
            </FormItem>
            <FormItem label="手机号：" prop="mobile">
              <Input v-model="userForm.mobile" placeholder="请输入新手机号" style="width:250px"/>
            </FormItem>
            <FormItem label="邮箱：" prop="email">
              <Input v-model="userForm.email" placeholder="请输入新邮箱地址" style="width:250px"/>
            </FormItem>
            <FormItem label="地址：">
              <al-cascader
                v-model="userForm.addressArray"
                @on-change="changeAddress"
                data-type="code"
                level="2"
                style="width:250px"
              />
            </FormItem>
            <FormItem label="所属部门：">
              <span>{{ userForm.departmentTitle }}</span>
            </FormItem>
            <FormItem label="用户类型：">
              <span>{{ userForm.typeTxt }}</span>
            </FormItem>
            <FormItem label="创建时间：">
              <span>{{ userForm.createTime }}</span>
            </FormItem>
            <FormItem>
              <Button
                type="primary"
                style="width: 100px;margin-right:5px"
                :loading="saveLoading"
                @click="handleSubmit"
              >保存</Button>
              <Button @click="cancelEditUserInfo">取消</Button>
            </FormItem>
          </Form>
        </TabPane>
      </Tabs>
    </Card>
    <Modal title="图片预览" v-model="viewImage" draggable>
      <img :src="imgUrl" style="width: 80%;margin: 0 auto;display: block;">
      <div slot="footer">
        <Button @click="viewImage=false">关闭</Button>
      </div>
    </Modal>
  </div>
</template>

<script>
import {
  userInfoEdit,
  relatedInfo,
  unRelate,
  uploadFile,
  getDictDataByType
} from "@/api/index";
import Cookies from "js-cookie";
export default {
  name: "ownspace_index",
  data() {
    const validePhone = (rule, value, callback) => {
      var re = /^1[0-9]{10}$/;
      if (!re.test(value)) {
        callback(new Error("请输入正确格式的手机号"));
      } else {
        callback();
      }
    };
    return {
      accessToken: {},
      uploadFileUrl: uploadFile,
      userForm: {
        id: "",
        avatar: "",
        username: "",
        sex: "",
        mobile: "",
        email: "",
        status: "",
        type: "",
        typeTxt: "",
        address: "",
        addressArray: []
      },
      defaultList: [
        {
          url: ""
        }
      ],
      uploadList: [],
      viewImage: false,
      imgUrl: "",
      uid: "", // 登录用户的userId
      saveLoading: false,
      savePassLoading: false,
      oldPassError: "",
      validate: {
        mobile: [
          { required: true, message: "请输入手机号码" },
          { validator: validePhone }
        ],
        email: [
          { required: true, message: "请输入邮箱地址" },
          { type: "email", message: "邮箱格式不正确" }
        ]
      },
      jumping: false,
      dictSex: []
    };
  },
  methods: {
    init() {
      this.getDictSexData();
      this.accessToken = {
        accessToken: this.getStore("accessToken")
      };
      let v = JSON.parse(Cookies.get("userInfo"));
      // 转换null为""
      for (let attr in v) {
        if (v[attr] === null) {
          v[attr] = "";
        }
      }
      let str = JSON.stringify(v);
      let userInfo = JSON.parse(str);
      userInfo.addressArray = [];
      this.userForm = userInfo;
      this.defaultList[0].url = userInfo.avatar;
      if (userInfo.address !== null && userInfo.address !== "") {
        this.userForm.address = userInfo.address;
        this.userForm.addressArray = JSON.parse(userInfo.address);
      }
      if (this.userForm.type === 0) {
        this.userForm.typeTxt = "普通用户";
      } else if (this.userForm.type === 1) {
        this.userForm.typeTxt = "管理员";
      }
    },
    getDictSexData() {
      // 获取性别字典数据
      getDictDataByType("sex").then(res => {
        if (res.success) {
          this.dictSex = res.result;
        }
      });
    },
    handleView(imgUrl) {
      this.imgUrl = imgUrl;
      this.viewImage = true;
    },
    handleRemove(file) {
      const fileList = this.$refs.upload.fileList;
      this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
    },
    handleSuccess(res, file) {
      if (res.success === true) {
        file.url = res.result;
        this.userForm.avatar = res.result;
        this.defaultList[0].url = res.result;
        this.$refs.upload.fileList.splice(0, 1);
      } else {
        this.$Message.error(res.message);
      }
    },
    handleError(error, file, fileList) {
      this.$Message.error(error.toString());
    },
    handleFormatError(file) {
      this.$Notice.warning({
        title: "不支持的文件格式",
        desc:
          "所选文件‘ " +
          file.name +
          " ’格式不正确, 请选择 .jpg .jpeg .png .gif格式文件"
      });
    },
    handleMaxSize(file) {
      this.$Notice.warning({
        title: "文件大小过大",
        desc: "所选文件‘ " + file.name + " ’大小过大, 不得超过 5M."
      });
    },
    handleBeforeUpload() {
      const check = this.uploadList.length < 2;
      if (!check) {
        this.$Notice.warning({
          title: "最多只能上传 1 张图片"
        });
      }
      return check;
    },
    cancelEditUserInfo() {
      this.$store.commit("removeTag", "ownspace_old");
      localStorage.pageOpenedList = JSON.stringify(
        this.$store.state.app.pageOpenedList
      );
      let lastPageName = "";
      let length = this.$store.state.app.pageOpenedList.length;
      if (length > 1) {
        lastPageName = this.$store.state.app.pageOpenedList[length - 1].name;
      } else {
        lastPageName = this.$store.state.app.pageOpenedList[0].name;
      }
      this.$router.push({
        name: lastPageName
      });
    },
    handleSubmit() {
      this.$refs["userForm"].validate(valid => {
        if (valid) {
          this.saveEdit()
        }
      });
    },
    saveEdit() {
      this.saveLoading = true;
      let params = this.userForm;
      delete params.nickName;
      delete params.description;
      userInfoEdit(params).then(res => {
        this.saveLoading = false;
        if (res.success === true) {
          this.$Message.success("保存成功");
          // 更新用户信息
          Cookies.set("userInfo", this.userForm);
          // 更新头像
          this.$store.commit("setAvatarPath", this.userForm.avatar);
        }
      });
    },
    changeAddress() {
      this.userForm.address = JSON.stringify(this.userForm.addressArray);
    },
    hasChangePhone() {
      if (this.mobileEditForm.mobile === this.initPhone) {
        this.canGetIdentifyCode = true;
      } else {
        this.$refs["mobileEditForm"].validate(valid => {
          if (valid) {
            this.canGetIdentifyCode = false;
          } else {
            this.canGetIdentifyCode = true;
          }
        });
      }
    },
    hasChangeEmail() {
      if (this.emailEditForm.email === this.initEmail) {
        this.canSendEditEmail = true;
      } else {
        this.canSendEditEmail = false;
      }
    }
  },
  mounted() {
    this.uploadList = this.$refs.upload.fileList;
    this.init();
  }
};
</script>
