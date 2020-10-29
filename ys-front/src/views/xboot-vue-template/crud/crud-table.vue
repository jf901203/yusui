<template>
  <Card>
    <Form ref="searchForm" :model="searchForm" :label-width="100" inline>
      <FormItem label="名称" prop="name">
        <Input v-model="searchForm.name" placeholder="请输入名称"></Input>
      </FormItem>
      <FormItem label="内容" prop="content">
        <Input v-model="searchForm.content" placeholder="请输入内容"></Input>
      </FormItem>
      <FormItem>
        <Button type="primary" icon="ios-search" @click="handleSearch">搜索</Button>&nbsp;
        <Button icon="md-refresh" @click="handleReset">重置</Button>
      </FormItem>
    </Form>
    <Button type="primary" icon="md-add" @click="add">新增</Button>&nbsp;
    <Button icon="md-trash" @click="batchDel">批量删除</Button>&nbsp;
    <Alert show-icon style="margin-top:10px;">
      已选择
      <span class="select-count">{{selections.length}}</span> 项
      <a class="select-clear" @click="clearSelection">清空</a>
    </Alert>
    <Table
      ref="table"
      :columns="columns"
      :data="tableData"
      :loading="tableLoading"
      sortable="custom"
      border
      @on-sort-change="sortChange"
      @on-selection-change="selectionChange"
    >
      <template slot-scope="{row}" slot="action">
        <Button type="primary" size="small" icon="ios-create-outline" @click="edit(row)">编辑</Button>&nbsp;
        <Button type="error" size="small" icon="md-trash" @click="rowDel(row)">删除</Button>
      </template>
    </Table>
    <Page
      :current="page.pageNumber"
      :total="page.total"
      :page-size="page.pageSize"
      @on-change="pageNumberChange"
      @on-page-size-change="pageSizeChange"
      :page-size-opts="[10,20,50]"
      size="small"
      show-total
      show-elevator
      show-sizer
      style="margin-top:10px;"
    ></Page>
    <crudForm ref="formModal" @submit="getDataList"></crudForm>
  </Card>
</template>

<script>
import crudMixin from "@/mixins/crud-table";
import crudForm from "./crud-form";
import { getTestData, deleteTest } from "@/api/test";

export default {
  name: "crud-table",
  mixins: [crudMixin],
  components: { crudForm },
  data() {
    return {
      crudOption: {
        getList: getTestData,
        delete: deleteTest
      },
      columns: [
        {
          type: "selection",
          width: 50,
          align: "center"
        },
        {
          title: "名称",
          key: "name",
          sortable: true
        },
        {
          title: "内容",
          key: "content",
          sortable: true
        },
        {
          title: "操作",
          slot: "action"
        }
      ],
      searchForm: {
        name: "",
        content: ""
      }
    };
  }
};
</script>

<style lang="" scoped>
</style>