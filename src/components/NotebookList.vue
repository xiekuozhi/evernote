<template>
  <div class="detail" id="notebook-list">
    <header>
      <a href="#" class="btn" @click.stop.prevent="onCreate">
        <i class="iconfont icon-plus"></i>创建笔记本</a
      >
    </header>
    <main>
      <div class="layout">
        <h3>笔记本列表({{ notebooks.length }})</h3>
        <div class="book-list">
          <router-link
            v-for="(notebook, id) in notebooks"
            :key="id"
            :to="`/note?notebookId=${notebook.id}`"
            class="notebook"
          >
            <div>
              <span class="iconfont icon-notebook"></span>
              {{ notebook.title }}
              <span class="action" @click.stop.prevent="onEdit(notebook)"
                >编辑</span
              >
              <span class="action" @click.stop.prevent="onDelete(notebook)"
                >删除</span
              >
              <span class="date">{{ notebook.createdAtFriendly }}</span>
            </div>
          </router-link>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import { mapActions,mapGetters} from 'vuex'
export default {
  data() {
    return {};
  },
  created() {
    this.checkLogin({path: "/login"})
  this.getNotebooks()

  },
  computed:{
    ...mapGetters(['notebooks'])
  },
  methods: {
    ...mapActions([
      'getNotebooks',
      'addNotebook',
      'updateNotebook',
      'deleteNotebook',
      'checkLogin'
    ]),
    onCreate() {
      this.$prompt("输入新笔记本标题", "创建笔记本", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        inputPattern: /^.{1,30}$/,
        inputErrorMessage: "标题不能为空且不超过30字符"
      })
        .then(({ value }) => {
          this.addNotebook({title:value})
        })
    },
    onEdit(notebook) {
      const title = "";
      this.$prompt("输入新笔记本标题", "修改笔记本", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        inputPattern: /^.{1,30}$/,
        inputValue:notebook.title,
        inputErrorMessage: "标题不能为空且不超过30字符"
      })
        .then(({ value }) => {
          this.updateNotebook({notebookId:notebook.id,title:value });
        })
    },
    onDelete(notebook) {
      this.$confirm("确认要删除笔记本么?", "删除笔记本", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.deleteNotebook({notebookId:notebook.id});
        })
    }
  }
};
</script>

<style lang="less" scoped>
@import url(../assets/notebook-list.less);
</style>
