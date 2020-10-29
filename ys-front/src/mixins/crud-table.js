export default {
  data() {
    /* eslint-disable */
    return {
      // 设置属性
      crudOption: {
        idKey: "id", //删除使用的key(id/demoId/uuid/...)
        created: true, //此页面是否在激活（进入）时，查询数据列表?
        getList: null, //获取数据列表方法
        delete: null //删除数据方法
      },
      // 默认属性
      page: {
        total: 0, // 总条数
        pageNumber: 1, // 当前页数
        pageSize: 20, // 页面大小
        sort: "createTime", // 默认排序字段
        order: "desc" // 默认排序方式降序
      },
      searchForm: {}, // 查询条件
      tableData: [], // 数据列表
      tableLoading: false, // 数据列表，loading状态
      selections: [] // 数据列表，多选项
    };
    /* eslint-enable */
  },
  created() {
    if (this.crudOption.created) {
      this.getDataList();
    }
  },
  methods: {
    // 获取数据列表
    getDataList() {
      this.tableLoading = true;
      this.crudOption
        .getList({
          pageNumber: this.page.pageNumber,
          pageSize: this.page.pageSize,
          sort: this.page.sort,
          order: this.page.order,
          ...this.searchForm
        })
        .then(res => {
          this.tableData = res.success ? res.result.records : [];
          this.page.total = res.success ? res.result.total : 0;
        })
        .catch(e => {
          console.error(e);
          this.tableData = [];
          this.page.total = 0;
        })
        .finally(() => {
          this.clearSelection();
          this.tableLoading = false;
        });
    },
    /**
     * @title 删除行
     * @param {Object} row 行数据
     */
    rowDel(row) {
      this.$Modal.confirm({
        title: "提示",
        content: "确认进行删除操作？",
        onOk: () => {
          this.crudOption.delete(row[this.crudOption.idKey]).then(res => {
            if (res.success) {
              this.$Message.success("删除成功");
              this.getDataList();
            }
          });
        }
      });
    },
    /**
     * @title 搜索
     */
    handleSearch() {
      this.getDataList();
    },
    /**
     * @title 搜索重置
     */
    handleReset() {
      this.$refs.searchForm && this.$refs.searchForm.resetFields();
      this.page = {
        total: 0, // 总条数
        pageNumber: 1, // 当前页数
        pageSize: 20, // 页面大小
        sort: "createTime", // 默认排序字段
        order: "desc" // 默认排序方式
      };
      this.getDataList();
    },
    /**
     * @title 多选
     * @param {Array} rows 选中行数据
     */
    selectionChange(rows) {
      this.selections = rows;
    },
    clearSelection() {
      this.$refs.table && this.$refs.table.selectAll(false);
    },
    /**
     * @title 批量删除
     */
    batchDel() {
      const length = this.selections.length;
      if (length === 0) {
        return this.$Message.warning("请选择删除项");
      }
      this.$Modal.confirm({
        title: "提示",
        content: `确认删除所选的${length}条数据？`,
        onOk: () => {
          let ids = this.selections.map(item => item[this.crudOption.idKey]);
          //根据后端接口传数组或者逗号拼接的字符串
          ids = String(ids);
          this.crudOption.delete(ids).then(res => {
            if (res.success) {
              this.$Message.success("删除成功");
              this.getDataList();
            }
          });
        }
      });
    },
    /**
     * @title 分页, 每页条数
     * @param {integer} size 每页条数
     */
    pageSizeChange(size) {
      this.page.pageSize = size;
      this.getDataList();
    },
    /**
     * @title 分页, 当前页
     * @param {integer} number 当前页
     */
    pageNumberChange(number) {
      this.page.pageNumber = number;
      this.getDataList();
    },
    /**
     *
     * @param {*} column 当前列数据
     * @param {*} key 排序依据的指标
     * @param {*} order 排序的顺序，值为 asc 或 desc
     */
    sortChange({ column, key, order }) {
      this.page.sort = key;
      this.page.order = order;
      this.getDataList();
    },
    add() {
      this.$refs.formModal.add();
    },
    edit(row) {
      this.$refs.formModal.edit(row);
    }
  }
};
