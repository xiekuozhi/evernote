<template>
  <div class="detail" id="notebook-list">
    <header>
      <a href="#" class="btn" @click="onCreate"
        ><i class="iconfont icon-plus"></i>创建笔记本</a
      >
    </header>
    <main>
      <div class="layout">
        <h3>笔记本列表({{ notebooks.length }})</h3>
        <div class="book-list">
          <router-link
            v-for="(notebook, id) in notebooks"
            :key="id"
            to="/notebooks"
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
              <span class="date">{{notebook.friendlyCreateAt}}</span>
            </div>
          </router-link>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import Auth from "@/apis/auth";
import Notebook from "@/apis/notebooks";
export default {
  data() {
    return {
      notebooks: []
    };
  },

  created() {
    
    Auth.getInfo().then(res => {
      if (!res.isLogin) {
        this.$router.push({ path: "/login" });
      }
    }),

      Notebook.getAll().then(res => (this.notebooks = res.data));
      
  },
  methods: {
    onCreate() {
      const title = window.prompt("请输入标签名");
      if (title.trim() === "") {
        alert("笔记本名称不能为空");
        return;
      } else {
        Notebook.addNotebook({ title }).then(res => {
          console.log(res.data);
          alert(res.msg);
          this.notebooks.unshift(res.data);
        });
      }
    },
    onEdit(notebook) {
      const title = window.prompt("编辑标签", notebook.title);
      Notebook.updateNotebook(notebook.id, { title }).then(res => {
        alert(res.msg);
        notebook.title = title;
      });
    },
    onDelete(notebook) {
     let isConfirm = window.confirm("确定删除么");
      if (isConfirm) {
        Notebook.deleteNotebook(notebook.id)
        .then(res => {
          console.log(res); 
          this.notebooks.splice(this.notebooks.indexOf(notebook), 1);
            alert(res.msg);
        });
      }
    }
  }
};
</script>

<style lang="less" scoped>
@import url(../assets/notebook-list.less);
</style>
