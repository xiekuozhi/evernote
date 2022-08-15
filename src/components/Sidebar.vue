<template>
    <div id="sidebar">
        <avatar></avatar>
        <div class="icons">
            <router-link to="/note" title="笔记"><i class="iconfont icon-note"></i></router-link>
            <router-link to="/notebooks" title="笔记本"><i class="iconfont icon-notebook"></i></router-link>
            <router-link to="/trash" title="回收站"><i class="iconfont icon-trash"></i></router-link>
        </div>
        <div class="logout">
            <i class="iconfont icon-logout" @click="onLogout"></i>
        </div>
    </div>
</template>
<script>
import avatar from '@/components/Avatar'
import {mapActions} from 'vuex';
export default {
    components: {avatar},
    methods: {
        ...mapActions(['logout']),
     onLogout(){
        this.logout()
     }   
    }
}  
</script>

<style scoped lang="less">
#sidebar {
    position: relative;
    width: 56px;
    text-align: center;
    background-color: #2c333c;
   
    .icons {
        margin-top: 15px;

        a {
            padding: 6px 0;
            display: block;
        }

        .router-link-active {
            background-color: #5e6266;
        }
    }

    .logout {
        position: absolute;
        width: 100%;
        bottom: 20px;
        cursor: pointer;
        text-align: center;
    }

    .iconfont {
        color: #fff;
    }
}
</style>




    