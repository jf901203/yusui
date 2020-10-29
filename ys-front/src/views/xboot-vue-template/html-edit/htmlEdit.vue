<template>
  <div>
    <editor ref="editor" :value="content" @on-change="handleChange"/>
    <Button @click="changeContent">修改编辑器内容</Button>
  </div>
</template>

<script>
import Editor from '@/components/editor'
export default {
  name: 'html-edit',
  components: {
    Editor
  },
  data () {
    return {
      content: '123123123'
    }
  },
  methods: {
    handleChange (html, text) {
      console.log(html, text)
    },
    changeContent () {
      this.$refs.editor.setHtml('<p>编辑器内容已修改</p>')
    }
  }
}
</script>

<style>

</style>
