<template>
  <Modal v-model="modalVisible" :title="modalTitle">
    <Form ref="form" :model="form" :label-width="100">
      <FormItem label="名称" prop="name">
        <Input v-model="form.name" placeholder="请输入名称"></Input>
      </FormItem>
      <FormItem label="内容" prop="content">
        <Input v-model="form.content" placeholder="请输入内容"></Input>
      </FormItem>
    </Form>

    <div slot="footer">
      <Button type="text" @click="modalVisible=false">取消</Button>
      <Button type="primary" :loading="submitLoading" @click="handleSubmit">保存</Button>
    </div>
  </Modal>
</template>

<script>
import crudMixin from "@/mixins/crud-form";
import { saveTest, updateTest } from "@/api/test";

export default {
  name: "crud-form",
  mixins: [crudMixin],
  data() {
    return {
      crudOption: {
        save: saveTest,
        update: updateTest
      },
      form: {
        name: "",
        content: ""
      }
    };
  }
};
</script>

<style lang="" scoped>
</style>