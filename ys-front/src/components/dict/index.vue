<template>
  <span>
    <Select
      :value="value"
      :multiple="multiple"
      :placeholder="placeholder"
      :disabled="disabled"
      :clearable="clearable"
      :transfer="true"
      @on-change="handleChange"
      @on-clear="handleClear"
      v-if="type === 'select'"
    >
      <Option :label="item.label" :value="item.value" v-for="item in options" :key="item.value"></Option>
    </Select>
    <RadioGroup :value="value" @on-change="handleChange" v-if="type==='radio'">
      <Radio
        :label="item.value"
        :disabled="disabled"
        v-for="item in options"
        :key="item.value"
      >{{item.label}}</Radio>
    </RadioGroup>
    <CheckboxGroup :value="value" @on-change="handleChange" v-if="type==='checkbox'">
      <Checkbox
        :label="item.value"
        :disabled="disabled"
        v-for="item in options"
        :key="item.value"
      >{{item.label}}</Checkbox>
    </CheckboxGroup>
    <span v-if="type==='text'">{{ selectedLabel }}</span>
    <slot :options="options" :value="value"></slot>
  </span>
</template>

<script>
//使用方法：先在字典表中添加字典和数据,该组件已在main.js中注册为全局组件,无需重复引用
//eg:<Dict v-model="form.orderType" code="order_type"></Dict>
export default {
  name: "dict",
  props: {
    code: { type: String }, //请求字典接口的字典名称
    value: { type: String | Array }, //双向绑定的值
    type: { type: String, default: "select" }, //select下拉选择,radio单选框,checkbox多选框,text文字
    disabled: { type: Boolean, default: false }, //是否禁用
    //type为select时生效
    multiple: { type: Boolean, default: false }, //多选
    placeholder: { type: String, default: "请选择" },
    clearable: { type: Boolean, default: false }, //是否显示清空按钮
    //type为text时生效
    join: { type: String, default: "," }
  },
  data() {
    return {
      options: []
    };
  },
  computed: {
    selectedLabel() {
      if (this.value instanceof Array && this.join) {
        let data = this.options
          .filter(item => this.value.some(val => val === item.value))
          .map(item => item.label);
        let labels = data.join(this.join);
        return labels || "";
      } else {
        const data =
          this.options.filter(item => item.value === this.value)[0] || {};
        return data.label || "";
      }
    }
  },
  watch: {
    code: {
      handler(val) {
        if (!val) return;
        this.getDict();
      },
      immediate: true
    }
  },
  methods: {
    handleChange(value) {
      this.$emit("input", value);
      this.$emit("change", value);
    },
    handleClear() {
      this.$emit("input", "");
    },
    getDict() {
      if (window.dictRequesting) {
        setTimeout(this.getDict);
      } else {
        let dict = window.dict;
        if (dict && dict[this.code]) {
          this.options = dict[this.code];
        } else {
          this.requestDict();
        }
      }
    },
    //请求字典并存在window中
    requestDict() {
      window.dictRequesting = true;
      this.getRequest(`/dictData/getByType/${this.code}`)
        .then(res => {
          if (!res.success) return;
          this.options = [
            ...res.result.map(item => {
              return {
                label: item.title,
                value: item.value
              };
            })
          ];
          let dict = window.dict || {};
          window.dict = {
            ...dict,
            [this.code]: [...this.options]
          };
        })
        .catch(err => {
          console.error(err);
        })
        .finally(() => {
          window.dictRequesting = false;
        });
    }
  }
};
</script>

<style lang="" scoped></style>
