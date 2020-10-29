<template>
  <div>
    <Input v-model="keyWord" placeholder="输入关键字搜索" v-if="showSearch" clearable></Input>
    <Tree
      ref="tree"
      :data="treeData"
      :multiple="multiple"
      :show-checkbox="showCheckbox"
      :empty-text="emptyText"
      :load-data="loadData"
      :render="render"
      :check-strictly="checkStrictly"
      :check-directly="checkDirectly"
      @on-select-change="handleSelectChange"
      @on-check-change="handleCheckChange"
      @on-toggle-expand="handleToggleExpand"
    ></Tree>
  </div>
</template>

<script>
export default {
  props: [
    "data",
    "multiple",
    "showCheckbox",
    "emptyText",
    "loadData",
    "render",
    "checkStrictly",
    "checkDirectly",
    "showSearch"
  ],
  name: "tree-search",
  data() {
    return {
      treeData: [],
      keyWord: ""
    };
  },
  watch: {
    data: {
      handler(val) {
        this.keyWord = "";
        this.treeData = val;
      },
      deep: true
    },
    keyWord(val) {
      if (val) {
        this.search(val);
      } else {
        this.treeData = this.data;
      }
    }
  },
  methods: {
    search(keyWord) {
      let filterData = [];
      const treeRecursive = tree => {
        tree.forEach(data => {
          if (data.title && data.title.includes(keyWord)) {
            filterData.push(data);
          }
          if (data.children && data.children.length) {
            return treeRecursive(data.children);
          } else {
            return;
          }
        });
      };
      treeRecursive(this.data);
      this.treeData = filterData.map(data => {
        let newData = Object.assign({}, data);
        this.$delete(newData, "children");
        return newData;
      });
    },
    handleSelectChange(nodes, node) {
      this.$emit("on-select-change", nodes, node);
    },
    handleCheckChange(nodes, node) {
      this.$emit("on-check-change", nodes, node);
    },
    handleToggleExpand(node) {
      this.$emit("on-toggle-change", node);
    },
    getCheckedNodes() {
      return this.refs.tree.getCheckedNodes();
    },
    getSelectedNodes() {
      return this.refs.tree.getSelectedNodes();
    },
    getCheckedAndIndeterminateNodes() {
      return this.refs.tree.getCheckedAndIndeterminateNodes();
    }
  }
};
</script>

<style lang="" scoped>
</style>