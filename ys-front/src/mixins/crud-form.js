export default {
  data() {
    /* eslint-disable */
    return {
      // 设置属性
      crudOption: {
        idKey: "id", //删除使用的key(id/demoId/uuid/...)
        save: null, //添加数据方法
        update: null //编辑数据方法
      },
      modalVisible: false,
      form: {},
      submitLoading: false
    };
    /* eslint-enable */
  },
  computed: {
    modalTitle() {
      return this.form[this.crudOption.idKey] ? "编辑" : "新增";
    }
  },
  methods: {
    add() {
      this.modalVisible = true;
      this.$nextTick(() => {
        this.$refs.form.resetFields();
        delete this.form[this.crudOption.idKey];
      });
    },
    edit(row) {
      this.modalVisible = true;
      this.$nextTick(() => {
        this.$refs.form.resetFields();
        this.form = this.convertObj(row);
      });
    },
    /**
     * 数据提交
     */
    handleSubmit() {
      this.$refs.form.validate(valid => {
        if (!valid) return;
        this.submitLoading = true;
        const submitMethod = this.form[this.crudOption.idKey] ? this.crudOption.update : this.crudOption.save;
        submitMethod(this.convertObj(this.form))
          .then(res => {
            if (res.success) {
              this.$Message.success("保存成功");
              this.$emit("submit");
              this.modalVisible = false;
            }
          })
          .finally(() => {
            this.submitLoading = false;
          });
      });
    },
    /**
     * @title 转换对象的空值为""
     * @param {Object} obj 被转换对象
     */
    convertObj(obj) {
      let temp = {};
      for (const key in obj) {
        if (obj[key] === undefined || obj[key] === null) {
          temp[key] = "";
        } else {
          temp[key] = obj[key];
        }
      }
      return temp;
    }
  }
};
