<template>
  <Row
    type="flex"
    justify="center"
    align="middle"
    class="login"
    @keydown.enter.native="submitLogin"
  >
    <Col :xs="{span:22}" style="width: 368px;">
      <Row class="header">
        <!-- <img src="../assets/xboot.png" width="220px" /> -->
        <h1>YUSUI</h1>
        <div class="description">用户登录</div>
      </Row>

      <Alert type="error" show-icon v-if="error">{{errorMsg}}</Alert>

      <Row class="login-form">
        <Form ref="usernameLoginForm" :model="form" :rules="rules" class="form">
          <FormItem prop="username">
            <Input
              v-model="form.username"
              prefix="ios-contact"
              size="large"
              clearable
              placeholder="请输入用户名"
              autocomplete="off"
            />
          </FormItem>
          <FormItem prop="password">
            <Input
              type="password"
              v-model="form.password"
              prefix="ios-lock"
              size="large"
              clearable
              placeholder="请输入密码"
              autocomplete="off"
            />
          </FormItem>
        </Form>

        <Row type="flex" justify="space-between" class="code-row-bg">
          <Checkbox v-model="saveLogin" size="large">自动登录</Checkbox>
        </Row>

        <Row>
          <Button
            class="login-btn"
            type="primary"
            size="large"
            :loading="loading"
            @click="submitLogin"
            long
          >
            <span v-if="!loading">登录</span>
            <span v-else>登录中...</span>
          </Button>
        </Row>
      </Row>

      <Row class="foot">
        <Row type="flex" justify="space-around" class="code-row-bg help">
          <a class="item" :href="yusuisoft" target="_blank">帮助</a>
          <a class="item" :href="yusuisoft" target="_blank">隐私</a>
          <a class="item" :href="yusuisoft" target="_blank">条款</a>
        </Row>
        <Row type="flex" justify="center" class="code-row-bg copyright">
          Copyright © 2019 - Present
          <a :href="yusuisoft" target="_blank" style="margin:0 5px;">YUSUI</a> 版权所有
        </Row>
      </Row>
    </Col>
  </Row>
</template>

<script>
import Cookies from "js-cookie";
import { login, userInfo, getJWT } from "@/api/index";
import util from "@/libs/util.js";
export default {
  data() {
    return {
      error: false,
      errorMsg: "",
      saveLogin: true,
      loading: false,
      errorCode: "",
      form: {
        username: "admin",
        password: "123456",
        code: ""
      },
      rules: {
        username: [
          {
            required: true,
            message: "账号不能为空",
            trigger: "blur"
          }
        ],
        password: [
          {
            required: true,
            message: "密码不能为空",
            trigger: "blur"
          }
        ]
      },
      yusuisoft: "http://www.yusuisoft.com"
    };
  },
  methods: {
    showErrorMsg(msg) {
      this.error = true;
      this.errorMsg = msg;
    },
    submitLogin() {
      this.$refs.usernameLoginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          login({
            username: this.form.username,
            password: this.form.password,
            saveLogin: this.saveLogin
          }).then(res => {
            if (res.success === true) {
              this.setStore("accessToken", res.result);
              // 获取用户信息
              userInfo().then(res => {
                if (res.success === true) {
                  // 避免超过大小限制
                  delete res.result.permissions;
                  if (this.saveLogin) {
                    // 保存7天
                    Cookies.set("userInfo", JSON.stringify(res.result), {
                      expires: 7
                    });
                  } else {
                    Cookies.set("userInfo", JSON.stringify(res.result));
                  }
                  let userInfo = res.result;
                  let roles = [];
                  userInfo.roles.forEach(item => {
                      roles.push(item.name);
                  });
                  this.setStore("userInfo", userInfo);
                  this.setStore("roles",roles)
                  this.$store.commit("setAvatarPath", res.result.avatar);
                  // 加载菜单
                  util.initRouter(this);
                  this.$router.push({
                    name: "home_index"
                  });
                } else {
                  this.loading = false;
                }
              });
            } else {
              this.loading = false;
            }
          });
        }
      });
    },
    relatedLogin() {}
  },
  mounted() {
    this.relatedLogin();
  }
};
</script>

<style lang="less">
@import "./login.less";
</style>
